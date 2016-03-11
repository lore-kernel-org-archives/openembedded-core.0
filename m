Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 14CBF731E5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 13:06:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 11 Mar 2016 05:06:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,320,1455004800"; d="scan'208";a="907975007"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 11 Mar 2016 05:06:52 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 15:12:20 +0200
Message-Id: <cdfe332fa18ab7007527661a7cb458f899f04336.1457698804.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1457698804.git.jussi.kukkonen@intel.com>
References: <cover.1457698804.git.jussi.kukkonen@intel.com>
Subject: [RFC PATCH 01/12] gnome-themes-standard: Add new recipe
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
X-List-Received-Date: Fri, 11 Mar 2016 13:06:59 -0000

Only Adwaita (default GTK+ theme) currently gets installed.

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


