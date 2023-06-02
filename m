Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0302AC7EE29
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 19:27:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.4619.1685734046393211370
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 12:27:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9377640CA2;
	Fri,  2 Jun 2023 19:27:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YgjzRisTeNWz; Fri,  2 Jun 2023 19:27:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6958C40C37;
	Fri,  2 Jun 2023 19:27:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E3AAA16394A; Fri,  2 Jun 2023 15:26:36 -0400 (EDT)
Date: Fri, 2 Jun 2023 15:26:36 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] binutils: package static libs from
 gprofng
Message-ID: <20230602192636.GQ9226@denix.org>
References: <20230502144406.2849858-1-raj.khem@gmail.com>
 <20230502144406.2849858-3-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502144406.2849858-3-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 19:27:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182339

On Tue, May 02, 2023 at 07:44:06AM -0700, Khem Raj wrote:
> From: Martin Jansa <martin.jansa@gmail.com>
> 
> * fixes:
>   ERROR: binutils-2.40-r0 do_package: QA Issue: binutils: Files/directories were installed but not shipped in any package:
>     /usr/lib/gprofng/libgp-collectorAPI.a
>   Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
>   binutils: 1 installed and not shipped files. [installed-vs-shipped]
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/binutils/binutils_2.40.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/binutils/binutils_2.40.bb b/meta/recipes-devtools/binutils/binutils_2.40.bb
> index 4ce1b4bec2..9fe4bf5ae3 100644
> --- a/meta/recipes-devtools/binutils/binutils_2.40.bb
> +++ b/meta/recipes-devtools/binutils/binutils_2.40.bb
> @@ -67,6 +67,7 @@ FILES:libbfd = "${libdir}/libbfd-*.so.* ${libdir}/libbfd-*.so"
>  FILES:libopcodes = "${libdir}/libopcodes-*.so.* ${libdir}/libopcodes-*.so"
>  FILES:gprofng = "${sysconfdir}/gprofng.rc ${libdir}/gprofng/libgp-*.so ${libdir}/gprofng/libgprofng.so.* ${bindir}/gp-* ${bindir}/gprofng"

^^^

>  FILES:${PN}-dev += "${libdir}/libgprofng.so ${libdir}/libsframe.so"
> +FILES:${PN}-staticdev += "${libdir}/gprofng/*.a"

1. since there's a separate gprofng package, should this instead be:

FILES:gprofng-staticdev += "${libdir}/gprofng/*.a"


2. it also breaks for binutils-cross-canadian, since this change is not in any 
of the common .inc files


>  SRC_URI:append:class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch "
>  
>  USE_ALTERNATIVES_FOR:class-nativesdk = ""
> -- 
> 2.40.1

