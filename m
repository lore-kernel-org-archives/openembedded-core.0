Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 27CEE6FF60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 08:15:15 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 14 Jun 2016 01:15:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,470,1459839600"; d="scan'208";a="718727941"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Jun 2016 01:15:15 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2016 11:14:36 +0300
Message-Id: <28bc0b1fbf1262a1553f1bb523cdd0f784849a3b.1465891164.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
References: <cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465891164.git.jussi.kukkonen@intel.com>
References: <cover.1465891164.git.jussi.kukkonen@intel.com>
Subject: [PATCHv3 12/30] puzzles: Use Gtk+3 by default
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
X-List-Received-Date: Tue, 14 Jun 2016 08:15:15 -0000

Also split the puzzles into two packages (just like the old
oh-puzzles).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 346f43b..a9daacd 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -23,16 +23,28 @@ S = "${WORKDIR}/git"
 
 inherit autotools-brokensep distro_features_check pkgconfig
 
-PACKAGECONFIG ??= "gtk2"
+PACKAGECONFIG ??= "gtk3"
 PACKAGECONFIG[gtk2] = "--with-gtk=2,,gtk+,"
 PACKAGECONFIG[gtk3] = "--with-gtk=3,,gtk+3,"
 
+PACKAGES += "${PN}-extra"
+FILES_${PN} = ""
+FILES_${PN}-extra = "${prefix}/bin ${datadir}/applications"
+
+python __anonymous () {
+    var = bb.data.expand("FILES_${PN}", d, 1)
+    data = d.getVar(var, True)
+    for name in ("bridges", "fifteen", "inertia", "map", "samegame", "slant"):
+        data = data + " ${prefix}/bin/%s" % name
+        data = data + " ${datadir}/applications/%s.desktop" % name
+    d.setVar(var, data)
+}
+
+
 do_configure_prepend () {
     ./mkfiles.pl
 }
 
-FILES_${PN} = "${prefix}/bin/* ${datadir}/applications/*"
-
 do_install () {
     rm -rf ${D}/*
     export prefix=${D}
-- 
2.1.4


