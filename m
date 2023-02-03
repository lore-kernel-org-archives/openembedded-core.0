Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E1BC05027
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 18:12:01 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.18551.1675447920681937869
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 10:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TDoip1oT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 67BBF240004;
	Fri,  3 Feb 2023 18:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675447918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k66dJobyyu+fTqeTftnf5Xq6pgVrwl+fMfMOM9cCBh4=;
	b=TDoip1oTCkIMpFmKHelwL4aJSqpCKW3V2bFriXDWF1anLpkU+O/yere99w0GDzsk2lbA3v
	FIQuil6PKLl2oO3CsUmZhzTLuQt3N46ZTfs0hYtk77y696ZQOqourKvfg5aFk6FJb1beyt
	dIIBJkeSSTsZPWP+I/vzR5GkMiBuX6UY59tGUtaKxWlsHQ6U9+KQ3ZDYU0yePgLzfwrXxG
	LDL/F/O3/C1H4rljnOGnQsMe10Z1xGmIUvm04VbCVeFdclteMpX4WPDIUmWh3Bc1JgmM9I
	owvBRtV6SY5IqN/Dd4bJ4lcIfQVkzZliVdUenNR6hlQuAEGkW6raNq0cKNUcqA==
Date: Fri, 3 Feb 2023 19:11:58 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Subject: Re: [OE-core] [PATCH 2/2] barebox-tools: add initial barebox tools
 support
Message-ID: <Y91ObtiQCtnpGaRH@mail.local>
References: <20230203135011.2061939-1-m.felsch@pengutronix.de>
 <20230203135011.2061939-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203135011.2061939-2-m.felsch@pengutronix.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 18:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176749

Hello,

kwboot fails with musl:

|   CC [U]  scripts/kwboot-target
| In file included from /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2023.01.0-r0/barebox-2023.01.0/scripts/kwboot-target.c:1:
| /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2023.01.0-r0/barebox-2023.01.0/scripts/kwboot.c: In function 'kwboot_tty_recv':
| /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2023.01.0-r0/barebox-2023.01.0/scripts/kwboot.c:141:9: error: unknown type name 'fd_set'
|   141 |         fd_set rfds;
|       |         ^~~~~~
| /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2023.01.0-r0/barebox-2023.01.0/scripts/kwboot.c:142:24: error: storage size of 'tv' isn't known
|   142 |         struct timeval tv;
|       |                        ^~
| /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2023.01.0-r0/barebox-2023.01.0/scripts/kwboot.c:147:9: warning: implicit declaration of function 'FD_ZERO' [-Wimplicit-function-declaration]
|   147 |         FD_ZERO(&rfds);
|       |         ^~~~~~~
| /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2023.01.0-r0/barebox-2023.01.0/scripts/kwboot.c:148:9: warning: implicit declaration of function 'FD_SET'; did you mean 'L_SET'? [-Wimplicit-function-declaration]
|   148 |         FD_SET(fd, &rfds);
|       |         ^~~~~~
|       |         L_SET
| /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2023.01.0-r0/barebox-2023.01.0/scripts/kwboot.c:157:24: warning: implicit declaration of function 'select' [-Wimplicit-function-declaration]
|   157 |                 nfds = select(fd + 1, &rfds, NULL, NULL, &tv);
|       |                        ^~~~~~
| /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2023.01.0-r0/barebox-2023.01.0/scripts/kwboot.c:142:24: warning: unused variable 'tv' [-Wunused-variable]
|   142 |         struct timeval tv;
|       |                        ^~
| /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2023.01.0-r0/barebox-2023.01.0/scripts/kwboot.c: In function 'kwboot_terminal':
| /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2023.01.0-r0/barebox-2023.01.0/scripts/kwboot.c:571:17: error: unknown type name 'fd_set'
|   571 |                 fd_set rfds;
|       |                 ^~~~~~
| /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2023.01.0-r0/barebox-2023.01.0/scripts/kwboot.c:586:21: warning: implicit declaration of function 'FD_ISSET' [-Wimplicit-function-declaration]
|   586 |                 if (FD_ISSET(tty, &rfds)) {
|       |                     ^~~~~~~~
| make[2]: *** [scripts/Makefile.userprogs:28: scripts/kwboot-target] Error 1
| ERROR: oe_runmake failed
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2023.01.0-r0/build'
| make: Leaving directory '/home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2023.01.0-r0/barebox-2023.01.0'
| WARNING: /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2023.01.0-r0/temp/run.do_compile.3586889:170 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| make[1]: *** [/home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2023.01.0-r0/barebox-2023.01.0/Makefile:976: scripts] Error 2
| make: *** [Makefile:180: sub-make] Error 2
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2023.01.0-r0/temp/run.do_compile.3586889, line 170
| 	#2: die, /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2023.01.0-r0/temp/run.do_compile.3586889, line 154
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2023.01.0-r0/temp/run.do_compile.3586889, line 149
| 	#4: do_compile, /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2023.01.0-r0/temp/run.do_compile.3586889, line 144
| 	#5: main, /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2023.01.0-r0/temp/run.do_compile.3586889, line 183
NOTE: recipe barebox-tools-2023.01.0-r0: task do_compile: Failed
ERROR: Task (/home/pokybuild/yocto-worker/musl-qemux86-64/build/meta/recipes-bsp/barebox/barebox-tools_2023.01.0.bb:do_compile) failed with exit code '1'


https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/6628/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/6609/steps/12/logs/stdio


On 03/02/2023 14:50:11+0100, Marco Felsch wrote:
> Add initial support to build the barebox tools for the host and the
> target.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../barebox/barebox-tools_2023.01.0.bb        | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 meta/recipes-bsp/barebox/barebox-tools_2023.01.0.bb
> 
> diff --git a/meta/recipes-bsp/barebox/barebox-tools_2023.01.0.bb b/meta/recipes-bsp/barebox/barebox-tools_2023.01.0.bb
> new file mode 100644
> index 0000000000..b1f7aa0b91
> --- /dev/null
> +++ b/meta/recipes-bsp/barebox/barebox-tools_2023.01.0.bb
> @@ -0,0 +1,56 @@
> +SUMMARY = "barebox bootloader tools"
> +HOMEPAGE = "https://barebox.org/"
> +
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
> +
> +DEPENDS = "libusb1 bison-native flex-native"
> +
> +SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
> +SRC_URI[sha256sum] = "20532daff1720fbefa0e02dba0294e6817d29c155f49b9b549db9577435fc7b6"
> +
> +S = "${WORKDIR}/barebox-${PV}"
> +B = "${WORKDIR}/build"
> +
> +inherit pkgconfig
> +
> +EXTRA_OEMAKE = " \
> +  ARCH=sandbox \
> +  CROSS_COMPILE=${TARGET_PREFIX} -C ${S} O=${B} \
> +  CROSS_PKG_CONFIG=pkg-config \
> +  "
> +
> +do_compile:class-target () {
> +    export userccflags="${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
> +    export userldflags="${TARGET_LDFLAGS}${TOOLCHAIN_OPTIONS}"
> +    oe_runmake targettools_defconfig
> +    oe_runmake scripts
> +}
> +
> +do_compile:class-native () {
> +    oe_runmake hosttools_defconfig
> +    oe_runmake scripts
> +}
> +
> +BAREBOX_TOOLS = " \
> +         bareboxenv \
> +         bareboxcrc32 \
> +         kernel-install \
> +         bareboximd \
> +         omap3-usb-loader \
> +         omap4_usbboot \
> +         imx/imx-usb-loader \
> +         "
> +
> +BAREBOX_TOOLS_SUFFIX = ""
> +BAREBOX_TOOLS_SUFFIX:class-target = "-target"
> +
> +do_install () {
> +	install -d ${D}${bindir}
> +
> +	for tool in ${BAREBOX_TOOLS}; do
> +		install -m 0755 scripts/${tool}${BAREBOX_TOOLS_SUFFIX} ${D}${bindir}/${tool##*/}
> +	done
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176715): https://lists.openembedded.org/g/openembedded-core/message/176715
> Mute This Topic: https://lists.openembedded.org/mt/96722578/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

