Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7983870030
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:07:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 09 Mar 2016 07:06:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="933083683"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Mar 2016 07:06:28 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:01:59 +0200
Message-Id: <b23c67168b1d3d661aa70b7b5aa8c44fce3e93f9.1457535622.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 13/24] gtk+3: enable gobject-introspection
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
X-List-Received-Date: Wed, 09 Mar 2016 15:07:34 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 50a336c..bd29300 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -10,7 +10,7 @@ DEPENDS = "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf \
 
 LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
 
-inherit autotools pkgconfig gtk-doc update-alternatives gtk-immodules-cache gsettings distro_features_check upstream-version-is-even
+inherit autotools pkgconfig gtk-doc update-alternatives gtk-immodules-cache gsettings distro_features_check upstream-version-is-even gobject-introspection
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 # This should be in autotools.bbclass, but until something elses uses it putting
@@ -28,10 +28,13 @@ EXTRA_OECONF += " \
                  --disable-xinerama \
                  --enable-modules \
                  --disable-cups \
-                 --disable-introspection \
                  --disable-colord \
 "
 
+do_compile_prepend() {
+        export GIR_EXTRA_LIBS_PATH="${B}/gdk/.libs"
+}
+
 PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "x11", "x11", "", d)} \
                    ${@bb.utils.contains("DISTRO_FEATURES", "opengl x11", "glx", "", d)} \
                    ${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "", d)}"
@@ -62,10 +65,9 @@ FILES_${PN}-demo = "${bindir}/gtk3-demo \
 # dependencies are present.
 RDEPENDS_${PN}-demo += "gdk-pixbuf-loader-png shared-mime-info"
 
-FILES_${PN} = "${bindir}/gtk-update-icon-cache-3.0 \
+FILES_${PN}_append = " ${bindir}/gtk-update-icon-cache-3.0 \
                ${bindir}/gtk-query-immodules-3.0 \
                ${bindir}/gtk-launch \
-               ${libdir}/lib*${SOLIBS} \
                ${datadir}/themes ${sysconfdir} ${datadir}/glib-2.0/schemas/ \
                ${libdir}/gtk-3.0/${LIBV}/engines/libpixmap.so \
                ${libdir}/gtk-3.0/modules/*.so"
-- 
2.7.0


