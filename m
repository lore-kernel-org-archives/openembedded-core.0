Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5B4997715E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:48:33 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 07 Jun 2016 01:48:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,432,1459839600"; d="scan'208";a="823174489"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 07 Jun 2016 01:48:16 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 11:47:33 +0300
Message-Id: <d3c74ef463621735c90d3f0b69a490e269449c66.1465288175.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
References: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465288174.git.jussi.kukkonen@intel.com>
References: <cover.1465288174.git.jussi.kukkonen@intel.com>
Subject: [PATCH 15/37] puzzles: Use Gtk+3 by default
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
X-List-Received-Date: Tue, 07 Jun 2016 08:48:33 -0000

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


