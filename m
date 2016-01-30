Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id B337676DE1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jan 2016 01:39:45 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id x125so4557145pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 17:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=14E3pFznXSfsQGXZHQ3DaOUtN7Z5Wk0l1Kn6AEeZj8U=;
	b=0JsXedzcvvGnk3P3l0xo8Nl1YfXaNTmgBkFMMNgJe6k+ZQhTqifDwUCi+U64hfprmN
	bBvEw1MriQGX+DLthENd3mhltVxg5Dd+CxWogYf9+CuJbFFZxiSNw9o9uamugoNo34Ib
	E+3pItLeG8vH+lrhDkfKFlPjNHU0xB5fwOOaEarNChYJD2JA0Vk0It/+gE42kSTY8xQx
	U33xBwpUUK/dSGRgDDA/I58kC/tCl8ywbf9dgxyHInDxRez+tvXmIF9WY4J8buWR7gGg
	qJvpNmzSD8DiVudW63lH90dpa/WQUkOdoHvwZ/Ty7Cx1pTNQ+MxfNQhVPJ1DNxUbzcca
	SWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=14E3pFznXSfsQGXZHQ3DaOUtN7Z5Wk0l1Kn6AEeZj8U=;
	b=e7u/RrBMi0fVpN/RE0PI5bXHSOzMppx+eDPV8FWwV/bxSgdoaK+gIH7mSB6yhkqofE
	ppLc5mQZfSc4/lAfEu+sek0GJgdg1tsvIFvR/OhzYQm3NUze7SFsCl/6hplw7xQFXkQO
	Okv9qRHFFVJWN2LONJpbvZnfjro3a/168LI/RlXPPYM/cG42zsogoECfnU571o2oqHVk
	RdoGwFC477v8V/lwSS63Jy6IQjhxyiHhfGvPf7Q79zIGPGNzGGzu3bA/xKBcAN54Nbef
	tqtQitKDA2Vzm/uzlHOrp6F1eSfOfvF/Vxk599U90qz24KxDF4ObrS8eQuYiectxGepG
	jjiQ==
X-Gm-Message-State: AG10YOQDBEwP1mBgVkrYe1akuvffO7WOabOZFyhD2K8b8R/0GnhsbEj02oC5vUSBRUFqVg==
X-Received: by 10.98.93.195 with SMTP id n64mr18530873pfj.67.1454117986320;
	Fri, 29 Jan 2016 17:39:46 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	m70sm26198092pfi.90.2016.01.29.17.39.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 17:39:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri, 29 Jan 2016 17:39:36 -0800
Message-Id: <43a0f271f7fc5879c747c8ceaa8ecf1b51f4fb85.1454117072.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454117072.git.akuster@mvista.com>
References: <cover.1454117072.git.akuster@mvista.com>
In-Reply-To: <cover.1454117072.git.akuster@mvista.com>
References: <cover.1454117072.git.akuster@mvista.com>
Subject: [PATCH 1/2] tiff: Security fix CVE-2015-8781
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
X-List-Received-Date: Sat, 30 Jan 2016 01:39:45 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-8781 libtiff: out-of-bounds writes for invalid images

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../libtiff/files/CVE-2015-8781.patch              | 196 +++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.4.bb      |   1 +
 2 files changed, 197 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8781.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2015-8781.patch b/meta/recipes-multimedia/libtiff/files/CVE-2015-8781.patch
new file mode 100644
index 0000000..bdbe696
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2015-8781.patch
@@ -0,0 +1,196 @@
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
+@@ -1,3 +1,11 @@
++2015-12-27  Even Rouault <even.rouault at spatialys.com>
++
++   * libtiff/tif_luv.c: fix potential out-of-bound writes in decode
++   functions in non debug builds by replacing assert()s by regular if
++   checks (bugzilla #2522).
++   Fix potential out-of-bound reads in case of short input data.
++
++
+ 2015-06-21  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>
+ 
+ 	* libtiff 4.0.4 released.
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
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.4.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.4.bb
index cf3a5f0..6166663 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.4.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.4.bb
@@ -5,6 +5,7 @@ HOMEPAGE = "http://www.remotesensing.org/libtiff/"
 
 SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch \
+           file://CVE-2015-8781.patch \
           "
 
 SRC_URI[md5sum] = "9aee7107408a128c0c7b24286c0db900"
-- 
2.3.5


