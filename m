Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QbPfm-0004ho-AD
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 06:13:15 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jun 2011 21:09:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,436,1304319600"; d="scan'208";a="19513506"
Received: from unknown (HELO [10.255.13.102]) ([10.255.13.102])
	by azsmga001.ch.intel.com with ESMTP; 27 Jun 2011 21:09:31 -0700
Message-ID: <4E0953FB.508@linux.intel.com>
Date: Mon, 27 Jun 2011 21:09:31 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1308182971-23082-1-git-send-email-yanok@emcraft.com>
In-Reply-To: <1308182971-23082-1-git-send-email-yanok@emcraft.com>
Cc: Ilya Yanok <yanok@emcraft.com>
Subject: Re: [PATCH] u-boot-mkimage: bump version to 2011.03
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Jun 2011 04:13:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilya,

On 06/15/2011 05:09 PM, Ilya Yanok wrote:
> This patch changes u-boot-mkimage version to 2011.03 and includes
> patches to build tools without configuring U-Boot for specific board.

These look like good changes to me, with a couple of minor things needed:

1) Please submit the version change independently from the added
   patches to keep things functionally distinct.

2) The patch from you marked as Submitted: has this received any
   discussion on the u-boot list?

Thanks,

Darren

> 
> Signed-off-by: Ilya Yanok <yanok@emcraft.com>
> ---
>  ...Drop-config.h-include-in-tools-imximage.h.patch |   39 ++++++
>  ...e-it-possible-to-build-tools-unconfigured.patch |  137 ++++++++++++++++++++
>  .../uboot/u-boot-mkimage-native_1.3.2.bb           |   25 ----
>  meta/recipes-bsp/uboot/u-boot-mkimage_2009.08.bb   |   29 ----
>  meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb   |   31 +++++
>  5 files changed, 207 insertions(+), 54 deletions(-)
>  create mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
>  create mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0002-tools-make-it-possible-to-build-tools-unconfigured.patch
>  delete mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage-native_1.3.2.bb
>  delete mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage_2009.08.bb
>  create mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb
> 
> diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch b/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
> new file mode 100644
> index 0000000..f4b12ac
> --- /dev/null
> +++ b/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
> @@ -0,0 +1,39 @@
> +From ce56e089ddb51dbd81bb2c86b1646d77447afe39 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Lo=C3=AFc=20Minier?= <loic.minier@linaro.org>
> +Date: Thu, 3 Feb 2011 15:07:01 +0100
> +Subject: Drop config.h include in tools/imximage.h
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Applied
> +
> +"make tools-all" should allow building tools such as mkimage and the new
> +imximage without any config, but imximage.c currently fails to build
> +with:
> +imximage.h:27:20: error: config.h: No such file or directory
> +
> +config.h is not needed in imximage.h nor in imximage.c, and imximage.h
> +is only included from imximage.c, so drop this include to fix the build.
> +
> +Signed-off-by: Lo�c Minier <loic.minier@linaro.org>
> +---
> + tools/imximage.h |    2 --
> + 1 files changed, 0 insertions(+), 2 deletions(-)
> +
> +diff --git a/tools/imximage.h b/tools/imximage.h
> +index 38ca6be..d126a46 100644
> +--- a/tools/imximage.h
> ++++ b/tools/imximage.h
> +@@ -24,8 +24,6 @@
> + #ifndef _IMXIMAGE_H_
> + #define _IMXIMAGE_H_
> + 
> +-#include <config.h>
> +-
> + #define MAX_HW_CFG_SIZE_V2 121 /* Max number of registers imx can set for v2 */
> + #define MAX_HW_CFG_SIZE_V1 60  /* Max number of registers imx can set for v1 */
> + #define APP_CODE_BARKER	0xB1
> +-- 
> +1.7.4.4
> +
> diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0002-tools-make-it-possible-to-build-tools-unconfigured.patch b/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0002-tools-make-it-possible-to-build-tools-unconfigured.patch
> new file mode 100644
> index 0000000..6a4036c
> --- /dev/null
> +++ b/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0002-tools-make-it-possible-to-build-tools-unconfigured.patch
> @@ -0,0 +1,137 @@
> +From c0325ba617db3dde28a0a7667bfd1a548e98ba0f Mon Sep 17 00:00:00 2001
> +From: Ilya Yanok <yanok@emcraft.com>
> +Date: Wed, 15 Jun 2011 23:23:37 +0200
> +Subject: tools: make it possible to build tools unconfigured
> +
> +Upstream-Status: Submitted
> +
> +Sometimes we want to build common tools without configuring for specific
> +target. Currently top Makefile has some support for this but it doesn't
> +work. This patch tries to fix this.
> +Things changed:
> + - config.mk   disable 'ld script not found error' in case if we are
> +building tools only.
> + - Makefile    mkimage relies on autogenerated version so we need to
> +move $(VERSION_FILE) rule out of ifeq and make tools rule depend on it.
> + - tools/Makefile put common/env_embedded.o and envcrc.o to object list
> +conditionally. This fixes errors during dependency generation.
> +
> +Signed-off-by: Ilya Yanok <yanok@emcraft.com>
> +---
> + Makefile       |   30 +++++++++++++++++-------------
> + tools/Makefile |   19 ++++++++++++++++---
> + 2 files changed, 33 insertions(+), 16 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index ece91ab..734b503 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -140,7 +140,7 @@ SUBDIRS	= tools \
> + 	  examples/standalone \
> + 	  examples/api
> + 
> +-.PHONY : $(SUBDIRS)
> ++.PHONY : $(SUBDIRS) $(VERSION_FILE)
> + 
> + ifeq ($(obj)include/config.mk,$(wildcard $(obj)include/config.mk))
> + 
> +@@ -414,15 +414,6 @@ $(ONENAND_IPL):	$(TIMESTAMP_FILE) $(VERSION_FILE) $(obj)include/autoconf.mk
> + $(U_BOOT_ONENAND):	$(ONENAND_IPL) $(obj)u-boot.bin
> + 		cat $(ONENAND_BIN) $(obj)u-boot.bin > $(obj)u-boot-onenand.bin
> + 
> +-$(VERSION_FILE):
> +-		@( printf '#define U_BOOT_VERSION "U-Boot %s%s"\n' "$(U_BOOT_VERSION)" \
> +-		 '$(shell $(TOPDIR)/tools/setlocalversion $(TOPDIR))' ) > $@.tmp
> +-		@( printf '#define CC_VERSION_STRING "%s"\n' \
> +-		 '$(shell $(CC) --version | head -n 1)' )>>  $@.tmp
> +-		@( printf '#define LD_VERSION_STRING "%s"\n' \
> +-		 '$(shell $(LD) -v | head -n 1)' )>>  $@.tmp
> +-		@cmp -s $@ $@.tmp && rm -f $@.tmp || mv -f $@.tmp $@
> +-
> + $(TIMESTAMP_FILE):
> + 		@LC_ALL=C date +'#define U_BOOT_DATE "%b %d %C%y"' > $@
> + 		@LC_ALL=C date +'#define U_BOOT_TIME "%T"' >> $@
> +@@ -497,20 +488,33 @@ $(obj)lib/asm-offsets.s:	$(obj)include/autoconf.mk.dep \
> + else	# !config.mk
> + all $(obj)u-boot.hex $(obj)u-boot.srec $(obj)u-boot.bin \
> + $(obj)u-boot.img $(obj)u-boot.dis $(obj)u-boot \
> +-$(filter-out tools,$(SUBDIRS)) $(TIMESTAMP_FILE) $(VERSION_FILE) \
> ++$(filter-out tools,$(SUBDIRS)) $(TIMESTAMP_FILE) \
> + updater depend dep tags ctags etags cscope $(obj)System.map:
> + 	@echo "System not configured - see README" >&2
> + 	@ exit 1
> + 
> +-tools:
> ++tools:	$(VERSION_FILE)
> + 	$(MAKE) -C $@ all
> + endif	# config.mk
> + 
> ++$(VERSION_FILE):
> ++		@( localvers='$(shell $(TOPDIR)/tools/setlocalversion $(TOPDIR))' ; \
> ++		   printf '#define PLAIN_VERSION "%s%s"\n' \
> ++			"$(U_BOOT_VERSION)" "$${localvers}" ; \
> ++		   printf '#define U_BOOT_VERSION "U-Boot %s%s"\n' \
> ++			"$(U_BOOT_VERSION)" "$${localvers}" ; \
> ++		) > $@.tmp
> ++		@( printf '#define CC_VERSION_STRING "%s"\n' \
> ++		 '$(shell $(CC) --version | head -n 1)' )>>  $@.tmp
> ++		@( printf '#define LD_VERSION_STRING "%s"\n' \
> ++		 '$(shell $(LD) -v | head -n 1)' )>>  $@.tmp
> ++		@cmp -s $@ $@.tmp && rm -f $@.tmp || mv -f $@.tmp $@
> ++
> + easylogo env gdb:
> + 	$(MAKE) -C tools/$@ all MTD_VERSION=${MTD_VERSION}
> + gdbtools: gdb
> + 
> +-tools-all: easylogo env gdb
> ++tools-all: easylogo env gdb $(VERSION_FILE)
> + 	$(MAKE) -C tools HOST_TOOLS_ALL=y
> + 
> + .PHONY : CHANGELOG
> +diff --git a/tools/Makefile b/tools/Makefile
> +index 623f908..30ae0b5 100644
> +--- a/tools/Makefile
> ++++ b/tools/Makefile
> +@@ -67,7 +67,14 @@ BIN_FILES-$(CONFIG_NETCONSOLE) += ncb$(SFX)
> + BIN_FILES-$(CONFIG_SHA1_CHECK_UB_IMG) += ubsha1$(SFX)
> + 
> + # Source files which exist outside the tools directory
> +-EXT_OBJ_FILES-y += common/env_embedded.o
> ++EXT_OBJ_FILES-$(CONFIG_ENV_IS_EMBEDDED) += common/env_embedded.o
> ++EXT_OBJ_FILES-$(CONFIG_ENV_IS_IN_DATAFLASH) += common/env_embedded.o
> ++EXT_OBJ_FILES-$(CONFIG_ENV_IS_IN_EEPROM) += common/env_embedded.o
> ++EXT_OBJ_FILES-$(CONFIG_ENV_IS_IN_FLASH) += common/env_embedded.o
> ++EXT_OBJ_FILES-$(CONFIG_ENV_IS_IN_ONENAND) += common/env_embedded.o
> ++EXT_OBJ_FILES-$(CONFIG_ENV_IS_IN_NAND) += common/env_embedded.o
> ++EXT_OBJ_FILES-$(CONFIG_ENV_IS_IN_NVRAM) += common/env_embedded.o
> ++EXT_OBJ_FILES-$(CONFIG_ENV_IS_IN_SPI_FLASH) += common/env_embedded.o
> + EXT_OBJ_FILES-y += common/image.o
> + EXT_OBJ_FILES-y += lib/crc32.o
> + EXT_OBJ_FILES-y += lib/md5.o
> +@@ -77,7 +84,14 @@ EXT_OBJ_FILES-y += lib/sha1.o
> + OBJ_FILES-$(CONFIG_LCD_LOGO) += bmp_logo.o
> + OBJ_FILES-$(CONFIG_VIDEO_LOGO) += bmp_logo.o
> + NOPED_OBJ_FILES-y += default_image.o
> +-OBJ_FILES-y += envcrc.o
> ++OBJ_FILES-$(CONFIG_ENV_IS_EMBEDDED) += envcrc.o
> ++OBJ_FILES-$(CONFIG_ENV_IS_IN_DATAFLASH) += envcrc.o
> ++OBJ_FILES-$(CONFIG_ENV_IS_IN_EEPROM) += envcrc.o
> ++OBJ_FILES-$(CONFIG_ENV_IS_IN_FLASH) += envcrc.o
> ++OBJ_FILES-$(CONFIG_ENV_IS_IN_ONENAND) += envcrc.o
> ++OBJ_FILES-$(CONFIG_ENV_IS_IN_NAND) += envcrc.o
> ++OBJ_FILES-$(CONFIG_ENV_IS_IN_NVRAM) += envcrc.o
> ++OBJ_FILES-$(CONFIG_ENV_IS_IN_SPI_FLASH) += envcrc.o
> + NOPED_OBJ_FILES-y += fit_image.o
> + OBJ_FILES-$(CONFIG_CMD_NET) += gen_eth_addr.o
> + OBJ_FILES-$(CONFIG_CMD_LOADS) += img2srec.o
> +@@ -149,7 +163,6 @@ HOSTCPPFLAGS =	-idirafter $(SRCTREE)/include \
> + 		-DUSE_HOSTCC \
> + 		-D__KERNEL_STRICT_NAMES
> + 
> +-
> + all:	$(obj).depend $(BINS) $(LOGO-y) subdirs
> + 
> + $(obj)bin2header$(SFX): $(obj)bin2header.o
> +-- 
> +1.7.4.4
> +
> diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage-native_1.3.2.bb b/meta/recipes-bsp/uboot/u-boot-mkimage-native_1.3.2.bb
> deleted file mode 100644
> index eab286c..0000000
> --- a/meta/recipes-bsp/uboot/u-boot-mkimage-native_1.3.2.bb
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -DESCRIPTION = "U-boot bootloader mkimage tool"
> -LICENSE = "GPL"
> -SECTION = "bootloader"
> -
> -SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 \
> -           file://fix-arm920t-eabi.patch;patch=1"
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=4c6cde5df68eff615d36789dc18edd3b"
> -
> -S = "${WORKDIR}/u-boot-${PV}"
> -
> -inherit native
> -
> -EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"
> -
> -do_compile () {
> -	oe_runmake smdk2410_config
> -	oe_runmake tools
> -}
> -
> -do_install () {
> -	install -d ${D}${bindir}/
> -	install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
> -	ln -sf uboot-mkimage ${D}${bindir}/mkimage
> -}
> diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage_2009.08.bb b/meta/recipes-bsp/uboot/u-boot-mkimage_2009.08.bb
> deleted file mode 100644
> index 822acb6..0000000
> --- a/meta/recipes-bsp/uboot/u-boot-mkimage_2009.08.bb
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -DESCRIPTION = "U-boot bootloader mkimage tool"
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=4c6cde5df68eff615d36789dc18edd3b"
> -SECTION = "bootloader"
> -
> -PR = "r1"
> -
> -SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
> -
> -SRC_URI[md5sum] = "cd4788ea1c6ac4f9b100b888a1063a6b"
> -SRC_URI[sha256sum] = "858fd04efd5b98e99fd1a074998b1a8ac5fbd07b176de1d20d8eb148492d949d"
> -
> -S = "${WORKDIR}/u-boot-${PV}"
> -
> -EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"
> -
> -BBCLASSEXTEND = "native nativesdk"
> -
> -do_compile () {
> -  oe_runmake smdk2410_config
> -  oe_runmake tools
> -}
> -
> -do_install () {
> -  install -d ${D}${bindir}
> -  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
> -  ln -sf uboot-mkimage ${D}${bindir}/mkimage
> -}
> -
> diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb b/meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb
> new file mode 100644
> index 0000000..25c1009
> --- /dev/null
> +++ b/meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb
> @@ -0,0 +1,31 @@
> +DESCRIPTION = "U-boot bootloader mkimage tool"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
> +                    file://README;beginline=1;endline=22;md5=3a00ef51d3fc96e9d6c1bc4708ccd3b5"
> +SECTION = "bootloader"
> +
> +PR = "r1"
> +
> +SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 \
> +           file://0001-Drop-config.h-include-in-tools-imximage.h.patch \
> +           file://0002-tools-make-it-possible-to-build-tools-unconfigured.patch"
> +
> +SRC_URI[md5sum] = "91d02124c94368557d0e9ac05fb8c33f"
> +SRC_URI[sha256sum] = "08677f66d8d4ee542f6599f580cdffdf730544e1803f9d3739117d6f6d68083e"
> +
> +S = "${WORKDIR}/u-boot-${PV}"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTSTRIP=true'
> +
> +do_compile () {
> +  oe_runmake tools
> +}
> +
> +do_install () {
> +  install -d ${D}${bindir}
> +  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
> +  ln -sf uboot-mkimage ${D}${bindir}/mkimage
> +}
> +
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


