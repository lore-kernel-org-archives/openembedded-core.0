Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006CFC2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 13:24:39 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.172382.1719321874588260891
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jun 2024 06:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Dk2Srun7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7414B40006;
	Tue, 25 Jun 2024 13:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719321872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bR7v36c2jVyTl1RgHXfqJHhCMYMmTOoT30AOoHjk4jM=;
	b=Dk2Srun7lm3YS3y3zzKhjOEDhbhARHnaDVmxM7LXlvMR6uGJ2hG8Cav/mbr7poQ7AGBs11
	fhsDtXz6ILs7VsRSYgR9NISyqFObaWr+1hHfJhsN436J6KL1L37aKvDKeKr5Aac8LyTvqa
	L2nXtPUp5gB4e9SSM2PZF7+OE9dZQGuLoEsYnkWyMotXSMMxVmQSQc9/KAF7Q1g17i4wm8
	HUgpTN/jXGSjZ/bnfSlNAmmEKNnkYEaHFXfUM0F165ArL5+6s+h4HKTAoM8s2WZLz8PmKV
	2dM96UvehNK8HDG76ATd3gzajMEU+ug745oY4g0W3ZNDd8nA09ccQgc6BlZ91Q==
Date: Tue, 25 Jun 2024 15:24:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?iso-8859-1?B?R3XwbmkgTeFy?= Gilbert <gudni.m.g@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] gobject-introspection: split tools and
 giscanner into a separate package
Message-ID: <20240625132432c4f9913e@mail.local>
References: <20240624203215.2470081-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240624203215.2470081-1-gudni.m.g@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 13:24:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201134

This fails with:

ERROR: gobject-introspection-1.80.1-r0 do_package_qa: QA Issue: /usr/lib/gobject-introspection/giscanner/_giscanner.cpython-312-x86_64-linux-gnux32.so contained in package gobject-introspection-tools requires libglib-2.0.so.0, but no providers found in RDEPENDS:gobject-introspection-tools? [file-rdeps]
ERROR: gobject-introspection-1.80.1-r0 do_package_qa: QA Issue: /usr/lib/gobject-introspection/giscanner/_giscanner.cpython-312-x86_64-linux-gnux32.so contained in package gobject-introspection-tools requires libgobject-2.0.so.0, but no providers found in RDEPENDS:gobject-introspection-tools? [file-rdeps]
ERROR: gobject-introspection-1.80.1-r0 do_package_qa: QA Issue: /usr/lib/gobject-introspection/giscanner/_giscanner.cpython-312-x86_64-linux-gnux32.so contained in package gobject-introspection-tools requires libgio-2.0.so.0, but no providers found in RDEPENDS:gobject-introspection-tools? [file-rdeps]
NOTE: recipe xinput-1.6.4-r0: task do_create_runtime_spdx: Succeeded
ERROR: gobject-introspection-1.80.1-r0 do_package_qa: Fatal QA errors were found, failing task.

https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/8998/steps/11/logs/stdio

On 24/06/2024 20:32:15+0000, Gu�ni M�r Gilbert wrote:
> The tools and giscanner require python3-setuptools at runtime. This increases
> the image size quite a bit (on my end ~1.7MB compressed). Most users don't need
> these tools in the final image so make them optional.
> 
> This commit introduces a new packcage gobject-introspection-tools
> 
> Signed-off-by: Gu�ni M�r Gilbert <gudni.m.g@gmail.com>
> ---
>  .../gobject-introspection_1.80.1.bb           | 21 +++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb
> index 582ac248fd..9c1945d639 100644
> --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb
> +++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb
> @@ -26,7 +26,8 @@ GTKDOC_MESON_OPTION = "gtk_doc"
>  
>  MULTILIB_SCRIPTS = "${PN}:${bindir}/g-ir-annotation-tool ${PN}:${bindir}/g-ir-scanner"
>  
> -DEPENDS += " libffi zlib python3 flex-native bison-native"
> +# setuptools are required to provide distutils to build the tools
> +DEPENDS += " libffi zlib python3 python3-setuptools flex-native bison-native"
>  DEPENDS:append:class-native = " glib-2.0"
>  DEPENDS:append:class-target = " glib-2.0-initial"
>  
> @@ -169,6 +170,20 @@ gi_package_preprocess() {
>  
>  SSTATE_SCAN_FILES += "g-ir-scanner-qemuwrapper g-ir-scanner-wrapper g-ir-compiler-wrapper g-ir-scanner-lddwrapper Gio-2.0.gir postinst-ldsoconf-${PN}"
>  
> +PACKAGES =+ "\
> +        ${PN}-tools \
> +"
> +
> +FILES:${PN}-tools = "\
> +        ${bindir}/g-ir-annotation-tool \
> +        ${bindir}/g-ir-compiler \
> +        ${bindir}/g-ir-generate \
> +        ${bindir}/g-ir-generate \
> +        ${bindir}/g-ir-inspect \
> +        ${bindir}/g-ir-scanner \
> +        ${libdir}/gobject-introspection/giscanner \
> +"
> +
>  # .typelib files are needed at runtime and so they go to the main package
>  FILES:${PN}:append = " ${libdir}/girepository-*/*.typelib"
>  
> @@ -190,7 +205,9 @@ FILES:${PN}-dev:append = " ${datadir}/gobject-introspection-1.0/tests/*.c \
>  FILES:${PN}-dbg += "${libdir}/gobject-introspection/giscanner/.debug/"
>  FILES:${PN}-staticdev += "${libdir}/gobject-introspection/giscanner/*.a"
>  
> +RDEPENDS:${PN} = "python3-pickle python3-xml glib-2.0"
> +
>  # setuptools can be removed when upstream removes all uses of distutils
> -RDEPENDS:${PN} = "python3-pickle python3-xml python3-setuptools glib-2.0"
> +RDEPENDS:${PN}-tools = "${PN} python3-setuptools"
>  
>  BBCLASSEXTEND = "native"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201113): https://lists.openembedded.org/g/openembedded-core/message/201113
> Mute This Topic: https://lists.openembedded.org/mt/106857943/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

