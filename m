Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9B2C6FD18
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 18:48:19 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.88091.1682448497587069641
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Apr 2023 11:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1prNi2-0003kJ-W4; Tue, 25 Apr 2023 20:48:15 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1prNi2-00Dl5l-5R; Tue, 25 Apr 2023 20:48:14 +0200
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1prNi0-00209L-Ab; Tue, 25 Apr 2023 20:48:12 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	ejo@pengutronix.de,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	alexandre.belloni@bootlin.com
Subject: [PATCH v3 1/9] barebox: add initial support
Date: Tue, 25 Apr 2023 20:47:12 +0200
Message-Id: <20230425184720.456896-2-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230425184720.456896-1-ejo@pengutronix.de>
References: <20230425184720.456896-1-ejo@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 18:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180399

From: Marco Felsch <m.felsch@pengutronix.de>

This adds the support for the barebox bootloader to oe-core. The recipe
is based on the recipe found in meta-ptx [1] with a few minor adaptions.

This basic support includes the bootloader and the target tools to
interact with the bootloader. The host tools support is not part of
this commit. This will be added later on as separate recipe.

[1] https://github.com/pengutronix/meta-ptx/tree/master/recipes-bsp/barebox

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |   1 +
 meta/recipes-bsp/barebox/barebox.inc          | 144 ++++++++++++++++++
 meta/recipes-bsp/barebox/barebox_2023.04.0.bb |   3 +
 3 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-bsp/barebox/barebox.inc
 create mode 100644 meta/recipes-bsp/barebox/barebox_2023.04.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 682ec2cfdf..86d5519489 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -54,6 +54,7 @@ RECIPE_MAINTAINER:pn-automake = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-avahi = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-babeltrace = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-babeltrace2 = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER:pn-barebox = "Enrico Jörns <yocto@pengutronix.de>"
 RECIPE_MAINTAINER:pn-baremetal-helloworld = "Alejandro Hernandez <alejandro@enedino.org>"
 RECIPE_MAINTAINER:pn-base-files = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-base-passwd = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-bsp/barebox/barebox.inc b/meta/recipes-bsp/barebox/barebox.inc
new file mode 100644
index 0000000000..5609980a64
--- /dev/null
+++ b/meta/recipes-bsp/barebox/barebox.inc
@@ -0,0 +1,144 @@
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
+require conf/image-uefi.conf
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
+BAREBOX_BUILDSYSTEM_VERSION[doc] = "Build system version to add to the barebox image. By default this is the git description of the containing layer."
+BAREBOX_BUILDSYSTEM_VERSION ??= "${@get_layer_rev(os.path.dirname(d.getVar('FILE')))}"
+
+BAREBOX_FIRMWARE_DIR[doc] = "Overwrite barebox' firmware blobs search directory (CONFIG_EXTRA_FIRMWARE_DIR) with this path, default ${B}/firmware"
+BAREBOX_FIRMWARE_DIR ??= "${B}/firmware"
+
+EXTRA_OEMAKE = " \
+    CROSS_COMPILE=${TARGET_PREFIX} -C ${S} O=${B} \
+    BUILDSYSTEM_VERSION=${BAREBOX_BUILDSYSTEM_VERSION} \
+    CONFIG_EXTRA_FIRMWARE_DIR=${BAREBOX_FIRMWARE_DIR} \
+"
+
+BAREBOX_CONFIG[doc] = "The barebox kconfig defconfig file. Not used if a file called defconfig is added to the SRC_URI."
+BAREBOX_CONFIG ?= ""
+
+# prevent from acting as non-buildable provider
+python () {
+    bareboxconfig = d.getVar('BAREBOX_CONFIG')
+    bareboxdefconfig = 'file://defconfig' in d.getVar('SRC_URI')
+
+    if not bareboxconfig and not bareboxdefconfig:
+        PN = d.getVar("PN")
+        FILE = os.path.basename(d.getVar("FILE"))
+        raise bb.parse.SkipRecipe("BAREBOX_CONFIG must be set in the %s machine configuration or file://defconfig must be given in SRC_URI." % d.getVar("MACHINE"))
+}
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
+BAREBOX_ENV_DIR[doc] = "Overlay the barebox built-in environment with the environment provided by the BSP if specified."
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
+BAREBOX_BINARY[doc] = "Specify the barebox binary to install. If not specified all barebox artifacts are installed."
+BAREBOX_BINARY ??= "${@'barebox.efi' if d.getVar('EFI_PROVIDER') == 'barebox' else ''}"
+BAREBOX_SUFFIX[doc] = "Specify the suffix for ${BAREBOX_IMAGE}."
+BAREBOX_SUFFIX ??= "img"
+BAREBOX_IMAGE[doc] = "A unique barebox image name. Unused if ${BAREBOX_BINARY} is not set."
+BAREBOX_IMAGE_DEFAULT ?= "${PN}-${MACHINE}-${PV}-${PR}.${BAREBOX_SUFFIX}"
+BAREBOX_IMAGE ?= "${@'${EFI_BOOT_IMAGE}' if d.getVar('EFI_PROVIDER') == 'barebox' else '${BAREBOX_IMAGE_DEFAULT}'}"
+
+BAREBOX_INSTALL_PATH ?= "${@'${EFI_FILES_PATH}' if d.getVar('EFI_PROVIDER') == 'barebox' else '/boot'}"
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
+                install -D -m 644 ${BAREBOX_BIN} ${D}${BAREBOX_INSTALL_PATH}/${BAREBOX_IMAGE}
+                ln -sf ${BAREBOX_IMAGE} ${D}${BAREBOX_INSTALL_PATH}/${BAREBOX_BINARY}
+        else
+                install -d ${D}${BAREBOX_INSTALL_PATH}/
+                for image in $(cat ${B}/barebox-flash-images); do
+                        install -m 644 ${B}/${image} ${D}${BAREBOX_INSTALL_PATH}/
+                done
+        fi
+}
+FILES:${PN} = "${BAREBOX_INSTALL_PATH}"
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
diff --git a/meta/recipes-bsp/barebox/barebox_2023.04.0.bb b/meta/recipes-bsp/barebox/barebox_2023.04.0.bb
new file mode 100644
index 0000000000..250682b693
--- /dev/null
+++ b/meta/recipes-bsp/barebox/barebox_2023.04.0.bb
@@ -0,0 +1,3 @@
+require barebox.inc
+
+SRC_URI[sha256sum] = "c11386b2b72f7ab16c7aa21216e2119a6661d0f51420d14ab71bc9b0afc418ab"
-- 
2.39.2


