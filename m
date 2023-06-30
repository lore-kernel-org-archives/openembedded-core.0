Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D49FEB64DA
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 13:30:58 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.12077.1688131854809782058
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jun 2023 06:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pfaP/lgH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688131852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pOiFH9thecolk83nnIGgnMEx93cpBUOn47G69MaSQMI=;
	b=pfaP/lgHo0FRM+DpaNyivm98Woa/z7aMWguwmWSjI62q6SXzMoP25f3mi/9h3h2HsAS5eU
	cJslhKqcsFCfrjJdjGHB4K1hTaT3TdwA04sj13vutkZplKC4SjAXQAO0AU+p0LCBvcyYgZ
	b1bhU4eaC4BiV2gQdryGwxxijH7g5EcjkIutU+z3zJCEjlIE/ETgUTyAPqvoKHepgxrszg
	Kg+ukPMaFnbfW4W6FUeOSruB5k8YFENUr0csjf4DrDvgofbZu5HWiwt3dNGHpQ3h+jPdpl
	/4BauppuWu06QQUAOp/ddUbMSx3NkxccKCz1/msYRHm4Brohz8HsjifPFgHgKw==
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56B5540010;
	Fri, 30 Jun 2023 13:30:52 +0000 (UTC)
Date: Fri, 30 Jun 2023 15:30:51 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/3] libxcrypt: Limit to enabling strong hash
 algos only
Message-ID: <20230630133051db39352e@mail.local>
References: <20230624053223.228117-1-raj.khem@gmail.com>
 <20230624053223.228117-2-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230624053223.228117-2-raj.khem@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 13:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183695

Hello Khem,

This causes python ptest failures:

{'python3': ['test_crypt', 'test_methods', 'test_sha2_rounds']}

We should probably disable those

On 23/06/2023 22:32:21-0700, Khem Raj wrote:
> This ensures that weak algorithms are not included, which should improve
> the defauls to be more secure
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/libxcrypt/libxcrypt.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
> index 997e83fb004..db43a34b11d 100644
> --- a/meta/recipes-core/libxcrypt/libxcrypt.inc
> +++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
> @@ -29,7 +29,7 @@ BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
>  TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
>  CPPFLAGS:append:class-nativesdk = " -Wno-error"
>  
> -API = "--disable-obsolete-api"
> +API = "--disable-obsolete-api --enable-hashes=strong"
>  EXTRA_OECONF += "${API}"
>  
>  BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183356): https://lists.openembedded.org/g/openembedded-core/message/183356
> Mute This Topic: https://lists.openembedded.org/mt/99749300/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

