Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CCCC433F5
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 20:44:17 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.180.1664570653511474078
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 13:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cEedIcLv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EDBC540002;
	Fri, 30 Sep 2022 20:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664570651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qukWSDsMIdbqT4u4grY+wanKYUisb7qot2xT9QePp44=;
	b=cEedIcLv2piuPErRAmLQhAri6vgtyUnBDV90A/HB9NCCYNW7iwV4/TydkWERjMqoyPHruz
	DWUwUkfIZZQtd42lUWtnvYrzWLXONcAHllwsYaxDMJPy1wV+ciYk33ArE+94YCTzmJgyqs
	0Fe7+Ru2CMg6C79WWK5PlhnEM5IiT51SJvVEcidkdp8g5HpdpqGNryIbExld/mKaqqrBdq
	hmG6VHmunayT97yIgOmfKyy5iyo72PPIvoCfAaCzkoVHuUL+g9EvuLb8P9lC00TE4Jr3ui
	eKDl/B45s5Mlmfv+MlP+F03T8Qw1riwWx7UTnd6wLOqHlIhoMmOHg8FLt+oThw==
Date: Fri, 30 Sep 2022 22:44:10 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] openssl: Add missing perl module runtime
 dependencies for ptests
Message-ID: <YzdVGmP2GoownRfx@mail.local>
References: <20220930041614.2704304-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930041614.2704304-1-raj.khem@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 20:44:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171244

Hello,

This caused many issues on the autobuilders, similar to those:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5982/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/3796/steps/11/logs/stdio

On 29/09/2022 21:16:14-0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_3.0.5.bb | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.5.bb b/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
> index 04aff04fab..119e58ed24 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
> @@ -243,7 +243,16 @@ CONFFILES:openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
>  
>  RRECOMMENDS:libcrypto += "openssl-conf ${PN}-ossl-module-legacy"
>  RDEPENDS:${PN}-misc = "perl"
> -RDEPENDS:${PN}-ptest += "openssl-bin perl perl-modules bash sed"
> +RDEPENDS:${PN}-ptest += "bash sed openssl-bin \
> +                         perl perl-modules \
> +                         perl-module-file-spec-functions \
> +                         perl-module-findbin perl-module-harness perl-module-tap-base \
> +                         perl-module-tap-object perl-module-tap-parser-sourcehandler-executable \
> +                         perl-module-tap-formatter-file perl-module-tap-formatter-session \
> +                         perl-module-tap-formatter-base perl-module-tap-parser \
> +                         perl-module-tap-parser-scheduler perl-module-test-more \
> +                         perl-module-pod-text perl-module-encode-encoding \
> +                         "
>  
>  RDEPENDS:${PN}-bin += "openssl-conf"
>  
> -- 
> 2.37.3
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171204): https://lists.openembedded.org/g/openembedded-core/message/171204
> Mute This Topic: https://lists.openembedded.org/mt/94010252/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

