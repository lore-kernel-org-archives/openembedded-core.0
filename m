Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym02.jp.fujitsu.com (mgwym02.jp.fujitsu.com [211.128.242.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2743A71ACF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 08:10:38 +0000 (UTC)
Received: from yt-mxauth.gw.nic.fujitsu.com (unknown [192.168.229.68]) by
	mgwym02.jp.fujitsu.com with smtp
	id 301a_281c_18d10d62_06ff_4fcb_a961_7456c400b51b;
	Wed, 07 Jun 2017 17:10:38 +0900
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
	(g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
	by yt-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id 9FABCAC02D0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 17:10:36 +0900 (JST)
Received: from g01jpexchyt35.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	820BA46E6E6 for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 17:10:35 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchyt35.g01.fujitsu.local (10.128.193.50) with Microsoft SMTP
	Server id 14.3.266.1; Wed, 7 Jun 2017 17:10:34 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Jun 2017 17:11:56 +0900
Message-ID: <1496823116-25985-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] libtiff: Upgrade to 4.0.8
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
X-List-Received-Date: Wed, 07 Jun 2017 08:10:39 -0000
Content-Type: text/plain

1. Upgrade libtiff from 4.0.7 to 4.0.8

2. Delete the following patch file due to CVE-2017-5225 has been fixed in 4.0.8
     libtiff-CVE-2017-5225.patch

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../libtiff/files/libtiff-CVE-2017-5225.patch      | 92 ----------------------
 .../libtiff/{tiff_4.0.7.bb => tiff_4.0.8.bb}       |  5 +-
 2 files changed, 2 insertions(+), 95 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libtiff/files/libtiff-CVE-2017-5225.patch
 rename meta/recipes-multimedia/libtiff/{tiff_4.0.7.bb => tiff_4.0.8.bb} (90%)

diff --git a/meta/recipes-multimedia/libtiff/files/libtiff-CVE-2017-5225.patch b/meta/recipes-multimedia/libtiff/files/libtiff-CVE-2017-5225.patch
deleted file mode 100644
index 3263353..0000000
--- a/meta/recipes-multimedia/libtiff/files/libtiff-CVE-2017-5225.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From a24df1e93833dfeaa69bf4d510518dc4684db64d Mon Sep 17 00:00:00 2001
-From: Li Zhou <li.zhou@windriver.com>
-Date: Wed, 25 Jan 2017 17:07:21 +0800
-Subject: [PATCH] libtiff: fix CVE-2017-5225
-
-tools/tiffcp.c: error out cleanly in cpContig2SeparateByRow
-and cpSeparate2ContigByRow if BitsPerSample != 8 to avoid heap based
-overflow. Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2656 and
-http://bugzilla.maptools.org/show_bug.cgi?id=2657
-
-Upstream-Status: Backport
-CVE: CVE-2017-5225
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- ChangeLog      |  7 +++++++
- tools/tiffcp.c | 24 ++++++++++++++++++++++--
- 2 files changed, 29 insertions(+), 2 deletions(-)
-
-diff --git a/ChangeLog b/ChangeLog
-index 9b9d397..7e82795 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,10 @@
-+2017-01-11 Even Rouault <even.rouault at spatialys.com>
-+
-+	* tools/tiffcp.c: error out cleanly in cpContig2SeparateByRow and
-+	cpSeparate2ContigByRow if BitsPerSample != 8 to avoid heap based overflow.
-+	Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2656 and
-+	http://bugzilla.maptools.org/show_bug.cgi?id=2657
-+
- 2016-11-19  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>
- 
- 	* libtiff 4.0.7 released.
-diff --git a/tools/tiffcp.c b/tools/tiffcp.c
-index 338a3d1..2e84577 100644
---- a/tools/tiffcp.c
-+++ b/tools/tiffcp.c
-@@ -592,7 +592,7 @@ static	copyFunc pickCopyFunc(TIFF*, TIFF*, uint16, uint16);
- static int
- tiffcp(TIFF* in, TIFF* out)
- {
--	uint16 bitspersample, samplesperpixel = 1;
-+	uint16 bitspersample = 1, samplesperpixel = 1;
- 	uint16 input_compression, input_photometric = PHOTOMETRIC_MINISBLACK;
- 	copyFunc cf;
- 	uint32 width, length;
-@@ -1068,6 +1068,16 @@ DECLAREcpFunc(cpContig2SeparateByRow)
- 	register uint32 n;
- 	uint32 row;
- 	tsample_t s;
-+        uint16 bps = 0;
-+
-+        (void) TIFFGetField(in, TIFFTAG_BITSPERSAMPLE, &bps);
-+        if( bps != 8 )
-+        {
-+            TIFFError(TIFFFileName(in),
-+                      "Error, can only handle BitsPerSample=8 in %s",
-+                      "cpContig2SeparateByRow");
-+            return 0;
-+        }
- 
- 	inbuf = _TIFFmalloc(scanlinesizein);
- 	outbuf = _TIFFmalloc(scanlinesizeout);
-@@ -1121,6 +1131,16 @@ DECLAREcpFunc(cpSeparate2ContigByRow)
- 	register uint32 n;
- 	uint32 row;
- 	tsample_t s;
-+        uint16 bps = 0;
-+
-+        (void) TIFFGetField(in, TIFFTAG_BITSPERSAMPLE, &bps);
-+        if( bps != 8 )
-+        {
-+            TIFFError(TIFFFileName(in),
-+                      "Error, can only handle BitsPerSample=8 in %s",
-+                      "cpSeparate2ContigByRow");
-+            return 0;
-+        }
- 
- 	inbuf = _TIFFmalloc(scanlinesizein);
- 	outbuf = _TIFFmalloc(scanlinesizeout);
-@@ -1763,7 +1783,7 @@ pickCopyFunc(TIFF* in, TIFF* out, uint16 bitspersample, uint16 samplesperpixel)
- 	uint32 w, l, tw, tl;
- 	int bychunk;
- 
--	(void) TIFFGetField(in, TIFFTAG_PLANARCONFIG, &shortv);
-+	(void) TIFFGetFieldDefaulted(in, TIFFTAG_PLANARCONFIG, &shortv);
- 	if (shortv != config && bitspersample != 8 && samplesperpixel > 1) {
- 		fprintf(stderr,
- 		    "%s: Cannot handle different planar configuration w/ bits/sample != 8\n",
--- 
-1.9.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.7.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.8.bb
similarity index 90%
rename from meta/recipes-multimedia/libtiff/tiff_4.0.7.bb
rename to meta/recipes-multimedia/libtiff/tiff_4.0.8.bb
index e581736..4a7aecc 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.7.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.8.bb
@@ -6,11 +6,10 @@ CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch \
-           file://libtiff-CVE-2017-5225.patch \
           "
 
-SRC_URI[md5sum] = "77ae928d2c6b7fb46a21c3a29325157b"
-SRC_URI[sha256sum] = "9f43a2cfb9589e5cecaa66e16bf87f814c945f22df7ba600d63aac4632c4f019"
+SRC_URI[md5sum] = "2a7d1c1318416ddf36d5f6fa4600069b"
+SRC_URI[sha256sum] = "59d7a5a8ccd92059913f246877db95a2918e6c04fb9d43fd74e5c3390dac2910"
 
 # exclude betas
 UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
-- 
1.9.1


