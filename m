Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id AEB4F7834E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 08:35:40 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id y129so13927024pgy.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 01:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i9/Gf3vmtE+zA4YZH1HrnQZZy0pw2+ounWJIs6bNzaw=;
	b=srGsU/AR90U1BLSd8nSUoz1cWljjOSicNHhEXVoyYDLwdv4nvSiIeHNoDUytfVyRLp
	jvP1YS/NnLzJE+/uOSbHkFWJkNTzOsNA2et+5IpbuJFjn56nlMk7O5cKBVHsKTMA2nps
	+Y7gXVryCOShEBmlTXDKHR/WN5LgYqqLbGT7bgIS7Q02hp4dryMhhfroHZkH/OoD+qwq
	1neQ1gQ/kgw3h0m9edKTIWVRSYYMjjzyzpNoyxrOX6hIZX6JgyMfX9j+T3kHl3DXiDWM
	VDvJJLW+fqZ9qmFiB/0kM3LNBa6G1kTsK+7z8dyqH+O5wx3IHMtHbS3DfUkeXFLMy5uz
	Y6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=i9/Gf3vmtE+zA4YZH1HrnQZZy0pw2+ounWJIs6bNzaw=;
	b=IKk/nxVylVJ6dy0gf6WEViL2N9o/ywG+QKzLQF+C7FqEQRoujc081J2Q4zl7+vibfC
	N1RK9FAsqH/gKyQDVfkilRWUpIW5oe/t9gSdDivApO1uL1LjV0tjgFjwyGnFz4geV/8V
	ybK5lITxR/8gOWs+yxhxINiYOHBieZHArEx0gPFTKHESCU7Th/iOd4Dp4Euf9LIW1oOX
	iH3C7H676GCudoc2Rq94X/Hj/bgxdMg0lptdPyQEG+5jvtyrLpWEkF8/8P92oiT7vqIE
	Z6BcOtIdEvpkMq33DGBDAgLig5F3LGTAgbSqEAMh1FJAvv/eosMF/lJoH+tiKJFR/xBv
	NBnQ==
X-Gm-Message-State: AIVw11028CweZjHwQLHUmo9+SlW+CP3ssvD0D4um+bp40+eNqliE6HPR
	sIa/+w0tZfI9bdgv
X-Received: by 10.99.174.67 with SMTP id e3mr18398930pgp.75.1500971741810;
	Tue, 25 Jul 2017 01:35:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::9b53])
	by smtp.gmail.com with ESMTPSA id
	u5sm15245362pgc.92.2017.07.25.01.35.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jul 2017 01:35:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jul 2017 01:35:30 -0700
Message-Id: <20170725083530.15432-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170725083530.15432-1-raj.khem@gmail.com>
References: <20170725083530.15432-1-raj.khem@gmail.com>
Subject: [PATCH 2/2] webkitgtk: Do not use -isystem forcibly
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
X-List-Received-Date: Tue, 25 Jul 2017 08:35:40 -0000

this causes include_next <stdlib.h> to not find
this header since -isystem <sysroot> is added via
cmake, we alrady are using --sysroot so rely on that

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...bKitMacros-Append-to-I-and-not-to-isystem.patch | 170 +++++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.16.5.bb       |   1 +
 2 files changed, 171 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch b/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
new file mode 100644
index 0000000000..d6f0ce3cd6
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
@@ -0,0 +1,170 @@
+From 53a00058184cd710c6f4375f4daab49d7e885a30 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 17 Apr 2016 12:35:41 -0700
+Subject: [PATCH] WebKitMacros: Append to -I and not to -isystem
+
+gcc-6 has now introduced stdlib.h in libstdc++ for better
+compliance and its including the C library stdlib.h using
+include_next which is sensitive to order of system header
+include paths. Its infact better to not tinker with the
+system header include paths at all. Since adding /usr/include
+to -system is redundant and compiler knows about it moreover
+now with gcc6 it interferes with compiler's functioning
+and ends up with compile errors e.g.
+
+/usr/include/c++/6.0.0/cstdlib:75:25: fatal error: stdlib.h: No such file or directory
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ Source/cmake/WebKitMacros.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: webkitgtk-2.16.5/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
+===================================================================
+--- webkitgtk-2.16.5.orig/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
++++ webkitgtk-2.16.5/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
+@@ -42,7 +42,7 @@ set(WebKitTestNetscapePlugIn_SYSTEM_INCL
+ )
+ 
+ include_directories(${WebKitTestNetscapePlugIn_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${WebKitTestNetscapePlugIn_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${WebKitTestNetscapePlugIn_SYSTEM_INCLUDE_DIRECTORIES})
+ 
+ set(WebKitTestNetscapePlugIn_LIBRARIES
+     ${X11_LIBRARIES}
+Index: webkitgtk-2.16.5/Tools/ImageDiff/CMakeLists.txt
+===================================================================
+--- webkitgtk-2.16.5.orig/Tools/ImageDiff/CMakeLists.txt
++++ webkitgtk-2.16.5/Tools/ImageDiff/CMakeLists.txt
+@@ -9,6 +9,6 @@ set(IMAGE_DIFF_LIBRARIES
+ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
+ 
+ include_directories(${IMAGE_DIFF_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${IMAGE_DIFF_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${IMAGE_DIFF_SYSTEM_INCLUDE_DIRECTORIES})
+ add_executable(ImageDiff ${IMAGE_DIFF_SOURCES})
+ target_link_libraries(ImageDiff ${IMAGE_DIFF_LIBRARIES})
+Index: webkitgtk-2.16.5/Tools/MiniBrowser/gtk/CMakeLists.txt
+===================================================================
+--- webkitgtk-2.16.5.orig/Tools/MiniBrowser/gtk/CMakeLists.txt
++++ webkitgtk-2.16.5/Tools/MiniBrowser/gtk/CMakeLists.txt
+@@ -57,7 +57,7 @@ endif ()
+ add_definitions(-DGDK_VERSION_MIN_REQUIRED=GDK_VERSION_3_6)
+ 
+ include_directories(${MiniBrowser_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
+ add_executable(MiniBrowser ${MiniBrowser_SOURCES})
+ target_link_libraries(MiniBrowser ${MiniBrowser_LIBRARIES})
+ 
+Index: webkitgtk-2.16.5/Tools/WebKitTestRunner/CMakeLists.txt
+===================================================================
+--- webkitgtk-2.16.5.orig/Tools/WebKitTestRunner/CMakeLists.txt
++++ webkitgtk-2.16.5/Tools/WebKitTestRunner/CMakeLists.txt
+@@ -106,7 +106,7 @@ GENERATE_BINDINGS(WebKitTestRunnerBindin
+ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
+ 
+ include_directories(${WebKitTestRunner_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${WebKitTestRunner_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${WebKitTestRunner_SYSTEM_INCLUDE_DIRECTORIES})
+ 
+ add_library(TestRunnerInjectedBundle SHARED ${WebKitTestRunnerInjectedBundle_SOURCES})
+ target_link_libraries(TestRunnerInjectedBundle ${WebKitTestRunner_LIBRARIES})
+Index: webkitgtk-2.16.5/Source/WebCore/PlatformGTK.cmake
+===================================================================
+--- webkitgtk-2.16.5.orig/Source/WebCore/PlatformGTK.cmake
++++ webkitgtk-2.16.5/Source/WebCore/PlatformGTK.cmake
+@@ -321,7 +321,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
+         ${GTK2_INCLUDE_DIRS}
+         ${GDK2_INCLUDE_DIRS}
+     )
+-    target_include_directories(WebCorePlatformGTK2 SYSTEM PRIVATE
++    target_include_directories(WebCorePlatformGTK2 PRIVATE
+         ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
+     )
+     target_link_libraries(WebCorePlatformGTK2
+@@ -346,7 +346,7 @@ WEBKIT_SET_EXTRA_COMPILER_FLAGS(WebCoreP
+ target_include_directories(WebCorePlatformGTK PRIVATE
+     ${WebCore_INCLUDE_DIRECTORIES}
+ )
+-target_include_directories(WebCorePlatformGTK SYSTEM PRIVATE
++target_include_directories(WebCorePlatformGTK PRIVATE
+     ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
+     ${GTK_INCLUDE_DIRS}
+     ${GDK_INCLUDE_DIRS}
+@@ -362,7 +362,7 @@ include_directories(
+     "${WEBCORE_DIR}/bindings/gobject/"
+ )
+ 
+-include_directories(SYSTEM
++include_directories(
+     ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
+ )
+ 
+Index: webkitgtk-2.16.5/Tools/TestWebKitAPI/PlatformGTK.cmake
+===================================================================
+--- webkitgtk-2.16.5.orig/Tools/TestWebKitAPI/PlatformGTK.cmake
++++ webkitgtk-2.16.5/Tools/TestWebKitAPI/PlatformGTK.cmake
+@@ -20,7 +20,7 @@ include_directories(
+     ${WEBKIT2_DIR}/UIProcess/API/gtk
+ )
+ 
+-include_directories(SYSTEM
++include_directories(
+     ${GDK3_INCLUDE_DIRS}
+     ${GLIB_INCLUDE_DIRS}
+     ${GTK3_INCLUDE_DIRS}
+Index: webkitgtk-2.16.5/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
+===================================================================
+--- webkitgtk-2.16.5.orig/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
++++ webkitgtk-2.16.5/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
+@@ -21,7 +21,7 @@ include_directories(
+     ${TOOLS_DIR}/TestWebKitAPI/gtk/WebKit2Gtk
+ )
+ 
+-include_directories(SYSTEM
++include_directories(
+     ${ATSPI_INCLUDE_DIRS}
+     ${GLIB_INCLUDE_DIRS}
+     ${GSTREAMER_INCLUDE_DIRS}
+Index: webkitgtk-2.16.5/Source/WebKit2/PlatformGTK.cmake
+===================================================================
+--- webkitgtk-2.16.5.orig/Source/WebKit2/PlatformGTK.cmake
++++ webkitgtk-2.16.5/Source/WebKit2/PlatformGTK.cmake
+@@ -1156,7 +1156,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
+     target_include_directories(WebKitPluginProcess2 PRIVATE
+         ${WebKit2CommonIncludeDirectories}
+     )
+-    target_include_directories(WebKitPluginProcess2 SYSTEM PRIVATE
++    target_include_directories(WebKitPluginProcess2 PRIVATE
+          ${WebKit2CommonSystemIncludeDirectories}
+          ${GTK2_INCLUDE_DIRS}
+          ${GDK2_INCLUDE_DIRS}
+Index: webkitgtk-2.16.5/Source/JavaScriptCore/shell/CMakeLists.txt
+===================================================================
+--- webkitgtk-2.16.5.orig/Source/JavaScriptCore/shell/CMakeLists.txt
++++ webkitgtk-2.16.5/Source/JavaScriptCore/shell/CMakeLists.txt
+@@ -20,7 +20,7 @@ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
+ 
+ WEBKIT_WRAP_SOURCELIST(${JSC_SOURCES})
+ include_directories(./ ${JavaScriptCore_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
+ add_executable(jsc ${JSC_SOURCES})
+ target_link_libraries(jsc ${JSC_LIBRARIES})
+ 
+Index: webkitgtk-2.16.5/Source/cmake/WebKitMacros.cmake
+===================================================================
+--- webkitgtk-2.16.5.orig/Source/cmake/WebKitMacros.cmake
++++ webkitgtk-2.16.5/Source/cmake/WebKitMacros.cmake
+@@ -277,7 +277,7 @@ macro(WEBKIT_WRAP_SOURCELIST)
+ endmacro()
+ 
+ macro(WEBKIT_FRAMEWORK _target)
+-    include_directories(SYSTEM ${${_target}_SYSTEM_INCLUDE_DIRECTORIES})
++    include_directories(${${_target}_SYSTEM_INCLUDE_DIRECTORIES})
+     add_library(${_target} ${${_target}_LIBRARY_TYPE}
+         ${${_target}_HEADERS}
+         ${${_target}_SOURCES}
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.16.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.16.5.bb
index dcaf8a6ed7..5ca525db38 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.16.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.16.5.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://cross-compile.patch \
            file://gcc7.patch \
            file://detect-atomics-during-configure.patch \
+           file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
            "
 
 SRC_URI[md5sum] = "fce72dc89cd310a663d9eb97133861fe"
-- 
2.13.3


