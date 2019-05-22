Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D01147E3BE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 10:58:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4588kw2mg0z3G
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 12:58:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558522728;
	bh=9AKDIdvYUcjwmSLl+I5nt50BWXjbumPLB0iwl6KqbdE=;
	h=From:To:Subject:Date:From;
	b=kN/Qeoec46LkOaXpPykmr7ibkzj1xyQ0T1LT6YStQDbtp+dM+Fr8gzRbsP2F2b8+v
	dzJmo2ElhKT7Wm/7K1c0r/Nqo083uAgbk8ZfCSihdUrWRHRIsHzqq5JgEJoLVaD+Hj
	XWf9x/9O3V3GiVGXl32T0iYdLvpI1hf2VKgIAfBCrehGdFetc/g/nRgYz9YGcTHmCI
	fGP5hfTyx3OadhkyAbjtPPS5PmwiLkL5D1YmGz286pto0iRvwmvD4+Z6u+j5EnKnfv
	DbJ2XuTifUq7gLtTD478z+XDHQRFN9ca2ltVmtyLo2NZLZ1225cJfz7KKvLEtaRS8O
	TylROAzZhPdWvqgCiFQQNzpb8bgYRoMjQ0XoEEya2pTFp26KN7+zfGEUk+pQwM93GA
	RWTNjo5fFqSXto0UOxA8g7W0EzrfEQHK5zjHYDyvVdqNdRn++p7c0G56jsLW6DitNi
	N+NlfMmooae+ZcEaSsGTmHOvLKWV6/Q83s7AZbpKZKCGrLqP8vubnVTruwkNQh/x9d
	ldgw0eY0rM+UPbZdDO5/g2aMl3yD+Cgi/8oYCVfG0cwp+lQ6wZztcBEfpaImkftOHm
	HsePrygawU8b0kIbY1vclX2uQxBNSz08Oqy3wEEVQNcMRpQKHI/dXQExFu+O826fc0
	rRPPfF9bFxjU8gRhr907EgR4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2019 13:58:45 +0300
Message-Id: <20190522105847.6512-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] apt: Remove workaround patches for no longer supported host distributions
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
X-List-Received-Date: Wed, 22 May 2019 10:58:49 -0000

All still supported host distributions have gcc >= 4.8.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/apt/apt-native.inc      |  2 -
 .../apt/0001-fix-the-gcc-version-check.patch  | 74 -------------------
 ...emove-Wsuggest-attribute-from-CFLAGS.patch | 43 -----------
 3 files changed, 119 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-fix-the-gcc-version-check.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-remove-Wsuggest-attribute-from-CFLAGS.patch

diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-devtools/apt/apt-native.inc
index ef232c1eb6..d826786329 100644
--- a/meta/recipes-devtools/apt/apt-native.inc
+++ b/meta/recipes-devtools/apt/apt-native.inc
@@ -7,8 +7,6 @@ USE_NLS = "yes"
 
 SRC_URI += "file://db_linking_hack.patch \
             file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
-            file://0001-remove-Wsuggest-attribute-from-CFLAGS.patch \
-            file://0001-fix-the-gcc-version-check.patch \
 "
 
 python do_install () {
diff --git a/meta/recipes-devtools/apt/apt/0001-fix-the-gcc-version-check.patch b/meta/recipes-devtools/apt/apt/0001-fix-the-gcc-version-check.patch
deleted file mode 100644
index 3ac92462c5..0000000000
--- a/meta/recipes-devtools/apt/apt/0001-fix-the-gcc-version-check.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 53c5d0982f03fd0e24c4195d6e1e42b9ade9d500 Mon Sep 17 00:00:00 2001
-From: Roy Li <rongqing.li@windriver.com>
-Date: Wed, 27 May 2015 14:30:28 +0800
-Subject: [PATCH] fix the gcc version check
-
-Upstream-Status: pending
-
-"GCC diagnostic push" is gcc 4.6 feature, gcc 4.4.7 on centos did not know it
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- apt-pkg/contrib/macros.h     | 2 +-
- apt-pkg/deb/debsrcrecords.cc | 4 ++--
- apt-pkg/srcrecords.cc        | 4 ++--
- 3 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/apt-pkg/contrib/macros.h b/apt-pkg/contrib/macros.h
-index 2727fd8..0ecae50 100644
---- a/apt-pkg/contrib/macros.h
-+++ b/apt-pkg/contrib/macros.h
-@@ -136,7 +136,7 @@
- #endif
- #endif
- 
--#if __GNUC__ >= 4
-+#if __GNUC__ >= 4 + (6 >= __GNUC_MINOR__)
- 	#define APT_IGNORE_DEPRECATED_PUSH \
- 		_Pragma("GCC diagnostic push") \
- 		_Pragma("GCC diagnostic ignored \"-Wdeprecated-declarations\"")
-diff --git a/apt-pkg/deb/debsrcrecords.cc b/apt-pkg/deb/debsrcrecords.cc
-index e8295de..40160b2 100644
---- a/apt-pkg/deb/debsrcrecords.cc
-+++ b/apt-pkg/deb/debsrcrecords.cc
-@@ -139,13 +139,13 @@ bool debSrcRecordParser::Files(std::vector<pkgSrcRecords::File> &F)
-    for (std::vector<pkgSrcRecords::File2>::const_iterator f2 = F2.begin(); f2 != F2.end(); ++f2)
-    {
-       pkgSrcRecords::File2 f;
--#if __GNUC__ >= 4
-+#if __GNUC__ >= 4 + (6 >= __GNUC_MINOR__)
- 	#pragma GCC diagnostic push
- 	#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
- #endif
-       f.MD5Hash = f2->MD5Hash;
-       f.Size = f2->Size;
--#if __GNUC__ >= 4
-+#if __GNUC__ >= 4 + (6 >= __GNUC_MINOR__)
- 	#pragma GCC diagnostic pop
- #endif
-       f.Path = f2->Path;
-diff --git a/apt-pkg/srcrecords.cc b/apt-pkg/srcrecords.cc
-index 53d7e60..1484828 100644
---- a/apt-pkg/srcrecords.cc
-+++ b/apt-pkg/srcrecords.cc
-@@ -157,7 +157,7 @@ bool pkgSrcRecords::Parser::Files2(std::vector<pkgSrcRecords::File2> &F2)/*{{{*/
-    for (std::vector<pkgSrcRecords::File>::const_iterator f = F.begin(); f != F.end(); ++f)
-    {
-       pkgSrcRecords::File2 f2;
--#if __GNUC__ >= 4
-+#if __GNUC__ >= 4 + (6 >= __GNUC_MINOR__)
- 	#pragma GCC diagnostic push
- 	#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
- #endif
-@@ -165,7 +165,7 @@ bool pkgSrcRecords::Parser::Files2(std::vector<pkgSrcRecords::File2> &F2)/*{{{*/
-       f2.Size = f->Size;
-       f2.Hashes.push_back(HashString("MD5Sum", f->MD5Hash));
-       f2.FileSize = f->Size;
--#if __GNUC__ >= 4
-+#if __GNUC__ >= 4 + (6 >= __GNUC_MINOR__)
- 	#pragma GCC diagnostic pop
- #endif
-       f2.Path = f->Path;
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/apt/apt/0001-remove-Wsuggest-attribute-from-CFLAGS.patch b/meta/recipes-devtools/apt/apt/0001-remove-Wsuggest-attribute-from-CFLAGS.patch
deleted file mode 100644
index 47870e3c8b..0000000000
--- a/meta/recipes-devtools/apt/apt/0001-remove-Wsuggest-attribute-from-CFLAGS.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 9fdf50d63df08ee65e7d8e62c35f19ac4841bca9 Mon Sep 17 00:00:00 2001
-From: Roy Li <rongqing.li@windriver.com>
-Date: Wed, 27 May 2015 09:48:45 +0800
-Subject: [PATCH] remove Wsuggest-attribute from CXXFLAGS
-
-Upstream-Status: Inappropriate
-
-Wsuggest-attribute is GCC 4.6 feature, centos6 is using GCC
-4.4.7 which unknown this flag, so remove it from CXXFLAGS
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- buildlib/environment.mak.in | 1 -
- test/libapt/makefile        | 1 -
- 2 files changed, 2 deletions(-)
-
-diff --git a/buildlib/environment.mak.in b/buildlib/environment.mak.in
-index 9620722..c344d01 100644
---- a/buildlib/environment.mak.in
-+++ b/buildlib/environment.mak.in
-@@ -14,7 +14,6 @@ CXXFLAGS+= @CXXFLAGS@ -Wall -Wextra
- CXXFLAGS+= -Wcast-align -Wlogical-op -Wredundant-decls -Wmissing-declarations -Wunsafe-loop-optimizations
- CXXFLAGS+= -Wctor-dtor-privacy -Wdisabled-optimization -Winit-self -Wmissing-include-dirs -Wnoexcept -Wsign-promo -Wundef
- # suggests methods which already have such an attribute
--#CXXFLAGS+= -Wsuggest-attribute=pure -Wsuggest-attribute=const -Wsuggest-attribute=noreturn
- # sanitize options to be enabled for testing
- #CXXFLAGS+= -fsanitize=address -fsanitize=undefined -fno-sanitize=vptr
- # a bit too pedantic to be run by default
-diff --git a/test/libapt/makefile b/test/libapt/makefile
-index 5ff9cf6..c5b5190 100644
---- a/test/libapt/makefile
-+++ b/test/libapt/makefile
-@@ -40,7 +40,6 @@ CXXFLAGS += -pthread
- # disable some flags for gtest again
- CXXFLAGS+= -Wno-missing-declarations
- CXXFLAGS+= -Wno-missing-field-initializers
--CXXFLAGS+= -Wno-suggest-attribute=pure -Wno-suggest-attribute=const -Wno-suggest-attribute=noreturn
- CXXFLAGS+= -Wno-undef
- 
- # All Google Test headers.  Usually you shouldn't change this definition.
--- 
-2.1.4
-
-- 
2.17.1


