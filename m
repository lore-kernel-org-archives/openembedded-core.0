Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A787D65C78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 10:42:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 14 Aug 2015 03:42:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,677,1432623600"; d="scan'208";a="748520721"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga001.jf.intel.com with ESMTP; 14 Aug 2015 03:42:07 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Aug 2015 13:43:20 +0300
Message-Id: <993511190b981cc8f6dfbffca61b5d8c56a891a4.1439548737.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439548737.git.alexander.kanavin@linux.intel.com>
References: <cover.1439548737.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439548737.git.alexander.kanavin@linux.intel.com>
References: <cover.1439548737.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 5/5] rpm: update to 5.4.15
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
X-List-Received-Date: Fri, 14 Aug 2015 10:42:07 -0000

This update also requires that db is updated to 6.1 version.

Patch updates:

- verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch has been merged to upstream

- rpm-macros.in-disable-external-key-server.patch, rpm-lua-fix-print.patch and
rpm-db5-or-db6.patch have been ported to the new upstream release. A better explanation
for when db5 is preferred has been provided.

- rpm-payload-use-hashed-inode.patch - a portion of this patch is now in upstream, so
that portion has been removed from the patch

- rpm-db5-or-db6.patch has been dropped from the latest-cvs recipe. That recipe
is intended for tracking upstream developments, and for that use case it shouldn't
matter that db6 is under AGPLv3.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...atch => 0001-disable-external-key-server.patch} | 26 +++++++++--
 ...atement-is-not-working-properly-inside-o.patch} | 33 ++++++++------
 ...-db5-and-db6.-db6-is-licensed-under-AGPL.patch} | 53 +++++++++++++---------
 .../rpm/rpm/rpm-payload-use-hashed-inode.patch     | 20 --------
 ...broken-logic-for-ghost-avoidance-Mark-Hat.patch | 38 ----------------
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |  1 -
 .../rpm/{rpm_5.4.14.bb => rpm_5.4.15.bb}           | 13 +++---
 7 files changed, 77 insertions(+), 107 deletions(-)
 rename meta/recipes-devtools/rpm/rpm/{rpm-macros.in-disable-external-key-server.patch => 0001-disable-external-key-server.patch} (55%)
 rename meta/recipes-devtools/rpm/rpm/{rpm-lua-fix-print.patch => 0002-Lua-print-statement-is-not-working-properly-inside-o.patch} (81%)
 rename meta/recipes-devtools/rpm/rpm/{rpm-db5-or-db6.patch => 0003-Support-both-db5-and-db6.-db6-is-licensed-under-AGPL.patch} (83%)
 delete mode 100644 meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch
 rename meta/recipes-devtools/rpm/{rpm_5.4.14.bb => rpm_5.4.15.bb} (97%)

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-macros.in-disable-external-key-server.patch b/meta/recipes-devtools/rpm/rpm/0001-disable-external-key-server.patch
similarity index 55%
rename from meta/recipes-devtools/rpm/rpm/rpm-macros.in-disable-external-key-server.patch
rename to meta/recipes-devtools/rpm/rpm/0001-disable-external-key-server.patch
index 07a0cfa..47dae61 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-macros.in-disable-external-key-server.patch
+++ b/meta/recipes-devtools/rpm/rpm/0001-disable-external-key-server.patch
@@ -1,4 +1,7 @@
-disable external key server
+From c4538118f86e3474da38022818c06f729014f7e8 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 13 Aug 2015 17:42:20 +0300
+Subject: [PATCH 1/3] disable external key server
 
 Upstream-Status: Pending
 
@@ -12,16 +15,29 @@ it's easy enough to do by enabling the necessary macros.
 
 Signed-off-by: yzhu1 <yanjun.zhu@windriver.com>
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ macros/macros.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/macros/macros.in b/macros/macros.in
+index 23c267e..7076371 100644
 --- a/macros/macros.in
 +++ b/macros/macros.in
-@@ -546,8 +546,8 @@ $_arbitrary_tags_tests	Foo:Bar
+@@ -562,10 +562,10 @@ $_arbitrary_tags_tests	Foo:Bar
+ 
  # Horowitz Key Protocol server configuration
  #
+-%_hkp_keyserver         hkp://keys.rpm5.org
++#%_hkp_keyserver         hkp://keys.rpm5.org
  #%_hkp_keyserver         hkp://keys.n3npq.net
--%_hkp_keyserver         hkp://pool.sks-keyservers.net
+ #%_hkp_keyserver         hkp://pool.sks-keyservers.net
 -%_hkp_keyserver_query   %{_hkp_keyserver}/pks/lookup?op=get&search=
-+#%_hkp_keyserver         hkp://pool.sks-keyservers.net
 +#%_hkp_keyserver_query   %{_hkp_keyserver}/pks/lookup?op=get&search=
  
  
- %_nssdb_path	/etc/pki/nssdb
+ # NSS_InitContext() parameter configuration
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-lua-fix-print.patch b/meta/recipes-devtools/rpm/rpm/0002-Lua-print-statement-is-not-working-properly-inside-o.patch
similarity index 81%
rename from meta/recipes-devtools/rpm/rpm/rpm-lua-fix-print.patch
rename to meta/recipes-devtools/rpm/rpm/0002-Lua-print-statement-is-not-working-properly-inside-o.patch
index 7ab49e9..4d763d6 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-lua-fix-print.patch
+++ b/meta/recipes-devtools/rpm/rpm/0002-Lua-print-statement-is-not-working-properly-inside-o.patch
@@ -1,4 +1,8 @@
-Lua 'print' statement is not working properly inside of RPM 5
+From 05e17309a7ee3af56956715a310ede968b4f58b7 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 13 Aug 2015 17:46:10 +0300
+Subject: [PATCH 2/3] Lua 'print' statement is not working properly inside of
+ RPM 5
 
 The print statement should capture the output and send it to the script
 processing engine, and not display it directly to the screen.
@@ -9,19 +13,15 @@ Upstream-Status: backport (patchset 17671 from rpm5.org)
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-Index: rpm-5.4.14/CHANGES
-===================================================================
---- rpm-5.4.14.orig/CHANGES
-+++ rpm-5.4.14/CHANGES
-@@ -1,3 +1,4 @@
-+    - jbj: lua: fix: resurrect output capture with lua-5.2.
-     - jbj: verify: fix: broken logic for %ghost avoidance (Mark Hatle).
- 
- 5.4.13 -> 5.4.14:
-Index: rpm-5.4.14/rpmio/rpmlua.c
-===================================================================
---- rpm-5.4.14.orig/rpmio/rpmlua.c
-+++ rpm-5.4.14/rpmio/rpmlua.c
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ rpmio/rpmlua.c | 29 ++++++++++++++++++-----------
+ 1 file changed, 18 insertions(+), 11 deletions(-)
+
+diff --git a/rpmio/rpmlua.c b/rpmio/rpmlua.c
+index 04ca1bb..eb365a0 100644
+--- a/rpmio/rpmlua.c
++++ b/rpmio/rpmlua.c
 @@ -175,7 +175,7 @@ rpmlua rpmluaNew(void)
      };
      /*@=readonlytrans =nullassign @*/
@@ -74,7 +74,7 @@ Index: rpm-5.4.14/rpmio/rpmlua.c
      rpmluaSetData(lua, "lua", lua);
  
      /* load all standard RPM Lua script files */
-@@ -351,6 +354,9 @@ void rpmluaSetVar(rpmlua _lua, rpmluav v
+@@ -351,6 +354,9 @@ void rpmluaSetVar(rpmlua _lua, rpmluav var)
  #if defined(LUA_GLOBALSINDEX)
  	if (lua->pushsize == 0)
  	    lua_pushvalue(L, LUA_GLOBALSINDEX);
@@ -102,3 +102,6 @@ Index: rpm-5.4.14/rpmio/rpmlua.c
  	    if ((size_t)(lua->printbufused+sl+1) > lua->printbufsize) {
  		lua->printbufsize += sl+512;
  		lua->printbuf = (char *) xrealloc(lua->printbuf, lua->printbufsize);
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch b/meta/recipes-devtools/rpm/rpm/0003-Support-both-db5-and-db6.-db6-is-licensed-under-AGPL.patch
similarity index 83%
rename from meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch
rename to meta/recipes-devtools/rpm/rpm/0003-Support-both-db5-and-db6.-db6-is-licensed-under-AGPL.patch
index edb6ea2..651b646 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch
+++ b/meta/recipes-devtools/rpm/rpm/0003-Support-both-db5-and-db6.-db6-is-licensed-under-AGPL.patch
@@ -1,23 +1,32 @@
-Support both db5 and db6.
+From 36486c13ff7aa7e926458390d1fcbe960b0571af Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 13 Aug 2015 17:58:44 +0300
+Subject: [PATCH 3/3] Support both db5 and db6. db6 is licensed under AGPLv3,
+ and some people may want to avoid it for that reason.
 
 Upstream-status: Inappropriate [configuration]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-Index: rpm/configure.ac
-===================================================================
---- rpm.orig/configure.ac
-+++ rpm/configure.ac
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac | 93 +++++++++++++++++++++++++++++++++++++++++++++---------------
+ 1 file changed, 70 insertions(+), 23 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1d24cb7..cf0a4d9 100644
+--- a/configure.ac
++++ b/configure.ac
 @@ -547,8 +547,6 @@ else
      MYPATH=$PATH
  fi
  
--DBXY=db60
+-DBXY=db61
 -
  AC_PATH_PROG(__BASH, bash, %{_bindir}/bash, $MYPATH)
  AC_PATH_PROG(__BZIP2, bzip2, %{_bindir}/bzip2, $MYPATH)
  AC_PATH_PROG(__CAT, cat, /bin/cat, $MYPATH)
-@@ -560,22 +558,6 @@ AC_PATH_PROG(__CMAKE, cmake, %{_bindir}/
+@@ -560,22 +558,6 @@ AC_PATH_PROG(__CMAKE, cmake, %{_bindir}/cmake, $MYPATH)
  AC_PATH_PROG(__CPIO, cpio, /bin/cpio, $MYPATH)
  AC_PATH_PROG(__CURL, curl, %{_bindir}/curl, $MYPATH)
  AC_PATH_PROG(__CVS, cvs, %{_bindir}/cvs, $MYPATH)
@@ -40,28 +49,27 @@ Index: rpm/configure.ac
  AC_PATH_PROG(__DIFF, diff, /bin/diff, $MYPATH)
  AC_PATH_PROG(__DITTO, ditto, %{_bindir}/ditto, $MYPATH)
  AC_PATH_PROG(__FILE, file, %{_bindir}/file, $MYPATH)
-@@ -1604,13 +1586,18 @@ RPM_CHECK_LIB(
+@@ -1605,13 +1587,17 @@ RPM_CHECK_LIB(
  
  dnl # Berkeley-DB & SQLite
  DBLIBSRCS=""
 +DBXY=db
-+
  # XXX won't handle --includedir override
 -CPPFLAGS="${CPPFLAGS} -I${prefix}/include/${DBXY}"
 +CPPFLAGS_save="${CPPFLAGS}"
-+CPPFLAGS="${CPPFLAGS_save} -I${prefix}/include/db-6.0"
++CPPFLAGS="${CPPFLAGS_save} -I${prefix}/include/db-6.1"
 +with_db_save="${with_db}"
  RPM_CHECK_LIB(
      [Berkeley-DB], [db],
-     [db-6.0], [db_create], [db.h],
+     [db-6.1], [db_create], [db.h],
 -    [yes,external], [db3],
 +    [yes,external], [db6],
      [ DBLIBSRCS="$DBLIBSRCS db3.c"
-+      DBXY=db60
++      DBXY=db61
        AM_CONDITIONAL(WITH_DB, [ true ])
        AM_CONDITIONAL(WITH_DB_INTERNAL, [ test ".$RPM_CHECK_LIB_LOCATION" = .internal ])
        if test ".$RPM_CHECK_LIB_LOCATION" = .internal; then
-@@ -1619,10 +1606,32 @@ RPM_CHECK_LIB(
+@@ -1620,10 +1606,32 @@ RPM_CHECK_LIB(
            WITH_DB_SUBDIR=""
        fi
      ],
@@ -84,32 +92,32 @@ Index: rpm/configure.ac
 +              WITH_DB_SUBDIR=""
 +          fi
 +        ],
-+        [ AM_CONDITIONAL(WITH_DB, [ false ])
++       [ AM_CONDITIONAL(WITH_DB, [ false ])
 +          AM_CONDITIONAL(WITH_DB_INTERNAL, [ false ])
 +        ])
      ])
  
-+if test ".$ac_cv_lib_db_6_0_db_create" != .yes -a ".$ac_cv_lib_db_5_3_db_create" != .yes; then
++if test ".$ac_cv_lib_db_6_1_db_create" != .yes -a ".$ac_cv_lib_db_5_3_db_create" != .yes; then
 +    CPPFLAGS="${CPPFLAGS_save}"
 +fi
 +
  dnl # Sqlite external
  RPM_CHECK_LIB(
      [SQLite], [sqlite],
-@@ -1633,10 +1642,11 @@ RPM_CHECK_LIB(
+@@ -1633,10 +1641,11 @@ RPM_CHECK_LIB(
+     [])
  
- dnl # Sqlite 3.7.0.1 from db-5.1.19
- dnl XXX error: `db3' is already registered with AC_CONFIG_SUBDIRS.
-+if test ".$ac_cv_lib_db_6_0_db_create" = .yes; then
+ dnl # Sqlite 3.8.3.1 from db-6.1.19
++if test ".$ac_cv_lib_db_6_1_db_create" = .yes; then
  RPM_CHECK_LIB(
      [Berkeley-DB (+SQLite3)], [dbsql],
-     [db_sql-6.0], [sqlite3_open], [dbsql.h],
+     [db_sql-6.1], [sqlite3_open], [dbsql.h],
 -    [yes,external], [db3/sql],
 +    [yes,external], [db6/sql],
      [
        AM_CONDITIONAL(WITH_DBSQL, [ true ])
        AC_DEFINE(WITH_SQLITE, 1, [Define as 1 if building with SQLite library])
-@@ -1650,12 +1660,50 @@ RPM_CHECK_LIB(
+@@ -1650,12 +1659,50 @@ RPM_CHECK_LIB(
      ], [
        AM_CONDITIONAL(WITH_DBSQL, [ false ])
      ])
@@ -160,3 +168,6 @@ Index: rpm/configure.ac
  AC_ARG_WITH(db-largefile, AS_HELP_STRING([--with-db-largefile], [build Berkeley-DB with LARGEFILE support]))
  AC_ARG_WITH(db-mutex,     AS_HELP_STRING([--with-db-mutex=ARG], [build Berkeley-DB with MUTEX type ARG]))
  
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch b/meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch
index 9cd02a0..47470d2 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch
@@ -124,23 +124,3 @@ Index: rpm-5.4.14/build/files.c
      }
  
      ui32 = fl->totalFileSize;
-Index: rpm-5.4.14/lib/fsm.c
-===================================================================
---- rpm-5.4.14.orig/lib/fsm.c
-+++ rpm-5.4.14/lib/fsm.c
-@@ -904,6 +904,7 @@ int fsmMapAttrs(IOSM_t fsm)
- 
-     if (fi && i >= 0 && i < (int) fi->fc) {
- 	mode_t perms = (S_ISDIR(st->st_mode) ? fi->dperms : fi->fperms);
-+	ino_t finalInode = (fi->finodes ? (ino_t)fi->finodes[i] : 0);
- 	mode_t finalMode = (fi->fmodes ? (mode_t)fi->fmodes[i] : perms);
- 	dev_t finalRdev = (dev_t)(fi->frdevs ? fi->frdevs[i] : 0);
- 	rpmuint32_t finalMtime = (fi->fmtimes ? fi->fmtimes[i] : 0);
-@@ -943,6 +944,7 @@ int fsmMapAttrs(IOSM_t fsm)
- 	    if ((S_ISCHR(st->st_mode) || S_ISBLK(st->st_mode))
- 	    && st->st_nlink == 0)
- 		st->st_nlink = 1;
-+	    st->st_ino = finalInode;
- 	    st->st_rdev = finalRdev;
- 	    st->st_mtime = finalMtime;
- 	}
diff --git a/meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch b/meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch
deleted file mode 100644
index 5a70f14..0000000
--- a/meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 9e7b72ee0c994609975981e135fc18d0387aefb6 Mon Sep 17 00:00:00 2001
-From: jbj <jbj>
-Date: Wed, 14 May 2014 21:19:41 +0000
-Subject: [PATCH] - verify: fix: broken logic for %ghost avoidance (Mark
- Hatle).
-
-Upstream-status: backport
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
----
- CHANGES      | 1 +
- lib/verify.c | 3 +--
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Index: rpm-5.4.14/CHANGES
-===================================================================
---- rpm-5.4.14.orig/CHANGES
-+++ rpm-5.4.14/CHANGES
-@@ -1,3 +1,5 @@
-+    - jbj: verify: fix: broken logic for %ghost avoidance (Mark Hatle).
-+
- 5.4.13 -> 5.4.14:
-     - mooney: use __sun instead of __sun__ in #define (lp#1243472).
-     - mooney: rpmconstant: ensure linkage w Oracle Studio 12.3 (lp#1243469).
-Index: rpm-5.4.14/lib/verify.c
-===================================================================
---- rpm-5.4.14.orig/lib/verify.c
-+++ rpm-5.4.14/lib/verify.c
-@@ -588,8 +588,7 @@ uint32_t fc = rpmfiFC(fi);
- 	    continue;
- 
- 	/* If not verifying %ghost, skip ghost files. */
--	/* XXX the broken!!! logic disables %ghost queries always. */
--	if (!(FF_ISSET(qva->qva_fflags, GHOST) && FF_ISSET(fflags, GHOST)))
-+	if (!FF_ISSET(qva->qva_fflags, GHOST) && FF_ISSET(fflags, GHOST))
- 	    continue;
- 
- 	/* Gather per-file data into a carrier. */
diff --git a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
index 8903f3b..f6aebc6 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
@@ -106,7 +106,6 @@ SRC_URI = "cvs://anonymous@rpm5.org/cvs;tag=rpm-5_4;module=rpm \
 	   file://rpm-hardlink-segfault-fix.patch \
 	   file://rpm-payload-use-hashed-inode.patch \
 	   file://rpm-fix-logio-cp.patch \
-	   file://rpm-db5-or-db6.patch \
 	   file://rpm-rpmpgp-fix.patch \
 	   file://rpm-disable-Wno-override-init.patch \
 	   file://rpm-realpath.patch \
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.15.bb
similarity index 97%
rename from meta/recipes-devtools/rpm/rpm_5.4.14.bb
rename to meta/recipes-devtools/rpm/rpm_5.4.15.bb
index ddbdcb9..9ccb1dd 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.15.bb
@@ -42,7 +42,7 @@ DEPENDS = "libpcre attr acl popt ossp-uuid file byacc-native"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
-SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;extract=rpm-5.4.14.tar.gz \
+SRC_URI = "http://rpm5.org/files/rpm/rpm-5.4/rpm-5.4.15-0.20140824.src.rpm;extract=rpm-5.4.15.tar.gz \
 	   file://rpm-log-auto-rm.patch \
 	   file://rpm-db-reduce.patch \
 	   file://perfile_rpmdeps.sh \
@@ -82,19 +82,18 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
 	   file://rpm-platform-file-fix.patch \
 	   file://rpm-lsb-compatibility.patch \
 	   file://rpm-tag-generate-endian-conversion-fix.patch \
-	   file://verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch \
 	   file://rpm-hardlink-segfault-fix.patch \
 	   file://rpm-payload-use-hashed-inode.patch \
 	   file://rpm-fix-logio-cp.patch \
-	   file://rpm-db5-or-db6.patch \
 	   file://rpm-disable-Wno-override-init.patch \
 	   file://rpmqv_cc_b_gone.patch \
 	   file://rpm-realpath.patch \
 	   file://0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch \
 	   file://no-ldflags-in-pkgconfig.patch \
-	   file://rpm-lua-fix-print.patch \
 	   file://rpm-check-rootpath-reasonableness.patch \
-	   file://rpm-macros.in-disable-external-key-server.patch \
+	   file://0001-disable-external-key-server.patch \
+	   file://0002-Lua-print-statement-is-not-working-properly-inside-o.patch \
+	   file://0003-Support-both-db5-and-db6.-db6-is-licensed-under-AGPL.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
@@ -102,8 +101,8 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
 # to process certain package feeds.
 #SRC_URI += "file://rpm-debug-platform.patch"
 
-SRC_URI[md5sum] = "25093d399a0b5d1342d24900a91b347d"
-SRC_URI[sha256sum] = "676e3ab41f72e3b504e04109cfb565a300742f56a7da084f202013b30eeae467"
+SRC_URI[md5sum] = "d53782842ac11b3100a43fb2958c9bc0"
+SRC_URI[sha256sum] = "d4ae5e9ed5df8ab9931b660f491418d20ab5c4d72eb17ed9055b80b71ef6c4ee"
 
 inherit autotools gettext
 
-- 
2.1.4


