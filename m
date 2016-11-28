Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6CF9171A79
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 08:12:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAS8C6ei014362
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 00:12:10 -0800 (PST)
Received: from pek-zchi-d1.corp.ad.wrs.com (128.224.162.239) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Mon, 28 Nov 2016 00:12:05 -0800
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Nov 2016 16:12:04 +0800
Message-ID: <1480320724-7796-1-git-send-email-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] tiff: Security fix CVE-2016-9540
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
X-List-Received-Date: Mon, 28 Nov 2016 08:12:12 -0000
Content-Type: text/plain

tools/tiffcp.c in libtiff 4.0.6 has an out-of-bounds write on tiled
images with odd tile width versus image width. Reported as MSVR 35103,
aka "cpStripToTile heap-buffer-overflow."

External References:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9540

Patch from:
https://github.com/vadz/libtiff/commit/5ad9d8016fbb60109302d558f7edb2cb2a3bb8e3

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../libtiff/files/CVE-2016-9540.patch              | 60 ++++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-9540.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-9540.patch b/meta/recipes-multimedia/libtiff/files/CVE-2016-9540.patch
new file mode 100644
index 0000000..dddaa0c
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2016-9540.patch
@@ -0,0 +1,60 @@
+From 5ad9d8016fbb60109302d558f7edb2cb2a3bb8e3 Mon Sep 17 00:00:00 2001
+From: erouault <erouault>
+Date: Sat, 8 Oct 2016 15:54:56 +0000
+Subject: [PATCH] fix CVE-2016-9540
+ * tools/tiffcp.c: fix out-of-bounds write on tiled images with odd
+ tile width vs image width. Reported as MSVR 35103
+ by Axel Souchet and Vishal Chauhan from the MSRC Vulnerabilities &
+ Mitigations team.
+
+CVE: CVE-2016-9540
+
+Upstream-Status: Backport
+https://github.com/vadz/libtiff/commit/5ad9d8016fbb60109302d558f7edb2cb2a3bb8e3
+
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ ChangeLog      | 7 +++++++
+ tools/tiffcp.c | 4 ++--
+ 2 files changed, 9 insertions(+), 2 deletions(-)
+
+Index: tiff-4.0.4/ChangeLog
+===================================================================
+--- tiff-4.0.4.orig/ChangeLog	2016-11-24 14:40:43.046867737 +0800
++++ tiff-4.0.4/ChangeLog	2016-11-28 14:38:01.681276171 +0800
+@@ -17,6 +17,13 @@
+ 	Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2500
+ 	(CVE-2014-8127, duplicate: CVE-2016-3658)
+ 
++2016-10-08 Even Rouault <even.rouault at spatialys.com>
++
++	* tools/tiffcp.c: fix out-of-bounds write on tiled images with odd
++	tile width vs image width. Reported as MSVR 35103
++	by Axel Souchet and Vishal Chauhan from the MSRC Vulnerabilities &
++	Mitigations team.
++
+ 2016-09-24  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>
+
+ 	* libtiff/tif_getimage.c (TIFFRGBAImageOK): Reject attempts to
+Index: tiff-4.0.4/tools/tiffcp.c
+===================================================================
+--- tiff-4.0.4.orig/tools/tiffcp.c	2015-06-21 09:09:10.000000000 +0800
++++ tiff-4.0.4/tools/tiffcp.c	2016-11-28 14:41:02.221277430 +0800
+@@ -1338,7 +1338,7 @@
+ 		uint32 colb = 0;
+ 		uint32 col;
+ 
+-		for (col = 0; col < imagewidth; col += tw) {
++		for (col = 0; col < imagewidth && colb < imagew; col += tw) {
+ 			if (TIFFReadTile(in, tilebuf, col, row, 0, 0) < 0
+ 			    && !ignore) {
+ 				TIFFError(TIFFFileName(in),
+@@ -1523,7 +1523,7 @@
+ 		uint32 colb = 0;
+ 		uint32 col;
+ 
+-		for (col = 0; col < imagewidth; col += tw) {
++		for (col = 0; col < imagewidth && colb < imagew; col += tw) {
+ 			/*
+ 			 * Tile is clipped horizontally.  Calculate
+ 			 * visible portion and skewing factors.
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
index 9b4aff3..3057121 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2016-3622.patch \
            file://CVE-2016-3658.patch \
            file://CVE-2016-3632.patch \
+           file://CVE-2016-9540.patch \
           "
 
 SRC_URI[md5sum] = "d1d2e940dea0b5ad435f21f03d96dd72"
-- 
1.9.1


