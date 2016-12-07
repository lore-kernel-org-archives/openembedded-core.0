Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1CA771A05
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 08:02:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uB782NOm019557
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Dec 2016 00:02:24 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 7 Dec 2016 00:02:22 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Dec 2016 16:01:12 +0800
Message-ID: <1481097673-8896-3-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1481097673-8896-1-git-send-email-mingli.yu@windriver.com>
References: <1481097673-8896-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] tiff: Security fix CVE-2016-9538
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
X-List-Received-Date: Wed, 07 Dec 2016 08:02:23 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* tools/tiffcrop.c: fix read of undefined buffer in
readContigStripsIntoBuffer() due to uint16 overflow.

External References:
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9538

Patch from:
https://github.com/vadz/libtiff/commit/43c0b81a818640429317c80fea1e66771e85024b#diff-c8b4b355f9b5c06d585b23138e1c185f

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../libtiff/files/CVE-2016-9538.patch              | 67 ++++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-9538.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-9538.patch b/meta/recipes-multimedia/libtiff/files/CVE-2016-9538.patch
new file mode 100644
index 0000000..e1141df
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2016-9538.patch
@@ -0,0 +1,67 @@
+From 43c0b81a818640429317c80fea1e66771e85024b Mon Sep 17 00:00:00 2001
+From: erouault <erouault>
+Date: Sat, 8 Oct 2016 15:04:31 +0000
+Subject: [PATCH] Fix CVE-2016-9538
+* tools/tiffcp.c: fix read of undefined variable in case of
+ missing required tags. Found on test case of MSVR 35100. * tools/tiffcrop.c:
+ fix read of undefined buffer in readContigStripsIntoBuffer() due to uint16
+ overflow. Probably not a security issue but I can be wrong. Reported as MSVR
+ 35100 by Axel Souchet from the MSRC Vulnerabilities & Mitigations team.
+
+CVE: CVE-2016-9538
+Upstream-Status: Backport
+https://github.com/vadz/libtiff/commit/43c0b81a818640429317c80fea1e66771e85024b#diff-c8b4b355f9b5c06d585b23138e1c185f
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+
+---
+ tools/tiffcp.c   | 4 ++--
+ tools/tiffcrop.c | 9 ++++++---
+ 2 files changed, 17 insertions(+), 5 deletions(-)
+
+diff --git a/tools/tiffcp.c b/tools/tiffcp.c
+index ba2b715..4ad74d3 100644
+--- a/tools/tiffcp.c
++++ b/tools/tiffcp.c
+@@ -592,8 +592,8 @@ static	copyFunc pickCopyFunc(TIFF*, TIFF*, uint16, uint16);
+ static int
+ tiffcp(TIFF* in, TIFF* out)
+ {
+-	uint16 bitspersample, samplesperpixel;
+-	uint16 input_compression, input_photometric;
++	uint16 bitspersample, samplesperpixel = 1;
++	uint16 input_compression, input_photometric = PHOTOMETRIC_MINISBLACK;
+ 	copyFunc cf;
+ 	uint32 width, length;
+ 	struct cpTag* p;
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 7685566..eb6de77 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -3628,7 +3628,7 @@ static int readContigStripsIntoBuffer (TIFF* in, uint8* buf)
+ {
+         uint8* bufp = buf;
+         int32  bytes_read = 0;
+-        uint16 strip, nstrips   = TIFFNumberOfStrips(in);
++        uint32 strip, nstrips   = TIFFNumberOfStrips(in);
+         uint32 stripsize = TIFFStripSize(in);
+         uint32 rows = 0;
+         uint32 rps = TIFFGetFieldDefaulted(in, TIFFTAG_ROWSPERSTRIP, &rps);
+@@ -4711,9 +4711,12 @@ static int readSeparateStripsIntoBuffer (TIFF *in, uint8 *obuf, uint32 length,
+                                          uint32 width, uint16 spp,
+                                          struct dump_opts *dump)
+   {
+-  int i, j, bytes_per_sample, bytes_per_pixel, shift_width, result = 1;
++  int i, bytes_per_sample, bytes_per_pixel, shift_width, result = 1;
++  uint32 j;
+   int32  bytes_read = 0;
+-  uint16 bps, nstrips, planar, strips_per_sample;
++  uint16 bps, planar;
++  uint32 nstrips;
++  uint32 strips_per_sample;
+   uint32 src_rowsize, dst_rowsize, rows_processed, rps;
+   uint32 rows_this_strip = 0;
+   tsample_t s;
+-- 
+2.9.3
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
index 7b5dd9c..8521fd7 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2016-9539.patch \
            file://CVE-2016-9535-1.patch \
            file://CVE-2016-9535-2.patch \
+           file://CVE-2016-9538.patch \
           "
 
 SRC_URI[md5sum] = "d1d2e940dea0b5ad435f21f03d96dd72"
-- 
2.8.1


