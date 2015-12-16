Return-Path: <Yuanjie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 089AE6FFE8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 09:35:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBG9ZXbE011429
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 01:35:33 -0800 (PST)
Received: from Flora.wrs.com (128.224.163.135) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 16 Dec 2015 01:35:33 -0800
From: Yuanjie Huang <Yuanjie.Huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Dec 2015 17:40:38 +0800
Message-ID: <1450258838-9399-1-git-send-email-Yuanjie.Huang@windriver.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Subject: [PATCH 1/1] rpm: Fix support for db5 and db6
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
X-List-Received-Date: Wed, 16 Dec 2015 09:35:36 -0000
Content-Type: text/plain

The previous attempt to let rpm configuration support both db5 and db6
has a flaw that when the building host provides db6 without its header
the db_create test will false pass. This new patch addresses this issue
by test against the DB_VERSION_MAJOR macro value, which is defined in
both db5 and db6's header.

Signed-off-by: Yuanjie Huang <Yuanjie.Huang@windriver.com>
---
 meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch | 95 +++++++++++++---------
 1 file changed, 55 insertions(+), 40 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch b/meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch
index 77020a3..331e02c 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch
@@ -1,13 +1,19 @@
-Support both db5 and db6.
+From 7bad268de8b32281e2a12ccd88038b3ec5eb1be3 Mon Sep 17 00:00:00 2001
+From: Yuanjie Huang <Yuanjie.Huang@windriver.com>
+Date: Tue, 15 Dec 2015 18:50:21 +0800
+Subject: [PATCH] Support both db5 and db6.
 
 Upstream-Status: Inappropriate [configuration]
 
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Yuanjie Huang <Yuanjie.Huang@windriver.com>
+---
+ configure.ac | 103 ++++++++++++++++++++++++++++++++++++++++++++++-------------
+ 1 file changed, 81 insertions(+), 22 deletions(-)
 
-Index: rpm/configure.ac
-===================================================================
---- rpm.orig/configure.ac
-+++ rpm/configure.ac
+diff --git a/configure.ac b/configure.ac
+index 02716a0..889a425 100644
+--- a/configure.ac
++++ b/configure.ac
 @@ -547,8 +547,6 @@ else
      MYPATH=$PATH
  fi
@@ -17,7 +23,7 @@ Index: rpm/configure.ac
  AC_PATH_PROG(__BASH, bash, %{_bindir}/bash, $MYPATH)
  AC_PATH_PROG(__BZIP2, bzip2, %{_bindir}/bzip2, $MYPATH)
  AC_PATH_PROG(__CAT, cat, /bin/cat, $MYPATH)
-@@ -560,22 +558,6 @@ AC_PATH_PROG(__CMAKE, cmake, %{_bindir}/
+@@ -560,22 +558,6 @@ AC_PATH_PROG(__CMAKE, cmake, %{_bindir}/cmake, $MYPATH)
  AC_PATH_PROG(__CPIO, cpio, /bin/cpio, $MYPATH)
  AC_PATH_PROG(__CURL, curl, %{_bindir}/curl, $MYPATH)
  AC_PATH_PROG(__CVS, cvs, %{_bindir}/cvs, $MYPATH)
@@ -40,7 +46,7 @@ Index: rpm/configure.ac
  AC_PATH_PROG(__DIFF, diff, /bin/diff, $MYPATH)
  AC_PATH_PROG(__DITTO, ditto, %{_bindir}/ditto, $MYPATH)
  AC_PATH_PROG(__FILE, file, %{_bindir}/file, $MYPATH)
-@@ -1604,13 +1586,18 @@ RPM_CHECK_LIB(
+@@ -1598,13 +1580,46 @@ RPM_CHECK_LIB(
  
  dnl # Berkeley-DB & SQLite
  DBLIBSRCS=""
@@ -48,55 +54,61 @@ Index: rpm/configure.ac
 +
  # XXX won't handle --includedir override
 -CPPFLAGS="${CPPFLAGS} -I${prefix}/include/${DBXY}"
+-RPM_CHECK_LIB(
 +CPPFLAGS_save="${CPPFLAGS}"
 +CPPFLAGS="${CPPFLAGS_save} -I${prefix}/include/db-6.0"
 +with_db_save="${with_db}"
- RPM_CHECK_LIB(
++
++AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
++#include <db.h>
++]],
++[[
++#if DB_VERSION_MAJOR < 6
++#error DB_VERSION_MAJOR is below 6
++#endif
++]])],
++[RPM_CHECK_LIB(
      [Berkeley-DB], [db],
      [db-6.0], [db_create], [db.h],
 -    [yes,external], [db3],
 +    [yes,external], [db6],
      [ DBLIBSRCS="$DBLIBSRCS db3.c"
 +      DBXY=db60
++      AM_CONDITIONAL(WITH_DB, [ true ])
++      AM_CONDITIONAL(WITH_DB_INTERNAL, [ test ".$RPM_CHECK_LIB_LOCATION" = .internal ])
++      if test ".$RPM_CHECK_LIB_LOCATION" = .internal; then
++          AC_DEFINE(HAVE_DB_H, 1, [Have <db.h> header])
++      else
++          WITH_DB_SUBDIR=""
++      fi
++    ],
++    [ AM_CONDITIONAL(WITH_DB, [ false ])
++      AM_CONDITIONAL(WITH_DB_INTERNAL, [ false ])
++    ])],
++[with_db="${with_db_save}"
++ CPPFLAGS="${CPPFLAGS_save} -I${prefix}/include/db-5.3"
++ RPM_CHECK_LIB(
++    [Berkeley-DB], [db],
++    [db-5.3], [db_create], [db.h],
++    [yes,external], [db53],
++    [ DBLIBSRCS="$DBLIBSRCS db3.c"
++      DBXY=db53
        AM_CONDITIONAL(WITH_DB, [ true ])
        AM_CONDITIONAL(WITH_DB_INTERNAL, [ test ".$RPM_CHECK_LIB_LOCATION" = .internal ])
        if test ".$RPM_CHECK_LIB_LOCATION" = .internal; then
-@@ -1619,10 +1606,32 @@ RPM_CHECK_LIB(
-           WITH_DB_SUBDIR=""
-       fi
-     ],
--    [ AM_CONDITIONAL(WITH_DB, [ false ])
--      AM_CONDITIONAL(WITH_DB_INTERNAL, [ false ])
-+    [ # Reset a few variables to fresh
-+      with_db="${with_db_save}"
-+      CPPFLAGS="${CPPFLAGS_save} -I${prefix}/include/db-5.3"
-+      RPM_CHECK_LIB(
-+        [Berkeley-DB], [db],
-+        [db-5.3], [db_create], [db.h],
-+        [yes,external], [db53],
-+        [ DBLIBSRCS="$DBLIBSRCS db3.c"
-+          DBXY=db53
-+          AM_CONDITIONAL(WITH_DB, [ true ])
-+          AM_CONDITIONAL(WITH_DB_INTERNAL, [ test ".$RPM_CHECK_LIB_LOCATION" = .internal ])
-+          if test ".$RPM_CHECK_LIB_LOCATION" = .internal; then
-+              AC_DEFINE(HAVE_DB_H, 1, [Have <db.h> header])
-+          else
-+              WITH_DB_SUBDIR=""
-+          fi
-+        ],
-+        [ AM_CONDITIONAL(WITH_DB, [ false ])
-+          AM_CONDITIONAL(WITH_DB_INTERNAL, [ false ])
-+        ])
+@@ -1616,6 +1631,11 @@ RPM_CHECK_LIB(
+     [ AM_CONDITIONAL(WITH_DB, [ false ])
+       AM_CONDITIONAL(WITH_DB_INTERNAL, [ false ])
      ])
- 
++])
++
 +if test ".$ac_cv_lib_db_6_0_db_create" != .yes -a ".$ac_cv_lib_db_5_3_db_create" != .yes; then
 +    CPPFLAGS="${CPPFLAGS_save}"
 +fi
-+
+ 
  dnl # Sqlite external
  RPM_CHECK_LIB(
-     [SQLite], [sqlite],
-@@ -1633,10 +1642,11 @@ RPM_CHECK_LIB(
+@@ -1627,10 +1647,11 @@ RPM_CHECK_LIB(
  
  dnl # Sqlite 3.7.0.1 from db-5.1.19
  dnl XXX error: `db3' is already registered with AC_CONFIG_SUBDIRS.
@@ -109,7 +121,7 @@ Index: rpm/configure.ac
      [
        AM_CONDITIONAL(WITH_DBSQL, [ true ])
        AC_DEFINE(WITH_SQLITE, 1, [Define as 1 if building with SQLite library])
-@@ -1650,12 +1660,50 @@ RPM_CHECK_LIB(
+@@ -1644,12 +1665,50 @@ RPM_CHECK_LIB(
      ], [
        AM_CONDITIONAL(WITH_DBSQL, [ false ])
      ])
@@ -160,3 +172,6 @@ Index: rpm/configure.ac
  AC_ARG_WITH(db-largefile, AS_HELP_STRING([--with-db-largefile], [build Berkeley-DB with LARGEFILE support]))
  AC_ARG_WITH(db-mutex,     AS_HELP_STRING([--with-db-mutex=ARG], [build Berkeley-DB with MUTEX type ARG]))
  
+-- 
+2.6.2
+
-- 
2.6.2


