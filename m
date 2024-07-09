Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3990DC2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 14:10:50 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.13840.1720534245824276496
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 07:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OfucNKDE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5BD4240005;
	Tue,  9 Jul 2024 14:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720534244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fu1Ay/IxcnMaFRt04CujqzfHh8YsgmHchZuE04opHJ4=;
	b=OfucNKDE+ZUrhPqEVUlbbc5TZ3MsXnSbkkckoBF0QLqGsJ/wWhI9X1dEiuJtDfwAIcM+k7
	XP7FMxBNwKM9JP6iZFqU2sVCFc3btuNVAA91nPUhzqaPB37tb1M+oqIEWPeM6kEXLptbka
	UUA8DJnixHvKSBfQGsvZbZISRi0iGExKmT+I2mhe6aZX7JqwDr9WAiZTiJDfE/hWyUjbdH
	SSDSeM5sFaWoJPjRfTe/bgv/mWtKiHDR7VbC9Em33sQ6JpLrqkbLek6r6kttmrcRqQDdKB
	kL9tLQCXiL/L+cLXA0jZZuKSKJuPmMSotYC64BwgoBTSfPSe32oJDHXTRNHVuw==
Date: Tue, 9 Jul 2024 16:10:43 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: niko.mauno@vaisala.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] Fix missing leading whitespace with ':append'
Message-ID: <20240709141043a4c14363@mail.local>
References: <20240709120209.65344-1-niko.mauno@vaisala.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240709120209.65344-1-niko.mauno@vaisala.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 14:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201661

Hello,

Can you submit one patch per recipe?

On 09/07/2024 15:02:09+0300, Niko Mauno via lists.openembedded.org wrote:
> From: Niko Mauno <niko.mauno@vaisala.com>
> 
> Mitigate occurrences where ':append' operator is used and leading
> whitespace character is obviously missing, risking inadvertent
> string concatenation.
> 
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  meta/recipes-devtools/dnf/dnf_4.20.0.bb | 2 +-
>  meta/recipes-graphics/mesa/mesa.inc     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/dnf/dnf_4.20.0.bb b/meta/recipes-devtools/dnf/dnf_4.20.0.bb
> index 4757346cbf..98edab0614 100644
> --- a/meta/recipes-devtools/dnf/dnf_4.20.0.bb
> +++ b/meta/recipes-devtools/dnf/dnf_4.20.0.bb
> @@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
>             file://0001-lock.py-fix-Exception-handling.patch \
>             "
>  
> -SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
> +SRC_URI:append:class-native = " file://0001-dnf-write-the-log-lock-to-root.patch"
>  
>  SRCREV = "e3cb438c0fd08c79676c0f3276aa7d75cd8557c6"
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 272d57c749..d56def2916 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -91,7 +91,7 @@ PACKAGECONFIG = " \
>  	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
>  "
>  
> -PACKAGECONFIG:append:class-native = "gallium-llvm r600"
> +PACKAGECONFIG:append:class-native = " gallium-llvm r600"
>  
>  # "gbm" requires "opengl"
>  PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201655): https://lists.openembedded.org/g/openembedded-core/message/201655
> Mute This Topic: https://lists.openembedded.org/mt/107121031/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

