Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EA6CC6B3A
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 14:23:40 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41436.1792074217933938641
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 07:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=mPWjvHyB;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.49, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4021bc8ce6so1700566b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 07:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792074216; x=1792679016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rQUQ49OGfsrJ0bKzCHue1Hd39skslF4hKETldp4AY30=;
        b=mPWjvHyBR9kHf+vxYLOV2b+UDx5vPMCAxdZce5K8Tdpp0Mtj9OAEGt9/Ky0rOlF+IG
         DyESPKzqBEPCBqi1ygB+Y/4MQIYEig6oITt3IztJjJQ5/oJMFM3PMFnMFRt1ZBM0/b2V
         UgwkRO2FyOF9UiQrz0VEpkdwoqKsjnIU6qkcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074216; x=1792679016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rQUQ49OGfsrJ0bKzCHue1Hd39skslF4hKETldp4AY30=;
        b=QSsywuQixD+08fUTH4VcTkoOtZx03pvK2/9LLeLlWuvue92y810uCTY3R46rvd4lFW
         MqVKb75mWBxM9vG9Me4GB5wqx/9xGpeBQCe1H0x/TgodBUD60Kk+Oxb74oiUrMOBBFhI
         rH4lWOV/P42ekx0Qc6D6h05aG+O1eZEMbW3n7rqGa0sLBjn1nnxmx8Ai/Nn0y/t6tVeG
         DPHniDR+Aienik6D3+2oj/yh8sV+6gvEYMcC9RG3UtuQZku4vJf4sWDZaaJM/ta2Fn5F
         rjs54TOTu9i6SO/ySAMNla3oPgH0DruRFuckHg60LqTbzMbZJHnnbQP/xnNV+Myc7J0T
         dJuA==
X-Gm-Message-State: AFq9FYLJyPqTZF01L+dXCX4627uzX3vmgzrDJXY+NgX31wX2A2wAWpCr
	kzWfSMk3c7HX/8o02rLgJttdXqb1BdkTvYkUzTWp6iH4jkm0E3yoIdII6Ke2zxQAGprlNiuZG7m
	aM7e8lNM=
X-Gm-Gg: AYBFou205DKCRztC4cxuv7MI5RxXhgWe9Coj+Zpr8hiIFi/V7rgOHXKsbH8gL94hmJ4
	PEGVZ2+MLA6+YlmipfmvWlWKHYqNMgS2Twke/Oyw1K3QPWjFBpUCs0UE3uug0Py3lTw52JuLD1+
	HH/48yWu0RCkL2AuiRyg7QKIORkWJamnSn8iLcyFb1nxyPoAfWkDxI/IIqxBHvYzCx4yucc/euR
	iIgh4/qV5+B7gFuvcKVb8HE+0bOieA9cgw2H62F/Qv3EB2J4eQuwxL+9HAVDg/a/7Utwrf7WNzE
	rFA5a20MXoblKtK6XDW5fJkBL3dgxfkOXaZ24lN6aWNz7mrbdClIlooIK/VbMhrM7IScz22bJbU
	VwbS5nAFfLa6wraWRVLqIidRHFDCzDavaN7VbZkdLxrL/1sqPCGxgYQUjoaxg9oU82tl7hsAkeg
	4rNVs9OGTAS6rQvHIOoxCkFvZTJGdNxdxrCUhx/yD/UfRvoufESuzg+RwZc4TufcpabJFC7kfEc
	ZFTMuTj6V6Nt9ODe9Dkz5PZvRed8PY6wGWnaWz+YEvQ3A93EY3UP7KgriLhsbSo6KpuZ1vLEhAR
	E+x6TZkEahex5W3uffbe8hXNVoCdvmAZPFosLS4OI+PAghTN2hBVAy4H7SZB0ANxNdQ6RLPcc+x
	jX8S9
X-Received: by 2002:a17:906:dc8c:b0:c2d:bbae:703b with SMTP id a640c23a62f3a-c31a9fe3866mr1816860366b.2.1792074216022;
        Thu, 15 Oct 2026 07:23:36 -0700 (PDT)
Received: from adam-linux.amarulasolutions.com (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl. [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963e42csm132825266b.26.2026.10.15.07.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:23:35 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v10 3/3] libdnf: remove recipe
Date: Thu, 15 Oct 2026 16:23:30 +0200
Message-ID: <20261015142331.3639101-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015142331.3639101-1-adam.duskett@amarulasolutions.com>
References: <20261015142331.3639101-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 14:23:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247887

libdnf is now included in the dnf5 source tree.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 ...or-both-libsolv-and-libsolvext-libdn.patch | 26 ----------
 ...FNM_EXTMATCH-if-not-already-like-und.patch | 36 -------------
 .../0001-drop-FindPythonInstDir.cmake.patch   | 39 ---------------
 ...-utils.cpp-fix-compilation-with-musl.patch | 48 ------------------
 ...ables-with-pkg-config-cmake-s-own-mo.patch | 27 ----------
 .../libdnf/libdnf/armarch.patch               | 50 -------------------
 meta/recipes-devtools/libdnf/libdnf_0.76.0.bb | 33 ------------
 8 files changed, 260 deletions(-)
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-und.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-utils-utils.cpp-fix-compilation-with-musl.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/armarch.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf_0.76.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index b5cde257fe..586bc6258f 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -332,7 +332,6 @@ RECIPE_MAINTAINER:pn-libconvert-asn1-perl = "Tim Orling <tim.orling@konsulko.com
 RECIPE_MAINTAINER:pn-libcxx = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libdaemon = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libdisplay-info = "Hiago De Franco <hfranco@baylibre.com>"
-RECIPE_MAINTAINER:pn-libdnf = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libdrm = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libedit = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libepoxy = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
deleted file mode 100644
index f56e3ecdf9..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From cd297017bc4013764915dfc1e47d23fe193bc062 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 7 Feb 2017 12:16:03 +0200
-Subject: [PATCH] Get parameters for both libsolv and libsolvext (libdnf is
-
- using both)
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/312]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6c866111..c56b6bab 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -58,7 +58,7 @@ endif()
- 
- 
- # build dependencies
--PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv)
-+PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv libsolvext)
- set(LIBSOLV_LIBRARY ${LIBSOLV_LIBRARIES})
- 
- 
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-und.patch b/meta/recipes-devtools/libdnf/libdnf/0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-und.patch
deleted file mode 100644
index 2b64176317..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-und.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 09c7188880ca62248e7c1e8e907df66545bbc3df Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Sun, 16 Nov 2025 23:29:18 +0000
-Subject: [PATCH] dnf-repo: Define FNM_EXTMATCH if not already (like under
- musl).
-
-With musl, FNM_EXTMATCH is not defined:
-dnf-repo.cpp
-| dnf-repo.cpp: In function 'void dnf_repo_conf_load_overrides(DnfRepo*, const char*)':
-| dnf-repo.cpp:971:50: error: 'FNM_EXTMATCH' was not declared in this scope; did you mean 'FNM_NOMATCH'?
-|   971 |             if (fnmatch(repo_id_pattern, repoId, FNM_EXTMATCH) != 0) {
-|       |                                                  ^~~~~~~~~~~~
-|       |                                                  FNM_NOMATCH
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/1737/commits/47ed831c1fdb32519f2d66fee91bc47f9521d1d4]
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- libdnf/dnf-repo.cpp | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/libdnf/dnf-repo.cpp b/libdnf/dnf-repo.cpp
-index 21d23e0c..dd91b816 100644
---- a/libdnf/dnf-repo.cpp
-+++ b/libdnf/dnf-repo.cpp
-@@ -69,6 +69,10 @@
- #include <string>
- #include <vector>
- 
-+#if !defined(FNM_EXTMATCH)
-+#define FNM_EXTMATCH 0
-+#endif
-+
- typedef struct
- {
-     DnfRepoEnabled   enabled;
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch b/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
deleted file mode 100644
index d3a7583eac..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 178a1358aac59f0b06184bd60a32fcfebbff9aba Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 1 Jun 2021 10:23:59 +0800
-Subject: [PATCH] drop FindPythonInstDir.cmake
-
-Since commit [1] applied, PYTHON_INSTALL_DIR is not right
-on nativesdk build
-...
-|Building for python3
-|-- Python install dir is
-|tmp-glibc/work/x86_64-nativesdk-wrlinuxsdk-linux/nativesdk-libdnf/0.63.0-r0/
-recipe-sysroot-native/usr/lib/python3.9/site-packages
-...
-
-Yocto manually set PYTHON_INSTALL_DIR from recipe, it is not
-necessary to call FindPythonInstDir.cmake which will override
-Yocto setting
-
-[1] https://github.com/rpm-software-management/libdnf/commit/f1cffbfb9f338da827e233c2d8ac3a25a6a59a69
-
-Upstream-Status: Inappropriate [Yocto specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- cmake/modules/FindPythonInstDir.cmake | 7 +------
- 1 file changed, 1 insertion(+), 6 deletions(-)
-
-diff --git a/cmake/modules/FindPythonInstDir.cmake b/cmake/modules/FindPythonInstDir.cmake
-index ed098ded..8b137891 100644
---- a/cmake/modules/FindPythonInstDir.cmake
-+++ b/cmake/modules/FindPythonInstDir.cmake
-@@ -1,6 +1 @@
--EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "
--from sys import stdout
--from sysconfig import get_path
--path=get_path(name='platlib', vars={'platbase':'${CMAKE_INSTALL_PREFIX}'})
--stdout.write(path)"
--OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
-+
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-utils-utils.cpp-fix-compilation-with-musl.patch b/meta/recipes-devtools/libdnf/libdnf/0001-utils-utils.cpp-fix-compilation-with-musl.patch
deleted file mode 100644
index 0a6744db9a..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0001-utils-utils.cpp-fix-compilation-with-musl.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 899a524ff896d7c400e3b48f8c19feac695a7875 Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Mon, 17 Nov 2025 00:05:14 +0000
-Subject: [PATCH] utils/utils.cpp: fix compilation with musl
-
-The basename() function requires the libgen.h header when
-compiling with musl-libc, otherwise it complains:
-error: 'basename' was not declared in this scope; did you mean 'g_basename'?
-Also, musl's basename requires char* instead of const char* argument:
-error: invalid conversion from 'const char*' to 'char*' [-fpermissive]
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/1737/commits/8720d5eeb0d348686d4c5f2ccb5a6c73d66eeff5]
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- libdnf/utils/utils.cpp | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/libdnf/utils/utils.cpp b/libdnf/utils/utils.cpp
-index f5d200b8..40866360 100644
---- a/libdnf/utils/utils.cpp
-+++ b/libdnf/utils/utils.cpp
-@@ -9,6 +9,7 @@
- #include <sys/stat.h>
- #include <dirent.h>
- #include <cstring>
-+#include <libgen.h>
- #include <glob.h>
- #include <stdexcept>
- 
-@@ -311,7 +312,7 @@ std::vector<std::string> createSortedFileList(
-             auto * path_fname = basename(path);
-             bool found{false};
-             for (const auto & path_in_list : paths) {
--                if (strcmp(path_fname, basename(path_in_list.c_str())) == 0) {
-+                if (strcmp(path_fname, basename((char*)path_in_list.c_str())) == 0) {
-                     found = true;
-                     break;
-                 }
-@@ -325,7 +326,7 @@ std::vector<std::string> createSortedFileList(
- 
-     // sort all drop-in configuration files alphabetically by their names
-     std::sort(paths.begin(), paths.end(), [](const std::string & p1, const std::string & p2) {
--        return strcmp(basename(p1.c_str()), basename(p2.c_str())) < 0;
-+        return strcmp(basename((char*)p1.c_str()), basename((char*)p2.c_str())) < 0;
-     });
- 
-     return paths;
diff --git a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
deleted file mode 100644
index ff4db81d98..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 514b377d6c37ede0db0e3947f2870b22c1f8cf4c Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 30 Dec 2016 18:24:50 +0200
-Subject: [PATCH] Set libsolv variables with pkg-config (cmake's own module
-
- doesn't work properly).
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/312]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- CMakeLists.txt | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 63e69888..6c866111 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -58,7 +58,8 @@ endif()
- 
- 
- # build dependencies
--find_package(LibSolv 0.7.21 REQUIRED COMPONENTS ext)
-+PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv)
-+set(LIBSOLV_LIBRARY ${LIBSOLV_LIBRARIES})
- 
- 
- # build dependencies via pkg-config
diff --git a/meta/recipes-devtools/libdnf/libdnf/armarch.patch b/meta/recipes-devtools/libdnf/libdnf/armarch.patch
deleted file mode 100644
index 9080024bf5..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/armarch.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From ec69d285812fc442ee04fe37144e7de4fecd24f1 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Thu, 9 Nov 2023 10:29:31 +0000
-Subject: [PATCH] libdnf: Fix arm arch mapping issues for qemuarmv5
-
-We change the way rpm architectures work, we make the machine name the default machine
-specific package architecture.
-
-This arm mapping code can work or in the case of qemuarmv5, it doesn't as it creates
-armv5hl which doesn't exist and causes errrors. We can simply remove it, we don't need it.
-
-Upstream-Status: Inappropriate [Relies on OE rpm config]
----
- libdnf/hy-util.cpp | 23 -----------------------
- 1 file changed, 23 deletions(-)
-
-diff --git a/libdnf/hy-util.cpp b/libdnf/hy-util.cpp
-index 82f24edd..43cdea69 100644
---- a/libdnf/hy-util.cpp
-+++ b/libdnf/hy-util.cpp
-@@ -117,29 +117,6 @@ hy_detect_arch(char **arch)
-     if (uname(&un) < 0)
-         return DNF_ERROR_FAILED;
- 
--    if (!strncmp(un.machine, "armv", 4)) {
--        /* un.machine is armvXE, where X is version number and E is
--         * endianness (b or l); we need to add modifiers such as
--         * h (hardfloat), n (neon). Neon is a requirement of armv8 so
--         * as far as rpm is concerned armv8l is the equivilent of armv7hnl
--         * (or 7hnb) so we don't explicitly add 'n' for 8+ as it's expected. */
--        char endian = un.machine[strlen(un.machine)-1];
--        char *modifier = un.machine + 5;
--        while(isdigit(*modifier)) /* keep armv7, armv8, armv9, armv10, armv100, ... */
--            modifier++;
--        if (getauxval(AT_HWCAP) & HWCAP_ARM_VFP)
--            *modifier++ = 'h';
--        if ((atoi(un.machine+4) == 7) && (getauxval(AT_HWCAP) & HWCAP_ARM_NEON))
--            *modifier++ = 'n';
--        *modifier++ = endian;
--        *modifier = 0;
--    }
--#ifdef __MIPSEL__
--    if (!strcmp(un.machine, "mips"))
--        strcpy(un.machine, "mipsel");
--    else if (!strcmp(un.machine, "mips64"))
--        strcpy(un.machine, "mips64el");
--#endif
- #if defined(__e2k__)
-     if (__builtin_cpu_is("elbrus-v4") || __builtin_cpu_is("elbrus-8c") || __builtin_cpu_is("elbrus-1c+"))
-         strcpy(un.machine, "e2kv4");
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.76.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.76.0.bb
deleted file mode 100644
index e8a2dca4d8..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf_0.76.0.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "Library providing simplified C and Python API to libsolv"
-HOMEPAGE = "https://github.com/rpm-software-management/libdnf"
-DESCRIPTION = "This library provides a high level package-manager. It's core library of dnf, PackageKit and rpm-ostree. It's replacement for deprecated hawkey library which it contains inside and uses librepo under the hood."
-LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
-
-SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;protocol=https;tag=${PV} \
-           file://0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch \
-           file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
-           file://0001-drop-FindPythonInstDir.cmake.patch \
-           file://armarch.patch \
-           file://0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-und.patch \
-           file://0001-utils-utils.cpp-fix-compilation-with-musl.patch \
-           "
-
-SRCREV = "56370b044f6efdfd14240e3dccac62b833dbe027"
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
-
-DEPENDS = "glib-2.0 libsolv librepo rpm libmodulemd json-c swig-native util-linux"
-
-inherit cmake pkgconfig setuptools3-base gettext
-
-COMPATIBLE_HOST_libc-musl = 'null'
-
-EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3 \
-                  -DWITH_GTKDOC=OFF -DWITH_MAN=OFF -DWITH_HTML=OFF \
-                  -DWITH_TESTS=OFF \
-                  -DWITH_ZCHUNK=OFF \
-                "
-
-BBCLASSEXTEND = "native nativesdk"
-
-SKIP_RECIPE[libdnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'Does not build without package_rpm in PACKAGE_CLASSES due disabled rpm support in libsolv', d)}"
-- 
2.56.0


