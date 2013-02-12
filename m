Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U5IkC-0000zM-Cm
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 17:30:18 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Feb 2013 08:11:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,650,1355126400"; d="scan'208";a="284742150"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 12 Feb 2013 08:13:08 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2013 18:12:46 +0200
Message-Id: <4418188f44de5556b6de48a1035a07a125e1311f.1360684306.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360684306.git.laurentiu.palcu@intel.com>
References: <cover.1360684306.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360684306.git.laurentiu.palcu@intel.com>
References: <cover.1360684306.git.laurentiu.palcu@intel.com>
Subject: [PATCH 11/11] gtk+: use gtk-immodules-cache class
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
X-List-Received-Date: Tue, 12 Feb 2013 16:30:33 -0000

In order to have the proper postinst/postrm scriptlets generated for
gtk+ immodules packages, use the already existing class.

[YOCTO #3853]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc        |    8 +-------
 meta/recipes-gnome/gtk+/gtk+3_3.4.4.bb  |   12 ++----------
 meta/recipes-gnome/gtk+/gtk+_2.24.14.bb |    4 +---
 3 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index d8adc11..8c2b977 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -18,7 +18,7 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 
 PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}"
 
-inherit autotools gtk-doc pkgconfig update-alternatives
+inherit autotools gtk-doc pkgconfig update-alternatives gtk-immodules-cache
 
 PACKAGES += "libgail gtk-demo"
 
@@ -94,9 +94,3 @@ gtk_sysroot_preprocess () {
 	fi
 }
 
-postinst_prologue() {
-if [ "x$D" != "x" ]; then
-  exit 1
-fi
-
-}
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.4.4.bb b/meta/recipes-gnome/gtk+/gtk+3_3.4.4.bb
index e624387..e2a7ef7 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.4.4.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.4.4.bb
@@ -21,7 +21,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/3.4/gtk+-${PV}.tar.xz \
 SRC_URI[md5sum] = "1b2cf29502a6394e8d4b30f7f5bb9131"
 SRC_URI[sha256sum] = "f154e460075034da4c0ce89c320025dcd459da2a1fdf32d92a09522eaca242c7"
 
-inherit autotools pkgconfig gtk-doc update-alternatives
+inherit autotools pkgconfig gtk-doc update-alternatives gtk-immodules-cache
 
 S = "${WORKDIR}/gtk+-${PV}"
 
@@ -90,22 +90,14 @@ ALTERNATIVE_TARGET[gtk-update-icon-cache] = "${bindir}/gtk-update-icon-cache-3.0
 python populate_packages_prepend () {
     import os.path
 
-    prologue = d.getVar("postinst_prologue", 1)
-
     gtk_libdir = d.expand('${libdir}/gtk-3.0/${LIBV}')
     immodules_root = os.path.join(gtk_libdir, 'immodules')
     printmodules_root = os.path.join(gtk_libdir, 'printbackends');
 
-    do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk3-immodule-%s', 'GTK input module for %s', prologue + 'gtk-query-immodules-3.0 > /etc/gtk-3.0/gtk.immodules')
+    d.setVar('GTKIMMODULES_PACKAGES', ' '.join(do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk3-immodule-%s', 'GTK input module for %s')))
     do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk3-printbackend-%s', 'GTK printbackend module for %s')
 
     if (d.getVar('DEBIAN_NAMES', 1)):
         d.setVar('PKG_${PN}', 'libgtk-3.0')
 }
 
-postinst_prologue() {
-if [ "x$D" != "x" ]; then
-  exit 1
-fi
-
-}
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.14.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.14.bb
index fab360d..1520720 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.14.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.14.bb
@@ -49,13 +49,11 @@ do_install_append_class-native () {
 }
 
 python populate_packages_prepend () {
-    prologue = d.getVar("postinst_prologue", True)
-
     gtk_libdir = d.expand('${libdir}/gtk-2.0/${LIBV}')
     immodules_root = os.path.join(gtk_libdir, 'immodules')
     printmodules_root = os.path.join(gtk_libdir, 'printbackends');
 
-    do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk-immodule-%s', 'GTK input module for %s', prologue + 'gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules')
+    d.setVar('GTKIMMODULES_PACKAGES', ' '.join(do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk-immodule-%s', 'GTK input module for %s')))
     do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk-printbackend-%s', 'GTK printbackend module for %s')
 
     if (d.getVar('DEBIAN_NAMES', True)):
-- 
1.7.9.5



