Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A7B86606BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 11:20:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Jul 2016 04:20:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,404,1464678000"; d="scan'208";a="1021927639"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 22 Jul 2016 04:20:43 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 5B7A76A4006
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 04:20:33 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2016 09:26:33 +0300
Message-Id: <1469168793-2306-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH v2] sysprof: fix floating dependency on polkit
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
X-List-Received-Date: Fri, 22 Jul 2016 11:20:44 -0000

Fix the floating dependency on polkit by providing a PACKAGECONFIG
option. Then, package the newly created files appropriately.

[YOCTO #9987]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...igure-Add-option-to-enable-disable-polkit.patch | 41 ++++++++++++++++++++++
 meta/recipes-kernel/sysprof/sysprof_git.bb         |  8 +++--
 2 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/sysprof/files/0001-configure-Add-option-to-enable-disable-polkit.patch

diff --git a/meta/recipes-kernel/sysprof/files/0001-configure-Add-option-to-enable-disable-polkit.patch b/meta/recipes-kernel/sysprof/files/0001-configure-Add-option-to-enable-disable-polkit.patch
new file mode 100644
index 0000000..158d997
--- /dev/null
+++ b/meta/recipes-kernel/sysprof/files/0001-configure-Add-option-to-enable-disable-polkit.patch
@@ -0,0 +1,41 @@
+From 2b4005d72d3393933a7914be102ea65505c536cc Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Thu, 21 Jul 2016 11:53:31 +0300
+Subject: [PATCH] configure: Add option to enable/disable polkit
+
+Changes the configure behaviour from autodetecting the polkit by default
+to having an option to disable it explicitly
+
+Upstream-Status: Pending
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ configure.ac | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 2246d5a..3d3fe0f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -104,10 +104,18 @@ PKG_CHECK_MODULES(GTK,
+                   [gtk+-3.0 >= gtk_required_version],
+                   [have_gtk=yes],
+                   [have_gtk=no])
++AC_ARG_ENABLE([polkit],
++                   AS_HELP_STRING([--disable-polkit], [Do not use Polkit]),
++                   [enable_polkit="$enableval"], [enable_polkit="yes"])
++
++AS_IF([test "x$enable_polkit" = "xyes"], [
+ PKG_CHECK_MODULES(POLKIT,
+                   [polkit-gobject-1],
+                   [have_polkit=yes],
+                   [have_polkit=no])
++                                         ])
++AM_CONDITIONAL([HAVE_POLKIT], [test "x$enable_polkit" = "xyes"])
++
+ PKG_CHECK_MODULES(SYSTEMD,
+                   [libsystemd >= systemd_required_version],
+                   [have_systemd=yes],
+-- 
+2.4.0
+
diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
index 2b0fbec..6324d20 100644
--- a/meta/recipes-kernel/sysprof/sysprof_git.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://src/sp-application.c;endline=17;md5=40e55577ef122c88fe20052acda64875"
 
-inherit gnomebase gettext
+inherit gnomebase gettext systemd
 
 DEPENDS = "glib-2.0"
 
@@ -13,6 +13,7 @@ PV = "3.20.0+git${SRCPV}"
 
 SRC_URI = "git://git.gnome.org/sysprof \
            file://define-NT_GNU_BUILD_ID.patch \
+           file://0001-configure-Add-option-to-enable-disable-polkit.patch \
            file://0001-Disable-check-for-polkit-for-UI.patch \
            file://0001-Avoid-building-docs.patch \
            file://0001-callgraph-Use-U64_TO_POINTER.patch \
@@ -27,9 +28,12 @@ EXTRA_OECONF = "--enable-compile-warnings"
 
 PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
+PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit,polkit dbus"
 
-FILES_${PN} += "${datadir}/icons/ ${libdir}/libsysprof*"
+FILES_${PN} += "${datadir}/icons/ ${libdir}/libsysprof* ${datadir}/dbus-1/"
 FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
 
+SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'sysprof2.service', '', d)}"
+
 # We do not yet work for aarch64.
 COMPATIBLE_HOST = "^(?!aarch64).*"
-- 
2.4.0


