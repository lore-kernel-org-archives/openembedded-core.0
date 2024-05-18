Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAFC5C25B74
	for <webhook@archiver.kernel.org>; Sat, 18 May 2024 21:59:33 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.27522.1716069572652862813
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 May 2024 14:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cjxeE74V;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B63620002;
	Sat, 18 May 2024 21:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716069570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NvVnCRnUH3M38AP7M9vuriJjsf2CCGsX1h+VQPnm6ws=;
	b=cjxeE74VKArRmA+uTc3M0kgI4PlYargDXlIM84qr4w5/gBd62HDH/0e2vzrhjKK+Z5XnM3
	MZjSHngTmGawj7wI4z6IMobg61IVvT7EZ/sJjtf7OwtR8tUohZEnbiEXKKP2CXIE+fajOp
	DvY/isV7f9FmNZQJYY1I2fEJi4SVgv1GpB7AdQpyLeJj09QRrUEqQBFs8lhNOFpzVA9CxN
	CKK47pJ5WkDfnH7saFX23R28zALwq4692+fUVb+n4DKqFm2HvFPRl6wbf0KWh1xCdlTQxe
	TMuuoMQgTWWYTgYqNFcXW/7GrAIAtIz7A8WKSMnTAx1MVp8zMk4pTGBj0rTtkQ==
Date: Sat, 18 May 2024 23:59:29 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 4/4] glib-networking: upgrade 2.78.1 -> 2.80.0
Message-ID: <20240518215929c3418ae7@mail.local>
References: <20240516105129.35869-1-anuj.mittal@intel.com>
 <20240516105129.35869-4-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516105129.35869-4-anuj.mittal@intel.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 May 2024 21:59:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199541

New ptest failures:
{'glib-networking': ['glib-networking/file-database-gnutls.test',
                     'glib-networking/connection-gnutls.test']}

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6619/steps/12/logs/stdio

https://autobuilder.yocto.io/pub/non-release/20240518-15/testresults/qemux86-64-ptest/glib-networking.log

(/usr/libexec/installed-tests/glib-networking/file-database-gnutls:395): GLib-Net-WARNING **: 14:05:34.707: Failed to load TLS database: System trust contains zero trusted certificates; please investigate your GnuTLS configuration
FAIL: glib-networking/file-database-gnutls.test (Child process killed by signal 5)


On 16/05/2024 18:51:29+0800, Anuj Mittal wrote:
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  meta/recipes-core/glib-networking/glib-networking/eagain.patch  | 2 +-
>  .../{glib-networking_2.78.1.bb => glib-networking_2.80.0.bb}    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-core/glib-networking/{glib-networking_2.78.1.bb => glib-networking_2.80.0.bb} (95%)
> 
> diff --git a/meta/recipes-core/glib-networking/glib-networking/eagain.patch b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
> index 6c2e3c634b7..88ac15e7d7c 100644
> --- a/meta/recipes-core/glib-networking/glib-networking/eagain.patch
> +++ b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
> @@ -1,4 +1,4 @@
> -From 5604707bed4b4a4bc4658c7158a18c1774775775 Mon Sep 17 00:00:00 2001
> +From 1bd273b207044a77fba6a6a57a743a1768b2676b Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Sat, 6 May 2023 12:18:50 +0100
>  Subject: [PATCH] In autobuilder testing we regularly see glib-networking ptest
> diff --git a/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
> similarity index 95%
> rename from meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
> rename to meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
> index 5060d9fd7a1..c8a13555486 100644
> --- a/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
> +++ b/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
>  SECTION = "libs"
>  DEPENDS = "glib-2.0-native glib-2.0"
>  
> -SRC_URI[archive.sha256sum] = "e48f2ddbb049832cbb09230529c5e45daca9f0df0eda325f832f7379859bf09f"
> +SRC_URI[archive.sha256sum] = "d8f4f1aab213179ae3351617b59dab5de6bcc9e785021eee178998ebd4bb3acf"
>  
>  # Upstream note that for the openssl backend, half the tests where this backend don't return
>  # the expected error code or don't work as expected so default to gnutls
> -- 
> 2.45.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199457): https://lists.openembedded.org/g/openembedded-core/message/199457
> Mute This Topic: https://lists.openembedded.org/mt/106132074/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

