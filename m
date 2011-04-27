Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEU-0005P8-V8
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Apr 2011 00:29:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="426203253"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by azsmga001.ch.intel.com with ESMTP; 27 Apr 2011 00:29:36 -0700
Message-Id: <8d985acf09b36a24bc83b578e628318fe7591174.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Wed, 20 Apr 2011 13:57:30 +0800
Date: Wed, 27 Apr 2011  0:29:36 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 16/52] polkit: upgrade to version 0.101.
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:23 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Derive introspection.patch from gobject to fix autoconf issue.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../polkit/polkit-0.101/introspection.patch        |  104 ++++++++++++++++++++
 .../polkit/{polkit_0.99.bb => polkit_0.101.bb}     |   11 +-
 2 files changed, 110 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/polkit/polkit-0.101/introspection.patch
 rename meta/recipes-extended/polkit/{polkit_0.99.bb => polkit_0.101.bb} (77%)

diff --git a/meta/recipes-extended/polkit/polkit-0.101/introspection.patch b/meta/recipes-extended/polkit/polkit-0.101/introspection.patch
new file mode 100644
index 0000000..58c27ab
--- /dev/null
+++ b/meta/recipes-extended/polkit/polkit-0.101/introspection.patch
@@ -0,0 +1,104 @@
+Copied from gobject-introspection/m4/introspection.m4
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-By: Dongxiao Xu <dongxiao.xu@intel.com>
+
+diff -ruN polkit-0.101-orig/m4/introspection.m4 polkit-0.101/m4/introspection.m4
+--- polkit-0.101-orig/m4/introspection.m4	1970-01-01 08:00:00.000000000 +0800
++++ polkit-0.101/m4/introspection.m4	2010-12-06 11:08:16.000000000 +0800
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
diff --git a/meta/recipes-extended/polkit/polkit_0.99.bb b/meta/recipes-extended/polkit/polkit_0.101.bb
similarity index 77%
rename from meta/recipes-extended/polkit/polkit_0.99.bb
rename to meta/recipes-extended/polkit/polkit_0.101.bb
index 7f96979..6769914 100644
--- a/meta/recipes-extended/polkit/polkit_0.99.bb
+++ b/meta/recipes-extended/polkit/polkit_0.101.bb
@@ -4,10 +4,11 @@ HOMEPAGE = "http://code.google.com/p/polkit/"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
                     file://src/polkit/polkit.h;beginline=1;endilne=20;md5=9f797b8912dac8a806be820c14e783f8 \
-                    file://docs/polkit/html/license.html;md5=54750ec6ece444c50b823234d445dd99"
+                    file://docs/polkit/html/license.html;md5=07ddbf5f29e44c80c99be19c1690ec1f"
 
-SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz"
-PR = "r1"
+SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
+           file://introspection.patch"
+PR = "r0"
 DEPENDS = "libpam expat dbus-glib eggdbus intltool"
 RDEPENDS_${PN} = "libpam"
 EXTRA_OECONF = "--with-authfw=pam --with-os-type=moblin --disable-man-pages --disable-gtk-doc --disable-introspection"
@@ -19,5 +20,5 @@ FILES_${PN} += "${libdir}/${PN}-1/extensions/*.so \
                 ${datadir}/dbus-1/system-services/*"
 FILES_${PN}-dbg += "${libdir}/${PN}-1/extensions/.debug/*.so"
 
-SRC_URI[md5sum] = "fcc4d7b19c08ad54d3ce0eae0ab12398"
-SRC_URI[sha256sum] = "f612c7c26ec822f67751420057a4ae113fc50ab51070758faacf2ad30bb3583f"
+SRC_URI[md5sum] = "f925ac93aba3c072977370c1e27feb7f"
+SRC_URI[sha256sum] = "927f65760e4fce23d7cdeae90245c22986eb0a39335a344915302158f73f9f1b"
-- 
1.7.1.1



