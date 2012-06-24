Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SirKV-0004YM-Hc
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Jun 2012 20:14:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2012 11:03:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="161983146"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by orsmga002.jf.intel.com with ESMTP; 24 Jun 2012 11:03:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jun 2012 11:03:31 -0700
Message-Id: <1463b310c360069645dd3fc16c98e37f2053ea0d.1340560914.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
Subject: [PATCH 06/14] mx: Upgrade to 1.4.6
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
X-List-Received-Date: Sun, 24 Jun 2012 18:14:36 -0000

Remove patch as introspection.m4 is now included with the upstream

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../mx/files/introspection-m4.patch                |  106 --------------------
 .../mx/{mx_1.4.2.bb => mx_1.4.6.bb}                |    9 +-
 2 files changed, 4 insertions(+), 111 deletions(-)
 delete mode 100644 meta/recipes-graphics/mx/files/introspection-m4.patch
 rename meta/recipes-graphics/mx/{mx_1.4.2.bb => mx_1.4.6.bb} (71%)

diff --git a/meta/recipes-graphics/mx/files/introspection-m4.patch b/meta/recipes-graphics/mx/files/introspection-m4.patch
deleted file mode 100644
index 2dcb62a..0000000
--- a/meta/recipes-graphics/mx/files/introspection-m4.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-A copy of introspection.m4 from upstream gobject-introspection so that
-we can use the GOBJECT_INTROSPECTION_CHECK([0.6.4]) and --disable-introspection
-
-Signed-off-by: Joshua Lock <josh@linux.intel.com>
-
-Upstream-Status: Inappropriate (build system specific).
-
-Index: mx-1.4.2/m4/introspection.m4
-===================================================================
---- /dev/null
-+++ mx-1.4.2/m4/introspection.m4
-@@ -0,0 +1,94 @@
-+dnl -*- mode: autoconf -*-
-+dnl Copyright 2009 Johan Dahlin
-+dnl
-+dnl This file is free software; the author(s) gives unlimited
-+dnl permission to copy and/or distribute it, with or without
-+dnl modifications, as long as this notice is preserved.
-+dnl
-+
-+# serial 1
-+
-+m4_define([_GOBJECT_INTROSPECTION_CHECK_INTERNAL],
-+[
-+    AC_BEFORE([AC_PROG_LIBTOOL],[$0])dnl setup libtool first
-+    AC_BEFORE([AM_PROG_LIBTOOL],[$0])dnl setup libtool first
-+    AC_BEFORE([LT_INIT],[$0])dnl setup libtool first
-+
-+    dnl enable/disable introspection
-+    m4_if([$2], [require],
-+    [dnl
-+        enable_introspection=yes
-+    ],[dnl
-+        AC_ARG_ENABLE(introspection,
-+                  AS_HELP_STRING([--enable-introspection[=@<:@no/auto/yes@:>@]],
-+                                 [Enable introspection for this build]),, 
-+                                 [enable_introspection=auto])
-+    ])dnl
-+
-+    AC_MSG_CHECKING([for gobject-introspection])
-+
-+    dnl presence/version checking
-+    AS_CASE([$enable_introspection],
-+    [no], [dnl
-+        found_introspection="no (disabled, use --enable-introspection to enable)"
-+    ],dnl
-+    [yes],[dnl
-+        PKG_CHECK_EXISTS([gobject-introspection-1.0],,
-+                         AC_MSG_ERROR([gobject-introspection-1.0 is not installed]))
-+        PKG_CHECK_EXISTS([gobject-introspection-1.0 >= $1],
-+                         found_introspection=yes,
-+                         AC_MSG_ERROR([You need to have gobject-introspection >= $1 installed to build AC_PACKAGE_NAME]))
-+    ],dnl
-+    [auto],[dnl
-+        PKG_CHECK_EXISTS([gobject-introspection-1.0 >= $1], found_introspection=yes, found_introspection=no)
-+    ],dnl
-+    [dnl	
-+        AC_MSG_ERROR([invalid argument passed to --enable-introspection, should be one of @<:@no/auto/yes@:>@])
-+    ])dnl
-+
-+    AC_MSG_RESULT([$found_introspection])
-+
-+    INTROSPECTION_SCANNER=
-+    INTROSPECTION_COMPILER=
-+    INTROSPECTION_GENERATE=
-+    INTROSPECTION_GIRDIR=
-+    INTROSPECTION_TYPELIBDIR=
-+    if test "x$found_introspection" = "xyes"; then
-+       INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
-+       INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
-+       INTROSPECTION_GENERATE=`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
-+       INTROSPECTION_GIRDIR=`$PKG_CONFIG --variable=girdir gobject-introspection-1.0`
-+       INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG --variable=typelibdir gobject-introspection-1.0)"
-+       INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags gobject-introspection-1.0`
-+       INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
-+       INTROSPECTION_MAKEFILE=`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
-+    fi
-+    AC_SUBST(INTROSPECTION_SCANNER)
-+    AC_SUBST(INTROSPECTION_COMPILER)
-+    AC_SUBST(INTROSPECTION_GENERATE)
-+    AC_SUBST(INTROSPECTION_GIRDIR)
-+    AC_SUBST(INTROSPECTION_TYPELIBDIR)
-+    AC_SUBST(INTROSPECTION_CFLAGS)
-+    AC_SUBST(INTROSPECTION_LIBS)
-+    AC_SUBST(INTROSPECTION_MAKEFILE)
-+
-+    AM_CONDITIONAL(HAVE_INTROSPECTION, test "x$found_introspection" = "xyes")
-+])
-+
-+
-+dnl Usage:
-+dnl   GOBJECT_INTROSPECTION_CHECK([minimum-g-i-version])
-+
-+AC_DEFUN([GOBJECT_INTROSPECTION_CHECK],
-+[
-+  _GOBJECT_INTROSPECTION_CHECK_INTERNAL([$1])
-+])
-+
-+dnl Usage:
-+dnl   GOBJECT_INTROSPECTION_REQUIRE([minimum-g-i-version])
-+
-+
-+AC_DEFUN([GOBJECT_INTROSPECTION_REQUIRE],
-+[
-+  _GOBJECT_INTROSPECTION_CHECK_INTERNAL([$1], [require])
-+])
diff --git a/meta/recipes-graphics/mx/mx_1.4.2.bb b/meta/recipes-graphics/mx/mx_1.4.6.bb
similarity index 71%
rename from meta/recipes-graphics/mx/mx_1.4.2.bb
rename to meta/recipes-graphics/mx/mx_1.4.6.bb
index bee65f6..81bc5b9 100644
--- a/meta/recipes-graphics/mx/mx_1.4.2.bb
+++ b/meta/recipes-graphics/mx/mx_1.4.6.bb
@@ -1,17 +1,16 @@
 DESCRIPTION = "Clutter based widget library"
 LICENSE = "LGPLv2.1"
 
-PR = "r1"
+PR = "r0"
 
 DEPENDS = "clutter-1.8 dbus-glib libxrandr gdk-pixbuf startup-notification"
 
 inherit autotools gettext
 
-SRC_URI = "http://source.clutter-project.org/sources/mx/1.4/mx-${PV}.tar.bz2 \
-	   file://introspection-m4.patch"
+SRC_URI = "http://source.clutter-project.org/sources/mx/1.4/mx-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "faf8d97ad9995f54cc91f90bc90c8f9d"
-SRC_URI[sha256sum] = "9d40dd48a8e3d098cc75c05163f77305ffb83439783dc91be50681c9502660ce"
+SRC_URI[md5sum] = "c7192ca7c43bb1a39adc2fafdc012f49"
+SRC_URI[sha256sum] = "a3c7ffaf29b282144c982757b450d145cd85867183dfafef4750a00a0d406672"
 
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24 \
                     file://mx/mx-widget.c;beginline=8;endline=20;md5=13bba3c973a72414a701e1e87b5ee879"
-- 
1.7.7.6



