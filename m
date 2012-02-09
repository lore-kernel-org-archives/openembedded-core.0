Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RvJQa-0001yc-6J
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 03:08:04 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Feb 2012 17:59:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104740499"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.14.207])
	by azsmga001.ch.intel.com with ESMTP; 08 Feb 2012 17:59:57 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2012 17:59:52 -0800
Message-Id: <c45048ca0b86ff2617ed9a9f8148998932150440.1328752455.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1328750092.git.josh@linux.intel.com>
References: <cover.1328750092.git.josh@linux.intel.com>
In-Reply-To: <cover.1328752455.git.josh@linux.intel.com>
References: <cover.1328752455.git.josh@linux.intel.com>
Subject: [PATCH 2/5] mx: update to 1.4.2
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
X-List-Received-Date: Thu, 09 Feb 2012 02:08:04 -0000

Patch in a copy of introspection.m4 so that we can continue to easily and
cleanly disable introspection.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../mx/files/introspection-m4.patch                |  106 ++++++++++++++++++++
 .../mx/{mx_1.3.2.bb => mx_1.4.2.bb}                |    9 +-
 2 files changed, 111 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-graphics/mx/files/introspection-m4.patch
 rename meta/recipes-graphics/mx/{mx_1.3.2.bb => mx_1.4.2.bb} (58%)

diff --git a/meta/recipes-graphics/mx/files/introspection-m4.patch b/meta/recipes-graphics/mx/files/introspection-m4.patch
new file mode 100644
index 0000000..aeecbbe
--- /dev/null
+++ b/meta/recipes-graphics/mx/files/introspection-m4.patch
@@ -0,0 +1,106 @@
+A copy of introspection.m4 from upstream gobject-introspection so that
+we can use the GOBJECT_INTROSPECTION_CHECK([0.6.4]) and --disable-introspection
+
+Signed-off-by: Joshua Lock <josh@linux.intel.com>
+
+Upstream-status: Inappropriate (build system specific).
+
+Index: mx-1.4.2/m4/introspection.m4
+===================================================================
+--- /dev/null
++++ mx-1.4.2/m4/introspection.m4
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
diff --git a/meta/recipes-graphics/mx/mx_1.3.2.bb b/meta/recipes-graphics/mx/mx_1.4.2.bb
similarity index 58%
rename from meta/recipes-graphics/mx/mx_1.3.2.bb
rename to meta/recipes-graphics/mx/mx_1.4.2.bb
index 695249b..91eca29 100644
--- a/meta/recipes-graphics/mx/mx_1.3.2.bb
+++ b/meta/recipes-graphics/mx/mx_1.4.2.bb
@@ -1,14 +1,15 @@
 DESCRIPTION = "Clutter based widget library"
 LICENSE = "LGPLv2.1"
-PR = "r1"
 
 DEPENDS = "clutter-1.8"
 
 inherit autotools
 
-SRC_URI = "http://source.clutter-project.org/sources/mx/1.3/mx-${PV}.tar.bz2"
-SRC_URI[md5sum] = "6057f3403d1109191dc7ef492bae5867"
-SRC_URI[sha256sum] = "94fd2b307b204945643af1e3193a2a7be96712f9296cf0e525f5fd7538f85513"
+SRC_URI = "http://source.clutter-project.org/sources/mx/1.4/mx-${PV}.tar.bz2 \
+	   file://introspection-m4.patch"
+
+SRC_URI[md5sum] = "faf8d97ad9995f54cc91f90bc90c8f9d"
+SRC_URI[sha256sum] = "9d40dd48a8e3d098cc75c05163f77305ffb83439783dc91be50681c9502660ce"
 
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24 \
                     file://mx/mx-widget.c;beginline=8;endline=20;md5=13bba3c973a72414a701e1e87b5ee879"
-- 
1.7.7.6



