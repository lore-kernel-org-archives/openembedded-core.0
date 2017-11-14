Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A81F5784C4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 15:26:28 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 07:26:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; 
   d="scan'208";a="1453451"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 14 Nov 2017 07:26:29 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 17:26:40 +0200
Message-Id: <20171114152640.773-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114152640.773-1-alexander.kanavin@linux.intel.com>
References: <20171114152640.773-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/2] rpm: update to 4.14.0
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
X-List-Received-Date: Tue, 14 Nov 2017 15:26:28 -0000

Previously oe-core had a development snapshot of rpm, it's better to update
to something more stable.

Removed patches:
0001-Add-PYTHON_ABI-when-searching-for-python-libraries.patch
(upstream is using pkg-config)
0001-When-nice-value-cannot-be-reset-issue-a-notice-inste.patch
(functionality has been moved to a plugin, we disable plugins
for rpm-native)
0012-Use-conditional-to-access-_docdir-in-macros.in.patch
(merged upstream)

Changed patches:
0001-Fix-build-with-musl-C-library.patch
(one previous musl issue has been resolved upstream; another has been added)

Rest of the patches are trivial rebases.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...N_ABI-when-searching-for-python-libraries.patch | 30 ----------
 ...code-lib-rpm-as-the-installation-path-for.patch | 20 +++----
 .../files/0001-Fix-build-with-musl-C-library.patch | 66 +++++++---------------
 ...alue-cannot-be-reset-issue-a-notice-inste.patch | 31 ----------
 ...c-remove-static-local-variables-from-buil.patch | 54 +++++++++---------
 ...ire-that-ELF-binaries-are-executable-to-b.patch | 11 ++--
 ...onditional-to-access-_docdir-in-macros.in.patch | 36 ------------
 .../0013-Add-a-new-option-alldeps-to-rpmdeps.patch | 17 +++---
 .../rpm/{rpm_git.bb => rpm_4.14.0.bb}              |  9 +--
 9 files changed, 75 insertions(+), 199 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-Add-PYTHON_ABI-when-searching-for-python-libraries.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-When-nice-value-cannot-be-reset-issue-a-notice-inste.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0012-Use-conditional-to-access-_docdir-in-macros.in.patch
 rename meta/recipes-devtools/rpm/{rpm_git.bb => rpm_4.14.0.bb} (92%)

diff --git a/meta/recipes-devtools/rpm/files/0001-Add-PYTHON_ABI-when-searching-for-python-libraries.patch b/meta/recipes-devtools/rpm/files/0001-Add-PYTHON_ABI-when-searching-for-python-libraries.patch
deleted file mode 100644
index b809332f217..00000000000
--- a/meta/recipes-devtools/rpm/files/0001-Add-PYTHON_ABI-when-searching-for-python-libraries.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 36cf0ff26ece53e529e8b4f2d2f09acd8794b055 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 24 Mar 2017 15:35:47 +0200
-Subject: [PATCH] Add PYTHON_ABI when searching for python libraries.
-
-It has a value of 'm' when using Python3, and so without it
-configure will not find the libraries.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9c58467c1..a506ec819 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -642,7 +642,7 @@ AS_IF([test "$enable_python" = yes],[
-       ])
-     CPPFLAGS="$save_CPPFLAGS"
-     save_LIBS="$LIBS"
--    AC_SEARCH_LIBS([Py_Main],[python${PYTHON_VERSION} python],[
-+    AC_SEARCH_LIBS([Py_Main],[python${PYTHON_VERSION}${PYTHON_ABI} python],[
-       WITH_PYTHON_LIB="$ac_res"
-     ],[AC_MSG_ERROR([missing python library])
-     ])
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
index 1f61acaf431..d7b1145bc5b 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
@@ -1,10 +1,10 @@
-From d82691b8d58201dd03e30585daacd8ffd1556ae2 Mon Sep 17 00:00:00 2001
+From 2b1a3f900f15034943fc41661eaab41bcc0d4d84 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 27 Feb 2017 09:43:30 +0200
-Subject: [PATCH] Do not hardcode "lib/rpm" as the installation path for
+Subject: [PATCH 06/15] Do not hardcode "lib/rpm" as the installation path for
  default configuration and macros.
 
-Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/263]
+Upstream-Status: Denied [https://github.com/rpm-software-management/rpm/pull/263]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 4f3be8770..92ffd3d68 100644
+index 373d69484..c04a2e8d1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -875,7 +875,7 @@ else
+@@ -1038,7 +1038,7 @@ else
      usrprefix=$prefix
  fi
  
@@ -27,10 +27,10 @@ index 4f3be8770..92ffd3d68 100644
  
  AC_SUBST(OBJDUMP)
 diff --git a/macros.in b/macros.in
-index c6d5a6b03..84ae25275 100644
+index 3f8dbba61..da4812540 100644
 --- a/macros.in
 +++ b/macros.in
-@@ -877,7 +877,7 @@ package or when debugging this package.\
+@@ -954,7 +954,7 @@ package or when debugging this package.\
  %_sharedstatedir	%{_prefix}/com
  %_localstatedir		%{_prefix}/var
  %_lib			lib
@@ -40,7 +40,7 @@ index c6d5a6b03..84ae25275 100644
  %_infodir		%{_datadir}/info
  %_mandir		%{_datadir}/man
 diff --git a/rpm.am b/rpm.am
-index 1f43ad8a0..6854ff6ba 100644
+index f0df0202f..37205a5eb 100644
 --- a/rpm.am
 +++ b/rpm.am
 @@ -1,10 +1,10 @@
@@ -55,7 +55,7 @@ index 1f43ad8a0..6854ff6ba 100644
 +rpmconfigdir = $(libdir)/rpm
  
  # Libtool version (current-revision-age) for all our libraries
- rpm_version_info = 7:0:0
+ rpm_version_info = 8:0:0
 -- 
-2.11.0
+2.14.2
 
diff --git a/meta/recipes-devtools/rpm/files/0001-Fix-build-with-musl-C-library.patch b/meta/recipes-devtools/rpm/files/0001-Fix-build-with-musl-C-library.patch
index edf9ec08940..0b1d6298a94 100644
--- a/meta/recipes-devtools/rpm/files/0001-Fix-build-with-musl-C-library.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Fix-build-with-musl-C-library.patch
@@ -1,24 +1,21 @@
-From 211c2d11200e6657132c52e7ac68f8c118231262 Mon Sep 17 00:00:00 2001
+From d076de030deb9cafd9b2e82be5d506cebdefad0b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 27 Feb 2017 14:43:21 +0200
-Subject: [PATCH] Fix build with musl C library.
+Subject: [PATCH 1/9] Fix build with musl C library.
 
-Upstream-Status: Inappropriate [problem already solved in master branch]
+Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
-
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
- configure.ac        | 3 ++-
- misc/Makefile.am    | 3 +--
- misc/rpmxprogname.c | 3 +--
- 3 files changed, 4 insertions(+), 5 deletions(-)
+ configure.ac       | 3 ++-
+ rpmio/digest_nss.c | 1 +
+ 2 files changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 92ffd3d68..9c58467c1 100644
+index c04a2e8d1..c9d9ac16d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -229,6 +229,7 @@ AC_SEARCH_LIBS(dlopen, [dl])
+@@ -255,6 +255,7 @@ AC_SEARCH_LIBS(dlopen, [dl])
  # Check for libelf library. Prefer external, otherwise none.
  WITH_LIBELF_LIB=
  AC_CHECK_HEADER([libelf.h])
@@ -26,7 +23,7 @@ index 92ffd3d68..9c58467c1 100644
  AC_CHECK_HEADERS([gelf.h], [
  	AC_CHECK_LIB(elf, gelf_getvernaux, [
  	    AC_DEFINE(HAVE_LIBELF, 1, [Define to 1 if you have the 'elf' library (-lelf).])
-@@ -237,7 +238,7 @@ AC_CHECK_HEADERS([gelf.h], [
+@@ -263,7 +264,7 @@ AC_CHECK_HEADERS([gelf.h], [
  	])
  ])
  AC_SUBST(WITH_LIBELF_LIB)
@@ -35,40 +32,17 @@ index 92ffd3d68..9c58467c1 100644
  
  AC_CHECK_HEADERS([dwarf.h], [
    WITH_LIBDWARF=yes
-diff --git a/misc/Makefile.am b/misc/Makefile.am
-index 8bf0093d9..b9db3d31a 100644
---- a/misc/Makefile.am
-+++ b/misc/Makefile.am
-@@ -5,10 +5,9 @@ AM_CPPFLAGS += -I$(top_srcdir)/misc
- 
- EXTRA_DIST = \
- 	fnmatch.c	fnmatch.h \
--	rpmxprogname.c	rpmxprogname.h \
- 	stpcpy.c	stpncpy.c
- 
- noinst_LTLIBRARIES = libmisc.la
- 
--libmisc_la_SOURCES = fts.c fts.h
-+libmisc_la_SOURCES = fts.c fts.h rpmxprogname.c rpmxprogname.h
- libmisc_la_LIBADD = @LTLIBOBJS@
-diff --git a/misc/rpmxprogname.c b/misc/rpmxprogname.c
-index f89600613..e94625ea8 100644
---- a/misc/rpmxprogname.c
-+++ b/misc/rpmxprogname.c
-@@ -13,7 +13,7 @@ char *_rpmxgetprogname(void)
- {
-   const char *empty = "";
- 
--  if (_rpmxprognam != NULL) /* never return NULL string */
-+  if (_rpmxprogname != NULL) /* never return NULL string */
-     return _rpmxprogname;
-   else
-     return empty;
-@@ -30,4 +30,3 @@ void _rpmxsetprogname(const char *pn)
-   }
- }
+diff --git a/rpmio/digest_nss.c b/rpmio/digest_nss.c
+index 992d9acf6..e11920e3e 100644
+--- a/rpmio/digest_nss.c
++++ b/rpmio/digest_nss.c
+@@ -1,5 +1,6 @@
+ #include "system.h"
  
--#endif /* _RPMXPROGNAME_H */
++#include <signal.h>
+ #include <pthread.h>
+ #include <nss.h>
+ #include <sechash.h>
 -- 
-2.11.0
+2.14.2
 
diff --git a/meta/recipes-devtools/rpm/files/0001-When-nice-value-cannot-be-reset-issue-a-notice-inste.patch b/meta/recipes-devtools/rpm/files/0001-When-nice-value-cannot-be-reset-issue-a-notice-inste.patch
deleted file mode 100644
index 9648cac7c9b..00000000000
--- a/meta/recipes-devtools/rpm/files/0001-When-nice-value-cannot-be-reset-issue-a-notice-inste.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d42ece6fa15b98d7f9221b90b85b78631df2c0a0 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 14 Feb 2017 13:51:19 +0200
-Subject: [PATCH] When nice value cannot be reset, issue a notice instead of a
- warning
-
-Otherwise build logs on the autobuilder get very clutter, as it
-doesn't allow the nice value to be reset for some reason.
-
-Upstream-Status: Inappropriate [oe specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- lib/rpmscript.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/rpmscript.c b/lib/rpmscript.c
-index 5e1e99906..3975aead8 100644
---- a/lib/rpmscript.c
-+++ b/lib/rpmscript.c
-@@ -347,7 +347,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_const_t prefixes,
-         int ret;
-         ret = setpriority(PRIO_PROCESS, 0, 0);
-         if (ret == -1) {
--            rpmlog(RPMLOG_WARNING, _("Unable to reset nice value: %s"),
-+            rpmlog(RPMLOG_NOTICE, _("Unable to reset nice value: %s\n"),
-                 strerror(errno));
-         }
- 
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch b/meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
index 64a5651f7e1..8989dcebd1e 100644
--- a/meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
+++ b/meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
@@ -1,7 +1,7 @@
-From ec305795a302d226343e69031ff2024dfcde69c0 Mon Sep 17 00:00:00 2001
+From 8ce9fbab2990609bdace457e146160334e931c89 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 8 Jun 2017 17:08:09 +0300
-Subject: [PATCH 3/3] build/pack.c: remove static local variables from
+Subject: [PATCH 14/15] build/pack.c: remove static local variables from
  buildHost() and getBuildTime()
 
 Their use is causing difficult to diagnoze data races when building multiple
@@ -11,8 +11,8 @@ difficult to reason about code.
 Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/226]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
-
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  build/build.c             | 54 ++++++++++++++++++++++++++++--
  build/pack.c              | 84 +++++++++--------------------------------------
@@ -20,7 +20,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 74 insertions(+), 72 deletions(-)
 
 diff --git a/build/build.c b/build/build.c
-index 5f99c8db7..09a1311c5 100644
+index 81152e53e..6001f9e52 100644
 --- a/build/build.c
 +++ b/build/build.c
 @@ -6,6 +6,8 @@
@@ -83,7 +83,7 @@ index 5f99c8db7..09a1311c5 100644
  /**
   */
  static rpmRC doRmSource(rpmSpec spec)
-@@ -203,6 +249,9 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec, int what)
+@@ -201,6 +247,9 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec, int what)
      rpmRC rc = RPMRC_OK;
      int test = (what & RPMBUILD_NOBUILD);
      char *cookie = buildArgs->cookie ? xstrdup(buildArgs->cookie) : NULL;
@@ -93,7 +93,7 @@ index 5f99c8db7..09a1311c5 100644
  
      if (rpmExpandNumeric("%{?source_date_epoch_from_changelog}") &&
  	getenv("SOURCE_DATE_EPOCH") == NULL) {
-@@ -271,11 +320,11 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec, int what)
+@@ -269,11 +318,11 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec, int what)
  		goto exit;
  
  	if (((what & RPMBUILD_PACKAGESOURCE) && !test) &&
@@ -107,7 +107,7 @@ index 5f99c8db7..09a1311c5 100644
  		goto exit;
  	
  	if ((what & RPMBUILD_CLEAN) &&
-@@ -295,6 +344,7 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec, int what)
+@@ -293,6 +342,7 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec, int what)
  	(void) unlink(spec->specFile);
  
  exit:
@@ -116,7 +116,7 @@ index 5f99c8db7..09a1311c5 100644
      spec->rootDir = NULL;
      if (rc != RPMRC_OK && rpmlogGetNrecs() > 0) {
 diff --git a/build/pack.c b/build/pack.c
-index ed5b9ab4e..62427065a 100644
+index df15876ff..17a4b0905 100644
 --- a/build/pack.c
 +++ b/build/pack.c
 @@ -6,8 +6,6 @@
@@ -128,7 +128,7 @@ index ed5b9ab4e..62427065a 100644
  #include <sys/wait.h>
  
  #include <rpm/rpmlib.h>			/* RPMSIGTAG*, rpmReadPackageFile */
-@@ -151,57 +149,6 @@ exit:
+@@ -152,57 +150,6 @@ exit:
      return rc;
  }
  
@@ -186,9 +186,9 @@ index ed5b9ab4e..62427065a 100644
  static rpmRC processScriptFiles(rpmSpec spec, Package pkg)
  {
      struct TriggerFileEntry *p;
-@@ -308,7 +255,8 @@ static int haveRichDep(Package pkg)
- }
- 
+@@ -476,7 +423,8 @@ exit:
+  * order to how the RPM format is laid on disk.
+  */
  static rpmRC writeRPM(Package pkg, unsigned char ** pkgidp,
 -		      const char *fileName, char **cookie)
 +		      const char *fileName, char **cookie,
@@ -196,7 +196,7 @@ index ed5b9ab4e..62427065a 100644
  {
      FD_t fd = NULL;
      char * rpmio_flags = NULL;
-@@ -397,7 +345,7 @@ static rpmRC writeRPM(Package pkg, unsigned char ** pkgidp,
+@@ -500,7 +448,7 @@ static rpmRC writeRPM(Package pkg, unsigned char ** pkgidp,
  
      /* Create and add the cookie */
      if (cookie) {
@@ -204,8 +204,8 @@ index ed5b9ab4e..62427065a 100644
 +	rasprintf(cookie, "%s %d", buildHost, buildTime);
  	headerPutString(pkg->header, RPMTAG_COOKIE, *cookie);
      }
-     
-@@ -546,7 +494,7 @@ static rpmRC checkPackages(char *pkgcheck)
+ 
+@@ -641,7 +589,7 @@ static rpmRC checkPackages(char *pkgcheck)
      return RPMRC_OK;
  }
  
@@ -214,7 +214,7 @@ index ed5b9ab4e..62427065a 100644
  {
  	const char *errorString;
  	rpmRC rc = RPMRC_OK;
-@@ -565,8 +513,8 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
+@@ -660,8 +608,8 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
  	headerCopyTags(spec->packages->header, pkg->header, copyTags);
  	
  	headerPutString(pkg->header, RPMTAG_RPMVERSION, VERSION);
@@ -225,7 +225,7 @@ index ed5b9ab4e..62427065a 100644
  
  	if (spec->sourcePkgId != NULL) {
  	    headerPutBin(pkg->header, RPMTAG_SOURCEPKGID, spec->sourcePkgId,16);
-@@ -604,7 +552,7 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
+@@ -699,7 +647,7 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
  	    free(binRpm);
  	}
  
@@ -234,7 +234,7 @@ index ed5b9ab4e..62427065a 100644
  	if (rc == RPMRC_OK) {
  	    /* Do check each written package if enabled */
  	    char *pkgcheck = rpmExpand("%{?_build_pkgcheck} ", *filename, NULL);
-@@ -624,7 +572,7 @@ struct binaryPackageTaskData
+@@ -719,7 +667,7 @@ struct binaryPackageTaskData
      struct binaryPackageTaskData *next;
  };
  
@@ -243,7 +243,7 @@ index ed5b9ab4e..62427065a 100644
  {
      struct binaryPackageTaskData *tasks = NULL;
      struct binaryPackageTaskData *task = NULL;
-@@ -636,7 +584,7 @@ static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const c
+@@ -731,7 +679,7 @@ static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const c
          if (pkg == spec->packages) {
              // the first package needs to be processed ahead of others, as they copy
              // changelog data from it, and so otherwise data races would happen
@@ -252,7 +252,7 @@ index ed5b9ab4e..62427065a 100644
              rpmlog(RPMLOG_NOTICE, _("Finished binary package job, result %d, filename %s\n"), task->result, task->filename);
              tasks = task;
          }
-@@ -653,7 +601,7 @@ static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const c
+@@ -748,7 +696,7 @@ static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const c
          if (task != tasks)
          #pragma omp task
          {
@@ -261,7 +261,7 @@ index ed5b9ab4e..62427065a 100644
              rpmlog(RPMLOG_NOTICE, _("Finished binary package job, result %d, filename %s\n"), task->result, task->filename);
          }
      }
-@@ -671,11 +619,11 @@ static void freeBinaryPackageTasks(struct binaryPackageTaskData* tasks)
+@@ -766,11 +714,11 @@ static void freeBinaryPackageTasks(struct binaryPackageTaskData* tasks)
      }
  }
  
@@ -275,7 +275,7 @@ index ed5b9ab4e..62427065a 100644
  
      for (struct binaryPackageTaskData *task = tasks; task != NULL; task = task->next) {
          if (task->result == RPMRC_OK) {
-@@ -702,22 +650,22 @@ rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
+@@ -797,7 +745,7 @@ rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
      return RPMRC_OK;
  }
  
@@ -284,6 +284,7 @@ index ed5b9ab4e..62427065a 100644
  {
      Package sourcePkg = spec->sourcePackage;
      rpmRC rc;
+@@ -805,8 +753,8 @@ rpmRC packageSources(rpmSpec spec, char **cookie)
  
      /* Add some cruft */
      headerPutString(sourcePkg->header, RPMTAG_RPMVERSION, VERSION);
@@ -291,9 +292,10 @@ index ed5b9ab4e..62427065a 100644
 -    headerPutUint32(sourcePkg->header, RPMTAG_BUILDTIME, getBuildTime(), 1);
 +    headerPutString(sourcePkg->header, RPMTAG_BUILDHOST, buildHost);
 +    headerPutUint32(sourcePkg->header, RPMTAG_BUILDTIME, &buildTime, 1);
+     headerPutUint32(sourcePkg->header, RPMTAG_SOURCEPACKAGE, &one, 1);
  
      /* XXX this should be %_srpmdir */
-     {	char *fn = rpmGetPath("%{_srcrpmdir}/", spec->sourceRpmName,NULL);
+@@ -814,7 +762,7 @@ rpmRC packageSources(rpmSpec spec, char **cookie)
  	char *pkgcheck = rpmExpand("%{?_build_pkgcheck_srpm} ", fn, NULL);
  
  	spec->sourcePkgId = NULL;
@@ -303,10 +305,10 @@ index ed5b9ab4e..62427065a 100644
  	/* Do check SRPM package if enabled */
  	if (rc == RPMRC_OK && pkgcheck[0] != ' ') {
 diff --git a/build/rpmbuild_internal.h b/build/rpmbuild_internal.h
-index 8351a6a34..797337ca7 100644
+index 439b7d3b5..07e8338ad 100644
 --- a/build/rpmbuild_internal.h
 +++ b/build/rpmbuild_internal.h
-@@ -408,19 +408,23 @@ rpmRC processSourceFiles(rpmSpec spec, rpmBuildPkgFlags pkgFlags);
+@@ -427,19 +427,23 @@ rpmRC processSourceFiles(rpmSpec spec, rpmBuildPkgFlags pkgFlags);
   * @param spec		spec file control structure
   * @param cookie	build identifier "cookie" or NULL
   * @param cheating	was build shortcircuited?
@@ -333,5 +335,5 @@ index 8351a6a34..797337ca7 100644
  RPM_GNUC_INTERNAL
  int addLangTag(rpmSpec spec, Header h, rpmTagVal tag,
 -- 
-2.11.0
+2.14.2
 
diff --git a/meta/recipes-devtools/rpm/files/0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch b/meta/recipes-devtools/rpm/files/0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch
index c910a478eea..4ac5c38f063 100644
--- a/meta/recipes-devtools/rpm/files/0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch
+++ b/meta/recipes-devtools/rpm/files/0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch
@@ -1,7 +1,7 @@
-From d65d6e8760afbd7f70b22a1f3297a037bc475fea Mon Sep 17 00:00:00 2001
+From 5141d50d7b3d3c209a22c53deedb4ceef014401d Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Mon, 15 May 2017 10:21:08 +0200
-Subject: [PATCH 11/13] Do not require that ELF binaries are executable to be
+Subject: [PATCH 09/15] Do not require that ELF binaries are executable to be
  identifiable
 
 There is nothing that requires, e.g., a DSO to be executable, but it
@@ -14,19 +14,20 @@ or not.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+
 ---
  fileattrs/elf.attr | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/fileattrs/elf.attr b/fileattrs/elf.attr
-index 595b33e09..bac52649d 100644
+index 5805dd0ee..3516f309d 100644
 --- a/fileattrs/elf.attr
 +++ b/fileattrs/elf.attr
 @@ -1,4 +1,3 @@
  %__elf_provides		%{_rpmconfigdir}/elfdeps --provides %{?__filter_GLIBC_PRIVATE:--filter-private}
  %__elf_requires		%{_rpmconfigdir}/elfdeps --requires %{?__filter_GLIBC_PRIVATE:--filter-private}
- %__elf_magic		^(setuid )?(setgid )?(sticky )?ELF (32|64)-bit.*$
+ %__elf_magic		^(setuid,? )?(setgid,? )?(sticky )?ELF (32|64)-bit.*$
 -%__elf_flags		exeonly
 -- 
-2.12.0
+2.14.2
 
diff --git a/meta/recipes-devtools/rpm/files/0012-Use-conditional-to-access-_docdir-in-macros.in.patch b/meta/recipes-devtools/rpm/files/0012-Use-conditional-to-access-_docdir-in-macros.in.patch
deleted file mode 100644
index 996da90d43d..00000000000
--- a/meta/recipes-devtools/rpm/files/0012-Use-conditional-to-access-_docdir-in-macros.in.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 77808db4036dc4a012c47aca36255549ed764a6a Mon Sep 17 00:00:00 2001
-From: Peter Kjellerstedt <pkj@axis.com>
-Date: Tue, 16 May 2017 10:58:18 +0200
-Subject: [PATCH 12/13] Use conditional to access %{_docdir} in macros.in
-
-This avoids the following warning:
-
-warning: Ignoring invalid regex %{_docdir}
-
-when runing `rpmdeps -R <file>`, since %{_docdir} is only defined when
-parsing a spec file (in parseSpec()).
-
-Upstream-Status: Accepted [https://github.com/rpm-software-management/rpm/pull/216]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- macros.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/macros.in b/macros.in
-index 84ae25275..cca67a500 100644
---- a/macros.in
-+++ b/macros.in
-@@ -200,8 +200,8 @@ package or when debugging this package.\
- # Their purpouse is to set up global filtering for all packages. If you need
- # to set up specific filtering for your package use %__requires_exclude_from
- # and %__provides_exclude_from instead.
--%__global_requires_exclude_from		%{_docdir}
--%__global_provides_exclude_from		%{_docdir}
-+%__global_requires_exclude_from		%{?_docdir:%{_docdir}}
-+%__global_provides_exclude_from		%{?_docdir:%{_docdir}}
- 
- #	The path to the gzip executable (legacy, use %{__gzip} instead).
- %_gzipbin		%{__gzip}
--- 
-2.12.0
-
diff --git a/meta/recipes-devtools/rpm/files/0013-Add-a-new-option-alldeps-to-rpmdeps.patch b/meta/recipes-devtools/rpm/files/0013-Add-a-new-option-alldeps-to-rpmdeps.patch
index faaf62960c1..d84e8b54d8d 100644
--- a/meta/recipes-devtools/rpm/files/0013-Add-a-new-option-alldeps-to-rpmdeps.patch
+++ b/meta/recipes-devtools/rpm/files/0013-Add-a-new-option-alldeps-to-rpmdeps.patch
@@ -1,7 +1,7 @@
-From 3bf20a6116ae3e1a5a3a6907bee7e881b17efb2f Mon Sep 17 00:00:00 2001
+From ef9f8c17c3e5c35d3b55db9ca76b0fa0d6336421 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Mon, 15 May 2017 11:23:26 +0200
-Subject: [PATCH 13/13] Add a new option --alldeps to rpmdeps
+Subject: [PATCH 10/15] Add a new option --alldeps to rpmdeps
 
 This will send the output from rpmfcPrint() to stdout. This is an
 alternative to using the --rpmfcdebug option, which will send the same
@@ -12,6 +12,7 @@ output options, e.g., --requires, without affecting their output.
 
 Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/220]
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+
 ---
  build/rpmfc.c   | 27 ++++++++++++++-------------
  build/rpmfc.h   |  1 -
@@ -19,10 +20,10 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  3 files changed, 39 insertions(+), 33 deletions(-)
 
 diff --git a/build/rpmfc.c b/build/rpmfc.c
-index c8e2f876a..44f1cdc9a 100644
+index b8aea76d0..d04ffb297 100644
 --- a/build/rpmfc.c
 +++ b/build/rpmfc.c
-@@ -732,7 +732,6 @@ static rpm_color_t rpmfcColor(const char * fmstr)
+@@ -692,7 +692,6 @@ static rpm_color_t rpmfcColor(const char * fmstr)
  
  void rpmfcPrint(const char * msg, rpmfc fc, FILE * fp)
  {
@@ -30,7 +31,7 @@ index c8e2f876a..44f1cdc9a 100644
      int ndx;
      int dx;
      int fx;
-@@ -744,21 +743,23 @@ void rpmfcPrint(const char * msg, rpmfc fc, FILE * fp)
+@@ -704,21 +703,23 @@ void rpmfcPrint(const char * msg, rpmfc fc, FILE * fp)
  
      if (fc)
      for (fx = 0; fx < fc->nfiles; fx++) {
@@ -79,7 +80,7 @@ index dae8ea5b1..3d87b31cf 100644
   * @param fc		file classifier
   * @param fp		output file handle (NULL for stderr)
 diff --git a/tools/rpmdeps.c b/tools/rpmdeps.c
-index a414b6343..f260a38c4 100644
+index 419befce1..f260a38c4 100644
 --- a/tools/rpmdeps.c
 +++ b/tools/rpmdeps.c
 @@ -23,6 +23,8 @@ static int print_conflicts;
@@ -105,7 +106,7 @@ index a414b6343..f260a38c4 100644
  	goto exit;
  
 -    if (_rpmfc_debug)
--	rpmfcPrint(buf, fc, NULL);
+-	rpmfcPrint(NULL, fc, NULL);
 -
 -    if (print_provides)
 -	rpmdsPrint(NULL, rpmfcProvides(fc), stdout);
@@ -148,5 +149,5 @@ index a414b6343..f260a38c4 100644
      ec = 0;
  
 -- 
-2.12.0
+2.14.2
 
diff --git a/meta/recipes-devtools/rpm/rpm_git.bb b/meta/recipes-devtools/rpm/rpm_4.14.0.bb
similarity index 92%
rename from meta/recipes-devtools/rpm/rpm_git.bb
rename to meta/recipes-devtools/rpm/rpm_4.14.0.bb
index 7866314ad4b..e4e9c3e6341 100644
--- a/meta/recipes-devtools/rpm/rpm_git.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.0.bb
@@ -24,19 +24,16 @@ HOMEPAGE = "http://www.rpm.org"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5259151d26ff18e78023450a5ac8d96"
 
-SRC_URI = "git://github.com/rpm-software-management/rpm \
+SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
            file://0001-Do-not-read-config-files-from-HOME.patch \
            file://0001-When-cross-installing-execute-package-scriptlets-wit.patch \
            file://0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch \
            file://0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch \
-           file://0001-When-nice-value-cannot-be-reset-issue-a-notice-inste.patch \
            file://0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch \
            file://0001-Fix-build-with-musl-C-library.patch \
            file://0001-Add-a-color-setting-for-mips64_n32-binaries.patch \
-           file://0001-Add-PYTHON_ABI-when-searching-for-python-libraries.patch \
            file://0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch \
-           file://0012-Use-conditional-to-access-_docdir-in-macros.in.patch \
            file://0013-Add-a-new-option-alldeps-to-rpmdeps.patch \
            file://0001-Split-binary-package-building-into-a-separate-functi.patch \
            file://0002-Run-binary-package-creation-via-thread-pools.patch \
@@ -44,11 +41,9 @@ SRC_URI = "git://github.com/rpm-software-management/rpm \
            file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
            file://0001-perl-disable-auto-reqs.patch \
            "
-UPSTREAM_VERSION_UNKNOWN = "1"
 
-PV = "4.13.90+git${SRCPV}"
 PE = "1"
-SRCREV = "a8e51b3bb05c6acb1d9b2e3d34f859ddda1677be"
+SRCREV = "da3720f62e57648fb1dc2a632744d38866139971"
 
 S = "${WORKDIR}/git"
 
-- 
2.15.0


