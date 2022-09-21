Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1723ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 12:09:21 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.5542.1663762152335718219
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 05:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IrqatbQZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CCD6EFF80A;
	Wed, 21 Sep 2022 12:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663762150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5WXENBPmI4SP8bL1H8jTiDsGniKM8ZNvBHtYr0kZGMo=;
	b=IrqatbQZdmn5VvxsspmOpgbVMRtH+MzGOebcL3ISISaQagP5PitlgI7YWJIrIHjNvefTfO
	pddb/BVOX3UCVGFN0VlWSFPHt4yj254pB5NAGNg7sVeJ3UBhSOiAOUAh2LWhpy6nQ5/TpU
	Q/s5DV108UEH63Jvv+UuygGpVGfVE8QKBjOuHwIucPHy37P9XTqQfWDEkMxBwDJXi1A/h1
	JY8Oo1UlUjskDUS0lctcP2QRpHkjKqr1VnU/YAZ8QZ68t252vWOV2kg23D4X5MrERDXfIg
	OIqsSBYNZhp/QLR8mJO2SPPJlm134c4NBZ9rfrzcA5Q0Mds+IEr3Zy6cQce2eQ==
Date: Wed, 21 Sep 2022 14:09:08 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: kai <kai.kang@windriver.com>
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] binutils: handle symlink files for gprofng
Message-ID: <Yyr+5HWLfhmrZj4F@mail.local>
References: <20220919044803.15248-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919044803.15248-1-kai.kang@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 12:09:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170948

Hello,

On 19/09/2022 12:48:03+0800, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> It provides gprofng by binutils 2.39 for x86, x86_64 and aarch64
> according to configure.ac:
> 
> https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=configure.ac;h=a5555a9c91b42214afc46a0ab8b629e4c6fedcc0;hb=HEAD#l401
> 
> Add them to USE_ALTERNATIVES_FOR the same as others to handle symlink
> files via update-alternative mechanism.
> 

We get the following warnings on musl:
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5882/steps/11/logs/warnings


> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-devtools/binutils/binutils.inc | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
> index 789c8bec21..0f56fb3e2e 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -36,6 +36,19 @@ FILES:${PN}-dev = " \
>  # Rather than duplicating multiple entries for these, make one
>  # list and reuse it.
>  
> +GPROFNGS = " \
> +	gp-archive \
> +	gp-collect-app \
> +	gp-display-html \
> +	gp-display-src \
> +	gp-display-text \
> +	gprofng \
> +"
> +GPROFNG_ALTS ?= ""
> +GPROFNG_ALTS:x86 = "${GPROFNGS}"
> +GPROFNG_ALTS:x86-64 = "${GPROFNGS}"
> +GPROFNG_ALTS:aarch64 = "${GPROFNGS}"
> +
>  LDGOLD_ALTS ?= "ld.gold dwp"
>  LDGOLD_ALTS:riscv64 = ""
>  LDGOLD_ALTS:riscv32 = ""
> @@ -48,6 +61,7 @@ USE_ALTERNATIVES_FOR = " \
>  	c++filt \
>  	elfedit \
>  	gprof \
> +	${GPROFNG_ALTS} \
>  	ld \
>  	ld.bfd \
>  	${LDGOLD_ALTS} \
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170855): https://lists.openembedded.org/g/openembedded-core/message/170855
> Mute This Topic: https://lists.openembedded.org/mt/93775511/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

