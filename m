Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE264C77B7A
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 09:03:55 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.8822.1686647028776456251
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 02:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lseqGnGq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686647026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aTq0Dyr8+3Gvye8sqPJ4vPE3TiZQFE7UfXLK+C8bJIE=;
	b=lseqGnGqO7H7bfKN8cWKexzTWI14+RUn1uXOTtsqwDqJq2gzvNfEmYdkFEA4wssRUSfH9V
	zSmV3O8FM40laMdA2qsz6so5ustE1iLzqvA6wmmaxi29J6Y0lXCFNZ3mJFEYjGPwn0+qGu
	77VhRXH5OfK8BNB+m28kjM0lVyxEIWO8RAL/uEWsp2/TVVRnA4VL5WCKLOm9TJ79TdaOGG
	tKoWnyNCcIQk3LZchVQ/zl8cKlkBfV48H/IyIit3v16ZV8+yQ2zrFs56Q/wKNW5+3YLaaw
	KbAIjZnKJxrYmNe0BVz+P9c6r+naMkdB+zxm7k0KygxoKvCMyzm3GVUBX/5TLA==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52BE0E0010;
	Tue, 13 Jun 2023 09:03:46 +0000 (UTC)
Date: Tue, 13 Jun 2023 11:03:46 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Subject: Re: [OE-core] [PATCH] dbusmock: only recommend python3-pygobject
Message-ID: <20230613090346357c8261@mail.local>
References: <20230612154404.938246-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612154404.938246-1-ross.burton@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 09:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182700

This caused:

WARNING: lib32-python3-dbusmock-0.29.0-r0 do_package: QA Issue: lib32-python3-dbusmock package lib32-python3-dbusmock - suspicious values 'python3-pygobject' in RRECOMMENDS

https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/4650/steps/12/logs/warnings
https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/7176/steps/11/logs/warnings

On 12/06/2023 16:44:04+0100, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> dbusmock doesn't actually hard-depend on pygobject, some of the templates
> use it but it isn't mandatory.
> 
> Change the RDEPENDS to RRECOMMENDS, and only recommend if g-i is enabled.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/python/python3-dbusmock_0.29.0.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.29.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.29.0.bb
> index 32a43e00b99..0c6db336892 100644
> --- a/meta/recipes-devtools/python/python3-dbusmock_0.29.0.bb
> +++ b/meta/recipes-devtools/python/python3-dbusmock_0.29.0.bb
> @@ -13,9 +13,10 @@ DEPENDS += "python3-setuptools-scm-native"
>  
>  RDEPENDS:${PN} += "\
>      ${PYTHON_PN}-dbus \
> -    ${PYTHON_PN}-pygobject \
>      ${PYTHON_PN}-unittest \
>      ${PYTHON_PN}-xml \
>      "
>  
> +RRECOMMENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection-data', '${PYTHON_PN}-pygobject', '', d)}"
> +
>  BBCLASSEXTEND = "native"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182678): https://lists.openembedded.org/g/openembedded-core/message/182678
> Mute This Topic: https://lists.openembedded.org/mt/99486101/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

