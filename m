Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 62B0B6FF7F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 21:54:10 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP; 15 Dec 2016 13:54:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,354,1477983600"; d="scan'208";a="43103307"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by fmsmga006.fm.intel.com with ESMTP; 15 Dec 2016 13:54:12 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 15:55:28 -0600
Message-Id: <1481838928-15213-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH] pcmanfm: upgrading to 1.2.5
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
X-List-Received-Date: Thu, 15 Dec 2016 21:54:11 -0000

From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
---
 meta/recipes-sato/pcmanfm/pcmanfm_1.2.4.bb | 43 ------------------------------
 meta/recipes-sato/pcmanfm/pcmanfm_1.2.5.bb | 43 ++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-sato/pcmanfm/pcmanfm_1.2.4.bb
 create mode 100644 meta/recipes-sato/pcmanfm/pcmanfm_1.2.5.bb

diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.4.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.4.bb
deleted file mode 100644
index a6bf213..0000000
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.4.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-SUMMARY = "Fast lightweight tabbed filemanager"
-HOMEPAGE = "http://pcmanfm.sourceforge.net/"
-
-LICENSE = "GPLv2 & GPLv2+ & LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-                    file://src/pcmanfm.h;endline=22;md5=417b3855771a3a87f8ad753d994491f0 \
-                    file://src/gseal-gtk-compat.h;endline=21;md5=46922c8691f58d124f9420fe16149ce2"
-
-SECTION = "x11"
-DEPENDS = "gtk+3 startup-notification libfm intltool-native gettext-native"
-
-
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|aarch64.*|arm.*|mips.*|powerpc.*|sh.*)-(linux|freebsd.*)'
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.xz \
-	   file://gnome-fs-directory.png \
-	   file://gnome-fs-regular.png \
-	   file://gnome-mime-text-plain.png \
-	   file://emblem-symbolic-link.png \
-	   file://no-desktop.patch"
-
-SRC_URI[md5sum] = "19764c2f59653724c8713e0064fa6829"
-SRC_URI[sha256sum] = "38cdbb5f01d24483b41b8e6846e4aa66a5751bb3982a8618899e88a853dbe313"
-
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/"
-
-inherit autotools pkgconfig distro_features_check
-
-# The startup-notification requires x11 in DISTRO_FEATURES
-REQUIRED_DISTRO_FEATURES = "x11"
-
-EXTRA_OECONF = "--with-gtk=3"
-
-do_install_append () {
-	install -d ${D}/${datadir}
-	install -d ${D}/${datadir}/pixmaps/
-
-	install -m 0644 ${WORKDIR}/*.png ${D}/${datadir}/pixmaps
-}
-
-FILES_${PN} += "${libdir}/pcmanfm"
-
-RRECOMMENDS_${PN} += "adwaita-icon-theme"
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.5.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.5.bb
new file mode 100644
index 0000000..aab7911
--- /dev/null
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.5.bb
@@ -0,0 +1,43 @@
+SUMMARY = "Fast lightweight tabbed filemanager"
+HOMEPAGE = "http://pcmanfm.sourceforge.net/"
+
+LICENSE = "GPLv2 & GPLv2+ & LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+                    file://src/pcmanfm.h;endline=22;md5=417b3855771a3a87f8ad753d994491f0 \
+                    file://src/gseal-gtk-compat.h;endline=21;md5=46922c8691f58d124f9420fe16149ce2"
+
+SECTION = "x11"
+DEPENDS = "gtk+3 startup-notification libfm intltool-native gettext-native"
+
+
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|aarch64.*|arm.*|mips.*|powerpc.*|sh.*)-(linux|freebsd.*)'
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.xz \
+	   file://gnome-fs-directory.png \
+	   file://gnome-fs-regular.png \
+	   file://gnome-mime-text-plain.png \
+	   file://emblem-symbolic-link.png \
+	   file://no-desktop.patch"
+
+SRC_URI[md5sum] = "b4d1f8ce08d87e4f27805a246fc51ac2"
+SRC_URI[sha256sum] = "0c86cac028b705ff314c7464d814c2cf7ff604c17491c20aa204b1ef1a80ad67"
+
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/"
+
+inherit autotools pkgconfig distro_features_check
+
+# The startup-notification requires x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
+
+EXTRA_OECONF = "--with-gtk=3"
+
+do_install_append () {
+	install -d ${D}/${datadir}
+	install -d ${D}/${datadir}/pixmaps/
+
+	install -m 0644 ${WORKDIR}/*.png ${D}/${datadir}/pixmaps
+}
+
+FILES_${PN} += "${libdir}/pcmanfm"
+
+RRECOMMENDS_${PN} += "adwaita-icon-theme"
-- 
2.1.4


