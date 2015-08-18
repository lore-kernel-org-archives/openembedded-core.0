Return-Path: <Li.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0334760557
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 03:46:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7I3kB9G018882
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 20:46:11 -0700 (PDT)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Mon, 17 Aug 2015 20:46:11 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Aug 2015 11:45:41 +0800
Message-ID: <1439869541-5338-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [PATCH] gdk-pixbuf: Security Advisory - gdk-pixbuf - CVE-2015-4491
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
X-List-Received-Date: Tue, 18 Aug 2015 03:46:14 -0000
Content-Type: text/plain

pixops: Be more careful about integer overflow

Integer overflow in the make_filter_table function in pixops/pixops.c
in gdk-pixbuf before 2.31.5, as used in Mozilla Firefox before 40.0 and
Firefox ESR 38.x before 38.2 on Linux, Google Chrome on Linux, and other
products, allows remote attackers to execute arbitrary code or cause a
denial of service (heap-based buffer overflow and application crash) via
crafted bitmap dimensions that are mishandled during scaling.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...ps-Be-more-careful-about-integer-overflow.patch |   89 ++++++++++++++++++++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb |    1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-pixops-Be-more-careful-about-integer-overflow.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-pixops-Be-more-careful-about-integer-overflow.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-pixops-Be-more-careful-about-integer-overflow.patch
new file mode 100644
index 0000000..fe7c1d5
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-pixops-Be-more-careful-about-integer-overflow.patch
@@ -0,0 +1,89 @@
+From ffec86ed5010c5a2be14f47b33bcf4ed3169a199 Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Mon, 13 Jul 2015 00:33:40 -0400
+Subject: [PATCH] pixops: Be more careful about integer overflow
+
+Our loader code is supposed to handle out-of-memory and overflow
+situations gracefully, reporting errors instead of aborting. But
+if you load an image at a specific size, we also execute our
+scaling code, which was not careful enough about overflow in some
+places.
+
+This commit makes the scaling code silently return if it fails to
+allocate filter tables. This is the best we can do, since
+gdk_pixbuf_scale() is not taking a GError.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=752297
+
+Upstream-Status: backport
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ gdk-pixbuf/pixops/pixops.c |   22 +++++++++++++++++-----
+ 1 file changed, 17 insertions(+), 5 deletions(-)
+
+diff --git a/gdk-pixbuf/pixops/pixops.c b/gdk-pixbuf/pixops/pixops.c
+index 29a1c14..ce51745 100644
+--- a/gdk-pixbuf/pixops/pixops.c
++++ b/gdk-pixbuf/pixops/pixops.c
+@@ -1272,7 +1272,16 @@ make_filter_table (PixopsFilter *filter)
+   int i_offset, j_offset;
+   int n_x = filter->x.n;
+   int n_y = filter->y.n;
+-  int *weights = g_new (int, SUBSAMPLE * SUBSAMPLE * n_x * n_y);
++  gsize n_weights;
++  int *weights;
++
++  n_weights = SUBSAMPLE * SUBSAMPLE * n_x * n_y;
++  if (n_weights / (SUBSAMPLE * SUBSAMPLE * n_x) != n_y)
++    return NULL; /* overflow, bail */
++
++  weights = g_try_new (int, n_weights);
++  if (!weights)
++    return NULL; /* overflow, bail */
+ 
+   for (i_offset=0; i_offset < SUBSAMPLE; i_offset++)
+     for (j_offset=0; j_offset < SUBSAMPLE; j_offset++)
+@@ -1347,8 +1356,11 @@ pixops_process (guchar         *dest_buf,
+   if (x_step == 0 || y_step == 0)
+     return; /* overflow, bail out */
+ 
+-  line_bufs = g_new (guchar *, filter->y.n);
+   filter_weights = make_filter_table (filter);
++  if (!filter_weights)
++    return; /* overflow, bail out */
++
++  line_bufs = g_new (guchar *, filter->y.n);
+ 
+   check_shift = check_size ? get_check_shift (check_size) : 0;
+ 
+@@ -1468,7 +1480,7 @@ tile_make_weights (PixopsFilterDimension *dim,
+ 		   double                 scale)
+ {
+   int n = ceil (1 / scale + 1);
+-  double *pixel_weights = g_new (double, SUBSAMPLE * n);
++  double *pixel_weights = g_malloc_n (sizeof (double) * SUBSAMPLE, n);
+   int offset;
+   int i;
+ 
+@@ -1526,7 +1538,7 @@ bilinear_magnify_make_weights (PixopsFilterDimension *dim,
+     }
+ 
+   dim->n = n;
+-  dim->weights = g_new (double, SUBSAMPLE * n);
++  dim->weights = g_malloc_n (sizeof (double) * SUBSAMPLE, n);
+ 
+   pixel_weights = dim->weights;
+ 
+@@ -1617,7 +1629,7 @@ bilinear_box_make_weights (PixopsFilterDimension *dim,
+ 			   double                 scale)
+ {
+   int n = ceil (1/scale + 3.0);
+-  double *pixel_weights = g_new (double, SUBSAMPLE * n);
++  double *pixel_weights = g_malloc_n (sizeof (double) * SUBSAMPLE, n);
+   double w;
+   int offset, i;
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
index a63d454..07c2dce 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://extending-libinstall-dependencies.patch \
            file://run-ptest \
            file://fatal-loader.patch \
+           file://0001-pixops-Be-more-careful-about-integer-overflow.patch \
            "
 
 SRC_URI[md5sum] = "4fed0d54432f1b69fc6e66e608bd5542"
-- 
1.7.9.5


