Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8809CECE564
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 07:21:10 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.17244.1725952860929283685
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 00:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1snvBK-0004oH-GN; Tue, 10 Sep 2024 09:20:58 +0200
Received: from [2a0a:edc0:0:1101:1d::5c] (helo=dude06.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1snvBJ-006qD5-IK; Tue, 10 Sep 2024 09:20:57 +0200
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1snvBJ-00GYER-1f;
	Tue, 10 Sep 2024 09:20:57 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH v4 2/7] barebox-tools: add initial barebox tools support
Date: Tue, 10 Sep 2024 09:20:01 +0200
Message-Id: <20240910072006.3938401-3-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910072006.3938401-1-ejo@pengutronix.de>
References: <20240910072006.3938401-1-ejo@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 07:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204337

From: Marco Felsch <m.felsch@pengutronix.de>

Add initial support to build the barebox tools for the host and the
target.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../barebox/barebox-tools_2024.08.0.bb        | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-bsp/barebox/barebox-tools_2024.08.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 1b3d485e48..067c4af096 100644
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
diff --git a/meta/recipes-bsp/barebox/barebox-tools_2024.08.0.bb b/meta/recipes-bsp/barebox/barebox-tools_2024.08.0.bb
new file mode 100644
index 0000000000..25f4998d4a
--- /dev/null
+++ b/meta/recipes-bsp/barebox/barebox-tools_2024.08.0.bb
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
+SRC_URI[sha256sum] = "b08a762da8d63dd18b4f2d9f5d0a8da001b6e608d1b3eff6dcebc6a2e575d535"
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


