Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EEF95731A1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 12:20:37 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 15 Jul 2016 05:20:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,368,1464678000"; d="scan'208";a="846866848"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 15 Jul 2016 05:20:13 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2016 15:20:05 +0300
Message-Id: <bb5efce96016aa40f5b34b22cac6f7c5d0f2b4b2.1468584725.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <2ff7f7848e6bb8353b2de9012edbf6aa6eb84394.1468584725.git.jussi.kukkonen@intel.com>
References: <2ff7f7848e6bb8353b2de9012edbf6aa6eb84394.1468584725.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1468584725.git.jussi.kukkonen@intel.com>
References: <cover.1468584725.git.jussi.kukkonen@intel.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] libxsettings-client: Remove as unneeded
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
X-List-Received-Date: Fri, 15 Jul 2016 12:20:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xsettings-client is not meant to be a shared library and the only
user in oe-core (libmatchbox) now has an in-tree copy.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/conf/distro/include/distro_alias.inc          |  1 -
 meta/lib/oeqa/selftest/recipetool.py               |  4 +-
 .../libxsettings-client/MIT-style-license          | 22 -----------
 .../libxsettings-client/link-x11.patch             | 13 -------
 .../obsolete_automake_macros.patch                 | 14 -------
 .../libxsettings-client_0.10.bb                    | 43 ----------------------
 6 files changed, 2 insertions(+), 95 deletions(-)
 delete mode 100644 meta/recipes-graphics/libxsettings-client/libxsettings-client/MIT-style-license
 delete mode 100644 meta/recipes-graphics/libxsettings-client/libxsettings-client/link-x11.patch
 delete mode 100644 meta/recipes-graphics/libxsettings-client/libxsettings-client/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 7574032..8adafae 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -214,7 +214,6 @@ DISTRO_PN_ALIAS_pn-libxft = "Mandriva=libxft Debian=libxft2 Ubuntu=libxft2"
 DISTRO_PN_ALIAS_pn-libxi = "Ubuntu=libxi Fedora=libXi"
 DISTRO_PN_ALIAS_pn-libxkbcommon = "Fedora=libxkbcommon Debian=libxkbcommon"
 DISTRO_PN_ALIAS_pn-libxscrnsaver = "Fedora=libXScrnSaver Ubuntu=libxss1 Mandriva=libxscrnsaver"
-DISTRO_PN_ALIAS_pn-libxsettings-client = "Debian=libxsettings-client0 Ubuntu=libxsettings-client0 Mandriva=libXsettings-client0"
 DISTRO_PN_ALIAS_pn-libxxf86misc = "Mandriva=libxxf86misc Fedora=libXxf86misc"
 DISTRO_PN_ALIAS_pn-linux-dummy = "Intel"
 DISTRO_PN_ALIAS_pn-linux-firmware = "Fedora=linux-firmware Ubuntu=linux-firmware"
diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index 9436301..2e38758 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -383,7 +383,7 @@ class RecipetoolTests(RecipetoolBase):
     @testcase(1194)
     def test_recipetool_create_git(self):
         # Ensure we have the right data in shlibs/pkgdata
-        bitbake('libpng pango libx11 libxext jpeg libxsettings-client libcheck')
+        bitbake('libpng pango libx11 libxext jpeg libcheck')
         # Try adding a recipe
         tempsrc = os.path.join(self.tempdir, 'srctree')
         os.makedirs(tempsrc)
@@ -397,7 +397,7 @@ class RecipetoolTests(RecipetoolBase):
         checkvars['S'] = '${WORKDIR}/git'
         checkvars['PV'] = '1.11+git${SRCPV}'
         checkvars['SRC_URI'] = srcuri
-        checkvars['DEPENDS'] = set(['libcheck', 'libjpeg-turbo', 'libpng', 'libx11', 'libxsettings-client', 'libxext', 'pango'])
+        checkvars['DEPENDS'] = set(['libcheck', 'libjpeg-turbo', 'libpng', 'libx11', 'libxext', 'pango'])
         inherits = ['autotools', 'pkgconfig']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
diff --git a/meta/recipes-graphics/libxsettings-client/libxsettings-client/MIT-style-license b/meta/recipes-graphics/libxsettings-client/libxsettings-client/MIT-style-license
deleted file mode 100644
index 628de98..0000000
--- a/meta/recipes-graphics/libxsettings-client/libxsettings-client/MIT-style-license
+++ /dev/null
@@ -1,22 +0,0 @@
-/*
- * Copyright © 2001 Red Hat, Inc.
- *
- * Permission to use, copy, modify, distribute, and sell this software and its
- * documentation for any purpose is hereby granted without fee, provided that
- * the above copyright notice appear in all copies and that both that
- * copyright notice and this permission notice appear in supporting
- * documentation, and that the name of Red Hat not be used in advertising or
- * publicity pertaining to distribution of the software without specific,
- * written prior permission.  Red Hat makes no representations about the
- * suitability of this software for any purpose.  It is provided "as is"
- * without express or implied warranty.
- *
- * RED HAT DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING ALL
- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL RED HAT
- * BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
- * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
- * OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN 
- * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
- *
- * Author:  Owen Taylor, Red Hat, Inc.
- */
diff --git a/meta/recipes-graphics/libxsettings-client/libxsettings-client/link-x11.patch b/meta/recipes-graphics/libxsettings-client/libxsettings-client/link-x11.patch
deleted file mode 100644
index d08d0d5..0000000
--- a/meta/recipes-graphics/libxsettings-client/libxsettings-client/link-x11.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: Xsettings-client-0.10/Makefile.am
-===================================================================
---- Xsettings-client-0.10.orig/Makefile.am	2008-02-07 14:49:54.000000000 +0000
-+++ Xsettings-client-0.10/Makefile.am	2008-02-07 14:50:00.000000000 +0000
-@@ -9,4 +9,4 @@
- 
- libXsettings_client_la_SOURCES= $(source_c) $(source_h)
- 
--libXsettings_client_la_LIBADD      = @X_LIBS@
-\ No newline at end of file
-+libXsettings_client_la_LIBADD      = @X_LIBS@ -lX11
diff --git a/meta/recipes-graphics/libxsettings-client/libxsettings-client/obsolete_automake_macros.patch b/meta/recipes-graphics/libxsettings-client/libxsettings-client/obsolete_automake_macros.patch
deleted file mode 100644
index 905d08e..0000000
--- a/meta/recipes-graphics/libxsettings-client/libxsettings-client/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd Xsettings-client-0.10/configure.ac Xsettings-client-0.10/configure.ac
---- Xsettings-client-0.10/configure.ac	2003-03-28 12:39:51.000000000 +0200
-+++ Xsettings-client-0.10/configure.ac	2013-01-11 07:37:21.491597743 +0200
-@@ -1,7 +1,7 @@
- # Process this file with autoconf to produce a configure script.
- AC_INIT(xsettings-client.c)
- AM_INIT_AUTOMAKE(Xsettings-client, 0.10)
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
-
- CFLAGS="-Os -Wall"
diff --git a/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb b/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb
deleted file mode 100644
index 9e9336e..0000000
--- a/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-SUMMARY = "utility functions for the Xsettings protocol"
-DESCRIPTION = "Libraries used for applications making use of the Xsettings configuration \
-setting propagation protocol. Controls setting of double click timeout, drag-and-drop \
-threshold, and default foreground and background colors for all applications running within a \
-desktop."
-HOMEPAGE = "http://matchbox-project.org/sources/optional-dependencies/"
-BUGTRACKER = "http://bugzilla.yoctoproject.org/"
-SECTION = "x/libs"
-LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7cfac9d2d4dc3694cc7eb605cf32a69b \
-                    file://xsettings-client.h;endline=22;md5=7cfac9d2d4dc3694cc7eb605cf32a69b \
-                    file://xsettings-client.c;endline=22;md5=7cfac9d2d4dc3694cc7eb605cf32a69b \
-                    file://xsettings-common.h;endline=22;md5=7cfac9d2d4dc3694cc7eb605cf32a69b \
-                    file://xsettings-common.c;endline=22;md5=7cfac9d2d4dc3694cc7eb605cf32a69b"
-DEPENDS = "virtual/libx11"
-
-PR = "r5"
-
-headers = "xsettings-common.h xsettings-client.h"
-
-SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/optional-dependencies/Xsettings-client-0.10.tar.gz \
-        file://MIT-style-license \
-        file://link-x11.patch;apply=yes \
-        file://obsolete_automake_macros.patch \
-"
-
-SRC_URI[md5sum] = "c14aa9db6c097e0306dac97fb7da1add"
-SRC_URI[sha256sum] = "f274a4bc969ae192994a856b7f786c6fce96bae77f96c1c2b71dd97599e06e43"
-
-S = "${WORKDIR}/Xsettings-client-0.10"
-
-inherit autotools gettext distro_features_check
-# depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES = "x11"
-
-do_patch[postfuncs] += "update_copying_file"
-update_copying_file() {
-    # This package ships with a GPLv2 COPYING file, but the author says
-    # it is actual MIT-style license, add the correct license here to
-    # avoid confusion.
-    cp -f ${WORKDIR}/MIT-style-license ${S}/COPYING
-}
-
-- 
2.1.4


