Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98460C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 04:52:32 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.5514.1648011150699532033
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 21:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GHT0Tcm5;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8B922200006;
	Wed, 23 Mar 2022 04:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1648011148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nzkKMb6MJNeuPFvRp7e7iUMIg3TfqNUb88/ohm5lHkM=;
	b=GHT0Tcm5Qr9IFFdaChvkOlty91K5cKoTnnt/10DjdrQiLQi4PLy1V8RatvavBItlydtAxy
	0SvbxQHTdHy/f3CvOgRhb7d7k3uGL8SbjKpMrEI3RC+z/24MjHQ9stPlnhcb1JewyqtYv/
	OdD3ABQndUoXUUwggE7Pqs93gh3p4BVWeNimv/7mauqaVH84N8vB66+4PSIhqpBjtk2Tom
	pxJjtHO2CHBaEc/QCpkw38JiFNsUxpEjdB0aB5XRT8xlRfLCrtZuqfOstes8yx/8aJu+IU
	Gv9JyMOoGDoce0CP5CjZUYRJjnTKQD7Vby+sdCxWsHZjQ4368SH5kt8/KJUWyQ==
Date: Wed, 23 Mar 2022 05:52:28 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] libhandy: upgrade 1.5.0 -> 1.6.1
Message-ID: <YjqnjLAFO/0tJ1lz@piout.net>
References: <1647945489-5242-1-git-send-email-wangmy@fujitsu.com>
 <1647945489-5242-2-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1647945489-5242-2-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Mar 2022 04:52:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163578

Hello,

This probably caused this error:

https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/2767/steps/11/logs/stdio

On 22/03/2022 18:38:07+0800, wangmy wrote:
> 0001-Add-private-headers.patch
> removed since it's included in 1.6.1
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../libhandy/0001-Add-private-headers.patch   | 37 -------------------
>  .../{libhandy_1.5.0.bb => libhandy_1.6.1.bb}  |  6 +--
>  2 files changed, 2 insertions(+), 41 deletions(-)
>  delete mode 100644 meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch
>  rename meta/recipes-gnome/libhandy/{libhandy_1.5.0.bb => libhandy_1.6.1.bb} (89%)
> 
> diff --git a/meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch b/meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch
> deleted file mode 100644
> index 7b2a512738..0000000000
> --- a/meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From e7c3e8fa00f6a68b2e0629db5ee115e641ea710e Mon Sep 17 00:00:00 2001
> -From: Mingli Yu <mingli.yu@windriver.com>
> -Date: Wed, 8 Dec 2021 07:35:52 +0000
> -Subject: [PATCH] Add private headers
> -
> -After the commit(8157ecc Separate public and private enums) introduced,
> -there comes a race as below:
> - | In file included from ../git/src/hdy-settings.c:11:
> - | ../git/src/hdy-settings-private.h:16:10: fatal error: hdy-enums-private.h: No such file or directory
> - |    16 | #include "hdy-enums-private.h"
> -
> -So also add private headers like private sources to libhandy_sources to
> -fix the issue.
> -
> -Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libhandy/-/merge_requests/796]
> -
> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ----
> - src/meson.build | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/meson.build b/src/meson.build
> -index d087323..6f11f27 100644
> ---- a/src/meson.build
> -+++ b/src/meson.build
> -@@ -64,7 +64,7 @@ hdy_private_enums = gnome.mkenums('hdy-enums-private',
> - )
> - 
> - libhandy_public_sources += [hdy_public_enums[0]]
> --libhandy_private_sources += [hdy_private_enums[0]]
> -+libhandy_private_sources += hdy_private_enums
> - libhandy_generated_headers += [hdy_public_enums[1]]
> - 
> - src_headers = [
> --- 
> -2.32.0
> -
> diff --git a/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb b/meta/recipes-gnome/libhandy/libhandy_1.6.1.bb
> similarity index 89%
> rename from meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
> rename to meta/recipes-gnome/libhandy/libhandy_1.6.1.bb
> index 722593dfb1..06b2b467fe 100644
> --- a/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
> +++ b/meta/recipes-gnome/libhandy/libhandy_1.6.1.bb
> @@ -9,10 +9,8 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/libhandy/-/issues"
>  LICENSE = "LGPL-2.1-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>  
> -SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=master \
> -           file://0001-Add-private-headers.patch \
> -"
> -SRCREV = "8fa8306a79215fc6ebf2483145da98bf9b2495ab"
> +SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=libhandy-1-6"
> +SRCREV = "4186dae5570cf8e73cf8a145236240eec3a237b5"
>  S = "${WORKDIR}/git"
>  
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+))"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163540): https://lists.openembedded.org/g/openembedded-core/message/163540
> Mute This Topic: https://lists.openembedded.org/mt/89949055/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

