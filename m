Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 668A5700F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 07:11:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7A7BVfJ011784
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Aug 2016 00:11:31 -0700 (PDT)
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 10 Aug 2016 00:11:31 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Aug 2016 15:11:16 +0800
Message-ID: <cc34344c0e84dd4ca6b59190a7e003267a698307.1470812191.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1470812191.git.yi.zhao@windriver.com>
References: <cover.1470812191.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Cc: akuster@mvista.com
Subject: [PATCH 1/5] tiff: Security fix CVE-2015-8781
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
X-List-Received-Date: Wed, 10 Aug 2016 07:11:31 -0000
Content-Type: text/plain

From: Armin Kuster <akuster@mvista.com>

CVE-2015-8781 libtiff: out-of-bounds writes for invalid images

External Reference:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8781

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libtiff/files/CVE-2015-8781.patch              | 195 +++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |   1 +
 2 files changed, 196 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8781.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2015-8781.patch b/meta/recipes-multimedia/libtiff/files/CVE-2015-8781.patch
new file mode 100644
index 0000000..0846f0f
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2015-8781.patch
@@ -0,0 +1,195 @@
+From aaab5c3c9d2a2c6984f23ccbc79702610439bc65 Mon Sep 17 00:00:00 2001
+From: erouault <erouault>
+Date: Sun, 27 Dec 2015 16:25:11 +0000
+Subject: [PATCH] * libtiff/tif_luv.c: fix potential out-of-bound writes in
+ decode functions in non debug builds by replacing assert()s by regular if
+ checks (bugzilla #2522). Fix potential out-of-bound reads in case of short
+ input data.
+
+Upstream-Status: Backport
+
+https://github.com/vadz/libtiff/commit/aaab5c3c9d2a2c6984f23ccbc79702610439bc65
+hand applied Changelog changes
+
+CVE: CVE-2015-8781
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+---
+ ChangeLog         |  7 +++++++
+ libtiff/tif_luv.c | 55 ++++++++++++++++++++++++++++++++++++++++++++-----------
+ 2 files changed, 51 insertions(+), 11 deletions(-)
+
+Index: tiff-4.0.4/ChangeLog
+===================================================================
+--- tiff-4.0.4.orig/ChangeLog
++++ tiff-4.0.4/ChangeLog
+@@ -1,3 +1,10 @@
++2015-12-27  Even Rouault <even.rouault at spatialys.com>
++
++	* libtiff/tif_luv.c: fix potential out-of-bound writes in decode
++	functions in non debug builds by replacing assert()s by regular if
++	checks (bugzilla #2522).
++	Fix potential out-of-bound reads in case of short input data.
++
+ 2015-12-26  Even Rouault <even.rouault at spatialys.com>
+ 
+ 	* libtiff/tif_getimage.c: fix out-of-bound reads in TIFFRGBAImage
+Index: tiff-4.0.4/libtiff/tif_luv.c
+===================================================================
+--- tiff-4.0.4.orig/libtiff/tif_luv.c
++++ tiff-4.0.4/libtiff/tif_luv.c
+@@ -202,7 +202,11 @@ LogL16Decode(TIFF* tif, uint8* op, tmsiz
+ 	if (sp->user_datafmt == SGILOGDATAFMT_16BIT)
+ 		tp = (int16*) op;
+ 	else {
+-		assert(sp->tbuflen >= npixels);
++		if(sp->tbuflen < npixels) {
++			TIFFErrorExt(tif->tif_clientdata, module,
++						 "Translation buffer too short");
++			return (0);
++		}
+ 		tp = (int16*) sp->tbuf;
+ 	}
+ 	_TIFFmemset((void*) tp, 0, npixels*sizeof (tp[0]));
+@@ -211,9 +215,11 @@ LogL16Decode(TIFF* tif, uint8* op, tmsiz
+ 	cc = tif->tif_rawcc;
+ 	/* get each byte string */
+ 	for (shft = 2*8; (shft -= 8) >= 0; ) {
+-		for (i = 0; i < npixels && cc > 0; )
++		for (i = 0; i < npixels && cc > 0; ) {
+ 			if (*bp >= 128) {		/* run */
+-				rc = *bp++ + (2-128);   /* TODO: potential input buffer overrun when decoding corrupt or truncated data */
++				if( cc < 2 )
++					break;
++				rc = *bp++ + (2-128);
+ 				b = (int16)(*bp++ << shft);
+ 				cc -= 2;
+ 				while (rc-- && i < npixels)
+@@ -223,6 +229,7 @@ LogL16Decode(TIFF* tif, uint8* op, tmsiz
+ 				while (--cc && rc-- && i < npixels)
+ 					tp[i++] |= (int16)*bp++ << shft;
+ 			}
++		}
+ 		if (i != npixels) {
+ #if defined(__WIN32__) && (defined(_MSC_VER) || defined(__MINGW32__))
+ 			TIFFErrorExt(tif->tif_clientdata, module,
+@@ -268,13 +275,17 @@ LogLuvDecode24(TIFF* tif, uint8* op, tms
+ 	if (sp->user_datafmt == SGILOGDATAFMT_RAW)
+ 		tp = (uint32 *)op;
+ 	else {
+-		assert(sp->tbuflen >= npixels);
++		if(sp->tbuflen < npixels) {
++			TIFFErrorExt(tif->tif_clientdata, module,
++						 "Translation buffer too short");
++			return (0);
++		}
+ 		tp = (uint32 *) sp->tbuf;
+ 	}
+ 	/* copy to array of uint32 */
+ 	bp = (unsigned char*) tif->tif_rawcp;
+ 	cc = tif->tif_rawcc;
+-	for (i = 0; i < npixels && cc > 0; i++) {
++	for (i = 0; i < npixels && cc >= 3; i++) {
+ 		tp[i] = bp[0] << 16 | bp[1] << 8 | bp[2];
+ 		bp += 3;
+ 		cc -= 3;
+@@ -325,7 +336,11 @@ LogLuvDecode32(TIFF* tif, uint8* op, tms
+ 	if (sp->user_datafmt == SGILOGDATAFMT_RAW)
+ 		tp = (uint32*) op;
+ 	else {
+-		assert(sp->tbuflen >= npixels);
++		if(sp->tbuflen < npixels) {
++			TIFFErrorExt(tif->tif_clientdata, module,
++						 "Translation buffer too short");
++			return (0);
++		}
+ 		tp = (uint32*) sp->tbuf;
+ 	}
+ 	_TIFFmemset((void*) tp, 0, npixels*sizeof (tp[0]));
+@@ -334,11 +349,13 @@ LogLuvDecode32(TIFF* tif, uint8* op, tms
+ 	cc = tif->tif_rawcc;
+ 	/* get each byte string */
+ 	for (shft = 4*8; (shft -= 8) >= 0; ) {
+-		for (i = 0; i < npixels && cc > 0; )
++		for (i = 0; i < npixels && cc > 0; ) {
+ 			if (*bp >= 128) {		/* run */
++				if( cc < 2 )
++					break;
+ 				rc = *bp++ + (2-128);
+ 				b = (uint32)*bp++ << shft;
+-				cc -= 2;                /* TODO: potential input buffer overrun when decoding corrupt or truncated data */
++				cc -= 2;
+ 				while (rc-- && i < npixels)
+ 					tp[i++] |= b;
+ 			} else {			/* non-run */
+@@ -346,6 +363,7 @@ LogLuvDecode32(TIFF* tif, uint8* op, tms
+ 				while (--cc && rc-- && i < npixels)
+ 					tp[i++] |= (uint32)*bp++ << shft;
+ 			}
++		}
+ 		if (i != npixels) {
+ #if defined(__WIN32__) && (defined(_MSC_VER) || defined(__MINGW32__))
+ 			TIFFErrorExt(tif->tif_clientdata, module,
+@@ -413,6 +431,7 @@ LogLuvDecodeTile(TIFF* tif, uint8* bp, t
+ static int
+ LogL16Encode(TIFF* tif, uint8* bp, tmsize_t cc, uint16 s)
+ {
++	static const char module[] = "LogL16Encode";
+ 	LogLuvState* sp = EncoderState(tif);
+ 	int shft;
+ 	tmsize_t i;
+@@ -433,7 +452,11 @@ LogL16Encode(TIFF* tif, uint8* bp, tmsiz
+ 		tp = (int16*) bp;
+ 	else {
+ 		tp = (int16*) sp->tbuf;
+-		assert(sp->tbuflen >= npixels);
++		if(sp->tbuflen < npixels) {
++			TIFFErrorExt(tif->tif_clientdata, module,
++						 "Translation buffer too short");
++			return (0);
++		}
+ 		(*sp->tfunc)(sp, bp, npixels);
+ 	}
+ 	/* compress each byte string */
+@@ -506,6 +529,7 @@ LogL16Encode(TIFF* tif, uint8* bp, tmsiz
+ static int
+ LogLuvEncode24(TIFF* tif, uint8* bp, tmsize_t cc, uint16 s)
+ {
++	static const char module[] = "LogLuvEncode24";
+ 	LogLuvState* sp = EncoderState(tif);
+ 	tmsize_t i;
+ 	tmsize_t npixels;
+@@ -521,7 +545,11 @@ LogLuvEncode24(TIFF* tif, uint8* bp, tms
+ 		tp = (uint32*) bp;
+ 	else {
+ 		tp = (uint32*) sp->tbuf;
+-		assert(sp->tbuflen >= npixels);
++		if(sp->tbuflen < npixels) {
++			TIFFErrorExt(tif->tif_clientdata, module,
++						 "Translation buffer too short");
++			return (0);
++		}
+ 		(*sp->tfunc)(sp, bp, npixels);
+ 	}
+ 	/* write out encoded pixels */
+@@ -553,6 +581,7 @@ LogLuvEncode24(TIFF* tif, uint8* bp, tms
+ static int
+ LogLuvEncode32(TIFF* tif, uint8* bp, tmsize_t cc, uint16 s)
+ {
++	static const char module[] = "LogLuvEncode32";
+ 	LogLuvState* sp = EncoderState(tif);
+ 	int shft;
+ 	tmsize_t i;
+@@ -574,7 +603,11 @@ LogLuvEncode32(TIFF* tif, uint8* bp, tms
+ 		tp = (uint32*) bp;
+ 	else {
+ 		tp = (uint32*) sp->tbuf;
+-		assert(sp->tbuflen >= npixels);
++		if(sp->tbuflen < npixels) {
++			TIFFErrorExt(tif->tif_clientdata, module,
++						 "Translation buffer too short");
++			return (0);
++		}
+ 		(*sp->tfunc)(sp, bp, npixels);
+ 	}
+ 	/* compress each byte string */
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
index 810a5e4..9879c8b 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
@@ -6,6 +6,7 @@ HOMEPAGE = "http://www.remotesensing.org/libtiff/"
 SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch \
            file://CVE-2015-8665_8683.patch \
+           file://CVE-2015-8781.patch \
           "
 
 SRC_URI[md5sum] = "d1d2e940dea0b5ad435f21f03d96dd72"
-- 
2.7.4


