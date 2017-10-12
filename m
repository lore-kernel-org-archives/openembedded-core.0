Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 704BC78244
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 14:54:56 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Oct 2017 07:54:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,366,1503385200"; d="scan'208";a="322496262"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2017 07:54:57 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Oct 2017 17:51:15 +0300
Message-Id: <2d1a428a8d1b83c3a8c7d2e368d51eb0196bb670.1507819701.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507819700.git.alexander.kanavin@linux.intel.com>
References: <cover.1507819700.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 6/7] sysprof: convert to meson build
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
X-List-Received-Date: Thu, 12 Oct 2017 14:54:56 -0000

Drop autotools-specific patches.

Rename polkit packageconfig option to sysprofd as 'polkit' does not
at all match what is happening.

Remove --enable-compiler-warnings, as the equivalent in meson
could not be found.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../sysprof/files/0001-Avoid-building-docs.patch   | 42 ----------------------
 .../0001-Disable-check-for-polkit-for-UI.patch     | 32 -----------------
 ...d-anything-in-help-as-it-requires-itstool.patch | 26 ++++++++++++++
 ...igure-Add-option-to-enable-disable-polkit.patch | 41 ---------------------
 meta/recipes-kernel/sysprof/sysprof_3.26.1.bb      | 23 ++++++------
 5 files changed, 37 insertions(+), 127 deletions(-)
 delete mode 100644 meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.patch
 delete mode 100644 meta/recipes-kernel/sysprof/files/0001-Disable-check-for-polkit-for-UI.patch
 create mode 100644 meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
 delete mode 100644 meta/recipes-kernel/sysprof/files/0001-configure-Add-option-to-enable-disable-polkit.patch

diff --git a/meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.patch b/meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.patch
deleted file mode 100644
index 202f354d29c..00000000000
--- a/meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 27df521c68e7c8b5b050dab15f40aa15fd03623a Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Wed, 4 May 2016 14:58:24 +0300
-Subject: [PATCH] Avoid building docs
-
-Upstream-Status: Inappropriate
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- Makefile.am | 2 +-
- m4/yelp.m4  | 6 ------
- 2 files changed, 1 insertion(+), 7 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index b919a3f..3a3851d 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,4 +1,4 @@
--SUBDIRS = daemon data help lib po src tools tests
-+SUBDIRS = daemon data lib po src tools tests
- 
- EXTRA_DIST = AUTHORS tap-test COPYING.gpl-2
- 
-diff --git a/m4/yelp.m4 b/m4/yelp.m4
-index 5db847f..1b6ede4 100644
---- a/m4/yelp.m4
-+++ b/m4/yelp.m4
-@@ -27,12 +27,6 @@ AC_ARG_WITH([help-dir],
- HELP_DIR="$with_help_dir"
- AC_SUBST(HELP_DIR)
- 
--AC_ARG_VAR([ITSTOOL], [Path to the `itstool` command])
--AC_CHECK_PROG([ITSTOOL], [itstool], [itstool])
--if test x"$ITSTOOL" = x; then
--  AC_MSG_ERROR([itstool not found])
--fi
--
- AC_ARG_VAR([XMLLINT], [Path to the `xmllint` command])
- AC_CHECK_PROG([XMLLINT], [xmllint], [xmllint])
- if test x"$XMLLINT" = x; then
--- 
-2.1.4
-
diff --git a/meta/recipes-kernel/sysprof/files/0001-Disable-check-for-polkit-for-UI.patch b/meta/recipes-kernel/sysprof/files/0001-Disable-check-for-polkit-for-UI.patch
deleted file mode 100644
index 608523272ad..00000000000
--- a/meta/recipes-kernel/sysprof/files/0001-Disable-check-for-polkit-for-UI.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 765d578145e31ddc9495adfab8037ade33c6a9cc Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Wed, 4 May 2016 10:59:36 +0300
-Subject: [PATCH] Disable check for polkit for UI
-
-The check is not technically required: sysprof just needs
-to be able to access system perf counters at runtime.
-
-Upstream-Status: Pending
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 8559597..ecf93ad 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -131,8 +131,8 @@ AS_IF([test "$enable_gtk" = auto],[
- 	AS_IF([test "$have_gtk" = "yes" && test "$have_polkit" = "yes"],[enable_gtk=yes],[enable_gtk=no])
- ])
- AS_IF([test "$enable_gtk" = "yes"],[
--	AS_IF([test "$have_gtk" = "yes" && test "$have_polkit" = "yes"],[],[
--		AC_MSG_ERROR([--enable-gtk requires gtk+-3.0 >= gtk_required_version and polkit-gobject-1])
-+	AS_IF([test "$have_gtk" = "yes"],[],[
-+		AC_MSG_ERROR([--enable-gtk requires gtk+-3.0 >= gtk_required_version])
- 	])
- ])
- AM_CONDITIONAL(ENABLE_GTK, test "$enable_gtk" = "yes")
--- 
-2.8.1
-
diff --git a/meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch b/meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
new file mode 100644
index 00000000000..e28fdcad948
--- /dev/null
+++ b/meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
@@ -0,0 +1,26 @@
+From c2495a4c042e6a675da69bab20cc3669391e8e2a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 23 Aug 2017 18:38:26 +0300
+Subject: [PATCH 1/2] Do not build anything in help/ as it requires itstool.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ meson.build | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 4ac3934..8c4369a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -116,7 +116,6 @@ subdir('tools')
+ subdir('tests')
+ 
+ subdir('data')
+-subdir('help')
+ subdir('po')
+ 
+ meson.add_install_script('build-aux/meson_post_install.sh')
+-- 
+2.14.1
+
diff --git a/meta/recipes-kernel/sysprof/files/0001-configure-Add-option-to-enable-disable-polkit.patch b/meta/recipes-kernel/sysprof/files/0001-configure-Add-option-to-enable-disable-polkit.patch
deleted file mode 100644
index 158d9975f29..00000000000
--- a/meta/recipes-kernel/sysprof/files/0001-configure-Add-option-to-enable-disable-polkit.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 2b4005d72d3393933a7914be102ea65505c536cc Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Thu, 21 Jul 2016 11:53:31 +0300
-Subject: [PATCH] configure: Add option to enable/disable polkit
-
-Changes the configure behaviour from autodetecting the polkit by default
-to having an option to disable it explicitly
-
-Upstream-Status: Pending
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- configure.ac | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 2246d5a..3d3fe0f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -104,10 +104,18 @@ PKG_CHECK_MODULES(GTK,
-                   [gtk+-3.0 >= gtk_required_version],
-                   [have_gtk=yes],
-                   [have_gtk=no])
-+AC_ARG_ENABLE([polkit],
-+                   AS_HELP_STRING([--disable-polkit], [Do not use Polkit]),
-+                   [enable_polkit="$enableval"], [enable_polkit="yes"])
-+
-+AS_IF([test "x$enable_polkit" = "xyes"], [
- PKG_CHECK_MODULES(POLKIT,
-                   [polkit-gobject-1],
-                   [have_polkit=yes],
-                   [have_polkit=no])
-+                                         ])
-+AM_CONDITIONAL([HAVE_POLKIT], [test "x$enable_polkit" = "xyes"])
-+
- PKG_CHECK_MODULES(SYSTEMD,
-                   [libsystemd >= systemd_required_version],
-                   [have_systemd=yes],
--- 
-2.4.0
-
diff --git a/meta/recipes-kernel/sysprof/sysprof_3.26.1.bb b/meta/recipes-kernel/sysprof/sysprof_3.26.1.bb
index dbce3d74399..90e00c95c9f 100644
--- a/meta/recipes-kernel/sysprof/sysprof_3.26.1.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_3.26.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://src/sp-application.c;endline=17;md5=40e55577ef122c88fe20052acda64875"
 
-inherit gnomebase gettext systemd upstream-version-is-even
+inherit gnomebase-meson gettext systemd upstream-version-is-even
 
 DEPENDS = "glib-2.0 libxml2-native glib-2.0-native"
 
@@ -12,23 +12,22 @@ SRC_URI[archive.md5sum] = "6f9f947960ba79bb1269d8ee49b7db78"
 SRC_URI[archive.sha256sum] = "d8b9d5c2246696e4a3776a312731dc7c014fbd33478bb14d5512c6f1f35a3b11"
 SRC_URI += " \
            file://define-NT_GNU_BUILD_ID.patch \
-           file://0001-configure-Add-option-to-enable-disable-polkit.patch \
-           file://0001-Disable-check-for-polkit-for-UI.patch \
-           file://0001-Avoid-building-docs.patch \
-          "
-
-AUTOTOOLS_AUXDIR = "${S}/build-aux"
-
-EXTRA_OECONF = "--enable-compile-warnings"
+           file://0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch \
+           "
 
 PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
-PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit,polkit dbus"
+PACKAGECONFIG[gtk] = "-Denable-gtk=true,-Denable-gtk=false,gtk+3"
+PACKAGECONFIG[sysprofd] = "-Dwith_sysprofd=bundled,-Dwith_sysprofd=none,polkit"
 
 SOLIBS = ".so"
 FILES_SOLIBSDEV = ""
 
-SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'sysprof2.service', '', d)}"
+SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'sysprofd', 'sysprof2.service', '', d)}"
 
 # We do not yet work for aarch64.
 COMPATIBLE_HOST = "^(?!aarch64).*"
+
+FILES_${PN} += " \
+               ${datadir}/dbus-1/system-services \
+               ${datadir}/dbus-1/system.d \
+               "
-- 
2.14.1


