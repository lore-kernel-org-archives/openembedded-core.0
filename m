Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <yanok@emcraft.com>) id 1QbZqa-0000qk-5a
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 17:05:04 +0200
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id DDCA81C01CF9;
	Tue, 28 Jun 2011 16:55:01 +0200 (CEST)
X-Auth-Info: 0suMJJsCjQD26ZcTYtXG3km63S7LYccol457snjttTI=
Received: from mail.denx.de (host-82-135-33-74.customer.m-online.net
	[82.135.33.74])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 9061D1C00065;
	Tue, 28 Jun 2011 16:55:00 +0200 (CEST)
Received: from pollux.denx.de (pollux [192.168.1.1])
	by mail.denx.de (Postfix) with ESMTP id DD86C340061;
	Tue, 28 Jun 2011 16:54:59 +0200 (CEST)
Received: by pollux.denx.de (Postfix, from userid 547)
	id 97F2E59C; Tue, 28 Jun 2011 16:54:59 +0200 (CEST)
From: Ilya Yanok <yanok@emcraft.com>
To: openembedded-core@lists.openembedded.org,
	dvhart@linux.intel.com
Date: Tue, 28 Jun 2011 16:54:51 +0200
Message-Id: <1309272891-14754-1-git-send-email-yanok@emcraft.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <4E09E2BE.3090203@linux.intel.com>
References: <4E09E2BE.3090203@linux.intel.com>
MIME-Version: 1.0
Cc: Ilya Yanok <yanok@emcraft.com>
Subject: [PATCH] u-boot-mkimage: bump version to 2011.03
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
X-List-Received-Date: Tue, 28 Jun 2011 15:05:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch changes u-boot-mkimage version to 2011.03. Unfortunately
U-Boot 2011.03 release has some problems building tools from
unconfigured tree, so this patch aslo includes the backported fixes.

Signed-off-by: Ilya Yanok <yanok@emcraft.com>
---
 ...Drop-config.h-include-in-tools-imximage.h.patch |   39 +++++++++
 ...ove-LDSCRIPT-processing-to-the-top-level-.patch |   82 ++++++++++++++++++++
 .../uboot/u-boot-mkimage-native_1.3.2.bb           |   25 ------
 meta/recipes-bsp/uboot/u-boot-mkimage_2009.08.bb   |   29 -------
 meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb   |   31 ++++++++
 5 files changed, 152 insertions(+), 54 deletions(-)
 create mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
 create mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
 delete mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage-native_1.3.2.bb
 delete mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage_2009.08.bb
 create mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb

diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch b/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
new file mode 100644
index 0000000..f4b12ac
--- /dev/null
+++ b/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
@@ -0,0 +1,39 @@
+From ce56e089ddb51dbd81bb2c86b1646d77447afe39 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Lo=C3=AFc=20Minier?= <loic.minier@linaro.org>
+Date: Thu, 3 Feb 2011 15:07:01 +0100
+Subject: Drop config.h include in tools/imximage.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Applied
+
+"make tools-all" should allow building tools such as mkimage and the new
+imximage without any config, but imximage.c currently fails to build
+with:
+imximage.h:27:20: error: config.h: No such file or directory
+
+config.h is not needed in imximage.h nor in imximage.c, and imximage.h
+is only included from imximage.c, so drop this include to fix the build.
+
+Signed-off-by: Loïc Minier <loic.minier@linaro.org>
+---
+ tools/imximage.h |    2 --
+ 1 files changed, 0 insertions(+), 2 deletions(-)
+
+diff --git a/tools/imximage.h b/tools/imximage.h
+index 38ca6be..d126a46 100644
+--- a/tools/imximage.h
++++ b/tools/imximage.h
+@@ -24,8 +24,6 @@
+ #ifndef _IMXIMAGE_H_
+ #define _IMXIMAGE_H_
+ 
+-#include <config.h>
+-
+ #define MAX_HW_CFG_SIZE_V2 121 /* Max number of registers imx can set for v2 */
+ #define MAX_HW_CFG_SIZE_V1 60  /* Max number of registers imx can set for v1 */
+ #define APP_CODE_BARKER	0xB1
+-- 
+1.7.4.4
+
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch b/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
new file mode 100644
index 0000000..c102691
--- /dev/null
+++ b/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
@@ -0,0 +1,82 @@
+From fd1b50c5ff9c288040abf5e78815151327d32e0e Mon Sep 17 00:00:00 2001
+From: Ilya Yanok <yanok@emcraft.com>
+Date: Mon, 20 Jun 2011 12:45:37 +0000
+Subject: config.mk: move LDSCRIPT processing to the top-level Makefile
+
+Upstream-Status: Applied
+
+LDSCRIPT is used only from the top-level Makefile and only when the
+system is configured so we can move LDSCRIPT and CONFIG_SYS_LDSCRIPT
+related logic into the top level Makefile and under configured condition
+to avoid errors when building tools from unconfigured tree.
+
+Signed-off-by: Ilya Yanok <yanok@emcraft.com>
+Acked-by: Mike Frysinger <vapier@gentoo.org>
+---
+ Makefile  |   30 ++++++++++++++++++++++++++++++
+ config.mk |    8 --------
+ 2 files changed, 30 insertions(+), 8 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index ece91ab..358c410 100644
+--- a/Makefile
++++ b/Makefile
+@@ -163,6 +163,36 @@ endif
+ # load other configuration
+ include $(TOPDIR)/config.mk
+ 
++# If board code explicitly specified LDSCRIPT or CONFIG_SYS_LDSCRIPT, use
++# that (or fail if absent).  Otherwise, search for a linker script in a
++# standard location.
++
++ifndef LDSCRIPT
++	#LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds.debug
++	ifdef CONFIG_SYS_LDSCRIPT
++		# need to strip off double quotes
++		LDSCRIPT := $(subst ",,$(CONFIG_SYS_LDSCRIPT))
++	endif
++endif
++
++ifndef LDSCRIPT
++	ifeq ($(CONFIG_NAND_U_BOOT),y)
++		LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot-nand.lds
++		ifeq ($(wildcard $(LDSCRIPT)),)
++			LDSCRIPT := $(TOPDIR)/$(CPUDIR)/u-boot-nand.lds
++		endif
++	endif
++	ifeq ($(wildcard $(LDSCRIPT)),)
++		LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds
++	endif
++	ifeq ($(wildcard $(LDSCRIPT)),)
++		LDSCRIPT := $(TOPDIR)/$(CPUDIR)/u-boot.lds
++	endif
++	ifeq ($(wildcard $(LDSCRIPT)),)
++$(error could not find linker script)
++	endif
++endif
++
+ #########################################################################
+ # U-Boot objects....order is important (i.e. start must be first)
+ 
+diff --git a/config.mk b/config.mk
+index fa46ff1..59c4c93 100644
+--- a/config.mk
++++ b/config.mk
+@@ -153,14 +153,6 @@ endif
+ RELFLAGS= $(PLATFORM_RELFLAGS)
+ DBGFLAGS= -g # -DDEBUG
+ OPTFLAGS= -Os #-fomit-frame-pointer
+-ifndef LDSCRIPT
+-#LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds.debug
+-ifeq ($(CONFIG_NAND_U_BOOT),y)
+-LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot-nand.lds
+-else
+-LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds
+-endif
+-endif
+ OBJCFLAGS += --gap-fill=0xff
+ 
+ gccincdir := $(shell $(CC) -print-file-name=include)
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage-native_1.3.2.bb b/meta/recipes-bsp/uboot/u-boot-mkimage-native_1.3.2.bb
deleted file mode 100644
index eab286c..0000000
--- a/meta/recipes-bsp/uboot/u-boot-mkimage-native_1.3.2.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "U-boot bootloader mkimage tool"
-LICENSE = "GPL"
-SECTION = "bootloader"
-
-SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 \
-           file://fix-arm920t-eabi.patch;patch=1"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=4c6cde5df68eff615d36789dc18edd3b"
-
-S = "${WORKDIR}/u-boot-${PV}"
-
-inherit native
-
-EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"
-
-do_compile () {
-	oe_runmake smdk2410_config
-	oe_runmake tools
-}
-
-do_install () {
-	install -d ${D}${bindir}/
-	install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
-	ln -sf uboot-mkimage ${D}${bindir}/mkimage
-}
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage_2009.08.bb b/meta/recipes-bsp/uboot/u-boot-mkimage_2009.08.bb
deleted file mode 100644
index 822acb6..0000000
--- a/meta/recipes-bsp/uboot/u-boot-mkimage_2009.08.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "U-boot bootloader mkimage tool"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4c6cde5df68eff615d36789dc18edd3b"
-SECTION = "bootloader"
-
-PR = "r1"
-
-SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "cd4788ea1c6ac4f9b100b888a1063a6b"
-SRC_URI[sha256sum] = "858fd04efd5b98e99fd1a074998b1a8ac5fbd07b176de1d20d8eb148492d949d"
-
-S = "${WORKDIR}/u-boot-${PV}"
-
-EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"
-
-BBCLASSEXTEND = "native nativesdk"
-
-do_compile () {
-  oe_runmake smdk2410_config
-  oe_runmake tools
-}
-
-do_install () {
-  install -d ${D}${bindir}
-  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
-  ln -sf uboot-mkimage ${D}${bindir}/mkimage
-}
-
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb b/meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb
new file mode 100644
index 0000000..34bae8e
--- /dev/null
+++ b/meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "U-boot bootloader mkimage tool"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
+                    file://README;beginline=1;endline=22;md5=3a00ef51d3fc96e9d6c1bc4708ccd3b5"
+SECTION = "bootloader"
+
+PR = "r1"
+
+SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 \
+           file://0001-Drop-config.h-include-in-tools-imximage.h.patch \
+           file://0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch"
+
+SRC_URI[md5sum] = "91d02124c94368557d0e9ac05fb8c33f"
+SRC_URI[sha256sum] = "08677f66d8d4ee542f6599f580cdffdf730544e1803f9d3739117d6f6d68083e"
+
+S = "${WORKDIR}/u-boot-${PV}"
+
+BBCLASSEXTEND = "native nativesdk"
+
+EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTSTRIP=true'
+
+do_compile () {
+  oe_runmake tools
+}
+
+do_install () {
+  install -d ${D}${bindir}
+  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
+  ln -sf uboot-mkimage ${D}${bindir}/mkimage
+}
+
-- 
1.7.5.4



