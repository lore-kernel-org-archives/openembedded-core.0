Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117C0CAC587
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 13:33:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9676.1757856783283261338
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 06:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 591F71655
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 06:32:54 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 403193F63F
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 06:33:02 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/6] clang: improve opt-viewer PACKAGECONFIG
Date: Sun, 14 Sep 2025 14:32:53 +0100
Message-ID: <20250914133258.2625735-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 13:33:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223351

Instead of patching the python module detection, we can use the hidden
option LLVM_TOOL_OPT_VIEWER_BUILD.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-users-to-set-LLVM_HAVE_OPT_VIEWER_M.patch | 70 -------------------
 meta/recipes-devtools/clang/clang_git.bb      |  2 +-
 meta/recipes-devtools/clang/common.inc        |  1 -
 3 files changed, 1 insertion(+), 72 deletions(-)
 delete mode 100644 meta/recipes-devtools/clang/clang/0041-opt-viewer-All=
ow-users-to-set-LLVM_HAVE_OPT_VIEWER_M.patch

diff --git a/meta/recipes-devtools/clang/clang/0041-opt-viewer-Allow-user=
s-to-set-LLVM_HAVE_OPT_VIEWER_M.patch b/meta/recipes-devtools/clang/clang=
/0041-opt-viewer-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_M.patch
deleted file mode 100644
index 4dc01f6e640..00000000000
--- a/meta/recipes-devtools/clang/clang/0041-opt-viewer-Allow-users-to-se=
t-LLVM_HAVE_OPT_VIEWER_M.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 93a51605fccf0f99868f8bae212a08823d01b03a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 2 Aug 2025 17:58:20 -0700
-Subject: [PATCH] [opt-viewer] Allow users to set LLVM_HAVE_OPT_VIEWER_MO=
DULES
- manually from the CMake
-
-Check right before setting LLVM_HAVE_OPT_VIEWER_MODULES
-so that if the user specifies the variable on the commandline
-it takes precedence. If not, fall back to the old logic
-
-Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/15=
1845]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- llvm/CMakeLists.txt                     |  2 ++
- llvm/cmake/config-ix.cmake              | 13 ++++++++++---
- llvm/include/llvm/Config/config.h.cmake |  3 +++
- 3 files changed, 15 insertions(+), 3 deletions(-)
-
-diff --git a/llvm/CMakeLists.txt b/llvm/CMakeLists.txt
-index cb945b578e46..e4ed9eca6014 100644
---- a/llvm/CMakeLists.txt
-+++ b/llvm/CMakeLists.txt
-@@ -7,6 +7,8 @@ set(LLVM_COMMON_CMAKE_UTILS ${CMAKE_CURRENT_SOURCE_DIR}/=
../cmake)
- include(${LLVM_COMMON_CMAKE_UTILS}/Modules/CMakePolicy.cmake
-   NO_POLICY_SCOPE)
-=20
-+option(LLVM_HAVE_OPT_VIEWER_MODULES "Enable opt-viewer modules support"=
 ON)
-+
- # Builds with custom install names and installation rpath setups may no=
t work
- # in the build tree. Allow these cases to use CMake's default build tre=
e
- # behavior by setting `LLVM_NO_INSTALL_NAME_DIR_FOR_BUILD_TREE` to do t=
his.
-diff --git a/llvm/cmake/config-ix.cmake b/llvm/cmake/config-ix.cmake
-index a8e4e5a63244..17af3dc1e93f 100644
---- a/llvm/cmake/config-ix.cmake
-+++ b/llvm/cmake/config-ix.cmake
-@@ -805,10 +805,17 @@ foreach(module ${PYTHON_MODULES})
-   find_python_module(${module})
- endforeach()
-=20
--if(PY_PYGMENTS_FOUND AND PY_PYGMENTS_LEXERS_C_CPP_FOUND AND PY_YAML_FOU=
ND)
--  set (LLVM_HAVE_OPT_VIEWER_MODULES 1)
-+if(NOT DEFINED LLVM_HAVE_OPT_VIEWER_MODULES)
-+  if(PY_PYGMENTS_FOUND AND PY_PYGMENTS_LEXERS_C_CPP_FOUND AND PY_YAML_F=
OUND)
-+    set (LLVM_HAVE_OPT_VIEWER_MODULES 1)
-+  else()
-+    set (LLVM_HAVE_OPT_VIEWER_MODULES 0)
-+  endif()
-+elseif(LLVM_HAVE_OPT_VIEWER_MODULES)
-+  # Use the user-provided value
-+  set(LLVM_HAVE_OPT_VIEWER_MODULES 1)
- else()
--  set (LLVM_HAVE_OPT_VIEWER_MODULES 0)
-+  set(LLVM_HAVE_OPT_VIEWER_MODULES 0)
- endif()
-=20
- function(llvm_get_host_prefixes_and_suffixes)
-diff --git a/llvm/include/llvm/Config/config.h.cmake b/llvm/include/llvm=
/Config/config.h.cmake
-index ce83de8e4cba..02cf6d2ec363 100644
---- a/llvm/include/llvm/Config/config.h.cmake
-+++ b/llvm/include/llvm/Config/config.h.cmake
-@@ -287,6 +287,9 @@
- /* Define to a function implementing strdup */
- #cmakedefine strdup ${strdup}
-=20
-+/* Define indicating opt-viewer modules */
-+#cmakedefine LLVM_HAVE_OPT_VIEWER_MODULES
-+
- /* Whether GlobalISel rule coverage is being collected */
- #cmakedefine01 LLVM_GISEL_COV_ENABLED
-=20
diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index 0009a95628d..f53ecbfe398 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -59,7 +59,7 @@ PACKAGECONFIG[libedit] =3D "-DLLVM_ENABLE_LIBEDIT=3DON,=
-DLLVM_ENABLE_LIBEDIT=3DOFF,lib
 PACKAGECONFIG[libomp] =3D "-DCLANG_DEFAULT_OPENMP_RUNTIME=3Dlibomp,,"
 PACKAGECONFIG[lld] =3D "-DCLANG_DEFAULT_LINKER=3Dlld,,,"
 PACKAGECONFIG[lto] =3D "-DLLVM_ENABLE_LTO=3DFull -DLLVM_BINUTILS_INCDIR=3D=
${STAGING_INCDIR},,binutils,"
-PACKAGECONFIG[opt-viewer] =3D "-DLLVM_HAVE_OPT_VIEWER_MODULES=3DON,-DLLV=
M_HAVE_OPT_VIEWER_MODULES=3DOFF, \
+PACKAGECONFIG[opt-viewer] =3D "-DLLVM_TOOL_OPT_VIEWER_BUILD=3DON,-DLLVM_=
TOOL_OPT_VIEWER_BUILD=3DOFF, \
                              python3-pyyaml-native python3-pygments-nati=
ve python3-pyyaml python3-pygments, \
                              python3-pyyaml python3-pygments,"
 PACKAGECONFIG[pfm] =3D "-DLLVM_ENABLE_LIBPFM=3DON,-DLLVM_ENABLE_LIBPFM=3D=
OFF,libpfm,"
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtoo=
ls/clang/common.inc
index 889847c3e11..ac86284fb20 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -61,7 +61,6 @@ SRC_URI =3D "\
     file://0038-Revert-libc-Remap-headers-in-the-debug-info-when-bui.pat=
ch \
     file://0039-Prevent-revisiting-block-when-searching-for-noreturn.pat=
ch \
     file://0040-Only-build-c-index-test-when-clang-tests-are-include.pat=
ch \
-    file://0041-opt-viewer-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_M.pat=
ch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??=3D ""
--=20
2.43.0


