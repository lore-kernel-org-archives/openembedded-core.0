Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.13987.1631302651392285302
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 12:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 48FB860005;
	Fri, 10 Sep 2021 19:37:29 +0000 (UTC)
Date: Fri, 10 Sep 2021 21:37:28 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: tobias.kaufmann@wusto.de
Cc: openembedded-core@lists.openembedded.org,
	Tobias Kaufmann <Tobias.KA.Kaufmann@bmw.de>
Subject: Re: [OE-core] [PATCH] package-manager: escape package names for regexps
Message-ID: <YTuz+F17i6FDyB/n@piout.net>
References: <20210908174641.223936-1-tobias.kaufmann@wusto.de>
MIME-Version: 1.0
In-Reply-To: <20210908174641.223936-1-tobias.kaufmann@wusto.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On 08/09/2021 19:46:41+0200, tobias.kaufmann@wusto.de wrote:
> From: Tobias Kaufmann <Tobias.KA.Kaufmann@bmw.de>
> 
> If a package-name contains characters which are used
> in regular expressions (e.g. libstdc++) this might
> break the regexp compilation.
> 
> To solve this issue the package names are escaped before using
> them in the regular expression
> 

I believe this is the cause of:
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2528/steps/14/logs/stdio
can you check?

> Signed-off-by: Tobias Kaufmann <Tobias.KA.Kaufmann@bmw.de>
> ---
>  meta/lib/oe/package_manager/deb/__init__.py | 5 +++--
>  meta/lib/oe/package_manager/ipk/__init__.py | 5 +++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
> index 9f112ae25b..4d5921044a 100644
> --- a/meta/lib/oe/package_manager/deb/__init__.py
> +++ b/meta/lib/oe/package_manager/deb/__init__.py
> @@ -208,8 +208,9 @@ class DpkgPM(OpkgDpkgPM):
>  
>                      status = sf.read()
>                      for pkg in packages:
> -                        status = re.sub(r"Package: %s\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)" % pkg,
> -                                        r"Package: %s\n\1Status: \2%s" % (pkg, status_tag),
> +                        _pkg = re.escape(pkg)
> +                        status = re.sub(r"Package: %s\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)" % _pkg,
> +                                        r"Package: %s\n\1Status: \2%s" % (_pkg, status_tag),
>                                          status)
>  
>                      tmp_sf.write(status)
> diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
> index 4cd3963111..503a4f5181 100644
> --- a/meta/lib/oe/package_manager/ipk/__init__.py
> +++ b/meta/lib/oe/package_manager/ipk/__init__.py
> @@ -207,8 +207,9 @@ class OpkgPM(OpkgDpkgPM):
>  
>                      status = sf.read()
>                      for pkg in packages:
> -                        status = re.sub(r"Package: %s\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)" % pkg,
> -                                        r"Package: %s\n\1Status: \2%s" % (pkg, status_tag),
> +                        _pkg = re.escape(pkg)
> +                        status = re.sub(r"Package: %s\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)" % _pkg,
> +                                        r"Package: %s\n\1Status: \2%s" % (_pkg, status_tag),
>                                          status)
>  
>                      tmp_sf.write(status)
> -- 
> 2.33.0
> 

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
