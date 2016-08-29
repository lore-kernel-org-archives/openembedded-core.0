Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A20E46E630
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 14:32:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 29 Aug 2016 07:32:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,596,1464678000"; d="scan'208";a="1048688768"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2016 07:32:12 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 17:30:22 +0300
Message-Id: <7ef2337f4e42f3438da04fe592a3f0f08ef40d9b.1472480768.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 15/15] webkitgtk: fix racy double build of WebKit2-4.0.gir
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
X-List-Received-Date: Mon, 29 Aug 2016 14:32:11 -0000

This occasionally triggered autobuilder errors where the .gir file
appeared truncated to introspection tools.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...ix-racy-parallel-build-of-WebKit2-4.0.gir.patch | 48 ++++++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.12.4.bb       |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/files/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch

diff --git a/meta/recipes-sato/webkit/files/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch b/meta/recipes-sato/webkit/files/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
new file mode 100644
index 0000000..615fe4f
--- /dev/null
+++ b/meta/recipes-sato/webkit/files/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
@@ -0,0 +1,48 @@
+From 5760d346b42807b596f479c81f7a6b42eb36065e Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 29 Aug 2016 16:38:11 +0300
+Subject: [PATCH] Fix racy parallel build of WebKit2-4.0.gir
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Source/WebKit2/PlatformGTK.cmake | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/Source/WebKit2/PlatformGTK.cmake b/Source/WebKit2/PlatformGTK.cmake
+index adaa010..f18cf8a 100644
+--- a/Source/WebKit2/PlatformGTK.cmake
++++ b/Source/WebKit2/PlatformGTK.cmake
+@@ -906,8 +906,9 @@ endif ()
+ string(REGEX MATCHALL "-L[^ ]*"
+     INTROSPECTION_ADDITIONAL_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS}")
+ 
+-add_custom_command(
+-    OUTPUT ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
++# This is a target and not a command because it's used to build another .gir
++# and a .typelib, which would trigger two racy parallel builds when using command
++add_custom_target(WebKit2-${WEBKITGTK_API_VERSION}-gir
+     DEPENDS WebKit2
+     DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
+     COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS} LDFLAGS=
+@@ -950,7 +951,7 @@ add_custom_command(
+ add_custom_command(
+     OUTPUT ${CMAKE_BINARY_DIR}/WebKit2WebExtension-${WEBKITGTK_API_VERSION}.gir
+     DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
+-    DEPENDS ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
++    DEPENDS WebKit2-${WEBKITGTK_API_VERSION}-gir
+     COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS}
+         LDFLAGS="${INTROSPECTION_ADDITIONAL_LDFLAGS}"
+         ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
+@@ -1004,7 +1005,7 @@ add_custom_command(
+ 
+ add_custom_command(
+     OUTPUT ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.typelib
+-    DEPENDS ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
++    DEPENDS WebKit2-${WEBKITGTK_API_VERSION}-gir
+     COMMAND ${INTROSPECTION_COMPILER} --includedir=${CMAKE_BINARY_DIR} ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir -o ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.typelib
+ )
+ 
+-- 
+2.9.3
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.12.4.bb
index cb33336..0193e17 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.12.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.12.4.bb
@@ -18,6 +18,7 @@ SRC_URI = "\
   file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
   file://musl-fixes.patch \
   file://ppc-musl-fix.patch \
+  file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch \
   "
 SRC_URI[md5sum] = "0331ac714fd1a0587ffea470ef1afb20"
 SRC_URI[sha256sum] = "424d3177599abbc1eb1a1ad7928dd280a62006e992f2fada2e059375a9609a77"
-- 
2.9.3


