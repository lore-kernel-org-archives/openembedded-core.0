Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60188CF07B3
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 06:31:27 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.37366.1728541886935311902
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 23:31:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1symhB-0005vn-6Y; Thu, 10 Oct 2024 08:30:45 +0200
Received: from [2a0a:edc0:0:1101:1d::5c] (helo=dude06.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1symhA-000mLO-4h; Thu, 10 Oct 2024 08:30:44 +0200
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1symhA-006tnK-0G;
	Thu, 10 Oct 2024 08:30:44 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v8 1/7] barebox: add initial support
Date: Thu, 10 Oct 2024 08:29:35 +0200
Message-Id: <20241010062941.1644325-2-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241010062941.1644325-1-ejo@pengutronix.de>
References: <20241010062941.1644325-1-ejo@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 06:31:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205384

From: Marco Felsch <m.felsch@pengutronix.de>

This adds the support for the barebox bootloader to oe-core. The recipe
is inspired by meta-ptx [1] but is a major rework of the one found there.

Barebox comes with a wide range of supported architectures and follows
the concepts of Linux in various aspects like the driver model, the
shell, or the virtual file system.
This not only eases porting Linux drivers but also makes barebox a
developer-friendly and feature-rich bootloader alternative [2].

For barebox (like for the kernel or other bootloaders) it is quite
likely that people will not just build the original recipe but need to
adapt it, point to custom repositories, apply patch stacks,
COMPATIBLE_MACHINE etc. They may also choose to have different recipe
names for different variants.
Having only a single .bb file and requiring to copy or .bbappend it is
inconvenient and results in unnecessary code duplication. Therefore, the
base support for building barebox is encapsulated in barebox.bbclass
(like kernel.bbclass for the kernel).

Adds barebox to maintainers.inc but excludes it from the maintainers
check since with the current check mechanism barebox would be skipped
(and making the check fail) due to not being the PREFERRED_PROVIDER for
virtual/bootloader.

[1] https://github.com/pengutronix/meta-ptx/tree/master/recipes-bsp/barebox
[2] https://www.barebox.org/demo/?graphic=0

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/classes-recipe/barebox.bbclass           | 160 ++++++++++++++++++
 meta/conf/distro/include/maintainers.inc      |   1 +
 meta/lib/oeqa/selftest/cases/distrodata.py    |   2 +-
 meta/recipes-bsp/barebox/barebox_2024.08.0.bb |  15 ++
 4 files changed, 177 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes-recipe/barebox.bbclass
 create mode 100644 meta/recipes-bsp/barebox/barebox_2024.08.0.bb

diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-recipe/barebox.bbclass
new file mode 100644
index 0000000000..200ba08326
--- /dev/null
+++ b/meta/classes-recipe/barebox.bbclass
@@ -0,0 +1,160 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+inherit kernel-arch deploy cml1 pkgconfig
+
+LICENSE ?= "GPL-2.0-only"
+
+PROVIDES += "virtual/bootloader"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+DEPENDS += "bison-native flex-native"
+
+S = "${WORKDIR}/barebox-${PV}"
+B = "${WORKDIR}/build"
+
+require conf/image-uefi.conf
+
+# For some platforms and configuration, the barebox build process will require
+# additional host tools that can be activated/deactivated here.
+PACKAGECONFIG ??= "openssl libusb fit"
+
+PACKAGECONFIG[openssl] = ",,openssl-native"
+PACKAGECONFIG[libusb] = ",,libusb1-native"
+PACKAGECONFIG[fit] = ",,u-boot-tools-native dtc-native"
+
+export KBUILD_BUILD_USER ?= "oe-user"
+export KBUILD_BUILD_HOST ?= "oe-host"
+
+# unlike the kernel, barebox may build against host tools like openssl
+export HOST_EXTRACFLAGS
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
+    PKG_CONFIG=pkg-config-native \
+    CROSS_PKG_CONFIG=pkg-config \
+"
+
+BAREBOX_CONFIG[doc] = "The barebox kconfig defconfig file. Not used if a file called defconfig is added to the SRC_URI."
+BAREBOX_CONFIG ?= ""
+
+# set sensible default configs for some of oe-core's QEMU MACHINEs
+BAREBOX_CONFIG:qemuarm = "multi_v7_defconfig"
+BAREBOX_CONFIG:qemuarm64 = "multi_v8_defconfig"
+BAREBOX_CONFIG:qemux86-64 = "efi_defconfig"
+
+# prevent from acting as non-buildable provider
+python () {
+    bareboxconfig = d.getVar('BAREBOX_CONFIG')
+    bareboxdefconfig = 'file://defconfig' in d.getVar('SRC_URI')
+
+    if not bareboxconfig and not bareboxdefconfig:
+        raise bb.parse.SkipRecipe("BAREBOX_CONFIG must be set in the %s machine configuration or file://defconfig must be given in SRC_URI." % d.getVar("MACHINE"))
+}
+
+barebox_do_configure() {
+        if [ -e ${UNPACKDIR}/defconfig ]; then
+                cp ${UNPACKDIR}/defconfig ${B}/.config
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
+BAREBOX_ENV_DIR ??= "${UNPACKDIR}/env/"
+
+barebox_do_compile () {
+        export userccflags="${TARGET_LDFLAGS}${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+        unset LDFLAGS
+        unset CFLAGS
+        unset CPPFLAGS
+        unset CXXFLAGS
+        unset MACHINE
+        # Allow to use ${UNPACKDIR} in kconfig options to include additionally fetched files
+        export UNPACKDIR=${UNPACKDIR}
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
+barebox_do_install () {
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
+barebox_do_deploy () {
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
+
+EXPORT_FUNCTIONS do_configure do_compile do_install do_deploy
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index b86c91c5d6..0fd6c14658 100644
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
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index 7771a42e2b..1e88ea82e6 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -56,7 +56,7 @@ but their recipes claim otherwise by setting UPSTREAM_VERSION_UNKNOWN. Please re
 
         def is_maintainer_exception(entry):
             exceptions = ["musl", "newlib", "picolibc", "linux-yocto", "linux-dummy", "mesa-gl", "libgfortran", "libx11-compose-data",
-                          "cve-update-nvd2-native",]
+                          "cve-update-nvd2-native", "barebox"]
             for i in exceptions:
                  if i in entry:
                      return True
diff --git a/meta/recipes-bsp/barebox/barebox_2024.08.0.bb b/meta/recipes-bsp/barebox/barebox_2024.08.0.bb
new file mode 100644
index 0000000000..98e8aa053b
--- /dev/null
+++ b/meta/recipes-bsp/barebox/barebox_2024.08.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "barebox is a bootloader designed for embedded systems. It runs on a variety of architectures including x86, ARM, MIPS, PowerPC and others."
+DESCRIPTION = "barebox aims to be a versatile and flexible bootloader not only for booting embedded Linux systems, \
+but also for initial hardware bringup and development. \
+Users should feel right at home with a shell with UNIX-like virtual file system access to hardware, \
+Linux kernel driver API for making driver porting easier, \
+and a subset of the POSIX C library for writing more command-line utilities."
+HOMEPAGE = "https://barebox.org/"
+SECTION = "bootloaders"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
+
+inherit barebox
+
+SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "b08a762da8d63dd18b4f2d9f5d0a8da001b6e608d1b3eff6dcebc6a2e575d535"
-- 
2.39.5


