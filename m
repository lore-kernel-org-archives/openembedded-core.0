Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 6B14371BF0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 15:24:27 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w94FOQFh010881
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Oct 2018 17:24:26 +0200
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.77.245])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w94FOQsB023852;
	Thu, 4 Oct 2018 17:24:26 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 2B2DA1019FD3;
	Thu,  4 Oct 2018 17:24:27 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2018 17:24:18 +0200
Message-Id: <20181004152419.27370-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] piglit: correctly find wayland include dirs
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
X-List-Received-Date: Thu, 04 Oct 2018 15:24:27 -0000

Builds include host /usr/include as the wrong wayland variable was used.
The issue only surfaces if CMAKE_SYSROOT is properly set.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 ...-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch | 32 ++++++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb         |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
new file mode 100644
index 0000000000..5d6ec368ba
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -0,0 +1,32 @@
+From 3bf1beee1ddd19bc536ff2856e04ac269d43daa2 Mon Sep 17 00:00:00 2001
+From: Pascal Bach <pascal.bach@siemens.com>
+Date: Thu, 4 Oct 2018 14:43:17 +0200
+Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
+
+WAYLAND_wayland-client_INCLUDEDIR is an internal variable and is not correctly
+set when cross compiling. WAYLAND_INCLUDE_DIRS includes the correct path even
+when cross compiling.
+
+Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
+
+Upstream-Status: Submitted [piglit@lists.freedesktop.org]
+---
+ tests/util/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/util/CMakeLists.txt b/tests/util/CMakeLists.txt
+index a5f080156..a303a9f58 100644
+--- a/tests/util/CMakeLists.txt
++++ b/tests/util/CMakeLists.txt
+@@ -97,7 +97,7 @@ if(PIGLIT_USE_WAFFLE)
+ 			piglit-framework-gl/piglit_wl_framework.c
+ 		)
+ 		list(APPEND UTIL_GL_INCLUDES
+-			${WAYLAND_wayland-client_INCLUDEDIR}
++			${WAYLAND_INCLUDE_DIRS}
+ 		)
+ 	endif()
+ 	if(PIGLIT_HAS_X11)
+-- 
+2.11.0
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index df810a33b4..3292d4cad0 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 SRC_URI = "git://anongit.freedesktop.org/piglit \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch \
+           file://0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.11.0


