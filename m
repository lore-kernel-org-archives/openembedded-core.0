Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527C2C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 23:28:35 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.4960.1677194914083692277
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 15:28:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=P8w/uEDR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2A150E0003;
	Thu, 23 Feb 2023 23:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677194911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6MprfpQT6QHffm5Ps/J9vSiX5woPpT6JGk/2bon97E8=;
	b=P8w/uEDRDXkiMzEN7apNHMluDzTIbA+ePKarICgrAQZ730RY1gSdEYxaTBLNak15zm27SD
	fUJMhsD5RBEEhZ/Ft20unZA6obRMIqvceJfbJvjt4VIn9PIjSmS6SBxNO5rMXRqy4PSiCs
	cYJ5u0t/4QLg5Er68Tnq+8YsV3IXts/POTbwdN/OH6KZnnhvKNq9B/OMvVhU33c6qGkswE
	ahe9KsCrTSoy3daJZtLFB59NCiRK0sLN/f7iKlNaT2Sm4Fvg3/NytA+IaehW7CIscoYJD3
	uA+GT0cga8ZTLshVxL2grOez3hoJUvrBthMmUsevaLf3/3X2R56iRJqpxrO//g==
Date: Fri, 24 Feb 2023 00:28:30 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCHv3] vte: update 0.70.2 -> 0.70.3
Message-ID: <Y/f2ngPg/GeWQ4G+@mail.local>
References: <20230223075256.1755504-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223075256.1755504-1-f_l_k@t-online.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 23:28:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177639

I'm sorry I didn't catch it earlier but this is also the cause of:

ERROR: core-image-sato-1.0-r0 do_rootfs: Multilib check error: duplicate files /home/pokybuild/yocto-worker/multilib/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/multilib/lib32/usr/share/glib-2.0/schemas/gschemas.compiled /home/pokybuild/yocto-worker/multilib/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/rootfs/usr/share/glib-2.0/schemas/gschemas.compiled is not the same

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/6745/steps/20/logs/stdio

On 23/02/2023 08:52:56+0100, Markus Volk wrote:
> - Allow to build the gtk4 widget and vapi
>   This is needed to build gtk4 based terminals like blackbox
> - Update dependencies
> - Cleanup recipe
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../vte/{vte_0.70.2.bb => vte_0.70.3.bb}      | 22 +++++++++----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>  rename meta/recipes-support/vte/{vte_0.70.2.bb => vte_0.70.3.bb} (71%)
> 
> diff --git a/meta/recipes-support/vte/vte_0.70.2.bb b/meta/recipes-support/vte/vte_0.70.3.bb
> similarity index 71%
> rename from meta/recipes-support/vte/vte_0.70.2.bb
> rename to meta/recipes-support/vte/vte_0.70.3.bb
> index ec2fb1f522..474ed87a88 100644
> --- a/meta/recipes-support/vte/vte_0.70.2.bb
> +++ b/meta/recipes-support/vte/vte_0.70.3.bb
> @@ -11,34 +11,34 @@ LIC_FILES_CHKSUM = " \
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
>  SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
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
> View/Reply Online (#177605): https://lists.openembedded.org/g/openembedded-core/message/177605
> Mute This Topic: https://lists.openembedded.org/mt/97178843/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

