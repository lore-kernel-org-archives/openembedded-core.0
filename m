Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 993F9C76195
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 07:22:54 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.60540.1679988168347001735
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 00:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iBrTBBk0;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EBA7D100010;
	Tue, 28 Mar 2023 07:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679988166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sfGIhgLk+UglrJqiegbB8XoPF2I5IqF1KOejTZsIM18=;
	b=iBrTBBk0szXGJG7yI7uCFqp3ugQY5j49UFKCPCC0FsAyq069SOOV0BWIwuc8CPOk4sKCMN
	+Ab+r+RTH4tIGdk6+0tr/XRjIfz3+NrXZ8yC9JuE+DcyeW6NQ4mBhkjnngVlPYBdxoixE+
	f7G0ai+7QMd/qWZ0XM2QuT7g1LnfK4+eUiSUPyUegbaKJ5ZFQaOB08N7UtIw4Wv6cTTyc/
	d89yLLgstiLhIRpfL1BAmvGurMOE6OLUYfG61l7wggvI68fww0eqjd+hHB7HXf7XKdaUZj
	tatT/DXBDGvhERXoMyUZa/tMNF8BVQsXNgzLwZEQe1xk5os3FlSXJthWg2cddw==
Date: Tue, 28 Mar 2023 09:22:45 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Petr =?utf-8?B?S3ViaXrFiMOhaw==?= <kubiznak@2n.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v3 1/6] gobject-introspection: reduce
 dependencies
Message-ID: <202303280722455a5d62af@mail.local>
References: <20230324152238.194877-1-kubiznak@2n.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230324152238.194877-1-kubiznak@2n.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 07:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179204

Hello,

This series seems to break the qemux86-64-x32 build:

https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/6763/steps/12/logs/stdio

| Program glib-mkenums mkenums found: NO
| 
| ../libgudev-237/gudev/meson.build:40:0: ERROR: Program 'glib-mkenums mkenums' not found or not executable
| 
| A full log can be found at /home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_64_x32-poky-linux-gnux32/libgudev/237-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_64_x32-poky-linux-gnux32/libgudev/237-r0/temp/run.do_configure.3177824:183 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_64_x32-poky-linux-gnux32/libgudev/237-r0/temp/run.do_configure.3177824, line 183
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_64_x32-poky-linux-gnux32/libgudev/237-r0/temp/run.do_configure.3177824, line 172
| 	#3: do_configure, /home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_64_x32-poky-linux-gnux32/libgudev/237-r0/temp/run.do_configure.3177824, line 158
| 	#4: main, /home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_64_x32-poky-linux-gnux32/libgudev/237-r0/temp/run.do_configure.3177824, line 196
NOTE: recipe libgudev-237-r0: task do_configure: Failed
ERROR: Task (/home/pokybuild/yocto-worker/qemux86-64-x32/build/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure) failed with exit code '1'

On 24/03/2023 16:22:33+0100, Petr Kubizňák wrote:
> When GI_DATA_ENABLED is 'False' (e.g. because
> 'gobject-introspection-data' is not in DISTRO_FEATURES),
> gobject-introspection, gobject-introspection-native and qemu-native
> should not be added to DEPENDS. This is to reduce dependency chain
> when g-i is disabled.
> 
> Signed-off-by: Petr Kubizňák <kubiznak@2n.com>
> ---
>  meta/classes-recipe/gobject-introspection.bbclass | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes-recipe/gobject-introspection.bbclass b/meta/classes-recipe/gobject-introspection.bbclass
> index 0c7b7d200a..98edb93761 100644
> --- a/meta/classes-recipe/gobject-introspection.bbclass
> +++ b/meta/classes-recipe/gobject-introspection.bbclass
> @@ -35,7 +35,7 @@ EXTRA_OEMESON:prepend:class-nativesdk = "${@['', '${GIRMESONBUILD}'][d.getVar('G
>  
>  # Generating introspection data depends on a combination of native and target
>  # introspection tools, and qemu to run the target tools.
> -DEPENDS:append:class-target = " gobject-introspection gobject-introspection-native qemu-native"
> +DEPENDS:append:class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'gobject-introspection gobject-introspection-native qemu-native', '', d)}"
>  
>  # Even though introspection is disabled on -native, gobject-introspection package is still
>  # needed for m4 macros.
> @@ -46,10 +46,12 @@ DEPENDS:append:class-nativesdk = " gobject-introspection-native"
>  export XDG_DATA_DIRS = "${STAGING_DATADIR}:${STAGING_LIBDIR}"
>  
>  do_configure:prepend:class-target () {
> -    # introspection.m4 pre-packaged with upstream tarballs does not yet
> -    # have our fixes
> -    mkdir -p ${S}/m4
> -    cp ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}/m4
> +    if [ "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '1', '0', d)}" = "1" ] ; then
> +        # introspection.m4 pre-packaged with upstream tarballs does not yet
> +        # have our fixes
> +        mkdir -p ${S}/m4
> +        cp ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}/m4
> +    fi
>  }
>  
>  # .typelib files are needed at runtime and so they go to the main package (so
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179062): https://lists.openembedded.org/g/openembedded-core/message/179062
> Mute This Topic: https://lists.openembedded.org/mt/97825893/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

