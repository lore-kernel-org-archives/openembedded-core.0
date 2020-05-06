Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web12.1882.1588749904411156304
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 00:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=kVtYYhAD;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=388eec6a1=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588749904; x=1620285904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SI60GO1uz83fPD2kFjDHhftlHtssU6vFfIuy0YtXY68=;
  b=kVtYYhAD3rIZluSxxoP6yU2AKj3Xn80LyHID40DMcsgh3rVC/MhYX24U
   Y479Y39g2ZR2eruvdm3w89Rc+pp1Zn0Brp91DvJMrd8gqrwP4Rh/CzjQm
   FPwyAv+AFWY6ogc9CpLbeUUymGPwwzVLxbCBz5+LOSHLMjjzvqxihEUya
   xb3gJfY399qZmb2RMH72LMG939lpo4pi5QI0V9oNw+mFhnO5j77wNttbE
   49WuiOJm11RKRnHZjt7K+LTk7AX0M7785gqG0lJoXuEHEORCmbc4VQjLU
   nVS0vCOmB5FjhfkmSygZRRs3EoywE7Zxd8QUyl3XcIDKUU4yJX2hVWQjJ
   Q==;
IronPort-SDR: JHVBDq/KfLl2lHzlqauavaTwnWakZM92Y4d8etXUjtGfm/B0rHVJopTYHY1XQuTngmVvYW6B2u
 LIOic9QuDgiLaP38SsJO4r+spAQHs5xKyJLfI7zbpfYMPRtie9LrxqbgcchWKXcaqtOKIclaXY
 Z91B7kUMkLugSMNYPL9lCDz0aLDJNyJH36O9mdor6+sVZql6bAJwLKB+SlzASiEbbVDER8YdBr
 qNWoG81I6+cPgKO0MNkNreKi/fk7IVFRyrf7g56X4Aggxf1hZb1Rrkjx5dokyW5Ql+voz4kqJi
 Tpw=
X-IronPort-AV: E=Sophos;i="5.73,358,1583190000"; 
   d="scan'208";a="24183880"
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-core@lists.openembedded.org>
CC: <bunk@stusta.de>, Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH v2 2/2] libcomps: update to 0.1.15
Date: Wed, 6 May 2020 09:24:31 +0200
Message-ID: <20200506072431.1271445-2-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200506072431.1271445-1-richard.leitner@skidata.com>
References: <20200506072431.1271445-1-richard.leitner@skidata.com>
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
Changes v2:
 - use commit ID as SRCREV instead of tag (as suggested by Adrian Bunk)
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
index 40b60159bc..98c55dca85 100644
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
+SRCREV = "b213f749405d84e989b25e183bcf28ce701696dd"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

