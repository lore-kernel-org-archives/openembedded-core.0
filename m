Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 13663784F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 14:58:05 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 06:58:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; d="scan'208";a="173402250"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 14 Nov 2017 06:58:05 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 16:57:44 +0200
Message-Id: <20171114145754.9643-17-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 17/27] webkitgtk: update to 2.18.3
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
X-List-Received-Date: Tue, 14 Nov 2017 14:58:05 -0000

gcc7.patch, musl-fixes.patch, and ppc-musl-fix.patch all change code that is no
longer present in upstream tree. However, a patch with different musl fixes
has been added.

The rest of the patches are rebased to the new tree.

Libtasn is a new dependency.

Disable Gstreamer GL support on x86 due to clashing headers problem.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../webkitgtk/0001-Fix-build-with-musl.patch       |  77 +++++++++
 ...ix-racy-parallel-build-of-WebKit2-4.0.gir.patch |  23 +--
 ...c-settings-so-that-gtkdoc-generation-work.patch |  21 +--
 ...bKitMacros-Append-to-I-and-not-to-isystem.patch | 182 ++++++++-------------
 ...ng-introspection-files-add-CMAKE_C_FLAGS-.patch |  24 +--
 .../detect-atomics-during-configure.patch          |  26 ++-
 meta/recipes-sato/webkit/webkitgtk/gcc7.patch      |  23 ---
 .../recipes-sato/webkit/webkitgtk/musl-fixes.patch |  48 ------
 .../webkit/webkitgtk/ppc-musl-fix.patch            |  26 ---
 .../{webkitgtk_2.16.6.bb => webkitgtk_2.18.3.bb}   |  13 +-
 10 files changed, 209 insertions(+), 254 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/gcc7.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/musl-fixes.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.16.6.bb => webkitgtk_2.18.3.bb} (93%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
new file mode 100644
index 00000000000..7cc4514fccc
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
@@ -0,0 +1,77 @@
+From 415e31bd5444fa360af58b069f1b9db6607fca7d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 6 Oct 2017 17:00:08 +0300
+Subject: [PATCH] Fix build with musl
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Source/JavaScriptCore/runtime/MachineContext.h | 10 +++++-----
+ Source/WTF/wtf/Platform.h                      |  2 +-
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/Source/JavaScriptCore/runtime/MachineContext.h b/Source/JavaScriptCore/runtime/MachineContext.h
+index 95080b9..2bb689c 100644
+--- a/Source/JavaScriptCore/runtime/MachineContext.h
++++ b/Source/JavaScriptCore/runtime/MachineContext.h
+@@ -146,7 +146,7 @@ inline void*& stackPointer(mcontext_t& machineContext)
+ #error Unknown Architecture
+ #endif
+ 
+-#elif defined(__GLIBC__)
++#elif defined(__linux__)
+ 
+ #if CPU(X86)
+     return reinterpret_cast<void*&>((uintptr_t&) machineContext.gregs[REG_ESP]);
+@@ -251,7 +251,7 @@ inline void*& framePointer(mcontext_t& machineContext)
+ #error Unknown Architecture
+ #endif
+ 
+-#elif defined(__GLIBC__)
++#elif defined(__linux__)
+ 
+ // The following sequence depends on glibc's sys/ucontext.h.
+ #if CPU(X86)
+@@ -354,7 +354,7 @@ inline void*& instructionPointer(mcontext_t& machineContext)
+ #error Unknown Architecture
+ #endif
+ 
+-#elif defined(__GLIBC__)
++#elif defined(__linux__)
+ 
+ // The following sequence depends on glibc's sys/ucontext.h.
+ #if CPU(X86)
+@@ -466,7 +466,7 @@ inline void*& argumentPointer<1>(mcontext_t& machineContext)
+ #error Unknown Architecture
+ #endif
+ 
+-#elif defined(__GLIBC__)
++#elif defined(__linux__)
+ 
+ // The following sequence depends on glibc's sys/ucontext.h.
+ #if CPU(X86)
+@@ -583,7 +583,7 @@ inline void*& llintInstructionPointer(mcontext_t& machineContext)
+ #error Unknown Architecture
+ #endif
+ 
+-#elif defined(__GLIBC__)
++#elif defined(__linux__)
+ 
+ // The following sequence depends on glibc's sys/ucontext.h.
+ #if CPU(X86)
+diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
+index 5a2863b..b36c3ff 100644
+--- a/Source/WTF/wtf/Platform.h
++++ b/Source/WTF/wtf/Platform.h
+@@ -680,7 +680,7 @@
+ #define HAVE_CFNETWORK_STORAGE_PARTITIONING 1
+ #endif
+ 
+-#if OS(DARWIN) || ((OS(FREEBSD) || defined(__GLIBC__)) && (CPU(X86) || CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))
++#if OS(DARWIN) || ((OS(FREEBSD) || defined(__linux__)) && (CPU(X86) || CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))
+ #define HAVE_MACHINE_CONTEXT 1
+ #endif
+ 
+-- 
+2.14.1
+
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
index 615fe4f4025..896890b4334 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
@@ -1,19 +1,20 @@
-From 5760d346b42807b596f479c81f7a6b42eb36065e Mon Sep 17 00:00:00 2001
+From b7f40eceef0f23bf88090789d4c5845c35f048ae Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 29 Aug 2016 16:38:11 +0300
-Subject: [PATCH] Fix racy parallel build of WebKit2-4.0.gir
+Subject: [PATCH 4/9] Fix racy parallel build of WebKit2-4.0.gir
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
- Source/WebKit2/PlatformGTK.cmake | 9 +++++----
+ Source/WebKit/PlatformGTK.cmake | 9 +++++----
  1 file changed, 5 insertions(+), 4 deletions(-)
 
-diff --git a/Source/WebKit2/PlatformGTK.cmake b/Source/WebKit2/PlatformGTK.cmake
-index adaa010..f18cf8a 100644
---- a/Source/WebKit2/PlatformGTK.cmake
-+++ b/Source/WebKit2/PlatformGTK.cmake
-@@ -906,8 +906,9 @@ endif ()
+diff --git a/Source/WebKit/PlatformGTK.cmake b/Source/WebKit/PlatformGTK.cmake
+index a33c6a86..d83a2e77 100644
+--- a/Source/WebKit/PlatformGTK.cmake
++++ b/Source/WebKit/PlatformGTK.cmake
+@@ -1122,8 +1122,9 @@ endif ()
  string(REGEX MATCHALL "-L[^ ]*"
      INTROSPECTION_ADDITIONAL_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS}")
  
@@ -25,7 +26,7 @@ index adaa010..f18cf8a 100644
      DEPENDS WebKit2
      DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
      COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS} LDFLAGS=
-@@ -950,7 +951,7 @@ add_custom_command(
+@@ -1168,7 +1169,7 @@ add_custom_command(
  add_custom_command(
      OUTPUT ${CMAKE_BINARY_DIR}/WebKit2WebExtension-${WEBKITGTK_API_VERSION}.gir
      DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
@@ -34,7 +35,7 @@ index adaa010..f18cf8a 100644
      COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS}
          LDFLAGS="${INTROSPECTION_ADDITIONAL_LDFLAGS}"
          ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
-@@ -1004,7 +1005,7 @@ add_custom_command(
+@@ -1225,7 +1226,7 @@ add_custom_command(
  
  add_custom_command(
      OUTPUT ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.typelib
@@ -44,5 +45,5 @@ index adaa010..f18cf8a 100644
  )
  
 -- 
-2.9.3
+2.14.1
 
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
index 586dd2375c9..e1b69b2a214 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
@@ -1,8 +1,8 @@
-From 4eeeaec775e190cf3f5885d7c6717acebd0201a8 Mon Sep 17 00:00:00 2001
+From 3cc0e5900515cbcedd0447e0bdf487cc8d9a0f8c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 11 Aug 2016 17:13:51 +0300
-Subject: [PATCH] Tweak gtkdoc settings so that gtkdoc generation works under
- OpenEmbedded build system
+Subject: [PATCH 5/9] Tweak gtkdoc settings so that gtkdoc generation works
+ under OpenEmbedded build system
 
 This requires setting a few environment variables so that the transient
 binary is build and linked correctly, and disabling the tweaks to RUN
@@ -10,26 +10,27 @@ variable from gtkdoc.py script so that our qemu wrapper is taken into use.
 
 Upstream-Status: Inappropriate [oe-specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  Source/PlatformGTK.cmake | 2 +-
  Tools/gtk/gtkdoc.py      | 4 ++--
  2 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/Source/PlatformGTK.cmake b/Source/PlatformGTK.cmake
-index af4d2e3..b7b93c7 100644
+index 50b5393f..7a31db51 100644
 --- a/Source/PlatformGTK.cmake
 +++ b/Source/PlatformGTK.cmake
-@@ -25,7 +25,7 @@ macro(ADD_GTKDOC_GENERATOR _stamp_name _extra_args)
+@@ -24,7 +24,7 @@ macro(ADD_GTKDOC_GENERATOR _stamp_name _extra_args)
      add_custom_command(
          OUTPUT "${CMAKE_BINARY_DIR}/${_stamp_name}"
          DEPENDS ${DocumentationDependencies}
--        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=${CMAKE_C_FLAGS} ${CMAKE_SOURCE_DIR}/Tools/gtk/generate-gtkdoc ${_extra_args}
-+        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=${CMAKE_C_FLAGS} LD=${CMAKE_C_COMPILER} LDFLAGS=${CMAKE_C_LINK_FLAGS} RUN=${CMAKE_BINARY_DIR}/gtkdoc-qemuwrapper GIR_EXTRA_LIBS_PATH=${CMAKE_BINARY_DIR}/lib ${CMAKE_SOURCE_DIR}/Tools/gtk/generate-gtkdoc ${_extra_args}
+-        COMMAND ${CMAKE_COMMAND} -E env "CC=${CMAKE_C_COMPILER}" "CFLAGS=${CMAKE_C_FLAGS} -Wno-unused-parameter" ${CMAKE_SOURCE_DIR}/Tools/gtk/generate-gtkdoc ${_extra_args}
++        COMMAND ${CMAKE_COMMAND} -E env "CC=${CMAKE_C_COMPILER}" "CFLAGS=${CMAKE_C_FLAGS} -Wno-unused-parameter" "LD=${CMAKE_C_COMPILER}" "LDFLAGS=${CMAKE_C_LINK_FLAGS}" "RUN=${CMAKE_BINARY_DIR}/gtkdoc-qemuwrapper" ${CMAKE_SOURCE_DIR}/Tools/gtk/generate-gtkdoc -v ${_extra_args}
          COMMAND touch ${_stamp_name}
          WORKING_DIRECTORY "${CMAKE_BINARY_DIR}"
-     )
+         VERBATIM
 diff --git a/Tools/gtk/gtkdoc.py b/Tools/gtk/gtkdoc.py
-index 4c8237b..c0205f0 100644
+index 48f862a3..18240e42 100644
 --- a/Tools/gtk/gtkdoc.py
 +++ b/Tools/gtk/gtkdoc.py
 @@ -318,9 +318,9 @@ class GTKDoc(object):
@@ -45,5 +46,5 @@ index 4c8237b..c0205f0 100644
  
          if ldflags:
 -- 
-2.8.1
+2.14.1
 
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch b/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
index d6f0ce3cd63..dfdc1160182 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
@@ -1,7 +1,7 @@
-From 53a00058184cd710c6f4375f4daab49d7e885a30 Mon Sep 17 00:00:00 2001
+From ef832a115b40861c08df333339b1366da49e5393 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 17 Apr 2016 12:35:41 -0700
-Subject: [PATCH] WebKitMacros: Append to -I and not to -isystem
+Subject: [PATCH 9/9] WebKitMacros: Append to -I and not to -isystem
 
 gcc-6 has now introduced stdlib.h in libstdc++ for better
 compliance and its including the C library stdlib.h using
@@ -15,68 +15,34 @@ and ends up with compile errors e.g.
 /usr/include/c++/6.0.0/cstdlib:75:25: fatal error: stdlib.h: No such file or directory
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
 
- Source/cmake/WebKitMacros.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+---
+ Source/JavaScriptCore/shell/CMakeLists.txt | 2 +-
+ Source/WebCore/PlatformGTK.cmake           | 6 +++---
+ Source/WebKit/PlatformGTK.cmake            | 2 +-
+ Source/cmake/WebKitMacros.cmake            | 2 +-
+ Tools/MiniBrowser/gtk/CMakeLists.txt       | 2 +-
+ Tools/TestWebKitAPI/PlatformGTK.cmake      | 2 +-
+ 6 files changed, 8 insertions(+), 8 deletions(-)
 
-Index: webkitgtk-2.16.5/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
-===================================================================
---- webkitgtk-2.16.5.orig/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
-+++ webkitgtk-2.16.5/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
-@@ -42,7 +42,7 @@ set(WebKitTestNetscapePlugIn_SYSTEM_INCL
- )
- 
- include_directories(${WebKitTestNetscapePlugIn_INCLUDE_DIRECTORIES})
--include_directories(SYSTEM ${WebKitTestNetscapePlugIn_SYSTEM_INCLUDE_DIRECTORIES})
-+include_directories(${WebKitTestNetscapePlugIn_SYSTEM_INCLUDE_DIRECTORIES})
- 
- set(WebKitTestNetscapePlugIn_LIBRARIES
-     ${X11_LIBRARIES}
-Index: webkitgtk-2.16.5/Tools/ImageDiff/CMakeLists.txt
-===================================================================
---- webkitgtk-2.16.5.orig/Tools/ImageDiff/CMakeLists.txt
-+++ webkitgtk-2.16.5/Tools/ImageDiff/CMakeLists.txt
-@@ -9,6 +9,6 @@ set(IMAGE_DIFF_LIBRARIES
- WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
- 
- include_directories(${IMAGE_DIFF_INCLUDE_DIRECTORIES})
--include_directories(SYSTEM ${IMAGE_DIFF_SYSTEM_INCLUDE_DIRECTORIES})
-+include_directories(${IMAGE_DIFF_SYSTEM_INCLUDE_DIRECTORIES})
- add_executable(ImageDiff ${IMAGE_DIFF_SOURCES})
- target_link_libraries(ImageDiff ${IMAGE_DIFF_LIBRARIES})
-Index: webkitgtk-2.16.5/Tools/MiniBrowser/gtk/CMakeLists.txt
-===================================================================
---- webkitgtk-2.16.5.orig/Tools/MiniBrowser/gtk/CMakeLists.txt
-+++ webkitgtk-2.16.5/Tools/MiniBrowser/gtk/CMakeLists.txt
-@@ -57,7 +57,7 @@ endif ()
- add_definitions(-DGDK_VERSION_MIN_REQUIRED=GDK_VERSION_3_6)
- 
- include_directories(${MiniBrowser_INCLUDE_DIRECTORIES})
--include_directories(SYSTEM ${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
-+include_directories(${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
- add_executable(MiniBrowser ${MiniBrowser_SOURCES})
- target_link_libraries(MiniBrowser ${MiniBrowser_LIBRARIES})
- 
-Index: webkitgtk-2.16.5/Tools/WebKitTestRunner/CMakeLists.txt
-===================================================================
---- webkitgtk-2.16.5.orig/Tools/WebKitTestRunner/CMakeLists.txt
-+++ webkitgtk-2.16.5/Tools/WebKitTestRunner/CMakeLists.txt
-@@ -106,7 +106,7 @@ GENERATE_BINDINGS(WebKitTestRunnerBindin
- WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
- 
- include_directories(${WebKitTestRunner_INCLUDE_DIRECTORIES})
--include_directories(SYSTEM ${WebKitTestRunner_SYSTEM_INCLUDE_DIRECTORIES})
-+include_directories(${WebKitTestRunner_SYSTEM_INCLUDE_DIRECTORIES})
+diff --git a/Source/JavaScriptCore/shell/CMakeLists.txt b/Source/JavaScriptCore/shell/CMakeLists.txt
+index bc37dd31..4e49871f 100644
+--- a/Source/JavaScriptCore/shell/CMakeLists.txt
++++ b/Source/JavaScriptCore/shell/CMakeLists.txt
+@@ -35,7 +35,7 @@ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
+ WEBKIT_WRAP_SOURCELIST(${JSC_SOURCES})
+ WEBKIT_WRAP_SOURCELIST(${TESTAPI_SOURCES})
+ include_directories(./ ${JavaScriptCore_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
+ add_executable(jsc ${JSC_SOURCES})
+ target_link_libraries(jsc ${JSC_LIBRARIES})
  
- add_library(TestRunnerInjectedBundle SHARED ${WebKitTestRunnerInjectedBundle_SOURCES})
- target_link_libraries(TestRunnerInjectedBundle ${WebKitTestRunner_LIBRARIES})
-Index: webkitgtk-2.16.5/Source/WebCore/PlatformGTK.cmake
-===================================================================
---- webkitgtk-2.16.5.orig/Source/WebCore/PlatformGTK.cmake
-+++ webkitgtk-2.16.5/Source/WebCore/PlatformGTK.cmake
-@@ -321,7 +321,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
+diff --git a/Source/WebCore/PlatformGTK.cmake b/Source/WebCore/PlatformGTK.cmake
+index 73506c74..8eb8b415 100644
+--- a/Source/WebCore/PlatformGTK.cmake
++++ b/Source/WebCore/PlatformGTK.cmake
+@@ -281,7 +281,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
          ${GTK2_INCLUDE_DIRS}
          ${GDK2_INCLUDE_DIRS}
      )
@@ -85,7 +51,7 @@ Index: webkitgtk-2.16.5/Source/WebCore/PlatformGTK.cmake
          ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
      )
      target_link_libraries(WebCorePlatformGTK2
-@@ -346,7 +346,7 @@ WEBKIT_SET_EXTRA_COMPILER_FLAGS(WebCoreP
+@@ -305,7 +305,7 @@ add_dependencies(WebCorePlatformGTK WebCore)
  target_include_directories(WebCorePlatformGTK PRIVATE
      ${WebCore_INCLUDE_DIRECTORIES}
  )
@@ -94,7 +60,7 @@ Index: webkitgtk-2.16.5/Source/WebCore/PlatformGTK.cmake
      ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
      ${GTK_INCLUDE_DIRS}
      ${GDK_INCLUDE_DIRS}
-@@ -362,7 +362,7 @@ include_directories(
+@@ -321,7 +321,7 @@ include_directories(
      "${WEBCORE_DIR}/bindings/gobject/"
  )
  
@@ -103,37 +69,11 @@ Index: webkitgtk-2.16.5/Source/WebCore/PlatformGTK.cmake
      ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
  )
  
-Index: webkitgtk-2.16.5/Tools/TestWebKitAPI/PlatformGTK.cmake
-===================================================================
---- webkitgtk-2.16.5.orig/Tools/TestWebKitAPI/PlatformGTK.cmake
-+++ webkitgtk-2.16.5/Tools/TestWebKitAPI/PlatformGTK.cmake
-@@ -20,7 +20,7 @@ include_directories(
-     ${WEBKIT2_DIR}/UIProcess/API/gtk
- )
- 
--include_directories(SYSTEM
-+include_directories(
-     ${GDK3_INCLUDE_DIRS}
-     ${GLIB_INCLUDE_DIRS}
-     ${GTK3_INCLUDE_DIRS}
-Index: webkitgtk-2.16.5/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
-===================================================================
---- webkitgtk-2.16.5.orig/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
-+++ webkitgtk-2.16.5/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
-@@ -21,7 +21,7 @@ include_directories(
-     ${TOOLS_DIR}/TestWebKitAPI/gtk/WebKit2Gtk
- )
- 
--include_directories(SYSTEM
-+include_directories(
-     ${ATSPI_INCLUDE_DIRS}
-     ${GLIB_INCLUDE_DIRS}
-     ${GSTREAMER_INCLUDE_DIRS}
-Index: webkitgtk-2.16.5/Source/WebKit2/PlatformGTK.cmake
-===================================================================
---- webkitgtk-2.16.5.orig/Source/WebKit2/PlatformGTK.cmake
-+++ webkitgtk-2.16.5/Source/WebKit2/PlatformGTK.cmake
-@@ -1156,7 +1156,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
+diff --git a/Source/WebKit/PlatformGTK.cmake b/Source/WebKit/PlatformGTK.cmake
+index d83a2e77..401246f4 100644
+--- a/Source/WebKit/PlatformGTK.cmake
++++ b/Source/WebKit/PlatformGTK.cmake
+@@ -1050,7 +1050,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
      target_include_directories(WebKitPluginProcess2 PRIVATE
          ${WebKit2CommonIncludeDirectories}
      )
@@ -142,29 +82,45 @@ Index: webkitgtk-2.16.5/Source/WebKit2/PlatformGTK.cmake
           ${WebKit2CommonSystemIncludeDirectories}
           ${GTK2_INCLUDE_DIRS}
           ${GDK2_INCLUDE_DIRS}
-Index: webkitgtk-2.16.5/Source/JavaScriptCore/shell/CMakeLists.txt
-===================================================================
---- webkitgtk-2.16.5.orig/Source/JavaScriptCore/shell/CMakeLists.txt
-+++ webkitgtk-2.16.5/Source/JavaScriptCore/shell/CMakeLists.txt
-@@ -20,7 +20,7 @@ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
- 
- WEBKIT_WRAP_SOURCELIST(${JSC_SOURCES})
- include_directories(./ ${JavaScriptCore_INCLUDE_DIRECTORIES})
--include_directories(SYSTEM ${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
-+include_directories(${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
- add_executable(jsc ${JSC_SOURCES})
- target_link_libraries(jsc ${JSC_LIBRARIES})
- 
-Index: webkitgtk-2.16.5/Source/cmake/WebKitMacros.cmake
-===================================================================
---- webkitgtk-2.16.5.orig/Source/cmake/WebKitMacros.cmake
-+++ webkitgtk-2.16.5/Source/cmake/WebKitMacros.cmake
-@@ -277,7 +277,7 @@ macro(WEBKIT_WRAP_SOURCELIST)
+diff --git a/Source/cmake/WebKitMacros.cmake b/Source/cmake/WebKitMacros.cmake
+index 7bc89543..d9818fa4 100644
+--- a/Source/cmake/WebKitMacros.cmake
++++ b/Source/cmake/WebKitMacros.cmake
+@@ -78,7 +78,7 @@ macro(WEBKIT_FRAMEWORK_DECLARE _target)
  endmacro()
  
  macro(WEBKIT_FRAMEWORK _target)
 -    include_directories(SYSTEM ${${_target}_SYSTEM_INCLUDE_DIRECTORIES})
 +    include_directories(${${_target}_SYSTEM_INCLUDE_DIRECTORIES})
-     add_library(${_target} ${${_target}_LIBRARY_TYPE}
+     target_sources(${_target} PRIVATE
          ${${_target}_HEADERS}
          ${${_target}_SOURCES}
+diff --git a/Tools/MiniBrowser/gtk/CMakeLists.txt b/Tools/MiniBrowser/gtk/CMakeLists.txt
+index e832a86d..ce92c864 100644
+--- a/Tools/MiniBrowser/gtk/CMakeLists.txt
++++ b/Tools/MiniBrowser/gtk/CMakeLists.txt
+@@ -57,7 +57,7 @@ endif ()
+ add_definitions(-DGDK_VERSION_MIN_REQUIRED=GDK_VERSION_3_6)
+ 
+ include_directories(${MiniBrowser_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
+ add_executable(MiniBrowser ${MiniBrowser_SOURCES})
+ target_link_libraries(MiniBrowser ${MiniBrowser_LIBRARIES})
+ 
+diff --git a/Tools/TestWebKitAPI/PlatformGTK.cmake b/Tools/TestWebKitAPI/PlatformGTK.cmake
+index 1be3dd52..7bdddf37 100644
+--- a/Tools/TestWebKitAPI/PlatformGTK.cmake
++++ b/Tools/TestWebKitAPI/PlatformGTK.cmake
+@@ -20,7 +20,7 @@ include_directories(
+     ${WEBKIT2_DIR}/UIProcess/API/gtk
+ )
+ 
+-include_directories(SYSTEM
++include_directories(
+     ${GDK3_INCLUDE_DIRS}
+     ${GLIB_INCLUDE_DIRS}
+     ${GTK3_INCLUDE_DIRS}
+-- 
+2.14.1
+
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch b/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
index 3f71297f504..fb4c4dc9325 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
@@ -1,23 +1,24 @@
-From bae9f73b2c693b5aa156fed717d6481b60682786 Mon Sep 17 00:00:00 2001
+From 98b1359a0cd87bbdb22cef98ba594440f4c57d92 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 28 Oct 2015 14:18:57 +0200
-Subject: [PATCH] When building introspection files, add CMAKE_C_FLAGS to the
- compiler flags.
+Subject: [PATCH 2/9] When building introspection files, add CMAKE_C_FLAGS to
+ the compiler flags.
 
 g-ir-compiler is using a C compiler internally, so it needs to set
 the proper flags for it.
 
 Upstream-Status: Pending [review on oe-core list]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
- Source/WebKit2/PlatformGTK.cmake | 4 ++--
+ Source/WebKit/PlatformGTK.cmake | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: webkitgtk-2.12.1/Source/WebKit2/PlatformGTK.cmake
-===================================================================
---- webkitgtk-2.12.1.orig/Source/WebKit2/PlatformGTK.cmake
-+++ webkitgtk-2.12.1/Source/WebKit2/PlatformGTK.cmake
-@@ -910,7 +910,7 @@ add_custom_command(
+diff --git a/Source/WebKit/PlatformGTK.cmake b/Source/WebKit/PlatformGTK.cmake
+index 7f92ae72..a33c6a86 100644
+--- a/Source/WebKit/PlatformGTK.cmake
++++ b/Source/WebKit/PlatformGTK.cmake
+@@ -1126,7 +1126,7 @@ add_custom_command(
      OUTPUT ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
      DEPENDS WebKit2
      DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
@@ -26,7 +27,7 @@ Index: webkitgtk-2.12.1/Source/WebKit2/PlatformGTK.cmake
          ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
          ${INTROSPECTION_SCANNER}
          --quiet
-@@ -951,7 +951,7 @@ add_custom_command(
+@@ -1169,7 +1169,7 @@ add_custom_command(
      OUTPUT ${CMAKE_BINARY_DIR}/WebKit2WebExtension-${WEBKITGTK_API_VERSION}.gir
      DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
      DEPENDS ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
@@ -35,3 +36,6 @@ Index: webkitgtk-2.12.1/Source/WebKit2/PlatformGTK.cmake
          LDFLAGS="${INTROSPECTION_ADDITIONAL_LDFLAGS}"
          ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
          ${INTROSPECTION_SCANNER}
+-- 
+2.14.1
+
diff --git a/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch b/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch
index 12836f28f2e..c6157e10378 100644
--- a/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch
@@ -1,22 +1,31 @@
+From 0b3811771ae6385503f2d949f9433d8f810d2ff9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 17 May 2017 22:34:24 -0700
+Subject: [PATCH 8/9] webkitgtk: Fix build for armv5
+
 Taken from
 https://bugs.webkit.org/show_bug.cgi?id=161900
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: webkitgtk-2.16.1/Source/WTF/wtf/CMakeLists.txt
-===================================================================
---- webkitgtk-2.16.1.orig/Source/WTF/wtf/CMakeLists.txt
-+++ webkitgtk-2.16.1/Source/WTF/wtf/CMakeLists.txt
-@@ -182,7 +182,6 @@ set(WTF_HEADERS
+---
+ Source/WTF/wtf/CMakeLists.txt | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/Source/WTF/wtf/CMakeLists.txt b/Source/WTF/wtf/CMakeLists.txt
+index 6b5e45b9..46ee3c22 100644
+--- a/Source/WTF/wtf/CMakeLists.txt
++++ b/Source/WTF/wtf/CMakeLists.txt
+@@ -205,7 +205,6 @@ set(WTF_HEADERS
  
  set(WTF_SOURCES
      Assertions.cpp
 -    Atomics.cpp
      AutomaticThread.cpp
      BitVector.cpp
-     ClockType.cpp
-@@ -301,6 +300,15 @@ if (NOT USE_SYSTEM_MALLOC)
+     CPUTime.cpp
+@@ -336,6 +335,15 @@ if (NOT USE_SYSTEM_MALLOC)
      list(APPEND WTF_LIBRARIES bmalloc)
  endif ()
  
@@ -32,3 +41,6 @@ Index: webkitgtk-2.16.1/Source/WTF/wtf/CMakeLists.txt
  list(APPEND WTF_SOURCES
      unicode/icu/CollatorICU.cpp
  )
+-- 
+2.14.1
+
diff --git a/meta/recipes-sato/webkit/webkitgtk/gcc7.patch b/meta/recipes-sato/webkit/webkitgtk/gcc7.patch
deleted file mode 100644
index aee29a9a72d..00000000000
--- a/meta/recipes-sato/webkit/webkitgtk/gcc7.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Imported from
-https://src.fedoraproject.org/cgit/rpms/webkitgtk4.git/plain/gcc7.patch
-
-Add to CXX flags since webkitgtk uses c++ compiler by default
-Fixes
-Source/JavaScriptCore/runtime/JSGenericTypedArrayView.h:119:67: error: no matching function for call to 'JSC::JSGenericTypedArrayView<Adaptor>::vector() const'
-|          return bitwise_cast<const typename Adaptor::Type*>(vector());
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com
-Upstream-Status: Pending
-
-diff -up webkitgtk-2.15.90/Source/cmake/OptionsCommon.cmake.gcc7 webkitgtk-2.15.90/Source/cmake/OptionsCommon.cmake
---- webkitgtk-2.15.90/Source/cmake/OptionsCommon.cmake.gcc7	2017-02-21 09:57:13.168916004 +0100
-+++ webkitgtk-2.15.90/Source/cmake/OptionsCommon.cmake	2017-02-21 09:58:12.811563156 +0100
-@@ -41,6 +41,8 @@ if (COMPILER_IS_GCC_OR_CLANG)
-     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fno-exceptions -fno-strict-aliasing")
-     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-exceptions -fno-strict-aliasing -fno-rtti")
-     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++1y")
-+    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-expansion-to-defined")
-+    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-expansion-to-defined")
- endif ()
- 
- if (COMPILER_IS_CLANG AND CMAKE_GENERATOR STREQUAL "Ninja")
diff --git a/meta/recipes-sato/webkit/webkitgtk/musl-fixes.patch b/meta/recipes-sato/webkit/webkitgtk/musl-fixes.patch
deleted file mode 100644
index 4fdd56fea04..00000000000
--- a/meta/recipes-sato/webkit/webkitgtk/musl-fixes.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Replace __GLIBC__ with __linux__ since musl also supports it
-so checking __linux__ is more accomodating
-
-See http://git.alpinelinux.org/cgit/aports/tree/community/webkit2gtk/musl-fixes.patch?id=219435d86d7e8fac9474344a7431c62bd2525184
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: webkitgtk-2.12.1/Source/JavaScriptCore/heap/MachineStackMarker.cpp
-===================================================================
---- webkitgtk-2.12.1.orig/Source/JavaScriptCore/heap/MachineStackMarker.cpp
-+++ webkitgtk-2.12.1/Source/JavaScriptCore/heap/MachineStackMarker.cpp
-@@ -566,7 +566,7 @@ void* MachineThreads::Thread::Registers:
- #error Unknown Architecture
- #endif
- 
--#elif defined(__GLIBC__) && ENABLE(JIT)
-+#elif defined(__linux__) && ENABLE(JIT)
- 
- #if CPU(X86)
-     return reinterpret_cast<void*>((uintptr_t) regs.machineContext.gregs[REG_ESP]);
-@@ -665,7 +665,7 @@ void* MachineThreads::Thread::Registers:
- #error Unknown Architecture
- #endif
- 
--#elif defined(__GLIBC__)
-+#elif defined(__linux__) // glibc and musl
- 
- // The following sequence depends on glibc's sys/ucontext.h.
- #if CPU(X86)
-@@ -747,7 +747,7 @@ void* MachineThreads::Thread::Registers:
- #error Unknown Architecture
- #endif
- 
--#elif defined(__GLIBC__)
-+#elif defined(__linux__) // glibc and musl
- 
- // The following sequence depends on glibc's sys/ucontext.h.
- #if CPU(X86)
-@@ -838,7 +838,7 @@ void* MachineThreads::Thread::Registers:
- #error Unknown Architecture
- #endif
- 
--#elif defined(__GLIBC__)
-+#elif defined(__linux__) // glibc and musl
- 
- // The following sequence depends on glibc's sys/ucontext.h.
- #if CPU(X86)
diff --git a/meta/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch b/meta/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch
deleted file mode 100644
index a1ad248aac0..00000000000
--- a/meta/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-ucontext structure is different between musl and glibc for ppc
-therefore its not enough just to check for arch alone, we also
-need to check for libc type.
-
-Fixes errors like
-
-Source/JavaScriptCore/heap/MachineStackMarker.cpp:90:65: error: 'struct mcontext_t' has no member named 'uc_regs'; did you mean 'gregs'?
-     thread->suspendedMachineContext = *userContext->uc_mcontext.uc_regs;
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: webkitgtk-2.16.3/Source/JavaScriptCore/heap/MachineStackMarker.cpp
-===================================================================
---- webkitgtk-2.16.3.orig/Source/JavaScriptCore/heap/MachineStackMarker.cpp
-+++ webkitgtk-2.16.3/Source/JavaScriptCore/heap/MachineStackMarker.cpp
-@@ -88,7 +88,7 @@ static void pthreadSignalHandlerSuspendR
-     }
- 
-     ucontext_t* userContext = static_cast<ucontext_t*>(ucontext);
--#if CPU(PPC)
-+#if CPU(PPC) && defined(__GLIBC__)
-     threadData->suspendedMachineContext = *userContext->uc_mcontext.uc_regs;
- #else
-     threadData->suspendedMachineContext = userContext->uc_mcontext;
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.18.3.bb
similarity index 93%
rename from meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.18.3.bb
index 0f126cba813..00b5a15e085 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.18.3.bb
@@ -13,19 +13,17 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
            file://0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch \
            file://0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch \
-           file://musl-fixes.patch \
-           file://ppc-musl-fix.patch \
            file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch \
            file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
            file://x32_support.patch \
            file://cross-compile.patch \
-           file://gcc7.patch \
            file://detect-atomics-during-configure.patch \
            file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
+           file://0001-Fix-build-with-musl.patch \
            "
 
-SRC_URI[md5sum] = "0e2d142a586e4ff79cf0324f4fdbf20c"
-SRC_URI[sha256sum] = "fc23650df953123c59b9c0edf3855e7bd55bd107820997fc72375811e1ea4b21"
+SRC_URI[md5sum] = "264a22d7467deae606e42b6eb5dd65af"
+SRC_URI[sha256sum] = "e15420e1616a6f70f321541d467af5ca285bff66b1e0fa68a01df3ccf1b18f9e"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
@@ -37,7 +35,7 @@ DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
 	   pango icu bison-native gawk intltool-native libwebp \
 	   atk udev harfbuzz jpeg libpng pulseaudio librsvg libtheora libvorbis libxcomposite libxtst \
 	   ruby-native libnotify gstreamer1.0-plugins-bad \
-	   gettext-native glib-2.0 glib-2.0-native \
+	   gettext-native glib-2.0 glib-2.0-native libtasn1 \
           "
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'wayland' ,d)} \
@@ -66,6 +64,9 @@ EXTRA_OECMAKE = " \
                 -DPYTHON_EXECUTABLE=`which python` \
 		"
 
+# GL/GLES header clash: both define the same thing, differently, on 32 bit x86
+EXTRA_OECMAKE_append_x86 = " -DUSE_GSTREAMER_GL=OFF "
+
 # Javascript JIT is not supported on powerpc
 EXTRA_OECMAKE_append_powerpc = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE_append_powerpc64 = " -DENABLE_JIT=OFF "
-- 
2.15.0


