Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95EC5C43217
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 14:47:31 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web08.8244.1668091643805991630
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 06:47:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UGDJk/KG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 96E541BF206;
	Thu, 10 Nov 2022 14:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668091642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1BE8rpDeRbiyoG8avJF7pvuZg6luv80or9LHXNwx9uE=;
	b=UGDJk/KGGEAdub5cLZp38oxr2KLWsaIotwRpDbquG/8BLsiZggTTDyhv0jurrBzA2DcG2r
	0RekmMzXA61swKnNuObtMI1nGApU8OWE9QiJGnBioZ3WaWcZn0TFU9cnmbrdPuzvG8JBgm
	R71yM5j+ehJMjy70CxqKP+AsuHgpVqMFvViIXkAuO4WfMZDENJpiKRxd5NagLUM7P3f763
	JJclOAxeTYoVCffRPMYQ0Ehs3ihk/eAnLWZbBwLJcotEubDD46CpVW36slW2wLmqpNw57P
	ybdNuMzK5V769ZH/NxcypmobkBewsGDvWUueXvCU6kP5vCKMtk+eo13jVghaMA==
Date: Thu, 10 Nov 2022 15:47:21 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: adhityax.siddartha.ravula@intel.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] pixman: backport fix for CVE-2022-44638
Message-ID: <Y20O+Vc2Qjy6ugii@mail.local>
References: <20221108162148.29550-1-adhityax.siddartha.ravula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108162148.29550-1-adhityax.siddartha.ravula@intel.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 14:47:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173077

Hello,

On 08/11/2022 21:51:48+0530, adhityax.siddartha.ravula@intel.com wrote:
> From: Adhitya Siddartha <adhityax.siddartha.ravula@intel.com>
> 
> Reference to upstream patch:
> https://gitlab.freedesktop.org/pixman/pixman/-/commit/a1f88e842e0216a5b4df1ab023caebe33c101395
> 

Your mailer mangled the whitespaces and the patch doesn't apply
properly:
https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/6145/steps/11/logs/stdio

> Signed-off-by: Adhitya Siddartha <adhityax.siddartha.ravula@intel.com>
> ---
>  .../xorg-lib/pixman/CVE-2022-44638.patch      | 37 +++++++++++++++++++
>  .../xorg-lib/pixman_0.40.0.bb                 |  1 +
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch
> 
> diff --git a/meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch b/meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch
> new file mode 100644
> index 0000000000..ab5acaf2ee
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch
> @@ -0,0 +1,37 @@
> +From a1f88e842e0216a5b4df1ab023caebe33c101395 Mon Sep 17 00:00:00 2001
> +From: Matt Turner <mattst88@gmail.com>
> +Date: Wed, 2 Nov 2022 12:07:32 -0400
> +Subject: [PATCH] Avoid integer overflow leading to out-of-bounds write
> +
> +Upstream-Status: Backport
> +CVE: CVE-2022-44638
> +
> +Reference to upstream patch:
> +https://gitlab.freedesktop.org/pixman/pixman/-/commit/a1f88e842e0216a5b4df1ab023caebe33c101395
> +
> +Signed-off-by: Ravula AdhityaX Siddartha <adhityax.siddartha.ravula@intel.com>
> +
> +Thanks to Maddie Stone and Google's Project Zero for discovering this
> +issue, providing a proof-of-concept, and a great analysis.
> +
> +Closes: https://gitlab.freedesktop.org/pixman/pixman/-/issues/63
> +---
> + pixman/pixman-trap.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/pixman/pixman-trap.c b/pixman/pixman-trap.c
> +index 91766fd..7560405 100644
> +--- a/pixman/pixman-trap.c
> ++++ b/pixman/pixman-trap.c
> +@@ -74,7 +74,7 @@ pixman_sample_floor_y (pixman_fixed_t y,
> + 
> +     if (f < Y_FRAC_FIRST (n))
> +     {
> +-	if (pixman_fixed_to_int (i) == 0x8000)
> ++	if (pixman_fixed_to_int (i) == 0xffff8000)
> + 	{
> + 	    f = 0; /* saturate */
> + 	}
> +-- 
> +GitLab
> +
> diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
> index ccfe277746..c56733eefd 100644
> --- a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
> +++ b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
> @@ -9,6 +9,7 @@ DEPENDS = "zlib"
>  
>  SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.gz \
>             file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
> +           file://CVE-2022-44638.patch \
>             "
>  SRC_URI[md5sum] = "73858c0862dd9896fb5f62ae267084a4"
>  SRC_URI[sha256sum] = "6d200dec3740d9ec4ec8d1180e25779c00bc749f94278c8b9021f5534db223fc"
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172974): https://lists.openembedded.org/g/openembedded-core/message/172974
> Mute This Topic: https://lists.openembedded.org/mt/94886474/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

