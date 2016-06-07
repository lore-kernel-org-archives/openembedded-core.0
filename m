Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 234A4771CA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:48:47 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jun 2016 01:48:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,432,1459839600"; d="scan'208";a="823174736"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 07 Jun 2016 01:48:41 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 11:47:49 +0300
Message-Id: <47c993f9ec5603f67b22c4ee635e890e0fb0d30e.1465288175.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
References: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465288174.git.jussi.kukkonen@intel.com>
References: <cover.1465288174.git.jussi.kukkonen@intel.com>
Subject: [PATCH 31/37] adwaita-icon-theme: Split symbolic icons into 2 packages
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

Symbolic icons are tiny but there's a lot of them and they actually
take multiple times their apparent size on a typical filesystem.

Split the symbolic icons: adwaita-icon-theme-symbolic contains the
icon sizes that seem to be typically used by GTK+ and applications
(16x16 & 24x24). Other sizes are in adwaita-icon-theme-symbolic-hires.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/gnome/adwaita-icon-theme_3.18.0.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.18.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.18.0.bb
index 81c8845..34b82b7 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.18.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.18.0.bb
@@ -24,14 +24,19 @@ do_install_append() {
 	      ${D}${prefix}/share/icons/Adwaita/scalable/*/*-symbolic-rtl.svg
 }
 
-PACKAGES = "${PN}-cursors ${PN}-symbolic ${PN}-hires ${PN}"
+PACKAGES = "${PN}-cursors ${PN}-symbolic-hires ${PN}-symbolic ${PN}-hires ${PN}"
 
 RREPLACES_${PN} = "gnome-icon-theme"
 RCONFLICTS_${PN} = "gnome-icon-theme"
 RPROVIDES_${PN} = "gnome-icon-theme"
 
 FILES_${PN}-cursors = "${prefix}/share/icons/Adwaita/cursors/"
-FILES_${PN}-symbolic = "${prefix}/share/icons/Adwaita/*/*/*.symbolic.png"
+FILES_${PN}-symbolic-hires = "${prefix}/share/icons/Adwaita/96x96/*/*.symbolic.png \
+                              ${prefix}/share/icons/Adwaita/64x64/*/*.symbolic.png \
+                              ${prefix}/share/icons/Adwaita/48x48/*/*.symbolic.png \
+                              ${prefix}/share/icons/Adwaita/32x32/*/*.symbolic.png"
+FILES_${PN}-symbolic = "${prefix}/share/icons/Adwaita/16x16/*/*.symbolic.png \
+                        ${prefix}/share/icons/Adwaita/24x24/*/*.symbolic.png"
 FILES_${PN}-hires = "${prefix}/share/icons/Adwaita/256x256/"
 FILES_${PN} = "${prefix}/share/icons/Adwaita/ \
                ${prefix}/share/pkgconfig/adwaita-icon-theme.pc"
-- 
2.1.4


