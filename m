Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 495437ED67
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 11:04:21 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id l2so14736748wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 04:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=lRSGOIsylPFKPYSCPg3bbsmmxkoes/Bl8B1e+F35TiE=;
	b=01TcTW9vvSff8R7QS3rvLbm04pNvk1njmOP5OZcn+uhObQ5/qXDz5UgznOJQ2sG+S5
	AgANaxZk9nRf7WDcU/OIQUl5SD03xA2oOiymH0U/MVmbmwxXe26vP9PHYIv0jDEB0l35
	o7PJOcL7QIwki6qGOGDxg/n4P0t7MgRGUwd1ZMaUdtk9DkwxQrmX9P1BMd/R8PPOS0cI
	ZF9QC9SUTd9vncx7Me00ofKaEdvDf4tC7ObnPWDbkLpSNJksLc4dn3sLI3gxGSlW6SQG
	HlXpkHLsCCp/UmmaWgvXdTdkDWmHq+8Ik/pFz4LNiTmwcvX7ND+N1n/zpHx+hCEVI/zZ
	8Weg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lRSGOIsylPFKPYSCPg3bbsmmxkoes/Bl8B1e+F35TiE=;
	b=DhCoA1EejGZ/4qASjxumyo2wo5wkNlwU1KHXff8ro3Scw1J6eyuLx8JKrnMJNNNTkm
	h/x5T5Z5A5krMLcOkx/7+DglwL+IJCN2fynqFelOjqzjNKnyrC16/HIkdSsFihONN5JN
	Oz/SBS/zI/M3GIhsK5JkjmueVMZbhpZ5gB0sERClozc3oUL4edAxVfbGvJxDywb6mhgF
	/x4y5TrNxaNFLSrLV+97+/8WlLh1DrX/NbkQUOSfhyIl1wdn3n4yBF8R9Pv/AdncQG+E
	1PM3mNz4QS6w9lqHpAyLWM0blRKpYA6eIUfD19jmB8co6bSCwz2EttszpIliKraZlUjt
	XE7g==
X-Gm-Message-State: APjAAAWC6B3jfs2E1Pr0lqAosP+OE+gTv9g4+fEPN2wrCjAuyDikmutH
	XVWrJzR6ga6e5+y/o98dRUfu3/eLp5U=
X-Google-Smtp-Source: APXvYqyeFspwEBEn5pNH4QLMuFyA/YFZIN/DKh91QVxDp4ptonv9CAlhFsFjriumyK9bE644gLF3Ag==
X-Received: by 2002:a1c:cf0b:: with SMTP id f11mr25007040wmg.138.1563188661657;
	Mon, 15 Jul 2019 04:04:21 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n1sm13495486wrx.39.2019.07.15.04.04.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 15 Jul 2019 04:04:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2019 12:04:13 +0100
Message-Id: <20190715110413.30525-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715110413.30525-1-ross.burton@intel.com>
References: <20190715110413.30525-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] tiff: fix CVE-2019-7663
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
X-List-Received-Date: Mon, 15 Jul 2019 11:04:21 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libtiff/tiff/CVE-2019-7663.patch          | 77 +++++++++++++++++++
 .../recipes-multimedia/libtiff/tiff_4.0.10.bb |  3 +-
 2 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2019-7663.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2019-7663.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2019-7663.patch
new file mode 100644
index 00000000000..f244fb2f324
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
index 3c055a15dc8..999496273c0 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
-           file://CVE-2019-6128.patch"
+           file://CVE-2019-6128.patch \
+           file://CVE-2019-7663.patch"
 SRC_URI[md5sum] = "114192d7ebe537912a2b97408832e7fd"
 SRC_URI[sha256sum] = "2c52d11ccaf767457db0c46795d9c7d1a8d8f76f68b0b800a3dfe45786b996e4"
 
-- 
2.20.1


