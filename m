Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web11.6698.1585747683705277935
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 06:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oXW+WbBR;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id x16so22995749ilp.12
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2020 06:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=nxJXqcojfilbaguH84xIr3O1M6cEkAI523sWKhJe4fw=;
        b=oXW+WbBRRwFtH9T2lRVslmPFtU1TIr8LTXLtoAjg+nW5kwGc2/eB5d8/NjYxqtqfDq
         R7TYFLsxR0ZxZnllicmbTwPIAGgXJlzgfFbNwRcGnik9vZJflQuPGRVd5FMvW6KQieiO
         4KEOM4v+tCOep8CZfhhZimtRaf9ETfnLAFOpZ2WWHsN7+0DOkTP3UbwsEoWER+T8Bi/8
         3kE3gMji6ZnLuDvTg9MIQzaCrPhJutXNEbwBUOxF4u0gMnZQApZvNM6AX5OFzEy9rb81
         CtSK8XXnJPN3BNSoFO3RMJr5ZFaL5JUDr4gV9fqeKNGYgjYBfs4+RpmG8gdtc3gN7p78
         rHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=nxJXqcojfilbaguH84xIr3O1M6cEkAI523sWKhJe4fw=;
        b=caaA+N+KPAip2eeHZDtc6hJFfxX6NL1eu97NKrPO6JLefRU0Q6RciE8ySohENxaGPR
         btjhl0hqdtMcJ/FU+QwrHpWDY/++VYjQScKnRQi7/Bsae7aCS8cDAftbiXFWGkqMSET9
         ECvz2ySRR0K7+TYEA2tavY8vc0v+gN3DLet9v1nZKODjCjMLiCC0CH5p+EfQpt4AD8X9
         fWKHxjHgZ/psQikUBk5p6+xGEMoFm+/iX5D/GJ+giW1KouaNYR+LRv7AkdNQqo413gAz
         zo2OcNmbq+bCVwi6NVpb1n+gdm7F6YPAAMStzbeV9UspwEfe5Fi3HpWJx36bBCkGnkpG
         vs+A==
X-Gm-Message-State: ANhLgQ30U3Y9604+ULqohv8K8hSxUjGmGlp2+KeNgF/Erxgne15GiV2a
	e+DW5Aof8QhNAAmzEQ3XUTdBQvVOCws=
X-Google-Smtp-Source: ADFU+vuf4Swxd5QMUJ83eOUXMaN1o1Ux+Om/yTlyV7nFic/oBnM+thd4c6jm2kk31pdrlOjn/TDTZQ==
X-Received: by 2002:a92:58d0:: with SMTP id z77mr19976156ilf.67.1585747682756;
        Wed, 01 Apr 2020 06:28:02 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:f063:bb2d:1dd1:efc2])
        by smtp.gmail.com with ESMTPSA id f80sm706772ild.25.2020.04.01.06.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 06:28:02 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][zeus][PATCH] u-boot-tools: Split out inc file
Date: Wed,  1 Apr 2020 08:27:57 -0500
Message-Id: <20200401132757.21453-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1

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
---
 meta/recipes-bsp/u-boot/u-boot-tools.inc      | 66 ++++++++++++++++++
 .../u-boot/u-boot-tools_2019.07.bb            | 67 +------------------
 2 files changed, 67 insertions(+), 66 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-tools.inc

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc b/meta/recipes-bsp/u-boot/u-boot-tools.inc
new file mode 100644
index 0000000000..8ae290acc6
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
@@ -0,0 +1,66 @@
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
+	oe_runmake -C ${S} sandbox_defconfig O=${B}
+
+	# Disable CONFIG_CMD_LICENSE, license.h is not used by tools and
+	# generating it requires bin2header tool, which for target build
+	# is built with target tools and thus cannot be executed on host.
+	sed -i -e "s/CONFIG_CMD_LICENSE=.*/# CONFIG_CMD_LICENSE is not set/" ${SED_CONFIG_EFI} ${B}/.config
+
+	oe_runmake -C ${S} cross_tools NO_SDL=1 O=${B}
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
+
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
2.17.1

