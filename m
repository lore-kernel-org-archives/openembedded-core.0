Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web11.12042.1585144922210556359
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2020 07:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jXshNG55;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id c19so2304852ioo.6
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2020 07:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=S6DlD5u2jm/PAFom0pPoOzuWIXTkxWGvQ/YcEI6ll2g=;
        b=jXshNG55e2rFDdN6NEex+41NluOkPw0jlckKNDBL24kjNeptkfgJgLot0JaDOqM6YU
         rGT1T06fysyH6+7wC6TKj89pfbvrVXNFIDvJyrB9PPZ6p/cScLbcp6nIhaQuDG+hIdV9
         F4IedM8CCK3Dq2f41Pug8PWVCQL8y6aErWcKfRE4R+5mG0MOTZbalWs2NzexqzyhvBae
         jw7E9931K57dnwMSk0fMFzcDCskxa9Nu1lHHXJBWSHTSu5E53sKnUaKSJ40QQ2KOwK+C
         FFOTiQQb0tfOvW/aAkdH4VsU/OPWdB3HfWvLpsnM2FjOM4t0bs2elP23eOu6fOb4cBdK
         BwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=S6DlD5u2jm/PAFom0pPoOzuWIXTkxWGvQ/YcEI6ll2g=;
        b=g4nWY/DbgfAjilCKOPIsjGRMIABn9wz+dz4/zBZp7edGK6Mrt46zK89nKVpVVqPnjj
         Odub5LGHcQN3FJDyr632fOnfgzClIeXycGqAOEj/N0dM6R0vnS8V6ojg6Jli2HTigmWj
         +TmqMR4cfBRddp7Yqqrg5BhDflW49T8lN5Rz2JWTh2s/peD13EmKeuZ/CqMrdwjUwPDK
         Vl9ZKKs2sMrmDYF/eVpDp9JDBK5y4q+6lPo8yODPxPOhLsdp6nHtAhF5ft1mI/3+uwro
         ZBOOT6XRY87XtxR6O1lwangC+re5ah5zYHIk+vbl4fmkQBoK6eqI3Xd8wescte2wSYr3
         d+lA==
X-Gm-Message-State: ANhLgQ3lv/9h7SFYS1MsziWi6WEugSu3qiA9y5Jd3Lo2euhvffHdClk8
	PN/qftV62n1XC6UPufO46shgtcNP
X-Google-Smtp-Source: ADFU+vtwQklsbgk/i52rABoqiFIPUUDPwe8uQAyZ2Vfl3ogmY9Y04I8M6qbS+a1FXHW27odrmsntrA==
X-Received: by 2002:a6b:4409:: with SMTP id r9mr3013030ioa.75.1585144920813;
        Wed, 25 Mar 2020 07:02:00 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:4502:9c5c:525f:934a])
        by smtp.gmail.com with ESMTPSA id b6sm2610676iok.19.2020.03.25.07.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 07:01:59 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: marek.vasut@gmail.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] u-boot-tools: Split out inc file
Date: Wed, 25 Mar 2020 09:01:57 -0500
Message-Id: <20200325140157.34577-1-JPEWhacker@gmail.com>
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
---
 meta/recipes-bsp/u-boot/u-boot-tools.inc      | 66 ++++++++++++++++++
 .../u-boot/u-boot-tools_2020.01.bb            | 67 +------------------
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
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb
index 414ee333ff..7eaf721ca8 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb
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
-	oe_runmake -C ${S} sandbox_defconfig O=${B}
-
-	# Disable CONFIG_CMD_LICENSE, license.h is not used by tools and
-	# generating it requires bin2header tool, which for target build
-	# is built with target tools and thus cannot be executed on host.
-	sed -i -e "s/CONFIG_CMD_LICENSE=.*/# CONFIG_CMD_LICENSE is not set/" ${SED_CONFIG_EFI} ${B}/.config
-
-	oe_runmake -C ${S} cross_tools NO_SDL=1 O=${B}
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

