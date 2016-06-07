Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E816360667
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:47:59 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 07 Jun 2016 01:48:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,432,1459839600"; d="scan'208";a="823174311"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 07 Jun 2016 01:47:59 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 11:47:19 +0300
Message-Id: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465288174.git.jussi.kukkonen@intel.com>
References: <cover.1465288174.git.jussi.kukkonen@intel.com>
Subject: [PATCH 01/37] gnome-themes-standard: Add new GTK+2 theme
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
X-List-Received-Date: Tue, 07 Jun 2016 08:48:00 -0000

This is useful as it matches the default GTK+3 theme well.
Only the Adwaita theme currently gets installed.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../gnome/gnome-themes-standard_3.18.0.bb          | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta/recipes-gnome/gnome/gnome-themes-standard_3.18.0.bb

diff --git a/meta/recipes-gnome/gnome/gnome-themes-standard_3.18.0.bb b/meta/recipes-gnome/gnome/gnome-themes-standard_3.18.0.bb
new file mode 100644
index 0000000..06135e0
--- /dev/null
+++ b/meta/recipes-gnome/gnome/gnome-themes-standard_3.18.0.bb
@@ -0,0 +1,37 @@
+SUMMARY = "GTK+2 standard themes"
+HOMEPAGE = "http://ftp.gnome.org/pub/GNOME/sources/gnome-themes-standard/"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+SECTION = "x11/gnome"
+
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+
+inherit autotools pkgconfig gettext gtk-icon-cache upstream-version-is-even
+
+DEPENDS += "intltool-native gtk+"
+
+MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
+          "
+
+SRC_URI[md5sum] = "4d17bc62e4d0c5440fc4eda3d9271367"
+SRC_URI[sha256sum] = "e646eb04c225282b7df7fff65741adaad4cf9ed2c12616b7310e7edd27d2bacb"
+
+EXTRA_OECONF = "--disable-gtk3-engine"
+
+do_install_append() {
+        # Only building Adwaita, remove highcontrast files
+        rm -rf ${D}${prefix}/share/themes/HighContrast \
+               ${D}${prefix}/share/icons
+}
+
+# There could be gnome-theme-highcontrast as well but that requires
+# gtk+3 and includes lots of icons (is also broken with B != S).
+PACKAGES += "gnome-theme-adwaita \
+             gnome-theme-adwaita-dbg \
+             gnome-theme-adwaita-dev"
+
+FILES_gnome-theme-adwaita = "${prefix}/share/themes/Adwaita \
+                              ${libdir}/gtk-2.0/2.10.0/engines/libadwaita.so"
+FILES_gnome-theme-adwaita-dev = "${libdir}/gtk-2.0/2.10.0/engines/libadwaita.la"
+FILES_gnome-theme-adwaita-dbg = "${libdir}/gtk-2.0/2.10.0/engines/.debug/libadwaita.so"
-- 
2.1.4


