Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 28A5C6E64A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 13:54:58 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id p25so3136616uaa.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2016 06:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=p/+NO040B6Kn+RvMFw0uvM/AKkJnqTRcXnVZw5LM1Gs=;
	b=Q1G91WpHczmD/b3sdjI9r+OyPqboLB0x5aBUhMSsW+Zqxtlu1Go9KLSCI1EwG5FHSb
	XNt/p5Fa30N6Lv2Zq8ffokUHsUN0nVvUcuZgeKj5a5rvuINDj4pwocZTO4z9gsxkB67y
	flGc6PPaQ5WTXoBu866Qza1naEseky6mlqnPweypPJeWkS2DJIiyvJYB6sO+++pd9Qqe
	lnI210ViQmv7ALJs4XOvRkTCF8SSjjiQ8h4l892ri9anEiRmbTeZtWIIIVVzuSEciE9i
	xg8kv7ATEa4270Q7kq8x1FgNgolY/NTo9Ayi8+MKmo6k88M0wmJLDrSHZtrYgOU8R0Dh
	ok0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=p/+NO040B6Kn+RvMFw0uvM/AKkJnqTRcXnVZw5LM1Gs=;
	b=R80a9t+T0OqertZrdn84ljOtiFZ7PM4/Q2y6AXA+2IJI4SKcHHuzn+cwHRc4loz4XS
	sgyxChslGrjdAkdpWsiKwUKMPFrB2Z/kzUCXgHD2FJGY02oC/Hc2Yw0g/mo1BZWs6Q38
	+5DK1QIlCk3MXYnzVPGRaAeP5JbivvgUwZL7kPuz++q1IMgrFM0i9ur/p+qcVxaU/PMI
	gDQ/1B2VsK57BTtEsVi6VB71XqtkPWv1qdgTSJw/5OQfoInAIwQna1n5S/yDIKA79fHS
	mCrr6NqGx4bIPFtHus413X8Y01TM/q1sNcrYqC62ByC1cv28O4qbLuu2YV9b3vvPEkkt
	4qCQ==
X-Gm-Message-State: AA6/9Rm/l7ijkHOmbF0XeIMJq884M8mm7FlCN70qBec7xmjLtxf72j5bhUemXy1X/5e37w==
X-Received: by 10.176.65.34 with SMTP id j31mr1963760uad.106.1475589299763;
	Tue, 04 Oct 2016 06:54:59 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.155.148])
	by smtp.gmail.com with ESMTPSA id p129sm934057vkd.4.2016.10.04.06.54.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Oct 2016 06:54:58 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Oct 2016 10:54:11 -0300
Message-Id: <1475589251-19942-2-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1475589251-19942-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1475589251-19942-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3 2/2] u-boot: Add support to use uboot-extlinux-config class
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
X-List-Received-Date: Tue, 04 Oct 2016 13:54:59 -0000

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


