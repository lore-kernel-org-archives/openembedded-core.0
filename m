Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 312707CE21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 20:59:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9MKxF1o025145
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 13:59:15 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 22 Oct 2019 13:59:14 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Oct 2019 13:59:14 -0700
Message-ID: <20191022205914.12149-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] libtiff: fix CVE-2019-17546
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
X-List-Received-Date: Tue, 22 Oct 2019 20:59:14 -0000
Content-Type: text/plain

Apply unmodified patch from upstream.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../libtiff/tiff/CVE-2019-17546.patch              | 104 +++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.10.bb     |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2019-17546.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2019-17546.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2019-17546.patch
new file mode 100644
index 0000000..582e1cf
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2019-17546.patch
@@ -0,0 +1,104 @@
+libtiff: fix CVE-2019-17546
+
+CVE: CVE-2019-17546
+
+Added after 4.0.10 release.
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff]
+
+
+commit 4bb584a35f87af42d6cf09d15e9ce8909a839145
+Author: Even Rouault <even.rouault@spatialys.com>
+Date:   Thu Aug 15 15:05:28 2019 +0200
+
+    RGBA interface: fix integer overflow potentially causing write heap buffer overflow, especially on 32 bit builds. Fixes https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=16443. Credit to OSS Fuzz
+
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index c88b5fa..4da785d 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -949,16 +949,23 @@ gtStripContig(TIFFRGBAImage* img, uint32* raster, uint32 w, uint32 h)
+ 	fromskew = (w < imagewidth ? imagewidth - w : 0);
+ 	for (row = 0; row < h; row += nrow)
+ 	{
++		uint32 temp;
+ 		rowstoread = rowsperstrip - (row + img->row_offset) % rowsperstrip;
+ 		nrow = (row + rowstoread > h ? h - row : rowstoread);
+ 		nrowsub = nrow;
+ 		if ((nrowsub%subsamplingver)!=0)
+ 			nrowsub+=subsamplingver-nrowsub%subsamplingver;
++		temp = (row + img->row_offset)%rowsperstrip + nrowsub;
++		if( scanline > 0 && temp > (size_t)(TIFF_TMSIZE_T_MAX / scanline) )
++		{
++			TIFFErrorExt(tif->tif_clientdata, TIFFFileName(tif), "Integer overflow in gtStripContig");
++			return 0;
++		}
+ 		if (_TIFFReadEncodedStripAndAllocBuffer(tif,
+ 		    TIFFComputeStrip(tif,row+img->row_offset, 0),
+ 		    (void**)(&buf),
+                     maxstripsize,
+-		    ((row + img->row_offset)%rowsperstrip + nrowsub) * scanline)==(tmsize_t)(-1)
++		    temp * scanline)==(tmsize_t)(-1)
+ 		    && (buf == NULL || img->stoponerr))
+ 		{
+ 			ret = 0;
+@@ -1051,15 +1058,22 @@ gtStripSeparate(TIFFRGBAImage* img, uint32* raster, uint32 w, uint32 h)
+ 	fromskew = (w < imagewidth ? imagewidth - w : 0);
+ 	for (row = 0; row < h; row += nrow)
+ 	{
++                uint32 temp;
+ 		rowstoread = rowsperstrip - (row + img->row_offset) % rowsperstrip;
+ 		nrow = (row + rowstoread > h ? h - row : rowstoread);
+ 		offset_row = row + img->row_offset;
++                temp = (row + img->row_offset)%rowsperstrip + nrow;
++                if( scanline > 0 && temp > (size_t)(TIFF_TMSIZE_T_MAX / scanline) )
++                {
++                        TIFFErrorExt(tif->tif_clientdata, TIFFFileName(tif), "Integer overflow in gtStripSeparate");
++                        return 0;
++                }
+                 if( buf == NULL )
+                 {
+                     if (_TIFFReadEncodedStripAndAllocBuffer(
+                             tif, TIFFComputeStrip(tif, offset_row, 0),
+                             (void**) &buf, bufsize,
+-                            ((row + img->row_offset)%rowsperstrip + nrow) * scanline)==(tmsize_t)(-1)
++                            temp * scanline)==(tmsize_t)(-1)
+                         && (buf == NULL || img->stoponerr))
+                     {
+                             ret = 0;
+@@ -1079,7 +1093,7 @@ gtStripSeparate(TIFFRGBAImage* img, uint32* raster, uint32 w, uint32 h)
+                     }
+                 }
+ 		else if (TIFFReadEncodedStrip(tif, TIFFComputeStrip(tif, offset_row, 0),
+-		    p0, ((row + img->row_offset)%rowsperstrip + nrow) * scanline)==(tmsize_t)(-1)
++		    p0, temp * scanline)==(tmsize_t)(-1)
+ 		    && img->stoponerr)
+ 		{
+ 			ret = 0;
+@@ -1087,7 +1101,7 @@ gtStripSeparate(TIFFRGBAImage* img, uint32* raster, uint32 w, uint32 h)
+ 		}
+ 		if (colorchannels > 1 
+                     && TIFFReadEncodedStrip(tif, TIFFComputeStrip(tif, offset_row, 1),
+-                                            p1, ((row + img->row_offset)%rowsperstrip + nrow) * scanline) == (tmsize_t)(-1)
++                                            p1, temp * scanline) == (tmsize_t)(-1)
+ 		    && img->stoponerr)
+ 		{
+ 			ret = 0;
+@@ -1095,7 +1109,7 @@ gtStripSeparate(TIFFRGBAImage* img, uint32* raster, uint32 w, uint32 h)
+ 		}
+ 		if (colorchannels > 1 
+                     && TIFFReadEncodedStrip(tif, TIFFComputeStrip(tif, offset_row, 2),
+-                                            p2, ((row + img->row_offset)%rowsperstrip + nrow) * scanline) == (tmsize_t)(-1)
++                                            p2, temp * scanline) == (tmsize_t)(-1)
+ 		    && img->stoponerr)
+ 		{
+ 			ret = 0;
+@@ -1104,7 +1118,7 @@ gtStripSeparate(TIFFRGBAImage* img, uint32* raster, uint32 w, uint32 h)
+ 		if (alpha)
+ 		{
+ 			if (TIFFReadEncodedStrip(tif, TIFFComputeStrip(tif, offset_row, colorchannels),
+-			    pa, ((row + img->row_offset)%rowsperstrip + nrow) * scanline)==(tmsize_t)(-1)
++			    pa, temp * scanline)==(tmsize_t)(-1)
+ 			    && img->stoponerr)
+ 			{
+ 				ret = 0;
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
index 0432763..5c008c5 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
@@ -8,6 +8,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2019-6128.patch \
            file://CVE-2019-7663.patch \
            file://CVE-2019-14973.patch \
+           file://CVE-2019-17546.patch \
 "
 SRC_URI[md5sum] = "114192d7ebe537912a2b97408832e7fd"
 SRC_URI[sha256sum] = "2c52d11ccaf767457db0c46795d9c7d1a8d8f76f68b0b800a3dfe45786b996e4"
-- 
2.7.4


