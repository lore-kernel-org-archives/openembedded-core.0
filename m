Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1R4Y9w-0001Ic-TT
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 15:08:49 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Sep 2011 06:03:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="49102805"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by orsmga001.jf.intel.com with ESMTP; 16 Sep 2011 06:03:34 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2011 21:01:52 +0800
Message-Id: <b6453bf95e060699b699affe4d4a4138bfa5e8f7.1316177782.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <4d2f36c3f695ed2ad6d38c9f97e30eec306156ba.1316177782.git.lianhao.lu@intel.com>
References: <4d2f36c3f695ed2ad6d38c9f97e30eec306156ba.1316177782.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1316177782.git.lianhao.lu@intel.com>
References: <cover.1316177782.git.lianhao.lu@intel.com>
Subject: [PATCH 2/3] Misc: Added MLPREFIX to final pkg names in case of DEBIAN_NAMES.
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
X-List-Received-Date: Fri, 16 Sep 2011 13:08:49 -0000

[YOCTO #1486]
Added MLPREFIX to the final package names of library packages in case of
DEBIAN_NAMES.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-core/libxml/libxml2.inc           |    2 +-
 meta/recipes-core/libxml/libxml2_2.7.8.bb      |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.12.7.bb         |    4 ++--
 meta/recipes-gnome/gtk+/gtk+_2.16.6.bb         |    4 ++--
 meta/recipes-gnome/gtk+/gtk+_2.22.1.bb         |    4 ++--
 meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb |    4 ++--
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index dfe6a9a..cf789b2 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -34,7 +34,7 @@ export LDFLAGS += "-ldl"
 python populate_packages_prepend () {
 	# autonamer would call this libxml2-2, but we don't want that
 	if bb.data.getVar('DEBIAN_NAMES', d, 1):
-		bb.data.setVar('PKG_libxml2', 'libxml2', d)
+		bb.data.setVar('PKG_libxml2', '${MLPREFIX}libxml2', d)
 }
 
 PACKAGES = "${PN}-dbg ${PN}-dev ${PN}-utils ${PN} ${PN}-doc ${PN}-locale"
diff --git a/meta/recipes-core/libxml/libxml2_2.7.8.bb b/meta/recipes-core/libxml/libxml2_2.7.8.bb
index 616fd09..3909839 100644
--- a/meta/recipes-core/libxml/libxml2_2.7.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.7.8.bb
@@ -1,6 +1,6 @@
 require libxml2.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "8127a65e8c3b08856093099b52599c86"
 SRC_URI[sha256sum] = "cda23bc9ebd26474ca8f3d67e7d1c4a1f1e7106364b690d822e009fdc3c417ec"
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb b/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb
index 7de748c..00c4ee8 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb
@@ -1,6 +1,6 @@
 require gtk+.inc
 
-PR = "r11"
+PR = "r12"
 
 SRC_URI = "http://download.gnome.org/sources/gtk+/2.12/gtk+-${PV}.tar.bz2 \
            file://xsettings.patch \
@@ -47,5 +47,5 @@ python populate_packages_prepend () {
 	do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk-printbackend-%s', 'GTK printbackend module for %s')
 
         if (bb.data.getVar('DEBIAN_NAMES', d, 1)):
-                bb.data.setVar('PKG_${PN}', 'libgtk-2.0', d)
+                bb.data.setVar('PKG_${PN}', '${MLPREFIX}libgtk-2.0', d)
 }
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb b/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb
index 18f61e7..09b917f 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb
@@ -1,6 +1,6 @@
 require gtk+.inc
 
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "http://download.gnome.org/sources/gtk+/2.16/gtk+-${PV}.tar.bz2 \
            file://xsettings.patch \
@@ -47,5 +47,5 @@ python populate_packages_prepend () {
 	do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk-printbackend-%s', 'GTK printbackend module for %s')
 
         if (bb.data.getVar('DEBIAN_NAMES', d, 1)):
-                bb.data.setVar('PKG_${PN}', 'libgtk-2.0', d)
+                bb.data.setVar('PKG_${PN}', '${MLPREFIX}libgtk-2.0', d)
 }
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.22.1.bb b/meta/recipes-gnome/gtk+/gtk+_2.22.1.bb
index 55620d2..ba90e0e 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.22.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.22.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://gtk/gtk.h;endline=27;md5=c59e0b4490dd135a5726ebf851f9b17f \
                     file://gdk/gdk.h;endline=27;md5=07db285ec208fb3e0bf7d861b0614202 \
                     file://tests/testgtk.c;endline=27;md5=262db5db5f776f9863e56df31423e24c"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://download.gnome.org/sources/gtk+/2.22/gtk+-${PV}.tar.bz2 \
            file://xsettings.patch \
@@ -50,5 +50,5 @@ python populate_packages_prepend () {
 	do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk-printbackend-%s', 'GTK printbackend module for %s')
 
         if (bb.data.getVar('DEBIAN_NAMES', d, 1)):
-                bb.data.setVar('PKG_${PN}', 'libgtk-2.0', d)
+                bb.data.setVar('PKG_${PN}', '${MLPREFIX}libgtk-2.0', d)
 }
diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb b/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
index 33c8a1e..ac7dfb1 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
@@ -18,14 +18,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=90b90b60eb30f65fc9c2673d7cf59e24"
 DEPENDS += "virtual/libx11 libxrender freetype fontconfig"
 PROVIDES = "xft"
 
-PR = "r1"
+PR = "r2"
 PE = "1"
 
 XORG_PN = "libXft"
 
 python () {
         if bb.data.getVar('DEBIAN_NAMES', d, 1):
-            bb.data.setVar('PKG_${PN}', 'libxft2', d)
+            bb.data.setVar('PKG_${PN}', '${MLPREFIX}libxft2', d)
 }
 
 FILES_${PN} = "${libdir}/lib*${SOLIBS}"
-- 
1.7.0.4



