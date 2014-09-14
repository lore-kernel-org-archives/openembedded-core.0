Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id 456C060809
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 03:34:38 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NBV00LXHGL9HJ00@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Sat, 13 Sep 2014 22:34:22 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0E11420087; Sat,
	13 Sep 2014 23:34:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Sep 2014 23:34:20 -0400
Message-id: <1410665660-25145-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] u-boot: update to version 2014.07
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
X-List-Received-Date: Sun, 14 Sep 2014 03:34:45 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Update U-boot and corresponding tools to version 2014.07
* Small cleanups with indentation and consolidation of u-boot.inc

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch | 74 ----------------------
 ...2013.07.bb => u-boot-fw-utils-cross_2014.07.bb} | 22 +++----
 ...utils_2013.07.bb => u-boot-fw-utils_2014.07.bb} | 24 +++----
 ...kimage_2013.07.bb => u-boot-mkimage_2014.07.bb} | 19 +++---
 meta/recipes-bsp/u-boot/u-boot.inc                 | 11 +++-
 .../{u-boot_2013.07.bb => u-boot_2014.07.bb}       | 24 ++-----
 6 files changed, 45 insertions(+), 129 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/files/0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils-cross_2013.07.bb => u-boot-fw-utils-cross_2014.07.bb} (49%)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2013.07.bb => u-boot-fw-utils_2014.07.bb} (40%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2013.07.bb => u-boot-mkimage_2014.07.bb} (51%)
 rename meta/recipes-bsp/u-boot/{u-boot_2013.07.bb => u-boot_2014.07.bb} (12%)

diff --git a/meta/recipes-bsp/u-boot/files/0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch b/meta/recipes-bsp/u-boot/files/0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch
deleted file mode 100644
index 77e35bb..0000000
--- a/meta/recipes-bsp/u-boot/files/0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 5701384cea4a829b772bf7a96a74825b58c22385 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Thu, 17 Apr 2014 12:25:40 -0400
-Subject: [PATCH] am335x_evm.h: Add, use DEFAULT_LINUX_BOOT_ENV environment
- string
-
-Modified version of the patch currently being reviewed for mainline:
-http://patchwork.ozlabs.org/patch/334861/
-
-To deal with a reoccurring problem properly we need to specify addresses
-for the Linux kernel, Flatted Device Tree and ramdisk that obey the
-constraints within the kernel's Documentation/arm/Booting file but also
-make sure that we relocate things within a valid address range.
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
-Signed-off-by: Tom Rini <trini@ti.com>
-
-Upstream-Status: Pending
----
- include/configs/am335x_evm.h | 31 ++++++++++++++++++++++++++-----
- 1 file changed, 26 insertions(+), 5 deletions(-)
-
-diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index c5a6d4b..01e32b3 100644
---- a/include/configs/am335x_evm.h
-+++ b/include/configs/am335x_evm.h
-@@ -54,10 +54,7 @@
- #define CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG
- #ifndef CONFIG_SPL_BUILD
- #define CONFIG_EXTRA_ENV_SETTINGS \
--	"loadaddr=0x80200000\0" \
--	"fdtaddr=0x80F80000\0" \
--	"fdt_high=0xffffffff\0" \
--	"rdaddr=0x81000000\0" \
-+	DEFAULT_LINUX_BOOT_ENV \
- 	"bootdir=/boot\0" \
- 	"bootfile=uImage\0" \
- 	"fdtfile=undefined\0" \
-@@ -197,7 +194,31 @@
- #define CONFIG_SYS_MEMTEST_END		(CONFIG_SYS_MEMTEST_START \
- 					+ (8 * 1024 * 1024))
- 
--#define CONFIG_SYS_LOAD_ADDR		0x81000000 /* Default load address */
-+/*
-+ * Our DDR memory always starts at 0x80000000 and U-Boot shall have
-+ * relocated itself to higher in memory by the time this value is used.
-+ * However, set this to a 32MB offset to allow for easier Linux kernel
-+ * booting as the default is often used as the kernel load address.
-+ */
-+#define CONFIG_SYS_LOAD_ADDR		0x82000000 /* Default load address */
-+
-+/*
-+ * We setup defaults based on constraints from the Linux kernel, which should
-+ * also be safe elsewhere.  We have the default load at 32MB into DDR (for
-+ * the kernel), FDT above 128MB (the maximum location for the end of the
-+ * kernel), and the ramdisk 512KB above that (allowing for hopefully never
-+ * seen large trees).  We say all of this must be within the first 256MB
-+ * as that will normally be within the kernel lowmem and thus visible via
-+ * bootm_size and we only run on platforms with 256MB or more of memory.
-+ */
-+#define DEFAULT_LINUX_BOOT_ENV \
-+	"loadaddr=0x82000000\0" \
-+	"kernel_addr_r=0x82000000\0" \
-+	"fdtaddr=0x88000000\0" \
-+	"fdt_addr_r=0x88000000\0" \
-+	"rdaddr=0x88080000\0" \
-+	"ramdisk_addr_r=0x88080000\0" \
-+	"bootm_size=0x10000000\0"
- 
- #define CONFIG_MMC
- #define CONFIG_GENERIC_MMC
--- 
-1.9.2
-
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2014.07.bb
similarity index 49%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2014.07.bb
index e616397..d1f1f9a 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2014.07.bb
@@ -1,15 +1,15 @@
 SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
 SECTION = "bootloader"
 DEPENDS = "mtd-utils"
 
-# This revision corresponds to the tag "v2013.07"
+# This revision corresponds to the tag "v2014.07"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
+SRCREV = "524123a70761110c5cf3ccc5f52f6d4da071b959"
 
-PV = "v2013.07+git${SRCPV}"
+PV = "v2014.07+git${SRCPV}"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
@@ -17,22 +17,22 @@ S = "${WORKDIR}/git"
 
 inherit uboot-config cross
 
-EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
+EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} ${TOOLCHAIN_OPTIONS}"'
 
 do_compile () {
-  oe_runmake ${UBOOT_MACHINE}
-  oe_runmake env
+	oe_runmake ${UBOOT_MACHINE}
+	oe_runmake env
 }
 
 do_install () {
-  install -d ${D}${bindir_cross}
-  install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_printenv
-  install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_setenv
+	install -d ${D}${bindir_cross}
+	install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_printenv
+	install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_setenv
 }
 
 SYSROOT_PREPROCESS_FUNCS = "uboot_fw_utils_cross"
 uboot_fw_utils_cross() {
-    sysroot_stage_dir ${D}${bindir_cross} ${SYSROOT_DESTDIR}${bindir_cross}
+	sysroot_stage_dir ${D}${bindir_cross} ${SYSROOT_DESTDIR}${bindir_cross}
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb
similarity index 40%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb
index 89fed8b..a626c95 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb
@@ -1,35 +1,35 @@
 SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
 SECTION = "bootloader"
 DEPENDS = "mtd-utils"
 
-# This revision corresponds to the tag "v2013.07"
+# This revision corresponds to the tag "v2014.07"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
+SRCREV = "524123a70761110c5cf3ccc5f52f6d4da071b959"
 
-PV = "v2013.07+git${SRCPV}"
+PV = "v2014.07+git${SRCPV}"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTSTRIP="true"'
+INSANE_SKIP_${PN} = "already-stripped"
 
 inherit uboot-config
 
 do_compile () {
-  oe_runmake ${UBOOT_MACHINE}
-  oe_runmake env
+	oe_runmake ${UBOOT_MACHINE}
+	oe_runmake env
 }
 
 do_install () {
-  install -d ${D}${base_sbindir}
-  install -d ${D}${sysconfdir}
-  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
-  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
-  install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
+	install -d ${D}${base_sbindir}
+	install -d ${D}${sysconfdir}
+	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
+	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
+	install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2014.07.bb
similarity index 51%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2014.07.bb
index 93c8102..b9fad1b 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2014.07.bb
@@ -1,14 +1,14 @@
 SUMMARY = "U-Boot bootloader image creation tool"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
 SECTION = "bootloader"
 
-# This revision corresponds to the tag "v2013.07"
+# This revision corresponds to the tag "v2014.07"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
+SRCREV = "524123a70761110c5cf3ccc5f52f6d4da071b959"
 
-PV = "v2013.07+git${SRCPV}"
+PV = "v2014.07+git${SRCPV}"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
@@ -17,16 +17,13 @@ S = "${WORKDIR}/git"
 EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
 
 do_compile () {
-  # Make sure the recompile is OK
-  rm -f ${B}/tools/.depend
-
-  oe_runmake tools
+	oe_runmake tools-only
 }
 
 do_install () {
-  install -d ${D}${bindir}
-  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
-  ln -sf uboot-mkimage ${D}${bindir}/mkimage
+	install -d ${D}${bindir}
+	install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
+	ln -sf uboot-mkimage ${D}${bindir}/mkimage
 }
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 53c87c2..c695b73 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -3,6 +3,15 @@ HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
 SECTION = "bootloaders"
 PROVIDES = "virtual/bootloader"
 
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
+
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
+
+S = "${WORKDIR}/git"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 inherit uboot-config deploy
 
 EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
@@ -14,7 +23,7 @@ UBOOT_LOCALVERSION ?= ""
 
 # Some versions of u-boot use .bin and others use .img.  By default use .bin
 # but enable individual recipes to change this value.
-UBOOT_SUFFIX ?= "bin"
+UBOOT_SUFFIX ??= "bin"
 UBOOT_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
 UBOOT_BINARY ?= "u-boot.${UBOOT_SUFFIX}"
 UBOOT_SYMLINK ?= "u-boot-${MACHINE}.${UBOOT_SUFFIX}"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot_2014.07.bb
similarity index 12%
rename from meta/recipes-bsp/u-boot/u-boot_2013.07.bb
rename to meta/recipes-bsp/u-boot/u-boot_2014.07.bb
index f8a8856..44cc52e 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2014.07.bb
@@ -1,25 +1,9 @@
 require u-boot.inc
 
-# To build u-boot for your machine, provide the following lines in your machine
-# config, replacing the assignments as appropriate for your machine.
-# UBOOT_MACHINE = "omap3_beagle_config"
-# UBOOT_ENTRYPOINT = "0x80008000"
-# UBOOT_LOADADDRESS = "0x80008000"
+DEPENDS += "dtc-native"
 
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
-                    file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
-
-# This revision corresponds to the tag "v2013.07"
+# This revision corresponds to the tag "v2014.07"
 # We use the revision in order to avoid having to fetch it from the repo during parse
-SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
-
-PV = "v2013.07+git${SRCPV}"
-
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
-           file://0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch \
-"
-
-S = "${WORKDIR}/git"
+SRCREV = "524123a70761110c5cf3ccc5f52f6d4da071b959"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
+PV = "v2014.07+git${SRCPV}"
-- 
2.0.4


