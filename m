Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C74C77B73
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 01:45:05 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2791.1684979099141665532
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 18:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ABoVwR3r;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34P1iqS0128629;
	Wed, 24 May 2023 20:44:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684979092;
	bh=wddUng7qOPybtrbsq1iIoKLH2oy1f6yAL4Co7RCbvq0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ABoVwR3r4HzE5syDZZVJ+Ysz1YgeQc+yMgOtkIvwgSWe0ey2lZ2IDH+MU00yQZd14
	 FlevgrX7Tm7+Ff5VFn94+SKxzyMxNO99j8UTkJ+06kOyUJ/c2bBLwIZxNYYwBImU4n
	 l6cAyAzLmE7zvdUFvMSSpLHH35Pk7v0GVxrstVJg=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34P1iq8v030605
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 May 2023 20:44:52 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 May 2023 20:44:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 May 2023 20:44:51 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34P1ipg1030323;
	Wed, 24 May 2023 20:44:51 -0500
From: <rs@ti.com>
To: <steve@sakoman.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <openembedded-core@lists.openembedded.org>,
        Tom Hochstein
	<tom.hochstein@nxp.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Richard
 Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][kirkstone][PATCH 1/3] piglit: Add PACKAGECONFIG for glx and opencl
Date: Wed, 24 May 2023 20:44:46 -0500
Message-ID: <20230525014448.486619-2-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525014448.486619-1-rs@ti.com>
References: <20230525014448.486619-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 01:45:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181699

From: Tom Hochstein <tom.hochstein@nxp.com>

- Allow GLX tests to be disabled for systems that don't support it.

- Allow OpenCL tests to be enabled.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...roper-WAYLAND_INCLUDE_DIRS-variable.patch} |  0
 ...-shader.c-do-not-hardcode-build-pat.patch} |  0
 ...n-t-enable-GLX-if-tests-are-disabled.patch | 32 +++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    | 11 ++++---
 4 files changed, 39 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/piglit/piglit/{0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch => 0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch} (100%)
 rename meta/recipes-graphics/piglit/piglit/{0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch => 0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch} (100%)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0005-cmake-Don-t-enable-GLX-if-tests-are-disabled.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
similarity index 100%
rename from meta/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
rename to meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
diff --git a/meta/recipes-graphics/piglit/piglit/0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
similarity index 100%
rename from meta/recipes-graphics/piglit/piglit/0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
rename to meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
diff --git a/meta/recipes-graphics/piglit/piglit/0005-cmake-Don-t-enable-GLX-if-tests-are-disabled.patch b/meta/recipes-graphics/piglit/piglit/0005-cmake-Don-t-enable-GLX-if-tests-are-disabled.patch
new file mode 100644
index 00000000000..ef6fda0f4ed
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0005-cmake-Don-t-enable-GLX-if-tests-are-disabled.patch
@@ -0,0 +1,32 @@
+From 13ff43fe760ac343b33d8e8c84b89886aac07116 Mon Sep 17 00:00:00 2001
+From: Tom Hochstein <tom.hochstein@nxp.com>
+Date: Fri, 3 Jun 2022 10:44:29 -0500
+Subject: [PATCH] cmake: Don't enable GLX if tests are disabled
+
+Allow building for systems that don't support GLX.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/720]
+Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
+---
+ CMakeLists.txt | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e1aeb5ddf..85e171aba 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -134,10 +134,7 @@ if(PIGLIT_BUILD_CL_TESTS)
+ endif(PIGLIT_BUILD_CL_TESTS)
+ 
+ IF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
+-	if(X11_FOUND AND OPENGL_gl_LIBRARY)
+-		# Assume the system has GLX. In the future, systems may exist
+-		# with libGL and libX11 but no GLX, but that world hasn't
+-		# arrived yet.
++	if(X11_FOUND AND OPENGL_gl_LIBRARY AND PIGLIT_BUILD_GLX_TESTS)
+ 		set(PIGLIT_HAS_GLX True)
+ 		add_definitions(-DPIGLIT_HAS_GLX)
+ 	endif()
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 3ae7a14e465..5b7a206247c 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -8,10 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 
 SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=main \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
-           file://0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
            file://0001-Add-a-missing-include-for-htobe32-definition.patch \
-           file://0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch \
-           "
+           file://0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
+           file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch \
+           file://0005-cmake-Don-t-enable-GLX-if-tests-are-disabled.patch"
+
 UPSTREAM_CHECK_COMMITS = "1"
 
 SRCREV = "2f80c7cc9c02d37574dc8ba3140b7dd8eb3cbf82"
@@ -36,8 +37,10 @@ REQUIRED_DISTRO_FEATURES += "opengl"
 export TEMP = "${B}/temp/"
 do_compile[dirs] =+ "${B}/temp/"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 glx', '', d)}"
 PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
+PACKAGECONFIG[glx] = "-DPIGLIT_BUILD_GLX_TESTS=ON,-DPIGLIT_BUILD_GLX_TESTS=OFF"
+PACKAGECONFIG[opencl] = "-DPIGLIT_BUILD_CL_TESTS=ON,-DPIGLIT_BUILD_CL_TESTS=OFF,opencl-icd-loader"
 PACKAGECONFIG[x11] = "-DPIGLIT_BUILD_GL_TESTS=ON,-DPIGLIT_BUILD_GL_TESTS=OFF,${X11_DEPS}, ${X11_RDEPS}"
 PACKAGECONFIG[vulkan] = "-DPIGLIT_BUILD_VK_TESTS=ON,-DPIGLIT_BUILD_VK_TESTS=OFF,vulkan-loader"
 
-- 
2.40.1


