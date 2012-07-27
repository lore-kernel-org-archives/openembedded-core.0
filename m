Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SujR1-00048p-9S for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 14:14:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6RC2pRq005889
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 13:02:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04762-08 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 13:02:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6RC2fvM005883
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 13:02:42 +0100
Message-ID: <1343390561.9574.129.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2012 13:02:41 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] polkit/vte/gupnp/gssdp: Replace introspection hacks with gobject-introspection-stub
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
X-List-Received-Date: Fri, 27 Jul 2012 12:14:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-connectivity/gupnp/gssdp-0.10.0/introspection.patch b/meta/recipes-connectivity/gupnp/gssdp-0.10.0/introspection.patch
deleted file mode 100644
index 39c1502..0000000
--- a/meta/recipes-connectivity/gupnp/gssdp-0.10.0/introspection.patch
+++ b/dev/null
@@ -1,104 +0,0 @@
-Copied from gobject-introspection/m4/introspection.m4
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-By: Dongxiao Xu <dongxiao.xu@intel.com>
-
-diff -ruN gssdp-0.9.0-orig/m4/introspection.m4 gssdp-0.9.0/m4/introspection.m4
---- gssdp-0.9.0-orig/m4/introspection.m4	1970-01-01 08:00:00.000000000 +0800
-+++ gssdp-0.9.0/m4/introspection.m4	2010-12-06 11:08:16.000000000 +0800
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
diff --git a/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb b/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
index dcc40b8..f3494e7 100644
--- a/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
+++ b/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
@@ -2,10 +2,9 @@ SUMMARY = "Resource discovery and announcement over SSDP"
 DESCRIPTION = "GSSDP implements resource discovery and announcement over SSDP (Simpe Service Discovery Protocol)."
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
-DEPENDS = "glib-2.0 libsoup-2.4 libglade"
+DEPENDS = "glib-2.0 libsoup-2.4 libglade gobject-introspection-stub"
 
-SRC_URI = "http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.gz \
-           file://introspection.patch"
+SRC_URI = "http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "725c32e8f92a072cc34f0e091937df2a"
 SRC_URI[sha256sum] = "8eaab799f699836770ec2fcc08abfef2f824a82ae959c6af7b39ffb6968b9fd7"
diff --git a/meta/recipes-connectivity/gupnp/gupnp-0.16.1/introspection.patch b/meta/recipes-connectivity/gupnp/gupnp-0.16.1/introspection.patch
deleted file mode 100644
index 86d57a7..0000000
--- a/meta/recipes-connectivity/gupnp/gupnp-0.16.1/introspection.patch
+++ b/dev/null
@@ -1,104 +0,0 @@
-Copied from gobject-introspection/m4/introspection.m4
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-By: Dongxiao Xu <dongxiao.xu@intel.com>
-
-diff -ruN gupnp-0.16.1-orig/m4/introspection.m4 gupnp-0.16.1/m4/introspection.m4
---- gupnp-0.16.1-orig/m4/introspection.m4	1970-01-01 08:00:00.000000000 +0800
-+++ gupnp-0.16.1/m4/introspection.m4	2010-12-06 11:08:16.000000000 +0800
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
diff --git a/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb b/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
index 8460c16..84e0679 100644
--- a/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
+++ b/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
@@ -3,10 +3,9 @@ DESCRIPTION = "GUPnP is an elegant, object-oriented open source framework for cr
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://libgupnp/gupnp.h;beginline=1;endline=20;md5=28c49b17d623afc3335efc2e511879e1"
-DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2 gnome-icon-theme"
+DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2 gnome-icon-theme gobject-introspection-stub"
 
-SRC_URI = "http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.gz \
-           file://introspection.patch"
+SRC_URI = "http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "021bb237741532af4bca50157ff326e4"
 SRC_URI[sha256sum] = "f01a1f4fd36ce161a3df29fa83e1a0a2fb40d3c9f30f6b403e7791688ad24cfe"
diff --git a/meta/recipes-extended/polkit/polkit-0.104/introspection.patch b/meta/recipes-extended/polkit/polkit-0.104/introspection.patch
deleted file mode 100644
index 58c27ab..0000000
--- a/meta/recipes-extended/polkit/polkit-0.104/introspection.patch
+++ b/dev/null
@@ -1,104 +0,0 @@
-Copied from gobject-introspection/m4/introspection.m4
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-By: Dongxiao Xu <dongxiao.xu@intel.com>
-
-diff -ruN polkit-0.101-orig/m4/introspection.m4 polkit-0.101/m4/introspection.m4
---- polkit-0.101-orig/m4/introspection.m4	1970-01-01 08:00:00.000000000 +0800
-+++ polkit-0.101/m4/introspection.m4	2010-12-06 11:08:16.000000000 +0800
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
diff --git a/meta/recipes-extended/polkit/polkit_0.104.bb b/meta/recipes-extended/polkit/polkit_0.104.bb
index cd03898..e548cbc 100644
--- a/meta/recipes-extended/polkit/polkit_0.104.bb
+++ b/meta/recipes-extended/polkit/polkit_0.104.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
                     file://src/polkit/polkit.h;beginline=1;endline=20;md5=0a8630b0133176d0504c87a0ded39db4 \
                     file://docs/polkit/html/license.html;md5=d85a36709a446c10f4ee123f9dda0e38"
 
-DEPENDS = "expat glib-2.0 intltool-native"
+DEPENDS = "expat glib-2.0 intltool-native gobject-introspection-stub"
 
 PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[pam] = "--with-authfw=pam,--with-authfw=shadow,libpam,libpam"
@@ -15,7 +15,6 @@ PR = "r6"
 
 PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
-           file://introspection.patch \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-sess.patch \
            file://0002-PolkitUnixSession-Actually-return-TRUE-if-a-session-.patch \
diff --git a/meta/recipes-support/vte/vte.inc b/meta/recipes-support/vte/vte.inc
index 9fe7956..0766da7 100644
--- a/meta/recipes-support/vte/vte.inc
+++ b/meta/recipes-support/vte/vte.inc
@@ -1,13 +1,11 @@
 DESCRIPTION = "vte is a virtual terminal emulator"
 BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
 LICENSE = "LGPLv2.1+"
-DEPENDS = " glib-2.0 gtk+ intltool-native ncurses"
+DEPENDS = " glib-2.0 gtk+ intltool-native ncurses gobject-introspection-stub"
 RDEPENDS_libvte = "vte-termcap"
 
 inherit gnome gtk-doc
 
-SRC_URI += "file://introspection.patch"
-
 EXTRA_OECONF = "--disable-python --disable-introspection"
 
 PACKAGES =+ "libvte vte-termcap"
diff --git a/meta/recipes-support/vte/vte/introspection.patch b/meta/recipes-support/vte/vte/introspection.patch
deleted file mode 100644
index 890ba31..0000000
--- a/meta/recipes-support/vte/vte/introspection.patch
+++ b/dev/null
@@ -1,107 +0,0 @@
-Upstream-Status:  Inappropriate [configuration]
-
-Get this m4 file from introspection, so that we can configure without
-depending on the introspection package.
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2011/01/03
-
-Index: vte-0.28.2/m4/introspection.m4
-===================================================================
---- /dev/null
-+++ vte-0.28.2/m4/introspection.m4
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




