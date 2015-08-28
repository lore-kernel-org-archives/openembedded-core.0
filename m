Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0E44376CF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 12:17:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 28 Aug 2015 05:17:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,424,1437462000"; d="scan'208";a="550250980"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Aug 2015 05:17:32 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2015 15:18:51 +0300
Message-Id: <146137d99b3de1a21886a68cfa1cb470fb9e6f4a.1440763946.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
References: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
References: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] dpkg: update to 1.18.2
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
X-List-Received-Date: Fri, 28 Aug 2015 12:17:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

check_snprintf.patch has been dropped, because it seems to fix a problem
that doesn't anymore exist, and doesn't have any description of what the
problem was and how was it fixed.

tarfix.patch has been merged upstream.

The rest of the patches have been rebased to the new upstream release

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc                |  2 +-
 ...-do_package_write_deb-we-have-trees-of-h.patch} | 37 +++++++++++-------
 ...nux-wrs-kernel-version-which-has-characte.patch | 38 ++++++++++++++++++
 ...insts-expect-D-to-be-set-when-running-in.patch} | 29 +++++++++-----
 ...-function-doesn-t-work-properly-for-all-s.patch | 31 +++++++++++++++
 ...tch => 0005-dpkg-compiler.m4-remove-Wvla.patch} | 26 +++++++------
 .../dpkg/dpkg/check_snprintf.patch                 | 34 ----------------
 .../recipes-devtools/dpkg/dpkg/check_version.patch | 28 --------------
 .../dpkg/dpkg/fix-timestamps.patch                 | 21 ----------
 meta/recipes-devtools/dpkg/dpkg/tarfix.patch       | 45 ----------------------
 .../dpkg/{dpkg_1.17.25.bb => dpkg_1.18.2.bb}       | 14 +++----
 11 files changed, 133 insertions(+), 172 deletions(-)
 rename meta/recipes-devtools/dpkg/dpkg/{tar-error-code.patch => 0001-When-running-do_package_write_deb-we-have-trees-of-h.patch} (60%)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
 rename meta/recipes-devtools/dpkg/dpkg/{preinst.patch => 0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch} (59%)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
 rename meta/recipes-devtools/dpkg/dpkg/{no-vla-warning.patch => 0005-dpkg-compiler.m4-remove-Wvla.patch} (58%)
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/check_snprintf.patch
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/check_version.patch
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/fix-timestamps.patch
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/tarfix.patch
 rename meta/recipes-devtools/dpkg/{dpkg_1.17.25.bb => dpkg_1.18.2.bb} (49%)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 5db1fde..6eec2cde 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -4,7 +4,7 @@ SECTION = "base"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.xz"
 
-SRC_URI_append_class-native = " file://tar-error-code.patch"
+SRC_URI_append_class-native = " file://0001-When-running-do_package_write_deb-we-have-trees-of-h.patch"
 
 DEPENDS = "zlib bzip2 perl ncurses"
 DEPENDS_class-native = "bzip2-replacement-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
diff --git a/meta/recipes-devtools/dpkg/dpkg/tar-error-code.patch b/meta/recipes-devtools/dpkg/dpkg/0001-When-running-do_package_write_deb-we-have-trees-of-h.patch
similarity index 60%
rename from meta/recipes-devtools/dpkg/dpkg/tar-error-code.patch
rename to meta/recipes-devtools/dpkg/dpkg/0001-When-running-do_package_write_deb-we-have-trees-of-h.patch
index dcde508..6967ef4 100644
--- a/meta/recipes-devtools/dpkg/dpkg/tar-error-code.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-When-running-do_package_write_deb-we-have-trees-of-h.patch
@@ -1,7 +1,10 @@
-When running do_package_write_deb, we have trees of hardlinked files
-such as the dbg source files in ${PN}-dbg. If something makes another
-copy of one of those files (or deletes one), the number of links a file
-has changes and tar can notice this, e.g.:
+From d14ffd786993da60ca84c4812da8a6594a8c764e Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 26 Aug 2015 15:48:13 +0300
+Subject: [PATCH 1/5] When running do_package_write_deb, we have trees of
+ hardlinked files such as the dbg source files in ${PN}-dbg. If something
+ makes another copy of one of those files (or deletes one), the number of
+ links a file has changes and tar can notice this, e.g.:
 
 | DEBUG: Executing python function do_package_deb
 | dpkg-deb: building package `sed-ptest' in `/media/build1/poky/build/tmp/work/i586-poky-linux/sed/4.2.2-r0/deploy-debs/i586/sed-ptest_4.2.2-r0.3_i386.deb'.
@@ -15,13 +18,16 @@ place to avoid that kind of issue).
 
 Upstream-Status: Inappropriate
 RP 2015/3/27
+---
+ dpkg-deb/build.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
 
-Index: dpkg-1.17.21/dpkg-deb/build.c
-===================================================================
---- dpkg-1.17.21.orig/dpkg-deb/build.c
-+++ dpkg-1.17.21/dpkg-deb/build.c
-@@ -398,7 +398,7 @@ do_build(const char *const *argv)
-   bool subdir;
+diff --git a/dpkg-deb/build.c b/dpkg-deb/build.c
+index ea3d861..1589927 100644
+--- a/dpkg-deb/build.c
++++ b/dpkg-deb/build.c
+@@ -458,7 +458,7 @@ do_build(const char *const *argv)
+   char *debar;
    char *tfbuf;
    int arfd;
 -  int p1[2], p2[2], gzfd;
@@ -29,10 +35,10 @@ Index: dpkg-1.17.21/dpkg-deb/build.c
    pid_t c1, c2;
  
    /* Decode our arguments. */
-@@ -493,7 +493,9 @@ do_build(const char *const *argv)
+@@ -538,7 +538,9 @@ do_build(const char *const *argv)
    }
    close(p1[0]);
-   subproc_reap(c2, "gzip -9c", 0);
+   subproc_reap(c2, _("<compress> from tar -cf"), 0);
 -  subproc_reap(c1, "tar -cf", 0);
 +  rc = subproc_reap(c1, "tar -cf", SUBPROC_RETERROR);
 +  if (rc && rc != 1)
@@ -40,8 +46,8 @@ Index: dpkg-1.17.21/dpkg-deb/build.c
  
    if (lseek(gzfd, 0, SEEK_SET))
      ohshite(_("failed to rewind temporary file (%s)"), _("control member"));
-@@ -581,7 +583,10 @@ do_build(const char *const *argv)
-   /* All done, clean up wait for tar and gzip to finish their job. */
+@@ -626,7 +628,10 @@ do_build(const char *const *argv)
+   /* All done, clean up wait for tar and <compress> to finish their job. */
    close(p1[1]);
    subproc_reap(c2, _("<compress> from tar -cf"), 0);
 -  subproc_reap(c1, "tar -cf", 0);
@@ -52,3 +58,6 @@ Index: dpkg-1.17.21/dpkg-deb/build.c
    /* Okay, we have data.tar as well now, add it to the ar wrapper. */
    if (deb_format.major == 2) {
      char datamember[16 + 1];
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch b/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
new file mode 100644
index 0000000..231a6a2
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
@@ -0,0 +1,38 @@
+From b4ea54158c399874e12394ebc91afe98954695e2 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 26 Aug 2015 16:16:16 +0300
+Subject: [PATCH 2/5] Adapt to linux-wrs kernel version, which has character
+ '_' inside. Remove the first-char-digit-check (as the 1.15.8.5 version does).
+
+Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+Upstream-Status: Inappropriate [embedded specific]
+---
+ lib/dpkg/parsehelp.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/lib/dpkg/parsehelp.c b/lib/dpkg/parsehelp.c
+index 79b2908..7758aa5 100644
+--- a/lib/dpkg/parsehelp.c
++++ b/lib/dpkg/parsehelp.c
+@@ -235,14 +235,12 @@ parseversion(struct dpkg_version *rversion, const char *string,
+ 
+   /* XXX: Would be faster to use something like cisversion and cisrevision. */
+   ptr = rversion->version;
+-  if (*ptr && !c_isdigit(*ptr++))
+-    return dpkg_put_warn(err, _("version number does not start with digit"));
+   for (; *ptr; ptr++) {
+-    if (!c_isdigit(*ptr) && !c_isalpha(*ptr) && strchr(".-+~:", *ptr) == NULL)
++    if (!c_isdigit(*ptr) && !c_isalpha(*ptr) && strchr(".-+~:_", *ptr) == NULL)
+       return dpkg_put_warn(err, _("invalid character in version number"));
+   }
+   for (ptr = rversion->revision; *ptr; ptr++) {
+-    if (!c_isdigit(*ptr) && !c_isalpha(*ptr) && strchr(".+~", *ptr) == NULL)
++    if (!c_isdigit(*ptr) && !c_isalpha(*ptr) && strchr(".-+~_", *ptr) == NULL)
+       return dpkg_put_warn(err, _("invalid character in revision number"));
+   }
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/preinst.patch b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
similarity index 59%
rename from meta/recipes-devtools/dpkg/dpkg/preinst.patch
rename to meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
index 0549121..9f77c6c 100644
--- a/meta/recipes-devtools/dpkg/dpkg/preinst.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
@@ -1,16 +1,22 @@
-Our pre/postinsts expect $D to be set when running in a sysroot and
-don't expect a chroot. This matches up our system expectations with
-what dpkg does.
+From 24229971492515b64c81e8c6392e5dfbdc22b44c Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 26 Aug 2015 16:25:45 +0300
+Subject: [PATCH 3/5] Our pre/postinsts expect $D to be set when running in a
+ sysroot and don't expect a chroot. This matches up our system expectations
+ with what dpkg does.
 
 Upstream-Status: Inappropriate [OE Specific]
 
 RP 2011/12/07
+---
+ src/script.c | 31 ++-----------------------------
+ 1 file changed, 2 insertions(+), 29 deletions(-)
 
-Index: dpkg-1.17.1/src/script.c
-===================================================================
---- dpkg-1.17.1.orig/src/script.c
-+++ dpkg-1.17.1/src/script.c
-@@ -111,36 +111,9 @@ preexecscript(struct command *cmd)
+diff --git a/src/script.c b/src/script.c
+index a958145..24c49f9 100644
+--- a/src/script.c
++++ b/src/script.c
+@@ -100,36 +100,9 @@ maintscript_pre_exec(struct command *cmd)
  	size_t instdirl = strlen(instdir);
  
  	if (*instdir) {
@@ -20,12 +26,12 @@ Index: dpkg-1.17.1/src/script.c
 -			ohshite(_("unable to setenv for subprocesses"));
 -
 -		if (chroot(instdir))
--			ohshite(_("failed to chroot to `%.250s'"), instdir);
+-			ohshite(_("failed to chroot to '%.250s'"), instdir);
 -	}
 -	/* Switch to a known good directory to give the maintainer script
 -	 * a saner environment, also needed after the chroot(). */
 -	if (chdir("/"))
--		ohshite(_("failed to chdir to `%.255s'"), "/");
+-		ohshite(_("failed to chdir to '%.255s'"), "/");
 -	if (debug_has_flag(dbg_scripts)) {
 -		struct varbuf args = VARBUF_INIT;
 -		const char **argv = cmd->argv;
@@ -49,3 +55,6 @@ Index: dpkg-1.17.1/src/script.c
  }
  
  /**
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch b/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
new file mode 100644
index 0000000..56c85c7
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
@@ -0,0 +1,31 @@
+From adb6bfd0feeceaf030df0debe3343d7f73e708a0 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 26 Aug 2015 16:27:45 +0300
+Subject: [PATCH 4/5] The lutimes function doesn't work properly for all
+ systems.
+
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+Upstream-Status: Inappropriate [embedded specific]
+---
+ src/archives.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/archives.c b/src/archives.c
+index bff5f14..b711013 100644
+--- a/src/archives.c
++++ b/src/archives.c
+@@ -449,8 +449,9 @@ tarobject_set_mtime(struct tar_entry *te, const char *path)
+ 
+   if (te->type == TAR_FILETYPE_SYMLINK) {
+ #ifdef HAVE_LUTIMES
+-    if (lutimes(path, tv) && errno != ENOSYS)
++/*    if (lutimes(path, tv) && errno != ENOSYS)
+       ohshite(_("error setting timestamps of '%.255s'"), path);
++*/
+ #endif
+   } else {
+     if (utimes(path, tv))
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/no-vla-warning.patch b/meta/recipes-devtools/dpkg/dpkg/0005-dpkg-compiler.m4-remove-Wvla.patch
similarity index 58%
rename from meta/recipes-devtools/dpkg/dpkg/no-vla-warning.patch
rename to meta/recipes-devtools/dpkg/dpkg/0005-dpkg-compiler.m4-remove-Wvla.patch
index f660b18..96e96f2 100644
--- a/meta/recipes-devtools/dpkg/dpkg/no-vla-warning.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0005-dpkg-compiler.m4-remove-Wvla.patch
@@ -1,7 +1,10 @@
-From e94474d805377d67c8b09664a602f20969e12b8a Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 23 Jan 2014 04:17:23 -0500
-Subject: [PATCH] dpkg-compiler.m4: remove -Wvla
+From 0ad7bba80d5b9035089ff2b2f77a774b5b201915 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 26 Aug 2015 16:28:59 +0300
+Subject: [PATCH 5/5] dpkg-compiler.m4: remove -Wvla
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 Remove the -Wvla flag from the set of compiler warning flags, since gcc
 on old host systems such as CentOS 5.8 doesn't support it, and it
@@ -13,20 +16,21 @@ Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
 ---
- m4/dpkg-compiler.m4 |    1 -
+ m4/dpkg-compiler.m4 | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/m4/dpkg-compiler.m4 b/m4/dpkg-compiler.m4
-index 53f67c6..6e66a43 100644
+index 682857c..23ed7d0 100644
 --- a/m4/dpkg-compiler.m4
 +++ b/m4/dpkg-compiler.m4
-@@ -49,7 +49,6 @@ AC_DEFUN([DPKG_CHECK_COMPILER_WARNINGS], [
-   DPKG_CHECK_COMPILER_FLAG([-Wformat-security])
-   DPKG_CHECK_COMPILER_FLAG([-Wpointer-arith])
+@@ -52,7 +52,6 @@ AC_DEFUN([DPKG_CHECK_COMPILER_WARNINGS], [
    DPKG_CHECK_COMPILER_FLAG([-Wlogical-op])
+   DPKG_CHECK_COMPILER_FLAG([-Wlogical-not-parentheses])
+   DPKG_CHECK_COMPILER_FLAG([-Wswitch-bool])
 -  DPKG_CHECK_COMPILER_FLAG([-Wvla])
    DPKG_CHECK_COMPILER_FLAG([-Winit-self])
    DPKG_CHECK_COMPILER_FLAG([-Wwrite-strings])
    DPKG_CHECK_COMPILER_FLAG([-Wcast-align])
----
-1.17.21
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/check_snprintf.patch b/meta/recipes-devtools/dpkg/dpkg/check_snprintf.patch
deleted file mode 100644
index 56eb0ca..0000000
--- a/meta/recipes-devtools/dpkg/dpkg/check_snprintf.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-diff -ruN dpkg-1.15.8.5-orig/m4/dpkg-funcs.m4 dpkg-1.15.8.5/m4/dpkg-funcs.m4
---- dpkg-1.15.8.5-orig/m4/dpkg-funcs.m4	2010-10-08 12:27:15.082131611 +0800
-+++ dpkg-1.15.8.5/m4/dpkg-funcs.m4	2010-10-08 13:56:50.074284346 +0800
-@@ -27,7 +27,7 @@
- # -----------------------
- # Define HAVE_C99_SNPRINTF if we have C99 snprintf family semantics
- AC_DEFUN([DPKG_FUNC_C99_SNPRINTF],
--[AC_CACHE_CHECK([for C99 snprintf functions], [dpkg_cv_c99_snprintf],
-+[AC_CACHE_CHECK([for C99 snprintf functions], [ac_cv_func_snprintf_c99],
- 	[AC_RUN_IFELSE([AC_LANG_SOURCE([[
- #include <stdarg.h>
- #include <stdio.h>
-@@ -58,14 +58,14 @@
- 	return 0;
- }
- 	]])],
--	[dpkg_cv_c99_snprintf=yes],
--	[dpkg_cv_c99_snprintf=no],
--	[dpkg_cv_c99_snprintf=no])])
--AS_IF([test "x$dpkg_cv_c99_snprintf" = "xyes"],
-+	[ac_cv_func_snprintf_c99=yes],
-+	[ac_cv_func_snprintf_c99=no],
-+	[ac_cv_func_snprintf_c99=no])])
-+AS_IF([test "x$ac_cv_func_snprintf_c99" = "xyes"],
- 	[AC_DEFINE([HAVE_C99_SNPRINTF], 1,
- 	           [Define to 1 if the 'snprintf' family is C99 conformant])],
- 	)
--AM_CONDITIONAL(HAVE_C99_SNPRINTF, [test "x$dpkg_cv_c99_snprintf" = "xyes"])
-+AM_CONDITIONAL(HAVE_C99_SNPRINTF, [test "x$ac_cv_func_snprintf_c99" = "xyes"])
- ])# DPKG_FUNC_C99_SNPRINTF
- 
- # DPKG_MMAP
diff --git a/meta/recipes-devtools/dpkg/dpkg/check_version.patch b/meta/recipes-devtools/dpkg/dpkg/check_version.patch
deleted file mode 100644
index 3175731..0000000
--- a/meta/recipes-devtools/dpkg/dpkg/check_version.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Adapt to linux-wrs kernel version, which has character '_' inside.
-Remove the first-char-digit-check (as the 1.15.8.5 version does).
-
-Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Index: dpkg-1.16.8/lib/dpkg/parsehelp.c
-===================================================================
---- dpkg-1.16.8.orig/lib/dpkg/parsehelp.c
-+++ dpkg-1.16.8/lib/dpkg/parsehelp.c
-@@ -258,14 +258,12 @@ parseversion(struct dpkg_version *rversi
- 
-   /* XXX: Would be faster to use something like cisversion and cisrevision. */
-   ptr = rversion->version;
--  if (*ptr && !cisdigit(*ptr++))
--    return dpkg_put_warn(err, _("version number does not start with digit"));
-   for (; *ptr; ptr++) {
--    if (!cisdigit(*ptr) && !cisalpha(*ptr) && strchr(".-+~:", *ptr) == NULL)
-+    if (!cisdigit(*ptr) && !cisalpha(*ptr) && strchr(".-+~:_", *ptr) == NULL)
-       return dpkg_put_warn(err, _("invalid character in version number"));
-   }
-   for (ptr = rversion->revision; *ptr; ptr++) {
--    if (!cisdigit(*ptr) && !cisalpha(*ptr) && strchr(".+~", *ptr) == NULL)
-+    if (!cisdigit(*ptr) && !cisalpha(*ptr) && strchr(".-+~_", *ptr) == NULL)
-       return dpkg_put_warn(err, _("invalid character in revision number"));
-   }
diff --git a/meta/recipes-devtools/dpkg/dpkg/fix-timestamps.patch b/meta/recipes-devtools/dpkg/dpkg/fix-timestamps.patch
deleted file mode 100644
index d2cabbe..0000000
--- a/meta/recipes-devtools/dpkg/dpkg/fix-timestamps.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-The lutimes function doesn't work properly for all systems.
-
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Index: dpkg-1.16.8/src/archives.c
-===================================================================
---- dpkg-1.16.8.orig/src/archives.c
-+++ dpkg-1.16.8/src/archives.c
-@@ -440,8 +440,10 @@ tarobject_set_mtime(struct tar_entry *te
- 
-   if (te->type == tar_filetype_symlink) {
- #ifdef HAVE_LUTIMES
-+/*
-     if (lutimes(path, tv) && errno != ENOSYS)
-       ohshite(_("error setting timestamps of `%.255s'"), path);
-+*/
- #endif
-   } else {
-     if (utimes(path, tv))
diff --git a/meta/recipes-devtools/dpkg/dpkg/tarfix.patch b/meta/recipes-devtools/dpkg/dpkg/tarfix.patch
deleted file mode 100644
index 50e0bb4..0000000
--- a/meta/recipes-devtools/dpkg/dpkg/tarfix.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-They managed to 'break' tar. Again. Sorry, they fixed a regression
-which broke dpkg-deb.
-
-The addition of:
-http://git.savannah.gnu.org/cgit/tar.git/commit/?id=163e96a0e619a900eab6de827c7c5749ecc9d3f2
-("Bugfix: entries read from the -T file did not get proper matching_flag.")
-means that the no-recursion option gets lost. This leads to many files getting included
-multiple times, along with files which shouldn't be there.
-
-The commit message is horrendous. The patch actually makes the option positional 
-(as documnted since 2003) and therefore doesn't affect the input from the -T option.
-
-Moving the --no-reursion option to earlier in the command avoids the bug.
-
-The bug was not present in tar 1.28 however it has been backported in at least 
-Fedora 22 and heading into Fedora 21.
-
-Redhat reports of issue:
-https://bugzilla.redhat.com/show_bug.cgi?id=1230762 [tar]
-https://bugzilla.redhat.com/show_bug.cgi?id=1241508 [dpkg]
-
-Discussion of bug in upstream tar:
-http://www.mail-archive.com/bug-tar@gnu.org/msg04799.html
-
-Yocto bug:
-https://bugzilla.yoctoproject.org/show_bug.cgi?id=7988
-
-Upstream-Status: Submitted [have mailed dpkg maintainer about this]
-
-RP
-2015/7/13
-
-Index: dpkg-1.17.25/dpkg-deb/build.c
-===================================================================
---- dpkg-1.17.25.orig/dpkg-deb/build.c
-+++ dpkg-1.17.25/dpkg-deb/build.c
-@@ -560,7 +560,7 @@ do_build(const char *const *argv)
-     if (chdir(dir))
-       ohshite(_("failed to chdir to `%.255s'"), dir);
-     execlp(TAR, "tar", "-cf", "-", "--format=gnu", "--null", "--no-unquote",
--                       "-T", "-", "--no-recursion", NULL);
-+                       "--no-recursion", "-T", "-", NULL);
-     ohshite(_("unable to execute %s (%s)"), "tar -cf", TAR);
-   }
-   close(p1[0]);
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.17.25.bb b/meta/recipes-devtools/dpkg/dpkg_1.18.2.bb
similarity index 49%
rename from meta/recipes-devtools/dpkg/dpkg_1.17.25.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.18.2.bb
index 1969eff..4c3fa4f 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.17.25.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.18.2.bb
@@ -2,20 +2,18 @@ require dpkg.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 SRC_URI += "file://noman.patch \
-            file://check_snprintf.patch \
-            file://check_version.patch \
-            file://preinst.patch \
-            file://fix-timestamps.patch \
             file://remove-tar-no-timestamp.patch \
             file://fix-abs-redefine.patch \
             file://arch_pm.patch \
             file://dpkg-configure.service \
             file://glibc2.5-sync_file_range.patch \
-            file://no-vla-warning.patch \
             file://add_armeb_triplet_entry.patch \
-            file://tarfix.patch \
+	    file://0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch \
+	    file://0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch \
+	    file://0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch \
+	    file://0005-dpkg-compiler.m4-remove-Wvla.patch \
            "
 
-SRC_URI[md5sum] = "e48fcfdb2162e77d72c2a83432d537ca"
-SRC_URI[sha256sum] = "07019d38ae98fb107c79dbb3690cfadff877f153b8c4970e3a30d2e59aa66baa"
+SRC_URI[md5sum] = "63b9d869081ec49adeef6c5ff62d6576"
+SRC_URI[sha256sum] = "11484f2a73d027d696e720a60380db71978bb5c06cd88fe30c291e069ac457a4"
 
-- 
2.1.4


