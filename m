Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B63957F18F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 04:03:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2019 21:03:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,305,1559545200"; d="scan'208";a="189233235"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga001.fm.intel.com with ESMTP; 24 Jul 2019 21:03:39 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2019 12:03:04 +0800
Message-Id: <1564027386-8107-9-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564027386-8107-1-git-send-email-anuj.mittal@intel.com>
References: <1564027386-8107-1-git-send-email-anuj.mittal@intel.com>
Subject: [warrior][PATCH 09/11] tiff: fix CVE-2019-7663
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
X-List-Received-Date: Thu, 25 Jul 2019 04:03:39 -0000

From: Ross Burton <ross.burton@intel.com>

(From OE-Core rev: d06d6910d1ec9374bb15e02809e64e81198731b6)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libtiff/tiff/CVE-2019-7663.patch               | 77 ++++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.10.bb     |  3 +-
 2 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2019-7663.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2019-7663.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2019-7663.patch
new file mode 100644
index 0000000..f244fb2
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2019-7663.patch
@@ -0,0 +1,77 @@
+CVE: CVE-2019-7663
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From c6fc6c1fa895024c86285c58efd6424cf8078f32 Mon Sep 17 00:00:00 2001
+From: Thomas Bernard <miniupnp@free.fr>
+Date: Mon, 11 Feb 2019 10:05:33 +0100
+Subject: [PATCH 1/2] check that (Tile Width)*(Samples/Pixel) do no overflow
+
+fixes bug 2833
+---
+ tools/tiffcp.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/tools/tiffcp.c b/tools/tiffcp.c
+index 2f406e2d..f0ee2c02 100644
+--- a/tools/tiffcp.c
++++ b/tools/tiffcp.c
+@@ -1408,7 +1408,7 @@ DECLAREreadFunc(readSeparateTilesIntoBuffer)
+ 	int status = 1;
+ 	uint32 imagew = TIFFRasterScanlineSize(in);
+ 	uint32 tilew = TIFFTileRowSize(in);
+-	int iskew  = imagew - tilew*spp;
++	int iskew;
+ 	tsize_t tilesize = TIFFTileSize(in);
+ 	tdata_t tilebuf;
+ 	uint8* bufp = (uint8*) buf;
+@@ -1416,6 +1416,12 @@ DECLAREreadFunc(readSeparateTilesIntoBuffer)
+ 	uint32 row;
+ 	uint16 bps = 0, bytes_per_sample;
+ 
++	if (spp > (0x7fffffff / tilew))
++	{
++		TIFFError(TIFFFileName(in), "Error, cannot handle that much samples per tile row (Tile Width * Samples/Pixel)");
++		return 0;
++	}
++	iskew = imagew - tilew*spp;
+ 	tilebuf = _TIFFmalloc(tilesize);
+ 	if (tilebuf == 0)
+ 		return 0;
+-- 
+2.20.1
+
+
+From da6454aa80b9bb3154dfab4e8b21637de47531e0 Mon Sep 17 00:00:00 2001
+From: Thomas Bernard <miniupnp@free.fr>
+Date: Mon, 11 Feb 2019 21:42:03 +0100
+Subject: [PATCH 2/2] tiffcp.c: use INT_MAX
+
+---
+ tools/tiffcp.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tools/tiffcp.c b/tools/tiffcp.c
+index f0ee2c02..8c81aa4f 100644
+--- a/tools/tiffcp.c
++++ b/tools/tiffcp.c
+@@ -41,6 +41,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <limits.h>
+ 
+ #include <ctype.h>
+ 
+@@ -1416,7 +1417,7 @@ DECLAREreadFunc(readSeparateTilesIntoBuffer)
+ 	uint32 row;
+ 	uint16 bps = 0, bytes_per_sample;
+ 
+-	if (spp > (0x7fffffff / tilew))
++	if (spp > (INT_MAX / tilew))
+ 	{
+ 		TIFFError(TIFFFileName(in), "Error, cannot handle that much samples per tile row (Tile Width * Samples/Pixel)");
+ 		return 0;
+-- 
+2.20.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
index a82d744..8e3e227 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
@@ -6,7 +6,8 @@ CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch \
-           file://CVE-2019-6128.patch"
+           file://CVE-2019-6128.patch \
+           file://CVE-2019-7663.patch \
            "
 SRC_URI[md5sum] = "114192d7ebe537912a2b97408832e7fd"
 SRC_URI[sha256sum] = "2c52d11ccaf767457db0c46795d9c7d1a8d8f76f68b0b800a3dfe45786b996e4"
-- 
2.7.4


