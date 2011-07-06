Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1QeKWu-0001pI-BM
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 07:20:08 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Jul 2011 22:15:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,484,1304319600"; d="scan'208";a="21962885"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by orsmga002.jf.intel.com with ESMTP; 05 Jul 2011 22:15:11 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jul 2011 13:20:18 +0800
Message-Id: <72b710f9075cdd9f1bf2ca819bfc8b97919c3646.1309928392.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <cover.1309928392.git.lei.mei@intel.com>
References: <cover.1309928392.git.lei.mei@intel.com>
In-Reply-To: <cover.1309928392.git.lei.mei@intel.com>
References: <cover.1309928392.git.lei.mei@intel.com>
Subject: [PATCH 1/3] gupnp: Upgrade from 0.16.0 to 0.16.1
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
X-List-Received-Date: Wed, 06 Jul 2011 05:20:08 -0000

Add introspection.patch from gssdp due to more strict compiler checks in new version

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 .../gupnp/gupnp-0.16.1/introspection.patch         |  104 ++++++++++++++++++++
 .../gupnp/{gupnp_0.16.0.bb => gupnp_0.16.1.bb}     |    7 +-
 2 files changed, 108 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/gupnp/gupnp-0.16.1/introspection.patch
 rename meta/recipes-connectivity/gupnp/{gupnp_0.16.0.bb => gupnp_0.16.1.bb} (85%)

diff --git a/meta/recipes-connectivity/gupnp/gupnp-0.16.1/introspection.patch b/meta/recipes-connectivity/gupnp/gupnp-0.16.1/introspection.patch
new file mode 100644
index 0000000..86d57a7
--- /dev/null
+++ b/meta/recipes-connectivity/gupnp/gupnp-0.16.1/introspection.patch
@@ -0,0 +1,104 @@
+Copied from gobject-introspection/m4/introspection.m4
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-By: Dongxiao Xu <dongxiao.xu@intel.com>
+
+diff -ruN gupnp-0.16.1-orig/m4/introspection.m4 gupnp-0.16.1/m4/introspection.m4
+--- gupnp-0.16.1-orig/m4/introspection.m4	1970-01-01 08:00:00.000000000 +0800
++++ gupnp-0.16.1/m4/introspection.m4	2010-12-06 11:08:16.000000000 +0800
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
diff --git a/meta/recipes-connectivity/gupnp/gupnp_0.16.0.bb b/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
similarity index 85%
rename from meta/recipes-connectivity/gupnp/gupnp_0.16.0.bb
rename to meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
index 07b6b90..fd2eb38 100644
--- a/meta/recipes-connectivity/gupnp/gupnp_0.16.0.bb
+++ b/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
@@ -5,10 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://libgupnp/gupnp.h;beginline=1;endline=20;md5=28c49b17d623afc3335efc2e511879e1"
 DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2 gnome-icon-theme"
 
-SRC_URI = "http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.gz"
+SRC_URI = "http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.gz \
+           file://introspection.patch"
 
-SRC_URI[md5sum] = "61b240c1a9fdf8ca82c5c3adde0d6757"
-SRC_URI[sha256sum] = "1b77201866b7632fb68bc2a3bdea22ef8ead34ba850b3ee367797432cfc0f04a"
+SRC_URI[md5sum] = "021bb237741532af4bca50157ff326e4"
+SRC_URI[sha256sum] = "f01a1f4fd36ce161a3df29fa83e1a0a2fb40d3c9f30f6b403e7791688ad24cfe"
 
 PR = "r0"
 
-- 
1.6.3.3



