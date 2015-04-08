Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BB76773CC9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 11:08:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 08 Apr 2015 04:08:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,544,1422950400"; d="scan'208";a="676989647"
Received: from heimdall.fi.intel.com ([10.237.72.157])
	by orsmga001.jf.intel.com with ESMTP; 08 Apr 2015 04:08:56 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Apr 2015 14:08:29 +0300
Message-Id: <1428491309-1482-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] gtk+: Upgrade to 2.24.27
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
X-List-Received-Date: Wed, 08 Apr 2015 11:08:57 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+_2.24.25.bb | 33 ---------------------------------
 meta/recipes-gnome/gtk+/gtk+_2.24.27.bb | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+_2.24.25.bb
 create mode 100644 meta/recipes-gnome/gtk+/gtk+_2.24.27.bb

diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.25.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.25.bb
deleted file mode 100644
index ada7956..0000000
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.25.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-require gtk+.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://gtk/gtk.h;endline=27;md5=c59e0b4490dd135a5726ebf851f9b17f \
-                    file://gdk/gdk.h;endline=27;md5=07db285ec208fb3e0bf7d861b0614202 \
-                    file://tests/testgtk.c;endline=27;md5=262db5db5f776f9863e56df31423e24c"
-SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
-           file://xsettings.patch \
-           file://hardcoded_libtool.patch \
-           file://toggle-font.diff;striplevel=0 \
-           file://doc-fixes.patch \
-	  "
-
-SRC_URI[md5sum] = "612350704dd3aacb95355a4981930c6f"
-SRC_URI[sha256sum] = "38af1020cb8ff3d10dda2c8807f11e92af9d2fa4045de61c62eedb7fbc7ea5b3"
-
-EXTRA_OECONF = "--enable-xkb --disable-glibtest --disable-cups --disable-xinerama"
-
-LIBV = "2.10.0"
-
-PACKAGES_DYNAMIC += "^gtk-immodule-.* ^gtk-printbackend-.*"
-
-python populate_packages_prepend () {
-    gtk_libdir = d.expand('${libdir}/gtk-2.0/${LIBV}')
-    immodules_root = os.path.join(gtk_libdir, 'immodules')
-    printmodules_root = os.path.join(gtk_libdir, 'printbackends');
-
-    d.setVar('GTKIMMODULES_PACKAGES', ' '.join(do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk-immodule-%s', 'GTK input module for %s')))
-    do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk-printbackend-%s', 'GTK printbackend module for %s')
-
-    if (d.getVar('DEBIAN_NAMES', True)):
-        d.setVar('PKG_${PN}', '${MLPREFIX}libgtk-2.0')
-}
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.27.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.27.bb
new file mode 100644
index 0000000..b2693d5
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.27.bb
@@ -0,0 +1,33 @@
+require gtk+.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
+                    file://gtk/gtk.h;endline=27;md5=c59e0b4490dd135a5726ebf851f9b17f \
+                    file://gdk/gdk.h;endline=27;md5=07db285ec208fb3e0bf7d861b0614202 \
+                    file://tests/testgtk.c;endline=27;md5=262db5db5f776f9863e56df31423e24c"
+SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
+           file://xsettings.patch \
+           file://hardcoded_libtool.patch \
+           file://toggle-font.diff;striplevel=0 \
+           file://doc-fixes.patch \
+	  "
+
+SRC_URI[md5sum] = "b1e890e15602c5bcb40d85b13fe046fd"
+SRC_URI[sha256sum] = "20cb10cae43999732a9af2e9aac4d1adebf2a9c2e1ba147050976abca5cd24f4"
+
+EXTRA_OECONF = "--enable-xkb --disable-glibtest --disable-cups --disable-xinerama"
+
+LIBV = "2.10.0"
+
+PACKAGES_DYNAMIC += "^gtk-immodule-.* ^gtk-printbackend-.*"
+
+python populate_packages_prepend () {
+    gtk_libdir = d.expand('${libdir}/gtk-2.0/${LIBV}')
+    immodules_root = os.path.join(gtk_libdir, 'immodules')
+    printmodules_root = os.path.join(gtk_libdir, 'printbackends');
+
+    d.setVar('GTKIMMODULES_PACKAGES', ' '.join(do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk-immodule-%s', 'GTK input module for %s')))
+    do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk-printbackend-%s', 'GTK printbackend module for %s')
+
+    if (d.getVar('DEBIAN_NAMES', True)):
+        d.setVar('PKG_${PN}', '${MLPREFIX}libgtk-2.0')
+}
-- 
2.1.4


