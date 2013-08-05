Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id B5007621B1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 14:43:02 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Aug 2013 07:43:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,819,1367996400"; d="scan'208";a="277913344"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Aug 2013 07:43:02 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2013 17:44:43 +0300
Message-Id: <1375713884-8528-3-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1375713884-8528-1-git-send-email-cristian.iorga@intel.com>
References: <1375713884-8528-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 3/4] telepathy-glib: upgrade to v0.20.4
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
X-List-Received-Date: Mon, 05 Aug 2013 14:43:03 -0000

pkgconfig.patch removed; already integrated in upstream.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../telepathy/telepathy-glib/pkgconfig.patch       | 41 ----------------------
 ...thy-glib_0.20.1.bb => telepathy-glib_0.20.4.bb} |  8 ++---
 2 files changed, 3 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-connectivity/telepathy/telepathy-glib/pkgconfig.patch
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.20.1.bb => telepathy-glib_0.20.4.bb} (73%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib/pkgconfig.patch b/meta/recipes-connectivity/telepathy/telepathy-glib/pkgconfig.patch
deleted file mode 100644
index 8f0ac28..0000000
--- a/meta/recipes-connectivity/telepathy/telepathy-glib/pkgconfig.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 4acc51d5b848359211bb8a00f0daa8e0bc44eb65 Mon Sep 17 00:00:00 2001
-From: Will Thompson <will.thompson@collabora.co.uk>
-Date: Mon, 10 Dec 2012 14:11:05 +0000
-Subject: Remove pkg-config dependency from .pc files
-
-This causes problems for Yocto, since they use pc files when choosing
-package dependencies. It doesn't make a huge amount of sense for a
-.pc file to depend on pkg-config: by the time you've parsed the file,
-you've got pkg-config. And the versioned dependency is checked by
-configure, as commit 1154794 (which added this) mentions, so if you've
-compiled telepathy-glib, your pkg-config is new enough.
----
-diff --git a/telepathy-glib/telepathy-glib-uninstalled.pc.in b/telepathy-glib/telepathy-glib-uninstalled.pc.in
-index 932983c..3dbefb2 100644
---- a/telepathy-glib/telepathy-glib-uninstalled.pc.in
-+++ b/telepathy-glib/telepathy-glib-uninstalled.pc.in
-@@ -6,7 +6,6 @@ abs_top_builddir=@abs_top_builddir@
- Name: Telepathy-GLib (uninstalled copy)
- Description: GLib utility library for the Telepathy framework
- Version: @VERSION@
--Requires: pkg-config >= 0.21
- Requires.private: dbus-1 >= 0.95, dbus-glib-1 >= 0.90, glib-2.0 >= 2.30, gobject-2.0 >= 2.30, gio-2.0 >= 2.30
- Libs: ${abs_top_builddir}/telepathy-glib/libtelepathy-glib.la
- Cflags: -I${abs_top_srcdir} -I${abs_top_builddir}
-diff --git a/telepathy-glib/telepathy-glib.pc.in b/telepathy-glib/telepathy-glib.pc.in
-index 1c5f4b6..75ac275 100644
---- a/telepathy-glib/telepathy-glib.pc.in
-+++ b/telepathy-glib/telepathy-glib.pc.in
-@@ -6,7 +6,6 @@ includedir=@includedir@
- Name: Telepathy-GLib
- Description: GLib utility library for the Telepathy framework
- Version: @VERSION@
--Requires: pkg-config >= 0.21
- Requires.private: dbus-1 >= 0.95, dbus-glib-1 >= 0.90, glib-2.0 >= 2.30, gobject-2.0 >= 2.30, gio-2.0 >= 2.30
- Libs: -L${libdir} -ltelepathy-glib
- Cflags: -I${includedir}/telepathy-1.0
---
-cgit v0.9.0.2-2-gbebe
diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.20.1.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.20.4.bb
similarity index 73%
rename from meta/recipes-connectivity/telepathy/telepathy-glib_0.20.1.bb
rename to meta/recipes-connectivity/telepathy/telepathy-glib_0.20.4.bb
index 85071c0..7d529b6 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.20.1.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.20.4.bb
@@ -4,11 +4,9 @@ HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
 DEPENDS = "glib-2.0 dbus python-native-runtime dbus-native dbus-glib libxslt-native"
 LICENSE = "LGPLv2.1+"
 
-SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz \
-           file://pkgconfig.patch"
-
-SRC_URI[md5sum] = "780034ff7433f33e6577b02fd7a2cb0a"
-SRC_URI[sha256sum] = "01a0343f61fbd389fed9c819751aa75914150aa567472dcb480ced7f4ed261b6"
+SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "78be56307d2da7c580cf6df33a225ba0"
+SRC_URI[sha256sum] = "c9a307c85d412c58bc68265c4c4128a8e3ffb283bc784143f1f086faaafcb16c"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
-- 
1.8.1.2


