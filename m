Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E5C4C6FD1D
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 14:38:40 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.36611.1679927910674962228
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 07:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IhEUTZoC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 31A801BF208;
	Mon, 27 Mar 2023 14:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679927908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=drHyJtrYwebaMuVou5I0KhqCBizKH4ZlJ98mIVpcZ18=;
	b=IhEUTZoCBQ4EruFm5vXw1wZORVSwrUrykRQc0fVTSD7zaWS0/uSw8GtYC1Ib8lmHXC5cvM
	bx4UFmAvX6gTCBEzKzwqSHW0rD+GnT0kcCird5UwLzmp2NfFSC8XHkhGZot5SNiBBHswt3
	weaF8Els0MHMtbSICrJV0kwimU8yNp4r8TmmoBsWy58FS0g/9SfL1Hx7OGsyVGXNpdI+sb
	V+cmaowWJiSATt6WxjdGj7q2ejps101wUzjzK4wVkN/nciq0PuRtK0Cay2XwKx5rO0puYK
	NYslFOPmxIOK5zidea7SmqGG609IK+t1zZBj7KiKEHN9VUSV9jw9Kp1nEg8Naw==
Date: Mon, 27 Mar 2023 16:38:27 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH 6/7] epiphany: update 43.1 -> 44.0
Message-ID: <2023032714382786bc343b@mail.local>
References: <20230325004818.2784943-1-f_l_k@t-online.de>
 <20230325004818.2784943-6-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230325004818.2784943-6-f_l_k@t-online.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 14:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179162

This fails on the AB:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2612/steps/13/logs/stdio

ERROR: Nothing PROVIDES 'libadwaita' (but /home/pokybuild/yocto-worker/reproducible/build/meta/recipes-gnome/epiphany/epiphany_44.0.bb DEPENDS on or otherwise requires it). Close matches:
  libedit

On 25/03/2023 01:48:17+0100, Markus Volk wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../{epiphany_43.1.bb => epiphany_44.0.bb}    | 37 +++++++++++--------
>  1 file changed, 22 insertions(+), 15 deletions(-)
>  rename meta/recipes-gnome/epiphany/{epiphany_43.1.bb => epiphany_44.0.bb} (72%)
> 
> diff --git a/meta/recipes-gnome/epiphany/epiphany_43.1.bb b/meta/recipes-gnome/epiphany/epiphany_44.0.bb
> similarity index 72%
> rename from meta/recipes-gnome/epiphany/epiphany_43.1.bb
> rename to meta/recipes-gnome/epiphany/epiphany_44.0.bb
> index ea22723a97..f10b818a06 100644
> --- a/meta/recipes-gnome/epiphany/epiphany_43.1.bb
> +++ b/meta/recipes-gnome/epiphany/epiphany_44.0.bb
> @@ -7,20 +7,27 @@ LICENSE = "GPL-3.0-or-later"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>  
>  DEPENDS = " \
> -          webkitgtk \
> -          gcr3 \
> -          gsettings-desktop-schemas \
> -          nettle \
> -          json-glib \
> -          libarchive \
> -          libdazzle \
> -          libhandy \
> -          libportal \
> -          libsoup \
> -          glib-2.0-native \
> -          coreutils-native \
> -          desktop-file-utils-native \
> -          "
> +	appstream-glib-native \
> +	coreutils-native \
> +	desktop-file-utils-native \
> +	gcr \
> +	glib-2.0-native \
> +	gsettings-desktop-schemas \
> +	gstreamer1.0 \
> +	iso-codes \
> +	json-glib \
> +	libadwaita \
> +	libarchive \
> +	libdazzle \
> +	libhandy \
> +	libportal \
> +	libsecret \
> +	libsoup \
> +	libxml2 \
> +	nettle \
> +	sqlite3 \
> +	webkitgtk \
> +"
>  
>  GNOMEBASEBUILDCLASS = "meson"
>  inherit gnomebase gsettings features_check gettext mime-xdg gtk-icon-cache
> @@ -31,7 +38,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
>             file://migrator.patch \
>             file://distributor.patch \
>             "
> -SRC_URI[archive.sha256sum] = "e86ead27cb9982815150664de3bf20faf375f77b8065b02b31180c65b6bbebb4"
> +SRC_URI[archive.sha256sum] = "aabdc9de80c409073676e00e15ba97187715e4b84bc776fe86db86d0f8140bb1"
>  
>  # Developer mode enables debugging
>  PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179086): https://lists.openembedded.org/g/openembedded-core/message/179086
> Mute This Topic: https://lists.openembedded.org/mt/97836713/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

