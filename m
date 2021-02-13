Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.995.1613177969010845343
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Feb 2021 16:59:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GKrtxI7r;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id n6so1430682wrv.8
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Feb 2021 16:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZYHvd/q6QUduqdIw5yrV1t4el2CvdZmc2Pv7IN4P22g=;
        b=GKrtxI7rXeuJNKdkYMf8ErrRuEOpH9FHWQswUsWxKRLs8cZVfWxncgb2thi5ttCcIH
         l8EtJV/pqxAoD4XUViItqa8CWNVPYWVmLvDXz4D3jNNzvpuDZoyyZUvtGsQs8F/5r3dQ
         tNZZf3iyPupGW9SDhg8xqz0LSr2BGE+ibv3sTaB/lTVSrgWBjkzjfywrmOt+v7JFq9kw
         ALKAdnsA2AfjZ74Uk4aVwlyOScVTP5KWIuCE54WZiUQfAiyYPUHG46/TVe89Oy39qCeV
         PsVvjBgw84YGDEGLMfILGp1nSty+LhvoS0YAsLImzHWTqilkAr0R1D66q38pd6ul6929
         Qk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZYHvd/q6QUduqdIw5yrV1t4el2CvdZmc2Pv7IN4P22g=;
        b=BFQYZUqNu2FN67eXol2KQImCWeBtAckYsNgCwjUt3ywIqVqJAYC72XBmnLufuYETJq
         0TSOwUMWLrprIBCpKgkZhMgdJmb2OFFq6ZjOWtM7dp6Kr177gX5/NWNYq4hqK/4ZBOaI
         xWhFn6ZcdH8kwWdFt65QjlvJRpi332oAWYdFG80IaIxbmz6HbhtV4F7Ghoz2HgxgAyoD
         SY6LzS+gDC6ZdZsbWv88Mk24CDef1whQ2hASemknAsafMrWrMz5AF1ZroFIqEPT3LyAQ
         VxcKLTeRMZ+ZO4p4xjsbfp9C8XRNNUGc+V3K34E+LZDaZWNd1co0zsGyV0hBZXcd2ZM6
         voYg==
X-Gm-Message-State: AOAM531yW82ojwQUwZzcFWCM2nUO6Fy9GkZjqWLDEpckY/1Y1aUwqata
	cpCYSExlAAFooRzfQ0NkKfJAG/FIsrMRzw==
X-Google-Smtp-Source: ABdhPJw8WQO0oTcMSsA+2SJbXtBWZk5F2jfoGIlQdJJkm8W/HmUsQ+u2O39d8xOaI4kBWjJ2+rvmEw==
X-Received: by 2002:adf:dc8d:: with SMTP id r13mr6327237wrj.209.1613177967649;
        Fri, 12 Feb 2021 16:59:27 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b15sm12259195wrr.47.2021.02.12.16.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 16:59:27 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 5/5] shaderc: remove the receipe configure hack and use a patch for that
Date: Sat, 13 Feb 2021 00:59:22 +0000
Message-Id: <20210213005922.180552-5-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210213005922.180552-1-quaresma.jose@gmail.com>
References: <20210213005922.180552-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[Yocto #14226]

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ndor-libs-and-disable-git-versioning.patch |  48 --------
 ...sable-building-external-dependencies.patch | 109 ++++++++++++++++++
 ...til-fix-glslang-header-file-location.patch |  28 +++++
 ...dd-option-to-skip-build-the-examples.patch |  47 ++++++++
 .../shaderc/shaderc_2020.4.bb                 |  20 +---
 5 files changed, 189 insertions(+), 63 deletions(-)
 delete mode 100644 meta/recipes-graphics/shaderc/files/0001-cmake-de-vendor-libs-and-disable-git-versioning.patch
 create mode 100644 meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
 create mode 100644 meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
 create mode 100644 meta/recipes-graphics/shaderc/files/0003-cmake-add-option-to-skip-build-the-examples.patch

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-de-vendor-libs-and-disable-git-versioning.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-de-vendor-libs-and-disable-git-versioning.patch
deleted file mode 100644
index 40cc84df26..0000000000
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-de-vendor-libs-and-disable-git-versioning.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From a07ac322a5a5fd4f0339913eb4456321ad1a69fd Mon Sep 17 00:00:00 2001
-From: Jose Quaresma <quaresma.jose@gmail.com>
-Date: Sat, 17 Oct 2020 12:51:50 +0100
-Subject: [PATCH] cmake: de-vendor libs and disable git versioning
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
-
----
- CMakeLists.txt              | 2 --
- glslc/CMakeLists.txt        | 1 -
- glslc/src/build-version.inc | 0
- 3 files changed, 3 deletions(-)
- create mode 100644 glslc/src/build-version.inc
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 5c74cd8..9451fbc 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -102,12 +102,10 @@ endif(MSVC)
- 
- # Configure subdirectories.
- # We depend on these for later projects, so they should come first.
--add_subdirectory(third_party)
- 
- add_subdirectory(libshaderc_util)
- add_subdirectory(libshaderc)
- add_subdirectory(glslc)
--add_subdirectory(examples)
- 
- add_custom_target(build-version
-   ${PYTHON_EXECUTABLE}
-diff --git a/glslc/CMakeLists.txt b/glslc/CMakeLists.txt
-index 31664d1..358d91b 100644
---- a/glslc/CMakeLists.txt
-+++ b/glslc/CMakeLists.txt
-@@ -53,7 +53,6 @@ shaderc_default_compile_options(glslc_exe)
- target_include_directories(glslc_exe PRIVATE ${CMAKE_CURRENT_BINARY_DIR}/.. ${spirv-tools_SOURCE_DIR}/include)
- set_target_properties(glslc_exe PROPERTIES OUTPUT_NAME glslc)
- target_link_libraries(glslc_exe PRIVATE glslc shaderc_util shaderc)
--add_dependencies(glslc_exe build-version)
- 
- shaderc_add_tests(
-   TEST_PREFIX glslc
-diff --git a/glslc/src/build-version.inc b/glslc/src/build-version.inc
-new file mode 100644
-index 0000000..e69de29
diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
new file mode 100644
index 0000000000..cc9a400028
--- /dev/null
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -0,0 +1,109 @@
+From 071a9d71bea91bbefcf15e061fc87e53568f3188 Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <quaresma.jose@gmail.com>
+Date: Sat, 13 Feb 2021 00:45:56 +0000
+Subject: [PATCH 1/3] cmake: disable building external dependencies
+
+- add cmake option to disable the build of the third_party dependencies
+- change the update_build_version.py to use pkg-config when third_party dependencies not found
+
+Upstream-Status: Inappropriate [OE-core specific]
+
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+---
+ CMakeLists.txt                | 13 ++++++++++---
+ utils/update_build_version.py | 22 +++++++++++++++-------
+ 2 files changed, 25 insertions(+), 10 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5c74cd8..b358f6b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -41,6 +41,7 @@ else()
+ endif()
+ 
+ option(SHADERC_ENABLE_WERROR_COMPILE "Enable passing -Werror to compiler, if available" ON)
++option(BUILD_EXTERNAL "Build external dependencies in /third_party" ON)
+ 
+ set (CMAKE_CXX_STANDARD 11)
+ 
+@@ -101,8 +102,14 @@ endif(MSVC)
+ 
+ 
+ # Configure subdirectories.
+-# We depend on these for later projects, so they should come first.
+-add_subdirectory(third_party)
++if(BUILD_EXTERNAL)
++    # We depend on these for later projects, so they should come first.
++    add_subdirectory(third_party)
++else()
++    find_package(PkgConfig REQUIRED)
++    pkg_check_modules (PKG_CHECK REQUIRED SPIRV-Tools)
++    pkg_check_modules (PKG_CHECK REQUIRED glslang)
++endif()
+ 
+ add_subdirectory(libshaderc_util)
+ add_subdirectory(libshaderc)
+@@ -112,7 +119,7 @@ add_subdirectory(examples)
+ add_custom_target(build-version
+   ${PYTHON_EXECUTABLE}
+   ${CMAKE_CURRENT_SOURCE_DIR}/utils/update_build_version.py
+-  ${shaderc_SOURCE_DIR} ${spirv-tools_SOURCE_DIR} ${glslang_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR}/build-version.inc
++  ${CMAKE_CURRENT_BINARY_DIR}/build-version.inc ${shaderc_SOURCE_DIR} ${spirv-tools_SOURCE_DIR} ${glslang_SOURCE_DIR}
+   COMMENT "Update build-version.inc in the Shaderc build directory (if necessary).")
+ 
+ function(define_pkg_config_file NAME LIBS)
+diff --git a/utils/update_build_version.py b/utils/update_build_version.py
+index 5785390..f72b762 100755
+--- a/utils/update_build_version.py
++++ b/utils/update_build_version.py
+@@ -30,6 +30,7 @@ import re
+ import subprocess
+ import sys
+ import time
++import itertools
+ 
+ def mkdir_p(directory):
+     """Make the directory, and all its ancestors as required.  Any of the
+@@ -121,25 +122,32 @@ def get_version_string(project, directory):
+     directory, which consists of software version string and git description
+     string."""
+     detailed_version_string_lst = [project]
+-    if project != 'glslang':
+-        detailed_version_string_lst.append(deduce_software_version(directory))
+-    detailed_version_string_lst.append(describe(directory).replace('"', '\\"'))
++    if isinstance(directory, str) and os.path.isdir(directory):
++        if project != 'glslang':
++            detailed_version_string_lst.append(deduce_software_version(directory))
++        detailed_version_string_lst.append(describe(directory).replace('"', '\\"'))
++    else:
++        if project == 'spirv-tools':
++            project = 'SPIRV-Tools'
++        pkgconfig = ['pkg-config', '--modversion', project]
++        version = subprocess.run(pkgconfig, capture_output=True, text=True).stdout.rstrip()
++        detailed_version_string_lst.append(version)
+     return ' '.join(detailed_version_string_lst)
+ 
+ 
+ def main():
+-    if len(sys.argv) != 5:
+-        print(('usage: {} <shaderc-dir> <spirv-tools-dir> <glslang-dir> <output-file>'.format(
++    if len(sys.argv) < 3:
++        print(('usage: {} <output-file> <shaderc-dir> [spirv-tools-dir] [glslang-dir]'.format(
+             sys.argv[0])))
+         sys.exit(1)
+ 
+     projects = ['shaderc', 'spirv-tools', 'glslang']
+     new_content = ''.join([
+         '"{}\\n"\n'.format(get_version_string(p, d))
+-        for (p, d) in zip(projects, sys.argv[1:])
++        for (p, d) in itertools.zip_longest(projects, sys.argv[2:])
+     ])
+ 
+-    output_file = sys.argv[4]
++    output_file = sys.argv[1]
+     mkdir_p(os.path.dirname(output_file))
+ 
+     if os.path.isfile(output_file):
+-- 
+2.30.1
+
diff --git a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
new file mode 100644
index 0000000000..df670cdded
--- /dev/null
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -0,0 +1,28 @@
+From 046c3c2da9c4ff66f14db5bd68e9557504a49241 Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <quaresma.jose@gmail.com>
+Date: Sat, 13 Feb 2021 00:45:56 +0000
+Subject: [PATCH 2/3] libshaderc_util: fix glslang header file location
+
+Upstream-Status: Pending
+
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+---
+ libshaderc_util/src/compiler.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libshaderc_util/src/compiler.cc b/libshaderc_util/src/compiler.cc
+index c5ce37e..4703634 100644
+--- a/libshaderc_util/src/compiler.cc
++++ b/libshaderc_util/src/compiler.cc
+@@ -20,7 +20,7 @@
+ #include <thread>
+ #include <tuple>
+ 
+-#include "SPIRV/GlslangToSpv.h"
++#include "glslang/SPIRV/GlslangToSpv.h"
+ #include "libshaderc_util/format.h"
+ #include "libshaderc_util/io.h"
+ #include "libshaderc_util/message.h"
+-- 
+2.30.1
+
diff --git a/meta/recipes-graphics/shaderc/files/0003-cmake-add-option-to-skip-build-the-examples.patch b/meta/recipes-graphics/shaderc/files/0003-cmake-add-option-to-skip-build-the-examples.patch
new file mode 100644
index 0000000000..43f9edc031
--- /dev/null
+++ b/meta/recipes-graphics/shaderc/files/0003-cmake-add-option-to-skip-build-the-examples.patch
@@ -0,0 +1,47 @@
+From f1064e4b6cfc5955bc7e2b036f2d05540da9f09b Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <quaresma.jose@gmail.com>
+Date: Sat, 13 Feb 2021 00:45:56 +0000
+Subject: [PATCH 3/3] cmake: add option to skip build the examples
+
+Upstream-Status: Backport [https://github.com/google/shaderc/commit/8d081127ee28ff5df8123c994c00bc66a57e9e9c]
+
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+---
+ CMakeLists.txt | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b358f6b..d8a5405 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -40,6 +40,16 @@ else()
+   message(STATUS "Configuring Shaderc to avoid building tests.")
+ endif()
+ 
++option(SHADERC_SKIP_EXAMPLES "Skip building examples" ${SHADERC_SKIP_EXAMPLES})
++if(NOT ${SHADERC_SKIP_EXAMPLES})
++  set(SHADERC_ENABLE_EXAMPLES ON)
++endif()
++if(${SHADERC_ENABLE_EXAMPLES})
++  message(STATUS "Configuring Shaderc to build examples.")
++else()
++  message(STATUS "Configuring Shaderc to avoid building examples.")
++endif()
++
+ option(SHADERC_ENABLE_WERROR_COMPILE "Enable passing -Werror to compiler, if available" ON)
+ option(BUILD_EXTERNAL "Build external dependencies in /third_party" ON)
+ 
+@@ -114,7 +124,9 @@ endif()
+ add_subdirectory(libshaderc_util)
+ add_subdirectory(libshaderc)
+ add_subdirectory(glslc)
+-add_subdirectory(examples)
++if(${SHADERC_ENABLE_EXAMPLES})
++    add_subdirectory(examples)
++endif()
+ 
+ add_custom_target(build-version
+   ${PYTHON_EXECUTABLE}
+-- 
+2.30.1
+
diff --git a/meta/recipes-graphics/shaderc/shaderc_2020.4.bb b/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
index e966ed3d77..3b82b150b6 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 SRCREV = "0dbd899941a43ffd55df527d65128b3b66e75c9c"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
-           file://0001-cmake-de-vendor-libs-and-disable-git-versioning.patch \
+           file://0001-cmake-disable-building-external-dependencies-in-thir.patch \
+           file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
+           file://0003-cmake-add-option-to-skip-build-the-examples.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
@@ -19,21 +21,9 @@ DEPENDS = "spirv-headers spirv-tools glslang"
 
 EXTRA_OECMAKE = " \
     -DCMAKE_BUILD_TYPE=Release \
+    -DBUILD_EXTERNAL=OFF \
     -DSHADERC_SKIP_TESTS=ON \
-    -Dglslang_SOURCE_DIR=${STAGING_INCDIR}/glslang \
+    -DSHADERC_SKIP_EXAMPLES=ON \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-
-# TODO: probably there is better solution for this.
-# I don't know any method for get the version of a receipe in DEPENDS,
-# so do this ugly hack
-inherit pkgconfig
-DEPENDS += "glslang-native"
-do_configure_prepend() {
-    cat <<- EOF > ${S}/glslc/src/build-version.inc
-"${PV}\\n"
-"$(pkg-config --modversion SPIRV-Tools)\\n"
-"$(glslangValidator --version | head -1 | cut -d' ' -f3)\\n"
-EOF
-}
-- 
2.30.1

