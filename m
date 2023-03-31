Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3235C77B6E
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 10:40:47 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.51477.1680259240427921403
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 03:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1piCBS-0002Hp-EK; Fri, 31 Mar 2023 12:40:38 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1piCBQ-007yTu-1T; Fri, 31 Mar 2023 12:40:36 +0200
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1piCBP-006DmJ-6x; Fri, 31 Mar 2023 12:40:35 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	ejo@pengutronix.de,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	alexandre.belloni@bootlin.com
Subject: [PATCH v2 2/9] barebox-tools: add initial barebox tools support
Date: Fri, 31 Mar 2023 12:40:18 +0200
Message-Id: <20230331104025.1478393-3-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331104025.1478393-1-ejo@pengutronix.de>
References: <20230331104025.1478393-1-ejo@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 10:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179424

From: Marco Felsch <m.felsch@pengutronix.de>

Add initial support to build the barebox tools for the host and the
target.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../barebox/barebox-tools_2023.03.0.bb        | 56 +++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-bsp/barebox/barebox-tools_2023.03.0.bb

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
diff --git a/meta/recipes-bsp/barebox/barebox-tools_2023.03.0.bb b/meta/recipes-bsp/barebox/barebox-tools_2023.03.0.bb
new file mode 100644
index 0000000000..9ab1b6303d
--- /dev/null
+++ b/meta/recipes-bsp/barebox/barebox-tools_2023.03.0.bb
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
+SRC_URI[sha256sum] = "d0f78a69ba240327247c8fd0e1d45287e4a0dff99ed847e9a696cc2da0cf388c"
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
2.39.2


