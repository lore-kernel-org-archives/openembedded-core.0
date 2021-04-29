Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.4298.1619737033739240094
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 15:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
	(Authenticated sender: alexandre.belloni@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id AA7BB240004;
	Thu, 29 Apr 2021 22:57:11 +0000 (UTC)
Date: Fri, 30 Apr 2021 00:57:11 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] go: Use dl.google.com for SRC_URI
Message-ID: <YIs5x0X89EfRXduW@piout.net>
References: <20210420182838.958151-1-raj.khem@gmail.com>
 <20210420182838.958151-2-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210420182838.958151-2-raj.khem@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On 20/04/2021 11:28:38-0700, Khem Raj wrote:
> golang.org/dl is resolving to this anyway
> 

Unfortunately, this is still an issue on the autobuilders:

ERROR: go-cross-core2-32-1.16.3-r0 do_fetch: The URL: 'https://dl.google.com/go/go1.16.3.src.tar.gz;name=main' is not trusted and cannot be used
ERROR: go-cross-core2-32-1.16.3-r0 do_fetch: Fetcher failure for URL: 'https://dl.google.com/go/go1.16.3.src.tar.gz;name=main'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/a-quick/build/build-st/tmp/work/x86_64-linux/go-cross-core2-32/1.16.3-r0/temp/log.do_fetch.525
ERROR: go-runtime-1.16.3-r0 do_fetch: The URL: 'https://dl.google.com/go/go1.16.3.src.tar.gz;name=main' is not trusted and cannot be used
ERROR: go-runtime-1.16.3-r0 do_fetch: Fetcher failure for URL: 'https://dl.google.com/go/go1.16.3.src.tar.gz;name=main'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/a-quick/build/build-st/tmp/work/core2-32-poky-linux/go-runtime/1.16.3-r0/temp/log.do_fetch.544

This is fairly reproducible:

https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1404/steps/23/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1403/steps/23/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1402/steps/23/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1401/steps/23/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2076/steps/23/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2074/steps/23/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2070/steps/23/logs/stdio


> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/go/go-common.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
> index 39a681a712..c368b95b69 100644
> --- a/meta/recipes-devtools/go/go-common.inc
> +++ b/meta/recipes-devtools/go/go-common.inc
> @@ -14,7 +14,7 @@ LICENSE = "BSD-3-Clause"
>  
>  inherit goarch
>  
> -SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main"
> +SRC_URI = "https://dl.google.com/go/go${PV}.src.tar.gz;name=main"
>  S = "${WORKDIR}/go"
>  B = "${S}"
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
> -- 
> 2.31.1
> 

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
