Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id CEAD96FF9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 20:34:26 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id n189so4675073qke.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 13:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=p/+NO040B6Kn+RvMFw0uvM/AKkJnqTRcXnVZw5LM1Gs=;
	b=BcCYgBZMXRVDHbgxQEeCgWnc+4dhna/4DZdHWvpAP5noJrfRoOXHC/YDbG1k/2Mcla
	iiUmGXogznSE//gjQ+NU3m7DcuJ/2rTaXBnt+PYuwn052pH5o9v12/SHUvGvJwKrIKMZ
	6grhUgezJVg30v/C4sY1xVTFrLmzwWf7utyRbsSh9ThBBnERHsaQXGTmuwJjRc87zKwf
	c6TjKVltkCEvG8q8G/DQRHWjXGnp4+Wgv42o7O+Yx57c3OONqohUWUENYiCkjIDL2t9o
	R3fC70HcQ29bWCCnPnGdkW76w9GPa20rsc5hN2lUjSuZtRwlZPtp98S6ls8AQKNTaplO
	al8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=p/+NO040B6Kn+RvMFw0uvM/AKkJnqTRcXnVZw5LM1Gs=;
	b=TY8BCUDv/l8Y+t+M2FDkeOR1C10VBV97W5kgDpp2lpuq39voXTI165+joJkH1Dq/es
	d9Dx9fkBSrbAApjgmayW+Mgp0A6dS4d2foAC2QX4hjPv6tSc/9iwawWm9P/HRx04Iqeb
	L+diNWafkHfb48vWgo7+cvN7fUWwtj9UNZvOogPlOwjsfNaHkEgvhZvisr82A/8s04Dc
	0Ke+zB2WR6OzowjewqMnYjLDz7nlDvC2O2n39ymMp5iaBnPS9LprEIL9WyJaKiE78mk/
	AWIxxxGwNl7T8bnaiSCMULJ27licmFpcCxq+98ANwG/eGph4pZP+xohiXBVFnQFzT4Ql
	6Rvw==
X-Gm-Message-State: AA6/9RlQZ/ACVnCjsvXoZ+o/zg9Batxy07TltglJrW6bYCvFwiDew9Ix1pFOXYxPn4LZdg==
X-Received: by 10.55.65.70 with SMTP id o67mr8882648qka.305.1475267667400;
	Fri, 30 Sep 2016 13:34:27 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.100.224.38])
	by smtp.gmail.com with ESMTPSA id
	x201sm11040682qkx.32.2016.09.30.13.34.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 13:34:26 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2016 17:33:56 -0300
Message-Id: <1475267636-3510-2-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1475267636-3510-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1475267636-3510-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] u-boot: Add support to use uboot-extlinux-config class
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
X-List-Received-Date: Fri, 30 Sep 2016 20:34:27 -0000

Use uboot-extlinux-config class to create extlinux.conf file and then
install inside /boot/extlinux directory and also put file to deploy
dir. This file will be only create if UBOOT_EXTLINUX is set to 1.

You can use DEPLOYDIR/extlinux.conf file to install into final image
using wic setting:

IMAGE_BOOT_FILES_append = " extlinux.conf;extlinux/extlinux.conf"

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 2a94d26..252aae9 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -13,7 +13,7 @@ B = "${WORKDIR}/build"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit uboot-config uboot-sign deploy
+inherit uboot-config uboot-extlinux-config uboot-sign deploy
 
 EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
 EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
@@ -65,6 +65,12 @@ UBOOT_ENV_BINARY ?= "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
 UBOOT_ENV_IMAGE ?= "${UBOOT_ENV}-${MACHINE}-${PV}-${PR}.${UBOOT_ENV_SUFFIX}"
 UBOOT_ENV_SYMLINK ?= "${UBOOT_ENV}-${MACHINE}.${UBOOT_ENV_SUFFIX}"
 
+# U-Boot EXTLINUX variables. U-Boot searches for /boot/extlinux/extlinux.conf
+# to find EXTLINUX conf file.
+UBOOT_EXTLINUX_INSTALL_DIR ?= "/boot/extlinux"
+UBOOT_EXTLINUX_CONF_NAME ?= "extlinux.conf"
+UBOOT_EXTLINUX_SYMLINK ?= "${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}-${PR}"
+
 do_compile () {
 	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'ld-is-gold', '', d)}" = "ld-is-gold" ] ; then
 		sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' ${S}/config.mk
@@ -192,6 +198,12 @@ do_install () {
         install -m 644 ${WORKDIR}/${UBOOT_ENV_BINARY} ${D}/boot/${UBOOT_ENV_IMAGE}
         ln -sf ${UBOOT_ENV_IMAGE} ${D}/boot/${UBOOT_ENV_BINARY}
     fi
+
+    if [ "${UBOOT_EXTLINUX}" = "1" ]
+    then
+        install -Dm 0644 ${UBOOT_EXTLINUX_CONFIG} ${D}/${UBOOT_EXTLINUX_INSTALL_DIR}/${UBOOT_EXTLINUX_CONF_NAME}
+    fi
+
 }
 
 FILES_${PN} = "/boot ${sysconfdir}"
@@ -291,6 +303,13 @@ do_deploy () {
         ln -sf ${UBOOT_ENV_IMAGE} ${DEPLOYDIR}/${UBOOT_ENV_BINARY}
         ln -sf ${UBOOT_ENV_IMAGE} ${DEPLOYDIR}/${UBOOT_ENV_SYMLINK}
     fi
+
+    if [ "${UBOOT_EXTLINUX}" = "1" ]
+    then
+        install -m 644 ${UBOOT_EXTLINUX_CONFIG} ${DEPLOYDIR}/${UBOOT_EXTLINUX_SYMLINK}
+        ln -sf ${UBOOT_EXTLINUX_SYMLINK} ${DEPLOYDIR}/${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}
+        ln -sf ${UBOOT_EXTLINUX_SYMLINK} ${DEPLOYDIR}/${UBOOT_EXTLINUX_CONF_NAME}
+    fi
 }
 
 addtask deploy before do_build after do_compile
-- 
2.1.4


