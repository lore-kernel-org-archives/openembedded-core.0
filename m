Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C4DC77B7C
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 18:48:20 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.88088.1682448496952519082
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Apr 2023 11:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1prNi2-0003kI-W2; Tue, 25 Apr 2023 20:48:15 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1prNi2-00Dl5g-1b; Tue, 25 Apr 2023 20:48:14 +0200
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1prNi0-00209P-BD; Tue, 25 Apr 2023 20:48:12 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	ejo@pengutronix.de,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	alexandre.belloni@bootlin.com
Subject: [PATCH v3 2/9] barebox-tools: add initial barebox tools support
Date: Tue, 25 Apr 2023 20:47:13 +0200
Message-Id: <20230425184720.456896-3-ejo@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 18:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180391

From: Marco Felsch <m.felsch@pengutronix.de>

Add initial support to build the barebox tools for the host and the
target.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../barebox/barebox-tools_2023.04.0.bb        | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-bsp/barebox/barebox-tools_2023.04.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 86d5519489..1a0ba10d3b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -55,6 +55,7 @@ RECIPE_MAINTAINER:pn-avahi = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-babeltrace = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-babeltrace2 = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-barebox = "Enrico Jörns <yocto@pengutronix.de>"
+RECIPE_MAINTAINER:pn-barebox-tools = "Enrico Jörns <yocto@pengutronix.de>"
 RECIPE_MAINTAINER:pn-baremetal-helloworld = "Alejandro Hernandez <alejandro@enedino.org>"
 RECIPE_MAINTAINER:pn-base-files = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-base-passwd = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-bsp/barebox/barebox-tools_2023.04.0.bb b/meta/recipes-bsp/barebox/barebox-tools_2023.04.0.bb
new file mode 100644
index 0000000000..d409e75bcb
--- /dev/null
+++ b/meta/recipes-bsp/barebox/barebox-tools_2023.04.0.bb
@@ -0,0 +1,58 @@
+SUMMARY = "barebox bootloader tools"
+HOMEPAGE = "https://barebox.org/"
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
+
+DEPENDS = "libusb1 bison-native flex-native"
+
+SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "c11386b2b72f7ab16c7aa21216e2119a6661d0f51420d14ab71bc9b0afc418ab"
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
+  CC='${CC}' \
+  LD='${LD}' \
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
2.39.2


