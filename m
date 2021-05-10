Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.30183.1620643728916359527
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 03:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7761C15BE
	for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 03:48:43 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DE103F719
	for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 03:48:43 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] cairo: backport patch for CVE-2020-35492
Date: Mon, 10 May 2021 11:48:38 +0100
Message-Id: <20210510104840.515815-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

---
 .../cairo/cairo/CVE-2020-35492.patch          | 60 +++++++++++++++++++
 meta/recipes-graphics/cairo/cairo_1.16.0.bb   |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patc=
h

diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch b/met=
a/recipes-graphics/cairo/cairo/CVE-2020-35492.patch
new file mode 100644
index 00000000000..fb6ce5cfdf8
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch
@@ -0,0 +1,60 @@
+Fix stack buffer overflow.
+
+CVE: CVE-2020-35492
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 03a820b173ed1fdef6ff14b4468f5dbc02ff59be Mon Sep 17 00:00:00 2001
+From: Heiko Lewin <heiko.lewin@worldiety.de>
+Date: Tue, 15 Dec 2020 16:48:19 +0100
+Subject: [PATCH] Fix mask usage in image-compositor
+
+---
+ src/cairo-image-compositor.c                |   8 ++--
+ test/Makefile.sources                       |   1 +
+ test/bug-image-compositor.c                 |  39 ++++++++++++++++++++
+ test/reference/bug-image-compositor.ref.png | Bin 0 -> 185 bytes
+ 4 files changed, 44 insertions(+), 4 deletions(-)
+ create mode 100644 test/bug-image-compositor.c
+ create mode 100644 test/reference/bug-image-compositor.ref.png
+
+diff --git a/src/cairo-image-compositor.c b/src/cairo-image-compositor.c
+index 79ad69f68..4f8aaed99 100644
+--- a/src/cairo-image-compositor.c
++++ b/src/cairo-image-compositor.c
+@@ -2601,14 +2601,14 @@ _inplace_src_spans (void *abstract_renderer, int=
 y, int h,
+ 		    unsigned num_spans)
+ {
+     cairo_image_span_renderer_t *r =3D abstract_renderer;
+-    uint8_t *m;
++    uint8_t *m, *base =3D (uint8_t*)pixman_image_get_data(r->mask);
+     int x0;
+=20
+     if (num_spans =3D=3D 0)
+ 	return CAIRO_STATUS_SUCCESS;
+=20
+     x0 =3D spans[0].x;
+-    m =3D r->_buf;
++    m =3D base;
+     do {
+ 	int len =3D spans[1].x - spans[0].x;
+ 	if (len >=3D r->u.composite.run_length && spans[0].coverage =3D=3D 0xf=
f) {
+@@ -2655,7 +2655,7 @@ _inplace_src_spans (void *abstract_renderer, int y=
, int h,
+ 				      spans[0].x, y,
+ 				      spans[1].x - spans[0].x, h);
+=20
+-	    m =3D r->_buf;
++	    m =3D base;
+ 	    x0 =3D spans[1].x;
+ 	} else if (spans[0].coverage =3D=3D 0x0) {
+ 	    if (spans[0].x !=3D x0) {
+@@ -2684,7 +2684,7 @@ _inplace_src_spans (void *abstract_renderer, int y=
, int h,
+ #endif
+ 	    }
+=20
+-	    m =3D r->_buf;
++	    m =3D base;
+ 	    x0 =3D spans[1].x;
+ 	} else {
+ 	    *m++ =3D spans[0].coverage;
+--=20
diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-g=
raphics/cairo/cairo_1.16.0.bb
index 68f993d7ca2..9d9fbfbe0d5 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -27,6 +27,7 @@ SRC_URI =3D "http://cairographics.org/releases/cairo-${=
PV}.tar.xz \
            file://CVE-2018-19876.patch \
            file://CVE-2019-6461.patch \
            file://CVE-2019-6462.patch \
+           file://CVE-2020-35492.patch \
           "
=20
 SRC_URI[md5sum] =3D "f19e0353828269c22bd72e271243a552"
--=20
2.25.1

