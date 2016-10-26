Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4473E71B2B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 08:26:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9Q8QwXC021822
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 01:26:58 -0700
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 26 Oct 2016 01:26:57 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Oct 2016 16:26:44 +0800
Message-ID: <d6ab73986d4bdbf772bfeda912ba8098200c52cc.1477470209.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1477470209.git.yi.zhao@windriver.com>
References: <cover.1477470209.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH 1/5] tiff: Security fix CVE-2016-3945
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
X-List-Received-Date: Wed, 26 Oct 2016 08:26:58 -0000
Content-Type: text/plain

CVE-2016-3945 libtiff: Multiple integer overflows in the (1)
cvt_by_strip and (2) cvt_by_tile functions in the tiff2rgba tool in
LibTIFF 4.0.6 and earlier, when -b mode is enabled, allow remote
attackers to cause a denial of service (crash) or execute arbitrary code
via a crafted TIFF image, which triggers an out-of-bounds write.

External References:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3945
http://bugzilla.maptools.org/show_bug.cgi?id=2545

Patch from:
https://github.com/vadz/libtiff/commit/7c39352ccd9060d311d3dc9a1f1bc00133a160e6

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libtiff/files/CVE-2016-3945.patch              | 118 +++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |   1 +
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3945.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-3945.patch b/meta/recipes-multimedia/libtiff/files/CVE-2016-3945.patch
new file mode 100644
index 0000000..4d965be
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2016-3945.patch
@@ -0,0 +1,118 @@
+From 7c39352ccd9060d311d3dc9a1f1bc00133a160e6 Mon Sep 17 00:00:00 2001
+From: erouault <erouault>
+Date: Mon, 15 Aug 2016 20:06:40 +0000
+Subject: [PATCH] * tools/tiff2rgba.c: Fix integer overflow in size of
+ allocated buffer, when -b mode is enabled, that could result in out-of-bounds
+ write. Based initially on patch tiff-CVE-2016-3945.patch from
+ libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, with correction for invalid
+ tests that rejected valid files.
+
+CVE: CVE-2016-3945
+Upstream-Status: Backport
+https://github.com/vadz/libtiff/commit/7c39352ccd9060d311d3dc9a1f1bc00133a160e6
+
+Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
+---
+ ChangeLog         |  8 ++++++++
+ tools/tiff2rgba.c | 34 ++++++++++++++++++++++++++++++----
+ 2 files changed, 38 insertions(+), 4 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 62dc1b5..9c0ab29 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,11 @@
++2016-08-15 Even Rouault <even.rouault at spatialys.com>
++
++	* tools/tiff2rgba.c: Fix integer overflow in size of allocated
++	buffer, when -b mode is enabled, that could result in out-of-bounds
++	write. Based initially on patch tiff-CVE-2016-3945.patch from
++	libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, with correction for
++	invalid tests that rejected valid files.
++
+ 2016-07-11 Even Rouault <even.rouault at spatialys.com>
+ 
+ 	* tools/tiffcrop.c: Avoid access outside of stack allocated array
+diff --git a/tools/tiff2rgba.c b/tools/tiff2rgba.c
+index b7a81eb..16e3dc4 100644
+--- a/tools/tiff2rgba.c
++++ b/tools/tiff2rgba.c
+@@ -147,6 +147,7 @@ cvt_by_tile( TIFF *in, TIFF *out )
+     uint32  row, col;
+     uint32  *wrk_line;
+     int	    ok = 1;
++    uint32  rastersize, wrk_linesize;
+ 
+     TIFFGetField(in, TIFFTAG_IMAGEWIDTH, &width);
+     TIFFGetField(in, TIFFTAG_IMAGELENGTH, &height);
+@@ -163,7 +164,13 @@ cvt_by_tile( TIFF *in, TIFF *out )
+     /*
+      * Allocate tile buffer
+      */
+-    raster = (uint32*)_TIFFmalloc(tile_width * tile_height * sizeof (uint32));
++    rastersize = tile_width * tile_height * sizeof (uint32);
++    if (tile_width != (rastersize / tile_height) / sizeof( uint32))
++    {
++	TIFFError(TIFFFileName(in), "Integer overflow when calculating raster buffer");
++	exit(-1);
++    }
++    raster = (uint32*)_TIFFmalloc(rastersize);
+     if (raster == 0) {
+         TIFFError(TIFFFileName(in), "No space for raster buffer");
+         return (0);
+@@ -173,7 +180,13 @@ cvt_by_tile( TIFF *in, TIFF *out )
+      * Allocate a scanline buffer for swapping during the vertical
+      * mirroring pass.
+      */
+-    wrk_line = (uint32*)_TIFFmalloc(tile_width * sizeof (uint32));
++    wrk_linesize = tile_width * sizeof (uint32);
++    if (tile_width != wrk_linesize / sizeof (uint32))
++    {
++        TIFFError(TIFFFileName(in), "Integer overflow when calculating wrk_line buffer");
++	exit(-1);
++    }
++    wrk_line = (uint32*)_TIFFmalloc(wrk_linesize);
+     if (!wrk_line) {
+         TIFFError(TIFFFileName(in), "No space for raster scanline buffer");
+         ok = 0;
+@@ -249,6 +262,7 @@ cvt_by_strip( TIFF *in, TIFF *out )
+     uint32  row;
+     uint32  *wrk_line;
+     int	    ok = 1;
++    uint32  rastersize, wrk_linesize;
+ 
+     TIFFGetField(in, TIFFTAG_IMAGEWIDTH, &width);
+     TIFFGetField(in, TIFFTAG_IMAGELENGTH, &height);
+@@ -263,7 +277,13 @@ cvt_by_strip( TIFF *in, TIFF *out )
+     /*
+      * Allocate strip buffer
+      */
+-    raster = (uint32*)_TIFFmalloc(width * rowsperstrip * sizeof (uint32));
++    rastersize = width * rowsperstrip * sizeof (uint32);
++    if (width != (rastersize / rowsperstrip) / sizeof( uint32))
++    {
++	TIFFError(TIFFFileName(in), "Integer overflow when calculating raster buffer");
++	exit(-1);
++    }
++    raster = (uint32*)_TIFFmalloc(rastersize);
+     if (raster == 0) {
+         TIFFError(TIFFFileName(in), "No space for raster buffer");
+         return (0);
+@@ -273,7 +293,13 @@ cvt_by_strip( TIFF *in, TIFF *out )
+      * Allocate a scanline buffer for swapping during the vertical
+      * mirroring pass.
+      */
+-    wrk_line = (uint32*)_TIFFmalloc(width * sizeof (uint32));
++    wrk_linesize = width * sizeof (uint32);
++    if (width != wrk_linesize / sizeof (uint32))
++    {
++        TIFFError(TIFFFileName(in), "Integer overflow when calculating wrk_line buffer");
++	exit(-1);
++    }
++    wrk_line = (uint32*)_TIFFmalloc(wrk_linesize);
+     if (!wrk_line) {
+         TIFFError(TIFFFileName(in), "No space for raster scanline buffer");
+         ok = 0;
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
index 8147bc4..b978528 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2016-3186.patch \
            file://CVE-2016-5321.patch \
            file://CVE-2016-5323.patch \
+           file://CVE-2016-3945.patch \
           "
 
 SRC_URI[md5sum] = "d1d2e940dea0b5ad435f21f03d96dd72"
-- 
2.7.4


