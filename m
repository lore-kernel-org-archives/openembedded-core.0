Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 09F437872C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 18:25:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6IIP1l5028675
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 11:25:01 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 18 Jul 2018 11:25:00 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Jul 2018 11:24:59 -0700
Message-ID: <20180718182500.16793-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/2] tiff: security fix CVE-2018-8905
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
X-List-Received-Date: Wed, 18 Jul 2018 18:25:01 -0000
Content-Type: text/plain

Buffer overflow described at nvd.nits.gov/vuln/detail/CVE-2018-8905.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../libtiff/files/CVE-2018-8905.patch              | 61 ++++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.9.bb      |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2018-8905.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2018-8905.patch b/meta/recipes-multimedia/libtiff/files/CVE-2018-8905.patch
new file mode 100644
index 0000000..962646d
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2018-8905.patch
@@ -0,0 +1,61 @@
+From 58a898cb4459055bb488ca815c23b880c242a27d Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sat, 12 May 2018 15:32:31 +0200
+Subject: [PATCH] LZWDecodeCompat(): fix potential index-out-of-bounds write.
+ Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2780 /
+ CVE-2018-8905
+
+The fix consists in using the similar code LZWDecode() to validate we
+don't write outside of the output buffer.
+
+---
+CVE: CVE-2018-8905
+
+Upstream-Status: Backport [gitlab.com/libtiff/libtiff/commit/58a898...]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+---
+ libtiff/tif_lzw.c |   18 ++++++++++++------
+ 1 file changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/libtiff/tif_lzw.c b/libtiff/tif_lzw.c
+index 4ccb443..94d85e3 100644
+--- a/libtiff/tif_lzw.c
++++ b/libtiff/tif_lzw.c
+@@ -602,6 +602,7 @@ LZWDecodeCompat(TIFF* tif, uint8* op0, tmsize_t occ0, uint16 s)
+ 	char *tp;
+ 	unsigned char *bp;
+ 	int code, nbits;
++	int len;
+ 	long nextbits, nextdata, nbitsmask;
+ 	code_t *codep, *free_entp, *maxcodep, *oldcodep;
+ 
+@@ -753,13 +754,18 @@ LZWDecodeCompat(TIFF* tif, uint8* op0, tmsize_t occ0, uint16 s)
+ 				}  while (--occ);
+ 				break;
+ 			}
+-			assert(occ >= codep->length);
+-			op += codep->length;
+-			occ -= codep->length;
+-			tp = op;
++			len = codep->length;
++			tp = op + len;
+ 			do {
+-				*--tp = codep->value;
+-			} while( (codep = codep->next) != NULL );
++				int t;
++				--tp;
++				t = codep->value;
++				codep = codep->next;
++				*tp = (char)t;
++			} while (codep && tp > op);
++			assert(occ >= len);
++			op += len;
++			occ -= len;
+ 		} else {
+ 			*op++ = (char)code;
+ 			occ--;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
index e8e2a11..53b2b81 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2017-18013.patch \
            file://CVE-2018-5784.patch \
            file://CVE-2018-10963.patch \
+           file://CVE-2018-8905.patch \
           "
 
 SRC_URI[md5sum] = "54bad211279cc93eb4fca31ba9bfdc79"
-- 
2.7.4


