Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id 3EE516FEA8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 20:27:28 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCD00K87FHHJ7A0@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 23 Sep 2014 15:27:18 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id AA04D20357; Tue,
	23 Sep 2014 16:27:17 -0400 (EDT)
Date: Tue, 23 Sep 2014 16:27:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-id: <20140923202717.GD2480@denix.org>
References: <1410909001-3284-1-git-send-email-denis@denix.org>
	<1410909001-3284-2-git-send-email-denis@denix.org>
MIME-version: 1.0
In-reply-to: <1410909001-3284-2-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH v2 2/2] u-boot: update to version 2014.07
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
X-List-Received-Date: Tue, 23 Sep 2014 20:27:29 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Just to confirm - this patch was purposefully skipped in this merge cycle, 
right?


On Tue, Sep 16, 2014 at 07:10:01PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  ...h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch | 74 ----------------------
>  ...2013.07.bb => u-boot-fw-utils-cross_2014.07.bb} | 10 +--
>  ...utils_2013.07.bb => u-boot-fw-utils_2014.07.bb} | 10 +--
>  ...kimage_2013.07.bb => u-boot-mkimage_2014.07.bb} | 10 +--
>  meta/recipes-bsp/u-boot/u-boot.inc                 |  5 +-
>  .../{u-boot_2013.07.bb => u-boot_2014.07.bb}       | 10 +--
>  6 files changed, 22 insertions(+), 97 deletions(-)
>  delete mode 100644 meta/recipes-bsp/u-boot/files/0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch
>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils-cross_2013.07.bb => u-boot-fw-utils-cross_2014.07.bb} (76%)
>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2013.07.bb => u-boot-fw-utils_2014.07.bb} (74%)
>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2013.07.bb => u-boot-mkimage_2014.07.bb} (72%)
>  rename meta/recipes-bsp/u-boot/{u-boot_2013.07.bb => u-boot_2014.07.bb} (33%)
> 
> diff --git a/meta/recipes-bsp/u-boot/files/0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch b/meta/recipes-bsp/u-boot/files/0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch
> deleted file mode 100644
> index 77e35bb..0000000
> --- a/meta/recipes-bsp/u-boot/files/0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -From 5701384cea4a829b772bf7a96a74825b58c22385 Mon Sep 17 00:00:00 2001
> -From: Denys Dmytriyenko <denys@ti.com>
> -Date: Thu, 17 Apr 2014 12:25:40 -0400
> -Subject: [PATCH] am335x_evm.h: Add, use DEFAULT_LINUX_BOOT_ENV environment
> - string
> -
> -Modified version of the patch currently being reviewed for mainline:
> -http://patchwork.ozlabs.org/patch/334861/
> -
> -To deal with a reoccurring problem properly we need to specify addresses
> -for the Linux kernel, Flatted Device Tree and ramdisk that obey the
> -constraints within the kernel's Documentation/arm/Booting file but also
> -make sure that we relocate things within a valid address range.
> -
> -Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> -Signed-off-by: Tom Rini <trini@ti.com>
> -
> -Upstream-Status: Pending
> ----
> - include/configs/am335x_evm.h | 31 ++++++++++++++++++++++++++-----
> - 1 file changed, 26 insertions(+), 5 deletions(-)
> -
> -diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
> -index c5a6d4b..01e32b3 100644
> ---- a/include/configs/am335x_evm.h
> -+++ b/include/configs/am335x_evm.h
> -@@ -54,10 +54,7 @@
> - #define CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG
> - #ifndef CONFIG_SPL_BUILD
> - #define CONFIG_EXTRA_ENV_SETTINGS \
> --	"loadaddr=0x80200000\0" \
> --	"fdtaddr=0x80F80000\0" \
> --	"fdt_high=0xffffffff\0" \
> --	"rdaddr=0x81000000\0" \
> -+	DEFAULT_LINUX_BOOT_ENV \
> - 	"bootdir=/boot\0" \
> - 	"bootfile=uImage\0" \
> - 	"fdtfile=undefined\0" \
> -@@ -197,7 +194,31 @@
> - #define CONFIG_SYS_MEMTEST_END		(CONFIG_SYS_MEMTEST_START \
> - 					+ (8 * 1024 * 1024))
> - 
> --#define CONFIG_SYS_LOAD_ADDR		0x81000000 /* Default load address */
> -+/*
> -+ * Our DDR memory always starts at 0x80000000 and U-Boot shall have
> -+ * relocated itself to higher in memory by the time this value is used.
> -+ * However, set this to a 32MB offset to allow for easier Linux kernel
> -+ * booting as the default is often used as the kernel load address.
> -+ */
> -+#define CONFIG_SYS_LOAD_ADDR		0x82000000 /* Default load address */
> -+
> -+/*
> -+ * We setup defaults based on constraints from the Linux kernel, which should
> -+ * also be safe elsewhere.  We have the default load at 32MB into DDR (for
> -+ * the kernel), FDT above 128MB (the maximum location for the end of the
> -+ * kernel), and the ramdisk 512KB above that (allowing for hopefully never
> -+ * seen large trees).  We say all of this must be within the first 256MB
> -+ * as that will normally be within the kernel lowmem and thus visible via
> -+ * bootm_size and we only run on platforms with 256MB or more of memory.
> -+ */
> -+#define DEFAULT_LINUX_BOOT_ENV \
> -+	"loadaddr=0x82000000\0" \
> -+	"kernel_addr_r=0x82000000\0" \
> -+	"fdtaddr=0x88000000\0" \
> -+	"fdt_addr_r=0x88000000\0" \
> -+	"rdaddr=0x88080000\0" \
> -+	"ramdisk_addr_r=0x88080000\0" \
> -+	"bootm_size=0x10000000\0"
> - 
> - #define CONFIG_MMC
> - #define CONFIG_GENERIC_MMC
> --- 
> -1.9.2
> -
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2014.07.bb
> similarity index 76%
> rename from meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb
> rename to meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2014.07.bb
> index d686b33..d1f1f9a 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2014.07.bb
> @@ -1,15 +1,15 @@
>  SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
>  LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
> +LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
>  SECTION = "bootloader"
>  DEPENDS = "mtd-utils"
>  
> -# This revision corresponds to the tag "v2013.07"
> +# This revision corresponds to the tag "v2014.07"
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
> +SRCREV = "524123a70761110c5cf3ccc5f52f6d4da071b959"
>  
> -PV = "v2013.07+git${SRCPV}"
> +PV = "v2014.07+git${SRCPV}"
>  
>  SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
>  
> @@ -17,7 +17,7 @@ S = "${WORKDIR}/git"
>  
>  inherit uboot-config cross
>  
> -EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
> +EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} ${TOOLCHAIN_OPTIONS}"'
>  
>  do_compile () {
>  	oe_runmake ${UBOOT_MACHINE}
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb
> similarity index 74%
> rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
> rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb
> index 8bab432..a626c95 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb
> @@ -1,21 +1,21 @@
>  SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
>  LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
> +LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
>  SECTION = "bootloader"
>  DEPENDS = "mtd-utils"
>  
> -# This revision corresponds to the tag "v2013.07"
> +# This revision corresponds to the tag "v2014.07"
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
> +SRCREV = "524123a70761110c5cf3ccc5f52f6d4da071b959"
>  
> -PV = "v2013.07+git${SRCPV}"
> +PV = "v2014.07+git${SRCPV}"
>  
>  SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
>  
>  S = "${WORKDIR}/git"
>  
> -EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTSTRIP="true"'
> +INSANE_SKIP_${PN} = "already-stripped"
>  
>  inherit uboot-config
>  
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2014.07.bb
> similarity index 72%
> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
> rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2014.07.bb
> index 3173b0a..7c05215 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2014.07.bb
> @@ -1,14 +1,14 @@
>  SUMMARY = "U-Boot bootloader image creation tool"
>  LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
> +LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
>  SECTION = "bootloader"
>  
> -# This revision corresponds to the tag "v2013.07"
> +# This revision corresponds to the tag "v2014.07"
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
> +SRCREV = "524123a70761110c5cf3ccc5f52f6d4da071b959"
>  
> -PV = "v2013.07+git${SRCPV}"
> +PV = "v2014.07+git${SRCPV}"
>  
>  SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
>  
> @@ -20,7 +20,7 @@ do_compile () {
>  	# Make sure the recompile is OK
>  	rm -f ${B}/tools/.depend
>  
> -	oe_runmake tools
> +	oe_runmake tools-only
>  }
>  
>  do_install () {
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 602b71f..c695b73 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -4,8 +4,7 @@ SECTION = "bootloaders"
>  PROVIDES = "virtual/bootloader"
>  
>  LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
> -                    file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
> +LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
>  
>  SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
>  
> @@ -24,7 +23,7 @@ UBOOT_LOCALVERSION ?= ""
>  
>  # Some versions of u-boot use .bin and others use .img.  By default use .bin
>  # but enable individual recipes to change this value.
> -UBOOT_SUFFIX ?= "bin"
> +UBOOT_SUFFIX ??= "bin"
>  UBOOT_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
>  UBOOT_BINARY ?= "u-boot.${UBOOT_SUFFIX}"
>  UBOOT_SYMLINK ?= "u-boot-${MACHINE}.${UBOOT_SUFFIX}"
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot_2014.07.bb
> similarity index 33%
> rename from meta/recipes-bsp/u-boot/u-boot_2013.07.bb
> rename to meta/recipes-bsp/u-boot/u-boot_2014.07.bb
> index f07fd7c..44cc52e 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2014.07.bb
> @@ -1,9 +1,9 @@
>  require u-boot.inc
>  
> -# This revision corresponds to the tag "v2013.07"
> -# We use the revision in order to avoid having to fetch it from the repo during parse
> -SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
> +DEPENDS += "dtc-native"
>  
> -PV = "v2013.07+git${SRCPV}"
> +# This revision corresponds to the tag "v2014.07"
> +# We use the revision in order to avoid having to fetch it from the repo during parse
> +SRCREV = "524123a70761110c5cf3ccc5f52f6d4da071b959"
>  
> -SRC_URI += "file://0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch"
> +PV = "v2014.07+git${SRCPV}"
> -- 
> 2.0.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

