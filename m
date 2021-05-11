Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.11129.1620730754987893592
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 03:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: 1C3QwGP43XtVpKCStaM8GqJUAP3vJDWplmRpBTaVH5iBnWIY+ItD0rt4HAad7jDYf0pM5S1fBe
 HFGHIZJQ9LgA==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="179006558"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="179006558"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 03:59:14 -0700
IronPort-SDR: BjedD+bKGI/njOmvjqSARF3LaLKMK8tbPUM/RQU6mX8fuEtFt/pa1INQX1bmfkEW9Dkr7YdRWU
 UZiJpZ+I/bKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="430252141"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga007.jf.intel.com with ESMTP; 11 May 2021 03:59:14 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 4/4] tiff: fix CVE-2020-35523 CVE-2020-35524
Date: Tue, 11 May 2021 18:59:10 +0800
Message-Id: <20210511105910.3052-4-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210511105910.3052-1-chee.yang.lee@intel.com>
References: <20210511105910.3052-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../libtiff/files/CVE-2020-35523.patch        | 55 +++++++++++++++++++
 .../libtiff/files/CVE-2020-35524-1.patch      | 42 ++++++++++++++
 .../libtiff/files/CVE-2020-35524-2.patch      | 36 ++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |  3 +
 4 files changed, 136 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2020-35523.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2020-35524-1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2020-35524-2.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2020-35523.patch b/meta/recipes-multimedia/libtiff/files/CVE-2020-35523.patch
new file mode 100644
index 0000000000..1f30b32799
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2020-35523.patch
@@ -0,0 +1,55 @@
+From c8d613ef497058fe653c467fc84c70a62a4a71b2 Mon Sep 17 00:00:00 2001
+From: Thomas Bernard <miniupnp@free.fr>
+Date: Tue, 10 Nov 2020 01:54:30 +0100
+Subject: [PATCH] gtTileContig(): check Tile width for overflow
+
+fixes #211
+
+Upstream-Status: Backport [ https://gitlab.com/libtiff/libtiff/-/commit/c8d613ef497058fe653c467fc84c70a62a4a71b2 ]
+CVE: CVE-2020-35523
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ libtiff/tif_getimage.c | 17 +++++++++++++----
+ 1 file changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index 4da785d3..96ab1460 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -29,6 +29,7 @@
+  */
+ #include "tiffiop.h"
+ #include <stdio.h>
++#include <limits.h>
+ 
+ static int gtTileContig(TIFFRGBAImage*, uint32*, uint32, uint32);
+ static int gtTileSeparate(TIFFRGBAImage*, uint32*, uint32, uint32);
+@@ -645,12 +646,20 @@ gtTileContig(TIFFRGBAImage* img, uint32* raster, uint32 w, uint32 h)
+ 
+     flip = setorientation(img);
+     if (flip & FLIP_VERTICALLY) {
+-	    y = h - 1;
+-	    toskew = -(int32)(tw + w);
++        if ((tw + w) > INT_MAX) {
++            TIFFErrorExt(tif->tif_clientdata, TIFFFileName(tif), "%s", "unsupported tile size (too wide)");
++            return (0);
++        }
++        y = h - 1;
++        toskew = -(int32)(tw + w);
+     }
+     else {
+-	    y = 0;
+-	    toskew = -(int32)(tw - w);
++        if (tw > (INT_MAX + w)) {
++            TIFFErrorExt(tif->tif_clientdata, TIFFFileName(tif), "%s", "unsupported tile size (too wide)");
++            return (0);
++        }
++        y = 0;
++        toskew = -(int32)(tw - w);
+     }
+      
+     /*
+-- 
+GitLab
+
+
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2020-35524-1.patch b/meta/recipes-multimedia/libtiff/files/CVE-2020-35524-1.patch
new file mode 100644
index 0000000000..5232eacb50
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2020-35524-1.patch
@@ -0,0 +1,42 @@
+From c6a12721b46f1a72974f91177890301730d7b330 Mon Sep 17 00:00:00 2001
+From: Thomas Bernard <miniupnp@free.fr>
+Date: Tue, 10 Nov 2020 01:01:59 +0100
+Subject: [PATCH] tiff2pdf.c: properly calculate datasize when saving to JPEG
+ YCbCr
+
+fixes #220
+Upstream-Status: Backport
+https://gitlab.com/libtiff/libtiff/-/commit/c6a12721b46f1a72974f91177890301730d7b330
+https://gitlab.com/libtiff/libtiff/-/merge_requests/159/commits
+CVE: CVE-2021-35524
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ tools/tiff2pdf.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/tools/tiff2pdf.c b/tools/tiff2pdf.c
+index 719811ea..dc69d2f9 100644
+--- a/tools/tiff2pdf.c
++++ b/tools/tiff2pdf.c
+@@ -2087,9 +2087,14 @@ void t2p_read_tiff_size(T2P* t2p, TIFF* input){
+ #endif
+ 		(void) 0;
+ 	}
+-	k = checkMultiply64(TIFFScanlineSize(input), t2p->tiff_length, t2p);
+-	if(t2p->tiff_planar==PLANARCONFIG_SEPARATE){
+-		k = checkMultiply64(k, t2p->tiff_samplesperpixel, t2p);
++	if(t2p->pdf_compression == T2P_COMPRESS_JPEG
++	   && t2p->tiff_photometric == PHOTOMETRIC_YCBCR) {
++		k = checkMultiply64(TIFFNumberOfStrips(input), TIFFStripSize(input), t2p);
++	} else {
++		k = checkMultiply64(TIFFScanlineSize(input), t2p->tiff_length, t2p);
++		if(t2p->tiff_planar==PLANARCONFIG_SEPARATE){
++			k = checkMultiply64(k, t2p->tiff_samplesperpixel, t2p);
++		}
+ 	}
+ 	if (k == 0) {
+ 		/* Assume we had overflow inside TIFFScanlineSize */
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2020-35524-2.patch b/meta/recipes-multimedia/libtiff/files/CVE-2020-35524-2.patch
new file mode 100644
index 0000000000..406d467766
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2020-35524-2.patch
@@ -0,0 +1,36 @@
+From d74f56e3b7ea55c8a18a03bc247cd5fd0ca288b2 Mon Sep 17 00:00:00 2001
+From: Thomas Bernard <miniupnp@free.fr>
+Date: Tue, 10 Nov 2020 02:05:05 +0100
+Subject: [PATCH] Fix for building without JPEG support
+
+Upstream-Status: Backport
+https://gitlab.com/libtiff/libtiff/-/commit/d74f56e3b7ea55c8a18a03bc247cd5fd0ca288b2
+https://gitlab.com/libtiff/libtiff/-/merge_requests/159/commits
+CVE: CVE-2021-35524
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ tools/tiff2pdf.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/tools/tiff2pdf.c b/tools/tiff2pdf.c
+index dc69d2f9..d0b0ede7 100644
+--- a/tools/tiff2pdf.c
++++ b/tools/tiff2pdf.c
+@@ -2087,10 +2087,13 @@ void t2p_read_tiff_size(T2P* t2p, TIFF* input){
+ #endif
+ 		(void) 0;
+ 	}
++#ifdef JPEG_SUPPORT
+ 	if(t2p->pdf_compression == T2P_COMPRESS_JPEG
+ 	   && t2p->tiff_photometric == PHOTOMETRIC_YCBCR) {
+ 		k = checkMultiply64(TIFFNumberOfStrips(input), TIFFStripSize(input), t2p);
+-	} else {
++	} else
++#endif
++	{
+ 		k = checkMultiply64(TIFFScanlineSize(input), t2p->tiff_length, t2p);
+ 		if(t2p->tiff_planar==PLANARCONFIG_SEPARATE){
+ 			k = checkMultiply64(k, t2p->tiff_samplesperpixel, t2p);
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index 5a1cb13c53..97ad575f64 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -9,6 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
+           file://CVE-2020-35523.patch  \
+           file://CVE-2020-35524-1.patch \
+           file://CVE-2020-35524-2.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.17.1

