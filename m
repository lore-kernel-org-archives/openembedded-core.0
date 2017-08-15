Return-Path: <jussi.kukkonen@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id EC080784E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 10:33:25 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 15 Aug 2017 03:33:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,377,1498546800"; d="scan'208";a="140363971"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 15 Aug 2017 03:33:27 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id CFC4958061A;
	Tue, 15 Aug 2017 03:33:26 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Aug 2017 13:33:20 +0300
Message-Id: <03a2d5e58a398227bd5b9ae1628f3b348c6791b9.1502792828.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1502792828.git.jussi.kukkonen@intel.com>
References: <cover.1502792828.git.jussi.kukkonen@intel.com>
Subject: [PATCH 4/4] gdk-pixbuf: Upgrade 2.36.6 -> 2.36.8
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
X-List-Received-Date: Tue, 15 Aug 2017 10:33:26 -0000

Smallish releases with bug fixes and minor improvements.

shared-mime-info is now always used for image type sniffing.
The dependency does not seem to currently be a build-time dependency
but configure.ac does check for it: I took the easy route and just
added shared-mime-info to DEPENDS as well.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../gdk-pixbuf/{gdk-pixbuf_2.36.6.bb => gdk-pixbuf_2.36.8.bb} | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.36.6.bb => gdk-pixbuf_2.36.8.bb} (91%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.6.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.8.bb
similarity index 91%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.6.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.8.bb
index fe3e636..3d16ee0 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.6.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.8.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 
 SECTION = "libs"
 
-DEPENDS = "glib-2.0 gdk-pixbuf-native"
+DEPENDS = "glib-2.0 gdk-pixbuf-native shared-mime-info"
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
@@ -21,8 +21,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-queryloaders-Make-output-more-reproducible.patch \
            "
 
-SRC_URI[md5sum] = "5dd53760750670d27c194ff6ace7eb51"
-SRC_URI[sha256sum] = "455eb90c09ed1b71f95f3ebfe1c904c206727e0eeb34fc94e5aaf944663a820c"
+SRC_URI[md5sum] = "e0aaa0061eb12667b32b27472230b962"
+SRC_URI[sha256sum] = "5d68e5283cdc0bf9bda99c3e6a1d52ad07a03364fa186b6c26cfc86fcd396a19"
 
 inherit autotools pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gtk-doc lib_package
 
@@ -39,12 +39,13 @@ PACKAGECONFIG[jpeg] = "--with-libjpeg,--without-libjpeg,jpeg"
 PACKAGECONFIG[tiff] = "--with-libtiff,--without-libtiff,tiff"
 PACKAGECONFIG[jpeg2000] = "--with-libjasper,--without-libjasper,jasper"
 
-# Use GIO to sniff image format instead of trying all loaders
-PACKAGECONFIG[gio-sniff] = "--enable-gio-sniffing,--disable-gio-sniffing,,shared-mime-info"
 PACKAGECONFIG[x11] = "--with-x11,--without-x11,virtual/libx11"
 
 PACKAGES =+ "${PN}-xlib"
 
+# For GIO image type sniffing
+RDEPENDS_${PN} = "shared-mime-info"
+
 FILES_${PN}-xlib = "${libdir}/*pixbuf_xlib*${SOLIBS}"
 ALLOW_EMPTY_${PN}-xlib = "1"
 
-- 
2.1.4


