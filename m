Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id 4A2A272CD5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 22:40:22 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NIN00E70IZ9O0A0@vms173023.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 23 Jan 2015 16:40:22 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=LrklEcZZ c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=YNv0rlydsVwA:10
	a=sozttTNsAAAA:8 a=x2GZnTqNAAAA:8	a=voM4FWlXAAAA:8
	a=0iXo97YPku2DkTaiWWgA:9 a=YP4rb1El8FCVLOHH:21
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4DDD2200DD;	Fri,
	23 Jan 2015 17:40:19 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Jan 2015 17:40:18 -0500
Message-id: <1422052818-3276-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v2] u-boot: update to version 2015.01
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
X-List-Received-Date: Fri, 23 Jan 2015 22:40:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - rebase on top of fw-utils combining patch from Otavio

 .../0001-tools-env-fix-build-error.patch           | 36 ++++++++++++++++++++++
 ...utils_2014.07.bb => u-boot-fw-utils_2015.01.bb} | 21 +++++++------
 ...kimage_2014.07.bb => u-boot-mkimage_2015.01.bb} | 20 ++++++------
 meta/recipes-bsp/u-boot/u-boot.inc                 |  2 +-
 .../{u-boot_2014.07.bb => u-boot_2015.01.bb}       |  6 ++--
 5 files changed, 61 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils/0001-tools-env-fix-build-error.patch
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2014.07.bb => u-boot-fw-utils_2015.01.bb} (58%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2014.07.bb => u-boot-mkimage_2015.01.bb} (45%)
 rename meta/recipes-bsp/u-boot/{u-boot_2014.07.bb => u-boot_2015.01.bb} (50%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils/0001-tools-env-fix-build-error.patch b/meta/recipes-bsp/u-boot/u-boot-fw-utils/0001-tools-env-fix-build-error.patch
new file mode 100644
index 0000000..381b505
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils/0001-tools-env-fix-build-error.patch
@@ -0,0 +1,36 @@
+From ee2d75513452aa6d5306fd380104adc8a2f6d8f2 Mon Sep 17 00:00:00 2001
+From: Masahiro Yamada <yamada.m@jp.panasonic.com>
+Date: Wed, 3 Dec 2014 10:22:50 +0900
+Subject: [PATCH] tools: env: fix build error
+
+Since CONFIG_SYS_ARCH, CONFIG_SYS_CPU, ... were moved to Kconfig,
+tools/env/fw_printenv fails to build if CONFIG_ENV_VARS_UBOOT_CONFIG
+is defined.
+(I do not think this is the right way to fix the problem, but
+for now I do not have enough time to take a close look.)
+
+Upstream-Status: Submitted [http://patchwork.ozlabs.org/patch/417192/]
+
+Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
+Reported-by: Denys Dmytriyenko <denys@ti.com>
+---
+ tools/env/fw_env.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/tools/env/fw_env.c b/tools/env/fw_env.c
+index 1173eea..698fe51 100644
+--- a/tools/env/fw_env.c
++++ b/tools/env/fw_env.c
+@@ -8,6 +8,9 @@
+  * SPDX-License-Identifier:	GPL-2.0+
+  */
+ 
++/* FIXME: Do not include this */
++#include <linux/kconfig.h>
++
+ #include <errno.h>
+ #include <env_flags.h>
+ #include <fcntl.h>
+-- 
+2.2.0
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2015.01.bb
similarity index 58%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2015.01.bb
index 9a304c8..17453ca 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2015.01.bb
@@ -1,21 +1,24 @@
 SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=c7383a594871c03da76b3707929d2919"
 SECTION = "bootloader"
 DEPENDS = "mtd-utils"
 
-# This revision corresponds to the tag "v2014.07"
+# This revision corresponds to the tag "v2015.01"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "524123a70761110c5cf3ccc5f52f6d4da071b959"
+SRCREV = "92fa7f53f1f3f03296f8ffb14bdf1baefab83368"
 
-PV = "v2014.07+git${SRCPV}"
+PV = "v2015.01+git${SRCPV}"
 
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git \
+           file://0001-tools-env-fix-build-error.patch"
 
 S = "${WORKDIR}/git"
 
 INSANE_SKIP_${PN} = "already-stripped"
+EXTRA_OEMAKE_class-target = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}"'
+EXTRA_OEMAKE_class-cross = 'ARCH=${TARGET_ARCH}'
 
 inherit uboot-config
 
@@ -33,14 +36,14 @@ do_install () {
 }
 
 do_install_class-cross () {
-    install -d ${D}${bindir_cross}
-    install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_printenv
-    install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_setenv
+	install -d ${D}${bindir_cross}
+	install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_printenv
+	install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_setenv
 }
 
 SYSROOT_PREPROCESS_FUNCS_class-cross = "uboot_fw_utils_cross"
 uboot_fw_utils_cross() {
-    sysroot_stage_dir ${D}${bindir_cross} ${SYSROOT_DESTDIR}${bindir_cross}
+	sysroot_stage_dir ${D}${bindir_cross} ${SYSROOT_DESTDIR}${bindir_cross}
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2014.07.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb
similarity index 45%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2014.07.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb
index eabf680..1bfdf9d 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2014.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb
@@ -1,28 +1,26 @@
 SUMMARY = "U-Boot bootloader image creation tool"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=c7383a594871c03da76b3707929d2919"
 SECTION = "bootloader"
 
-# This revision corresponds to the tag "v2014.07"
+DEPENDS = "openssl"
+
+# This revision corresponds to the tag "v2015.01"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "524123a70761110c5cf3ccc5f52f6d4da071b959"
+SRCREV = "92fa7f53f1f3f03296f8ffb14bdf1baefab83368"
 
-PV = "v2014.07+git${SRCPV}"
+PV = "v2015.01+git${SRCPV}"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
+EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC}" STRIP=true'
 
 do_compile () {
-	# Make sure the recompile is OK
-	rm -f ${B}/tools/.depend
-
-	make HOSTCC="${BUILD_CC}" HOSTLD="${BUILD_LD}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTSTRIP=true dot-config=0 scripts_basic
-	sed 's/^tools-only: scripts_basic /tools-only: /' -i Makefile
-	oe_runmake tools-only
+	oe_runmake sandbox_defconfig
+	oe_runmake cross_tools NO_SDL=1
 }
 
 do_install () {
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index c695b73..4edab84 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -4,7 +4,7 @@ SECTION = "bootloaders"
 PROVIDES = "virtual/bootloader"
 
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=c7383a594871c03da76b3707929d2919"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot_2014.07.bb b/meta/recipes-bsp/u-boot/u-boot_2015.01.bb
similarity index 50%
rename from meta/recipes-bsp/u-boot/u-boot_2014.07.bb
rename to meta/recipes-bsp/u-boot/u-boot_2015.01.bb
index 44cc52e..6feac31 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2014.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2015.01.bb
@@ -2,8 +2,8 @@ require u-boot.inc
 
 DEPENDS += "dtc-native"
 
-# This revision corresponds to the tag "v2014.07"
+# This revision corresponds to the tag "v2015.01"
 # We use the revision in order to avoid having to fetch it from the repo during parse
-SRCREV = "524123a70761110c5cf3ccc5f52f6d4da071b959"
+SRCREV = "92fa7f53f1f3f03296f8ffb14bdf1baefab83368"
 
-PV = "v2014.07+git${SRCPV}"
+PV = "v2015.01+git${SRCPV}"
-- 
2.2.0


