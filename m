Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id C1CE37297B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 04:55:13 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id y13so5129714pdi.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 20:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6FQroffiym5KHwRobKq0X6Kuth9WQGPR1UwP8rBVt68=;
	b=TLAaxp6sdZGJprFqxRbk4lcFkMhm5G7hnPNJOmhEiGgHoABFU2IWzcrFAECo2Gnhpq
	8IfOat/4yRw44W3ETgI3S25RXAkKYdkV2d0+kv8wJ/zXt9O4Jlt0CLzMM5oYkBfxnc86
	bAD8bxpsCHX9MRkluP4+fRrUv3DOOuw3l13ObfvLO1rCJ1HwH5Dpj2s4uP4Prx4ipsC6
	SvAU3DUFQSbY5eWL4joqmQSxnO7mHqtWu3a7LZVoTSVU+fR6yTBTa3oJlPoqNye5n5pZ
	3FjYtH7FzU92M2WO/wVMTPPKPVcwNh4Qdv2VXj70+oAZknYOVSb8AA+kc0ea/LlmWHmW
	zjOQ==
X-Received: by 10.66.254.33 with SMTP id af1mr5328513pad.106.1419224114551;
	Sun, 21 Dec 2014 20:55:14 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	nx1sm15835688pdb.85.2014.12.21.20.55.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Dec 2014 20:55:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Dec 2014 20:54:59 -0800
Message-Id: <1419224101-24900-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1419224101-24900-1-git-send-email-akuster808@gmail.com>
References: <1419224101-24900-1-git-send-email-akuster808@gmail.com>
Subject: [[PATCH 3/5] libxaw: move from meta-oe to core.
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
X-List-Received-Date: Mon, 22 Dec 2014 04:55:14 -0000

xinit, xterm and xclock depend on libxaw so move to to core too.

add x11 to required DISTRO_FEATURES check

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libxaw_1.0.10.bb | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxaw_1.0.10.bb

diff --git a/meta/recipes-graphics/xorg-lib/libxaw_1.0.10.bb b/meta/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
new file mode 100644
index 0000000..807717c
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
@@ -0,0 +1,33 @@
+require recipes-graphics/xorg-lib/xorg-lib-common.inc
+SUMMARY = "X Athena Widget Set"
+DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxau xmlto-native"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=1c65719d42900bb81b83e8293c20a364"
+
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
+PE = "1"
+PR = "r2"
+
+SRC_URI[md5sum] = "f1ea52debce7a18cc26b21647a00ad8b"
+SRC_URI[sha256sum] = "2d96bcf92638b8ec5c91d379f5ec2e7b15133adeb2ba22066d48bf3239ee1bdd"
+
+do_install_append () {
+    ln -sf libXaw6.so.6 ${D}${libdir}/libXaw.so.6
+    ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so.7
+    ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so
+}
+
+inherit distro_features_check
+
+PACKAGES =+ "libxaw6 libxaw7 libxaw8"
+
+FILES_libxaw6 = "${libdir}/libXaw*.so.6*"
+FILES_libxaw7 = "${libdir}/libXaw*.so.7*"
+FILES_libxaw8 = "${libdir}/libXaw8.so.8*"
+
+# Avoid dependency on libxaw as it is not build
+RDEPENDS_${PN}-dev = ""
+
+XORG_PN = "libXaw"
-- 
1.9.1


