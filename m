Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B01ECA0FED
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 22:21:20 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.7787.1756333278093749815
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 15:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TaCXsI9W;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57RMKqVw1374699;
	Wed, 27 Aug 2025 17:20:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756333252;
	bh=twcW6r4Wng9Q87YVxA7vQigkpKlSLcG/t1Txdfn+T0Q=;
	h=From:To:CC:Subject:Date;
	b=TaCXsI9WIsuOmQzh+yypHk19F9Gi4g+OrCGd87RyNDmS7dcDQfjvPoS11WvACbY1R
	 V8D/6vZ7ShUbRb/6ROxE2ZJDFZL8aDLs+qlprInYPE3Ba1r/CX/yoSuZHgiOA77EVd
	 VFGAEWx1iY/nWpS8soY6v+a2oNYIQ9n69ue6eK84=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57RMKqr52768133
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 27 Aug 2025 17:20:52 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 27
 Aug 2025 17:20:52 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20; Wed, 27 Aug
 2025 17:20:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 27 Aug 2025 17:20:51 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57RMKpVK3769821;
	Wed, 27 Aug 2025 17:20:51 -0500
From: <a-christidis@ti.com>
To: <openembedded-core@lists.openembedded.org>,
        <mathieu.dubois-briand@bootlin.com>
CC: <alex@linutronix.de>
Subject: [master][PATCH] libsdl2: Add tests package and ptest support
Date: Wed, 27 Aug 2025 17:20:51 -0500
Message-ID: <20250827222051.367093-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 22:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222542

From: Antonios Christidis <a-christidis@ti.com>

The SDL2 software comes with its own set of tests. Following that
introduce support for ptest.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libsdl2/libsdl2/run-ptest                 | 15 ++++++++++++++
 .../libsdl2/libsdl2_2.32.8.bb                 | 20 +++++++++++++++++--
 3 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 9a7b25a916..a5476927b5 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -32,6 +32,7 @@ PTESTS_FAST = "\
     libgpg-error\
     libnl \
     libpcre \
+    libsdl2 \
     libssh2 \
     libtest-fatal-perl \
     libtest-needs-perl \
diff --git a/meta/recipes-graphics/libsdl2/libsdl2/run-ptest b/meta/recipes-graphics/libsdl2/libsdl2/run-ptest
new file mode 100644
index 0000000000..1cd1f9ceaf
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/run-ptest
@@ -0,0 +1,15 @@
+#!/bin/sh
+
+test_array=("testdraw2" "testgeometry" "testsprite2" "testgles2" "testoffscreen")
+
+test_path="/usr/bin/sdl2_tests/"
+
+for test in "${test_array[@]}"
+do
+    timeout --preserve-status 10 "$test_path""$test"
+    if [ $? -eq 0 ]; then
+        echo "PASS: $test"
+    else
+        echo "FAIL: $test"
+    fi
+done
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb
index 98291e0f80..5aeb333bc7 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb
@@ -21,13 +21,15 @@ LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG', 'arm-neon', 'f
 
 PROVIDES = "virtual/libsdl2"
 
-SRC_URI = "https://www.libsdl.org/release/SDL2-${PV}.tar.gz"
+SRC_URI = "https://www.libsdl.org/release/SDL2-${PV}.tar.gz \
+	   file://run-ptest \
+	   "
 
 S = "${UNPACKDIR}/SDL2-${PV}"
 
 SRC_URI[sha256sum] = "0ca83e9c9b31e18288c7ec811108e58bac1f1bb5ec6577ad386830eac51c787e"
 
-inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
+inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even ptest
 UPSTREAM_CHECK_REGEX = "SDL2-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar"
 
 BINCONFIG = "${bindir}/sdl2-config"
@@ -48,6 +50,7 @@ EXTRA_OECMAKE = "-DSDL_OSS=OFF -DSDL_ESD=OFF -DSDL_ARTS=OFF \
                  -DSDL_X11_XRANDR=OFF \
                  -DSDL_X11_XSCRNSAVER=OFF \
                  -DSDL_X11_XSHAPE=OFF \
+		 -DSDL_TESTS=ON \
 "
 
 # opengl packageconfig factored out to make it easy for distros
@@ -80,8 +83,21 @@ PACKAGECONFIG[vulkan]    = "-DSDL_VULKAN=ON,-DSDL_VULKAN=OFF"
 PACKAGECONFIG[wayland]    = "-DSDL_WAYLAND=ON,-DSDL_WAYLAND=OFF,wayland-native wayland wayland-protocols libxkbcommon"
 PACKAGECONFIG[x11]        = "-DSDL_X11=ON,-DSDL_X11=OFF,virtual/libx11 libxext libxrandr libxrender"
 
+do_install:append() {
+	install -d ${D}${bindir}/sdl2_tests
+	cp -r ${B}/test/* ${D}${bindir}/sdl2_tests
+
+	# Delete any leftover cmake files within the sdl2_tests dir
+	find ${D}${bindir}/sdl2_tests -type f -name "*.cmake" -delete
+}
+
 CFLAGS:append:class-native = " -DNO_SHARED_MEMORY"
 
+PACKAGE_BEFORE_PN = "${PN}-tests"
+
 FILES:${PN} += "${datadir}/licenses/SDL2/LICENSE.txt"
+FILES:${PN}-tests += "${bindir}/sdl2_tests"
+
+RDEPENDS:${PN}-ptest = "${PN}-tests"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


