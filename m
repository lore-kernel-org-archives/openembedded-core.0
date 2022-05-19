Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE25BC433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 14:18:39 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.8137.1652969913991576073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 07:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jQFaDgM+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0CC85FF815;
	Thu, 19 May 2022 14:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1652969911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TXyQL4VAB98hZovu3zMGNqIfigwqxZJ+TX6Az72YspQ=;
	b=jQFaDgM+Ugj52zjRFW7CZRJ3vBN3Zj7ICYKM48h4nFkdI8rOhu1Eyv5AKe9XiKXBJ2+Xkm
	t2rWx9zvF3aYA8D8fUjp3WZzLB4L3jl1FKdHOI1V3af9H/sHFr9v+zv8CwAxMZJ9ovDoTq
	inPrOJ8dTvvJcLNFzawJ+c2YRF5ZBamx0szjkfN/Oy9ubzLjmy3rON+VvWZA1iPTMg4Nq0
	dTj1luecrpKXm9IDpKX0kF0wUM41hFU5yrTAmKBMWAIVbIzpxOkEZlrzguX6a00CkWvVku
	pzUtoA4Pm/uzC7fuXUW9M3Z9sFKuYAvrwrRPcIcDG3qr2E8/ItX9CAMRudHqjQ==
Date: Thu, 19 May 2022 16:18:29 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Markus Volk" <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [meta-oe][RFC PATCH 2/2] libsdl2: rework and cleanup
Message-ID: <20220519161829.2d10631c@melee>
In-Reply-To: <20220519064312.391164-2-f_l_k@t-online.de>
References: <20220519064312.391164-1-f_l_k@t-online.de>
	<20220519064312.391164-2-f_l_k@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 14:18:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165891

Hello Marius,

Il giorno Thu, 19 May 2022 08:43:12 +0200
"Markus Volk" <f_l_k@t-online.de> ha scritto:

> - add libusb dependency because libsdl2 is looking for it
> - remove xvm and xinerama since support has been dropped in sdl code
> - allow native build for libxkbcommon and xkeyboard-config to allow
>   alignment of native/target build
> - align native and target build
> - add PACKAGECONFIG options for pipewire and libdecor
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb | 17
> ++++++++--------- .../xorg-lib/libxkbcommon_1.4.0.bb              |
> 2 ++ .../xorg-lib/xkeyboard-config_2.35.1.bb         |  2 ++
>  3 files changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
> b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb index
> 7678319770..a6550c3175 100644 ---
> a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb +++
> b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb @@ -21,6 +21,8 @@
> LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG',
> 'arm-neon', 'f PROVIDES = "virtual/libsdl2"
>  
> +DEPENDS = "libusb"

This patch is causing errors on the autobuilders due to this line:

stdio: ERROR: Nothing PROVIDES 'libusb' (but
/home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
DEPENDS on or otherwise requires it). Close matches:

Here are a few logs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5269/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5269/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5269/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/5590/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/5243/steps/12/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

