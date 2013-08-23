Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id A81DB60896
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 20:00:24 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 Aug 2013 13:00:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,944,1367996400"; d="scan'208";a="285985990"
Received: from unknown (HELO [10.255.15.65]) ([10.255.15.65])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Aug 2013 13:00:23 -0700
Message-ID: <5217BF57.2080904@linux.intel.com>
Date: Fri, 23 Aug 2013 13:00:23 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1377281368-11114-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1377281368-11114-1-git-send-email-otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot, u-boot-fw-utils-cross, u-boot-mkimage: Upgrade to 2013.07
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Aug 2013 20:00:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/23/2013 11:09 AM, Otavio Salvador wrote:
> This upgrades the U-Boot for 2013.07 release. This removes the
> 2011.03, 2011.06 and 2013.01.01 versions so we keep a single one in
> core. The following recipes has been upgraded:
>
>   - u-boot
>   - u-boot-mkimage
>   - u-boot-fw-utils -> u-boot-fw-utils-cross (renamed)
>
> The 2013.07 u-boot and u-boot-mkimage recipe updates were based on a
> patch sent by Laszlo Papp <lpapp@kde.org> but the
> u-boot-fw-utils-cross needed some more work as it uses the
> UBOOT_MACHINE to find default environment for use so it is indeed a
> cross binary and not a native one.
>

As I have mentioned before, until we have a solid test against the 
reference bsps in Poky, I will not accept a straight-up update, the last 
version of 2013.01.01 has a DEFAULT_PREFERENCE = "-1", so it's not used, 
it was also pointed out that we accidently drop the 2012.04 version with 
the MPC8315e-rdb was relying on.

I will take the addition, until we have some test results against the 
core bsps that say it works for them, then we can clean this up.

We can't break the reference boards when we are about to release.

Sau!


> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>   .../u-boot/files/fix-arm920t-eabi.patch            | 24 -------
>   .../u-boot/u-boot-fw-utils-cross_2013.07.bb        | 38 ++++++++++
>   meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb | 28 --------
>   .../u-boot/u-boot-fw-utils_2013.01.01.bb           | 33 ---------
>   ...Drop-config.h-include-in-tools-imximage.h.patch | 39 ----------
>   ...ove-LDSCRIPT-processing-to-the-top-level-.patch | 82 ----------------------
>   ...Drop-config.h-include-in-tools-imximage.h.patch | 39 ----------
>   ...ove-LDSCRIPT-processing-to-the-top-level-.patch | 82 ----------------------
>   meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb  | 31 --------
>   meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb  | 29 --------
>   ...age_2013.01.01.bb => u-boot-mkimage_2013.07.bb} | 10 +--
>   meta/recipes-bsp/u-boot/u-boot_2011.03.bb          | 24 -------
>   meta/recipes-bsp/u-boot/u-boot_2011.06.bb          | 24 -------
>   .../{u-boot_2013.01.01.bb => u-boot_2013.07.bb}    | 13 ++--
>   14 files changed, 46 insertions(+), 450 deletions(-)
>   delete mode 100644 meta/recipes-bsp/u-boot/files/fix-arm920t-eabi.patch
>   create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb
>   delete mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
>   delete mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.01.01.bb
>   delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
>   delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
>   delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch
>   delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
>   delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb
>   delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
>   rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2013.01.01.bb => u-boot-mkimage_2013.07.bb} (72%)
>   delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>   delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>   rename meta/recipes-bsp/u-boot/{u-boot_2013.01.01.bb => u-boot_2013.07.bb} (69%)
>
> diff --git a/meta/recipes-bsp/u-boot/files/fix-arm920t-eabi.patch b/meta/recipes-bsp/u-boot/files/fix-arm920t-eabi.patch
> deleted file mode 100644
> index d614442..0000000
> --- a/meta/recipes-bsp/u-boot/files/fix-arm920t-eabi.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> ----
> - cpu/arm920t/config.mk |    4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> ---- u-boot-1.3.2.orig/cpu/arm920t/config.mk
> -+++ u-boot-1.3.2/cpu/arm920t/config.mk
> -@@ -22,13 +22,13 @@
> - #
> -
> - PLATFORM_RELFLAGS += -fno-strict-aliasing  -fno-common -ffixed-r8 \
> - 	-msoft-float
> -
> --PLATFORM_CPPFLAGS += -march=armv4
> -+#PLATFORM_CPPFLAGS += -march=armv4
> - # =========================================================================
> - #
> - # Supply options according to compiler version
> - #
> - # =========================================================================
> --PLATFORM_CPPFLAGS +=$(call cc-option,-mapcs-32,-mabi=apcs-gnu)
> -+PLATFORM_CPPFLAGS +=$(call cc-option)
> - PLATFORM_RELFLAGS +=$(call cc-option,-mshort-load-bytes,$(call cc-option,-malignment-traps,))
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb
> new file mode 100644
> index 0000000..7f649ca
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb
> @@ -0,0 +1,38 @@
> +DESCRIPTION = "U-boot bootloader fw_printenv/setenv utils"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
> +SECTION = "bootloader"
> +DEPENDS = "mtd-utils"
> +
> +# This revision corresponds to the tag "v2013.07"
> +# We use the revision in order to avoid having to fetch it from the
> +# repo during parse
> +SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
> +
> +PV = "v2013.07+git${SRCPV}"
> +
> +SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cross
> +
> +EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
> +
> +do_compile () {
> +  oe_runmake ${UBOOT_MACHINE}
> +  oe_runmake env
> +}
> +
> +do_install () {
> +  install -d ${D}${bindir_cross}
> +  install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_printenv
> +  install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_setenv
> +}
> +
> +SYSROOT_PREPROCESS_FUNCS = "uboot_fw_utils_cross"
> +uboot_fw_utils_cross() {
> +    sysroot_stage_dir ${D}${bindir_cross} ${SYSROOT_DESTDIR}${bindir_cross}
> +}
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
> deleted file mode 100644
> index 7c4df1a..0000000
> --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -DESCRIPTION = "U-boot bootloader fw_printenv/setenv utils"
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
> -                    file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90"
> -SECTION = "bootloader"
> -
> -DEPENDS = "mtd-utils"
> -
> -PR = "r1"
> -
> -SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
> -
> -SRC_URI[md5sum] = "0cc5026aad02f218a9b9ac56b301c97a"
> -SRC_URI[sha256sum] = "362ddb935885da98cf461eba08f31e3e59d0c4ada6cb2fa15596f43af310ba8b"
> -
> -S = "${WORKDIR}/u-boot-${PV}"
> -
> -EXTRA_OEMAKE = 'HOSTCC="${CC}"'
> -
> -do_compile () {
> -  oe_runmake env
> -}
> -
> -do_install () {
> -  install -d ${D}${base_sbindir}
> -  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
> -  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
> -}
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.01.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.01.01.bb
> deleted file mode 100644
> index efa418f..0000000
> --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.01.01.bb
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -DESCRIPTION = "U-boot bootloader fw_printenv/setenv utils"
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
> -SECTION = "bootloader"
> -
> -DEPENDS = "mtd-utils"
> -
> -# This is needs to be validated among supported BSP's before we can
> -# make it default
> -DEFAULT_PREFERENCE = "-1"
> -
> -# This revision corresponds to the tag "v2013.01.01"
> -# We use the revision in order to avoid having to fetch it from the
> -# repo during parse
> -SRCREV = "e8ae0fa5edd152b2b29c470b88429be4cdcd2c46"
> -
> -PV = "v2013.01.01+git${SRCPV}"
> -
> -SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
> -
> -S = "${WORKDIR}/git"
> -
> -EXTRA_OEMAKE = 'HOSTCC="${CC}"'
> -
> -do_compile () {
> -  oe_runmake env
> -}
> -
> -do_install () {
> -  install -d ${D}${base_sbindir}
> -  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
> -  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
> -}
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch b/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
> deleted file mode 100644
> index 0405834..0000000
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From ce56e089ddb51dbd81bb2c86b1646d77447afe39 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Lo=C3=AFc=20Minier?= <loic.minier@linaro.org>
> -Date: Thu, 3 Feb 2011 15:07:01 +0100
> -Subject: Drop config.h include in tools/imximage.h
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Upstream-Status: Accepted
> -
> -"make tools-all" should allow building tools such as mkimage and the new
> -imximage without any config, but imximage.c currently fails to build
> -with:
> -imximage.h:27:20: error: config.h: No such file or directory
> -
> -config.h is not needed in imximage.h nor in imximage.c, and imximage.h
> -is only included from imximage.c, so drop this include to fix the build.
> -
> -Signed-off-by: Lo�c Minier <loic.minier@linaro.org>
> ----
> - tools/imximage.h |    2 --
> - 1 files changed, 0 insertions(+), 2 deletions(-)
> -
> -diff --git a/tools/imximage.h b/tools/imximage.h
> -index 38ca6be..d126a46 100644
> ---- a/tools/imximage.h
> -+++ b/tools/imximage.h
> -@@ -24,8 +24,6 @@
> - #ifndef _IMXIMAGE_H_
> - #define _IMXIMAGE_H_
> -
> --#include <config.h>
> --
> - #define MAX_HW_CFG_SIZE_V2 121 /* Max number of registers imx can set for v2 */
> - #define MAX_HW_CFG_SIZE_V1 60  /* Max number of registers imx can set for v1 */
> - #define APP_CODE_BARKER	0xB1
> ---
> -1.7.4.4
> -
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch b/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
> deleted file mode 100644
> index 5729cd9..0000000
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
> +++ /dev/null
> @@ -1,82 +0,0 @@
> -From fd1b50c5ff9c288040abf5e78815151327d32e0e Mon Sep 17 00:00:00 2001
> -From: Ilya Yanok <yanok@emcraft.com>
> -Date: Mon, 20 Jun 2011 12:45:37 +0000
> -Subject: config.mk: move LDSCRIPT processing to the top-level Makefile
> -
> -Upstream-Status: Accepted
> -
> -LDSCRIPT is used only from the top-level Makefile and only when the
> -system is configured so we can move LDSCRIPT and CONFIG_SYS_LDSCRIPT
> -related logic into the top level Makefile and under configured condition
> -to avoid errors when building tools from unconfigured tree.
> -
> -Signed-off-by: Ilya Yanok <yanok@emcraft.com>
> -Acked-by: Mike Frysinger <vapier@gentoo.org>
> ----
> - Makefile  |   30 ++++++++++++++++++++++++++++++
> - config.mk |    8 --------
> - 2 files changed, 30 insertions(+), 8 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index ece91ab..358c410 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -163,6 +163,36 @@ endif
> - # load other configuration
> - include $(TOPDIR)/config.mk
> -
> -+# If board code explicitly specified LDSCRIPT or CONFIG_SYS_LDSCRIPT, use
> -+# that (or fail if absent).  Otherwise, search for a linker script in a
> -+# standard location.
> -+
> -+ifndef LDSCRIPT
> -+	#LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds.debug
> -+	ifdef CONFIG_SYS_LDSCRIPT
> -+		# need to strip off double quotes
> -+		LDSCRIPT := $(subst ",,$(CONFIG_SYS_LDSCRIPT))
> -+	endif
> -+endif
> -+
> -+ifndef LDSCRIPT
> -+	ifeq ($(CONFIG_NAND_U_BOOT),y)
> -+		LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot-nand.lds
> -+		ifeq ($(wildcard $(LDSCRIPT)),)
> -+			LDSCRIPT := $(TOPDIR)/$(CPUDIR)/u-boot-nand.lds
> -+		endif
> -+	endif
> -+	ifeq ($(wildcard $(LDSCRIPT)),)
> -+		LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds
> -+	endif
> -+	ifeq ($(wildcard $(LDSCRIPT)),)
> -+		LDSCRIPT := $(TOPDIR)/$(CPUDIR)/u-boot.lds
> -+	endif
> -+	ifeq ($(wildcard $(LDSCRIPT)),)
> -+$(error could not find linker script)
> -+	endif
> -+endif
> -+
> - #########################################################################
> - # U-Boot objects....order is important (i.e. start must be first)
> -
> -diff --git a/config.mk b/config.mk
> -index fa46ff1..59c4c93 100644
> ---- a/config.mk
> -+++ b/config.mk
> -@@ -153,14 +153,6 @@ endif
> - RELFLAGS= $(PLATFORM_RELFLAGS)
> - DBGFLAGS= -g # -DDEBUG
> - OPTFLAGS= -Os #-fomit-frame-pointer
> --ifndef LDSCRIPT
> --#LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds.debug
> --ifeq ($(CONFIG_NAND_U_BOOT),y)
> --LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot-nand.lds
> --else
> --LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds
> --endif
> --endif
> - OBJCFLAGS += --gap-fill=0xff
> -
> - gccincdir := $(shell $(CC) -print-file-name=include)
> ---
> -1.7.5.4
> -
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch b/meta/recipes-bsp/u-boot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch
> deleted file mode 100644
> index 0405834..0000000
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From ce56e089ddb51dbd81bb2c86b1646d77447afe39 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Lo=C3=AFc=20Minier?= <loic.minier@linaro.org>
> -Date: Thu, 3 Feb 2011 15:07:01 +0100
> -Subject: Drop config.h include in tools/imximage.h
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Upstream-Status: Accepted
> -
> -"make tools-all" should allow building tools such as mkimage and the new
> -imximage without any config, but imximage.c currently fails to build
> -with:
> -imximage.h:27:20: error: config.h: No such file or directory
> -
> -config.h is not needed in imximage.h nor in imximage.c, and imximage.h
> -is only included from imximage.c, so drop this include to fix the build.
> -
> -Signed-off-by: Lo�c Minier <loic.minier@linaro.org>
> ----
> - tools/imximage.h |    2 --
> - 1 files changed, 0 insertions(+), 2 deletions(-)
> -
> -diff --git a/tools/imximage.h b/tools/imximage.h
> -index 38ca6be..d126a46 100644
> ---- a/tools/imximage.h
> -+++ b/tools/imximage.h
> -@@ -24,8 +24,6 @@
> - #ifndef _IMXIMAGE_H_
> - #define _IMXIMAGE_H_
> -
> --#include <config.h>
> --
> - #define MAX_HW_CFG_SIZE_V2 121 /* Max number of registers imx can set for v2 */
> - #define MAX_HW_CFG_SIZE_V1 60  /* Max number of registers imx can set for v1 */
> - #define APP_CODE_BARKER	0xB1
> ---
> -1.7.4.4
> -
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch b/meta/recipes-bsp/u-boot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
> deleted file mode 100644
> index 5729cd9..0000000
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
> +++ /dev/null
> @@ -1,82 +0,0 @@
> -From fd1b50c5ff9c288040abf5e78815151327d32e0e Mon Sep 17 00:00:00 2001
> -From: Ilya Yanok <yanok@emcraft.com>
> -Date: Mon, 20 Jun 2011 12:45:37 +0000
> -Subject: config.mk: move LDSCRIPT processing to the top-level Makefile
> -
> -Upstream-Status: Accepted
> -
> -LDSCRIPT is used only from the top-level Makefile and only when the
> -system is configured so we can move LDSCRIPT and CONFIG_SYS_LDSCRIPT
> -related logic into the top level Makefile and under configured condition
> -to avoid errors when building tools from unconfigured tree.
> -
> -Signed-off-by: Ilya Yanok <yanok@emcraft.com>
> -Acked-by: Mike Frysinger <vapier@gentoo.org>
> ----
> - Makefile  |   30 ++++++++++++++++++++++++++++++
> - config.mk |    8 --------
> - 2 files changed, 30 insertions(+), 8 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index ece91ab..358c410 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -163,6 +163,36 @@ endif
> - # load other configuration
> - include $(TOPDIR)/config.mk
> -
> -+# If board code explicitly specified LDSCRIPT or CONFIG_SYS_LDSCRIPT, use
> -+# that (or fail if absent).  Otherwise, search for a linker script in a
> -+# standard location.
> -+
> -+ifndef LDSCRIPT
> -+	#LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds.debug
> -+	ifdef CONFIG_SYS_LDSCRIPT
> -+		# need to strip off double quotes
> -+		LDSCRIPT := $(subst ",,$(CONFIG_SYS_LDSCRIPT))
> -+	endif
> -+endif
> -+
> -+ifndef LDSCRIPT
> -+	ifeq ($(CONFIG_NAND_U_BOOT),y)
> -+		LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot-nand.lds
> -+		ifeq ($(wildcard $(LDSCRIPT)),)
> -+			LDSCRIPT := $(TOPDIR)/$(CPUDIR)/u-boot-nand.lds
> -+		endif
> -+	endif
> -+	ifeq ($(wildcard $(LDSCRIPT)),)
> -+		LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds
> -+	endif
> -+	ifeq ($(wildcard $(LDSCRIPT)),)
> -+		LDSCRIPT := $(TOPDIR)/$(CPUDIR)/u-boot.lds
> -+	endif
> -+	ifeq ($(wildcard $(LDSCRIPT)),)
> -+$(error could not find linker script)
> -+	endif
> -+endif
> -+
> - #########################################################################
> - # U-Boot objects....order is important (i.e. start must be first)
> -
> -diff --git a/config.mk b/config.mk
> -index fa46ff1..59c4c93 100644
> ---- a/config.mk
> -+++ b/config.mk
> -@@ -153,14 +153,6 @@ endif
> - RELFLAGS= $(PLATFORM_RELFLAGS)
> - DBGFLAGS= -g # -DDEBUG
> - OPTFLAGS= -Os #-fomit-frame-pointer
> --ifndef LDSCRIPT
> --#LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds.debug
> --ifeq ($(CONFIG_NAND_U_BOOT),y)
> --LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot-nand.lds
> --else
> --LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds
> --endif
> --endif
> - OBJCFLAGS += --gap-fill=0xff
> -
> - gccincdir := $(shell $(CC) -print-file-name=include)
> ---
> -1.7.5.4
> -
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb
> deleted file mode 100644
> index 34bae8e..0000000
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -DESCRIPTION = "U-boot bootloader mkimage tool"
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
> -                    file://README;beginline=1;endline=22;md5=3a00ef51d3fc96e9d6c1bc4708ccd3b5"
> -SECTION = "bootloader"
> -
> -PR = "r1"
> -
> -SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 \
> -           file://0001-Drop-config.h-include-in-tools-imximage.h.patch \
> -           file://0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch"
> -
> -SRC_URI[md5sum] = "91d02124c94368557d0e9ac05fb8c33f"
> -SRC_URI[sha256sum] = "08677f66d8d4ee542f6599f580cdffdf730544e1803f9d3739117d6f6d68083e"
> -
> -S = "${WORKDIR}/u-boot-${PV}"
> -
> -BBCLASSEXTEND = "native nativesdk"
> -
> -EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTSTRIP=true'
> -
> -do_compile () {
> -  oe_runmake tools
> -}
> -
> -do_install () {
> -  install -d ${D}${bindir}
> -  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
> -  ln -sf uboot-mkimage ${D}${bindir}/mkimage
> -}
> -
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
> deleted file mode 100644
> index 3ca0c2c..0000000
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -DESCRIPTION = "U-boot bootloader mkimage tool"
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
> -                    file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90"
> -SECTION = "bootloader"
> -
> -PR = "r0"
> -
> -SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
> -
> -SRC_URI[md5sum] = "0cc5026aad02f218a9b9ac56b301c97a"
> -SRC_URI[sha256sum] = "362ddb935885da98cf461eba08f31e3e59d0c4ada6cb2fa15596f43af310ba8b"
> -
> -S = "${WORKDIR}/u-boot-${PV}"
> -
> -BBCLASSEXTEND = "native nativesdk"
> -
> -EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
> -
> -do_compile () {
> -  oe_runmake tools
> -}
> -
> -do_install () {
> -  install -d ${D}${bindir}
> -  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
> -  ln -sf uboot-mkimage ${D}${bindir}/mkimage
> -}
> -
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.01.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
> similarity index 72%
> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2013.01.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
> index 2b39998..a1b1db9 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.01.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
> @@ -3,16 +3,12 @@ LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
>   SECTION = "bootloader"
>
> -# This is needs to be validated among supported BSP's before we can
> -# make it default
> -DEFAULT_PREFERENCE = "-1"
> -
> -# This revision corresponds to the tag "v2013.01.01"
> +# This revision corresponds to the tag "v2013.07"
>   # We use the revision in order to avoid having to fetch it from the
>   # repo during parse
> -SRCREV = "e8ae0fa5edd152b2b29c470b88429be4cdcd2c46"
> +SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
>
> -PV = "v2013.01.01+git${SRCPV}"
> +PV = "v2013.07+git${SRCPV}"
>
>   SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
> deleted file mode 100644
> index a9cbeca..0000000
> --- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -require u-boot.inc
> -
> -# To build u-boot for your machine, provide the following lines in your machine
> -# config, replacing the assignments as appropriate for your machine.
> -# UBOOT_MACHINE = "omap3_beagle_config"
> -# UBOOT_ENTRYPOINT = "0x80008000"
> -# UBOOT_LOADADDRESS = "0x80008000"
> -
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
> -                    file://README;beginline=1;endline=22;md5=3a00ef51d3fc96e9d6c1bc4708ccd3b5"
> -
> -# This revision corresponds to the tag "v2011.03"
> -# We use the revision in order to avoid having to fetch it from the repo during parse
> -SRCREV = "19b54a701811220221fc4d5089a2bb18892018ca"
> -
> -PV = "v2011.03+git${SRCPV}"
> -PR = "r8"
> -
> -SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
> -
> -S = "${WORKDIR}/git"
> -
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
> deleted file mode 100644
> index a115ed2..0000000
> --- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -require u-boot.inc
> -
> -# To build u-boot for your machine, provide the following lines in your machine
> -# config, replacing the assignments as appropriate for your machine.
> -# UBOOT_MACHINE = "omap3_beagle_config"
> -# UBOOT_ENTRYPOINT = "0x80008000"
> -# UBOOT_LOADADDRESS = "0x80008000"
> -
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
> -                    file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90"
> -
> -# This revision corresponds to the tag "v2011.06"
> -# We use the revision in order to avoid having to fetch it from the repo during parse
> -SRCREV = "b1af6f532e0d348b153d5c148369229d24af361a"
> -
> -PV = "v2011.06+git${SRCPV}"
> -PR = "r3"
> -
> -SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
> -
> -S = "${WORKDIR}/git"
> -
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2013.01.01.bb b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
> similarity index 69%
> rename from meta/recipes-bsp/u-boot/u-boot_2013.01.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot_2013.07.bb
> index 8ffb8f3..2603ad1 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2013.01.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
> @@ -1,9 +1,5 @@
>   require u-boot.inc
>
> -# This is needs to be validated among supported BSP's before we can
> -# make it default
> -DEFAULT_PREFERENCE = "-1"
> -
>   # To build u-boot for your machine, provide the following lines in
>   # your machine config, replacing the assignments as appropriate for
>   # your machine.
> @@ -12,14 +8,15 @@ DEFAULT_PREFERENCE = "-1"
>   # UBOOT_LOADADDRESS = "0x80008000"
>
>   LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
> +                    file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
>
> -# This revision corresponds to the tag "v2013.01.01"
> +# This revision corresponds to the tag "v2013.07"
>   # We use the revision in order to avoid having to fetch it from the
>   # repo during parse
> -SRCREV = "e8ae0fa5edd152b2b29c470b88429be4cdcd2c46"
> +SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
>
> -PV = "v2013.01.01+git${SRCPV}"
> +PV = "v2013.07+git${SRCPV}"
>   PR = "r0"
>
>   SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

