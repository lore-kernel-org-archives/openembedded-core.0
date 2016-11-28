Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8A43F60939
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 09:52:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAS9qFku003066
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 01:52:15 -0800 (PST)
Received: from pek-zchi-d1.corp.ad.wrs.com (128.224.162.239) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Mon, 28 Nov 2016 01:52:14 -0800
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Nov 2016 17:52:13 +0800
Message-ID: <1480326733-20535-1-git-send-email-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] tiff: Security fix CVE-2016-9539
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
X-List-Received-Date: Mon, 28 Nov 2016 09:52:17 -0000
Content-Type: text/plain

tools/tiffcrop.c in libtiff 4.0.6 has an out-of-bounds read in
readContigTilesIntoBuffer(). Reported as MSVR 35092.

External References:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9539

Patch from:
https://github.com/vadz/libtiff/commit/ae9365db1b271b62b35ce018eac8799b1d5e8a53

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../libtiff/files/CVE-2016-9539.patch              | 60 ++++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-9539.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-9539.patch b/meta/recipes-multimedia/libtiff/files/CVE-2016-9539.patch
new file mode 100644
index 0000000..1d9be42
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2016-9539.patch
@@ -0,0 +1,60 @@
+From ae9365db1b271b62b35ce018eac8799b1d5e8a53 Mon Sep 17 00:00:00 2001
+From: erouault <erouault>
+Date: Fri, 14 Oct 2016 19:13:20 +0000
+Subject: [PATCH ] * tools/tiffcrop.c: fix out-of-bound read of up to 3 bytes
+ in readContigTilesIntoBuffer(). Reported as MSVR 35092 by Axel Souchet
+ & Vishal Chauhan from the MSRC Vulnerabilities & Mitigations team.
+
+CVE: CVE-2016-9539
+
+Upstream-Status: Backport
+https://github.com/vadz/libtiff/commit/ae9365db1b271b62b35ce018eac8799b1d5e8a53
+
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+
+---
+ ChangeLog        |  6 ++++++
+ tools/tiffcrop.c | 11 ++++++++++-
+ 2 files changed, 16 insertions(+), 1 deletion(-)
+
+Index: tiff-4.0.6/ChangeLog
+===================================================================
+--- tiff-4.0.6.orig/ChangeLog	2016-11-28 14:56:32.109283913 +0800
++++ tiff-4.0.6/ChangeLog	2016-11-28 16:36:01.805325534 +0800
+@@ -17,6 +17,12 @@
+ 	Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2500
+ 	(CVE-2014-8127, duplicate: CVE-2016-3658)
+ 
++2016-10-14 Even Rouault <even.rouault at spatialys.com>
++
++	* tools/tiffcrop.c: fix out-of-bound read of up to 3 bytes in
++	readContigTilesIntoBuffer(). Reported as MSVR 35092 by Axel Souchet
++	& Vishal Chauhan from the MSRC Vulnerabilities & Mitigations team.
++
+ 2016-10-08 Even Rouault <even.rouault at spatialys.com>
+ 
+ 	* tools/tiffcp.c: fix out-of-bounds write on tiled images with odd
+Index: tiff-4.0.6/tools/tiffcrop.c
+===================================================================
+--- tiff-4.0.6.orig/tools/tiffcrop.c	2016-11-28 14:56:31.433283908 +0800
++++ tiff-4.0.6/tools/tiffcrop.c	2016-11-28 16:42:13.793328128 +0800
+@@ -819,9 +819,18 @@
+     }
+     }
+ 
+-  tilebuf = _TIFFmalloc(tile_buffsize);
++  /* Add 3 padding bytes for extractContigSamplesShifted32bits */
++  if( tile_buffsize > 0xFFFFFFFFU - 3 )
++  {
++      TIFFError("readContigTilesIntoBuffer", "Integer overflow when calculating buffer size.");
++      exit(-1);
++  }
++  tilebuf = _TIFFmalloc(tile_buffsize + 3);
+   if (tilebuf == 0)
+     return 0;
++  tilebuf[tile_buffsize] = 0;
++  tilebuf[tile_buffsize+1] = 0;
++  tilebuf[tile_buffsize+2] = 0;
+ 
+   dst_rowsize = ((imagewidth * bps * spp) + 7) / 8;  
+   for (row = 0; row < imagelength; row += tl)
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
index 3057121..3a7906a 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2016-3658.patch \
            file://CVE-2016-3632.patch \
            file://CVE-2016-9540.patch \
+           file://CVE-2016-9539.patch \
           "
 
 SRC_URI[md5sum] = "d1d2e940dea0b5ad435f21f03d96dd72"
-- 
1.9.1


