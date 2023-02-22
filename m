Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294C1C64EC7
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 23:42:23 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.3020.1677109338790898931
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 15:42:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ifx1dAez;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6FD6B1C0002;
	Wed, 22 Feb 2023 23:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677109336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QOezmZs4nWUjzzFPT6I3c6SZF8Hu0xn/KqZiYUZwI5M=;
	b=ifx1dAezrS3kOFuuxx1XXipNE60T4Ak0zgS7/XN8GVhwRO9p+vtvZuSmgfkXVWSpmEffWg
	bGoJi1O9kdSsj+GTaGf+uw2p9qizFtY6Jxa1FwEbhFyw9NoGkb5G3LHCvSYJwj2iJnlnBA
	GenlzsC+JHz67cmoKrEKQAPrkyHXFKAd/RvThFM0q4oQh3YwskMM4fwBLkuInwbf/ZsI0X
	qIvprP0OV1Z09fxuBM4HBbkOTV0VZrYoId6TZ6MMyVVgvaNewdGGRTqcCkRrro3T+tuhK0
	xxHZpQrpxG2HT2qi7u96DHX8lOHxZdmuyJ54OfJM/tk9Do4xtLjJHiKXYV6v8g==
Date: Thu, 23 Feb 2023 00:42:15 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCHv2] vte: update 0.70.2 -> 0.70.3
Message-ID: <Y/aoV7gBf9t0z53M@mail.local>
References: <20230222114847.3421468-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230222114847.3421468-1-f_l_k@t-online.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 23:42:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177589

This fails on musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/6703/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/6722/steps/12/logs/stdio

On 22/02/2023 12:48:47+0100, Markus Volk wrote:
> - Allow to build the gtk4 widget and vapi
>   This is needed to build gtk4 based terminals like blackbox
> - Update dependencies
> - Cleanup recipe and remove unneeded patch
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...EXITCODE-macro-for-non-glibc-systems.patch | 42 -------------------
>  .../vte/{vte_0.70.2.bb => vte_0.70.3.bb}      | 23 +++++-----
>  2 files changed, 11 insertions(+), 54 deletions(-)
>  delete mode 100644 meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
>  rename meta/recipes-support/vte/{vte_0.70.2.bb => vte_0.70.3.bb} (69%)
> 
> diff --git a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
> deleted file mode 100644
> index b4100fc381..0000000000
> --- a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From de9639baac792327c701e509258b8a13f6959e82 Mon Sep 17 00:00:00 2001
> -From: Danilo Spinella <danyspin97@protonmail.com>
> -Date: Thu, 21 Mar 2019 14:19:26 +0100
> -Subject: [PATCH] Add W_EXITCODE macro for non-glibc systems
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Upstream-Status: Submitted [1]
> -
> -Signed-off-by: Andreas M�ller <schnitzeltony@gmail.com>
> -
> -[1] https://gitlab.gnome.org/GNOME/vte/issues/72
> -
> ----
> - src/missing.hh | 4 ++++
> - src/widget.cc  | 1 +
> - 2 files changed, 5 insertions(+)
> -
> ---- a/src/missing.hh
> -+++ b/src/missing.hh
> -@@ -24,6 +24,10 @@
> - #define NSIG (8 * sizeof(sigset_t))
> - #endif
> - 
> -+#ifndef W_EXITCODE
> -+#define W_EXITCODE(ret, sig) ((ret) << 8 | (sig))
> -+#endif
> -+
> - #ifndef HAVE_FDWALK
> - int fdwalk(int (*cb)(void* data, int fd),
> -            void* data);
> ---- a/src/widget.cc
> -+++ b/src/widget.cc
> -@@ -21,6 +21,7 @@
> - #include "widget.hh"
> - 
> - #include <sys/wait.h> // for W_EXITCODE
> -+#include "missing.hh" // for W_EXITCODE on non-glibc systems
> - 
> - #include <exception>
> - #include <new>
> diff --git a/meta/recipes-support/vte/vte_0.70.2.bb b/meta/recipes-support/vte/vte_0.70.3.bb
> similarity index 69%
> rename from meta/recipes-support/vte/vte_0.70.2.bb
> rename to meta/recipes-support/vte/vte_0.70.3.bb
> index ec2fb1f522..73b4666efc 100644
> --- a/meta/recipes-support/vte/vte_0.70.2.bb
> +++ b/meta/recipes-support/vte/vte_0.70.3.bb
> @@ -11,34 +11,33 @@ LIC_FILES_CHKSUM = " \
>      file://COPYING.XTERM;md5=d7fc3a23c16c039afafe2e042030f057 \
>  "
>  
> -DEPENDS = "glib-2.0 gtk+3 libpcre2 libxml2-native gperf-native icu"
> +DEPENDS = "fribidi glib-2.0 gtk+3 libpcre2 libxml2-native gperf-native icu pango zlib"
>  
>  GNOMEBASEBUILDCLASS = "meson"
>  GIR_MESON_OPTION = 'gir'
>  GIDOCGEN_MESON_OPTION = "docs"
>  
> -inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection
> +inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection vala
>  
> -# vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
> -SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
> -SRC_URI[archive.sha256sum] = "4d15b4380de3f564d57eabd006389c407c705df5b0c70030fdcc24971a334d80"
> +SRC_URI[archive.sha256sum] = "9457134a02f3157fca04f7e0d39bdb0f3099be0a3ce82b7139d0c98a80748f23"
>  
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>  
> -# Help g-ir-scanner find the .so for linking
> -do_compile:prepend() {
> -    export GIR_EXTRA_LIBS_PATH="${B}/src/.libs"
> -}
> -
>  # Package additional files
>  FILES:${PN}-dev += "${datadir}/vala/vapi/*"
>  
> -PACKAGECONFIG ??= "gnutls"
> -PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false,vala-native vala"
> +PACKAGECONFIG ??= " \
> +    gnutls \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection-data', 'vala', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gtk4', '', d)} \
> +"
> +PACKAGECONFIG[gtk4] = "-Dgtk4=true,-Dgtk4=false,gtk4"
> +PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false"
>  PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
>  PACKAGECONFIG[systemd] = "-D_systemd=true,-D_systemd=false,systemd"
>  # vala requires gir
>  PACKAGECONFIG:remove:class-native = "vala"
> +PACKAGECONFIG:remove:class-nativesdk = "vala gtk4"
>  
>  CFLAGS += "-D_GNU_SOURCE"
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177567): https://lists.openembedded.org/g/openembedded-core/message/177567
> Mute This Topic: https://lists.openembedded.org/mt/97115916/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

