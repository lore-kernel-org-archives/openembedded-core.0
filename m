Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E21C8302B
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:12 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.19235.1650533497635855523
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 02:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DZP8vry3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 77884C0010;
	Thu, 21 Apr 2022 09:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650533496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X0ay6/Ss5vALw2MPw8PmPuHJGz9fE3DLTpveW2sT7Qk=;
	b=DZP8vry31QwYii3+GjU4IMl6wF11rlWuSUw1FCu3HmVx39HL1K23gXkNUptT4JA0+Pgmoc
	y9ssJY7DSRxJdVcb3eL79lFNBLDilm4BL63ui7sYn1Jr7XcBXDz3XAecxc5lAZ50o+jW2m
	xngukX77gEx1uP0x/QTmJ16I4RdJeoevLur1Mab+0TRORN3O89KUZFCbb6/xrO7bP3YYCx
	D8xwQQ2j0S8ji68ZyCE9l6DctkDJOdohKwoet5yk7gfvI0xx2ahNdfdwlAsB6GBEdH/gfe
	IGUpLI+HJm3lTJHA3RjiJwZWjZRv/kGlMLIJiTEZODXSswqgKzYJuKAiHTP7ug==
Date: Thu, 21 Apr 2022 11:31:33 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] xorg-app: Tweak handling of compression
 changes in SRC_URI
Message-ID: <20220421113133.783bd083@melee>
In-Reply-To: <20220420115509.2525431-1-richard.purdie@linuxfoundation.org>
References: <20220420115509.2525431-1-richard.purdie@linuxfoundation.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164750

Hi Richard,

Il giorno Wed, 20 Apr 2022 12:55:09 +0100
"Richard Purdie" <richard.purdie@linuxfoundation.org> ha scritto:

> Rather than duplicating SRC_URI, change the compression to a variable.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb | 3 +--
>  meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb    | 3 +--
>  meta/recipes-graphics/xorg-app/xorg-app-common.inc  | 3 ++-
>  meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb      | 3 +--
>  4 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb
> b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb index
> 573b05128e4..cd658ab219c 100644 ---
> a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb +++
> b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb @@ -15,8 +15,7
> @@ RPROVIDES:${PN} += "mkfontdir" 
>  BBCLASSEXTEND = "native"
>  
> -SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.xz"
> -
>  LIC_FILES_CHKSUM =
> "file://COPYING;md5=99b1e1269aba5179139b9e4380fc0934" 
> +SRC_URI_EXT = "xz"
>  SRC_URI[sha256sum] =
> "8ae3fb5b1fe7436e1f565060acaa3e2918fe745b0e4979b5593968914fe2d5c4"
> diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb
> b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb index
> fa0fe36451a..e75a840b7de 100644 ---
> a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb +++
> b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb @@ -8,14 +8,13 @@
> predefined values for various parameters used in communicating
> between \ clients and the server, and the different types of screens
> and visuals \ that are available." -SRC_URI =
> "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.xz" -
>  LIC_FILES_CHKSUM =
> "file://COPYING;md5=f3d09e6b9e203a1af489e16c708f4fb3" DEPENDS +=
> "libxtst libxext libxxf86vm libxi libxrender libxinerama libdmx
> libxau libxcomposite" PE = "1" 
>  SRC_URI += "file://disable-xkb.patch"
>  
> +SRC_URI_EXT = "xz"
>  SRC_URI[sha256sum] =
> "356d5fd62f3e98ee36d6becf1b32d4ab6112d618339fb4b592ccffbd9e0fc206" 
>  EXTRA_OECONF = "--disable-xkb"
> diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
> b/meta/recipes-graphics/xorg-app/xorg-app-common.inc index
> 1c64e20aac7..6a9ebe842de 100644 ---
> a/meta/recipes-graphics/xorg-app/xorg-app-common.inc +++
> b/meta/recipes-graphics/xorg-app/xorg-app-common.inc @@ -8,7 +8,8 @@
> DEPENDS = "util-macros-native virtual/libx11" # depends on
> virtual/libx11 REQUIRED_DISTRO_FEATURES = "x11"
>  
> -SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.bz2"
> +SRC_URI_EXT = ".bz2"
> +SRC_URI =
> "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.${SRC_URI_EXT}" 

There's an extra '.' in ".bz2" that causes fetch failures.

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/725/steps/12/logs/errors

stdio: WARNING: xkbcomp-1.4.5-r0 do_fetch: Failed to fetch URL
https://www.x.org/releases//individual/app/xkbcomp-1.4.5.tar..bz2,
attempting MIRRORS if available

I'm dropping this patch from my master-next branch for now.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

