Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web10.7572.1588715738064529862
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 14:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=njbMo+TI;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=3877ea1dc=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588715738; x=1620251738;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FXqRAcyMrUkCe0fGYbdbly7hqIqOy3rqH/YltbYshuM=;
  b=njbMo+TIFi8fBJ1h948GcWiPx6xrZUUgr5Fxho+lBUwzN9dbylPs4+tb
   6JZ1vbhFaIqd8sGFlFJPakEVUY+roWdBNJDFv/NwtOgoXX3WjW2cxB/Ef
   zg086bqBL4DV1p9CQbQEpLAh/PW8BHiImsfmRC0slS45Ta4lLk7J9C0eh
   cXU7kHAkPaKTRzd0GMUytdHRXsBDP+lOVAAzetEVDFEshgnY7SQEfElmh
   l/cqrf+UOP/22QkU94FuxLDKRyPdxBum3RhqJHFbW5wFFb7U6mx38A3cr
   +SUWmKO/FG0YCFsRCFNq6TI9OrbNasIeiDd7erYCFPx3BFk7i2NYYkVYO
   Q==;
IronPort-SDR: TE5E/8jlt27chhKc9X53TANlD/jekd5ThGxgSeI24CM101rSL/6GljC2klK/xAaXI1+BpfOUrg
 27ZZDdeajhwAKeGnL5Oy6zABm3/fUgDr+ipYQ0GujIowvhnuQxksm4Bexv4tNMEGwf4ildpi9z
 wo2Mxve1oujIiZSNNrTiYD3VKUuBeYX22XpO6S7xblKyE9Wk9ZGjPBhyTqjnOSVDrgRIw5w76i
 Dy8pu+7JWY7SP5HSLu3TK4Gw1j36Z8Vg/YRrrVWMZqKR6i1RDET9KteJJhNmrQ/4QHO50MWqp1
 inE=
X-IronPort-AV: E=Sophos;i="5.73,356,1583190000"; 
   d="scan'208";a="2575293"
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-core@lists.openembedded.org>
CC: Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH 2/2] libcomps: update to 0.1.15
Date: Tue, 5 May 2020 23:55:21 +0200
Message-ID: <20200505215521.238753-2-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200505215521.238753-1-richard.leitner@skidata.com>
References: <20200505215521.238753-1-richard.leitner@skidata.com>
MIME-Version: 1.0
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In this update the 0001-Make-__comps_objmrtree_all-static-inline.patch
was mainlined by commit 18f52cb.

Furthermore mainline commit 3237f44 fixes a build problem with the
default "-fno-common" of gcc 10.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 .../0001-Add-crc32.c-to-sources-list.patch    |  9 +++--
 ...-__comps_objmrtree_all-static-inline.patch | 35 -------------------
 ...YTHON_INSTALL_DIR-by-running-python.patch} | 12 ++++---
 .../{libcomps_git.bb => libcomps_0.1.15.bb}   |  6 ++--
 4 files changed, 15 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-devtools/libcomps/libcomps/0001-Make-__comps_objmrtree_all-static-inline.patch
 rename meta/recipes-devtools/libcomps/libcomps/{0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch => 0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch} (85%)
 rename meta/recipes-devtools/libcomps/{libcomps_git.bb => libcomps_0.1.15.bb} (74%)

diff --git a/meta/recipes-devtools/libcomps/libcomps/0001-Add-crc32.c-to-sources-list.patch b/meta/recipes-devtools/libcomps/libcomps/0001-Add-crc32.c-to-sources-list.patch
index ff90269a23..f4fb6d3b20 100644
--- a/meta/recipes-devtools/libcomps/libcomps/0001-Add-crc32.c-to-sources-list.patch
+++ b/meta/recipes-devtools/libcomps/libcomps/0001-Add-crc32.c-to-sources-list.patch
@@ -1,7 +1,7 @@
-From 83407aa50e06d967d0a1095a140bd7b0e5d51d27 Mon Sep 17 00:00:00 2001
+From 72065bb2b5881dc224299f302379391aebdfca3d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 21 Nov 2018 13:09:05 +0100
-Subject: [PATCH] Add crc32.c to sources list
+Subject: [PATCH 1/2] Add crc32.c to sources list
 
 Otherwise, there is a missing symbol runtime error under musl C library.
 
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/libcomps/src/python/src/CMakeLists.txt b/libcomps/src/python/src/CMakeLists.txt
-index 6ed25bb..c15c8b2 100644
+index adabb31..b9b96ab 100644
 --- a/libcomps/src/python/src/CMakeLists.txt
 +++ b/libcomps/src/python/src/CMakeLists.txt
 @@ -9,13 +9,13 @@ set (pycomps_SRCDIR ${CMAKE_CURRENT_SOURCE_DIR})
@@ -45,3 +45,6 @@ index d8f5e34..f266067 100644
  
  static uint32_t crc32_tab[] = {
  	0x00000000, 0x77073096, 0xee0e612c, 0x990951ba, 0x076dc419, 0x706af48f,
+-- 
+2.26.2
+
diff --git a/meta/recipes-devtools/libcomps/libcomps/0001-Make-__comps_objmrtree_all-static-inline.patch b/meta/recipes-devtools/libcomps/libcomps/0001-Make-__comps_objmrtree_all-static-inline.patch
deleted file mode 100644
index 88469fb331..0000000000
--- a/meta/recipes-devtools/libcomps/libcomps/0001-Make-__comps_objmrtree_all-static-inline.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 91a324f8771818b81017fdf4daaad0c8c4b6987c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 20 Mar 2017 11:38:54 -0700
-Subject: [PATCH] Make __comps_objmrtree_all() static inline
-
-This helps compilers to scope the symbol correctly
-and apply the inlining optimizations, clang e.g.
-emits the functions and calls in code which is
-suboptimal, therefore give a little help to compiler
-this function is not used anywhere else to have
-a global scope.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libcomps/src/comps_objmradix.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libcomps/src/comps_objmradix.c b/libcomps/src/comps_objmradix.c
-index 9be6648..55f7793 100644
---- a/libcomps/src/comps_objmradix.c
-+++ b/libcomps/src/comps_objmradix.c
-@@ -604,7 +604,7 @@ inline void comps_objmrtree_pair_destroy_v(void * pair) {
-     free(pair);
- }
- 
--inline COMPS_HSList* __comps_objmrtree_all(COMPS_ObjMRTree * rt, char keyvalpair) {
-+static inline COMPS_HSList* __comps_objmrtree_all(COMPS_ObjMRTree * rt, char keyvalpair) {
-     COMPS_HSList *to_process, *ret;
-     COMPS_HSListItem *hsit, *oldit;
-     size_t x;
--- 
-2.12.0
-
diff --git a/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/libcomps/libcomps/0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
similarity index 85%
rename from meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
rename to meta/recipes-devtools/libcomps/libcomps/0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 59c09aa70a..3e9102605b 100644
--- a/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/libcomps/libcomps/0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,20 +1,19 @@
-From b28859ea93110d52d8a87d7b5a6c8796d0d523ed Mon Sep 17 00:00:00 2001
+From 32447a79e24f8e7e9e0150eb747f34116d63ef38 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:22:09 +0200
-Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python.
+Subject: [PATCH 2/2] Do not set PYTHON_INSTALL_DIR by running python.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  libcomps/src/python/src/CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libcomps/src/python/src/CMakeLists.txt b/libcomps/src/python/src/CMakeLists.txt
-index fa590ae..6913214 100644
+index b9b96ab..6d44567 100644
 --- a/libcomps/src/python/src/CMakeLists.txt
 +++ b/libcomps/src/python/src/CMakeLists.txt
-@@ -117,7 +117,7 @@ IF (SKBUILD)
+@@ -115,7 +115,7 @@ IF (SKBUILD)
      INSTALL(FILES libcomps/__init__.py DESTINATION libcomps/src/python/src/libcomps)
      INSTALL(TARGETS pycomps LIBRARY DESTINATION libcomps/src/python/src/libcomps)
  ELSE ()
@@ -23,3 +22,6 @@ index fa590ae..6913214 100644
  
      INSTALL(FILES ${pycomps_SRCDIR}/libcomps/__init__.py DESTINATION ${PYTHON_INSTALL_DIR}/libcomps)
      #INSTALL(FILES ${pycomps_SRCDIR}/tests/__test.py DESTINATION
+-- 
+2.26.2
+
diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb
similarity index 74%
rename from meta/recipes-devtools/libcomps/libcomps_git.bb
rename to meta/recipes-devtools/libcomps/libcomps_0.1.15.bb
index 40b60159bc..90032370d7 100644
--- a/meta/recipes-devtools/libcomps/libcomps_git.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb
@@ -3,13 +3,11 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
-           file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
-           file://0001-Make-__comps_objmrtree_all-static-inline.patch \
            file://0001-Add-crc32.c-to-sources-list.patch \
+           file://0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-PV = "0.1.14"
-SRCREV = "5a0e04286f3462e3308f2a332eb0f90a66920218"
+SRCREV = "libcomps-${PV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

