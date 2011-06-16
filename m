Received: from mail-out.m-online.net ([212.18.0.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <yanok@emcraft.com>) id 1QX0IQ-0003Hm-7E
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 02:18:54 +0200
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 836F4188B595;
	Thu, 16 Jun 2011 02:09:37 +0200 (CEST)
X-Auth-Info: lPIVZcl+ZpNmwazR0aGX+KzNEhDcNEJMaKEZlg5iLO8=
Received: from mail.denx.de (host-82-135-33-74.customer.m-online.net
	[82.135.33.74])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 95C301C000AB;
	Thu, 16 Jun 2011 02:09:37 +0200 (CEST)
Received: from pollux.denx.de (pollux [192.168.1.1])
	by mail.denx.de (Postfix) with ESMTP id 5C07F4210799;
	Thu, 16 Jun 2011 02:09:37 +0200 (CEST)
Received: by pollux.denx.de (Postfix, from userid 547)
	id C2C3418565A27; Thu, 16 Jun 2011 02:09:36 +0200 (CEST)
From: Ilya Yanok <yanok@emcraft.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jun 2011 02:09:31 +0200
Message-Id: <1308182971-23082-1-git-send-email-yanok@emcraft.com>
X-Mailer: git-send-email 1.7.4.4
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
X-List-Received-Date: Thu, 16 Jun 2011 00:18:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This patch changes u-boot-mkimage version to 2011.03 and includes
patches to build tools without configuring U-Boot for specific board.

Signed-off-by: Ilya Yanok <yanok@emcraft.com>
---
 ...Drop-config.h-include-in-tools-imximage.h.patch |   39 ++++++
 ...e-it-possible-to-build-tools-unconfigured.patch |  137 ++++++++++++++=
++++++
 .../uboot/u-boot-mkimage-native_1.3.2.bb           |   25 ----
 meta/recipes-bsp/uboot/u-boot-mkimage_2009.08.bb   |   29 ----
 meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb   |   31 +++++
 5 files changed, 207 insertions(+), 54 deletions(-)
 create mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0001-Dr=
op-config.h-include-in-tools-imximage.h.patch
 create mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0002-to=
ols-make-it-possible-to-build-tools-unconfigured.patch
 delete mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage-native_1.3.2.bb
 delete mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage_2009.08.bb
 create mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb

diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0001-Drop-conf=
ig.h-include-in-tools-imximage.h.patch b/meta/recipes-bsp/uboot/u-boot-mk=
image-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
new file mode 100644
index 0000000..f4b12ac
--- /dev/null
+++ b/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0001-Drop-config.h-in=
clude-in-tools-imximage.h.patch
@@ -0,0 +1,39 @@
+From ce56e089ddb51dbd81bb2c86b1646d77447afe39 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Lo=3DC3=3DAFc=3D20Minier?=3D <loic.minier@linaro.org>
+Date: Thu, 3 Feb 2011 15:07:01 +0100
+Subject: Drop config.h include in tools/imximage.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
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
+Signed-off-by: Lo=EFc Minier <loic.minier@linaro.org>
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
+=20
+-#include <config.h>
+-
+ #define MAX_HW_CFG_SIZE_V2 121 /* Max number of registers imx can set f=
or v2 */
+ #define MAX_HW_CFG_SIZE_V1 60  /* Max number of registers imx can set f=
or v1 */
+ #define APP_CODE_BARKER	0xB1
+--=20
+1.7.4.4
+
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0002-tools-mak=
e-it-possible-to-build-tools-unconfigured.patch b/meta/recipes-bsp/uboot/=
u-boot-mkimage-2011.03/0002-tools-make-it-possible-to-build-tools-unconfi=
gured.patch
new file mode 100644
index 0000000..6a4036c
--- /dev/null
+++ b/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0002-tools-make-it-po=
ssible-to-build-tools-unconfigured.patch
@@ -0,0 +1,137 @@
+From c0325ba617db3dde28a0a7667bfd1a548e98ba0f Mon Sep 17 00:00:00 2001
+From: Ilya Yanok <yanok@emcraft.com>
+Date: Wed, 15 Jun 2011 23:23:37 +0200
+Subject: tools: make it possible to build tools unconfigured
+
+Upstream-Status: Submitted
+
+Sometimes we want to build common tools without configuring for specific
+target. Currently top Makefile has some support for this but it doesn't
+work. This patch tries to fix this.
+Things changed:
+ - config.mk   disable 'ld script not found error' in case if we are
+building tools only.
+ - Makefile    mkimage relies on autogenerated version so we need to
+move $(VERSION_FILE) rule out of ifeq and make tools rule depend on it.
+ - tools/Makefile put common/env_embedded.o and envcrc.o to object list
+conditionally. This fixes errors during dependency generation.
+
+Signed-off-by: Ilya Yanok <yanok@emcraft.com>
+---
+ Makefile       |   30 +++++++++++++++++-------------
+ tools/Makefile |   19 ++++++++++++++++---
+ 2 files changed, 33 insertions(+), 16 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index ece91ab..734b503 100644
+--- a/Makefile
++++ b/Makefile
+@@ -140,7 +140,7 @@ SUBDIRS	=3D tools \
+ 	  examples/standalone \
+ 	  examples/api
+=20
+-.PHONY : $(SUBDIRS)
++.PHONY : $(SUBDIRS) $(VERSION_FILE)
+=20
+ ifeq ($(obj)include/config.mk,$(wildcard $(obj)include/config.mk))
+=20
+@@ -414,15 +414,6 @@ $(ONENAND_IPL):	$(TIMESTAMP_FILE) $(VERSION_FILE) $=
(obj)include/autoconf.mk
+ $(U_BOOT_ONENAND):	$(ONENAND_IPL) $(obj)u-boot.bin
+ 		cat $(ONENAND_BIN) $(obj)u-boot.bin > $(obj)u-boot-onenand.bin
+=20
+-$(VERSION_FILE):
+-		@( printf '#define U_BOOT_VERSION "U-Boot %s%s"\n' "$(U_BOOT_VERSION)=
" \
+-		 '$(shell $(TOPDIR)/tools/setlocalversion $(TOPDIR))' ) > $@.tmp
+-		@( printf '#define CC_VERSION_STRING "%s"\n' \
+-		 '$(shell $(CC) --version | head -n 1)' )>>  $@.tmp
+-		@( printf '#define LD_VERSION_STRING "%s"\n' \
+-		 '$(shell $(LD) -v | head -n 1)' )>>  $@.tmp
+-		@cmp -s $@ $@.tmp && rm -f $@.tmp || mv -f $@.tmp $@
+-
+ $(TIMESTAMP_FILE):
+ 		@LC_ALL=3DC date +'#define U_BOOT_DATE "%b %d %C%y"' > $@
+ 		@LC_ALL=3DC date +'#define U_BOOT_TIME "%T"' >> $@
+@@ -497,20 +488,33 @@ $(obj)lib/asm-offsets.s:	$(obj)include/autoconf.mk=
.dep \
+ else	# !config.mk
+ all $(obj)u-boot.hex $(obj)u-boot.srec $(obj)u-boot.bin \
+ $(obj)u-boot.img $(obj)u-boot.dis $(obj)u-boot \
+-$(filter-out tools,$(SUBDIRS)) $(TIMESTAMP_FILE) $(VERSION_FILE) \
++$(filter-out tools,$(SUBDIRS)) $(TIMESTAMP_FILE) \
+ updater depend dep tags ctags etags cscope $(obj)System.map:
+ 	@echo "System not configured - see README" >&2
+ 	@ exit 1
+=20
+-tools:
++tools:	$(VERSION_FILE)
+ 	$(MAKE) -C $@ all
+ endif	# config.mk
+=20
++$(VERSION_FILE):
++		@( localvers=3D'$(shell $(TOPDIR)/tools/setlocalversion $(TOPDIR))' ;=
 \
++		   printf '#define PLAIN_VERSION "%s%s"\n' \
++			"$(U_BOOT_VERSION)" "$${localvers}" ; \
++		   printf '#define U_BOOT_VERSION "U-Boot %s%s"\n' \
++			"$(U_BOOT_VERSION)" "$${localvers}" ; \
++		) > $@.tmp
++		@( printf '#define CC_VERSION_STRING "%s"\n' \
++		 '$(shell $(CC) --version | head -n 1)' )>>  $@.tmp
++		@( printf '#define LD_VERSION_STRING "%s"\n' \
++		 '$(shell $(LD) -v | head -n 1)' )>>  $@.tmp
++		@cmp -s $@ $@.tmp && rm -f $@.tmp || mv -f $@.tmp $@
++
+ easylogo env gdb:
+ 	$(MAKE) -C tools/$@ all MTD_VERSION=3D${MTD_VERSION}
+ gdbtools: gdb
+=20
+-tools-all: easylogo env gdb
++tools-all: easylogo env gdb $(VERSION_FILE)
+ 	$(MAKE) -C tools HOST_TOOLS_ALL=3Dy
+=20
+ .PHONY : CHANGELOG
+diff --git a/tools/Makefile b/tools/Makefile
+index 623f908..30ae0b5 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -67,7 +67,14 @@ BIN_FILES-$(CONFIG_NETCONSOLE) +=3D ncb$(SFX)
+ BIN_FILES-$(CONFIG_SHA1_CHECK_UB_IMG) +=3D ubsha1$(SFX)
+=20
+ # Source files which exist outside the tools directory
+-EXT_OBJ_FILES-y +=3D common/env_embedded.o
++EXT_OBJ_FILES-$(CONFIG_ENV_IS_EMBEDDED) +=3D common/env_embedded.o
++EXT_OBJ_FILES-$(CONFIG_ENV_IS_IN_DATAFLASH) +=3D common/env_embedded.o
++EXT_OBJ_FILES-$(CONFIG_ENV_IS_IN_EEPROM) +=3D common/env_embedded.o
++EXT_OBJ_FILES-$(CONFIG_ENV_IS_IN_FLASH) +=3D common/env_embedded.o
++EXT_OBJ_FILES-$(CONFIG_ENV_IS_IN_ONENAND) +=3D common/env_embedded.o
++EXT_OBJ_FILES-$(CONFIG_ENV_IS_IN_NAND) +=3D common/env_embedded.o
++EXT_OBJ_FILES-$(CONFIG_ENV_IS_IN_NVRAM) +=3D common/env_embedded.o
++EXT_OBJ_FILES-$(CONFIG_ENV_IS_IN_SPI_FLASH) +=3D common/env_embedded.o
+ EXT_OBJ_FILES-y +=3D common/image.o
+ EXT_OBJ_FILES-y +=3D lib/crc32.o
+ EXT_OBJ_FILES-y +=3D lib/md5.o
+@@ -77,7 +84,14 @@ EXT_OBJ_FILES-y +=3D lib/sha1.o
+ OBJ_FILES-$(CONFIG_LCD_LOGO) +=3D bmp_logo.o
+ OBJ_FILES-$(CONFIG_VIDEO_LOGO) +=3D bmp_logo.o
+ NOPED_OBJ_FILES-y +=3D default_image.o
+-OBJ_FILES-y +=3D envcrc.o
++OBJ_FILES-$(CONFIG_ENV_IS_EMBEDDED) +=3D envcrc.o
++OBJ_FILES-$(CONFIG_ENV_IS_IN_DATAFLASH) +=3D envcrc.o
++OBJ_FILES-$(CONFIG_ENV_IS_IN_EEPROM) +=3D envcrc.o
++OBJ_FILES-$(CONFIG_ENV_IS_IN_FLASH) +=3D envcrc.o
++OBJ_FILES-$(CONFIG_ENV_IS_IN_ONENAND) +=3D envcrc.o
++OBJ_FILES-$(CONFIG_ENV_IS_IN_NAND) +=3D envcrc.o
++OBJ_FILES-$(CONFIG_ENV_IS_IN_NVRAM) +=3D envcrc.o
++OBJ_FILES-$(CONFIG_ENV_IS_IN_SPI_FLASH) +=3D envcrc.o
+ NOPED_OBJ_FILES-y +=3D fit_image.o
+ OBJ_FILES-$(CONFIG_CMD_NET) +=3D gen_eth_addr.o
+ OBJ_FILES-$(CONFIG_CMD_LOADS) +=3D img2srec.o
+@@ -149,7 +163,6 @@ HOSTCPPFLAGS =3D	-idirafter $(SRCTREE)/include \
+ 		-DUSE_HOSTCC \
+ 		-D__KERNEL_STRICT_NAMES
+=20
+-
+ all:	$(obj).depend $(BINS) $(LOGO-y) subdirs
+=20
+ $(obj)bin2header$(SFX): $(obj)bin2header.o
+--=20
+1.7.4.4
+
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage-native_1.3.2.bb b/meta=
/recipes-bsp/uboot/u-boot-mkimage-native_1.3.2.bb
deleted file mode 100644
index eab286c..0000000
--- a/meta/recipes-bsp/uboot/u-boot-mkimage-native_1.3.2.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION =3D "U-boot bootloader mkimage tool"
-LICENSE =3D "GPL"
-SECTION =3D "bootloader"
-
-SRC_URI =3D "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 \
-           file://fix-arm920t-eabi.patch;patch=3D1"
-
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4c6cde5df68eff615d36789dc18ed=
d3b"
-
-S =3D "${WORKDIR}/u-boot-${PV}"
-
-inherit native
-
-EXTRA_OEMAKE =3D "CROSS_COMPILE=3D${TARGET_PREFIX}"
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
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage_2009.08.bb b/meta/reci=
pes-bsp/uboot/u-boot-mkimage_2009.08.bb
deleted file mode 100644
index 822acb6..0000000
--- a/meta/recipes-bsp/uboot/u-boot-mkimage_2009.08.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION =3D "U-boot bootloader mkimage tool"
-LICENSE =3D "GPLv2+"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4c6cde5df68eff615d36789dc18ed=
d3b"
-SECTION =3D "bootloader"
-
-PR =3D "r1"
-
-SRC_URI =3D "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
-
-SRC_URI[md5sum] =3D "cd4788ea1c6ac4f9b100b888a1063a6b"
-SRC_URI[sha256sum] =3D "858fd04efd5b98e99fd1a074998b1a8ac5fbd07b176de1d2=
0d8eb148492d949d"
-
-S =3D "${WORKDIR}/u-boot-${PV}"
-
-EXTRA_OEMAKE =3D "CROSS_COMPILE=3D${TARGET_PREFIX}"
-
-BBCLASSEXTEND =3D "native nativesdk"
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
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb b/meta/reci=
pes-bsp/uboot/u-boot-mkimage_2011.03.bb
new file mode 100644
index 0000000..25c1009
--- /dev/null
+++ b/meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb
@@ -0,0 +1,31 @@
+DESCRIPTION =3D "U-boot bootloader mkimage tool"
+LICENSE =3D "GPLv2+"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a5651=
ecb \
+                    file://README;beginline=3D1;endline=3D22;md5=3D3a00e=
f51d3fc96e9d6c1bc4708ccd3b5"
+SECTION =3D "bootloader"
+
+PR =3D "r1"
+
+SRC_URI =3D "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 \
+           file://0001-Drop-config.h-include-in-tools-imximage.h.patch \
+           file://0002-tools-make-it-possible-to-build-tools-unconfigure=
d.patch"
+
+SRC_URI[md5sum] =3D "91d02124c94368557d0e9ac05fb8c33f"
+SRC_URI[sha256sum] =3D "08677f66d8d4ee542f6599f580cdffdf730544e1803f9d37=
39117d6f6d68083e"
+
+S =3D "${WORKDIR}/u-boot-${PV}"
+
+BBCLASSEXTEND =3D "native nativesdk"
+
+EXTRA_OEMAKE =3D 'HOSTCC=3D"${CC}" HOSTLD=3D"${LD}" HOSTSTRIP=3Dtrue'
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
--=20
1.7.4.4



