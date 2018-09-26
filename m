Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD6DE74596
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 22:51:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8QMpUnV002430
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 15:51:46 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 26 Sep 2018 15:51:25 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Sep 2018 15:51:25 -0700
Message-ID: <20180926225125.189007-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] libtiff: fix CVE-2017-17095
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
X-List-Received-Date: Wed, 26 Sep 2018 22:51:55 -0000
Content-Type: text/plain

Backport fix from gitlab.com/libtiff/libtiff.
nvd.nist.gov does not yet reference this patch.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../libtiff/files/CVE-2017-17095.patch             | 46 ++++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.9.bb      |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-17095.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2017-17095.patch b/meta/recipes-multimedia/libtiff/files/CVE-2017-17095.patch
new file mode 100644
index 0000000..9b9962e
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2017-17095.patch
@@ -0,0 +1,46 @@
+From 9171da596c88e6a2dadcab4a3a89dddd6e1b4655 Mon Sep 17 00:00:00 2001
+From: Nathan Baker <elitebadger@gmail.com>
+Date: Thu, 25 Jan 2018 21:28:15 +0000
+Subject: [PATCH] Add workaround to pal2rgb buffer overflow.
+
+CVE: CVE-2017-17095
+
+Upstream-Status: Backport (unchanged) [gitlab.com/libtiff/libtiff/commit/9171da5...]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com.
+
+---
+ tools/pal2rgb.c |   17 +++++++++++++++--
+ 1 file changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/tools/pal2rgb.c b/tools/pal2rgb.c
+index 0423598..01fcf94 100644
+--- a/tools/pal2rgb.c
++++ b/tools/pal2rgb.c
+@@ -182,8 +182,21 @@ main(int argc, char* argv[])
+ 	{ unsigned char *ibuf, *obuf;
+ 	  register unsigned char* pp;
+ 	  register uint32 x;
+-	  ibuf = (unsigned char*)_TIFFmalloc(TIFFScanlineSize(in));
+-	  obuf = (unsigned char*)_TIFFmalloc(TIFFScanlineSize(out));
++	  tmsize_t tss_in = TIFFScanlineSize(in);
++	  tmsize_t tss_out = TIFFScanlineSize(out);
++	  if (tss_out / tss_in < 3) {
++		/*
++		 * BUG 2750: The following code does not know about chroma
++		 * subsampling of JPEG data. It assumes that the output buffer is 3x
++		 * the length of the input buffer due to exploding the palette into
++		 * RGB tuples. If this assumption is incorrect, it could lead to a
++		 * buffer overflow. Go ahead and fail now to prevent that.
++		 */
++		fprintf(stderr, "Could not determine correct image size for output. Exiting.\n");
++		return -1;
++      }
++	  ibuf = (unsigned char*)_TIFFmalloc(tss_in);
++	  obuf = (unsigned char*)_TIFFmalloc(tss_out);
+ 	  switch (config) {
+ 	  case PLANARCONFIG_CONTIG:
+ 		for (row = 0; row < imagelength; row++) {
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
index fa64d11..93beddb 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2018-10963.patch \
            file://CVE-2018-8905.patch \
            file://CVE-2018-7456.patch \
+           file://CVE-2017-17095.patch \
           "
 
 SRC_URI[md5sum] = "54bad211279cc93eb4fca31ba9bfdc79"
-- 
2.7.4


