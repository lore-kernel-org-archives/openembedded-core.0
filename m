Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12871.1586185918252682432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 08:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: EGMV0EmA/f8rf6Bgxm+T1ox87/9ux92BNmVH83oX58VP8zn+8Wslr24Gk5hzc+dD79s1Bv8FqZ
 nMNeZMHFGZEA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:11:58 -0700
IronPort-SDR: 88h69hhqPOytua94+nvGZHDd4l/S/givX4SJM/6GhDKCmFrLG1XStbqWgDK13f1FVWvJahj0YO
 Al536UVLu1Ow==
X-IronPort-AV: E=Sophos;i="5.72,351,1580803200"; 
   d="scan'208";a="424391117"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.70.63])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:11:57 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 01/13] u-boot-tools: Split out inc file
Date: Mon,  6 Apr 2020 23:11:29 +0800
Message-Id: <2e15642ada8b5403ac933072a581b9af9a359122.1586185832.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1586185832.git.anuj.mittal@intel.com>
References: <cover.1586185832.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joshua Watt <JPEWhacker@gmail.com>

Spilts out the inc file for u-boot-tools so that BSPs can include it for
their forked version of the tools, just like u-boot.inc.

As an example, this recipe [1] builds mkimage u-boot as part of the
u-boot recipe itself. This is incorrect because u-boot is a target
recipe, which means that the uninative loader transformations do not get
applied when the recipe is restored from sstate, breaking the mkimage
command breaks. The correct solution is to have a u-boot-tools-imx
recipe that pulls in their custom u-boot source; this inc file makes
that much easier to maintain.

[1]: https://github.com/Freescale/meta-freescale/blob/aa27fc62095cfd6c147c8f6865296ddc29bf0fa6/recipes-bsp/u-boot/u-boot-imx_2019.04.bb

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2f3bd198d9b1e85f17f7a587b1690ab196ab0300)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools.inc      | 65 ++++++++++++++++++
 .../u-boot/u-boot-tools_2019.07.bb            | 67 +------------------
 2 files changed, 66 insertions(+), 66 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-tools.inc

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc b/meta/recipes-bsp/u-boot/u-boot-tools.inc
new file mode 100644
index 0000000000..35894e1a8f
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
@@ -0,0 +1,65 @@
+SUMMARY = "U-Boot bootloader tools"
+DEPENDS += "openssl"
+
+PROVIDES = "${MLPREFIX}u-boot-mkimage ${MLPREFIX}u-boot-mkenvimage"
+PROVIDES_class-native = "u-boot-mkimage-native u-boot-mkenvimage-native"
+
+PACKAGES += "${PN}-mkimage ${PN}-mkenvimage"
+
+# Required for backward compatibility with "u-boot-mkimage-xxx.bb"
+RPROVIDES_${PN}-mkimage = "u-boot-mkimage"
+RREPLACES_${PN}-mkimage = "u-boot-mkimage"
+RCONFLICTS_${PN}-mkimage = "u-boot-mkimage"
+
+EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
+EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
+EXTRA_OEMAKE_class-nativesdk = 'CROSS_COMPILE="${HOST_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
+
+SED_CONFIG_EFI = '-e "s/CONFIG_EFI_LOADER=.*/# CONFIG_EFI_LOADER is not set/"'
+SED_CONFIG_EFI_x86 = ''
+SED_CONFIG_EFI_x86-64 = ''
+SED_CONFIG_EFI_arm = ''
+SED_CONFIG_EFI_armeb = ''
+SED_CONFIG_EFI_aarch64 = ''
+
+do_compile () {
+	oe_runmake sandbox_defconfig
+
+	# Disable CONFIG_CMD_LICENSE, license.h is not used by tools and
+	# generating it requires bin2header tool, which for target build
+	# is built with target tools and thus cannot be executed on host.
+	sed -i -e "s/CONFIG_CMD_LICENSE=.*/# CONFIG_CMD_LICENSE is not set/" ${SED_CONFIG_EFI} .config
+
+	oe_runmake cross_tools NO_SDL=1
+}
+
+do_install () {
+	install -d ${D}${bindir}
+
+	# mkimage
+	install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
+	ln -sf uboot-mkimage ${D}${bindir}/mkimage
+
+	# mkenvimage
+	install -m 0755 tools/mkenvimage ${D}${bindir}/uboot-mkenvimage
+	ln -sf uboot-mkenvimage ${D}${bindir}/mkenvimage
+
+	# dumpimage
+	install -m 0755 tools/dumpimage ${D}${bindir}/uboot-dumpimage
+	ln -sf uboot-dumpimage ${D}${bindir}/dumpimage
+
+	# fit_check_sign
+	install -m 0755 tools/fit_check_sign ${D}${bindir}/uboot-fit_check_sign
+	ln -sf uboot-fit_check_sign ${D}${bindir}/fit_check_sign
+}
+
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN} = ""
+FILES_${PN}-mkimage = "${bindir}/uboot-mkimage ${bindir}/mkimage ${bindir}/uboot-dumpimage ${bindir}/dumpimage ${bindir}/uboot-fit_check_sign ${bindir}/fit_check_sign"
+FILES_${PN}-mkenvimage = "${bindir}/uboot-mkenvimage ${bindir}/mkenvimage"
+
+RDEPENDS_${PN}-mkimage += "dtc"
+RDEPENDS_${PN} += "${PN}-mkimage ${PN}-mkenvimage"
+RDEPENDS_${PN}_class-native = ""
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2019.07.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2019.07.bb
index bede984ef7..7eaf721ca8 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2019.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2019.07.bb
@@ -1,67 +1,2 @@
 require u-boot-common.inc
-
-SUMMARY = "U-Boot bootloader tools"
-DEPENDS += "openssl"
-
-PROVIDES = "${MLPREFIX}u-boot-mkimage ${MLPREFIX}u-boot-mkenvimage"
-PROVIDES_class-native = "u-boot-mkimage-native u-boot-mkenvimage-native"
-
-PACKAGES += "${PN}-mkimage ${PN}-mkenvimage"
-
-# Required for backward compatibility with "u-boot-mkimage-xxx.bb"
-RPROVIDES_${PN}-mkimage = "u-boot-mkimage"
-RREPLACES_${PN}-mkimage = "u-boot-mkimage"
-RCONFLICTS_${PN}-mkimage = "u-boot-mkimage"
-
-EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
-EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
-EXTRA_OEMAKE_class-nativesdk = 'CROSS_COMPILE="${HOST_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
-
-SED_CONFIG_EFI = '-e "s/CONFIG_EFI_LOADER=.*/# CONFIG_EFI_LOADER is not set/"'
-SED_CONFIG_EFI_x86 = ''
-SED_CONFIG_EFI_x86-64 = ''
-SED_CONFIG_EFI_arm = ''
-SED_CONFIG_EFI_armeb = ''
-SED_CONFIG_EFI_aarch64 = ''
-
-do_compile () {
-	oe_runmake sandbox_defconfig
-
-	# Disable CONFIG_CMD_LICENSE, license.h is not used by tools and
-	# generating it requires bin2header tool, which for target build
-	# is built with target tools and thus cannot be executed on host.
-	sed -i -e "s/CONFIG_CMD_LICENSE=.*/# CONFIG_CMD_LICENSE is not set/" ${SED_CONFIG_EFI} .config
-
-	oe_runmake cross_tools NO_SDL=1
-}
-
-do_install () {
-	install -d ${D}${bindir}
-
-	# mkimage
-	install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
-	ln -sf uboot-mkimage ${D}${bindir}/mkimage
-
-	# mkenvimage
-	install -m 0755 tools/mkenvimage ${D}${bindir}/uboot-mkenvimage
-	ln -sf uboot-mkenvimage ${D}${bindir}/mkenvimage
-
-	# dumpimage
-	install -m 0755 tools/dumpimage ${D}${bindir}/uboot-dumpimage
-	ln -sf uboot-dumpimage ${D}${bindir}/dumpimage
-
-	# fit_check_sign
-	install -m 0755 tools/fit_check_sign ${D}${bindir}/uboot-fit_check_sign
-	ln -sf uboot-fit_check_sign ${D}${bindir}/fit_check_sign
-}
-
-ALLOW_EMPTY_${PN} = "1"
-FILES_${PN} = ""
-FILES_${PN}-mkimage = "${bindir}/uboot-mkimage ${bindir}/mkimage ${bindir}/uboot-dumpimage ${bindir}/dumpimage ${bindir}/uboot-fit_check_sign ${bindir}/fit_check_sign"
-FILES_${PN}-mkenvimage = "${bindir}/uboot-mkenvimage ${bindir}/mkenvimage"
-
-RDEPENDS_${PN}-mkimage += "dtc"
-RDEPENDS_${PN} += "${PN}-mkimage ${PN}-mkenvimage"
-RDEPENDS_${PN}_class-native = ""
-
-BBCLASSEXTEND = "native nativesdk"
+require u-boot-tools.inc
-- 
2.25.1

