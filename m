Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95444C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 07:49:46 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.17110.1702540175635975926
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 23:49:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YV4b3JXr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0545F1C0002;
	Thu, 14 Dec 2023 07:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702540173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1cwvK1c/x/Xf6yHG7V8cUHTRATQYIZw+KcSxkMh3QS4=;
	b=YV4b3JXrDGoLc20LAbrM1XcGtzjtCyOBrIMjho0JYZTdJ2p2PERTrS1+UIQjU/sKKoSmaB
	jDe/Xl2u/btrHlEnyHpFZoqV/3clSKXmrbdHzdECx8Lic3LfBbfiBOJMyXo3neizhJsXro
	orP80rU+gHQOR8PM/g3veV84Nt69eYmmcnwO19F7+GVT3+4hOD6lHfNX8UKJxn/nN/yHAg
	Vj18j1/U8D4sbeb+LL0rmaGQKeYk0D7kdzjSPtappKii0H6aCKXN6YUH++1mh40ysavVp5
	9PMoFz+/2azIsLeeeQkGiJ2EDOfUznWmBwYkNlMgX9ToET3FBMrntfh5lThphw==
Date: Thu, 14 Dec 2023 08:49:32 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Subject: Re: [OE-core] [PATCH 1/9] nativesdk: ensure features don't get
 backfilled
Message-ID: <20231214074932cba7c5f3@mail.local>
References: <20231212140820.2900963-1-ross.burton@arm.com>
 <20231212140820.2900963-2-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212140820.2900963-2-ross.burton@arm.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 07:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192336

Hello Ross,

Not obvious but this is the cause of:

https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/8697

On 12/12/2023 14:08:12+0000, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> nativesdk aims to run in a slightly different environment than the
> target build, so it unsets MACHINE_FEATURES and lets DISTRO_FEATURES be
> filtered by DISTRO_FEATURES_NATIVESDK (in bitbake.conf).
> 
> However, feature backfill happens _after_ these operations:
> 
>  $ bitbake-getvar -r nativesdk-glib-2.0 MACHINE_FEATURES
>  #
>  # $MACHINE_FEATURES [5 operations]
>  #   set /home/ross/Yocto/poky/meta/conf/machine/include/qemu.inc:14
>  #     "alsa bluetooth usbgadget screen vfat"
>  #   set /home/ross/Yocto/poky/meta/conf/documentation.conf:284
>  #     [doc] "Specifies the list of hardware features the MACHINE supports."
>  #   set? /home/ross/Yocto/poky/meta/conf/bitbake.conf:893
>  #     ""
>  #   set /home/ross/Yocto/poky/meta/classes-recipe/nativesdk.bbclass:18
>  #     ""
>  #   append utils.py:132 [features_backfill]
>  #     " rtc qemu-usermode"
>  # pre-expansion value:
>  #   " rtc qemu-usermode"
>  MACHINE_FEATURES=" rtc qemu-usermode"
> 
> I don't believe this is intentional or desired as the machine features
> are unrelated to the nativesdk environment.  Specifically, this means
> that recipes that look for the qemu-usermode machine feature will fail
> in nativesdk as there may not actually be qemu-user support for the
> nativesdk environment.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes-recipe/nativesdk.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/nativesdk.bbclass
> index 08288fdb733..ccaf411f0d7 100644
> --- a/meta/classes-recipe/nativesdk.bbclass
> +++ b/meta/classes-recipe/nativesdk.bbclass
> @@ -15,7 +15,10 @@ NATIVESDKLIBC ?= "libc-glibc"
>  LIBCOVERRIDE = ":${NATIVESDKLIBC}"
>  CLASSOVERRIDE = "class-nativesdk"
>  MACHINEOVERRIDES = ""
> +
>  MACHINE_FEATURES = ""
> +DISTRO_FEATURES_BACKFILL = ""
> +MACHINE_FEATURES_BACKFILL = ""
>  
>  MULTILIBS = ""
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192193): https://lists.openembedded.org/g/openembedded-core/message/192193
> Mute This Topic: https://lists.openembedded.org/mt/103129922/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

