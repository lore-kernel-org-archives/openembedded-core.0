Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD03C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 10:06:59 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.9977.1700042813300677282
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 02:06:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nw2X+HOZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3766C240002;
	Wed, 15 Nov 2023 10:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700042811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9jhz89zehFzTj637d7GhGbx286/pxnBprMCgqa/eoEk=;
	b=nw2X+HOZHT1ZdrevBdH48iV+bvtQ2T3YyViKy5blRqdzZDY2p8DcdyaHteisY6HwABwbV+
	XKb5tXW6ccxXRtPW24dqw60KPMu3UECp72Mw+be8cPKNnjyU7Esa5caDCvRISySiHxB9ZZ
	Q0ur3xf0TQLk0OnVm5aZxHoKsx5aUXs+0XQ1lTjBPzt4L0V/v8GNPdhpLZQdkmukjUGQYO
	3SF6Ooz9trYuehkmnZN9/VAtAqr0wtKAtnIwjKxHBnuxW3kPQ8JDGsd4Msl5XjlgmvyUyl
	Z1HyzrjCpf/AtUggp1JrrH38Bj905nqtUBzDttGD6cDPYhb8HGZCwlrNtpgWhA==
Date: Wed, 15 Nov 2023 11:06:50 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] vte: Upgrade to 0.74.1
Message-ID: <2023111510065022f67321@mail.local>
References: <20231114215335.1308211-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114215335.1308211-1-raj.khem@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 10:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190581

Hello,

The added dependency fails on the AB:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6196/steps/13/logs/warnings
https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/8464/steps/12/logs/warnings
https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/8169/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/8168/steps/20/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/8114/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/7488/steps/12/logs/warnings

On 14/11/2023 13:53:29-0800, Khem Raj wrote:
> * Enable systemd knob for distros with systemd in them.
> * Add dependency on gtk4 which is needed
> * Package systemd unit files
> * Add packageconfig for fribidi defaulted to disabled
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...01-Add-W_EXITCODE-macro-for-non-glibc-systems.patch |  4 ++--
>  .../vte/{vte_0.72.2.bb => vte_0.74.1.bb}               | 10 ++++++----
>  2 files changed, 8 insertions(+), 6 deletions(-)
>  rename meta/recipes-support/vte/{vte_0.72.2.bb => vte_0.74.1.bb} (80%)
> 
> diff --git a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
> index b4100fc381e..daf07bfd3c9 100644
> --- a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
> +++ b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
> @@ -19,7 +19,7 @@ Signed-off-by: Andreas M�ller <schnitzeltony@gmail.com>
>  
>  --- a/src/missing.hh
>  +++ b/src/missing.hh
> -@@ -24,6 +24,10 @@
> +@@ -43,6 +43,10 @@
>   #define NSIG (8 * sizeof(sigset_t))
>   #endif
>   
> @@ -27,7 +27,7 @@ Signed-off-by: Andreas M�ller <schnitzeltony@gmail.com>
>  +#define W_EXITCODE(ret, sig) ((ret) << 8 | (sig))
>  +#endif
>  +
> - #ifndef HAVE_FDWALK
> + #if !HAVE_FDWALK
>   int fdwalk(int (*cb)(void* data, int fd),
>              void* data);
>  --- a/src/widget.cc
> diff --git a/meta/recipes-support/vte/vte_0.72.2.bb b/meta/recipes-support/vte/vte_0.74.1.bb
> similarity index 80%
> rename from meta/recipes-support/vte/vte_0.72.2.bb
> rename to meta/recipes-support/vte/vte_0.74.1.bb
> index 44e71491f62..2f0448edb3c 100644
> --- a/meta/recipes-support/vte/vte_0.72.2.bb
> +++ b/meta/recipes-support/vte/vte_0.74.1.bb
> @@ -11,16 +11,16 @@ LIC_FILES_CHKSUM = " \
>      file://COPYING.XTERM;md5=d7fc3a23c16c039afafe2e042030f057 \
>  "
>  
> -DEPENDS = "glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native gperf-native icu"
> +DEPENDS = "glib-2.0 glib-2.0-native gtk+3 gtk4 libpcre2 libxml2-native gperf-native icu"
>  
>  GIR_MESON_OPTION = 'gir'
>  GIDOCGEN_MESON_OPTION = "docs"
>  
> -inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection
> +inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd
>  
>  # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
>  SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
> -SRC_URI[archive.sha256sum] = "f7966fd185a6981f53964162b71cfef7e606495155d6f5827b72aa0dd6741c9e"
> +SRC_URI[archive.sha256sum] = "2328c3f1c998350a18e0e513348e9fc581d57ea4e7b89aedf11e0e3c65042b4f"
>  
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>  
> @@ -32,8 +32,9 @@ do_compile:prepend() {
>  # Package additional files
>  FILES:${PN}-dev += "${datadir}/vala/vapi/*"
>  
> -PACKAGECONFIG ??= "gnutls"
> +PACKAGECONFIG ??= "gnutls ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
>  PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false,vala-native vala"
> +PACKAGECONFIG[fribidi] = "-Dfribidi=true,-Dfribidi=false,fribidi"
>  PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
>  PACKAGECONFIG[systemd] = "-D_systemd=true,-D_systemd=false,systemd"
>  # vala requires gir
> @@ -42,6 +43,7 @@ PACKAGECONFIG:remove:class-native = "vala"
>  CFLAGS += "-D_GNU_SOURCE"
>  
>  PACKAGES =+ "libvte ${PN}-prompt"
> +FILES:${PN} += "${systemd_user_unitdir}"
>  FILES:libvte = "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
>  FILES:${PN}-prompt = " \
>      ${sysconfdir}/profile.d \
> -- 
> 2.42.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190522): https://lists.openembedded.org/g/openembedded-core/message/190522
> Mute This Topic: https://lists.openembedded.org/mt/102593386/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

