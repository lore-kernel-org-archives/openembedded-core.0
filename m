Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QeWQx-0008K9-Rc
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 20:02:48 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 06 Jul 2011 10:53:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,488,1304319600"; d="scan'208";a="23378466"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.240])
	by azsmga001.ch.intel.com with ESMTP; 06 Jul 2011 10:53:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jul 2011 10:53:27 -0700
Message-Id: <7b7c1fbf9b50f097448246e63f3237c4ee2ef3db.1309974665.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1309974665.git.sgw@linux.intel.com>
References: <cover.1309974665.git.sgw@linux.intel.com>
In-Reply-To: <cover.1309974665.git.sgw@linux.intel.com>
References: <cover.1309974665.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] uboot: Add 2011.06 Version
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
X-List-Received-Date: Wed, 06 Jul 2011 18:02:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[YOCTO #1198]

Addes the 2011.06 version, while keeping the older 2011.03 version since
other layers might be using it still.  This will need to be fixed in the
future as oe-core should only be keeping the current versions and layer
management addresses this somehow.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...Drop-config.h-include-in-tools-imximage.h.patch |   39 +++++++++
 ...ove-LDSCRIPT-processing-to-the-top-level-.patch |   82 ++++++++++++++++++++
 meta/recipes-bsp/uboot/u-boot-mkimage_2011.06.bb   |   29 +++++++
 meta/recipes-bsp/uboot/u-boot_2011.06.bb           |   26 ++++++
 4 files changed, 176 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch
 create mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
 create mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage_2011.06.bb
 create mode 100644 meta/recipes-bsp/uboot/u-boot_2011.06.bb

diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch b/meta/recipes-bsp/uboot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch
new file mode 100644
index 0000000..f4b12ac
--- /dev/null
+++ b/meta/recipes-bsp/uboot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch
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
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch b/meta/recipes-bsp/uboot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
new file mode 100644
index 0000000..c102691
--- /dev/null
+++ b/meta/recipes-bsp/uboot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
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
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage_2011.06.bb b/meta/recipes-bsp/uboot/u-boot-mkimage_2011.06.bb
new file mode 100644
index 0000000..3ca0c2c
--- /dev/null
+++ b/meta/recipes-bsp/uboot/u-boot-mkimage_2011.06.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "U-boot bootloader mkimage tool"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
+                    file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90"
+SECTION = "bootloader"
+
+PR = "r0"
+
+SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "0cc5026aad02f218a9b9ac56b301c97a"
+SRC_URI[sha256sum] = "362ddb935885da98cf461eba08f31e3e59d0c4ada6cb2fa15596f43af310ba8b"
+
+S = "${WORKDIR}/u-boot-${PV}"
+
+BBCLASSEXTEND = "native nativesdk"
+
+EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
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
diff --git a/meta/recipes-bsp/uboot/u-boot_2011.06.bb b/meta/recipes-bsp/uboot/u-boot_2011.06.bb
new file mode 100644
index 0000000..acd0944
--- /dev/null
+++ b/meta/recipes-bsp/uboot/u-boot_2011.06.bb
@@ -0,0 +1,26 @@
+require u-boot.inc
+
+# To build u-boot for your machine, provide the following lines in your machine
+# config, replacing the assignments as appropriate for your machine.
+# UBOOT_MACHINE = "omap3_beagle_config"
+# UBOOT_ENTRYPOINT = "0x80008000"
+# UBOOT_LOADADDRESS = "0x80008000"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
+                    file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90"
+
+FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/u-boot-git/${MACHINE}"
+
+# This revision corresponds to the tag "v2011.06"
+# We use the revision in order to avoid having to fetch it from the repo during parse
+SRCREV = "b1af6f532e0d348b153d5c148369229d24af361a"
+
+PV = "v2011.06+git${SRCPV}"
+PR = "r0"
+
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+
+S = "${WORKDIR}/git"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.3.4



