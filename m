Return-Path: <marex@denx.de>
X-Greylist: delayed 457 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 04 Sep 2016 16:28:03 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id CD1027665F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Sep 2016 16:28:03 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3sRymJ1bSRz3hlTV;
	Sun,  4 Sep 2016 18:21:36 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3sRymJ1LVjzvkGQ;
	Sun,  4 Sep 2016 18:21:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id qXZH3FL79kDd; Sun,  4 Sep 2016 18:21:34 +0200 (CEST)
X-Auth-Info: 2wfctJeGkGmz86aTXEkPRLWPohjfrj1b9rjdel0OQFE=
Received: from chi.lan (unknown [195.140.253.167])
	by mail.mnet-online.de (Postfix) with ESMTPA;
	Sun,  4 Sep 2016 18:21:34 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Sep 2016 18:21:29 +0200
Message-Id: <20160904162130.13313-1-marex@denx.de>
X-Mailer: git-send-email 2.9.3
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH 1/2] u-boot: Factor out common bits
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
X-List-Received-Date: Sun, 04 Sep 2016 16:28:07 -0000

The u-boot recipes share a couple of common variables, which makes
updating of the recipes error prone and a toil. Factor those common
bits into u-boot-common.inc so that they are in one place.

No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc          | 16 ++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb | 16 ++--------------
 meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb  | 17 ++---------------
 meta/recipes-bsp/u-boot/u-boot.inc                 | 10 ++--------
 meta/recipes-bsp/u-boot/u-boot_2016.03.bb          |  7 -------
 5 files changed, 22 insertions(+), 44 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-common.inc

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
new file mode 100644
index 0000000..403e316
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -0,0 +1,16 @@
+HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
+SECTION = "bootloaders"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
+
+# This revision corresponds to the tag "v2016.03"
+# We use the revision in order to avoid having to fetch it from the
+# repo during parse
+SRCREV = "df61a74e6845ec9bdcdd48d2aff5e9c2c6debeaa"
+
+PV = "v2016.03+git${SRCPV}"
+
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
+
+S = "${WORKDIR}/git"
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb
index 79f1548..e35cf4d 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb
@@ -1,20 +1,8 @@
+require u-boot-common.inc
+
 SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
-SECTION = "bootloader"
 DEPENDS = "mtd-utils"
 
-# This revision corresponds to the tag "v2016.03"
-# We use the revision in order to avoid having to fetch it from the
-# repo during parse
-SRCREV = "df61a74e6845ec9bdcdd48d2aff5e9c2c6debeaa"
-
-PV = "v2016.03+git${SRCPV}"
-
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
-
-S = "${WORKDIR}/git"
-
 INSANE_SKIP_${PN} = "already-stripped"
 EXTRA_OEMAKE_class-target = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
 EXTRA_OEMAKE_class-cross = 'ARCH=${TARGET_ARCH} CC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb
index d5921a0..5e23f73 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb
@@ -1,21 +1,8 @@
-SUMMARY = "U-Boot bootloader image creation tool"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
-SECTION = "bootloader"
+require u-boot-common.inc
 
+SUMMARY = "U-Boot bootloader image creation tool"
 DEPENDS = "openssl"
 
-# This revision corresponds to the tag "v2016.03"
-# We use the revision in order to avoid having to fetch it from the
-# repo during parse
-SRCREV = "df61a74e6845ec9bdcdd48d2aff5e9c2c6debeaa"
-
-PV = "v2016.03+git${SRCPV}"
-
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
-
-S = "${WORKDIR}/git"
-
 EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" STRIP=true V=1'
 
 do_compile () {
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 2a94d26..e5ca1c5 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -1,14 +1,8 @@
+require u-boot-common.inc
+
 SUMMARY = "Universal Boot Loader for embedded devices"
-HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
-SECTION = "bootloaders"
 PROVIDES = "virtual/bootloader"
 
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
-
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
-
-S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot_2016.03.bb
index 836b0ce..2a16915 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2016.03.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2016.03.bb
@@ -1,10 +1,3 @@
 require u-boot.inc
 
 DEPENDS += "dtc-native"
-
-# This revision corresponds to the tag "v2016.03"
-# We use the revision in order to avoid having to fetch it from the
-# repo during parse
-SRCREV = "df61a74e6845ec9bdcdd48d2aff5e9c2c6debeaa"
-
-PV = "v2016.03+git${SRCPV}"
-- 
2.9.3


