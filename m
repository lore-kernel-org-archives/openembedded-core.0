Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A8B6C369DE
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 07:21:02 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.9645.1745479254817413293
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 00:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U39gIr9U;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2240b4de12bso9627835ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 00:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745479254; x=1746084054; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6JkIzb53IQiTtdyZnE4XlevQGmPuYsMWqv3SuzoN/wQ=;
        b=U39gIr9ULOJoEhc2aO7AS56Dbz60sv8VM9VYKr5KAo7YOfm0plyLg5moxuAdsMMBq0
         6lPAsIkwzvJaEk0Ha2wBkWKwi7q9HEcUnMR11hfTPLWqICVJeFDAK4mXkSG21tbJHgmn
         BL1oHgoZNTIQJzsYa9NFwGgXR6TuyMc3M7yahv/LcswsinJlYh2eLsutJClBvFuGdutk
         E0MgSEXnOX5O7fymF/1c8BM3OfDtgXiBMSXI1wYAN+vb7Csi2+txz84DJ73DM/uZ3q0O
         jfTOn7B+6a3s3eRDv7PEdYfFMJNlG836+jw6uy1leK0Pz+c+hT6vyNu5J1+cZtH3dQQ7
         FmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479254; x=1746084054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6JkIzb53IQiTtdyZnE4XlevQGmPuYsMWqv3SuzoN/wQ=;
        b=rz+qxYsXf0wKAU+9LEfdrPqGWLieWeOL99TDod4rBjSF97JvGTsPO375MAmH6pKHCT
         G6fuXOmfwodGGL6oNbKEPMLYGFExj3lK2P1xYdNlJH2lBFe9PAiW10oQAkEmqvwMO+Hz
         QjIMONfL7BwqeBnLjwF2u4VufWW/e+j2KHZPOM0LzpwyVcFbX9ofCwjkM2PflRQT40+a
         dBbTTsukeLC7LHgN6ALBQF7swHSnmoBYz7g0WjuTb+YbJY7eDwCdqZ5Ra5WLtS+Tneq4
         q/lnI1U9KNgudC7F8lxU5FqlUxGkmPVQpzJaMjASooFPDEoeI4X256q8JTqFLxREIynz
         IzfA==
X-Gm-Message-State: AOJu0YwLdHBgY6sJ8x5lsZuIse/XumkXIvyDF3DWZcUvIq4uqkLC7AgN
	IEQDvvJhsB42VEGi/R57fNkD56s61D9rPf2t70RfFCknyulFDbfQ817v5Drv
X-Gm-Gg: ASbGncvlKlGKy7N7xIOQ+8VO+tKmbG2BiA3z7LyX69UIwHnrdkeQrQDe9j3YhPVRaxr
	a2OsTNNayIIzs5x2k6nak7Lid4zz03CKK7zoeGjSqWpXdX905s9wtGEMxX4kLw1UVvVi9xoHJmL
	mG4eQoLzhLNpm3jSGNZGpjJd8x4uh2cAp8r7gC6V/l87zHD/t/f7TSMjk9jjljc/M/QW17zbbGI
	xXUTo9Xk2IQV5zSvtGrgyu/E11Jc0f9wFq2Y/uFUROKTXBj5UpN0Vt7hBYuBYQxg+WWPGcFnmUB
	ulOdoZPrcOibXzML6xU/CS2xLQ7r+oZK
X-Google-Smtp-Source: AGHT+IFB0eXzGJNNr2f2/41jNsdMPqDIv3f1tR1W4l9+J1NF2onV9Od99k65yNa4yIHzcMON7PmLMA==
X-Received: by 2002:a17:903:2f47:b0:229:1717:8812 with SMTP id d9443c01a7336-22db3a2ac14mr24508065ad.0.1745479253681;
        Thu, 24 Apr 2025 00:20:53 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5101636sm6234475ad.180.2025.04.24.00.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:20:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Apr 2025 00:20:36 -0700
Subject: [PATCH 02/11] llvm: Renamed to clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-clang-merge-v1-2-5a492a8461aa@gmail.com>
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
In-Reply-To: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 07:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215329

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...mitter-sort-ClassInfo-lists-by-name-as-we.patch |  31 ---
 ...g-remove-LLVM_LDFLAGS-from-ldflags-output.patch |  34 ---
 .../0007-llvm-allow-env-override-of-exe-path.patch |  36 ----
 ...configure-for-packages-using-find_package.patch | 117 -----------
 meta/recipes-devtools/llvm/llvm/llvm-config        |  54 -----
 .../llvm/llvm/spirv-internal-build.patch           |  30 ---
 .../llvm/llvm/spirv-shared-library.patch           |  25 ---
 meta/recipes-devtools/llvm/llvm_20.1.2.bb          | 233 ---------------------
 8 files changed, 560 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
deleted file mode 100644
index f71c5d4bd4748b286b4354fd5ca7c686512da8ac..0000000000000000000000000000000000000000
--- a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 001d56983078842c5aa2a1786b84dc429bd46abd Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 27 Nov 2020 10:11:08 +0000
-Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
-
-Otherwise, there are instances which are identical in
-every other field and therefore sort non-reproducibly
-(which breaks binary and source reproducibiliy).
-
-Upstream-Status: Submitted [https://reviews.llvm.org/D97477]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- llvm/utils/TableGen/AsmMatcherEmitter.cpp | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-index 7684387d8..d225a3b6d 100644
---- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-+++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-@@ -361,7 +361,10 @@ public:
-     // name of a class shouldn't be significant. However, some of the backends
-     // accidentally rely on this behaviour, so it will have to stay like this
-     // until they are fixed.
--    return ValueName < RHS.ValueName;
-+    if (ValueName != RHS.ValueName)
-+        return ValueName < RHS.ValueName;
-+    // All else being equal, we should sort by name, for source and binary reproducibility
-+    return Name < RHS.Name;
-   }
- };
- 
diff --git a/meta/recipes-devtools/llvm/llvm/0001-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch b/meta/recipes-devtools/llvm/llvm/0001-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
deleted file mode 100644
index 2320399d5f7de44cf9cc4269d180c097c1b4a616..0000000000000000000000000000000000000000
--- a/meta/recipes-devtools/llvm/llvm/0001-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From caff2482f786dd7fd5f1f46f2667f7ed847cb8f8 Mon Sep 17 00:00:00 2001
-From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Date: Wed, 2 Apr 2025 17:05:17 +0300
-Subject: [PATCH] llvm-config: remove LLVM_LDFLAGS from --ldflags output
-
-On native OE builds the LLVM_LDFLAGS gets a lot of extra flags which may
-depend on exact build dir and as such be inappropriate to binaries
-shared through sstate-cache. It is not possible to override this
-behaviour in llvm-config since crossscripts are not being used for
-native builds. As a OE-specific modification ignore LLVM_LDFLAGS for
-native builds.
-
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Upstream-Status: Inappropriate [OE-Specific]
----
- llvm/tools/llvm-config/llvm-config.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
-index d5b76b1bb6c1..29f7c2eaa419 100644
---- a/llvm/tools/llvm-config/llvm-config.cpp
-+++ b/llvm/tools/llvm-config/llvm-config.cpp
-@@ -529,7 +529,7 @@ int main(int argc, char **argv) {
-         OS << ActiveIncludeOption << ' ' << LLVM_CXXFLAGS << '\n';
-       } else if (Arg == "--ldflags") {
-         OS << ((HostTriple.isWindowsMSVCEnvironment()) ? "-LIBPATH:" : "-L")
--           << ActiveLibDir << ' ' << LLVM_LDFLAGS << '\n';
-+           << ActiveLibDir << '\n';
-       } else if (Arg == "--system-libs") {
-         PrintSystemLibs = true;
-       } else if (Arg == "--libs") {
--- 
-2.39.5
-
diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
deleted file mode 100644
index f1ab0054640c56f78b13ec2fdd1870fc207472be..0000000000000000000000000000000000000000
--- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 3eb1eefed6fc654d19ab97bbc748454c22a29009 Mon Sep 17 00:00:00 2001
-From: Martin Kelly <mkelly@xevo.com>
-Date: Fri, 19 May 2017 00:22:57 -0700
-Subject: [PATCH] llvm: allow env override of exe and libdir path
-
-When using a native llvm-config from inside a sysroot, we need llvm-config to
-return the libraries, include directories, etc. from inside the sysroot rather
-than from the native sysroot. Thus provide an env override for calling
-llvm-config from a target sysroot.
-
-Upstream-Status: Inappropriate [OE-specific]
-
-Signed-off-by: Martin Kelly <mkelly@xevo.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- llvm/tools/llvm-config/llvm-config.cpp | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
-index d5b76b1bb..6c28c34bc 100644
---- a/llvm/tools/llvm-config/llvm-config.cpp
-+++ b/llvm/tools/llvm-config/llvm-config.cpp
-@@ -246,6 +246,13 @@ Typical components:\n\
- 
- /// Compute the path to the main executable.
- std::string GetExecutablePath(const char *Argv0) {
-+  // Hack for Yocto: we need to override the root path when we are using
-+  // llvm-config from within a target sysroot.
-+  const char *Sysroot = std::getenv("YOCTO_ALTERNATE_EXE_PATH");
-+  if (Sysroot != nullptr) {
-+    return Sysroot;
-+  }
-+
-   // This just needs to be some symbol in the binary; C++ doesn't
-   // allow taking the address of ::main however.
-   void *P = (void *)(intptr_t)GetExecutablePath;
diff --git a/meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-configure-for-packages-using-find_package.patch b/meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-configure-for-packages-using-find_package.patch
deleted file mode 100644
index 94c056ab8e0abcdf4b96fc3c9bf22842018941e8..0000000000000000000000000000000000000000
--- a/meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-configure-for-packages-using-find_package.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From 93141cee493022d9f39dbd1f5f0bb0a1110ac829 Mon Sep 17 00:00:00 2001
-From: Ovidiu Panait <ovidiu.panait@windriver.com>
-Date: Fri, 31 Jan 2020 10:56:11 +0200
-Subject: [PATCH] cmake: Fix configure for packages using find_package()
-
-Currently, when a package (i.e. bcc [https://github.com/iovisor/bcc.git])
-that depends on LLVM/Clang tries to run cmake find_package() during
-do_configure, it will fail with a similar error:
-
-|   The imported target "llvm-tblgen" references the file
-|      ".../recipe-sysroot/usr/bin/llvm-tblgen"
-|
-|   but this file does not exist.  Possible reasons include:
-|   * The file was deleted, renamed, or moved to another location.
-|   * An install or uninstall procedure did not complete successfully.
-|   * The installation package was faulty and contained
-|      ".../recipe-sysroot/usr/lib/cmake/LLVMExports.cmake"
-|   but not all the files it references.
-
-This is due to the fact that currently the cmake scripts look for target
-binaries in sysroot. Work around this by not exporting the target binaries in
-Exports-* cmake files.
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- clang/cmake/modules/AddClang.cmake | 2 --
- llvm/cmake/modules/AddLLVM.cmake   | 9 ++-------
- llvm/cmake/modules/TableGen.cmake  | 6 ------
- 3 files changed, 2 insertions(+), 15 deletions(-)
-
-diff --git a/clang/cmake/modules/AddClang.cmake b/clang/cmake/modules/AddClang.cmake
-index cdc8bd5cd503..5faa9117a30f 100644
---- a/clang/cmake/modules/AddClang.cmake
-+++ b/clang/cmake/modules/AddClang.cmake
-@@ -182,7 +182,6 @@ macro(add_clang_tool name)
-     if (CLANG_BUILD_TOOLS)
-       get_target_export_arg(${name} Clang export_to_clangtargets)
-       install(TARGETS ${name}
--        ${export_to_clangtargets}
-         RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
-         COMPONENT ${name})
- 
-@@ -191,7 +190,6 @@ macro(add_clang_tool name)
-                                  DEPENDS ${name}
-                                  COMPONENT ${name})
-       endif()
--      set_property(GLOBAL APPEND PROPERTY CLANG_EXPORTS ${name})
-     endif()
-   endif()
-   set_target_properties(${name} PROPERTIES XCODE_GENERATE_SCHEME ON)
-diff --git a/llvm/cmake/modules/AddLLVM.cmake b/llvm/cmake/modules/AddLLVM.cmake
-index d3e9377c8d2f..fe22d6f2b35a 100644
---- a/llvm/cmake/modules/AddLLVM.cmake
-+++ b/llvm/cmake/modules/AddLLVM.cmake
-@@ -1492,7 +1492,6 @@ macro(llvm_add_tool project name)
-       if( LLVM_BUILD_TOOLS )
-         get_target_export_arg(${name} ${project} export_to_llvmexports)
-         install(TARGETS ${name}
--                ${export_to_llvmexports}
-                 RUNTIME DESTINATION ${${project}_TOOLS_INSTALL_DIR}
-                 COMPONENT ${name})
- 
-@@ -1503,10 +1502,8 @@ macro(llvm_add_tool project name)
-         endif()
-       endif()
-     endif()
--    if( LLVM_BUILD_TOOLS )
--      string(TOUPPER "${project}" project_upper)
--      set_property(GLOBAL APPEND PROPERTY ${project_upper}_EXPORTS ${name})
--    endif()
-+    string(TOUPPER "${project}" project_upper)
-+    set_target_properties(${name} PROPERTIES FOLDER "Tools")
-   endif()
-   get_subproject_title(subproject_title)
-   set_target_properties(${name} PROPERTIES FOLDER "${subproject_title}/Tools")
-@@ -1556,7 +1553,6 @@ macro(add_llvm_utility name)
-     if (LLVM_INSTALL_UTILS AND LLVM_BUILD_UTILS)
-       get_target_export_arg(${name} LLVM export_to_llvmexports)
-       install(TARGETS ${name}
--              ${export_to_llvmexports}
-               RUNTIME DESTINATION ${LLVM_UTILS_INSTALL_DIR}
-               COMPONENT ${name})
- 
-@@ -1565,7 +1561,6 @@ macro(add_llvm_utility name)
-                                  DEPENDS ${name}
-                                  COMPONENT ${name})
-       endif()
--      set_property(GLOBAL APPEND PROPERTY LLVM_EXPORTS ${name})
-     elseif(LLVM_BUILD_UTILS)
-       set_property(GLOBAL APPEND PROPERTY LLVM_EXPORTS_BUILDTREE_ONLY ${name})
-     endif()
-diff --git a/llvm/cmake/modules/TableGen.cmake b/llvm/cmake/modules/TableGen.cmake
-index ffcc718b4777..a76f28e74b86 100644
---- a/llvm/cmake/modules/TableGen.cmake
-+++ b/llvm/cmake/modules/TableGen.cmake
-@@ -232,12 +232,7 @@ macro(add_tablegen target project)
- 
-   if (ADD_TABLEGEN_DESTINATION AND NOT LLVM_INSTALL_TOOLCHAIN_ONLY AND
-       (LLVM_BUILD_UTILS OR ${target} IN_LIST LLVM_DISTRIBUTION_COMPONENTS))
--    set(export_arg)
--    if(ADD_TABLEGEN_EXPORT)
--      get_target_export_arg(${target} ${ADD_TABLEGEN_EXPORT} export_arg)
--    endif()
-     install(TARGETS ${target}
--            ${export_arg}
-             COMPONENT ${target}
-             RUNTIME DESTINATION "${ADD_TABLEGEN_DESTINATION}")
-     if(NOT LLVM_ENABLE_IDE)
-@@ -248,6 +243,5 @@ macro(add_tablegen target project)
-   endif()
-   if(ADD_TABLEGEN_EXPORT)
-     string(TOUPPER ${ADD_TABLEGEN_EXPORT} export_upper)
--    set_property(GLOBAL APPEND PROPERTY ${export_upper}_EXPORTS ${target})
-   endif()
- endmacro()
diff --git a/meta/recipes-devtools/llvm/llvm/llvm-config b/meta/recipes-devtools/llvm/llvm/llvm-config
deleted file mode 100644
index 6cf3e7578fa96f2893f73077bece4db45f29547c..0000000000000000000000000000000000000000
--- a/meta/recipes-devtools/llvm/llvm/llvm-config
+++ /dev/null
@@ -1,54 +0,0 @@
-#!/bin/bash
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: MIT
-#
-# Wrap llvm-config since the native llvm-config will remap some values correctly
-# if placed in the target sysroot but for flags, it would provide the native ones.
-# Provide ours from the environment instead.
-
-NEXT_LLVM_CONFIG="$(which -a llvm-config | sed -n 2p)"
-if [[ $# == 0 ]]; then
-  exec "$NEXT_LLVM_CONFIG"
-fi
-
-remain=""
-output=""
-for arg in "$@"; do
-  case "$arg" in
-    --cppflags)
-      output="${output} ${CPPFLAGS}"
-      ;;
-    --cflags)
-      output="${output} ${CFLAGS}"
-      ;;
-    --cxxflags)
-      output="${output} ${CXXFLAGS}"
-      ;;
-    --ldflags)
-      output="${output} ${LDFLAGS}"
-      ;;
-    --shared-mode)
-      output="${output} shared"
-      ;;
-    --libs)
-      output="${output} -lLLVM"
-      ;;
-    --libdir)
-      output="${output} ${libdir}"
-      ;;
-    --link-shared)
-      break
-      ;;
-    *)
-      remain="${remain} ${arg}"
-      ;;
-  esac
-done
-
-if [ "${remain}" != "" ]; then
-      output="${output} "$("$NEXT_LLVM_CONFIG" ${remain})
-fi
-
-echo "${output}"
diff --git a/meta/recipes-devtools/llvm/llvm/spirv-internal-build.patch b/meta/recipes-devtools/llvm/llvm/spirv-internal-build.patch
deleted file mode 100644
index 555d40f4fb07342cc204c7c578662688605b2cb1..0000000000000000000000000000000000000000
--- a/meta/recipes-devtools/llvm/llvm/spirv-internal-build.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From e94e529aefb28b65165e978daa2bfd89867ee8d0 Mon Sep 17 00:00:00 2001
-From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Date: Fri, 21 Mar 2025 17:17:52 +0200
-Subject: [PATCH] SPIRV-LLVM-Translator: fix handling of built-in SPIRV targer
-
-If the SPIRV-LLVM-Translator is being built together with the LLVM, set
-the defines declaring whether SPIRV target is also included into the
-LLVM library or not. Otherwise llvm-spirv execution fails because
-spirv-ext option is registered twice.
-
-Upstream-Status: Pending [will be submitted upstream after internal clearance]
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-
-Index: llvm-project-20.1.0.src/llvm/projects/SPIRV-LLVM-Translator/CMakeLists.txt
-===================================================================
---- llvm-project-20.1.0.src.orig/llvm/projects/SPIRV-LLVM-Translator/CMakeLists.txt
-+++ llvm-project-20.1.0.src/llvm/projects/SPIRV-LLVM-Translator/CMakeLists.txt
-@@ -116,6 +116,12 @@ if(LLVM_SPIRV_BUILD_EXTERNAL)
-     set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
-     set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
-   endif()
-+else()
-+  is_llvm_target_library("SPIRV" spirv_present_result INCLUDED_TARGETS)
-+  if(spirv_present_result)
-+    set(SPIRV_BACKEND_FOUND TRUE)
-+    add_compile_definitions(LLVM_SPIRV_BACKEND_TARGET_PRESENT)
-+  endif()
- endif()
- 
- set(LLVM_SPIRV_INCLUDE_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/include)
diff --git a/meta/recipes-devtools/llvm/llvm/spirv-shared-library.patch b/meta/recipes-devtools/llvm/llvm/spirv-shared-library.patch
deleted file mode 100644
index edc595d57699a682e62f3b3b1cf999e409060226..0000000000000000000000000000000000000000
--- a/meta/recipes-devtools/llvm/llvm/spirv-shared-library.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From e94e529aefb28b65165e978daa2bfd89867ee8d0 Mon Sep 17 00:00:00 2001
-From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Date: Thu, 9 Apr 2025 15:20:32 +0200
-Subject: [PATCH] SPIRV-LLVM-Translator: build shared library
-
-By default SPIRV-LLVM-Translator builds only a static version of the library.
-Unfortunately this might result in linking erros when uninative is in play, if
-libLLVMSPIRV uses symbols which are provided only by the uninative libc and are
-not provided by the host libc.
-
-Upstream-Status: Inappropriate [OE-Specific]
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-
-Index: llvm-project-20.1.1.src/llvm/projects/SPIRV-LLVM-Translator/lib/SPIRV/CMakeLists.txt
-===================================================================
---- llvm-project-20.1.1.src.orig/llvm/projects/SPIRV-LLVM-Translator/lib/SPIRV/CMakeLists.txt
-+++ llvm-project-20.1.1.src/llvm/projects/SPIRV-LLVM-Translator/lib/SPIRV/CMakeLists.txt
-@@ -42,6 +42,7 @@ set(SRC_LIST
- )
- add_llvm_library(LLVMSPIRVLib
-   ${SRC_LIST}
-+  SHARED
-   LINK_COMPONENTS
-     Analysis
-     BitWriter
diff --git a/meta/recipes-devtools/llvm/llvm_20.1.2.bb b/meta/recipes-devtools/llvm/llvm_20.1.2.bb
deleted file mode 100644
index 98855fa4c14d1f5eef6dd946a64927d778b99e3d..0000000000000000000000000000000000000000
--- a/meta/recipes-devtools/llvm/llvm_20.1.2.bb
+++ /dev/null
@@ -1,233 +0,0 @@
-# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-SUMMARY = "The LLVM Compiler Infrastructure"
-HOMEPAGE = "http://llvm.org"
-LICENSE = "Apache-2.0-with-LLVM-exception"
-SECTION = "devel"
-
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=8a15a0759ef07f2682d2ba4b893c9afe"
-
-DEPENDS = "libffi libxml2 zlib zstd libedit ninja-native llvm-native"
-
-RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
-
-inherit cmake pkgconfig
-# could be 'rcX' or 'git' or empty ( for release )
-VER_SUFFIX = ""
-
-PV .= "${VER_SUFFIX}"
-
-MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
-MAJ_MIN_VERSION = "${@oe.utils.trim_version("${PV}", 2)}"
-
-LLVM_RELEASE = "${PV}"
-
-SRCREV_spirv = "68edc9d3d10ff6ec6353803a1bc60a5c25e7b715"
-# pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
-SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
-
-SRC_URI_SPIRV = " \
-    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;name=spirv;branch=${SPIRV_BRANCH};destsuffix=llvm-project-${PV}.src/llvm/projects/SPIRV-LLVM-Translator \
-    file://spirv-internal-build.patch \
-"
-
-SRC_URI_SPIRV:append:class-native = " \
-    file://spirv-shared-library.patch \
-"
-
-SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz \
-           file://0007-llvm-allow-env-override-of-exe-path.patch \
-           file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
-           file://0014-cmake-Fix-configure-for-packages-using-find_package.patch \
-           ${@bb.utils.contains('PACKAGECONFIG', 'spirv-llvm-translator', '${SRC_URI_SPIRV}', '', d)} \
-           file://llvm-config \
-           "
-SRC_URI[sha256sum] = "f0a4a240aabc9b056142d14d5478bb6d962aeac549cbd75b809f5499240a8b38"
-UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
-UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
-
-SRC_URI:append:class-native = " file://0001-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch"
-
-S = "${WORKDIR}/llvm-project-${PV}.src"
-
-OECMAKE_SOURCEPATH = "${S}/llvm"
-
-LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
-
-PACKAGECONFIG ??= "libllvm libclc spirv-llvm-translator"
-# if optviewer OFF, force the modules to be not found or the ones on the host would be found
-PACKAGECONFIG[optviewer] = ",-DPY_PYGMENTS_FOUND=OFF -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=OFF -DPY_YAML_FOUND=OFF,python3-pygments python3-pyyaml,python3-pygments python3-pyyaml"
-PACKAGECONFIG[libllvm] = ""
-PACKAGECONFIG[libclc] = ""
-PACKAGECONFIG[spirv-llvm-translator] = "-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${STAGING_INCDIR}/.. ,,spirv-tools-native spirv-headers"
-
-#
-# Default to build all OE-Core supported target arches (user overridable).
-#
-LLVM_TARGETS ?= "AMDGPU;AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;NVPTX;SPIRV"
-
-ARM_INSTRUCTION_SET:armv5 = "arm"
-ARM_INSTRUCTION_SET:armv4t = "arm"
-
-LLVM_PROJECTS_CLANG = "${@bb.utils.contains_any('PACKAGECONFIG', 'libclc spirv-llvm-translator', 'clang', '', d)}"
-LLVM_PROJECTS_CLC = "${@bb.utils.contains('PACKAGECONFIG', 'libclc', ';libclc', '', d)}"
-LLVM_PROJECTS = "${LLVM_PROJECTS_CLANG}${LLVM_PROJECTS_CLC}"
-
-EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
-                  -DLLVM_ENABLE_EXPENSIVE_CHECKS=OFF \
-                  -DLLVM_ENABLE_PIC=ON \
-                  -DLLVM_BINDINGS_LIST='' \
-                  -DLLVM_LINK_LLVM_DYLIB=ON \
-                  -DLLVM_ENABLE_FFI=ON \
-                  -DLLVM_ENABLE_RTTI=ON \
-                  -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
-                  -DLLVM_OPTIMIZED_TABLEGEN=ON \
-                  -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS}' \
-                  -DLLVM_VERSION_SUFFIX='${VER_SUFFIX}' \
-                  -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
-                  -DCMAKE_BUILD_TYPE=Release \
-                  -DLLVM_ENABLE_PROJECTS='${LLVM_PROJECTS}' \
-                 "
-
-EXTRA_OECMAKE:append:class-target = "\
-                  -DCMAKE_CROSSCOMPILING:BOOL=ON \
-                  -DLLVM_HOST_TRIPLE=${TARGET_SYS} \
-                  -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
-                  -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
-                  -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
-                 "
-
-EXTRA_OECMAKE:append:class-nativesdk = "\
-                  -DCMAKE_CROSSCOMPILING:BOOL=ON \
-                  -DLLVM_HOST_TRIPLE=${SDK_SYS} \
-                  -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
-                  -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
-                  -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
-                 "
-
-# patch out build host paths for reproducibility
-do_compile:prepend:class-target() {
-        sed -i -e "s,${WORKDIR},,g" ${B}/tools/llvm-config/BuildVariables.inc
-}
-
-do_compile:prepend:class-nativesdk() {
-        sed -i -e "s,${WORKDIR},,g" ${B}/tools/llvm-config/BuildVariables.inc
-}
-
-do_compile() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'libllvm', 'true', 'false', d)}; then
-	ninja -v ${PARALLEL_MAKE}
-    else
-	ninja -v ${PARALLEL_MAKE} llvm-config llvm-tblgen
-    fi
-}
-
-do_install() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'libllvm', 'true', 'false', d)}; then
-	DESTDIR=${D} ninja -v install
-
-        # llvm harcodes usr/lib as install path, so this corrects it to actual libdir
-        mv -T -n ${D}/${prefix}/lib ${D}/${libdir} || true
-
-        # Remove opt-viewer: https://llvm.org/docs/Remarks.html
-        rm -rf ${D}${datadir}/opt-viewer
-
-        # reproducibility
-        sed -i -e 's,${WORKDIR},,g' ${D}/${libdir}/cmake/llvm/LLVMConfig.cmake
-    fi
-
-    # Remove clang bits from target packages, we are not providing it for the system
-    if ${@bb.utils.contains_any('PACKAGECONFIG', 'libclc spirv-llvm-translator', 'true', 'false', d)} &&
-       [ "${CLASSOVERRIDE}" != "class-native" ] ; then
-        rm -f  ${D}${bindir}/clang*
-        rm -fr ${D}${libdir}/clang
-        rm -fr ${D}${datadir}/clang
-
-        rm -f  ${D}${bindir}/scan*
-        rm -fr ${D}${libdir}/libscanbuild
-        rm -fr ${D}${datadir}/scan-build
-        rm -fr ${D}${datadir}/scan-view
-
-        rm -fr ${D}${libdir}/libear
-    fi
-
-    # Try to clean up datadir if it is empty, but don't fail if there are
-    # libclc files there
-    rmdir ${D}${datadir} || true
-}
-
-do_install:append:class-native() {
-	install -D -m 0755 ${B}/bin/llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
-	install -D -m 0755 ${B}/bin/llvm-min-tblgen ${D}${bindir}/llvm-min-tblgen
-	install -D -m 0755 ${B}/bin/llvm-config ${D}${bindir}/llvm-config${PV}
-	ln -sf llvm-config${PV} ${D}${bindir}/llvm-config
-
-        if ${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'true', 'false', d)} ; then
-            install -D -m 0755 ${B}/bin/prepare_builtins ${D}${bindir}/prepare_builtins
-        fi
-}
-
-SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess"
-SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " llvm_sysroot_preprocess"
-
-llvm_sysroot_preprocess() {
-	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-	install -m 0755 ${UNPACKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-	ln -sf llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
-}
-
-PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto ${PN}-clc ${PN}-spirv"
-PROVIDES = "${@bb.utils.filter('PACKAGECONFIG', 'libclc spirv-llvm-translator', d)}"
-
-RRECOMMENDS:${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liboptremarks"
-RPROVIDES:${PN}-clc = "${@bb.utils.filter('PACKAGECONFIG', 'libclc', d)}"
-RPROVIDES:${PN}-spirv = "${@bb.utils.filter('PACKAGECONFIG', 'spirv-llvm-translator', d)}"
-
-FILES:${PN}-bugpointpasses = "\
-    ${libdir}/BugpointPasses.so \
-"
-
-FILES:${PN}-libllvm = "\
-    ${libdir}/libLLVM-${MAJOR_VERSION}.so \
-    ${libdir}/libLLVM.so.${MAJ_MIN_VERSION} \
-"
-
-FILES:${PN}-liblto += "\
-    ${libdir}/libLTO.so.* \
-"
-
-FILES:${PN}-liboptremarks += "\
-    ${libdir}/libRemarks.so.* \
-"
-
-FILES:${PN}-llvmhello = "\
-    ${libdir}/LLVMHello.so \
-"
-
-FILES:${PN}-dev += " \
-    ${libdir}/llvm-config \
-    ${libdir}/libRemarks.so \
-    ${libdir}/libLLVM-${PV}.so \
-"
-
-FILES:${PN}-staticdev += "\
-    ${libdir}/*.a \
-"
-
-FILES:${PN}-clc += "${datadir}/clc"
-
-FILES:${PN}-spirv = " \
-    ${bindir}/llvm-spirv \
-    ${includedir}/LLVMSPIRVLib \
-    ${libdir}/pkgconfig/LLVMSPIRVLib.pc \
-    ${libdir}/libLLVMSPIRV* \
-"
-
-INSANE_SKIP:${PN}-libllvm += "dev-so"
-
-# SPIRV-LLVM-Translator provides only static libraries, they are included into
-# the llvm-spirv package.
-INSANE_SKIP:${PN}-spirv += "staticdev"
-
-BBCLASSEXTEND = "native nativesdk"

-- 
2.49.0


