Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id 8FDB665D4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Apr 2014 19:05:46 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N460082RVPMBE40@vms173023.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 17 Apr 2014 14:05:47 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A066220091; Thu,
	17 Apr 2014 15:05:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org,	yocto@yoctoproject.org
Date: Thu, 17 Apr 2014 15:05:33 -0400
Message-id: <1397761533-10634-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.2
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] u-boot: fix beaglebone boot issue with large kernel images
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
X-List-Received-Date: Thu, 17 Apr 2014 19:05:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Fix beaglebone boot issue with large kernel images overwriting Device Tree.
See very detailed comments inside the patch.

The original patch is being reviewed upstream and is targeting mainline U-boot
version 2014.07. This is the adaptation of the patch for 2013.07 version we use

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch | 74 ++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2013.07.bb          |  4 +-
 2 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch b/meta/recipes-bsp/u-boot/files/0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch
new file mode 100644
index 0000000..77e35bb
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch
@@ -0,0 +1,74 @@
+From 5701384cea4a829b772bf7a96a74825b58c22385 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Thu, 17 Apr 2014 12:25:40 -0400
+Subject: [PATCH] am335x_evm.h: Add, use DEFAULT_LINUX_BOOT_ENV environment
+ string
+
+Modified version of the patch currently being reviewed for mainline:
+http://patchwork.ozlabs.org/patch/334861/
+
+To deal with a reoccurring problem properly we need to specify addresses
+for the Linux kernel, Flatted Device Tree and ramdisk that obey the
+constraints within the kernel's Documentation/arm/Booting file but also
+make sure that we relocate things within a valid address range.
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+Signed-off-by: Tom Rini <trini@ti.com>
+
+Upstream-Status: Pending
+---
+ include/configs/am335x_evm.h | 31 ++++++++++++++++++++++++++-----
+ 1 file changed, 26 insertions(+), 5 deletions(-)
+
+diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
+index c5a6d4b..01e32b3 100644
+--- a/include/configs/am335x_evm.h
++++ b/include/configs/am335x_evm.h
+@@ -54,10 +54,7 @@
+ #define CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG
+ #ifndef CONFIG_SPL_BUILD
+ #define CONFIG_EXTRA_ENV_SETTINGS \
+-	"loadaddr=0x80200000\0" \
+-	"fdtaddr=0x80F80000\0" \
+-	"fdt_high=0xffffffff\0" \
+-	"rdaddr=0x81000000\0" \
++	DEFAULT_LINUX_BOOT_ENV \
+ 	"bootdir=/boot\0" \
+ 	"bootfile=uImage\0" \
+ 	"fdtfile=undefined\0" \
+@@ -197,7 +194,31 @@
+ #define CONFIG_SYS_MEMTEST_END		(CONFIG_SYS_MEMTEST_START \
+ 					+ (8 * 1024 * 1024))
+ 
+-#define CONFIG_SYS_LOAD_ADDR		0x81000000 /* Default load address */
++/*
++ * Our DDR memory always starts at 0x80000000 and U-Boot shall have
++ * relocated itself to higher in memory by the time this value is used.
++ * However, set this to a 32MB offset to allow for easier Linux kernel
++ * booting as the default is often used as the kernel load address.
++ */
++#define CONFIG_SYS_LOAD_ADDR		0x82000000 /* Default load address */
++
++/*
++ * We setup defaults based on constraints from the Linux kernel, which should
++ * also be safe elsewhere.  We have the default load at 32MB into DDR (for
++ * the kernel), FDT above 128MB (the maximum location for the end of the
++ * kernel), and the ramdisk 512KB above that (allowing for hopefully never
++ * seen large trees).  We say all of this must be within the first 256MB
++ * as that will normally be within the kernel lowmem and thus visible via
++ * bootm_size and we only run on platforms with 256MB or more of memory.
++ */
++#define DEFAULT_LINUX_BOOT_ENV \
++	"loadaddr=0x82000000\0" \
++	"kernel_addr_r=0x82000000\0" \
++	"fdtaddr=0x88000000\0" \
++	"fdt_addr_r=0x88000000\0" \
++	"rdaddr=0x88080000\0" \
++	"ramdisk_addr_r=0x88080000\0" \
++	"bootm_size=0x10000000\0"
+ 
+ #define CONFIG_MMC
+ #define CONFIG_GENERIC_MMC
+-- 
+1.9.2
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
index 3141a2d..f8a8856 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
@@ -16,7 +16,9 @@ SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
 
 PV = "v2013.07+git${SRCPV}"
 
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
+           file://0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.2


