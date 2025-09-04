Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B701CA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 00:07:56 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.27794.1756944467374642805
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 17:07:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oyGlKI1E;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58407PW42947181;
	Wed, 3 Sep 2025 19:07:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756944445;
	bh=Q+1YQ9xBTyVdILuezQqMAmzyl/JzAorTYcFcc03wMgQ=;
	h=From:To:CC:Subject:Date;
	b=oyGlKI1E7edOJTXqsN7Idq9BdhvN3QK4crPZ0AGSyRSVwihgBSDT5jpVLqh/jfzKz
	 dqHnGb12bcMAV0P2hiVYjfGATfLECvHu8AAQPDGJGH/VaVU7fCvMzX3LCwZNfUoLf3
	 0wCANdZxRDM+yYdGYdTGP/yePITUo61e3Y+l+j8s=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58407Po3453953
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 19:07:25 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 19:07:24 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20; Wed, 3 Sep
 2025 19:07:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 19:07:24 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58407OQB2093705;
	Wed, 3 Sep 2025 19:07:24 -0500
From: <a-christidis@ti.com>
To: <openembedded-core@lists.openembedded.org>,
        <mathieu.dubois-briand@bootlin.com>
CC: <alex@linutronix.de>, <alex.kanavin@gmail.com>
Subject: [master][PATCH v2] libsdl2: Add tests package and ptest support
Date: Wed, 3 Sep 2025 19:07:24 -0500
Message-ID: <20250904000724.1575300-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 00:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222888

From: Antonios Christidis <a-christidis@ti.com>

The SDL2 software comes with its own set of tests. Following that
introduce support for ptest.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
v2:
- Updated run-ptest to be posix compliant 
- Use SDL_INSTALL_TESTS cmake config parameter

 meta/conf/distro/include/ptest-packagelists.inc |  1 +
 meta/recipes-graphics/libsdl2/libsdl2/run-ptest | 16 ++++++++++++++++
 meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb | 13 +++++++++++--
 3 files changed, 28 insertions(+), 2 deletions(-)
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
index 0000000000..acdfa951e9
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/run-ptest
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+test_array="testdraw2 testgeometry testsprite2 testgles2 testoffscreen"
+
+
+test_path="/usr/libexec/installed-tests/SDL2/"
+
+for test in ${test_array}
+do
+    timeout --preserve-status 10 "$test_path""$test"
+    if [ $? -eq 0 ]; then
+        echo "PASS: $test"
+    else
+        echo "FAIL: $test"
+    fi
+done
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb
index 98291e0f80..9134a408c6 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb
@@ -21,13 +21,15 @@ LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG', 'arm-neon', 'f
 
 PROVIDES = "virtual/libsdl2"
 
-SRC_URI = "https://www.libsdl.org/release/SDL2-${PV}.tar.gz"
+SRC_URI = "https://www.libsdl.org/release/SDL2-${PV}.tar.gz \
+           file://run-ptest \
+	   "
 
 S = "${UNPACKDIR}/SDL2-${PV}"
 
 SRC_URI[sha256sum] = "0ca83e9c9b31e18288c7ec811108e58bac1f1bb5ec6577ad386830eac51c787e"
 
-inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
+inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even ptest
 UPSTREAM_CHECK_REGEX = "SDL2-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar"
 
 BINCONFIG = "${bindir}/sdl2-config"
@@ -48,6 +50,8 @@ EXTRA_OECMAKE = "-DSDL_OSS=OFF -DSDL_ESD=OFF -DSDL_ARTS=OFF \
                  -DSDL_X11_XRANDR=OFF \
                  -DSDL_X11_XSCRNSAVER=OFF \
                  -DSDL_X11_XSHAPE=OFF \
+                 -DSDL_TESTS=ON \
+                 -DSDL_INSTALL_TESTS=ON \
 "
 
 # opengl packageconfig factored out to make it easy for distros
@@ -82,6 +86,11 @@ PACKAGECONFIG[x11]        = "-DSDL_X11=ON,-DSDL_X11=OFF,virtual/libx11 libxext l
 
 CFLAGS:append:class-native = " -DNO_SHARED_MEMORY"
 
+PACKAGE_BEFORE_PN = "${PN}-tests"
+
 FILES:${PN} += "${datadir}/licenses/SDL2/LICENSE.txt"
+FILES:${PN}-tests += "${libexecdir} /usr/share/installed-tests/SDL2"
+
+RDEPENDS:${PN}-ptest = "${PN}-tests"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


