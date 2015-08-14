Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DECF3766FA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 10:55:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Aug 2015 03:55:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,677,1432623600"; d="scan'208";a="768726455"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 14 Aug 2015 03:55:26 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Aug 2015 13:55:40 +0300
Message-Id: <8a20f52f97c27d6a37d73962f2c8c2b1ea9fe5a7.1439549437.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 21/22] midori: remove the recipe and replace references to midori with epiphany
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
X-List-Received-Date: Fri, 14 Aug 2015 10:55:27 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../packagegroups/packagegroup-self-hosted.bb      | 10 +++----
 .../builder/files/builder_hob_start.sh             |  8 +++---
 meta/recipes-sato/midori/midori/liststore.patch    | 29 --------------------
 meta/recipes-sato/midori/midori_0.5.8.bb           | 31 ----------------------
 .../packagegroups/packagegroup-core-x11-sato.bb    |  2 +-
 5 files changed, 10 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-sato/midori/midori/liststore.patch
 delete mode 100644 meta/recipes-sato/midori/midori_0.5.8.bb

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 7d5a41a..0c79827 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -28,10 +28,10 @@ RDEPENDS_packagegroup-self-hosted = "\
     packagegroup-self-hosted-host-tools \
     "
 
-# midori depends on webkit-gtk which could not build for mips64
-MIDORI = "midori"
-MIDORI_mips64 = ""
-MIDORI_mips64n32 = ""
+# epiphany depends on webkitgtk which could not build for mips64
+EPIPHANY = "epiphany"
+EPIPHANY_mips64 = ""
+EPIPHANY_mips64n32 = ""
 
 RDEPENDS_packagegroup-self-hosted-host-tools = "\
     connman \
@@ -198,7 +198,7 @@ RDEPENDS_packagegroup-self-hosted-graphics = "\
     python-pygtk \
     gtk-theme-clearlooks \
     xdg-utils \
-    ${MIDORI} \
+    ${EPIPHANY} \
     leafpad \
     pcmanfm \
     vte \
diff --git a/meta/recipes-graphics/builder/files/builder_hob_start.sh b/meta/recipes-graphics/builder/files/builder_hob_start.sh
index 65a68ee..b394b09 100644
--- a/meta/recipes-graphics/builder/files/builder_hob_start.sh
+++ b/meta/recipes-graphics/builder/files/builder_hob_start.sh
@@ -18,10 +18,10 @@ if [ ! -d /home/builder/.local/share/applications ]; then
     #register folders to open with PCManFM filemanager
     xdg-mime default pcmanfm.desktop inode/directory
 
-    #register html links and files with Midori
-    xdg-mime default midori.desktop x-scheme-handler/http
-    xdg-mime default midori.desktop x-scheme-handler/https
-    xdg-mime default midori.desktop text/html
+    #register html links and files with epiphany
+    xdg-mime default epiphany.desktop x-scheme-handler/http
+    xdg-mime default epiphany.desktop x-scheme-handler/https
+    xdg-mime default epiphany.desktop text/html
 
     #register text files with leafpad text editor
     xdg-mime default leafpad.desktop text/plain
diff --git a/meta/recipes-sato/midori/midori/liststore.patch b/meta/recipes-sato/midori/midori/liststore.patch
deleted file mode 100644
index 4e5d666..0000000
--- a/meta/recipes-sato/midori/midori/liststore.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-GLib 2.44 has a GListStore type which is GLib.ListStore in Vala, resulting in an ambigous type and compile failure.
-
-Fix by using the full type name.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/extensions/history-list.vala b/extensions/history-list.vala
-index 3a864b1..f309c0c 100644
---- a/extensions/history-list.vala
-+++ b/extensions/history-list.vala
-@@ -319,7 +319,7 @@ namespace HistoryList {
-         }
- 
-         private void create_widgets () {
--            ListStore model;
-+            Gtk.ListStore model;
-             TreeIter iter;
-             TreeIter? active_iter = null;
- 
-@@ -331,7 +331,7 @@ namespace HistoryList {
- 
-             var tab_closing_behavior = this.hl_manager.get_integer ("TabClosingBehavior");
- 
--            model = new ListStore (2, typeof (string), typeof (int));
-+            model = new Gtk.ListStore (2, typeof (string), typeof (int));
- 
-             model.append (out iter);
-             model.set (iter, TabClosingBehaviorModel.TEXT, _("Do nothing"),
diff --git a/meta/recipes-sato/midori/midori_0.5.8.bb b/meta/recipes-sato/midori/midori_0.5.8.bb
deleted file mode 100644
index 1c027fe4..0000000
--- a/meta/recipes-sato/midori/midori_0.5.8.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "A lightweight web browser"
-HOMEPAGE = "http://midori-browser.org/"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-DEPENDS = "webkit-gtk libsoup-2.4 openssl python-native python-docutils-native librsvg-native libnotify libxscrnsaver"
-
-SRC_URI = "https://launchpad.net/midori/trunk/0.5.8/+download/${BPN}-${PV}.tar.bz2;subdir=${BPN}-${PV} \
-           file://liststore.patch"
-
-SRC_URI[md5sum] = "b89e25e74199d705e74767499a415976"
-SRC_URI[sha256sum] = "af19135fd4c4b04345df4d3592e7939c20f9b40eaca24550e6cb619751aa9381"
-
-# midori depends on webkit-gtk, and webkit-gtk can NOT be built on
-# MIPS64 with n32 ABI. So remove it from mips64 n32 temporarily.
-COMPATIBLE_HOST_mips64n32 = "null"
-
-inherit gtk-icon-cache pkgconfig vala pythonnative cmake distro_features_check
-
-# The webkit-gtk and libxscrnsaver requires x11 in DISTRO_FEATURES
-REQUIRED_DISTRO_FEATURES = "x11"
-
-EXTRA_OECMAKE = " \
-    -DCMAKE_INSTALL_PREFIX=${prefix} \
-    -DUSE_ZEITGEIST=0 \
-"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-RRECOMMENDS_${PN} += "glib-networking ca-certificates adwaita-icon-theme"
-
-FILES_${PN} += "${datadir}/appdata"
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 04d1e99..353b2ba 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -48,7 +48,7 @@ FILEMANAGER ?= "pcmanfm"
 FILEMANAGER_mips ?= ""
 
 WEB ?= ""
-#WEB = "midori"
+#WEB = "epiphany"
 
 SUMMARY_${PN}-apps = "Sato desktop - applications"
 RDEPENDS_${PN}-apps = "\
-- 
2.1.4


