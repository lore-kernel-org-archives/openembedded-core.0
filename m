Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RiDRW-0000GM-PJ
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 00:06:55 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Jan 2012 14:59:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="92638327"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by orsmga001.jf.intel.com with ESMTP; 03 Jan 2012 14:59:34 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2012 14:59:31 -0800
Message-Id: <401da554f087f2abb836bdf67ff5b98c28a65b3d.1325631444.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <d0c80f038de8f7c0f53b759503611aefa28c536b.1325631444.git.nitin.a.kamble@intel.com>
References: <d0c80f038de8f7c0f53b759503611aefa28c536b.1325631444.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1325631444.git.nitin.a.kamble@intel.com>
References: <cover.1325631444.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/2] vte: upgrade from 0.24.3 to 0.28.2
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
X-List-Received-Date: Tue, 03 Jan 2012 23:06:55 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Added a patch to add introspection.m4 to avoid the following
configure error:

| src/Makefile.am:168: HAVE_INTROSPECTION does not appear in
AM_CONDITIONAL
| autoreconf: automake failed with exit status: 1
| ERROR: autoreconf execution failed.
NOTE: package vte-0.28.2-r0: task do_configure: Failed

This upgrade avoids configure issues with automake version 1.11.2
seen on the earlier version of vte:

| src/Makefile.am:155: `pkglibdir' is not a legitimate directory for
`PROGRAMS'
| src/Makefile.am:156: `pkglibdir' is not a legitimate directory for
`SCRIPTS'
| src/Makefile.am:178: variable `interpret_SOURCES' is defined but no
program or
| src/Makefile.am:178: library has `interpret' as canonical name
(possible typo)
| src/Makefile.am:229: variable `slowcat_SOURCES' is defined but no
program or
| src/Makefile.am:229: library has `slowcat' as canonical name (possible
typo)
| src/Makefile.am:203: variable `interpret_LDADD' is defined but no
program or
| src/Makefile.am:203: library has `interpret' as canonical name
(possible typo)
| autoreconf: automake failed with exit status: 1
| ERROR: autoreconf execution failed.
NOTE: package vte-0.24.3-r0: task do_configure: Failed

Did not upgrade to the latest version 0.31.0.
0.28.2 is the last version supporting gtk+ 2. Next versions have
dropped support for gtk+ 2, and they require gtk+ 3. It would be
more appropriate to move to next version after gtk+ 3 recipe is
available.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-support/vte/vte.inc                 |    6 +-
 meta/recipes-support/vte/vte/introspection.patch |   99 ++++++++++++++++++++++
 meta/recipes-support/vte/vte_0.24.3.bb           |    8 --
 meta/recipes-support/vte/vte_0.28.2.bb           |    8 ++
 4 files changed, 111 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-support/vte/vte/introspection.patch
 delete mode 100644 meta/recipes-support/vte/vte_0.24.3.bb
 create mode 100644 meta/recipes-support/vte/vte_0.28.2.bb

diff --git a/meta/recipes-support/vte/vte.inc b/meta/recipes-support/vte/vte.inc
index 6138f8c..54bd8ae 100644
--- a/meta/recipes-support/vte/vte.inc
+++ b/meta/recipes-support/vte/vte.inc
@@ -6,9 +6,11 @@ RDEPENDS_libvte = "vte-termcap"
 
 inherit gnome
 
-EXTRA_OECONF = "--disable-gtk-doc --disable-python"
+SRC_URI += "file://introspection.patch"
+
+EXTRA_OECONF = "--disable-gtk-doc --disable-python --disable-introspection"
 
 PACKAGES =+ "libvte vte-termcap"
 FILES_libvte = "${libdir}/*.so.* ${libexecdir}/gnome-pty-helper"
 FILES_vte-dbg =+ ${libexecdir}/.debug"
-FILES_vte-termcap = "${datadir}/vte/termcap"
+FILES_vte-termcap = "${datadir}/vte/termcap-0.0"
diff --git a/meta/recipes-support/vte/vte/introspection.patch b/meta/recipes-support/vte/vte/introspection.patch
new file mode 100644
index 0000000..76a841c
--- /dev/null
+++ b/meta/recipes-support/vte/vte/introspection.patch
@@ -0,0 +1,99 @@
+Index: vte-0.28.2/m4/introspection.m4
+===================================================================
+--- /dev/null
++++ vte-0.28.2/m4/introspection.m4
+@@ -0,0 +1,94 @@
++dnl -*- mode: autoconf -*-
++dnl Copyright 2009 Johan Dahlin
++dnl
++dnl This file is free software; the author(s) gives unlimited
++dnl permission to copy and/or distribute it, with or without
++dnl modifications, as long as this notice is preserved.
++dnl
++
++# serial 1
++
++m4_define([_GOBJECT_INTROSPECTION_CHECK_INTERNAL],
++[
++    AC_BEFORE([AC_PROG_LIBTOOL],[$0])dnl setup libtool first
++    AC_BEFORE([AM_PROG_LIBTOOL],[$0])dnl setup libtool first
++    AC_BEFORE([LT_INIT],[$0])dnl setup libtool first
++
++    dnl enable/disable introspection
++    m4_if([$2], [require],
++    [dnl
++        enable_introspection=yes
++    ],[dnl
++        AC_ARG_ENABLE(introspection,
++                  AS_HELP_STRING([--enable-introspection[=@<:@no/auto/yes@:>@]],
++                                 [Enable introspection for this build]),,
++                                 [enable_introspection=auto])
++    ])dnl
++
++    AC_MSG_CHECKING([for gobject-introspection])
++
++    dnl presence/version checking
++    AS_CASE([$enable_introspection],
++    [no], [dnl
++        found_introspection="no (disabled, use --enable-introspection to enable)"
++    ],dnl
++    [yes],[dnl
++        PKG_CHECK_EXISTS([gobject-introspection-1.0],,
++                         AC_MSG_ERROR([gobject-introspection-1.0 is not installed]))
++        PKG_CHECK_EXISTS([gobject-introspection-1.0 >= $1],
++                         found_introspection=yes,
++                         AC_MSG_ERROR([You need to have gobject-introspection >= $1 installed to build AC_PACKAGE_NAME]))
++    ],dnl
++    [auto],[dnl
++        PKG_CHECK_EXISTS([gobject-introspection-1.0 >= $1], found_introspection=yes, found_introspection=no)
++    ],dnl
++    [dnl
++        AC_MSG_ERROR([invalid argument passed to --enable-introspection, should be one of @<:@no/auto/yes@:>@])
++    ])dnl
++
++    AC_MSG_RESULT([$found_introspection])
++
++    INTROSPECTION_SCANNER=
++    INTROSPECTION_COMPILER=
++    INTROSPECTION_GENERATE=
++    INTROSPECTION_GIRDIR=
++    INTROSPECTION_TYPELIBDIR=
++    if test "x$found_introspection" = "xyes"; then
++       INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
++       INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
++       INTROSPECTION_GENERATE=`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
++       INTROSPECTION_GIRDIR=`$PKG_CONFIG --variable=girdir gobject-introspection-1.0`
++       INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG --variable=typelibdir gobject-introspection-1.0)"
++       INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags gobject-introspection-1.0`
++       INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
++       INTROSPECTION_MAKEFILE=`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
++    fi
++    AC_SUBST(INTROSPECTION_SCANNER)
++    AC_SUBST(INTROSPECTION_COMPILER)
++    AC_SUBST(INTROSPECTION_GENERATE)
++    AC_SUBST(INTROSPECTION_GIRDIR)
++    AC_SUBST(INTROSPECTION_TYPELIBDIR)
++    AC_SUBST(INTROSPECTION_CFLAGS)
++    AC_SUBST(INTROSPECTION_LIBS)
++    AC_SUBST(INTROSPECTION_MAKEFILE)
++
++    AM_CONDITIONAL(HAVE_INTROSPECTION, test "x$found_introspection" = "xyes")
++])
++
++
++dnl Usage:
++dnl   GOBJECT_INTROSPECTION_CHECK([minimum-g-i-version])
++
++AC_DEFUN([GOBJECT_INTROSPECTION_CHECK],
++[
++  _GOBJECT_INTROSPECTION_CHECK_INTERNAL([$1])
++])
++
++dnl Usage:
++dnl   GOBJECT_INTROSPECTION_REQUIRE([minimum-g-i-version])
++
++
++AC_DEFUN([GOBJECT_INTROSPECTION_REQUIRE],
++[
++  _GOBJECT_INTROSPECTION_CHECK_INTERNAL([$1], [require])
++])
diff --git a/meta/recipes-support/vte/vte_0.24.3.bb b/meta/recipes-support/vte/vte_0.24.3.bb
deleted file mode 100644
index c06dd53..0000000
--- a/meta/recipes-support/vte/vte_0.24.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require vte.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
-
-PR = "r0"
-
-SRC_URI[archive.md5sum] = "3eba555eab7ccbbe5ca056bb203a14ab"
-SRC_URI[archive.sha256sum] = "fe7d01178976b17ca809e41d0e6dbbcb28e2af5e2f5aa857f9df65affac17d01"
diff --git a/meta/recipes-support/vte/vte_0.28.2.bb b/meta/recipes-support/vte/vte_0.28.2.bb
new file mode 100644
index 0000000..c74419a
--- /dev/null
+++ b/meta/recipes-support/vte/vte_0.28.2.bb
@@ -0,0 +1,8 @@
+require vte.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
+
+PR = "r0"
+
+SRC_URI[archive.md5sum] = "f07a4bf943194f94b7f142db8f7f36dc"
+SRC_URI[archive.sha256sum] = "8d04e202b617373dfb47689e5e628febe2c58840b34cccc4af4feb88c48df903"
-- 
1.7.4.4



