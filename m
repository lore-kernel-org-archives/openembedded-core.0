Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.9379.1619079012561661086
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 01:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13M8ACx9023967
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 01:10:12 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 22 Apr 2021 01:10:11 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Thu, 22 Apr 2021 01:10:11 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH][hardknott] cairo: fix CVE-2020-35492
Date: Thu, 22 Apr 2021 16:10:10 +0800
Message-ID: <20210422081010.3254-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../cairo/cairo/CVE-2020-35492.patch          | 121 ++++++++++++++++++
 .../cairo/cairo/bug-image-compositor.ref.png  | Bin 0 -> 185 bytes
 meta/recipes-graphics/cairo/cairo_1.16.0.bb   |  11 ++
 3 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch
 create mode 100644 meta/recipes-graphics/cairo/cairo/bug-image-compositor.ref.png

diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch b/meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch
new file mode 100644
index 0000000000..f8e69beb0b
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch
@@ -0,0 +1,121 @@
+From 03a820b173ed1fdef6ff14b4468f5dbc02ff59be Mon Sep 17 00:00:00 2001
+From: Heiko Lewin <heiko.lewin@worldiety.de>
+Date: Tue, 15 Dec 2020 16:48:19 +0100
+Subject: [PATCH] Fix mask usage in image-compositor
+
+CVE: CVE-2020-35492
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/cairo/cairo/-/commit/03a820b173ed1fdef6ff14b4468f5dbc02ff59be?merge_request_iid=85]
+
+original patch from upstream has a binary file, it will cause
+do_patch failed with "git binary diffs are not supported".
+
+so add do_patch_append in recipe to add this binary source. when removing
+this patch, please also remove do_patch_append for this patch
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/cairo-image-compositor.c                |   8 ++--
+ test/Makefile.sources                       |   1 +
+ test/bug-image-compositor.c                 |  39 ++++++++++++++++++++
+ 3 files changed, 44 insertions(+), 4 deletions(-)
+ create mode 100644 test/bug-image-compositor.c
+
+diff --git a/src/cairo-image-compositor.c b/src/cairo-image-compositor.c
+index 79ad69f68..4f8aaed99 100644
+--- a/src/cairo-image-compositor.c
++++ b/src/cairo-image-compositor.c
+@@ -2610,14 +2610,14 @@ _inplace_src_spans (void *abstract_renderer, int y, int h,
+ 		    unsigned num_spans)
+ {
+     cairo_image_span_renderer_t *r = abstract_renderer;
+-    uint8_t *m;
++    uint8_t *m, *base = (uint8_t*)pixman_image_get_data(r->mask);
+     int x0;
+ 
+     if (num_spans == 0)
+ 	return CAIRO_STATUS_SUCCESS;
+ 
+     x0 = spans[0].x;
+-    m = r->_buf;
++    m = base;
+     do {
+ 	int len = spans[1].x - spans[0].x;
+ 	if (len >= r->u.composite.run_length && spans[0].coverage == 0xff) {
+@@ -2655,7 +2655,7 @@ _inplace_src_spans (void *abstract_renderer, int y, int h,
+ 				      spans[0].x, y,
+ 				      spans[1].x - spans[0].x, h);
+ 
+-	    m = r->_buf;
++	    m = base;
+ 	    x0 = spans[1].x;
+ 	} else if (spans[0].coverage == 0x0) {
+ 	    if (spans[0].x != x0) {
+@@ -2684,7 +2684,7 @@ _inplace_src_spans (void *abstract_renderer, int y, int h,
+ #endif
+ 	    }
+ 
+-	    m = r->_buf;
++	    m = base;
+ 	    x0 = spans[1].x;
+ 	} else {
+ 	    *m++ = spans[0].coverage;
+diff --git a/test/Makefile.sources b/test/Makefile.sources
+index 7eb73647f..86494348d 100644
+--- a/test/Makefile.sources
++++ b/test/Makefile.sources
+@@ -34,6 +34,7 @@ test_sources = \
+ 	bug-source-cu.c					\
+ 	bug-extents.c					\
+ 	bug-seams.c					\
++	bug-image-compositor.c				\
+ 	caps.c						\
+ 	checkerboard.c					\
+ 	caps-joins.c					\
+diff --git a/test/bug-image-compositor.c b/test/bug-image-compositor.c
+new file mode 100644
+index 000000000..fc4fd370b
+--- /dev/null
++++ b/test/bug-image-compositor.c
+@@ -0,0 +1,39 @@
++#include "cairo-test.h"
++
++static cairo_test_status_t
++draw (cairo_t *cr, int width, int height)
++{
++    cairo_set_source_rgb (cr, 0., 0., 0.);
++    cairo_paint (cr);
++
++    cairo_set_source_rgb (cr, 1., 1., 1.);
++    cairo_set_line_width (cr, 1.);
++
++    cairo_pattern_t *p = cairo_pattern_create_linear (0, 0, width, height);
++    cairo_pattern_add_color_stop_rgb (p, 0, 0.99, 1, 1);
++    cairo_pattern_add_color_stop_rgb (p, 1, 1, 1, 1);
++    cairo_set_source (cr, p);
++
++    cairo_move_to (cr, 0.5, -1);
++    for (int i = 0; i < width; i+=3) {
++	cairo_rel_line_to (cr, 2, 2);
++	cairo_rel_line_to (cr, 1, -2);
++    }
++
++    cairo_set_operator (cr, CAIRO_OPERATOR_SOURCE);
++    cairo_stroke (cr);
++
++    cairo_pattern_destroy(p);
++
++    return CAIRO_TEST_SUCCESS;
++}
++
++
++CAIRO_TEST (bug_image_compositor,
++	    "Crash in image-compositor",
++	    "stroke, stress", /* keywords */
++	    NULL, /* requirements */
++	    10000, 1,
++	    NULL, draw)
++	    
++	    
+-- 
+GitLab
diff --git a/meta/recipes-graphics/cairo/cairo/bug-image-compositor.ref.png b/meta/recipes-graphics/cairo/cairo/bug-image-compositor.ref.png
new file mode 100644
index 0000000000000000000000000000000000000000..939f659d2c8620e9927a3a79f5e96fb639c418be
GIT binary patch
literal 185
zcmeAS@N?(olHy`uVBq!ia0y~yP!|BQ89A7M<o7+wF+hqf$=lt9;Xep2*t>i(P$bXO
z#WAE}&f8-f1se=_SPWL_NSx=C)BnJ0eBr6Z%1egFEOv(*t#+|{>X&v^RS7GQe(vez
lf)$wgmAfM(p2Sx&&i!{gWy)N&qd=P(JYD@<);T3K0RWsgHuC@g

literal 0
HcmV?d00001

diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
index 68f993d7ca..d48da1a4c7 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -27,6 +27,8 @@ SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
            file://CVE-2018-19876.patch \
            file://CVE-2019-6461.patch \
            file://CVE-2019-6462.patch \
+           file://CVE-2020-35492.patch \
+           file://bug-image-compositor.ref.png \
           "
 
 SRC_URI[md5sum] = "f19e0353828269c22bd72e271243a552"
@@ -64,6 +66,15 @@ export ac_cv_lib_bfd_bfd_openr="no"
 # Ensure we don't depend on LZO
 export ac_cv_lib_lzo2_lzo2a_decompress="no"
 
+#for CVE-2020-35492.patch
+do_patch_append() {
+    bb.build.exec_func('do_cp_binary_source', d)
+}
+
+do_cp_binary_source () {
+	cp ${WORKDIR}/bug-image-compositor.ref.png ${S}/test/reference/
+}
+
 do_install_append () {
 	rm -rf ${D}${bindir}/cairo-sphinx
 	rm -rf ${D}${libdir}/cairo/cairo-fdr*
-- 
2.17.1

