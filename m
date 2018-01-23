Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id ECDB87878B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 14:04:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jan 2018 06:04:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,401,1511856000"; d="scan'208";a="197956428"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 23 Jan 2018 06:04:12 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 1C8195800D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 06:04:11 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jan 2018 16:05:44 +0200
Message-Id: <1516716352-32735-5-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
References: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 04/12] pango: upgrade to version 1.41.0
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
X-List-Received-Date: Tue, 23 Jan 2018 14:04:11 -0000

Remove backported patch:
        0001-Drop-introspection-macros-from-acinclude.m4.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...op-introspection-macros-from-acinclude.m4.patch | 120 ---------------------
 .../pango/{pango_1.40.12.bb => pango_1.41.0.bb}    |   5 +-
 2 files changed, 2 insertions(+), 123 deletions(-)
 delete mode 100644 meta/recipes-graphics/pango/pango/0001-Drop-introspection-macros-from-acinclude.m4.patch
 rename meta/recipes-graphics/pango/{pango_1.40.12.bb => pango_1.41.0.bb} (88%)

diff --git a/meta/recipes-graphics/pango/pango/0001-Drop-introspection-macros-from-acinclude.m4.patch b/meta/recipes-graphics/pango/pango/0001-Drop-introspection-macros-from-acinclude.m4.patch
deleted file mode 100644
index 9e1626e..0000000
--- a/meta/recipes-graphics/pango/pango/0001-Drop-introspection-macros-from-acinclude.m4.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From 867a512eddbeb1899d3e7096df3da1dd0ce3e7b7 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 23 Oct 2015 14:06:17 +0300
-Subject: [PATCH] Drop introspection macros from acinclude.m4
-
-They take precendence over our customized macros, and so
-introspection doesn't work correctly.
-
-Upstream-Status: Backport [upstream 5ccfe0]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- acinclude.m4 | 96 ------------------------------------------------------------
- 1 file changed, 96 deletions(-)
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index 8899c7c..48fd5d8 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -55,99 +55,3 @@ AC_DEFUN([JH_CHECK_XML_CATALOG],
- ])
- 
- 
--dnl REMOVE THIS WHEN introspection.m4 is widely available
--dnl
--dnl -*- mode: autoconf -*-
--dnl Copyright 2009 Johan Dahlin
--dnl
--dnl This file is free software; the author(s) gives unlimited
--dnl permission to copy and/or distribute it, with or without
--dnl modifications, as long as this notice is preserved.
--dnl
--
--# serial 1
--
--m4_define([_GOBJECT_INTROSPECTION_CHECK_INTERNAL],
--[
--    AC_BEFORE([AC_PROG_LIBTOOL],[$0])dnl setup libtool first
--    AC_BEFORE([AM_PROG_LIBTOOL],[$0])dnl setup libtool first
--    AC_BEFORE([LT_INIT],[$0])dnl setup libtool first
--
--    dnl enable/disable introspection
--    m4_if([$2], [require],
--    [dnl
--        enable_introspection=yes
--    ],[dnl
--        AC_ARG_ENABLE(introspection,
--                  AS_HELP_STRING([--enable-introspection[=@<:@no/auto/yes@:>@]],
--                                 [Enable introspection for this build]),, 
--                                 [enable_introspection=auto])
--    ])dnl
--
--    AC_MSG_CHECKING([for gobject-introspection])
--
--    dnl presence/version checking
--    AS_CASE([$enable_introspection],
--    [no], [dnl
--        found_introspection="no (disabled, use --enable-introspection to enable)"
--    ],dnl
--    [yes],[dnl
--        PKG_CHECK_EXISTS([gobject-introspection-1.0],,
--                         AC_MSG_ERROR([gobject-introspection-1.0 is not installed]))
--        PKG_CHECK_EXISTS([gobject-introspection-1.0 >= $1],
--                         found_introspection=yes,
--                         AC_MSG_ERROR([You need to have gobject-introspection >= $1 installed to build AC_PACKAGE_NAME]))
--    ],dnl
--    [auto],[dnl
--        PKG_CHECK_EXISTS([gobject-introspection-1.0 >= $1], found_introspection=yes, found_introspection=no)
--    ],dnl
--    [dnl	
--        AC_MSG_ERROR([invalid argument passed to --enable-introspection, should be one of @<:@no/auto/yes@:>@])
--    ])dnl
--
--    AC_MSG_RESULT([$found_introspection])
--
--    INTROSPECTION_SCANNER=
--    INTROSPECTION_COMPILER=
--    INTROSPECTION_GENERATE=
--    INTROSPECTION_GIRDIR=
--    INTROSPECTION_TYPELIBDIR=
--    if test "x$found_introspection" = "xyes"; then
--       INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
--       INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
--       INTROSPECTION_GENERATE=`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
--       INTROSPECTION_GIRDIR=`$PKG_CONFIG --variable=girdir gobject-introspection-1.0`
--       INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG --variable=typelibdir gobject-introspection-1.0)"
--       INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags gobject-introspection-1.0`
--       INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
--       INTROSPECTION_MAKEFILE=`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
--    fi
--    AC_SUBST(INTROSPECTION_SCANNER)
--    AC_SUBST(INTROSPECTION_COMPILER)
--    AC_SUBST(INTROSPECTION_GENERATE)
--    AC_SUBST(INTROSPECTION_GIRDIR)
--    AC_SUBST(INTROSPECTION_TYPELIBDIR)
--    AC_SUBST(INTROSPECTION_CFLAGS)
--    AC_SUBST(INTROSPECTION_LIBS)
--    AC_SUBST(INTROSPECTION_MAKEFILE)
--
--    AM_CONDITIONAL(HAVE_INTROSPECTION, test "x$found_introspection" = "xyes")
--])
--
--
--dnl Usage:
--dnl   GOBJECT_INTROSPECTION_CHECK([minimum-g-i-version])
--
--AC_DEFUN([GOBJECT_INTROSPECTION_CHECK],
--[
--  _GOBJECT_INTROSPECTION_CHECK_INTERNAL([$1])
--])
--
--dnl Usage:
--dnl   GOBJECT_INTROSPECTION_REQUIRE([minimum-g-i-version])
--
--
--AC_DEFUN([GOBJECT_INTROSPECTION_REQUIRE],
--[
--  _GOBJECT_INTROSPECTION_CHECK_INTERNAL([$1], [require])
--])
--- 
-2.1.4
diff --git a/meta/recipes-graphics/pango/pango_1.40.12.bb b/meta/recipes-graphics/pango/pango_1.41.0.bb
similarity index 88%
rename from meta/recipes-graphics/pango/pango_1.40.12.bb
rename to meta/recipes-graphics/pango/pango_1.41.0.bb
index cbad9a9..726b8c4 100644
--- a/meta/recipes-graphics/pango/pango_1.40.12.bb
+++ b/meta/recipes-graphics/pango/pango_1.41.0.bb
@@ -14,11 +14,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspection
 
 SRC_URI += "file://run-ptest \
-            file://0001-Drop-introspection-macros-from-acinclude.m4.patch \
             file://0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch \
 "
-SRC_URI[archive.sha256sum] = "75f1a9a8e4e2b28cbc078b50c1fa927ee4ded994d1ade97c5603e2d1f3161cfc"
-SRC_URI[archive.md5sum] = "9aae7dd5ecc1c2ade4e6951b85004cee"
+SRC_URI[archive.md5sum] = "f3c0d6931aefd40f5afac2566faf2717"
+SRC_URI[archive.sha256sum] = "1f76ef95953dc58ee5d6a53e5f1cb6db913f3e0eb489713ee9266695cae580ba"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz"
 
-- 
2.4.0


