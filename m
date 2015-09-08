Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 885C065C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 10:10:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t88AAr2h011680
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Sep 2015 03:10:53 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Tue, 8 Sep 2015 03:10:53 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Sep 2015 18:05:27 +0800
Message-ID: <38a54062b7480324d2a289cc18f4c3a8f4d72c8a.1441706663.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1441706663.git.kai.kang@windriver.com>
References: <cover.1441706663.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gdk-pixbuf: 2.30.8 -> 2.31.7
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
X-List-Received-Date: Tue, 08 Sep 2015 10:10:53 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

* drop backport patch

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...ps-Be-more-careful-about-integer-overflow.patch | 89 ----------------------
 .../{gdk-pixbuf_2.30.8.bb => gdk-pixbuf_2.31.7.bb} |  5 +-
 2 files changed, 2 insertions(+), 92 deletions(-)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-pixops-Be-more-careful-about-integer-overflow.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.30.8.bb => gdk-pixbuf_2.31.7.bb} (93%)

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
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.31.7.bb
similarity index 93%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.31.7.bb
index 07c2dce..22b94f4 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.31.7.bb
@@ -18,11 +18,10 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://extending-libinstall-dependencies.patch \
            file://run-ptest \
            file://fatal-loader.patch \
-           file://0001-pixops-Be-more-careful-about-integer-overflow.patch \
            "
 
-SRC_URI[md5sum] = "4fed0d54432f1b69fc6e66e608bd5542"
-SRC_URI[sha256sum] = "4853830616113db4435837992c0aebd94cbb993c44dc55063cee7f72a7bef8be"
+SRC_URI[md5sum] = "8a42218ed76a75e38dc737c0c5d30190"
+SRC_URI[sha256sum] = "4736e009168857ce8bb19291f0887c1dc6551cbc3c46d5ffcd034e133e4fd610"
 
 inherit autotools pkgconfig gettext pixbufcache ptest-gnome
 
-- 
1.9.1


