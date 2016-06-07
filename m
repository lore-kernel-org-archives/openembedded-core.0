Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 086AA7715E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:48:47 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jun 2016 01:48:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,432,1459839600"; d="scan'208";a="823174734"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 07 Jun 2016 01:48:40 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 11:47:48 +0300
Message-Id: <e95eb9acca9dbbf878d558dd54696e02f2651ec0.1465288175.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
References: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465288174.git.jussi.kukkonen@intel.com>
References: <cover.1465288174.git.jussi.kukkonen@intel.com>
Subject: [PATCH 30/37] gtk+3: Add RRECOMMENDS to match gtk+
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
X-List-Received-Date: Tue, 07 Jun 2016 08:48:48 -0000

Rrecommend a similar set of packages as the gtk+ recipe.

Most importantly this actually makes icons render even when other
packages do not drag in the relevant gdkpixbuf loaders.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index bd29300..12fcaba 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -61,10 +61,6 @@ FILES_${PN}-demo = "${bindir}/gtk3-demo \
                     ${datadir}/icons/hicolor/*/apps/gtk3-demo*.png \
                     ${datadir}/icons/hicolor/*/apps/gtk3-widget-factory*.png"
 
-# The demo uses PNG files and mime type sniffing, so ensure that these
-# dependencies are present.
-RDEPENDS_${PN}-demo += "gdk-pixbuf-loader-png shared-mime-info"
-
 FILES_${PN}_append = " ${bindir}/gtk-update-icon-cache-3.0 \
                ${bindir}/gtk-query-immodules-3.0 \
                ${bindir}/gtk-launch \
@@ -86,7 +82,18 @@ FILES_${PN}-dev += " \
                     ${bindir}/gtk-builder-tool \
                     "
 
-RRECOMMENDS_${PN} = "adwaita-icon-theme-symbolic"
+GTKBASE_RRECOMMENDS ?= "liberation-fonts \
+                        gdk-pixbuf-loader-png \
+                        gdk-pixbuf-loader-jpeg \
+                        gdk-pixbuf-loader-gif \
+                        gdk-pixbuf-loader-xpm \
+                        shared-mime-info \
+                        adwaita-icon-theme-symbolic \
+                        "
+GTKGLIBC_RRECOMMENDS ?= "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
+
+RRECOMMENDS_${PN} = "${GTKBASE_RRECOMMENDS}"
+RRECOMMENDS_${PN}_libc-glibc = "${GTKGLIBC_RRECOMMENDS}"
 
 PACKAGES_DYNAMIC += "^gtk3-immodule-.* ^gtk3-printbackend-.*"
 
-- 
2.1.4


