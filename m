Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 127F36AC4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:08:04 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 14 Dec 2015 07:08:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,427,1444719600"; d="scan'208";a="707064041"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Dec 2015 07:08:04 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 17:05:15 +0200
Message-Id: <b78f0e291be8c42b407b58d418f08581599d4742.1450104283.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/20] puzzles: update to current commit
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
X-List-Received-Date: Mon, 14 Dec 2015 15:08:04 -0000

gtk+3 support has been added upstream, so add an option for that.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../puzzles/files/fix-compiling-failure-with-option-g-O.patch    | 9 ---------
 meta/recipes-sato/puzzles/puzzles_git.bb                         | 8 ++++++--
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-sato/puzzles/files/fix-compiling-failure-with-option-g-O.patch b/meta/recipes-sato/puzzles/files/fix-compiling-failure-with-option-g-O.patch
index d246fee..c134acd 100644
--- a/meta/recipes-sato/puzzles/files/fix-compiling-failure-with-option-g-O.patch
+++ b/meta/recipes-sato/puzzles/files/fix-compiling-failure-with-option-g-O.patch
@@ -29,15 +29,6 @@ diff --git a/gtk.c b/gtk.c
 index a2eba2c..c54bf63 100644
 --- a/gtk.c
 +++ b/gtk.c
-@@ -381,7 +381,7 @@ static void clear_backing_store(frontend *fe)
- 
- static void setup_backing_store(frontend *fe)
- {
--    cairo_t *cr;
-+    cairo_t *cr = NULL;
-     int i;
- 
-     fe->pixmap = gdk_pixmap_new(fe->area->window, fe->pw, fe->ph, -1);
 @@ -2481,7 +2481,7 @@ char *fgetline(FILE *fp)
  int main(int argc, char **argv)
  {
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 95826c1..df000e3 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Simon Tatham's Portable Puzzle Collection"
 HOMEPAGE = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
 
-DEPENDS = "gtk+ libxt"
+DEPENDS = "libxt"
 
 # The libxt requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
@@ -13,7 +13,7 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            file://fix-compiling-failure-with-option-g-O.patch \
            file://0001-Use-labs-instead-of-abs.patch \
 "
-SRCREV = "c296301a06ce49b87c954c9d15452521dfeddf1a"
+SRCREV = "346584bf6e38232be8773c24fd7dedcbd7b3d9ed"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
@@ -21,6 +21,10 @@ S = "${WORKDIR}/git"
 
 inherit autotools-brokensep distro_features_check
 
+PACKAGECONFIG ??= "gtk2"
+PACKAGECONFIG[gtk2] = "--with-gtk=2,,gtk+,"
+PACKAGECONFIG[gtk3] = "--with-gtk=3,,gtk+3,"
+
 do_configure_prepend () {
     ./mkfiles.pl
 }
-- 
2.6.2


