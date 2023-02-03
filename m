Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62567C05027
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 21:07:52 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.23089.1675458464318621811
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 13:07:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XFLko3NK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D614160003;
	Fri,  3 Feb 2023 21:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675458462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ek27GHscxr247S7oRFcwFX+95Gxw7qMkZzX84l7kHgU=;
	b=XFLko3NKUZqUmylwU+Um2zIaa66SsIkMWTQEk9+uZqRiDUS/Leqc++Ynm4KjWAQrLnD4zR
	NYYm8oFa0snC6k83Wox5fIIRHbXNk2yctfUCBxWvopk/JpIWS7nb8X/aNOkFGVkF6ee9GH
	5E4MWKYhfx+S/aKNOP9fRdOx3H9Td4ft0I74PjFIO3f24BP5ukPWTB7ZBhuzURlTYdWohX
	s7aeKUtrO231aBGLjfnuH37wMsobXyNiSk83Ac9wPwCIhU8jPw54X8rf0whh2rB1CBqUkN
	NnDqPzoYJJkVnZbL7AGrdA/bqQfjep8HPInorIdStGqrClhfozZ1xZ4a1urisg==
Date: Fri, 3 Feb 2023 22:07:41 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Subject: Re: [OE-core] [PATCH 1/2] barebox: add initial support
Message-ID: <Y913nVzEY1/hEsLP@mail.local>
References: <20230203135011.2061939-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203135011.2061939-1-m.felsch@pengutronix.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 21:07:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176753

This breaks oe-selftest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4760/steps/15/logs/stdio

2023-02-03 17:55:08,025 - oe-selftest - INFO - fitimage.FitImageTests.test_sign_cascaded_uboot_fit_image (subunit.RemotedTestCase)
2023-02-03 17:55:08,026 - oe-selftest - INFO -  ... FAIL
Stderr:
2023-02-03 14:32:52,619 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-35279/conf/local.conf
2023-02-03 14:32:52,620 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2023-02-03 17:55:08,026 - oe-selftest - INFO - 13: 4/22 399/509 (54.05s) (0 failed) (fitimage.FitImageTests.test_sign_cascaded_uboot_fit_image)
2023-02-03 17:55:08,026 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/fitimage.py", line 612, in test_sign_cascaded_uboot_fit_image
    bitbake("virtual/bootloader")
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/utils/commands.py", line 236, in bitbake
    return runCmd(cmd, ignore_status, timeout, output_log=output_log, **options)
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
AssertionError: Command 'bitbake  virtual/bootloader' returned non-zero exit status 1:

ERROR: barebox-2023.01.0-r0 do_configure: No defconfig given. Either add file 'file://defconfig' to SRC_URI or set BAREBOX_CONFIG
ERROR: barebox-2023.01.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-35279/tmp/work/qemuarm-poky-linux-gnueabi/barebox/2023.01.0-r0/temp/run.do_configure.3098535', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-35279/tmp/work/qemuarm-poky-linux-gnueabi/barebox/2023.01.0-r0/temp/log.do_configure.3098535
NOTE: recipe barebox-2023.01.0-r0: task do_configure: Failed
ERROR: Task (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-bsp/barebox/barebox_2023.01.0.bb:do_configure) failed with exit code '1'

And as already reported by Richard:

AssertionError: 
The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
barebox-tools (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-bsp/barebox/barebox-tools_2023.01.0.bb)
barebox (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-bsp/barebox/barebox_2023.01.0.bb)

On 03/02/2023 14:50:10+0100, Marco Felsch wrote:
> This adds the support for the barebox bootloader to oe-core. The recipe
> is based on the recipe found in meta-ptx [1] with a few minor adaptions.
> 
> This basic support includes the bootloader and the target tools to
> interact with the bootloader. The host tools support is not part of
> this commit. This will be added later on as separate recipe.
> 
> [1] https://github.com/pengutronix/meta-ptx/tree/master/recipes-bsp/barebox
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  meta/conf/documentation.conf                  |   7 +
>  meta/recipes-bsp/barebox/barebox.inc          | 123 ++++++++++++++++++
>  meta/recipes-bsp/barebox/barebox_2023.01.0.bb |   5 +
>  ...IMAGE_COMPRESSION-per-default-to-lz4.patch |  40 ++++++
>  4 files changed, 175 insertions(+)
>  create mode 100644 meta/recipes-bsp/barebox/barebox.inc
>  create mode 100644 meta/recipes-bsp/barebox/barebox_2023.01.0.bb
>  create mode 100644 meta/recipes-bsp/barebox/files/0001-pbl-set-IMAGE_COMPRESSION-per-default-to-lz4.patch
> 
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index a27d7a53c3..99e8f8e730 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -77,6 +77,13 @@ AUTOREV[doc] = "When SRCREV is set to the value of this variable, it specifies t
>  
>  B[doc] = "The Build Directory. The OpenEmbedded build system places generated objects into the Build Directory during a recipe's build process."
>  BAD_RECOMMENDATIONS[doc] = "A list of packages not to install despite being recommended by a recipe. Support for this variable exists only when using the IPK or RPM packaging backends."
> +BAREBOX_BUILDSYSTEM_VERSION[doc] = "Build system version to add to the barebox image. By default this is the git description of the containing layer."
> +BAREBOX_CONFIG[doc] = "The barebox kconfig defconfig file. Not used if a file called defconfig is added to the SRC_URI."
> +BAREBOX_ENV_DIR[doc] = "Overlay the barebox built-in environment with the environment provided by the BSP if specified."
> +BAREBOX_BINARY[doc] = "Specify the barebox binary to install. If not specified all barebox artifacts are installed."
> +BAREBOX_IMAGE[doc] = "A unique barebox image name. Unused if ${BAREBOX_BINARY} is not set."
> +BAREBOX_SUFFIX[doc] = "Specify the suffix for ${BAREBOX_IMAGE}."
> +BAREBOX_FIRMWARE_DIR[doc] = "Overwrite barebox' firmware blobs search directory (CONFIG_EXTRA_FIRMWARE_DIR) with this path, default ${B}/firmware"
>  BB_DANGLINGAPPENDS_WARNONLY[doc] = "Defines how BitBake handles situations where an append file (.bbappend) has no corresponding recipe file (.bb)."
>  BB_DISKMON_DIRS[doc] = "Monitors disk space and available inodes during the build and allows you to control the build based on these parameters."
>  BB_DISKMON_WARNINTERVAL[doc] = "Defines the disk space and free inode warning intervals. To set these intervals, define the variable in the conf/local.conf file in the Build Directory."
> diff --git a/meta/recipes-bsp/barebox/barebox.inc b/meta/recipes-bsp/barebox/barebox.inc
> new file mode 100644
> index 0000000000..896db9739f
> --- /dev/null
> +++ b/meta/recipes-bsp/barebox/barebox.inc
> @@ -0,0 +1,123 @@
> +SUMMARY = "barebox is a bootloader designed for embedded systems. It runs on a variety of architectures including x86, ARM, MIPS, PowerPC and others."
> +HOMEPAGE = "https://barebox.org/"
> +SECTION = "bootloaders"
> +PROVIDES = "virtual/bootloader"
> +
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +inherit kernel-arch deploy cml1 pkgconfig
> +
> +# libusb1 is only required for usb tools like imx-usb-loader. These tools may
> +# be enabled within the defconfig file so depend on it here to be more user
> +# friendly (do not abort the build). The actual tools are provided by the
> +# barebox-tools package.
> +DEPENDS = "libusb1 bison-native flex-native"
> +
> +export KBUILD_BUILD_USER ?= "oe-user"
> +export KBUILD_BUILD_HOST ?= "oe-host"
> +
> +SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
> +
> +S = "${WORKDIR}/barebox-${PV}"
> +B = "${WORKDIR}/build"
> +
> +def get_layer_rev(path):
> +    try:
> +        rev, _ = bb.process.run("git describe --match='' --always --dirty --broken", cwd=path)
> +    except bb.process.ExecutionError:
> +        rev = ""
> +    return rev.strip()
> +
> +BAREBOX_BUILDSYSTEM_VERSION ??= "${@get_layer_rev(os.path.dirname(d.getVar('FILE')))}"
> +
> +BAREBOX_FIRMWARE_DIR ??= "${B}/firmware"
> +
> +EXTRA_OEMAKE = " \
> +    CROSS_COMPILE=${TARGET_PREFIX} -C ${S} O=${B} \
> +    BUILDSYSTEM_VERSION=${BAREBOX_BUILDSYSTEM_VERSION} \
> +    CONFIG_EXTRA_FIRMWARE_DIR=${BAREBOX_FIRMWARE_DIR} \
> +"
> +
> +BAREBOX_CONFIG ?= ""
> +
> +do_configure() {
> +        if [ -e ${WORKDIR}/defconfig ]; then
> +                cp ${WORKDIR}/defconfig ${B}/.config
> +        else
> +                if [ -n "${BAREBOX_CONFIG}" ]; then
> +                        oe_runmake ${BAREBOX_CONFIG}
> +                else
> +                        bbfatal "No defconfig given. Either add file 'file://defconfig' to SRC_URI or set BAREBOX_CONFIG"
> +                fi
> +        fi
> +
> +        ${S}/scripts/kconfig/merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
> +        cml1_do_configure
> +}
> +
> +BAREBOX_ENV_DIR ??= "${WORKDIR}/env/"
> +
> +do_compile () {
> +        export userccflags="${TARGET_LDFLAGS}${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
> +        unset LDFLAGS
> +        unset CFLAGS
> +        unset CPPFLAGS
> +        unset CXXFLAGS
> +        unset MACHINE
> +
> +        if [ -d ${BAREBOX_ENV_DIR} ]; then
> +                BAREBOX_DEFAULT_ENV="$(grep ^CONFIG_DEFAULT_ENVIRONMENT_PATH .config | cut -d '=' -f 2 | tr -d '"')"
> +                oe_runmake CONFIG_DEFAULT_ENVIRONMENT_PATH="\"${BAREBOX_DEFAULT_ENV} ${BAREBOX_ENV_DIR}\""
> +        else
> +                oe_runmake
> +        fi
> +}
> +
> +BAREBOX_BINARY ??= ""
> +BAREBOX_SUFFIX ??= "img"
> +BAREBOX_SUFFIX:x86 ??= "efi"
> +BAREBOX_SUFFIX:x86-64 ??= "efi"
> +BAREBOX_IMAGE ?= "${PN}-${MACHINE}-${PV}-${PR}.${BAREBOX_SUFFIX}"
> +
> +do_install () {
> +        if [ -n "${BAREBOX_BINARY}" ]; then
> +
> +                BAREBOX_BIN=${B}/${BAREBOX_BINARY}
> +                if [ ! -f "${BAREBOX_BIN}" ]; then
> +                        BAREBOX_BIN=${B}/images/${BAREBOX_BINARY}
> +                fi
> +                if [ ! -f "${BAREBOX_BIN}" ]; then
> +                        bbfatal "Failed to locate ${BAREBOX_BINARY}"
> +                fi
> +
> +                install -D -m 644 ${BAREBOX_BIN} ${D}/boot/${BAREBOX_IMAGE}
> +                ln -sf ${BAREBOX_IMAGE} ${D}/boot/${BAREBOX_BINARY}
> +        else
> +                install -d ${D}/boot/
> +                for image in $(cat ${B}/barebox-flash-images); do
> +                        install -m 644 ${B}/${image} ${D}/boot/
> +                done
> +        fi
> +}
> +FILES:${PN} = "/boot"
> +
> +do_deploy () {
> +        if [ -n "${BAREBOX_BINARY}" ]; then
> +
> +                BAREBOX_BIN=${B}/${BAREBOX_BINARY}
> +                if [ ! -f "${BAREBOX_BIN}" ]; then
> +                        BAREBOX_BIN=${B}/images/${BAREBOX_BINARY}
> +                fi
> +
> +                install -D -m 644 ${BAREBOX_BIN} ${DEPLOYDIR}/${BAREBOX_IMAGE}
> +                ln -sf ${BAREBOX_IMAGE} ${DEPLOYDIR}/${BAREBOX_BINARY}
> +        else
> +                for image in $(cat ${B}/barebox-flash-images); do
> +                        cp ${B}/${image} ${DEPLOYDIR}
> +                done
> +        fi
> +}
> +addtask deploy after do_compile
> diff --git a/meta/recipes-bsp/barebox/barebox_2023.01.0.bb b/meta/recipes-bsp/barebox/barebox_2023.01.0.bb
> new file mode 100644
> index 0000000000..ca0c1566cf
> --- /dev/null
> +++ b/meta/recipes-bsp/barebox/barebox_2023.01.0.bb
> @@ -0,0 +1,5 @@
> +require barebox.inc
> +
> +SRC_URI[sha256sum] = "20532daff1720fbefa0e02dba0294e6817d29c155f49b9b549db9577435fc7b6"
> +
> +SRC_URI += "file://0001-pbl-set-IMAGE_COMPRESSION-per-default-to-lz4.patch"
> diff --git a/meta/recipes-bsp/barebox/files/0001-pbl-set-IMAGE_COMPRESSION-per-default-to-lz4.patch b/meta/recipes-bsp/barebox/files/0001-pbl-set-IMAGE_COMPRESSION-per-default-to-lz4.patch
> new file mode 100644
> index 0000000000..f37d608cf6
> --- /dev/null
> +++ b/meta/recipes-bsp/barebox/files/0001-pbl-set-IMAGE_COMPRESSION-per-default-to-lz4.patch
> @@ -0,0 +1,40 @@
> +From d8ea183cc1894b04b12f466a8779e61f0c1ac681 Mon Sep 17 00:00:00 2001
> +From: Marco Felsch <m.felsch@pengutronix.de>
> +Date: Tue, 6 Dec 2022 12:26:14 +0100
> +Subject: [PATCH] pbl: set IMAGE_COMPRESSION per default to lz4
> +
> +The LZO compression hasn't been updated since 2017 and embedded build
> +tools like Yocto dropping the support for it [1]. So switch to LZ4 as
> +default since this seems to be the most comparable compression standard
> +according Ahmads measurements [2] and the kernel suggestion [3].
> +
> +[1] https://lore.kernel.org/all/20220524152401.1663317-9-ross.burton@arm.com/
> +[2] https://lore.barebox.org/barebox/20220713100922.1880282-1-a.fatoum@pengutronix.de/
> +[3] https://lkml.org/lkml/2020/7/1/848
> +
> +Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> +Link: https://lore.barebox.org/20221206112614.2612071-1-m.felsch@pengutronix.de
> +Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> +
> +Upstream-Status: Backport
> +[https://git.pengutronix.de/cgit/barebox/commit/?h=next&id=d8ea183cc1894b04b12f466a8779e61f0c1ac681]
> +---
> + pbl/Kconfig | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/pbl/Kconfig b/pbl/Kconfig
> +index ba809af2d5..91970c19bc 100644
> +--- a/pbl/Kconfig
> ++++ b/pbl/Kconfig
> +@@ -63,7 +63,7 @@ if IMAGE_COMPRESSION
> + 
> + choice
> + 	prompt "Compression"
> +-	default IMAGE_COMPRESSION_LZO
> ++	default IMAGE_COMPRESSION_LZ4
> + 
> + config IMAGE_COMPRESSION_LZ4
> + 	bool "lz4"
> +-- 
> +2.30.2
> +
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176716): https://lists.openembedded.org/g/openembedded-core/message/176716
> Mute This Topic: https://lists.openembedded.org/mt/96722579/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

