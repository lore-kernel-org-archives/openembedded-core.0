Return-Path: <m.felsch@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8E8C636D6
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 13:50:30 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.10865.1675432221810995115
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 05:50:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: mfe@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1pNwSJ-0001kL-Qu; Fri, 03 Feb 2023 14:50:19 +0100
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1pNwSG-002PS9-W9; Fri, 03 Feb 2023 14:50:18 +0100
Received: from mfe by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1pNwSH-008fdd-AN; Fri, 03 Feb 2023 14:50:17 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH 1/2] barebox: add initial support
Date: Fri,  3 Feb 2023 14:50:10 +0100
Message-Id: <20230203135011.2061939-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 13:50:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176716

This adds the support for the barebox bootloader to oe-core. The recipe
is based on the recipe found in meta-ptx [1] with a few minor adaptions.

This basic support includes the bootloader and the target tools to
interact with the bootloader. The host tools support is not part of
this commit. This will be added later on as separate recipe.

[1] https://github.com/pengutronix/meta-ptx/tree/master/recipes-bsp/barebox

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 meta/conf/documentation.conf                  |   7 +
 meta/recipes-bsp/barebox/barebox.inc          | 123 ++++++++++++++++++
 meta/recipes-bsp/barebox/barebox_2023.01.0.bb |   5 +
 ...IMAGE_COMPRESSION-per-default-to-lz4.patch |  40 ++++++
 4 files changed, 175 insertions(+)
 create mode 100644 meta/recipes-bsp/barebox/barebox.inc
 create mode 100644 meta/recipes-bsp/barebox/barebox_2023.01.0.bb
 create mode 100644 meta/recipes-bsp/barebox/files/0001-pbl-set-IMAGE_COMPRESSION-per-default-to-lz4.patch

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index a27d7a53c3..99e8f8e730 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -77,6 +77,13 @@ AUTOREV[doc] = "When SRCREV is set to the value of this variable, it specifies t
 
 B[doc] = "The Build Directory. The OpenEmbedded build system places generated objects into the Build Directory during a recipe's build process."
 BAD_RECOMMENDATIONS[doc] = "A list of packages not to install despite being recommended by a recipe. Support for this variable exists only when using the IPK or RPM packaging backends."
+BAREBOX_BUILDSYSTEM_VERSION[doc] = "Build system version to add to the barebox image. By default this is the git description of the containing layer."
+BAREBOX_CONFIG[doc] = "The barebox kconfig defconfig file. Not used if a file called defconfig is added to the SRC_URI."
+BAREBOX_ENV_DIR[doc] = "Overlay the barebox built-in environment with the environment provided by the BSP if specified."
+BAREBOX_BINARY[doc] = "Specify the barebox binary to install. If not specified all barebox artifacts are installed."
+BAREBOX_IMAGE[doc] = "A unique barebox image name. Unused if ${BAREBOX_BINARY} is not set."
+BAREBOX_SUFFIX[doc] = "Specify the suffix for ${BAREBOX_IMAGE}."
+BAREBOX_FIRMWARE_DIR[doc] = "Overwrite barebox' firmware blobs search directory (CONFIG_EXTRA_FIRMWARE_DIR) with this path, default ${B}/firmware"
 BB_DANGLINGAPPENDS_WARNONLY[doc] = "Defines how BitBake handles situations where an append file (.bbappend) has no corresponding recipe file (.bb)."
 BB_DISKMON_DIRS[doc] = "Monitors disk space and available inodes during the build and allows you to control the build based on these parameters."
 BB_DISKMON_WARNINTERVAL[doc] = "Defines the disk space and free inode warning intervals. To set these intervals, define the variable in the conf/local.conf file in the Build Directory."
diff --git a/meta/recipes-bsp/barebox/barebox.inc b/meta/recipes-bsp/barebox/barebox.inc
new file mode 100644
index 0000000000..896db9739f
--- /dev/null
+++ b/meta/recipes-bsp/barebox/barebox.inc
@@ -0,0 +1,123 @@
+SUMMARY = "barebox is a bootloader designed for embedded systems. It runs on a variety of architectures including x86, ARM, MIPS, PowerPC and others."
+HOMEPAGE = "https://barebox.org/"
+SECTION = "bootloaders"
+PROVIDES = "virtual/bootloader"
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit kernel-arch deploy cml1 pkgconfig
+
+# libusb1 is only required for usb tools like imx-usb-loader. These tools may
+# be enabled within the defconfig file so depend on it here to be more user
+# friendly (do not abort the build). The actual tools are provided by the
+# barebox-tools package.
+DEPENDS = "libusb1 bison-native flex-native"
+
+export KBUILD_BUILD_USER ?= "oe-user"
+export KBUILD_BUILD_HOST ?= "oe-host"
+
+SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
+
+S = "${WORKDIR}/barebox-${PV}"
+B = "${WORKDIR}/build"
+
+def get_layer_rev(path):
+    try:
+        rev, _ = bb.process.run("git describe --match='' --always --dirty --broken", cwd=path)
+    except bb.process.ExecutionError:
+        rev = ""
+    return rev.strip()
+
+BAREBOX_BUILDSYSTEM_VERSION ??= "${@get_layer_rev(os.path.dirname(d.getVar('FILE')))}"
+
+BAREBOX_FIRMWARE_DIR ??= "${B}/firmware"
+
+EXTRA_OEMAKE = " \
+    CROSS_COMPILE=${TARGET_PREFIX} -C ${S} O=${B} \
+    BUILDSYSTEM_VERSION=${BAREBOX_BUILDSYSTEM_VERSION} \
+    CONFIG_EXTRA_FIRMWARE_DIR=${BAREBOX_FIRMWARE_DIR} \
+"
+
+BAREBOX_CONFIG ?= ""
+
+do_configure() {
+        if [ -e ${WORKDIR}/defconfig ]; then
+                cp ${WORKDIR}/defconfig ${B}/.config
+        else
+                if [ -n "${BAREBOX_CONFIG}" ]; then
+                        oe_runmake ${BAREBOX_CONFIG}
+                else
+                        bbfatal "No defconfig given. Either add file 'file://defconfig' to SRC_URI or set BAREBOX_CONFIG"
+                fi
+        fi
+
+        ${S}/scripts/kconfig/merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
+        cml1_do_configure
+}
+
+BAREBOX_ENV_DIR ??= "${WORKDIR}/env/"
+
+do_compile () {
+        export userccflags="${TARGET_LDFLAGS}${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+        unset LDFLAGS
+        unset CFLAGS
+        unset CPPFLAGS
+        unset CXXFLAGS
+        unset MACHINE
+
+        if [ -d ${BAREBOX_ENV_DIR} ]; then
+                BAREBOX_DEFAULT_ENV="$(grep ^CONFIG_DEFAULT_ENVIRONMENT_PATH .config | cut -d '=' -f 2 | tr -d '"')"
+                oe_runmake CONFIG_DEFAULT_ENVIRONMENT_PATH="\"${BAREBOX_DEFAULT_ENV} ${BAREBOX_ENV_DIR}\""
+        else
+                oe_runmake
+        fi
+}
+
+BAREBOX_BINARY ??= ""
+BAREBOX_SUFFIX ??= "img"
+BAREBOX_SUFFIX:x86 ??= "efi"
+BAREBOX_SUFFIX:x86-64 ??= "efi"
+BAREBOX_IMAGE ?= "${PN}-${MACHINE}-${PV}-${PR}.${BAREBOX_SUFFIX}"
+
+do_install () {
+        if [ -n "${BAREBOX_BINARY}" ]; then
+
+                BAREBOX_BIN=${B}/${BAREBOX_BINARY}
+                if [ ! -f "${BAREBOX_BIN}" ]; then
+                        BAREBOX_BIN=${B}/images/${BAREBOX_BINARY}
+                fi
+                if [ ! -f "${BAREBOX_BIN}" ]; then
+                        bbfatal "Failed to locate ${BAREBOX_BINARY}"
+                fi
+
+                install -D -m 644 ${BAREBOX_BIN} ${D}/boot/${BAREBOX_IMAGE}
+                ln -sf ${BAREBOX_IMAGE} ${D}/boot/${BAREBOX_BINARY}
+        else
+                install -d ${D}/boot/
+                for image in $(cat ${B}/barebox-flash-images); do
+                        install -m 644 ${B}/${image} ${D}/boot/
+                done
+        fi
+}
+FILES:${PN} = "/boot"
+
+do_deploy () {
+        if [ -n "${BAREBOX_BINARY}" ]; then
+
+                BAREBOX_BIN=${B}/${BAREBOX_BINARY}
+                if [ ! -f "${BAREBOX_BIN}" ]; then
+                        BAREBOX_BIN=${B}/images/${BAREBOX_BINARY}
+                fi
+
+                install -D -m 644 ${BAREBOX_BIN} ${DEPLOYDIR}/${BAREBOX_IMAGE}
+                ln -sf ${BAREBOX_IMAGE} ${DEPLOYDIR}/${BAREBOX_BINARY}
+        else
+                for image in $(cat ${B}/barebox-flash-images); do
+                        cp ${B}/${image} ${DEPLOYDIR}
+                done
+        fi
+}
+addtask deploy after do_compile
diff --git a/meta/recipes-bsp/barebox/barebox_2023.01.0.bb b/meta/recipes-bsp/barebox/barebox_2023.01.0.bb
new file mode 100644
index 0000000000..ca0c1566cf
--- /dev/null
+++ b/meta/recipes-bsp/barebox/barebox_2023.01.0.bb
@@ -0,0 +1,5 @@
+require barebox.inc
+
+SRC_URI[sha256sum] = "20532daff1720fbefa0e02dba0294e6817d29c155f49b9b549db9577435fc7b6"
+
+SRC_URI += "file://0001-pbl-set-IMAGE_COMPRESSION-per-default-to-lz4.patch"
diff --git a/meta/recipes-bsp/barebox/files/0001-pbl-set-IMAGE_COMPRESSION-per-default-to-lz4.patch b/meta/recipes-bsp/barebox/files/0001-pbl-set-IMAGE_COMPRESSION-per-default-to-lz4.patch
new file mode 100644
index 0000000000..f37d608cf6
--- /dev/null
+++ b/meta/recipes-bsp/barebox/files/0001-pbl-set-IMAGE_COMPRESSION-per-default-to-lz4.patch
@@ -0,0 +1,40 @@
+From d8ea183cc1894b04b12f466a8779e61f0c1ac681 Mon Sep 17 00:00:00 2001
+From: Marco Felsch <m.felsch@pengutronix.de>
+Date: Tue, 6 Dec 2022 12:26:14 +0100
+Subject: [PATCH] pbl: set IMAGE_COMPRESSION per default to lz4
+
+The LZO compression hasn't been updated since 2017 and embedded build
+tools like Yocto dropping the support for it [1]. So switch to LZ4 as
+default since this seems to be the most comparable compression standard
+according Ahmads measurements [2] and the kernel suggestion [3].
+
+[1] https://lore.kernel.org/all/20220524152401.1663317-9-ross.burton@arm.com/
+[2] https://lore.barebox.org/barebox/20220713100922.1880282-1-a.fatoum@pengutronix.de/
+[3] https://lkml.org/lkml/2020/7/1/848
+
+Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
+Link: https://lore.barebox.org/20221206112614.2612071-1-m.felsch@pengutronix.de
+Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
+
+Upstream-Status: Backport
+[https://git.pengutronix.de/cgit/barebox/commit/?h=next&id=d8ea183cc1894b04b12f466a8779e61f0c1ac681]
+---
+ pbl/Kconfig | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pbl/Kconfig b/pbl/Kconfig
+index ba809af2d5..91970c19bc 100644
+--- a/pbl/Kconfig
++++ b/pbl/Kconfig
+@@ -63,7 +63,7 @@ if IMAGE_COMPRESSION
+ 
+ choice
+ 	prompt "Compression"
+-	default IMAGE_COMPRESSION_LZO
++	default IMAGE_COMPRESSION_LZ4
+ 
+ config IMAGE_COMPRESSION_LZ4
+ 	bool "lz4"
+-- 
+2.30.2
+
-- 
2.30.2


