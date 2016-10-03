Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id AAC02719B3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 12:18:15 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id n66so10277075qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 05:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=p/+NO040B6Kn+RvMFw0uvM/AKkJnqTRcXnVZw5LM1Gs=;
	b=l8nRgG98x6jz+Pb+eRfAhtUIUAyHFTkkv9BPT37lkBtTY6EcQoSuua9YcPNSZkKrsh
	rGDchGlAtusLPqOMJ0I5L3R/zQ2o4ET9DMqugubTEaQJWLAr6bjl1CmXdeea3497f6hh
	2igkqtIh1SbVAloRDQPldhfh5YH8FbzSh4dXhRLI8m/Ud0WPq4OZ1ErwukxE0gSrhfbh
	PgjMCe5RBat3LeQRqDyoFHW22fVIrpvag65dJWlcQgZdGNdO2hkoevnOx5keGRg+e71r
	SCkOLiooU7SJ/VcLyUJW+gP5CtPD4cSR8pp1ajDL50oN9dX/9NAbobCtaQzuzqo4BnRp
	ETRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=p/+NO040B6Kn+RvMFw0uvM/AKkJnqTRcXnVZw5LM1Gs=;
	b=caNi0qZJcwP+dJyRRiB7AdofbfEnj2udmTxYRBXNbW+HPwMf0mtA/8Hplz2yr4K5lv
	C+/hL6SjjQIf98rzxec1YhcYHBpiqZ5f18LXSV5HSh1vEGfTX6UCt+iGtWQrU0ymvXgj
	RVGFhpbM+Rxht1HGexdkB5tzSWY8GxooP73qsS3ae49JNgXJh6grhI72Dt9752o6nEVj
	KpJ2CUFX7RMbXFECCMhJxJ9P1+fYiwWkfKfkxfj+1OXIB8ZdNnY4y9x25awXZjoyQrZ/
	O8stiHoE6grYTs5V5qyUVqyv6uXlg5wdL+kIE0zqRAS+9dpcZGWilnPABJqRKu3m8w4D
	7IgA==
X-Gm-Message-State: AA6/9Rk7LG58tEoA2/Qpts7JPtM4vwdJ5/Ft4XOJIFxh3Se+QRS/U9tZ0NDpX2jgWF0KMg==
X-Received: by 10.55.18.40 with SMTP id c40mr19501653qkh.269.1475497096814;
	Mon, 03 Oct 2016 05:18:16 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.100.224.38])
	by smtp.gmail.com with ESMTPSA id
	k65sm16842311qkf.7.2016.10.03.05.18.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Oct 2016 05:18:15 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2016 09:17:35 -0300
Message-Id: <1475497055-1059-2-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1475497055-1059-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1475497055-1059-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 2/2] u-boot: Add support to use uboot-extlinux-config class
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
X-List-Received-Date: Mon, 03 Oct 2016 12:18:15 -0000

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


