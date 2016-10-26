Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 85F1A71AAD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 08:27:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9Q8R69s021928
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 01:27:06 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 26 Oct 2016 01:27:05 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Oct 2016 16:26:46 +0800
Message-ID: <254deb41526b02c301ff6a5f39feaa797c1f44cf.1477470209.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1477470209.git.yi.zhao@windriver.com>
References: <cover.1477470209.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH 3/5] tiff: Security fix CVE-2016-3991
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
X-List-Received-Date: Wed, 26 Oct 2016 08:27:04 -0000
Content-Type: text/plain

CVE-2016-3991 libtiff: Heap-based buffer overflow in the loadImage
function in the tiffcrop tool in LibTIFF 4.0.6 and earlier allows remote
attackers to cause a denial of service (out-of-bounds write) or execute
arbitrary code via a crafted TIFF image with zero tiles.

External References:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3991
http://bugzilla.maptools.org/show_bug.cgi?id=2543

Patch from:
https://github.com/vadz/libtiff/commit/e596d4e27c5afb7960dc360fdd3afd90ba0fb8ba

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libtiff/files/CVE-2016-3991.patch              | 147 +++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |   1 +
 2 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3991.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-3991.patch b/meta/recipes-multimedia/libtiff/files/CVE-2016-3991.patch
new file mode 100644
index 0000000..27dfd37
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2016-3991.patch
@@ -0,0 +1,147 @@
+From e596d4e27c5afb7960dc360fdd3afd90ba0fb8ba Mon Sep 17 00:00:00 2001
+From: erouault <erouault>
+Date: Mon, 15 Aug 2016 21:05:40 +0000
+Subject: [PATCH 2/2] * tools/tiffcrop.c: Fix out-of-bounds write in
+ loadImage(). From patch libtiff-CVE-2016-3991.patch from
+ libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro (bugzilla #2543)
+
+CVE: CVE-2016-3991
+Upstream-Status: Backport
+https://github.com/vadz/libtiff/commit/e596d4e27c5afb7960dc360fdd3afd90ba0fb8ba
+
+Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
+---
+ ChangeLog        |  6 ++++++
+ tools/tiffcrop.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++++---
+ 2 files changed, 62 insertions(+), 3 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index db4ea18..5d60608 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,5 +1,11 @@
+ 2016-08-15 Even Rouault <even.rouault at spatialys.com>
+ 
++	* tools/tiffcrop.c: Fix out-of-bounds write in loadImage().
++	From patch libtiff-CVE-2016-3991.patch from
++	libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro (bugzilla #2543)
++
++2016-08-15 Even Rouault <even.rouault at spatialys.com>
++
+ 	* libtiff/tif_pixarlog.c: Fix write buffer overflow in PixarLogEncode
+ 	if more input samples are provided than expected by PixarLogSetupEncode.
+ 	Idea based on libtiff-CVE-2016-3990.patch from
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 27abc0b..ddba7b9 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -798,6 +798,11 @@ static int readContigTilesIntoBuffer (TIFF* in, uint8* buf,
+     }
+ 
+   tile_buffsize = tilesize;
++  if (tilesize == 0 || tile_rowsize == 0)
++  {
++     TIFFError("readContigTilesIntoBuffer", "Tile size or tile rowsize is zero");
++     exit(-1);
++  }
+ 
+   if (tilesize < (tsize_t)(tl * tile_rowsize))
+     {
+@@ -807,7 +812,12 @@ static int readContigTilesIntoBuffer (TIFF* in, uint8* buf,
+               tilesize, tl * tile_rowsize);
+ #endif
+     tile_buffsize = tl * tile_rowsize;
+-    } 
++    if (tl != (tile_buffsize / tile_rowsize))
++    {
++    	TIFFError("readContigTilesIntoBuffer", "Integer overflow when calculating buffer size.");
++        exit(-1);
++    }
++    }
+ 
+   tilebuf = _TIFFmalloc(tile_buffsize);
+   if (tilebuf == 0)
+@@ -1210,6 +1220,12 @@ static int writeBufferToContigTiles (TIFF* out, uint8* buf, uint32 imagelength,
+       !TIFFGetField(out, TIFFTAG_BITSPERSAMPLE, &bps) )
+       return 1;
+ 
++  if (tilesize == 0 || tile_rowsize == 0 || tl == 0 || tw == 0)
++  {
++    TIFFError("writeBufferToContigTiles", "Tile size, tile row size, tile width, or tile length is zero");
++    exit(-1);
++  }
++  
+   tile_buffsize = tilesize;
+   if (tilesize < (tsize_t)(tl * tile_rowsize))
+     {
+@@ -1219,6 +1235,11 @@ static int writeBufferToContigTiles (TIFF* out, uint8* buf, uint32 imagelength,
+               tilesize, tl * tile_rowsize);
+ #endif
+     tile_buffsize = tl * tile_rowsize;
++    if (tl != tile_buffsize / tile_rowsize)
++    {
++	TIFFError("writeBufferToContigTiles", "Integer overflow when calculating buffer size");
++	exit(-1);
++    }
+     }
+ 
+   tilebuf = _TIFFmalloc(tile_buffsize);
+@@ -5945,12 +5966,27 @@ loadImage(TIFF* in, struct image_data *image, struct dump_opts *dump, unsigned c
+     TIFFGetField(in, TIFFTAG_TILELENGTH, &tl);
+ 
+     tile_rowsize  = TIFFTileRowSize(in);      
++    if (ntiles == 0 || tlsize == 0 || tile_rowsize == 0)
++    {
++	TIFFError("loadImage", "File appears to be tiled, but the number of tiles, tile size, or tile rowsize is zero.");
++	exit(-1);
++    }
+     buffsize = tlsize * ntiles;
++    if (tlsize != (buffsize / ntiles))
++    {
++	TIFFError("loadImage", "Integer overflow when calculating buffer size");
++	exit(-1);
++    }
+ 
+-        
+     if (buffsize < (uint32)(ntiles * tl * tile_rowsize))
+       {
+       buffsize = ntiles * tl * tile_rowsize;
++      if (ntiles != (buffsize / tl / tile_rowsize))
++      {
++	TIFFError("loadImage", "Integer overflow when calculating buffer size");
++	exit(-1);
++      }
++      
+ #ifdef DEBUG2
+       TIFFError("loadImage",
+ 	        "Tilesize %u is too small, using ntiles * tilelength * tilerowsize %lu",
+@@ -5969,8 +6005,25 @@ loadImage(TIFF* in, struct image_data *image, struct dump_opts *dump, unsigned c
+     TIFFGetFieldDefaulted(in, TIFFTAG_ROWSPERSTRIP, &rowsperstrip);
+     stsize = TIFFStripSize(in);
+     nstrips = TIFFNumberOfStrips(in);
++    if (nstrips == 0 || stsize == 0)
++    {
++	TIFFError("loadImage", "File appears to be striped, but the number of stipes or stripe size is zero.");
++	exit(-1);
++    }
++
+     buffsize = stsize * nstrips;
+-    
++    if (stsize != (buffsize / nstrips))
++    {
++	TIFFError("loadImage", "Integer overflow when calculating buffer size");
++	exit(-1);
++    }
++    uint32 buffsize_check;
++    buffsize_check = ((length * width * spp * bps) + 7);
++    if (length != ((buffsize_check - 7) / width / spp / bps))
++    {
++	TIFFError("loadImage", "Integer overflow detected.");
++	exit(-1);
++    }
+     if (buffsize < (uint32) (((length * width * spp * bps) + 7) / 8))
+       {
+       buffsize =  ((length * width * spp * bps) + 7) / 8;
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
index dfb2996..713cf24 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2016-5323.patch \
            file://CVE-2016-3945.patch \
            file://CVE-2016-3990.patch \
+           file://CVE-2016-3991.patch \
           "
 
 SRC_URI[md5sum] = "d1d2e940dea0b5ad435f21f03d96dd72"
-- 
2.7.4


