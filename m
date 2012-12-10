Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Ti5Rz-0008ED-Gc
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Dec 2012 16:39:28 +0100
Received: from mail-wg0-f69.google.com ([74.125.82.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 10 Dec 2012 07:24:50 -0800
Received: by mail-wg0-f69.google.com with SMTP id es5so2156536wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2012 07:24:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=NkIG7zWx9m51RaJWhAWynJ6Fv26S0gMTbLDMuY4Yuk4=;
	b=KJqXR9LYjEb08SRtjmvJhP7umtax1QGWhoapK+HSCdcCfxvKfJ0BX6xPn3fQlJB8ea
	VTzFsSOpIFWGZ65tITL165/W57vYfJEFDOcIK4TWl5hNXpEkr6W4NOqCD70FNBYTgQRS
	PAsyIqCGt58Ftsowt3QdF688fDQaVRcSdrx5hm3kmyaoLESonUxzF7vgyCoGgTi7jh5P
	J3RQPvjaA1Ru1p84zEcYure1dL0tCrAYIMBF+6WD6oiaf+qmgQArtnVq/SKsAAxdL9YM
	0YBcgqWyyow+oN4cCaHTRuavDztx22IaTszE3AbTH7+fh7qvNTcYnOFG2tGHkQ68FzHv
	G8aA==
Received: by 10.180.73.80 with SMTP id j16mr11406804wiv.5.1355153088631;
	Mon, 10 Dec 2012 07:24:48 -0800 (PST)
Received: by 10.180.73.80 with SMTP id j16mr11406778wiv.5.1355153088355;
	Mon, 10 Dec 2012 07:24:48 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id p3sm10403021wic.8.2012.12.10.07.24.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Dec 2012 07:24:46 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Dec 2012 15:23:07 +0000
Message-Id: <1355152987-6438-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmoLyV0iR7DLdG1hGqzWH9dxMtJ2N9vqLG7Fvla4/w7aI1HPgj7mO05FW0cjYyDQ/aYR19Pi2OnyOU7b2C8pVV8cvjmMYBHXT5n4PO/4DzdpKkVOgFDSCRxKkvJtiR8478SeWF+bqqCDMkDdODdZ5hX8Nz5z/1zbT2Sr9QJRsNf6choqBeaIg6I6denKTq3vHdRQ8S8
Subject: [PATCH] telepathy-glib: remove pkgconfig dependency in pkgconfig
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Dec 2012 15:39:28 -0000

A pkg-config file depending on pkg-config doesn't really make sense, and this is
causing unexpected dependencies on pkg-config at image contruction time (see

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../telepathy/telepathy-glib/pkgconfig.patch       |   41 ++++++++++++++++++++
 .../telepathy/telepathy-glib_0.19.8.bb             |    5 ++-
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/telepathy/telepathy-glib/pkgconfig.patch

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib/pkgconfig.patch b/meta/recipes-connectivity/telepathy/telepathy-glib/pkgconfig.patch
new file mode 100644
index 0000000..8f0ac28
--- /dev/null
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib/pkgconfig.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 4acc51d5b848359211bb8a00f0daa8e0bc44eb65 Mon Sep 17 00:00:00 2001
+From: Will Thompson <will.thompson@collabora.co.uk>
+Date: Mon, 10 Dec 2012 14:11:05 +0000
+Subject: Remove pkg-config dependency from .pc files
+
+This causes problems for Yocto, since they use pc files when choosing
+package dependencies. It doesn't make a huge amount of sense for a
+.pc file to depend on pkg-config: by the time you've parsed the file,
+you've got pkg-config. And the versioned dependency is checked by
+configure, as commit 1154794 (which added this) mentions, so if you've
+compiled telepathy-glib, your pkg-config is new enough.
+---
+diff --git a/telepathy-glib/telepathy-glib-uninstalled.pc.in b/telepathy-glib/telepathy-glib-uninstalled.pc.in
+index 932983c..3dbefb2 100644
+--- a/telepathy-glib/telepathy-glib-uninstalled.pc.in
++++ b/telepathy-glib/telepathy-glib-uninstalled.pc.in
+@@ -6,7 +6,6 @@ abs_top_builddir=@abs_top_builddir@
+ Name: Telepathy-GLib (uninstalled copy)
+ Description: GLib utility library for the Telepathy framework
+ Version: @VERSION@
+-Requires: pkg-config >= 0.21
+ Requires.private: dbus-1 >= 0.95, dbus-glib-1 >= 0.90, glib-2.0 >= 2.30, gobject-2.0 >= 2.30, gio-2.0 >= 2.30
+ Libs: ${abs_top_builddir}/telepathy-glib/libtelepathy-glib.la
+ Cflags: -I${abs_top_srcdir} -I${abs_top_builddir}
+diff --git a/telepathy-glib/telepathy-glib.pc.in b/telepathy-glib/telepathy-glib.pc.in
+index 1c5f4b6..75ac275 100644
+--- a/telepathy-glib/telepathy-glib.pc.in
++++ b/telepathy-glib/telepathy-glib.pc.in
+@@ -6,7 +6,6 @@ includedir=@includedir@
+ Name: Telepathy-GLib
+ Description: GLib utility library for the Telepathy framework
+ Version: @VERSION@
+-Requires: pkg-config >= 0.21
+ Requires.private: dbus-1 >= 0.95, dbus-glib-1 >= 0.90, glib-2.0 >= 2.30, gobject-2.0 >= 2.30, gio-2.0 >= 2.30
+ Libs: -L${libdir} -ltelepathy-glib
+ Cflags: -I${includedir}/telepathy-1.0
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.8.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.8.bb
index 6bf27b2..370a822 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.8.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.8.bb
@@ -3,9 +3,10 @@ DESCRIPTION = "Telepathy Framework: GLib-based helper library for connection man
 HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
 DEPENDS = "glib-2.0 dbus python-native-runtime dbus-native dbus-glib"
 LICENSE = "LGPLv2.1+"
-PR = "r1"
+PR = "r2"
 
-SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz"
+SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz \
+           file://pkgconfig.patch"
 
 SRC_URI[md5sum] = "ffd0953953981473fcd9c373ccb9e882"
 SRC_URI[sha256sum] = "581682a937ee33bd4ce01e17d09b338155a79dff44925b988b0701fdbee50b20"
-- 
1.7.10



