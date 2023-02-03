Return-Path: <m.felsch@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C68CC05027
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 13:50:30 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.10652.1675432221865281530
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 05:50:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: mfe@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1pNwSJ-0001kM-Qv; Fri, 03 Feb 2023 14:50:19 +0100
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1pNwSH-002PSA-0F; Fri, 03 Feb 2023 14:50:18 +0100
Received: from mfe by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1pNwSH-008fdp-BN; Fri, 03 Feb 2023 14:50:17 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH 2/2] barebox-tools: add initial barebox tools support
Date: Fri,  3 Feb 2023 14:50:11 +0100
Message-Id: <20230203135011.2061939-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230203135011.2061939-1-m.felsch@pengutronix.de>
References: <20230203135011.2061939-1-m.felsch@pengutronix.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176715

Add initial support to build the barebox tools for the host and the
target.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 .../barebox/barebox-tools_2023.01.0.bb        | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 meta/recipes-bsp/barebox/barebox-tools_2023.01.0.bb

diff --git a/meta/recipes-bsp/barebox/barebox-tools_2023.01.0.bb b/meta/recipes-bsp/barebox/barebox-tools_2023.01.0.bb
new file mode 100644
index 0000000000..b1f7aa0b91
--- /dev/null
+++ b/meta/recipes-bsp/barebox/barebox-tools_2023.01.0.bb
@@ -0,0 +1,56 @@
+SUMMARY = "barebox bootloader tools"
+HOMEPAGE = "https://barebox.org/"
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
+
+DEPENDS = "libusb1 bison-native flex-native"
+
+SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "20532daff1720fbefa0e02dba0294e6817d29c155f49b9b549db9577435fc7b6"
+
+S = "${WORKDIR}/barebox-${PV}"
+B = "${WORKDIR}/build"
+
+inherit pkgconfig
+
+EXTRA_OEMAKE = " \
+  ARCH=sandbox \
+  CROSS_COMPILE=${TARGET_PREFIX} -C ${S} O=${B} \
+  CROSS_PKG_CONFIG=pkg-config \
+  "
+
+do_compile:class-target () {
+    export userccflags="${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+    export userldflags="${TARGET_LDFLAGS}${TOOLCHAIN_OPTIONS}"
+    oe_runmake targettools_defconfig
+    oe_runmake scripts
+}
+
+do_compile:class-native () {
+    oe_runmake hosttools_defconfig
+    oe_runmake scripts
+}
+
+BAREBOX_TOOLS = " \
+         bareboxenv \
+         bareboxcrc32 \
+         kernel-install \
+         bareboximd \
+         omap3-usb-loader \
+         omap4_usbboot \
+         imx/imx-usb-loader \
+         "
+
+BAREBOX_TOOLS_SUFFIX = ""
+BAREBOX_TOOLS_SUFFIX:class-target = "-target"
+
+do_install () {
+	install -d ${D}${bindir}
+
+	for tool in ${BAREBOX_TOOLS}; do
+		install -m 0755 scripts/${tool}${BAREBOX_TOOLS_SUFFIX} ${D}${bindir}/${tool##*/}
+	done
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


