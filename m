Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web08.2086.1618603427355032380
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Apr 2021 13:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.197, mailfrom: robert.joslyn@redrectangle.org)
X-Originating-IP: 173.197.191.182
Received: from loomas.localdomain (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id D77221C0003;
	Fri, 16 Apr 2021 20:03:44 +0000 (UTC)
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] webkitgtk: Update to 2.32.0
Date: Fri, 16 Apr 2021 13:02:49 -0700
Message-Id: <20210416200249.3262139-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove upstreamed patch.

Add gamepad PACKAGECONFIG. Although upstream enables it by default,
leave it disabled because the libmanette recipe is in meta-oe.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 ...ics-check-to-include-1-byte-CAS-test.patch | 77 -------------------
 ...ebkitgtk_2.30.5.bb => webkitgtk_2.32.0.bb} |  4 +-
 2 files changed, 2 insertions(+), 79 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.30.5.bb => webkitgtk_2.32.0.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch
deleted file mode 100644
index 93bda4d754..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 40520b0de69d8ca8e659248f5ffe641f33cc6dee Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 9 Mar 2021 14:16:58 -0800
-Subject: [PATCH] Extend atomics check to include 1-byte CAS test
-
-Rename ATOMIC_INT64_REQUIRES_LIBATOMIC to ATOMICS_REQUIRE_LIBATOMIC so
-it can reflect broader range which is now checked
-
-Rename ATOMIC_INT64_IS_BUILTIN to ATOMICS_ARE_BUILTIN
-
-Upstream-Status: Submitted [https://bugs.webkit.org/attachment.cgi?bugid=222959]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Source/JavaScriptCore/CMakeLists.txt   |  2 +-
- Source/WebKit/CMakeLists.txt           |  2 +-
- Source/cmake/WebKitCompilerFlags.cmake | 15 ++++++++++-----
- 3 files changed, 12 insertions(+), 7 deletions(-)
-
---- a/Source/JavaScriptCore/CMakeLists.txt
-+++ b/Source/JavaScriptCore/CMakeLists.txt
-@@ -129,7 +129,7 @@ if (USE_CAPSTONE)
-     list(APPEND JavaScriptCore_LIBRARIES capstone)
- endif ()
- 
--if (ATOMIC_INT64_REQUIRES_LIBATOMIC)
-+if (ATOMICS_REQUIRE_LIBATOMIC)
-     list(APPEND JavaScriptCore_LIBRARIES atomic)
- endif ()
- 
---- a/Source/WebKit/CMakeLists.txt
-+++ b/Source/WebKit/CMakeLists.txt
-@@ -337,7 +337,7 @@ if (USE_LIBWEBRTC)
-     list(APPEND WebKit_LIBRARIES webrtc)
- endif ()
- 
--if (ATOMIC_INT64_REQUIRES_LIBATOMIC)
-+if (ATOMICS_REQUIRE_LIBATOMIC)
-     list(APPEND WebKit_PRIVATE_LIBRARIES atomic)
- endif ()
- 
---- a/Source/cmake/WebKitCompilerFlags.cmake
-+++ b/Source/cmake/WebKitCompilerFlags.cmake
-@@ -280,12 +280,17 @@ endif ()
- if (COMPILER_IS_GCC_OR_CLANG)
-     set(ATOMIC_TEST_SOURCE "
-         #include <atomic>
--        int main() { std::atomic<int64_t> i(0); i++; return 0; }
-+        int main() {
-+          std::atomic<int64_t> i(0);
-+          std::atomic<int8_t> j(0);
-+          i++; j++;
-+          return 0;
-+        }
-     ")
--    check_cxx_source_compiles("${ATOMIC_TEST_SOURCE}" ATOMIC_INT64_IS_BUILTIN)
--    if (NOT ATOMIC_INT64_IS_BUILTIN)
-+    check_cxx_source_compiles("${ATOMIC_TEST_SOURCE}" ATOMICS_ARE_BUILTIN)
-+    if (NOT ATOMICS_ARE_BUILTIN)
-         set(CMAKE_REQUIRED_LIBRARIES atomic)
--        check_cxx_source_compiles("${ATOMIC_TEST_SOURCE}" ATOMIC_INT64_REQUIRES_LIBATOMIC)
-+        check_cxx_source_compiles("${ATOMIC_TEST_SOURCE}" ATOMICS_REQUIRE_LIBATOMIC)
-         unset(CMAKE_REQUIRED_LIBRARIES)
-     endif ()
- endif ()
---- a/Source/WTF/wtf/CMakeLists.txt
-+++ b/Source/WTF/wtf/CMakeLists.txt
-@@ -529,6 +529,10 @@ list(APPEND WTF_LIBRARIES
-     ICU::uc
- )
- 
-+if (ATOMICS_REQUIRE_LIBATOMIC)
-+    list(APPEND WTF_LIBRARIES atomic)
-+endif ()
-+
- set(WTF_INTERFACE_LIBRARIES WTF)
- set(WTF_INTERFACE_INCLUDE_DIRECTORIES ${WTF_FRAMEWORK_HEADERS_DIR})
- set(WTF_INTERFACE_DEPENDENCIES WTF_CopyHeaders)
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.32.0.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.32.0.bb
index cdc3f9b584..42ba801758 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.32.0.bb
@@ -18,11 +18,10 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-build-with-musl.patch \
            file://include_xutil.patch \
            file://reduce-memory-overheads.patch \
-           file://0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch \
            file://musl-lower-stack-usage.patch \
            "
 
-SRC_URI[sha256sum] = "7d0dab08e3c5ae07bec80b2822ef42e952765d5724cac86eb23999bfed5a7f1f"
+SRC_URI[sha256sum] = "9d7df4dae9ada2394257565acc2a68ace9308c4c61c3fcc00111dc1f11076bf0"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
@@ -59,6 +58,7 @@ PACKAGECONFIG[woff2] = "-DUSE_WOFF2=ON,-DUSE_WOFF2=OFF,woff2"
 PACKAGECONFIG[openjpeg] = "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
 PACKAGECONFIG[systemd] = "-DUSE_SYSTEMD=ON,-DUSE_SYSTEMD=off,systemd"
 PACKAGECONFIG[reduce-size] = "-DCMAKE_BUILD_TYPE=MinSizeRel,-DCMAKE_BUILD_TYPE=Release,,"
+PACKAGECONFIG[gamepad] = "-DENABLE_GAMEPAD=ON,-DENABLE_GAMEPAD=OFF,libmanette"
 
 # webkitgtk is full of /usr/bin/env python, particular for generating docs
 do_configure[postfuncs] += "setup_python_link"
-- 
2.26.3

