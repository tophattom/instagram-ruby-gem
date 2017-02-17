require 'faraday'
require 'hashie'

module FaradayMiddleware
  class SymbolizeResponse < Faraday::Middleware
    def call(env)
      @app.call(env).on_complete do |response|
        response[:body] = Hashie.symbolize_keys response[:body] if response[:body]
      end
    end
  end
end
