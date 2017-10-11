Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EC63378238
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:39:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:39:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945907"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:39:09 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:37 +0300
Message-Id: <87e73eaa0b47df909565358db8eb6949889a607f.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 45/50] at-spi2-core: update to 2.26.0
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
X-List-Received-Date: Wed, 11 Oct 2017 15:39:09 -0000

Drop 0001-nls.m4-Take-it-from-gettext-0.15.patch as it's now
upstreamed.

Remove --disable-xevie option:
https://github.com/GNOME/at-spi2-core/commit/644096a28a47bdf5c6e0c34c9cd5b944df059925

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../0001-build-Add-with-systemduserunitdir.patch   | 29 ++++++------
 .../0001-nls.m4-Take-it-from-gettext-0.15.patch    | 54 ----------------------
 ...-spi2-core_2.24.1.bb => at-spi2-core_2.26.0.bb} |  9 ++--
 3 files changed, 20 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-support/atk/at-spi2-core/0001-nls.m4-Take-it-from-gettext-0.15.patch
 rename meta/recipes-support/atk/{at-spi2-core_2.24.1.bb => at-spi2-core_2.26.0.bb} (80%)

diff --git a/meta/recipes-support/atk/at-spi2-core/0001-build-Add-with-systemduserunitdir.patch b/meta/recipes-support/atk/at-spi2-core/0001-build-Add-with-systemduserunitdir.patch
index 4103eaa2e5a..1f8c9f374fe 100644
--- a/meta/recipes-support/atk/at-spi2-core/0001-build-Add-with-systemduserunitdir.patch
+++ b/meta/recipes-support/atk/at-spi2-core/0001-build-Add-with-systemduserunitdir.patch
@@ -1,4 +1,4 @@
-From 2f47c975ebe52b6916a45ade023ae3bac21bb0e0 Mon Sep 17 00:00:00 2001
+From fa376762b92404b9e3c430054b8c3341ca0fdd8b Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 21 Jun 2016 16:00:02 +0300
 Subject: [PATCH] build: Add --with-systemduserunitdir
@@ -8,29 +8,30 @@ allow overriding the value.
 
 Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=767911]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
 ---
  bus/Makefile.am | 2 +-
- configure.ac    | 7 +++++++
- 2 files changed, 8 insertions(+), 1 deletion(-)
+ configure.ac    | 9 +++++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
 
 diff --git a/bus/Makefile.am b/bus/Makefile.am
-index b189e02..52fbb0b 100644
+index 688f82a..10cde62 100644
 --- a/bus/Makefile.am
 +++ b/bus/Makefile.am
-@@ -26,7 +26,7 @@ dbusservice_DATA = org.a11y.Bus.service
- org.a11y.Bus.service: org.a11y.Bus.service.in
- 	sed -e $(substitutions) $< > $@.tmp && mv $@.tmp $@
+@@ -29,7 +29,7 @@ org.a11y.Bus.service: org.a11y.Bus.service.in
+ EXTRA_DIST += org.a11y.Bus.service.in
+ CLEANFILES += org.a11y.Bus.service
  
 -systemd_userdir = $(prefix)/lib/systemd/user
 +systemd_userdir = $(systemduserunitdir)
  systemd_user_DATA = at-spi-dbus-bus.service
  at-spi-dbus-bus.service: at-spi-dbus-bus.service.in Makefile
- 	sed -e $(substitutions) $< > $@.tmp && mv $@.tmp $@
+ 	$(AM_V_GEN) $(SED) -e $(substitutions) $< > $@.tmp && mv $@.tmp $@
 diff --git a/configure.ac b/configure.ac
-index f9061c2..2b8eeed 100644
+index 8c4fca2..1415cca 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -183,6 +183,13 @@ else
+@@ -146,6 +146,15 @@ else
  fi
  AC_SUBST(DBUS_SERVICES_DIR)
  
@@ -41,9 +42,11 @@ index f9061c2..2b8eeed 100644
 +            [with_systemduserunitdir=$($PKG_CONFIG --variable=systemduserunitdir systemd)])
 +AC_SUBST([systemduserunitdir], [$with_systemduserunitdir])
 +
- AC_PATH_PROG(GLIB_MKENUMS, glib-mkenums)
++AC_PATH_PROG(GLIB_MKENUMS, glib-mkenums)
++
+ GOBJECT_INTROSPECTION_CHECK([1.32.0])
  
- GOBJECT_INTROSPECTION_CHECK([0.9.6])
+ AC_SUBST(LIBTOOL_EXPORT_OPTIONS)
 -- 
-2.1.4
+2.14.1
 
diff --git a/meta/recipes-support/atk/at-spi2-core/0001-nls.m4-Take-it-from-gettext-0.15.patch b/meta/recipes-support/atk/at-spi2-core/0001-nls.m4-Take-it-from-gettext-0.15.patch
deleted file mode 100644
index 69a51d56628..00000000000
--- a/meta/recipes-support/atk/at-spi2-core/0001-nls.m4-Take-it-from-gettext-0.15.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From c320799c941d42a9b7e351805359694ea3b36d2d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 5 Apr 2015 09:08:38 -0700
-Subject: [PATCH] nls.m4: Take it from gettext-0.15
-
-It otherwise expects gettext to provide it. Lets go independent
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- m4/nls.m4 | 30 ++++++++++++++++++++++++++++++
- 1 file changed, 30 insertions(+)
- create mode 100644 m4/nls.m4
-
-diff --git a/m4/nls.m4 b/m4/nls.m4
-new file mode 100644
-index 0000000..2c8fe69
---- /dev/null
-+++ b/m4/nls.m4
-@@ -0,0 +1,30 @@
-+dnl Copyright (C) 1995-2003, 2005-2006 Free Software Foundation, Inc.
-+dnl This file is free software; the Free Software Foundation
-+dnl gives unlimited permission to copy and/or distribute it,
-+dnl with or without modifications, as long as this notice is preserved.
-+dnl
-+dnl This file can can be used in projects which are not available under
-+dnl the GNU General Public License or the GNU Library General Public
-+dnl License but which still want to provide support for the GNU gettext
-+dnl functionality.
-+dnl Please note that the actual code of the GNU gettext library is covered
-+dnl by the GNU Library General Public License, and the rest of the GNU
-+dnl gettext package package is covered by the GNU General Public License.
-+dnl They are not in the public domain.
-+
-+dnl Authors:
-+dnl Ulrich Drepper drepper@cygnus.com, 1995-2000.
-+dnl Bruno Haible haible@clisp.cons.org, 2000-2003.
-+
-+AC_PREREQ(2.50)
-+
-+AC_DEFUN([AM_NLS],
-+[
-+AC_MSG_CHECKING([whether NLS is requested])
-+dnl Default is enabled NLS
-+AC_ARG_ENABLE(nls,
-+[ --disable-nls do not use Native Language Support],
-+USE_NLS=$enableval, USE_NLS=yes)
-+AC_MSG_RESULT($USE_NLS)
-+AC_SUBST(USE_NLS)
-+])
--- 
-2.1.4
-
diff --git a/meta/recipes-support/atk/at-spi2-core_2.24.1.bb b/meta/recipes-support/atk/at-spi2-core_2.26.0.bb
similarity index 80%
rename from meta/recipes-support/atk/at-spi2-core_2.24.1.bb
rename to meta/recipes-support/atk/at-spi2-core_2.26.0.bb
index 1687ae341ca..c4cfa8b921e 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.24.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.26.0.bb
@@ -6,12 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
-           file://0001-nls.m4-Take-it-from-gettext-0.15.patch \
            file://0001-build-Add-with-systemduserunitdir.patch \
-          "
+           "
 
-SRC_URI[md5sum] = "61d0a471e693292934a73f288ebff35c"
-SRC_URI[sha256sum] = "1e90d064b937aacfe79a96232ac7e63d28d716e85bd9ff4333f865305a959b5b"
+SRC_URI[md5sum] = "ef3de25da46da8f650915205eb7e1a33"
+SRC_URI[sha256sum] = "511568a65fda11fdd5ba5d4adfd48d5d76810d0e6ba4f7460f1b2ec0dbbbc337"
 
 DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native"
 
@@ -19,7 +18,7 @@ inherit autotools gtk-doc gettext systemd pkgconfig distro_features_check upstre
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-EXTRA_OECONF = "--disable-xevie \
+EXTRA_OECONF = " \
                 --with-systemduserunitdir=${systemd_user_unitdir} \
                 --with-dbus-daemondir=${bindir}"
 
-- 
2.14.1


