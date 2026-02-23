Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E90DE909BC
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 15:39:46 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37953.1771861178344208514
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 07:39:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=NL7AvwjN;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.49, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b904e9d0a7dso48674366b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 07:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1771861177; x=1772465977; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DbcdYJT4YKJlinrw4N7dJDUmBhzw87PMV68rV62hJI=;
        b=NL7AvwjNtUvtOyihvDxK16Zk73TKMEHA9wKLedzVxaCE5Ti2UUnci8AZLCwSaQlDas
         Vy0mi37ZV+l2NI1u8BiETfISDKiqpENwCAZ0X4y8uFk4tnA9kDVa6IVtYbFatDqdsuPO
         4dbjGZ2aI2Uhy7wqC8QJC6ZS8yGuCld9KTMY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771861177; x=1772465977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5DbcdYJT4YKJlinrw4N7dJDUmBhzw87PMV68rV62hJI=;
        b=V/ix5QlEKhA+kysr5b1e+kzDHxaMOLhM0ByaK64ediwlhpXIoyXXQyBDFmHfohL7up
         JlE8HjmzZKOf3RvS6fEmzBXT/bK3+kD4z1UqNW/Qo1WlaXrUEAY/GuQETCThPIV1MUe6
         yy8AjspJdvKJC47D0CG5E+FGCvkS8cVupz5eGVY6VT8i0zsE//S98QaqbVlPlYdX/9Cu
         VyWkA741Huz9hT1BjJk6z9yJKLFiCBO7Gbyxp6fXo611rOF7K8ym9jL5DQTym03F49oK
         LQLRsYzlR4wbkSHkDy8Kk5csSM6fBtzT6UybNPqWrS3UMKe+Q4CX7oDV7t5eTno/DMLk
         vQUg==
X-Gm-Message-State: AOJu0YzY6mqFLiGp6IJmvu004ef7aX4+GmiuKH8s7PArDxrCgSPTl4F3
	JgjhPnKlanihoSFKSVHmyOS6w5eT5F5Wqsp6KTqSWBHZ8dzccLSX4D9HzlKDXrGIwfYTbe7bpgX
	pXepcE3A=
X-Gm-Gg: AZuq6aLhwiftkb2KCYLHzzuqehyl2yRQbvgx1Mgum4whl5RNaB00s71wNAk4/9m8Yss
	U91tSZcm+UqpgB6bGmSm1L1MN99lfcxpkTIDzYgnwE791DLadw5baU294z5DMtL5tuUPx/t9ych
	0ZPKWx9YqFwf5xXI/H0M1izMbDxEEiahyMNo/tDxqKYs4Uyq6dtjFN1YNup6K2NAvltgr/ZPHZf
	hrzJ+9iPy/m5Cw2ipyJe5FRWGPKd3xhySXIpgzIH3IKv8KopGWbzeu2UTDlz71CDVM/QMquCmzC
	TMBVgQ9J8wEaWsTDEH/ccSYcO3MQ8y7Y2hU72MTWl9nohtSgq17JzkPR8vmbXe3aNo2LYYx1hZs
	2IashV7ccIbLijLH+uHG2uielu0Wp6L0deYD0pMRLd0NBYQhTBQDPAqw+vX60cS6OI1tWYsVdYb
	KCi0LCrMYw53G/zBnvCeYKN9koz3gbqNpMi4DDyAzMSY1Hxf2V6KohWrMExFm6kH5DomswzE88b
	IqI7DIA2lKxFjy1wqV6deY1Y93Ht9UqGgL5ujEtS7MfdEjdwKShRo/HZuG5QPiQe5ChJg==
X-Received: by 2002:a17:907:608f:b0:b87:2681:f608 with SMTP id a640c23a62f3a-b9081bc355fmr242328766b.8.1771861175675;
        Mon, 23 Feb 2026 07:39:35 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b90ba281d69sm33643666b.28.2026.02.23.07.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 07:39:35 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v5 8/8] libdnf: remove recipe
Date: Mon, 23 Feb 2026 16:39:29 +0100
Message-ID: <20260223153929.2641007-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223153929.2641007-1-adam.duskett@amarulasolutions.com>
References: <20260223153929.2641007-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 15:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231680

libdnf5 is now included in the dnf5 source tree.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 ...or-both-libsolv-and-libsolvext-libdn.patch | 26 ----------
 ...FNM_EXTMATCH-if-not-already-like-und.patch | 39 --------------
 .../0001-drop-FindPythonInstDir.cmake.patch   | 39 --------------
 ...-utils.cpp-fix-compilation-with-musl.patch | 51 -------------------
 ...ables-with-pkg-config-cmake-s-own-mo.patch | 27 ----------
 .../libdnf/libdnf/armarch.patch               | 50 ------------------
 meta/recipes-devtools/libdnf/libdnf_0.75.0.bb | 33 ------------
 8 files changed, 266 deletions(-)
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-und.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-utils-utils.cpp-fix-compilation-with-musl.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/armarch.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf_0.75.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 30404aac35..8ddcf0fb81 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -335,7 +335,6 @@ RECIPE_MAINTAINER:pn-libcxx = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libdaemon = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libdazzle = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libdisplay-info = "Hiago De Franco <hfranco@baylibre.com>"
-RECIPE_MAINTAINER:pn-libdnf = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libdrm = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libedit = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libepoxy = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
deleted file mode 100644
index 54b1262672..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From cd8a24156cefab80b673af233f66ff44c1b7c458 Mon Sep 17 00:00:00 2001
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
-index a6f14318..60c66e94 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -51,7 +51,7 @@ endif()
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
index 14ef362ccd..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-und.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 486d1c7826efb9e42bbb18b6537fd23a0a33b324 Mon Sep 17 00:00:00 2001
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
-index 44c0f8758..d53959414 100644
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
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch b/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
deleted file mode 100644
index 850a862979..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 5150fd9be924d2e9e74b2db664229423a4a00238 Mon Sep 17 00:00:00 2001
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
index 061e7dffbd..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0001-utils-utils.cpp-fix-compilation-with-musl.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 699608a4c03ebbf64c1d7b6f56d9811492175daa Mon Sep 17 00:00:00 2001
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
-index f5d200b8a..501bc0ed2 100644
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
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
deleted file mode 100644
index f55870802f..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From a921a92f334a2a30741b906c206e041cef2d904d Mon Sep 17 00:00:00 2001
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
-index c6bd46a6..a6f14318 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -51,7 +51,8 @@ endif()
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
index 8a36f87227..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/armarch.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From baf4fc9f157e4c08c67d1a577b0f1e10f213a642 Mon Sep 17 00:00:00 2001
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
-index 9978c8e9..aa1369b6 100644
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
-     *arch = g_strdup(un.machine);
-     return 0;
- }
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb
deleted file mode 100644
index ddcbc7d9ff..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "Library providing simplified C and Python API to libsolv"
-HOMEPAGE = "https://github.com/rpm-software-management/libdnf"
-DESCRIPTION = "This library provides a high level package-manager. It's core library of dnf, PackageKit and rpm-ostree. It's replacement for deprecated hawkey library which it contains inside and uses librepo under the hood."
-LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;protocol=https \
-           file://0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch \
-           file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
-           file://0001-drop-FindPythonInstDir.cmake.patch \
-           file://armarch.patch \
-           file://0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-und.patch \
-           file://0001-utils-utils.cpp-fix-compilation-with-musl.patch \
-           "
-
-SRCREV = "d39573195e24b43687587a8d83b9f6ac274e2412"
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
2.53.0


