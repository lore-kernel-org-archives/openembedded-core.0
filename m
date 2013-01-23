Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TxzOv-0007zv-OX
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 13:26:00 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 Jan 2013 04:10:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,521,1355126400"; d="scan'208";a="275597152"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.151])
	by orsmga002.jf.intel.com with ESMTP; 23 Jan 2013 04:10:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jan 2013 12:10:12 +0000
Message-Id: <af7f5dc02eab60f6c05a28c2b2c57d4edd370251.1358942978.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358942978.git.paul.eggleton@linux.intel.com>
References: <cover.1358942978.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1358942978.git.paul.eggleton@linux.intel.com>
References: <cover.1358942978.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/5] sat-solver: remove
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jan 2013 12:26:14 -0000
X-List-Received-Date: Wed, 23 Jan 2013 12:26:14 -0000

This was only needed by libzypp, which has itself been removed.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 ...fopen.c-Forward-port-to-zlib-1.2.6-gzFile.patch |   57 ---------
 .../sat-solver/sat-solver/cmake.patch              |   31 -----
 .../sat-solver/sat-solver/db5.patch                |   26 ----
 .../sat-solver/fix_gcc-4.6.0_compile_issue.patch   |  115 ------------------
 .../sat-solver/sat-solver/futimes.patch            |   32 -----
 .../sat-solver/sat-solver/sat-solver_core.patch    |  127 --------------------
 .../sat-solver/sat-solver_obsolete.patch           |   22 ----
 .../sat-solver/sat-solver/sat-solver_rpm5.patch    |   69 -----------
 meta/recipes-extended/sat-solver/sat-solver_git.bb |   67 -----------
 9 files changed, 546 deletions(-)
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/0001-sat_xfopen.c-Forward-port-to-zlib-1.2.6-gzFile.patch
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/cmake.patch
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/db5.patch
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/fix_gcc-4.6.0_compile_issue.patch
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/futimes.patch
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/sat-solver_core.patch
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/sat-solver_obsolete.patch
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/sat-solver_rpm5.patch
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver_git.bb

diff --git a/meta/recipes-extended/sat-solver/sat-solver/0001-sat_xfopen.c-Forward-port-to-zlib-1.2.6-gzFile.patch b/meta/recipes-extended/sat-solver/sat-solver/0001-sat_xfopen.c-Forward-port-to-zlib-1.2.6-gzFile.patch
deleted file mode 100644
index 402d16e..0000000
--- a/meta/recipes-extended/sat-solver/sat-solver/0001-sat_xfopen.c-Forward-port-to-zlib-1.2.6-gzFile.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From bbbb4fb9b7c85fde90608710dff09480696c6567 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 9 Feb 2012 16:01:56 -0800
-Subject: [PATCH] sat_xfopen.c: Forward port to zlib 1.2.6 gzFile
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- ext/sat_xfopen.c |   10 +++++-----
- 1 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/ext/sat_xfopen.c b/ext/sat_xfopen.c
-index cf943cf..b3d458d 100644
---- a/ext/sat_xfopen.c
-+++ b/ext/sat_xfopen.c
-@@ -16,16 +16,16 @@
- 
- static ssize_t cookie_gzread(void *cookie, char *buf, size_t nbytes)
- {
--  return gzread((gzFile *)cookie, buf, nbytes);
-+  return gzread((gzFile)cookie, buf, nbytes);
- }
- 
- static int
- cookie_gzclose(void *cookie)
- {
--  return gzclose((gzFile *)cookie);
-+  return gzclose((gzFile)cookie);
- }
- 
--static FILE *mygzfopen(gzFile* gzf)
-+static FILE *mygzfopen(gzFile gzf)
- {
- #ifdef HAVE_FUNOPEN
-   return funopen(
-@@ -49,7 +49,7 @@ FILE *
- sat_xfopen(const char *fn, const char *mode)
- {
-   char *suf;
--  gzFile *gzf;
-+  gzFile gzf;
- 
-   if (!fn)
-     return 0;
-@@ -68,7 +68,7 @@ FILE *
- sat_xfopen_fd(const char *fn, int fd, const char *mode)
- {
-   char *suf;
--  gzFile *gzf;
-+  gzFile gzf;
- 
-   suf = fn ? strrchr(fn, '.') : 0;
-   if (!mode)
--- 
-1.7.5.4
-
diff --git a/meta/recipes-extended/sat-solver/sat-solver/cmake.patch b/meta/recipes-extended/sat-solver/sat-solver/cmake.patch
deleted file mode 100644
index c1ec86a..0000000
--- a/meta/recipes-extended/sat-solver/sat-solver/cmake.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Enable debugging for all builds
-not building docs (need oxygen)
-
-8/19/2010 - created by Qing He <qing.he@intel.com>
-1/24/2011 - Disable Fedora/Debian checking/settings by Mark Hatle <mark.hatle@windriver.com>
-3/15/2011 - Updated to newer version of sat-solver by Mark Hatle <mark.hatle@windriver.com>
-3/16/2011 - Split original patch and simplify by Mark Hatle <mark.hatle@windriver.com>
-
-diff -ur git.orig2/CMakeLists.txt git/CMakeLists.txt
---- git.orig2/CMakeLists.txt	2011-03-16 16:29:43.532032285 -0500
-+++ git/CMakeLists.txt	2011-03-16 16:32:59.982034501 -0500
-@@ -177,7 +177,7 @@
- 
- MESSAGE(STATUS "Looking modules in ${CMAKE_MODULE_PATH}")
- 
--set ( CMAKE_C_FLAGS     "${CMAKE_C_FLAGS} -Werror -Wall" )
-+set ( CMAKE_C_FLAGS     "${CMAKE_C_FLAGS} -Werror -Wall -g" )
- set ( CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS} -g -O3" )
- set ( CMAKE_C_FLAGS_DEBUG     "${CMAKE_C_FLAGS} -g3 -O0" )
- 
-@@ -186,7 +186,7 @@
- ADD_SUBDIRECTORY(tools)
- ADD_SUBDIRECTORY(tests)
- ADD_SUBDIRECTORY(examples)
--ADD_SUBDIRECTORY(doc)
-+#ADD_SUBDIRECTORY(doc)
- 
- MESSAGE(STATUS "version: ${VERSION}")
- 
diff --git a/meta/recipes-extended/sat-solver/sat-solver/db5.patch b/meta/recipes-extended/sat-solver/sat-solver/db5.patch
deleted file mode 100644
index 6b67912..0000000
--- a/meta/recipes-extended/sat-solver/sat-solver/db5.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Upstream-Status: Pending
-
-RPM no longer includes an internal version of db, it now relies on the system
-version.  The system version in Poky is available at /usr/include/db51
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-rebased to sat-solver commit 9e1f2a097965debebc69cebf8ed73c6ff31a5220
-
-Signed-off-by: Qing He <qing.he@intel.com>
-
---- git/ext/repo_rpmdb.c.orig	2011-01-06 10:46:37.369900542 -0600
-+++ git/ext/repo_rpmdb.c	2011-01-06 10:48:35.482919434 -0600
-@@ -29,11 +29,7 @@
- #include <rpm/rpmdb.h>
- 
- #ifndef DB_CREATE
--# ifdef FEDORA
--#  include <db.h>
--# else
--#  include <rpm/db.h>
--# endif
-+#  include <db.h>
- #endif
- 
- #include "pool.h"
diff --git a/meta/recipes-extended/sat-solver/sat-solver/fix_gcc-4.6.0_compile_issue.patch b/meta/recipes-extended/sat-solver/sat-solver/fix_gcc-4.6.0_compile_issue.patch
deleted file mode 100644
index 0a55069..0000000
--- a/meta/recipes-extended/sat-solver/sat-solver/fix_gcc-4.6.0_compile_issue.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-Upstream-Status: Pending
-
-Fix the following compilation issues with gcc 4.6.0
-
-| /build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git/ext/repo_updateinfoxml.c: In function 'startElement':
-| /build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git/ext/repo_updateinfoxml.c:278:25: error: variable 'status' set but not used [-Werror=unused-but-set-variable]
-| /build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git/ext/repo_updateinfoxml.c:386:36: error: variable 'src' set but not used [-Werror=unused-but-set-variable]
-| cc1: all warnings being treated as errors
-| 
-| make[2]: *** [ext/CMakeFiles/satsolverext.dir/repo_updateinfoxml.o] Error 1
-| make[2]: *** Waiting for unfinished jobs....
-| /build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git/src/transaction.c: In function 'transaction_add_obsoleted':
-| /build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git/src/transaction.c:1933:21: error: variable 'oldcount' set but not used [-Werror=unused-but-set-variable]
-| cc1: all warnings being treated as errors
-| 
-| make[2]: *** [src/CMakeFiles/satsolver.dir/transaction.o] Error 1
-| make[2]: Leaving directory `/build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git'
-| make[1]: *** [src/CMakeFiles/satsolver.dir/all] Error 2
-| make[1]: *** Waiting for unfinished jobs....
-| /build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git/ext/repo_rpmdb.c: In function 'rpm_byfp':
-| /build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git/ext/repo_rpmdb.c:2406:20: error: variable 'headerend' set but not used [-Werror=unused-but-set-variable]
-| /build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git/ext/repo_rpmdb.c: In function 'parsekeydata':
-| /build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git/ext/repo_rpmdb.c:2833:29: error: variable 'scr' set but not used [-Werror=unused-but-set-variable]
-| /build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git/ext/repo_rpmdb.c:2669:7: error: variable 'useridl' set but not used [-Werror=unused-but-set-variable]
-| /build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git/ext/repo_rpmdb.c:2667:7: error: variable 'pubkeyl' set but not used [-Werror=unused-but-set-variable]
-| cc1: all warnings being treated as errors
-| 
-| make[2]: *** [ext/CMakeFiles/satsolverext.dir/repo_rpmdb.o] Error 1
-| make[2]: Leaving directory `/build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git'
-| make[1]: *** [ext/CMakeFiles/satsolverext.dir/all] Error 2
-| make[1]: Leaving directory `/build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/git'
-| make: *** [all] Error 2
-| FATAL: oe_runmake failed
-| ERROR: Function 'do_compile' failed (see /build_disk/poky_build/build_gcc_4.6.0/tmp/work/qemux86-poky-linux/sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9/temp/log.do_compile.21830 for further information)
-NOTE: package sat-solver-0.0-git1+0a7378d5f482f477a01cf1690d76871ab8bdcc32-r9: task do_compile: Failed
-
-Nitin A Kamble <nitin.a.kamble@intel.com> 2011/05/05
-
-Index: git/src/transaction.c
-===================================================================
---- git.orig/src/transaction.c
-+++ git/src/transaction.c
-@@ -1930,7 +1930,7 @@ transaction_add_obsoleted(Transaction *t
-   Repo *installed = pool->installed;
-   Id p;
-   Solvable *s;
--  int i, j, k, max, oldcount;
-+  int i, j, k, max;
-   Map done;
-   Queue obsq, *steps;
- 
-@@ -1945,7 +1945,6 @@ transaction_add_obsoleted(Transaction *t
-     return;
-   /* make room */
-   steps = &trans->steps;
--  oldcount = steps->count;
-   queue_insertn(steps, 0, max);
- 
-   /* now add em */
-Index: git/ext/repo_updateinfoxml.c
-===================================================================
---- git.orig/ext/repo_updateinfoxml.c
-+++ git/ext/repo_updateinfoxml.c
-@@ -275,7 +275,7 @@ startElement(void *userData, const char 
-        */
-     case STATE_UPDATE:
-       {
--	const char *from = 0, *status = 0, *type = 0, *version = 0;
-+	const char *from = 0, __attribute__((__unused__)) *status = 0, *type = 0, *version = 0;
- 	for (; *atts; atts += 2)
- 	  {
- 	    if (!strcmp(*atts, "from"))
-@@ -383,7 +383,7 @@ startElement(void *userData, const char 
-        */
-     case STATE_PACKAGE:
-       {
--	const char *arch = 0, *name = 0, *src = 0;
-+	const char *arch = 0, *name = 0, __attribute__((__unused__)) *src = 0;
- 	Id evr = makeevr_atts(pool, pd, atts); /* parse "epoch", "version", "release" */
- 	Id n, a = 0;
- 	Id rel_id;
-Index: git/ext/repo_rpmdb.c
-===================================================================
---- git.orig/ext/repo_rpmdb.c
-+++ git/ext/repo_rpmdb.c
-@@ -2403,7 +2403,7 @@ void *
- rpm_byfp(FILE *fp, const char *name, void **statep)
- {
-   struct rpm_by_state *state = *statep;
--  int headerstart, headerend;
-+  int headerstart, __attribute__((__unused__))headerend;
-   RpmHead *rpmhead;
-   int sigdsize, sigcnt, l;
-   unsigned char lead[4096];
-@@ -2664,9 +2664,9 @@ parsekeydata(Solvable *s, Repodata *data
-   unsigned char keyid[8];
-   unsigned int kcr = 0, maxex = 0;
-   unsigned char *pubkey = 0;
--  int pubkeyl = 0;
-+  int __attribute__((__unused__)) pubkeyl = 0;
-   unsigned char *userid = 0;
--  int useridl = 0;
-+  int __attribute__((__unused__)) useridl = 0;
- 
-   for (; pl; p += l, pl -= l)
-     {
-@@ -2830,7 +2830,7 @@ parsekeydata(Solvable *s, Repodata *data
- 	    {
- 	      int j, ql, haveissuer;
- 	      unsigned char *q;
--	      unsigned int ex = 0, scr = 0;
-+	      unsigned int ex = 0, __attribute__((__unused__))scr = 0;
- 	      unsigned char issuer[8];
- 
- 	      // printf("V4 signature packet\n");
diff --git a/meta/recipes-extended/sat-solver/sat-solver/futimes.patch b/meta/recipes-extended/sat-solver/sat-solver/futimes.patch
deleted file mode 100644
index b24d852..0000000
--- a/meta/recipes-extended/sat-solver/sat-solver/futimes.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-This patch uses utimes instead of futimes for uclibc
-since futimes is not available
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: git/examples/solv.c
-===================================================================
---- git.orig/examples/solv.c	2012-06-01 12:06:22.041552848 -0700
-+++ git/examples/solv.c	2012-06-01 12:49:17.417677449 -0700
-@@ -1027,7 +1027,8 @@
-   int flags;
- 
-   cinfo = repo->appdata;
--  if (!(fp = fopen(calccachepath(repo, repoext), "r")))
-+  const char* fname = calccachepath(repo, repoext);
-+  if (!(fp = fopen(fname, "r")))
-     return 0;
-   if (fseek(fp, -sizeof(mycookie), SEEK_END) || fread(mycookie, sizeof(mycookie), 1, fp) != 1)
-     {
-@@ -1068,7 +1069,11 @@
-       memcpy(cinfo->extcookie, myextcookie, sizeof(myextcookie));
-     }
-   if (mark)
-+#ifdef __UCLIBC__
-+    utimes(fname, 0);	/* try to set modification time */
-+#else
-     futimes(fileno(fp), 0);	/* try to set modification time */
-+#endif
-   fclose(fp);
-   return 1;
- }
diff --git a/meta/recipes-extended/sat-solver/sat-solver/sat-solver_core.patch b/meta/recipes-extended/sat-solver/sat-solver/sat-solver_core.patch
deleted file mode 100644
index 11bf5b0..0000000
--- a/meta/recipes-extended/sat-solver/sat-solver/sat-solver_core.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-Upstream-Status: Inappropriate [distribution]
-
-Fix "arch" integration with Poky.
-
-Add a missing "any" architecture type and update the semantics to use it.
-
-Disable the built-in archpolicies structure, and replace it with one
-we generate in the recipe.
-
-Also add poky semantics option in CMake.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-Signed-off-by: Qing He <qing.he@intel.com>
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 443281e..4456a87 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -45,6 +45,11 @@ MESSAGE(STATUS "Building for Debian")
- ADD_DEFINITIONS( -DDEBIAN -DDEBIAN_SEMANTICS)
- ENDIF ( DEBIAN )
- 
-+IF ( OE_CORE )
-+MESSAGE(STATUS "Building for OE core")
-+ADD_DEFINITIONS( -DOE_CORE -DOE_CORE_SEMANTICS)
-+ENDIF ( OE_CORE )
-+
- IF ( MULTI_SEMANTICS )
- MESSAGE(STATUS "Enabling multi dist support")
- ADD_DEFINITIONS( -DMULTI_SEMANTICS)
-diff --git a/src/knownid.h b/src/knownid.h
-index 7757ae0..4b8bee7 100644
---- a/src/knownid.h
-+++ b/src/knownid.h
-@@ -57,6 +57,7 @@ KNOWNID(SYSTEM_SYSTEM,			"system:system"),
- KNOWNID(ARCH_SRC,			"src"),
- KNOWNID(ARCH_NOSRC,			"nosrc"),
- KNOWNID(ARCH_NOARCH,			"noarch"),
-+KNOWNID(ARCH_ANY,			"any"),
- KNOWNID(ARCH_ALL,			"all"),
- 
- KNOWNID(REPOSITORY_SOLVABLES,		"repository:solvables"),
-diff --git a/src/policy.c b/src/policy.c
-index 55c8677..3356ff8 100644
---- a/src/policy.c
-+++ b/src/policy.c
-@@ -486,6 +486,13 @@ policy_illegal_archchange(Solver *solv, Solvable *s1, Solvable *s2)
-     }
- 
-   /* we allow changes to/from noarch */
-+#ifdef OE_CORE_SEMANTICS
-+  if (a1 == a2 || 
-+	a1 == ARCH_NOARCH || a2 == ARCH_NOARCH ||
-+	a1 == ARCH_ANY || a2 == ARCH_ANY ||
-+	a1 == ARCH_ALL || a2 == ARCH_ALL)
-+    return 0;
-+#else
- #ifndef DEBIAN_SEMANTICS
-   if (a1 == a2 || a1 == ARCH_NOARCH || a2 == ARCH_NOARCH)
-     return 0;
-@@ -493,6 +500,7 @@ policy_illegal_archchange(Solver *solv, Solvable *s1, Solvable *s2)
-   if (a1 == a2 || a1 == ARCH_ALL || a2 == ARCH_ALL)
-     return 0;
- #endif
-+#endif
-   if (!pool->id2arch)
-     return 0;
-   a1 = a1 <= pool->lastarch ? pool->id2arch[a1] : 0;
-diff --git a/src/poolarch.c b/src/poolarch.c
-index 34a14a3..2d7cd70 100644
---- a/src/poolarch.c
-+++ b/src/poolarch.c
-@@ -20,38 +20,8 @@
- #include "poolarch.h"
- #include "util.h"
- 
--const char *archpolicies[] = {
--  "x86_64",	"x86_64:i686:i586:i486:i386",
--  "i686",	"i686:i586:i486:i386",
--  "i586",	"i586:i486:i386",
--  "i486",	"i486:i386",
--  "i386",	"i386",
--  "s390x",	"s390x:s390",
--  "s390",	"s390",
--  "ia64",	"ia64:i686:i586:i486:i386",
--  "ppc64",	"ppc64:ppc",
--  "ppc",	"ppc",
--  "armv7nhl",	"armv7nhl:armv7hl",
--  "armv7hl",	"armv7hl",
--  "armv7l",	"armv7l:armv6l:armv5tejl:armv5tel:armv5l:armv4tl:armv4l:armv3l",
--  "armv6l",	"armv6l:armv5tejl:armv5tel:armv5l:armv4tl:armv4l:armv3l",
--  "armv5tejl",	"armv5tejl:armv5tel:armv5l:armv4tl:armv4l:armv3l",
--  "armv5tel",	"armv5tel:armv5l:armv4tl:armv4l:armv3l",
--  "armv5l",	"armv5l:armv4tl:armv4l:armv3l",
--  "armv4tl",	"armv4tl:armv4l:armv3l",
--  "armv4l",	"armv4l:armv3l",
--  "armv3l",	"armv3l",
--  "sh3",	"sh3",
--  "sh4",	"sh4",
--  "sh4a",	"sh4a:sh4",
--  "sparc64v",	"sparc64v:sparc64:sparcv9v:sparcv9:sparcv8:sparc",
--  "sparc64",	"sparc64:sparcv9:sparcv8:sparc",
--  "sparcv9v",	"sparcv9v:sparcv9:sparcv8:sparc",
--  "sparcv9",	"sparcv9:sparcv8:sparc",
--  "sparcv8",	"sparcv8:sparc",
--  "sparc",	"sparc",
--  0
--};
-+/* Provide the const char *archpolicies structure */
-+#include "core-arch.h"
- 
- void
- pool_setarch(Pool *pool, const char *arch)
-@@ -71,10 +41,10 @@ pool_setarch(Pool *pool, const char *arch)
-       pool->lastarch = 0;
-       return;
-     }
--#ifndef DEBIAN_SEMANTICS
--  id = ARCH_NOARCH;
--#else
-+#if defined(DEBIAN_SEMANTICS) || defined(OE_CORE_SEMANTICS)
-   id = ARCH_ALL;
-+#else
-+  id = ARCH_NOARCH;
- #endif
-   lastarch = id + 255;
-   id2arch = sat_calloc(lastarch + 1, sizeof(Id));
diff --git a/meta/recipes-extended/sat-solver/sat-solver/sat-solver_obsolete.patch b/meta/recipes-extended/sat-solver/sat-solver/sat-solver_obsolete.patch
deleted file mode 100644
index 60483e9..0000000
--- a/meta/recipes-extended/sat-solver/sat-solver/sat-solver_obsolete.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Pending
-
-Fix obsolete settings with RPM5.
-
-The following patch is from Michael Schroeder <mls@suse.de>
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-diff -ur git.orig/src/pool.c git/src/pool.c
---- git.orig/src/pool.c	2011-03-25 15:49:34.885834194 -0500
-+++ git/src/pool.c	2011-03-28 10:55:13.138786524 -0500
-@@ -70,6 +70,10 @@
-   pool->disttype = DISTTYPE_DEB;
- # endif
- #endif
-+#ifdef RPM5
-+  pool->obsoleteusesprovides = 1;
-+  pool->implicitobsoleteusesprovides = 1;
-+#endif
-   return pool;
- }
- 
diff --git a/meta/recipes-extended/sat-solver/sat-solver/sat-solver_rpm5.patch b/meta/recipes-extended/sat-solver/sat-solver/sat-solver_rpm5.patch
deleted file mode 100644
index d59c513..0000000
--- a/meta/recipes-extended/sat-solver/sat-solver/sat-solver_rpm5.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-Upstream-Status: Pending
-
-Add RPM5 configuration support
-
-Update the cmake configuration to detect additional files needed by RPM5.
-
-Original work by Qing He <qing.he@intel.com>.
-
-Merged and updated to make this more likely to be accepted upstream.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-diff -ur git.orig/CMakeLists.txt git/CMakeLists.txt
---- git.orig/CMakeLists.txt	2011-03-16 16:16:29.152786178 -0500
-+++ git/CMakeLists.txt	2011-03-16 16:29:43.532032285 -0500
-@@ -50,7 +50,16 @@
- ADD_DEFINITIONS( -DMULTI_SEMANTICS)
- ENDIF ( MULTI_SEMANTICS )
- 
--IF ( NOT DEBIAN )
-+if ( RPM5 )
-+MESSAGE(STATUS "Enabling RPM 5 support")
-+ADD_DEFINITIONS( -DRPM5)
-+
-+FIND_PACKAGE(PkgConfig REQUIRED)
-+PKG_CHECK_MODULES(RPM REQUIRED rpm)
-+INCLUDE_DIRECTORIES( ${RPM_INCLUDE_DIRS} )
-+ENDIF ( RPM5 )
-+
-+IF ( RPM5 OR NOT DEBIAN )
- FIND_LIBRARY(RPMDB_LIBRARY NAMES rpmdb)
- IF ( NOT RPMDB_LIBRARY )
- FIND_LIBRARY(RPMDB_LIBRARY NAMES rpm)
-@@ -59,13 +68,17 @@
- IF ( RPMIO_LIBRARY )
- SET( RPMDB_LIBRARY ${RPMIO_LIBRARY} ${RPMDB_LIBRARY} )
- ENDIF ( RPMIO_LIBRARY )
--IF ( FEDORA )
-+FIND_LIBRARY(RPMMISC_LIBRARY NAMES rpmmisc)
-+IF ( RPMMISC_LIBRARY )
-+SET ( RPMDB_LIBRARY ${RPMMISC_LIBRARY} ${RPMDB_LIBRARY} )
-+ENDIF ( RPMMISC_LIBRARY )
-+IF ( RPM5 OR FEDORA )
- FIND_LIBRARY(DB_LIBRARY NAMES db)
- IF ( DB_LIBRARY )
- SET( RPMDB_LIBRARY ${DB_LIBRARY} ${RPMDB_LIBRARY} )
- ENDIF ( DB_LIBRARY )
--ENDIF ( FEDORA )
--ENDIF ( NOT DEBIAN )
-+ENDIF ( RPM5 OR FEDORA )
-+ENDIF ( RPM5 OR NOT DEBIAN )
- 
- INCLUDE ( CheckFunctionExists )
- INCLUDE ( TestBigEndian )
-diff -ur git.orig/ext/repo_rpmdb.c git/ext/repo_rpmdb.c
---- git.orig/ext/repo_rpmdb.c	2011-03-16 18:03:55.401907738 -0500
-+++ git/ext/repo_rpmdb.c	2011-03-16 18:04:47.472989651 -0500
-@@ -3039,7 +3039,11 @@
-   repodata_set_str(data, s - s->repo->pool->solvables, PUBKEY_KEYID, keyid);
-   if (dig->pubkey.userid)
-     setutf8string(data, s - s->repo->pool->solvables, SOLVABLE_SUMMARY, dig->pubkey.userid);
-+#ifndef RPM5
-   (void)pgpFreeDig(dig);
-+#else
-+  (void)pgpDigFree(dig);
-+#endif
-   sat_free((void *)pkts);
-   return 1;
- }
diff --git a/meta/recipes-extended/sat-solver/sat-solver_git.bb b/meta/recipes-extended/sat-solver/sat-solver_git.bb
deleted file mode 100644
index 67503b7..0000000
--- a/meta/recipes-extended/sat-solver/sat-solver_git.bb
+++ /dev/null
@@ -1,67 +0,0 @@
-DESCRIPTION  = "Sat Solver"
-HOMEPAGE = "http://http://en.opensuse.org/openSUSE:Libzypp_satsolver"
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
-
-DEPENDS = "libcheck rpm zlib expat db"
-
-SRCREV = "0a7378d5f482f477a01cf1690d76871ab8bdcc32"
-PV = "0.0-git${SRCPV}"
-PR = "r14"
-
-PARALLEL_MAKE=""
-
-SRC_URI = "git://github.com/openSUSE/sat-solver.git;protocol=git \
-           file://sat-solver_rpm5.patch \
-           file://sat-solver_obsolete.patch \
-           file://cmake.patch \
-           file://db5.patch \
-           file://sat-solver_core.patch \
-           file://fix_gcc-4.6.0_compile_issue.patch \
-           file://0001-sat_xfopen.c-Forward-port-to-zlib-1.2.6-gzFile.patch \
-           file://futimes.patch \
-          "
-
-S = "${WORKDIR}/git"
-
-EXTRA_OECMAKE += "-DRPM5=RPM5 -DOE_CORE=OE_CORE"
-
-EXTRA_OECMAKE += " -DLIB=${@os.path.basename('${libdir}')}"
-
-TUNE_CCARGS_append_libc-uclibc = " -DUSE_OWN_QSORT=1 "
-
-inherit cmake pkgconfig
-
-RDEPENDS_${PN} = "rpm-libs"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-do_archgen () {
-	# We need to dynamically generate our arch file based on the machine
-	# configuration
-
-	INSTALL_PLATFORM_ARCHS=""
-	for each_arch in ${PACKAGE_ARCHS} ; do
-		case "$each_arch" in
-			all | any | noarch)
-				continue;;
-		esac
-		INSTALL_PLATFORM_ARCHS="`echo $each_arch | sed 's/-/_/g'` $INSTALL_PLATFORM_ARCHS"
-	done
-
-	echo "/* Automatically generated by the sat-solver recipe */" > src/core-arch.h
-	echo "const char *archpolicies[] = {" >> src/core-arch.h
-
-        set -- $INSTALL_PLATFORM_ARCHS
-
-        save_IFS=$IFS
-        IFS=:
-        while [ $# -gt 0 ]; do echo "  \"$1\",	"\""$*"\", >> src/core-arch.h ; shift; done
-        IFS=$save_IFS
-
-	echo "  0" >> src/core-arch.h
-	echo "};" >> src/core-arch.h
-}
-
-addtask archgen before do_configure after do_patch
-- 
1.7.10.4



