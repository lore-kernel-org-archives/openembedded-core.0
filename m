Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D58C433FE
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 22:11:58 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.2530.1668377513943081294
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 14:11:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Rz6LdPxb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1F6A21C0003;
	Sun, 13 Nov 2022 22:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668377511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zdrWma0iB10rajx6JhkfNbIlaz0Ety6wYUrTtYVVs/s=;
	b=Rz6LdPxb8Bjr55vXSB58YBU9l6XYUh/bRRcO6LxLlskxuXJhuJr+Jni3+OfcQ5uyWokPEA
	dCA8fqQL8iDqgF7JG6z5ri/8giUdRguvyjrxXm0O/LwwHFwlUk8+XRKpfB3JVBgj5n1uLL
	HxV9iWRffXv5mD8NErZvG/i8625gB8vpnUxoE4TDvZ/bV1sys2JhxjaiV5ONYe3yNzu0s/
	zROLyfWBf/u5f1/tC0IreRS3BmmSNZaal8A2sSL0Wzv/srY61JQHt8Y5BAUea3PYAeNro5
	DpUqQkXM/jfm4qDM2nwtoqIu7DV8G6sWDNwjlU3Ro6gu53XwUcnUU1qYL3/adA==
Date: Sun, 13 Nov 2022 23:11:50 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: jorcrous@amazon.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/3] vulkan-validation: Add the official Vulkan
 validation layers
Message-ID: <Y3Frpp2ImWRduS8k@mail.local>
References: <20221110204232.12768-1-jorcrous@amazon.com>
 <20221110204232.12768-4-jorcrous@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110204232.12768-4-jorcrous@amazon.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 22:11:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173212

Hello,

On 10/11/2022 20:42:32+0000, Jordan Crouse via lists.openembedded.org wrote:
> Add a recipe to build the Khronos official Vulkan validation layers that can
> assist developers in verifying that their applications correctly use the
> Vulkan APIs.
> 


This failed on the autobuilders:

NOTE: recipe vulkan-validation-1.3.231.1-r0: task do_compile: Started
ERROR: vulkan-validation-1.3.231.1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/vulkan-validation/1.3.231.1-r0/temp/run.do_compile.3939056', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/vulkan-validation/1.3.231.1-r0/temp/log.do_compile.3939056
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/vulkan-validation/1.3.231.1-r0/build --target all --
| ninja: error: '/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/vulkan-validation/1.3.231.1-r0/recipe-sysroot/usr/lib', needed by 'layers/libVkLayer_khronos_validation.so', missing and no known rule to make it
| WARNING: /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/vulkan-validation/1.3.231.1-r0/temp/run.do_compile.3939056:153 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/vulkan-validation/1.3.231.1-r0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/vulkan-validation/1.3.231.1-r0/temp/run.do_compile.3939056, line 153
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/vulkan-validation/1.3.231.1-r0/temp/run.do_compile.3939056, line 147
| 	#3: do_compile, /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/vulkan-validation/1.3.231.1-r0/temp/run.do_compile.3939056, line 142
| 	#4: main, /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/vulkan-validation/1.3.231.1-r0/temp/run.do_compile.3939056, line 166
NOTE: recipe vulkan-validation-1.3.231.1-r0: task do_compile: Failed
ERROR: Task (/home/pokybuild/yocto-worker/qemux86-world/build/meta/recipes-graphics/vulkan/vulkan-validation_1.3.231.1.bb:do_compile) failed with exit code '1'


https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/6064/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/3735/steps/12/logs/stdio

> Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
> ---
> 
>  .../vulkan/vulkan-validation_1.3.231.1.bb     | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 meta/recipes-graphics/vulkan/vulkan-validation_1.3.231.1.bb
> 
> diff --git a/meta/recipes-graphics/vulkan/vulkan-validation_1.3.231.1.bb b/meta/recipes-graphics/vulkan/vulkan-validation_1.3.231.1.bb
> new file mode 100644
> index 0000000000..3d592fe24a
> --- /dev/null
> +++ b/meta/recipes-graphics/vulkan/vulkan-validation_1.3.231.1.bb
> @@ -0,0 +1,46 @@
> +SUMMARY = "Vulkan Validation layers"
> +DESCRIPTION = "Khronos official Vulkan validation layers to assist developers \
> +in verifying that their applications correctly use the Vulkan API"
> +HOMEPAGE = "https://www.khronos.org/vulkan/"
> +BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-ValidationLayers"
> +SECTION = "libs"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8df9e8826734226d08cb412babfa599c"
> +SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=sdk-1.3.231;protocol=https"
> +
> +SRCREV="f489610de566df6a5c20de1a3e54776e0ad852e1"
> +
> +S = "${WORKDIR}/git"
> +
> +REQUIRED_DISTRO_FEATURES = "vulkan"
> +
> +inherit cmake features_check pkgconfig
> +
> +DEPENDS += "vulkan-headers"
> +DEPENDS += "spirv-headers spirv-tools"
> +DEPENDS += "vulkan-loader"
> +DEPENDS += "glslang"
> +
> +EXTRA_OECMAKE = "\
> +                 -DBUILD_TESTS=OFF \
> +                 -DPYTHON_EXECUTABLE=${HOSTTOOLS_DIR}/python3 \
> +                 -DASSEMBLER_WORKS=FALSE \
> +                 -DVULKAN_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
> +                 -DGLSLANG_INSTALL_DIR=${STAGING_DATADIR} \
> +                 -DSPIRV_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
> +                 -DUSE_ROBIN_HOOD_HASHING=OFF \
> +                 "
> +
> +PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF, libxcb libx11 libxrandr"
> +PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland"
> +
> +FILES:${PN} += "/usr/share/vulkan/ /usr/lib/"
> +
> +INSANE_SKIP:${PN} += " ldflags"
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_SYSROOT_STRIP = "1"
> +SOLIBS = ".so"
> +FILES_SOLIBSDEV = ""
> +
> +UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
> -- 
> 2.37.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173105): https://lists.openembedded.org/g/openembedded-core/message/173105
> Mute This Topic: https://lists.openembedded.org/mt/94945225/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

