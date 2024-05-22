Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ABD0C25B77
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:06:29 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.5515.1716368785690198699
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hV6w8lM6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 01905C0013;
	Wed, 22 May 2024 09:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716368783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DIDmPi8P/LBxsBa12EBakTb2kbqWPrKzLtm0NmQtBek=;
	b=hV6w8lM6GNTcQYAhdKNpXiV86xQRLl2b4s2h2UH7c6mq8NTbrOQwp1XyttJuNE3/eGNAUf
	eGBmApTQbX418sqP3RFGw2nub9PoeKpUnBEHC64e7bLQNdQZuul05UP2pYsEDeQzdYmv+J
	OQXDXbewEUWBaTa7FPe8qcKvJGzZNreYFyxfAwcJjsaq2nMiNa11XxYSJ4TCRsmUXo+74n
	Kb4+u7AmRalyCO1d5zo9PIYeZ2K7PU47vXHaH4SxhI39lLgL26SzCdA23XpC1Tpi66acV/
	w2h7ObwEaYmyUh0sVk/tlJIhmz2il6P4g1DJoMZN+xGqBRyGTRdw5ZX4mrAsBw==
Date: Wed, 22 May 2024 11:06:22 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH] gcc-runtime.inc: additionally remove
 libgomp.info-1 and libgomp.info-2
Message-ID: <20240522090622114b300c@mail.local>
References: <20240520175706.1840576-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520175706.1840576-1-f_l_k@t-online.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:06:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199694

Hello Markus,

this doesn't apply on master anymore, can you rebase?

On 20/05/2024 19:57:06+0200, Markus Volk wrote:
> This avoids:
> ERROR: gcc-runtime-14.1.0-r0 do_package: QA Issue: gcc-runtime: Files/directories were installed but not shipped in any package:
>   /usr/share/info
>   /usr/share/info/libgomp.info-1
>   /usr/share/info/libgomp.info-2
> Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> gcc-runtime: 3 installed and not shipped files. [installed-vs-shipped]
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index dbc9141000..d1c47c5d5c 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -92,7 +92,7 @@ do_install () {
>  		mv ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/* ${D}${libdir}/${TARGET_SYS}/${BINV}/include
>  		rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include
>  	fi
> -	rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/dir
> +	rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/libgomp.info-1 ${D}${infodir}/libgomp.info-2 ${D}${infodir}/dir
>  	rm -rf ${D}${infodir}/libitm.info ${D}${infodir}/dir
>  	rm -rf ${D}${infodir}/libquadmath.info ${D}${infodir}/dir
>  	if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude ]; then
> -- 
> 2.44.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199600): https://lists.openembedded.org/g/openembedded-core/message/199600
> Mute This Topic: https://lists.openembedded.org/mt/106208568/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

