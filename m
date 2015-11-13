Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 56B7C772D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:43:52 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2015 01:43:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,286,1444719600"; d="scan'208";a="599686532"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2015 01:43:51 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 11:46:46 +0200
Message-Id: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1447405312.git.jussi.kukkonen@intel.com>
References: <cover.1447405312.git.jussi.kukkonen@intel.com>
Subject: [PATCH 01/19] gdk-pixbuf: Upgrade 2.30.8 -> 2.32.1
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
X-List-Received-Date: Fri, 13 Nov 2015 09:43:53 -0000

Remove a backported patch.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...ps-Be-more-careful-about-integer-overflow.patch | 89 ----------------------
 .../{gdk-pixbuf_2.30.8.bb => gdk-pixbuf_2.32.1.bb} |  5 +-
 2 files changed, 2 insertions(+), 92 deletions(-)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-pixops-Be-more-careful-about-integer-overflow.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.30.8.bb => gdk-pixbuf_2.32.1.bb} (94%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-pixops-Be-more-careful-about-integer-overflow.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-pixops-Be-more-careful-about-integer-overflow.patch
deleted file mode 100644
index fe7c1d5..0000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-pixops-Be-more-careful-about-integer-overflow.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From ffec86ed5010c5a2be14f47b33bcf4ed3169a199 Mon Sep 17 00:00:00 2001
-From: Matthias Clasen <mclasen@redhat.com>
-Date: Mon, 13 Jul 2015 00:33:40 -0400
-Subject: [PATCH] pixops: Be more careful about integer overflow
-
-Our loader code is supposed to handle out-of-memory and overflow
-situations gracefully, reporting errors instead of aborting. But
-if you load an image at a specific size, we also execute our
-scaling code, which was not careful enough about overflow in some
-places.
-
-This commit makes the scaling code silently return if it fails to
-allocate filter tables. This is the best we can do, since
-gdk_pixbuf_scale() is not taking a GError.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=752297
-
-Upstream-Status: backport
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- gdk-pixbuf/pixops/pixops.c |   22 +++++++++++++++++-----
- 1 file changed, 17 insertions(+), 5 deletions(-)
-
-diff --git a/gdk-pixbuf/pixops/pixops.c b/gdk-pixbuf/pixops/pixops.c
-index 29a1c14..ce51745 100644
---- a/gdk-pixbuf/pixops/pixops.c
-+++ b/gdk-pixbuf/pixops/pixops.c
-@@ -1272,7 +1272,16 @@ make_filter_table (PixopsFilter *filter)
-   int i_offset, j_offset;
-   int n_x = filter->x.n;
-   int n_y = filter->y.n;
--  int *weights = g_new (int, SUBSAMPLE * SUBSAMPLE * n_x * n_y);
-+  gsize n_weights;
-+  int *weights;
-+
-+  n_weights = SUBSAMPLE * SUBSAMPLE * n_x * n_y;
-+  if (n_weights / (SUBSAMPLE * SUBSAMPLE * n_x) != n_y)
-+    return NULL; /* overflow, bail */
-+
-+  weights = g_try_new (int, n_weights);
-+  if (!weights)
-+    return NULL; /* overflow, bail */
- 
-   for (i_offset=0; i_offset < SUBSAMPLE; i_offset++)
-     for (j_offset=0; j_offset < SUBSAMPLE; j_offset++)
-@@ -1347,8 +1356,11 @@ pixops_process (guchar         *dest_buf,
-   if (x_step == 0 || y_step == 0)
-     return; /* overflow, bail out */
- 
--  line_bufs = g_new (guchar *, filter->y.n);
-   filter_weights = make_filter_table (filter);
-+  if (!filter_weights)
-+    return; /* overflow, bail out */
-+
-+  line_bufs = g_new (guchar *, filter->y.n);
- 
-   check_shift = check_size ? get_check_shift (check_size) : 0;
- 
-@@ -1468,7 +1480,7 @@ tile_make_weights (PixopsFilterDimension *dim,
- 		   double                 scale)
- {
-   int n = ceil (1 / scale + 1);
--  double *pixel_weights = g_new (double, SUBSAMPLE * n);
-+  double *pixel_weights = g_malloc_n (sizeof (double) * SUBSAMPLE, n);
-   int offset;
-   int i;
- 
-@@ -1526,7 +1538,7 @@ bilinear_magnify_make_weights (PixopsFilterDimension *dim,
-     }
- 
-   dim->n = n;
--  dim->weights = g_new (double, SUBSAMPLE * n);
-+  dim->weights = g_malloc_n (sizeof (double) * SUBSAMPLE, n);
- 
-   pixel_weights = dim->weights;
- 
-@@ -1617,7 +1629,7 @@ bilinear_box_make_weights (PixopsFilterDimension *dim,
- 			   double                 scale)
- {
-   int n = ceil (1/scale + 3.0);
--  double *pixel_weights = g_new (double, SUBSAMPLE * n);
-+  double *pixel_weights = g_malloc_n (sizeof (double) * SUBSAMPLE, n);
-   double w;
-   int offset, i;
- 
--- 
-1.7.9.5
-
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb
similarity index 94%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb
index 68f3850..6e3cb02 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb
@@ -17,11 +17,10 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://extending-libinstall-dependencies.patch \
            file://run-ptest \
            file://fatal-loader.patch \
-           file://0001-pixops-Be-more-careful-about-integer-overflow.patch \
            "
 
-SRC_URI[md5sum] = "4fed0d54432f1b69fc6e66e608bd5542"
-SRC_URI[sha256sum] = "4853830616113db4435837992c0aebd94cbb993c44dc55063cee7f72a7bef8be"
+SRC_URI[md5sum] = "b1590189a2e89fab9f871959c168508c"
+SRC_URI[sha256sum] = "4432b74f25538c7d6bcb3ca51adabdd666168955f25812a2568dc9637697f3bc"
 
 inherit autotools pkgconfig gettext pixbufcache ptest-gnome
 
-- 
2.1.4


