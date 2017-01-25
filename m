Return-Path: <Li.Zhou@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F312171999
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 09:29:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0P9T0qo020847
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 01:29:03 -0800
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 25 Jan 2017 01:28:58 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jan 2017 17:28:22 +0800
Message-ID: <1485336502-178124-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [PATCH] libtiff: Security Advisory - libtiff - CVE-2017-5225
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
X-List-Received-Date: Wed, 25 Jan 2017 09:29:05 -0000
Content-Type: text/plain

Libtiff is vulnerable to a heap buffer overflow in the tools/tiffcp
resulting in DoS or code execution via a crafted BitsPerSample value.

Porting patch from <https://github.com/vadz/libtiff/commit/
5c080298d59efa53264d7248bbe3a04660db6ef7> to solve CVE-2017-5225.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../libtiff/files/libtiff-CVE-2017-5225.patch      | 92 ++++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.7.bb      |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/libtiff-CVE-2017-5225.patch

diff --git a/meta/recipes-multimedia/libtiff/files/libtiff-CVE-2017-5225.patch b/meta/recipes-multimedia/libtiff/files/libtiff-CVE-2017-5225.patch
new file mode 100644
index 0000000..3263353
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/libtiff-CVE-2017-5225.patch
@@ -0,0 +1,92 @@
+From a24df1e93833dfeaa69bf4d510518dc4684db64d Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Wed, 25 Jan 2017 17:07:21 +0800
+Subject: [PATCH] libtiff: fix CVE-2017-5225
+
+tools/tiffcp.c: error out cleanly in cpContig2SeparateByRow
+and cpSeparate2ContigByRow if BitsPerSample != 8 to avoid heap based
+overflow. Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2656 and
+http://bugzilla.maptools.org/show_bug.cgi?id=2657
+
+Upstream-Status: Backport
+CVE: CVE-2017-5225
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ ChangeLog      |  7 +++++++
+ tools/tiffcp.c | 24 ++++++++++++++++++++++--
+ 2 files changed, 29 insertions(+), 2 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 9b9d397..7e82795 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,10 @@
++2017-01-11 Even Rouault <even.rouault at spatialys.com>
++
++	* tools/tiffcp.c: error out cleanly in cpContig2SeparateByRow and
++	cpSeparate2ContigByRow if BitsPerSample != 8 to avoid heap based overflow.
++	Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2656 and
++	http://bugzilla.maptools.org/show_bug.cgi?id=2657
++
+ 2016-11-19  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>
+ 
+ 	* libtiff 4.0.7 released.
+diff --git a/tools/tiffcp.c b/tools/tiffcp.c
+index 338a3d1..2e84577 100644
+--- a/tools/tiffcp.c
++++ b/tools/tiffcp.c
+@@ -592,7 +592,7 @@ static	copyFunc pickCopyFunc(TIFF*, TIFF*, uint16, uint16);
+ static int
+ tiffcp(TIFF* in, TIFF* out)
+ {
+-	uint16 bitspersample, samplesperpixel = 1;
++	uint16 bitspersample = 1, samplesperpixel = 1;
+ 	uint16 input_compression, input_photometric = PHOTOMETRIC_MINISBLACK;
+ 	copyFunc cf;
+ 	uint32 width, length;
+@@ -1068,6 +1068,16 @@ DECLAREcpFunc(cpContig2SeparateByRow)
+ 	register uint32 n;
+ 	uint32 row;
+ 	tsample_t s;
++        uint16 bps = 0;
++
++        (void) TIFFGetField(in, TIFFTAG_BITSPERSAMPLE, &bps);
++        if( bps != 8 )
++        {
++            TIFFError(TIFFFileName(in),
++                      "Error, can only handle BitsPerSample=8 in %s",
++                      "cpContig2SeparateByRow");
++            return 0;
++        }
+ 
+ 	inbuf = _TIFFmalloc(scanlinesizein);
+ 	outbuf = _TIFFmalloc(scanlinesizeout);
+@@ -1121,6 +1131,16 @@ DECLAREcpFunc(cpSeparate2ContigByRow)
+ 	register uint32 n;
+ 	uint32 row;
+ 	tsample_t s;
++        uint16 bps = 0;
++
++        (void) TIFFGetField(in, TIFFTAG_BITSPERSAMPLE, &bps);
++        if( bps != 8 )
++        {
++            TIFFError(TIFFFileName(in),
++                      "Error, can only handle BitsPerSample=8 in %s",
++                      "cpSeparate2ContigByRow");
++            return 0;
++        }
+ 
+ 	inbuf = _TIFFmalloc(scanlinesizein);
+ 	outbuf = _TIFFmalloc(scanlinesizeout);
+@@ -1763,7 +1783,7 @@ pickCopyFunc(TIFF* in, TIFF* out, uint16 bitspersample, uint16 samplesperpixel)
+ 	uint32 w, l, tw, tl;
+ 	int bychunk;
+ 
+-	(void) TIFFGetField(in, TIFFTAG_PLANARCONFIG, &shortv);
++	(void) TIFFGetFieldDefaulted(in, TIFFTAG_PLANARCONFIG, &shortv);
+ 	if (shortv != config && bitspersample != 8 && samplesperpixel > 1) {
+ 		fprintf(stderr,
+ 		    "%s: Cannot handle different planar configuration w/ bits/sample != 8\n",
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.7.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.7.bb
index 7296782..e581736 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.7.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.7.bb
@@ -6,6 +6,7 @@ CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch \
+           file://libtiff-CVE-2017-5225.patch \
           "
 
 SRC_URI[md5sum] = "77ae928d2c6b7fb46a21c3a29325157b"
-- 
1.9.1


