Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 778AD6AC95
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 01:18:59 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id r5so4275990qcx.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 17:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=UilnFZR/9cG08/Zm6CmlhM89F/GjDOkvLV64Erfe5to=;
	b=dHuvR7RzFH3/zdVlT8qCSC0CyVQTW9UtfbwhI7XqCnhDVNOVxZwQszXMUYQ7WiVQUO
	Y/pay2O1xsHglrt0nsvayagAhm4ahcs1y22O/cmiub1Z8BpXG4SpLXdwI+x8TX1RD9uT
	itPoI8RNa51h3hlYbybWvwNkrT++UGb4zUpEi68wBzc7E7WfO1WMzaj/BPPb0BBgLElU
	76QWtMlldrTaJeGZ5NW5MicU+znGy/kBW0sv/IZTT24/ot3m3zJ3hmKFqXWeTIOBOJHG
	mT6jw3Gvay0M+kRCuxzjPAkwTpsZopuCT5sA3kebS/D8yNTtLQRt/rom3R/DMM7z/Vc4
	ujCg==
X-Received: by 10.224.63.70 with SMTP id a6mr9141572qai.42.1421975939711;
	Thu, 22 Jan 2015 17:18:59 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id m74sm116432qgd.17.2015.01.22.17.18.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 22 Jan 2015 17:18:58 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Jan 2015 23:18:27 -0200
Message-Id: <1421975907-11814-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>,
	Otavio Salvador <otavio@ossystems.com.br>, Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] u-boot-fw-utils: Fix the cross build
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
X-List-Received-Date: Fri, 23 Jan 2015 01:19:05 -0000

This merges the u-boot-fw-utils-cross into the main u-boot-fw-utils
recipe and fixes the build failure seen since 2014.07 update.

The cross package now is handled using an extended class instead of a
duplicated recipe.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../u-boot/u-boot-fw-utils-cross_2014.07.bb        | 38 ----------------------
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb | 12 +++++++
 2 files changed, 12 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2014.07.bb

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2014.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2014.07.bb
deleted file mode 100644
index d1f1f9a..0000000
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2014.07.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
-SECTION = "bootloader"
-DEPENDS = "mtd-utils"
-
-# This revision corresponds to the tag "v2014.07"
-# We use the revision in order to avoid having to fetch it from the
-# repo during parse
-SRCREV = "524123a70761110c5cf3ccc5f52f6d4da071b959"
-
-PV = "v2014.07+git${SRCPV}"
-
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
-
-S = "${WORKDIR}/git"
-
-inherit uboot-config cross
-
-EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} ${TOOLCHAIN_OPTIONS}"'
-
-do_compile () {
-	oe_runmake ${UBOOT_MACHINE}
-	oe_runmake env
-}
-
-do_install () {
-	install -d ${D}${bindir_cross}
-	install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_printenv
-	install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_setenv
-}
-
-SYSROOT_PREPROCESS_FUNCS = "uboot_fw_utils_cross"
-uboot_fw_utils_cross() {
-	sysroot_stage_dir ${D}${bindir_cross} ${SYSROOT_DESTDIR}${bindir_cross}
-}
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb
index a626c95..9a304c8 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb
@@ -32,4 +32,16 @@ do_install () {
 	install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
 }
 
+do_install_class-cross () {
+    install -d ${D}${bindir_cross}
+    install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_printenv
+    install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_setenv
+}
+
+SYSROOT_PREPROCESS_FUNCS_class-cross = "uboot_fw_utils_cross"
+uboot_fw_utils_cross() {
+    sysroot_stage_dir ${D}${bindir_cross} ${SYSROOT_DESTDIR}${bindir_cross}
+}
+
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+BBCLASSEXTEND = "cross"
-- 
2.1.4


