Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B63156612D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 14:43:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Dec 2015 06:43:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,403,1444719600"; d="scan'208";a="837661915"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 09 Dec 2015 06:43:12 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Dec 2015 16:40:26 +0200
Message-Id: <510531e399d6320662c772f8bd294bc91cda5808.1449671297.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
References: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
References: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/10] puzzles: update to current commit
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
X-List-Received-Date: Wed, 09 Dec 2015 14:43:12 -0000

Also, update gtk+ dependency to gtk+3, as the code has been ported to it.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../puzzles/files/fix-compiling-failure-with-option-g-O.patch    | 9 ---------
 meta/recipes-sato/puzzles/puzzles_git.bb                         | 6 ++++--
 2 files changed, 4 insertions(+), 11 deletions(-)

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
index 95826c1..9d833b6 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Simon Tatham's Portable Puzzle Collection"
 HOMEPAGE = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
 
-DEPENDS = "gtk+ libxt"
+DEPENDS = "gtk+3 libxt"
 
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
 
@@ -25,6 +25,8 @@ do_configure_prepend () {
     ./mkfiles.pl
 }
 
+EXTRA_OECONF_append = " --with-gtk=3"
+
 FILES_${PN} = "${prefix}/bin/* ${datadir}/applications/*"
 FILES_${PN}-dbg += "${prefix}/bin/.debug"
 
-- 
2.6.2


