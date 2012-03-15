Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S809i-00034S-LT
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 03:11:07 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 14 Mar 2012 19:02:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119089801"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 14 Mar 2012 19:02:18 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 19:02:11 -0700
Message-Id: <a8369aed38f509c9eca5a30f2c583dd46219377f.1331776831.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <ad10381bea270e54aeefbbc3af0f9f1dce60e49f.1331776831.git.nitin.a.kamble@intel.com>
References: <ad10381bea270e54aeefbbc3af0f9f1dce60e49f.1331776831.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1331776831.git.nitin.a.kamble@intel.com>
References: <cover.1331776831.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/8] automake: upgrade from 1.11.2 to 1.11.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Mar 2012 02:11:07 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Removed already upstream patch:
  automake/automake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch

Rebased these patches to the newer code:
  automake/prefer-cpio-over-pax-for-ustar-archives.patch
  automake/python-libdir.patch

Changed the tarball name from bz2 to gz, as the bz2 tar ball
is not published for the 1.11.3 version.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/automake/automake.inc        |    2 +-
 ...utomake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch |  118 --------------------
 .../prefer-cpio-over-pax-for-ustar-archives.patch  |   30 +++--
 .../automake/automake/python-libdir.patch          |   32 +++---
 .../{automake_1.11.2.bb => automake_1.11.3.bb}     |    8 +-
 5 files changed, 36 insertions(+), 154 deletions(-)
 delete mode 100644 meta/recipes-devtools/automake/automake/automake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch
 rename meta/recipes-devtools/automake/{automake_1.11.2.bb => automake_1.11.3.bb} (85%)

diff --git a/meta/recipes-devtools/automake/automake.inc b/meta/recipes-devtools/automake/automake.inc
index 7eef9ec..370caca 100644
--- a/meta/recipes-devtools/automake/automake.inc
+++ b/meta/recipes-devtools/automake/automake.inc
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 HOMEPAGE = "http://www.gnu.org/software/automake/"
 SECTION = "devel"
 
-SRC_URI = "${GNU_MIRROR}/automake/automake-${PV}.tar.bz2 "
+SRC_URI = "${GNU_MIRROR}/automake/automake-${PV}.tar.gz"
 
 inherit autotools
 
diff --git a/meta/recipes-devtools/automake/automake/automake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch b/meta/recipes-devtools/automake/automake/automake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch
deleted file mode 100644
index f06dfe3..0000000
--- a/meta/recipes-devtools/automake/automake/automake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-Upstream-Status: Backport
-
-Backporting this patch from automake devel git tree.
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/01/05
-
-
-From 4e4dae500390d2ace681e4e4bc4c590ecdca38c6 Mon Sep 17 00:00:00 2001
-From: Stefano Lattarini <stefano.lattarini@gmail.com>
-Date: Tue, 03 Jan 2012 08:06:09 +0000
-Subject: install: pkglibexec_SCRIPTS is a valid prefix/primary combination
-
-It makes little sense for `libexec_SCRIPTS' to be accepted as valid
-while `pkglibexec_SCRIPTS' is not.  So fix this inconsistency by
-explicitly allowing `pkglibexec_SCRIPTS' as well.  It is worth
-noting that the inconsistency has been there for a long time,
-but only the quite recent commit `v1.11-373-g9ca6326' "Warnings
-about primary/prefix mismatch fixed and extended" has made it
-noisy enough to be noticed.
-
-* automake.in (handle_scripts): Also list `pkglibexec' among the
-prefixes valid for the `SCRIPTS' primary.
-* doc/automake.texi (Scripts): Likewise.
-* tests/primary-prefix-valid-couples.test: Update.
-* THANKS: Likewise.
-* NEWS: Likewise.
-
-Reported by Dennis Schridde on the automake list:
-<http://lists.gnu.org/archive/html/automake/2012-01/msg00002.html>
----
-diff --git a/NEWS b/NEWS
-index 599f19f..2e572e4 100644
---- a/NEWS
-+++ b/NEWS
-@@ -82,6 +82,11 @@ New in 1.11.0a:
- 
- Bugs fixed in 1.11.0a:
- 
-+* Bugs introduced by 1.11.2:
-+
-+  - Automake now correctly recognizes the prefix/primary combination
-+   `pkglibexec_SCRIPTS' as valid.
-+
- * Bugs introduced by 1.11:
- 
-   - The `parallel-tests' test driver works around a GNU make 3.80 bug with
-diff --git a/THANKS b/THANKS
-index e9da06c..e9c6db8 100644
---- a/THANKS
-+++ b/THANKS
-@@ -78,6 +78,7 @@ David Pashley		david@davidpashley.com
- David Zaroski		cz253@cleveland.Freenet.Edu
- Dean Povey		dpovey@wedgetail.com
- Dennis J. Linse		Dennis.J.Linse@SAIC.com
-+Dennis Schridde		devurandom@gmx.net
- Derek R. Price		derek.price@openavenue.com
- Diab Jerius		djerius@cfa.harvard.edu
- Didier Cassirame	faded@free.fr
-diff --git a/automake.in b/automake.in
-index a852195..a689b63 100644
---- a/automake.in
-+++ b/automake.in
-@@ -3091,7 +3091,7 @@ sub handle_scripts
-     # useful to sometimes distribute scripts verbatim.  This happens
-     # e.g. in Automake itself.
-     &am_install_var ('-candist', 'scripts', 'SCRIPTS',
--		     'bin', 'sbin', 'libexec', 'pkgdata',
-+		     'bin', 'sbin', 'libexec', 'pkglibexec', 'pkgdata',
- 		     'noinst', 'check');
- }
- 
-diff --git a/doc/automake.texi b/doc/automake.texi
-index cebe084..0c4dc01 100644
---- a/doc/automake.texi
-+++ b/doc/automake.texi
-@@ -7099,11 +7099,12 @@ prefix as with other primaries.
- @vindex sbin_SCRIPTS
- @vindex libexec_SCRIPTS
- @vindex pkgdata_SCRIPTS
-+@vindex pkglibexec_SCRIPTS
- @vindex noinst_SCRIPTS
- @vindex check_SCRIPTS
- 
- Scripts can be installed in @code{bindir}, @code{sbindir},
--@code{libexecdir}, or @code{pkgdatadir}.
-+@code{libexecdir}, @code{pkglibexecdir}, or @code{pkgdatadir}.
- 
- Scripts that need not be installed can be listed in
- @code{noinst_SCRIPTS}, and among them, those which are needed only by
-diff --git a/tests/primary-prefix-invalid-couples.test b/tests/primary-prefix-invalid-couples.test
-index 88e0817..c3d6471 100755
---- a/tests/primary-prefix-invalid-couples.test
-+++ b/tests/primary-prefix-invalid-couples.test
-@@ -79,7 +79,7 @@ for primary in $primaries; do
-       prefixes_ok='bin sbin libexec pkglibexec'
-       ;;
-     SCRIPTS)
--      prefixes_ok='bin sbin libexec pkgdata'
-+      prefixes_ok='bin sbin libexec pkglibexec pkgdata'
-       ;;
-     DATA)
-       prefixes_ok='data dataroot pkgdata doc html dvi pdf ps
-diff --git a/tests/primary-prefix-valid-couples.test b/tests/primary-prefix-valid-couples.test
-index 36ff5d8..6eb4149 100755
---- a/tests/primary-prefix-valid-couples.test
-+++ b/tests/primary-prefix-valid-couples.test
-@@ -57,7 +57,7 @@ for p in lib pkglib; do
-   echo "${p}_LTLIBRARIES = libd-$p.la" >> Makefile.am
- done
- 
--for p in bin sbin libexec pkgdata; do
-+for p in bin sbin libexec pkglibexec pkgdata; do
-   echo "${p}_SCRIPTS = $p.sh" >> Makefile.am
- done
- 
---
-cgit v0.9.0.2
diff --git a/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch b/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch
index 7bc8caf..4627855 100644
--- a/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch
+++ b/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch
@@ -15,11 +15,15 @@ Upstream-Status: Pending
 
 Signed-off-by: Tom Rini <tom_rini@mentor.com>
 
-Index: automake-1.11.1/m4/tar.m4
+Updated for version 1.11.3:
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+Date: 2011/03/14
+
+Index: automake-1.11.3/m4/tar.m4
 ===================================================================
---- automake-1.11.1.orig/m4/tar.m4
-+++ automake-1.11.1/m4/tar.m4
-@@ -30,7 +30,7 @@ m4_if([$1], [v7],
+--- automake-1.11.3.orig/m4/tar.m4	2012-01-31 03:41:18.000000000 -0800
++++ automake-1.11.3/m4/tar.m4	2012-03-14 17:36:11.901303777 -0700
+@@ -31,7 +31,7 @@ m4_if([$1], [v7],
                [m4_fatal([Unknown tar format])])
  AC_MSG_CHECKING([how to create a $1 tar archive])
  # Loop over all known methods to create a tar archive until one works.
@@ -28,16 +32,16 @@ Index: automake-1.11.1/m4/tar.m4
  _am_tools=${am_cv_prog_tar_$1-$_am_tools}
  # Do not fold the above two line into one, because Tru64 sh and
  # Solaris sh will not grok spaces in the rhs of `-'.
-Index: automake-1.11.1/Makefile.in
+Index: automake-1.11.3/Makefile.in
 ===================================================================
---- automake-1.11.1.orig/Makefile.in
-+++ automake-1.11.1/Makefile.in
-@@ -44,7 +44,7 @@ am__aclocal_m4_deps = $(top_srcdir)/m4/a
- 	$(top_srcdir)/m4/missing.m4 $(top_srcdir)/m4/mkdirp.m4 \
+--- automake-1.11.3.orig/Makefile.in	2012-02-01 02:37:59.000000000 -0800
++++ automake-1.11.3/Makefile.in	2012-03-14 17:38:03.530869197 -0700
+@@ -62,7 +62,7 @@ am__aclocal_m4_deps = $(top_srcdir)/m4/a
  	$(top_srcdir)/m4/options.m4 $(top_srcdir)/m4/runlog.m4 \
- 	$(top_srcdir)/m4/sanity.m4 $(top_srcdir)/m4/strip.m4 \
--	$(top_srcdir)/m4/substnot.m4 $(top_srcdir)/m4/tar.m4 \
-+	$(top_srcdir)/m4/substnot.m4 \
- 	$(top_srcdir)/configure.ac
+ 	$(top_srcdir)/m4/sanity.m4 $(top_srcdir)/m4/silent.m4 \
+ 	$(top_srcdir)/m4/strip.m4 $(top_srcdir)/m4/substnot.m4 \
+-	$(top_srcdir)/m4/tar.m4 $(top_srcdir)/configure.ac
++	$(top_srcdir)/configure.ac
  am__configure_deps = $(am__aclocal_m4_deps) $(CONFIGURE_DEPENDENCIES) \
  	$(ACLOCAL_M4)
+ am__CONFIG_DISTCLEAN_FILES = config.status config.cache config.log \
diff --git a/meta/recipes-devtools/automake/automake/python-libdir.patch b/meta/recipes-devtools/automake/automake/python-libdir.patch
index 63dafca..93a74c7 100644
--- a/meta/recipes-devtools/automake/automake/python-libdir.patch
+++ b/meta/recipes-devtools/automake/automake/python-libdir.patch
@@ -2,11 +2,11 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
 
-Index: automake-1.11.1/m4/python.m4
+Index: automake-1.11.3/m4/python.m4
 ===================================================================
---- automake-1.11.1.orig/m4/python.m4
-+++ automake-1.11.1/m4/python.m4
-@@ -88,12 +88,13 @@ python2.1 python2.0])
+--- automake-1.11.3.orig/m4/python.m4	2012-01-31 03:41:18.000000000 -0800
++++ automake-1.11.3/m4/python.m4	2012-03-14 17:48:49.194509698 -0700
+@@ -92,12 +92,13 @@ AC_DEFUN([AM_PATH_PYTHON],
      [am_cv_python_version=`$PYTHON -c "import sys; sys.stdout.write(sys.version[[:3]])"`])
    AC_SUBST([PYTHON_VERSION], [$am_cv_python_version])
  
@@ -22,16 +22,14 @@ Index: automake-1.11.1/m4/python.m4
    AC_SUBST([PYTHON_EXEC_PREFIX], ['${exec_prefix}'])
  
    dnl At times (like when building shared libraries) you may want
-@@ -122,7 +123,7 @@ python2.1 python2.0])
-        am_py_prefix=$prefix
-      fi
-      am_cv_python_pythondir=`$PYTHON -c "import sys; from distutils import sysconfig; sys.stdout.write(sysconfig.get_python_lib(0,0,prefix='$am_py_prefix'))" 2>/dev/null ||
--     echo "$PYTHON_PREFIX/lib/python$PYTHON_VERSION/site-packages"`
-+     echo "$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages"`
+@@ -127,13 +128,13 @@ AC_DEFUN([AM_PATH_PYTHON],
       case $am_cv_python_pythondir in
       $am_py_prefix*)
         am__strip_prefix=`echo "$am_py_prefix" | sed 's|.|.|g'`
-@@ -132,7 +133,7 @@ python2.1 python2.0])
+-       am_cv_python_pythondir=`echo "$am_cv_python_pythondir" | sed "s,^$am__strip_prefix,$PYTHON_PREFIX,"`
++       am_cv_python_pythondir=`echo "$am_cv_python_pythondir" | sed "s,^$am__strip_prefix/lib,$PYTHON_LIB_PREFIX,"`
+        ;;
+      *)
         case $am_py_prefix in
           /usr|/System*) ;;
           *)
@@ -40,16 +38,14 @@ Index: automake-1.11.1/m4/python.m4
  	  ;;
         esac
         ;;
-@@ -160,7 +161,7 @@ python2.1 python2.0])
-        am_py_exec_prefix=$exec_prefix
-      fi
-      am_cv_python_pyexecdir=`$PYTHON -c "import sys; from distutils import sysconfig; sys.stdout.write(sysconfig.get_python_lib(1,0,prefix='$am_py_exec_prefix'))" 2>/dev/null ||
--     echo "$PYTHON_EXEC_PREFIX/lib/python$PYTHON_VERSION/site-packages"`
-+     echo "$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages"`
+@@ -162,13 +163,13 @@ AC_DEFUN([AM_PATH_PYTHON],
       case $am_cv_python_pyexecdir in
       $am_py_exec_prefix*)
         am__strip_prefix=`echo "$am_py_exec_prefix" | sed 's|.|.|g'`
-@@ -170,7 +171,7 @@ python2.1 python2.0])
+-       am_cv_python_pyexecdir=`echo "$am_cv_python_pyexecdir" | sed "s,^$am__strip_prefix,$PYTHON_EXEC_PREFIX,"`
++       am_cv_python_pyexecdir=`echo "$am_cv_python_pyexecdir" | sed "s,^$am__strip_prefix/lib,$PYTHON_LIB_PREFIX,"`
+        ;;
+      *)
         case $am_py_exec_prefix in
           /usr|/System*) ;;
           *)
diff --git a/meta/recipes-devtools/automake/automake_1.11.2.bb b/meta/recipes-devtools/automake/automake_1.11.3.bb
similarity index 85%
rename from meta/recipes-devtools/automake/automake_1.11.2.bb
rename to meta/recipes-devtools/automake/automake_1.11.3.bb
index 4271336..8c56fc7 100644
--- a/meta/recipes-devtools/automake/automake_1.11.2.bb
+++ b/meta/recipes-devtools/automake/automake_1.11.3.bb
@@ -37,12 +37,12 @@ PATHFIXPATCH_virtclass-nativesdk = ""
 SRC_URI += "${PATHFIXPATCH} \
 	    file://prefer-cpio-over-pax-for-ustar-archives.patch \
 	    file://python-libdir.patch \
-            file://automake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch \
             file://py-compile-compile-only-optimized-byte-code.patch"
 
-PR = "r2"
-SRC_URI[md5sum] = "18194e804d415767bae8f703c963d456"
-SRC_URI[sha256sum] = "4f46d1f9380c8a3506280750f630e9fc915cb1a435b724be56b499d016368718"
+SRC_URI[md5sum] = "93ecb319f0365cb801990b00f658d026"
+SRC_URI[sha256sum] = "921b5188057e57bdd9c0ba06e21d0b0ea7dafa61a9bd08a2b041215bcff12f55"
+
+PR = "r0"
 
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
-- 
1.7.6.4



