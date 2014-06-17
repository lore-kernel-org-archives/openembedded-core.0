Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B98EE6FF7D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 08:25:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5H8PMEd001271
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 01:25:22 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 17 Jun 2014 01:25:22 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jun 2014 04:25:20 -0400
Message-ID: <1402993520-22013-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/1 v2] libtiff: Security Advisory - CVE-2012-4564
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
X-List-Received-Date: Tue, 17 Jun 2014 08:25:29 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

v2 changes:
* update format for commit log
* add Upstream-Status for patch

ppm2tiff does not check the return value of the TIFFScanlineSize
function, which allows remote attackers to cause a denial of service
(crash) and possibly execute arbitrary code via a crafted PPM image that
triggers an integer overflow, a zero-memory allocation, and a heap-based
buffer overflow.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4564

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../libtiff/files/tiff-CVE-2012-4564.patch         |   99 ++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.3.bb      |    3 +-
 2 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/files/tiff-CVE-2012-4564.patch

diff --git a/meta/recipes-multimedia/libtiff/files/tiff-CVE-2012-4564.patch b/meta/recipes-multimedia/libtiff/files/tiff-CVE-2012-4564.patch
new file mode 100644
index 0000000..2364979
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/tiff-CVE-2012-4564.patch
@@ -0,0 +1,99 @@
+Upstream-Status: Backport
+
+Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+
+Index: tools/ppm2tiff.c
+===================================================================
+RCS file: /cvs/maptools/cvsroot/libtiff/tools/ppm2tiff.c,v
+retrieving revision 1.16
+retrieving revision 1.18
+diff -u -r1.16 -r1.18
+--- a/tools/ppm2tiff.c	10 Apr 2010 19:22:34 -0000	1.16
++++ b/tools/ppm2tiff.c	10 Dec 2012 18:19:11 -0000	1.18
+@@ -1,4 +1,4 @@
+-/* $Id: ppm2tiff.c,v 1.16 2010-04-10 19:22:34 bfriesen Exp $ */
++/* $Id: ppm2tiff.c,v 1.18 2012-12-10 18:19:11 tgl Exp $ */
+ 
+ /*
+  * Copyright (c) 1991-1997 Sam Leffler
+@@ -72,6 +72,17 @@
+ 	exit(-2);
+ }
+ 
++static tmsize_t
++multiply_ms(tmsize_t m1, tmsize_t m2)
++{
++	tmsize_t bytes = m1 * m2;
++
++	if (m1 && bytes / m1 != m2)
++		bytes = 0;
++
++	return bytes;
++}
++
+ int
+ main(int argc, char* argv[])
+ {
+@@ -79,7 +90,7 @@
+ 	uint32 rowsperstrip = (uint32) -1;
+ 	double resolution = -1;
+ 	unsigned char *buf = NULL;
+-	tsize_t linebytes = 0;
++	tmsize_t linebytes = 0;
+ 	uint16 spp = 1;
+ 	uint16 bpp = 8;
+ 	TIFF *out;
+@@ -89,6 +100,7 @@
+ 	int c;
+ 	extern int optind;
+ 	extern char* optarg;
++	tmsize_t scanline_size;
+ 
+ 	if (argc < 2) {
+ 	    fprintf(stderr, "%s: Too few arguments\n", argv[0]);
+@@ -221,7 +233,8 @@
+ 	}
+ 	switch (bpp) {
+ 		case 1:
+-			linebytes = (spp * w + (8 - 1)) / 8;
++			/* if round-up overflows, result will be zero, OK */
++			linebytes = (multiply_ms(spp, w) + (8 - 1)) / 8;
+ 			if (rowsperstrip == (uint32) -1) {
+ 				TIFFSetField(out, TIFFTAG_ROWSPERSTRIP, h);
+ 			} else {
+@@ -230,15 +243,31 @@
+ 			}
+ 			break;
+ 		case 8:
+-			linebytes = spp * w;
++			linebytes = multiply_ms(spp, w);
+ 			TIFFSetField(out, TIFFTAG_ROWSPERSTRIP,
+ 			    TIFFDefaultStripSize(out, rowsperstrip));
+ 			break;
+ 	}
+-	if (TIFFScanlineSize(out) > linebytes)
++	if (linebytes == 0) {
++		fprintf(stderr, "%s: scanline size overflow\n", infile);
++		(void) TIFFClose(out);
++		exit(-2);					
++	}
++	scanline_size = TIFFScanlineSize(out);
++	if (scanline_size == 0) {
++		/* overflow - TIFFScanlineSize already printed a message */
++		(void) TIFFClose(out);
++		exit(-2);					
++	}
++	if (scanline_size < linebytes)
+ 		buf = (unsigned char *)_TIFFmalloc(linebytes);
+ 	else
+-		buf = (unsigned char *)_TIFFmalloc(TIFFScanlineSize(out));
++		buf = (unsigned char *)_TIFFmalloc(scanline_size);
++	if (buf == NULL) {
++		fprintf(stderr, "%s: Not enough memory\n", infile);
++		(void) TIFFClose(out);
++		exit(-2);
++	}
+ 	if (resolution > 0) {
+ 		TIFFSetField(out, TIFFTAG_XRESOLUTION, resolution);
+ 		TIFFSetField(out, TIFFTAG_YRESOLUTION, resolution);
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
index 6483655..af1f2b6 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
@@ -9,7 +9,8 @@ SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://libtiff-CVE-2013-4232.patch \
            file://libtiff-CVE-2013-4243.patch \
            file://libtiff-CVE-2013-4244.patch \
-           file://libtiff-CVE-2013-4231.patch "
+           file://libtiff-CVE-2013-4231.patch \
+           file://tiff-CVE-2012-4564.patch "
 
 SRC_URI[md5sum] = "051c1068e6a0627f461948c365290410"
 SRC_URI[sha256sum] = "ea1aebe282319537fb2d4d7805f478dd4e0e05c33d0928baba76a7c963684872"
-- 
1.7.9.5


