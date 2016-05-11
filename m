Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 328AA7317D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:01 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y7so4253318pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=qmnSFmKZh8/efXzvOpzjsO4q6kpejZGbXsi+ufQvP38=;
	b=ECS4LUTvN3NOHzT5/tPOS1LG3YajhOxEREshMVPI9Wk2rExKDzyc/7Z+uHZWWC01vz
	R7NJ2kiFyp1k687gv6arUjwF1lYWd7vDZCKxbmgVhm7rtfwqrAoH7BBJL6cAr1ke/+8Q
	Xz3lIWLs8rURCRIqYxpe8PbK0FYJeIJgdjL9ChNYStyY1h6C0pqNqfGwN5L82p8E7Za9
	MUcXXew+4MEaOrSFwtq3G8d7nuzrTQlG8NM1RVEKJ4q0C3FS/zNXa3cB+MgJk81+kVF7
	vTb77S3Rw79D5c+qk79qQAkL+bOwCdmiA5GcjHvjVScoHFzbDoCzpNnhwXjQFzn7rjE7
	vucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=qmnSFmKZh8/efXzvOpzjsO4q6kpejZGbXsi+ufQvP38=;
	b=fwjfTg4gS/fS0KngDJXaDMxJf+Cdll+V4hpu6Mz0A9d4dpgGErZlGECvcVNuTFHATS
	PtB5IIdQtV9B7oAe22s9sT8wvQdHSf1R9vsq/K/ZQz/uKtD33XO1aAkTbKEXJ6UB+e3J
	h+pruq/kD9bD7A0d0QJ/2djpI5ui/dEukuuaZET2cLVqunjv0wlJUem84itCNeGBI1wH
	3lhVD4YuG64hRiNCSI7RiCgPrU9PR3lamW28BER9QbK/y1NzPd/JHC7vTdjXEvve9rQj
	Vdv0hIutlYSutuC7ePVoJxQzMRYIzOq3iuE38AilHOuafUELSLC04rQoVGUFecgJq8hi
	+uJQ==
X-Gm-Message-State: AOPr4FXuTy6cDjpGP1d02UqmNx/6tePIXHeQc0Ja6hPSdgfPcE58Xf5SlKMFCu1WA/YsFQ==
X-Received: by 10.98.24.208 with SMTP id 199mr6680732pfy.160.1462988162897;
	Wed, 11 May 2016 10:36:02 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:11 -0700
Message-Id: <0665d6c8fd1fb7c1685ba350a2cefb0a65675363.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 08/42] webkitgtk: Upgrade to 2.12.1
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
X-List-Received-Date: Wed, 11 May 2016 17:36:02 -0000

Fix build with gcc-6

Do not tinker with -isystem, this causes issues
where gcc does not find standard C++ headers since
the default search ordered for system headers is
changed and is not correct anymore. Errorr like

WebCore/editing/gtk/EditorGtk.cpp:27:
/mnt/oe/poky/build/tmp/sysroots/qemuarm/usr/include/c++/6.0.1/cstdlib:75:25: fatal error: stdlib.h: No such file or directory
 #include_next <stdlib.h>

It brings a patch to fix typename mismatch
for pow()

see
 https://bugs.webkit.org/show_bug.cgi?id=153071

Drop upstreamed patches
User -fPIC on aarch64 to fix
relocation truncated to fit: R_AARCH64_LD64_GOTPAGE_LO15 against symbol `__stack_chk_guard@@GLIBC_2.17' defined in .data.rel.ro section

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...cmake-drop-the-hardcoded-introspection-gt.patch |  19 +-
 ...bKitMacros-Append-to-I-and-not-to-isystem.patch | 223 +++++++++++++++++++++
 ...ng-introspection-files-add-CMAKE_C_FLAGS-.patch |  19 +-
 meta/recipes-sato/webkit/files/musl-fixes.patch    |  48 +++++
 ...nable-backtrace-on-linux-when-using-glibc.patch |  39 ----
 ...x-build-with-non-glibc-libraries-on-linux.patch |  61 ------
 meta/recipes-sato/webkit/webkitgtk/clang.patch     |  25 ---
 .../{webkitgtk_2.10.7.bb => webkitgtk_2.12.1.bb}   |  12 +-
 8 files changed, 294 insertions(+), 152 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
 create mode 100644 meta/recipes-sato/webkit/files/musl-fixes.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Enable-backtrace-on-linux-when-using-glibc.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-non-glibc-libraries-on-linux.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/clang.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.10.7.bb => webkitgtk_2.12.1.bb} (92%)

diff --git a/meta/recipes-sato/webkit/files/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch b/meta/recipes-sato/webkit/files/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch
index 3d004db..93a69c0 100644
--- a/meta/recipes-sato/webkit/files/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch
+++ b/meta/recipes-sato/webkit/files/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch
@@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  Source/cmake/OptionsGTK.cmake | 6 ------
  1 file changed, 6 deletions(-)
 
-diff --git a/Source/cmake/OptionsGTK.cmake b/Source/cmake/OptionsGTK.cmake
-index e5f1f5b..4698036 100644
---- a/Source/cmake/OptionsGTK.cmake
-+++ b/Source/cmake/OptionsGTK.cmake
-@@ -443,12 +443,6 @@ if (USE_LIBHYPHEN)
+Index: webkitgtk-2.12.1/Source/cmake/OptionsGTK.cmake
+===================================================================
+--- webkitgtk-2.12.1.orig/Source/cmake/OptionsGTK.cmake
++++ webkitgtk-2.12.1/Source/cmake/OptionsGTK.cmake
+@@ -424,12 +424,6 @@ if (USE_LIBHYPHEN)
      endif ()
  endif ()
  
@@ -27,9 +27,6 @@ index e5f1f5b..4698036 100644
 -    set(ENABLE_INTROSPECTION OFF)
 -endif ()
 -
- set(DERIVED_SOURCES_GOBJECT_DOM_BINDINGS_DIR ${DERIVED_SOURCES_DIR}/webkitdom)
- set(DERIVED_SOURCES_WEBKITGTK_DIR ${DERIVED_SOURCES_DIR}/webkitgtk)
- set(DERIVED_SOURCES_WEBKITGTK_API_DIR ${DERIVED_SOURCES_WEBKITGTK_DIR}/webkit)
--- 
-2.7.0
-
+ # Override the cached variable, gtk-doc does not really work when building on Mac.
+ if (APPLE)
+     set(ENABLE_GTKDOC OFF)
diff --git a/meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch b/meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
new file mode 100644
index 0000000..25b3c9f
--- /dev/null
+++ b/meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
@@ -0,0 +1,223 @@
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
+Index: webkitgtk-2.12.1/Source/JavaScriptCore/CMakeLists.txt
+===================================================================
+--- webkitgtk-2.12.1.orig/Source/JavaScriptCore/CMakeLists.txt
++++ webkitgtk-2.12.1/Source/JavaScriptCore/CMakeLists.txt
+@@ -1311,7 +1311,7 @@ add_subdirectory(shell)
+ 
+ WEBKIT_WRAP_SOURCELIST(${JavaScriptCore_SOURCES})
+ include_directories(${JavaScriptCore_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
+ add_library(JavaScriptCore ${JavaScriptCore_LIBRARY_TYPE} ${JavaScriptCore_HEADERS} ${JavaScriptCore_SOURCES})
+ target_link_libraries(JavaScriptCore ${JavaScriptCore_LIBRARIES})
+ set_target_properties(JavaScriptCore PROPERTIES COMPILE_DEFINITIONS "BUILDING_JavaScriptCore")
+Index: webkitgtk-2.12.1/Source/WTF/wtf/CMakeLists.txt
+===================================================================
+--- webkitgtk-2.12.1.orig/Source/WTF/wtf/CMakeLists.txt
++++ webkitgtk-2.12.1/Source/WTF/wtf/CMakeLists.txt
+@@ -286,7 +286,7 @@ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
+ 
+ WEBKIT_WRAP_SOURCELIST(${WTF_SOURCES})
+ include_directories(${WTF_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${WTF_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${WTF_SYSTEM_INCLUDE_DIRECTORIES})
+ add_library(WTF ${WTF_LIBRARY_TYPE} ${WTF_HEADERS} ${WTF_SOURCES})
+ target_link_libraries(WTF ${WTF_LIBRARIES})
+ set_target_properties(WTF PROPERTIES COMPILE_DEFINITIONS "BUILDING_WTF")
+Index: webkitgtk-2.12.1/Source/WebCore/CMakeLists.txt
+===================================================================
+--- webkitgtk-2.12.1.orig/Source/WebCore/CMakeLists.txt
++++ webkitgtk-2.12.1/Source/WebCore/CMakeLists.txt
+@@ -3748,7 +3748,7 @@ WEBKIT_WRAP_SOURCELIST(${WebCore_IDL_FIL
+ WEBKIT_WRAP_SOURCELIST(${WebCoreTestSupport_IDL_FILES} ${WebCoreTestSupport_SOURCES})
+ 
+ include_directories(${WebCore_INCLUDE_DIRECTORIES} ${WebCoreTestSupport_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${WebCore_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${WebCore_SYSTEM_INCLUDE_DIRECTORIES})
+ 
+ if (MSVC)
+     ADD_PRECOMPILED_HEADER("WebCorePrefix.h" "WebCorePrefix.cpp" WebCore_SOURCES)
+Index: webkitgtk-2.12.1/Source/WebKit/CMakeLists.txt
+===================================================================
+--- webkitgtk-2.12.1.orig/Source/WebKit/CMakeLists.txt
++++ webkitgtk-2.12.1/Source/WebKit/CMakeLists.txt
+@@ -28,7 +28,7 @@ set(WebKit_LIBRARIES
+ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
+ 
+ include_directories(${WebKit_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${WebKit_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${WebKit_SYSTEM_INCLUDE_DIRECTORIES})
+ 
+ if (MSVC)
+     ADD_PRECOMPILED_HEADER("WebKitPrefix.h" "win/WebKitPrefix.cpp" WebKit_SOURCES)
+Index: webkitgtk-2.12.1/Source/WebKit2/CMakeLists.txt
+===================================================================
+--- webkitgtk-2.12.1.orig/Source/WebKit2/CMakeLists.txt
++++ webkitgtk-2.12.1/Source/WebKit2/CMakeLists.txt
+@@ -756,7 +756,7 @@ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
+ GENERATE_WEBKIT2_MESSAGE_SOURCES(WebKit2_DERIVED_SOURCES "${WebKit2_MESSAGES_IN_FILES}")
+ 
+ include_directories(${WebKit2_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${WebKit2_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${WebKit2_SYSTEM_INCLUDE_DIRECTORIES})
+ add_library(WebKit2 ${WebKit2_LIBRARY_TYPE} ${WebKit2_SOURCES} ${WebKit2_DERIVED_SOURCES})
+ 
+ add_dependencies(WebKit2 WebCore ${WEBKIT2_EXTRA_DEPENDENCIES})
+Index: webkitgtk-2.12.1/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
+===================================================================
+--- webkitgtk-2.12.1.orig/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
++++ webkitgtk-2.12.1/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
+@@ -42,7 +42,7 @@ set(WebKitTestNetscapePlugin_SYSTEM_INCL
+ )
+ 
+ include_directories(${WebKitTestNetscapePlugin_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${WebKitTestNetscapePlugin_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${WebKitTestNetscapePlugin_SYSTEM_INCLUDE_DIRECTORIES})
+ 
+ set(WebKitTestNetscapePlugin_LIBRARIES
+     ${X11_LIBRARIES}
+Index: webkitgtk-2.12.1/Tools/ImageDiff/CMakeLists.txt
+===================================================================
+--- webkitgtk-2.12.1.orig/Tools/ImageDiff/CMakeLists.txt
++++ webkitgtk-2.12.1/Tools/ImageDiff/CMakeLists.txt
+@@ -14,7 +14,7 @@ set(IMAGE_DIFF_LIBRARIES
+ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
+ 
+ include_directories(${IMAGE_DIFF_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${IMAGE_DIFF_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${IMAGE_DIFF_SYSTEM_INCLUDE_DIRECTORIES})
+ add_executable(ImageDiff ${IMAGE_DIFF_SOURCES})
+ target_link_libraries(ImageDiff ${IMAGE_DIFF_LIBRARIES})
+ set_target_properties(ImageDiff PROPERTIES FOLDER "Tools")
+Index: webkitgtk-2.12.1/Tools/MiniBrowser/gtk/CMakeLists.txt
+===================================================================
+--- webkitgtk-2.12.1.orig/Tools/MiniBrowser/gtk/CMakeLists.txt
++++ webkitgtk-2.12.1/Tools/MiniBrowser/gtk/CMakeLists.txt
+@@ -55,7 +55,7 @@ endif ()
+ add_definitions(-DGDK_VERSION_MIN_REQUIRED=GDK_VERSION_3_6)
+ 
+ include_directories(${MiniBrowser_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
+ add_executable(MiniBrowser ${MiniBrowser_SOURCES})
+ target_link_libraries(MiniBrowser ${MiniBrowser_LIBRARIES})
+ set_target_properties(MiniBrowser PROPERTIES FOLDER "Tools")
+Index: webkitgtk-2.12.1/Tools/WebKitTestRunner/CMakeLists.txt
+===================================================================
+--- webkitgtk-2.12.1.orig/Tools/WebKitTestRunner/CMakeLists.txt
++++ webkitgtk-2.12.1/Tools/WebKitTestRunner/CMakeLists.txt
+@@ -115,7 +115,7 @@ GENERATE_BINDINGS(WebKitTestRunner_SOURC
+ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
+ 
+ include_directories(${WebKitTestRunner_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${WebKitTestRunner_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${WebKitTestRunner_SYSTEM_INCLUDE_DIRECTORIES})
+ 
+ add_library(TestRunnerInjectedBundle SHARED ${WebKitTestRunnerInjectedBundle_SOURCES})
+ target_link_libraries(TestRunnerInjectedBundle ${WebKitTestRunner_LIBRARIES})
+Index: webkitgtk-2.12.1/Source/WebCore/PlatformGTK.cmake
+===================================================================
+--- webkitgtk-2.12.1.orig/Source/WebCore/PlatformGTK.cmake
++++ webkitgtk-2.12.1/Source/WebCore/PlatformGTK.cmake
+@@ -324,7 +324,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
+         ${GTK2_INCLUDE_DIRS}
+         ${GDK2_INCLUDE_DIRS}
+     )
+-    target_include_directories(WebCorePlatformGTK2 SYSTEM PRIVATE
++    target_include_directories(WebCorePlatformGTK2 PRIVATE
+         ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
+     )
+     target_link_libraries(WebCorePlatformGTK2
+@@ -366,7 +366,7 @@ WEBKIT_SET_EXTRA_COMPILER_FLAGS(WebCoreP
+ target_include_directories(WebCorePlatformGTK PRIVATE
+     ${WebCore_INCLUDE_DIRECTORIES}
+ )
+-target_include_directories(WebCorePlatformGTK SYSTEM PRIVATE
++target_include_directories(WebCorePlatformGTK PRIVATE
+     ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
+     ${GTK_INCLUDE_DIRS}
+     ${GDK_INCLUDE_DIRS}
+@@ -384,7 +384,7 @@ include_directories(
+     "${DERIVED_SOURCES_GOBJECT_DOM_BINDINGS_DIR}"
+ )
+ 
+-include_directories(SYSTEM
++include_directories(
+     ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
+ )
+ 
+Index: webkitgtk-2.12.1/Tools/TestWebKitAPI/PlatformGTK.cmake
+===================================================================
+--- webkitgtk-2.12.1.orig/Tools/TestWebKitAPI/PlatformGTK.cmake
++++ webkitgtk-2.12.1/Tools/TestWebKitAPI/PlatformGTK.cmake
+@@ -20,7 +20,7 @@ include_directories(
+     ${WEBKIT2_DIR}/UIProcess/API/gtk
+ )
+ 
+-include_directories(SYSTEM
++include_directories(
+     ${GDK3_INCLUDE_DIRS}
+     ${GLIB_INCLUDE_DIRS}
+     ${GTK3_INCLUDE_DIRS}
+Index: webkitgtk-2.12.1/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
+===================================================================
+--- webkitgtk-2.12.1.orig/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
++++ webkitgtk-2.12.1/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
+@@ -23,7 +23,7 @@ include_directories(
+     ${TOOLS_DIR}/TestWebKitAPI/gtk/WebKit2Gtk
+ )
+ 
+-include_directories(SYSTEM
++include_directories(
+     ${ATSPI_INCLUDE_DIRS}
+     ${GLIB_INCLUDE_DIRS}
+     ${GSTREAMER_INCLUDE_DIRS}
+Index: webkitgtk-2.12.1/Source/WebKit2/PlatformGTK.cmake
+===================================================================
+--- webkitgtk-2.12.1.orig/Source/WebKit2/PlatformGTK.cmake
++++ webkitgtk-2.12.1/Source/WebKit2/PlatformGTK.cmake
+@@ -816,7 +816,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
+     target_include_directories(WebKitPluginProcess2 PRIVATE
+         ${WebKit2CommonIncludeDirectories}
+     )
+-    target_include_directories(WebKitPluginProcess2 SYSTEM PRIVATE
++    target_include_directories(WebKitPluginProcess2 PRIVATE
+          ${WebKit2CommonSystemIncludeDirectories}
+          ${GTK2_INCLUDE_DIRS}
+          ${GDK2_INCLUDE_DIRS}
+Index: webkitgtk-2.12.1/Source/JavaScriptCore/shell/CMakeLists.txt
+===================================================================
+--- webkitgtk-2.12.1.orig/Source/JavaScriptCore/shell/CMakeLists.txt
++++ webkitgtk-2.12.1/Source/JavaScriptCore/shell/CMakeLists.txt
+@@ -20,7 +20,7 @@ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
+ 
+ WEBKIT_WRAP_SOURCELIST(${JSC_SOURCES})
+ include_directories(./ ${JavaScriptCore_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
+ add_executable(jsc ${JSC_SOURCES})
+ target_link_libraries(jsc ${JSC_LIBRARIES})
+ set_target_properties(jsc PROPERTIES FOLDER "JavaScriptCore")
diff --git a/meta/recipes-sato/webkit/files/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch b/meta/recipes-sato/webkit/files/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
index 44b43cd..3f71297 100644
--- a/meta/recipes-sato/webkit/files/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
+++ b/meta/recipes-sato/webkit/files/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
@@ -13,28 +13,25 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  Source/WebKit2/PlatformGTK.cmake | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/Source/WebKit2/PlatformGTK.cmake b/Source/WebKit2/PlatformGTK.cmake
-index 706f1e8..14a1c3b 100644
---- a/Source/WebKit2/PlatformGTK.cmake
-+++ b/Source/WebKit2/PlatformGTK.cmake
-@@ -884,7 +884,7 @@ add_custom_command(
+Index: webkitgtk-2.12.1/Source/WebKit2/PlatformGTK.cmake
+===================================================================
+--- webkitgtk-2.12.1.orig/Source/WebKit2/PlatformGTK.cmake
++++ webkitgtk-2.12.1/Source/WebKit2/PlatformGTK.cmake
+@@ -910,7 +910,7 @@ add_custom_command(
      OUTPUT ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
      DEPENDS WebKit2
      DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
 -    COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations LDFLAGS=
 +    COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS} LDFLAGS=
-         LD_LIBRARY_PATH="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
+         ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
          ${INTROSPECTION_SCANNER}
          --quiet
-@@ -930,7 +930,7 @@ add_custom_command(
+@@ -951,7 +951,7 @@ add_custom_command(
      OUTPUT ${CMAKE_BINARY_DIR}/WebKit2WebExtension-${WEBKITGTK_API_VERSION}.gir
      DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
      DEPENDS ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
 -    COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations
 +    COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS}
          LDFLAGS="${INTROSPECTION_ADDITIONAL_LDFLAGS}"
-         LD_LIBRARY_PATH="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
+         ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
          ${INTROSPECTION_SCANNER}
--- 
-2.6.4
-
diff --git a/meta/recipes-sato/webkit/files/musl-fixes.patch b/meta/recipes-sato/webkit/files/musl-fixes.patch
new file mode 100644
index 0000000..4fdd56f
--- /dev/null
+++ b/meta/recipes-sato/webkit/files/musl-fixes.patch
@@ -0,0 +1,48 @@
+Replace __GLIBC__ with __linux__ since musl also supports it
+so checking __linux__ is more accomodating
+
+See http://git.alpinelinux.org/cgit/aports/tree/community/webkit2gtk/musl-fixes.patch?id=219435d86d7e8fac9474344a7431c62bd2525184
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: webkitgtk-2.12.1/Source/JavaScriptCore/heap/MachineStackMarker.cpp
+===================================================================
+--- webkitgtk-2.12.1.orig/Source/JavaScriptCore/heap/MachineStackMarker.cpp
++++ webkitgtk-2.12.1/Source/JavaScriptCore/heap/MachineStackMarker.cpp
+@@ -566,7 +566,7 @@ void* MachineThreads::Thread::Registers:
+ #error Unknown Architecture
+ #endif
+ 
+-#elif defined(__GLIBC__) && ENABLE(JIT)
++#elif defined(__linux__) && ENABLE(JIT)
+ 
+ #if CPU(X86)
+     return reinterpret_cast<void*>((uintptr_t) regs.machineContext.gregs[REG_ESP]);
+@@ -665,7 +665,7 @@ void* MachineThreads::Thread::Registers:
+ #error Unknown Architecture
+ #endif
+ 
+-#elif defined(__GLIBC__)
++#elif defined(__linux__) // glibc and musl
+ 
+ // The following sequence depends on glibc's sys/ucontext.h.
+ #if CPU(X86)
+@@ -747,7 +747,7 @@ void* MachineThreads::Thread::Registers:
+ #error Unknown Architecture
+ #endif
+ 
+-#elif defined(__GLIBC__)
++#elif defined(__linux__) // glibc and musl
+ 
+ // The following sequence depends on glibc's sys/ucontext.h.
+ #if CPU(X86)
+@@ -838,7 +838,7 @@ void* MachineThreads::Thread::Registers:
+ #error Unknown Architecture
+ #endif
+ 
+-#elif defined(__GLIBC__)
++#elif defined(__linux__) // glibc and musl
+ 
+ // The following sequence depends on glibc's sys/ucontext.h.
+ #if CPU(X86)
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-backtrace-on-linux-when-using-glibc.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-backtrace-on-linux-when-using-glibc.patch
deleted file mode 100644
index d7e4ef6..0000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-backtrace-on-linux-when-using-glibc.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 0b68ad206d2d90df78d91cad4da19152084014cf Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 16 Sep 2015 05:15:04 +0000
-Subject: [PATCH] Enable backtrace on linux when using glibc
-
-We dont have backtrace() implemented on non-glibc libc's on linux
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Accepted
-
- Source/WTF/wtf/Assertions.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Source/WTF/wtf/Assertions.cpp b/Source/WTF/wtf/Assertions.cpp
-index 191d53f..a4d86b5 100644
---- a/Source/WTF/wtf/Assertions.cpp
-+++ b/Source/WTF/wtf/Assertions.cpp
-@@ -68,7 +68,7 @@
- #include <unistd.h>
- #endif
- 
--#if OS(DARWIN) || (OS(LINUX) && !defined(__UCLIBC__))
-+#if OS(DARWIN) || (OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
- #include <cxxabi.h>
- #include <dlfcn.h>
- #include <execinfo.h>
-@@ -225,7 +225,7 @@ void WTFReportArgumentAssertionFailure(const char* file, int line, const char* f
- 
- void WTFGetBacktrace(void** stack, int* size)
- {
--#if OS(DARWIN) || (OS(LINUX) && !defined(__UCLIBC__))
-+#if OS(DARWIN) || (OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
-     *size = backtrace(stack, *size);
- #elif OS(WINDOWS)
-     // The CaptureStackBackTrace function is available in XP, but it is not defined
--- 
-2.5.2
-
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-non-glibc-libraries-on-linux.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-non-glibc-libraries-on-linux.patch
deleted file mode 100644
index 77ebf37..0000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-non-glibc-libraries-on-linux.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 30e2ef302a329850ba55c7c458c98cbf396186ec Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 31 Dec 2015 21:47:34 +0000
-Subject: [PATCH] Fix build with non-glibc libraries on linux
-
-qualify isnan() calls with std namespace
-malloc_trim is glibc specific API so guard it with __GLIBC__
-let ctype be used on non-glibc ( musl ) C library
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Accepted
-
- Source/JavaScriptCore/runtime/Options.cpp                    | 2 +-
- Source/WTF/wtf/DisallowCType.h                               | 2 +-
- Source/WebCore/platform/linux/MemoryPressureHandlerLinux.cpp | 2 ++
- 3 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/Source/JavaScriptCore/runtime/Options.cpp b/Source/JavaScriptCore/runtime/Options.cpp
-index fe830b4..c49aade 100644
---- a/Source/JavaScriptCore/runtime/Options.cpp
-+++ b/Source/JavaScriptCore/runtime/Options.cpp
-@@ -610,7 +610,7 @@ bool Option::operator==(const Option& other) const
-     case Options::Type::unsignedType:
-         return m_entry.unsignedVal == other.m_entry.unsignedVal;
-     case Options::Type::doubleType:
--        return (m_entry.doubleVal == other.m_entry.doubleVal) || (isnan(m_entry.doubleVal) && isnan(other.m_entry.doubleVal));
-+        return (m_entry.doubleVal == other.m_entry.doubleVal) || (std::isnan(m_entry.doubleVal) && std::isnan(other.m_entry.doubleVal));
-     case Options::Type::int32Type:
-         return m_entry.int32Val == other.m_entry.int32Val;
-     case Options::Type::optionRangeType:
-diff --git a/Source/WTF/wtf/DisallowCType.h b/Source/WTF/wtf/DisallowCType.h
-index d85e767..dc6bcab 100644
---- a/Source/WTF/wtf/DisallowCType.h
-+++ b/Source/WTF/wtf/DisallowCType.h
-@@ -40,7 +40,7 @@
- // are used from wx headers. On GTK+ for Mac many GTK+ files include <libintl.h>
- // or <glib/gi18n-lib.h>, which in turn include <xlocale/_ctype.h> which uses
- // isacii(). 
--#if !(OS(DARWIN) && PLATFORM(GTK)) && !PLATFORM(EFL) && !defined(_LIBCPP_VERSION)
-+#if !(OS(DARWIN) && PLATFORM(GTK)) && !PLATFORM(EFL) && !defined(_LIBCPP_VERSION) && defined(__GLIBC__)
- 
- #include <ctype.h>
- 
-diff --git a/Source/WebCore/platform/linux/MemoryPressureHandlerLinux.cpp b/Source/WebCore/platform/linux/MemoryPressureHandlerLinux.cpp
-index ea61909..1495642 100644
---- a/Source/WebCore/platform/linux/MemoryPressureHandlerLinux.cpp
-+++ b/Source/WebCore/platform/linux/MemoryPressureHandlerLinux.cpp
-@@ -202,7 +202,9 @@ void MemoryPressureHandler::respondToMemoryPressure(Critical critical, Synchrono
- void MemoryPressureHandler::platformReleaseMemory(Critical)
- {
-     ReliefLogger log("Run malloc_trim");
-+#ifdef __GLIBC__
-     malloc_trim(0);
-+#endif
- }
- 
- void MemoryPressureHandler::ReliefLogger::platformLog()
--- 
-2.6.4
-
diff --git a/meta/recipes-sato/webkit/webkitgtk/clang.patch b/meta/recipes-sato/webkit/webkitgtk/clang.patch
deleted file mode 100644
index e526713..0000000
--- a/meta/recipes-sato/webkit/webkitgtk/clang.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Clang's builtin for clear_cache accepts char* and errors out when using void*,
-using char* work on both gcc and clang since char* is auto-converted to void* in gcc case
-
-Source/JavaScriptCore/assembler/ARM64Assembler.h:2857:33: error: cannot initialize a parameter of type 'char *' with an rvalue of type 'void *'
-        __builtin___clear_cache(reinterpret_cast<void*>(begin), reinterpret_cast<void*>(end));
-                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-1 error generated.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Accepted
-
-Index: webkitgtk-2.8.5/Source/JavaScriptCore/assembler/ARM64Assembler.h
-===================================================================
---- webkitgtk-2.8.5.orig/Source/JavaScriptCore/assembler/ARM64Assembler.h
-+++ webkitgtk-2.8.5/Source/JavaScriptCore/assembler/ARM64Assembler.h
-@@ -2854,7 +2854,7 @@ public:
- #if OS(LINUX) && COMPILER(GCC)
-     static inline void linuxPageFlush(uintptr_t begin, uintptr_t end)
-     {
--        __builtin___clear_cache(reinterpret_cast<void*>(begin), reinterpret_cast<void*>(end));
-+        __builtin___clear_cache(reinterpret_cast<char*>(begin), reinterpret_cast<char*>(end));
-     }
- #endif
- 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb b/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
similarity index 92%
rename from meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
index 269ae4b..bdbcbea 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
@@ -12,15 +12,14 @@ LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d842
 
 SRC_URI = "\
   http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
-  file://clang.patch \
-  file://0001-Enable-backtrace-on-linux-when-using-glibc.patch \
-  file://0001-Fix-build-with-non-glibc-libraries-on-linux.patch \
   file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
   file://0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch \
   file://0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch \
+  file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
+  file://musl-fixes.patch \
   "
-SRC_URI[md5sum] = "84832b9d8329413b4f1d87df5f7e8efe"
-SRC_URI[sha256sum] = "990d62c82ed6dede31a6ff0a82d847f16b812842ff3e1093d17113627652864e"
+SRC_URI[md5sum] = "adcbee440d81acfb1ead9ada91bd5e79"
+SRC_URI[sha256sum] = "5b1a2d5227553f3cecbdb258c68b384f9235747b2c07c15afb555fe4fa6ae896"
 
 inherit cmake lib_package pkgconfig perlnative pythonnative distro_features_check upstream-version-is-even gobject-introspection
 
@@ -75,6 +74,9 @@ EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_mips = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE_append_mips64 = " -DENABLE_JIT=OFF "
 
+SECURITY_CFLAGS_remove_aarch64 = "-fpie"
+SECURITY_CFLAGS_append_aarch64 = " -fPIE"
+
 FILES_${PN} += "${libdir}/webkit2gtk-4.0/injected-bundle/libwebkit2gtkinjectedbundle.so"
 
 # http://errors.yoctoproject.org/Errors/Details/20370/
-- 
2.8.2


