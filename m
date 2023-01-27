Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F5D8C54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 17:21:01 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.108125.1674840054385397598
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jan 2023 09:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oKYx2oSH;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EBA5C100004;
	Fri, 27 Jan 2023 17:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674840052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xx+aSfvtZwCCCPe8OKNXSfbb3cvVhIWumI0B77zzUlo=;
	b=oKYx2oSHNLNUWbFMOD3B6fxit8ySCAuk4fMKuStJwxgVp9TnDrYQdQH5Kcl0BE1pYBSgrq
	Oos1h1/q9B9OaZrhwSNBucsrX3J0wRLePEy1pJitaFW9jKxzmcDaHolzGpV3b0ZAV78t/x
	AB45kPNyFibmKLz3Uot0ZvaU4n6h29yJkQ2l3YRwVhl9tww/QndFJBCZ6d8E/uTIRU0yZ9
	6De/uM+2mT4FIEdEuAg7lOI4M14ESSSzUcztFZSJEx6AAFYT973t4bRCfu6+BFinihdsPj
	xgpL21gusMAq+ZePP6wek/duRGc2xkhOJU+3yoxUiCBE1/1q5ndkx9lKQ5FlyA==
Date: Fri, 27 Jan 2023 18:20:51 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Subject: Re: [OE-core] [PATCH] oeqa/utils/httpserver: connect up the request
 logging
Message-ID: <Y9QH85/hCBXAVrMt@mail.local>
References: <20230126173048.1534444-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126173048.1534444-1-ross.burton@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 17:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176453

Hello,

I believe this is the cause of:

https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/6578/steps/16/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/6555/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/6539/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/6529/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/6520/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/6516/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/6522/steps/15/logs/stdio



On 26/01/2023 17:30:48+0000, Ross Burton wrote:
> Call logger.info() in the log_message handler so that we get request
> logging, and hopefully even error messages.
> 
> Create a child logger to be neat and compartmentalise the logging.
> 
> Add a __main__ entrypoint so this class can be exercised outside of oeqa.
> 
> Remove unused traceback import.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/lib/oeqa/utils/httpserver.py | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/lib/oeqa/utils/httpserver.py b/meta/lib/oeqa/utils/httpserver.py
> index 8ce1dd42f49..b478172ed76 100644
> --- a/meta/lib/oeqa/utils/httpserver.py
> +++ b/meta/lib/oeqa/utils/httpserver.py
> @@ -7,7 +7,6 @@
>  import http.server
>  import multiprocessing
>  import os
> -import traceback
>  import signal
>  from socketserver import ThreadingMixIn
>  
> @@ -15,20 +14,21 @@ class HTTPServer(ThreadingMixIn, http.server.HTTPServer):
>  
>      def server_start(self, root_dir, logger):
>          os.chdir(root_dir)
> +        self.logger = logger
>          self.serve_forever()
>  
>  class HTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
>  
>      def log_message(self, format_str, *args):
> -        pass
> +        self.server.logger.info(format_str, *args)
>  
> -class HTTPService(object):
> +class HTTPService:
>  
>      def __init__(self, root_dir, host='', port=0, logger=None):
>          self.root_dir = root_dir
>          self.host = host
>          self.port = port
> -        self.logger = logger
> +        self.logger = logger.getChild("HTTPService")
>  
>      def start(self):
>          if not os.path.exists(self.root_dir):
> @@ -49,7 +49,7 @@ class HTTPService(object):
>          signal.signal(signal.SIGTERM, orig)
>  
>          if self.logger:
> -            self.logger.info("Started HTTPService on %s:%s" % (self.host, self.port))
> +            self.logger.info("Started HTTPService for %s on %s:%s" % (self.root_dir, self.host, self.port))
>  
>  
>      def stop(self):
> @@ -61,3 +61,10 @@ class HTTPService(object):
>          if self.logger:
>              self.logger.info("Stopped HTTPService on %s:%s" % (self.host, self.port))
>  
> +if __name__ == "__main__":
> +    import sys, logging
> +
> +    logger = logging.getLogger(__name__)
> +    logging.basicConfig(level=logging.DEBUG)
> +    httpd = HTTPService(sys.argv[1], port=8888, logger=logger)
> +    httpd.start()
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176413): https://lists.openembedded.org/g/openembedded-core/message/176413
> Mute This Topic: https://lists.openembedded.org/mt/96548159/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

