Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 13D3C60722
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 00:29:48 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id bt5so17283010pac.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 17:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mlUAszF8H7Hpj4GfJvgdBBZ6SRxmheCA5GXjKKpzY+Q=;
	b=hlSwVa+sHqNPnUyF88bMYfmm/EdUA6U84118XxQ+FP+ofS6nvABPFRlHZaozxpr6UC
	vTVk6DwzWWG9bTSAqmQMAcX39HX8AqXCKj9QQ+i1h90IBURrWoKVUyNG25D6NLcphrGL
	0OkCGseV+OIykz5uTM1NYbcgvkgGdOgNscEJvhigvew6+GiRyDvdPyI5tdVcilWHx3wS
	XCwL5B9pS3mDAmciXkdf7NWRJf6t2CM0pQbntE9kOH0EvSoBERW/HHLwwqXgEHB87l9u
	RpBNuQKanfap3LnyNifKn0usiopxRudi8zt+pEfWG0lGRRiwjtqsSS6Ztvb2fk54sZM0
	XIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mlUAszF8H7Hpj4GfJvgdBBZ6SRxmheCA5GXjKKpzY+Q=;
	b=ks396JiyimecTEteqpnT6acBZT9N9aaGmO8d1sXGMxC/PLfRD45aoc67j5dgZL+1Oa
	DuwB0nVhYnLnxARFpS5AXNb9/fnMQeq5aa5gnDOBbNdBS2twRUHRgStzV8mICQ4NHM+6
	4R7GsCAa/BJivqu8Z4l5QBzh81KRpb8/lOWy47eAtkvXv9pbpqvegIgWBytjZf/7eA0C
	sUtLhhcPON7sq16auYxpKuExaoR4ShjvJZIaPx56k9IWm9aB8v9folefkel1l0xjdfJh
	CPTWgfpbpbFtOXsYK/72TZnrhm4W7Ky7UTuGVgZd1QtaCFo1bR9P3K3XQ0rAqa4cVYTK
	PqQw==
X-Gm-Message-State: AOPr4FV2BciFdciC10Q8WwSD3QsHkrbtqHrQL/vzMY+y6IOxOqSz9BfsZWJqfJF/u8BpGg==
X-Received: by 10.66.229.6 with SMTP id sm6mr409163pac.2.1461630589391;
	Mon, 25 Apr 2016 17:29:49 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	zn12sm14681603pab.14.2016.04.25.17.29.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Apr 2016 17:29:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Apr 2016 17:29:41 -0700
Message-Id: <1461630581-26018-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [master][kergoth][PATCH] tiff: Security fixes CVE-2015-8665 and CVE-2015-8683
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
X-List-Received-Date: Tue, 26 Apr 2016 00:29:49 -0000

From: Armin Kuster <akuster@mvista.com>

same fix for both CVE's

tiff <= 4.0.6

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../libtiff/files/CVE-2015-8665_8683.patch         | 137 +++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |   1 +
 2 files changed, 138 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8665_8683.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2015-8665_8683.patch b/meta/recipes-multimedia/libtiff/files/CVE-2015-8665_8683.patch
new file mode 100644
index 0000000..39c5059
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2015-8665_8683.patch
@@ -0,0 +1,137 @@
+From f94a29a822f5528d2334592760fbb7938f15eb55 Mon Sep 17 00:00:00 2001
+From: erouault <erouault>
+Date: Sat, 26 Dec 2015 17:32:03 +0000
+Subject: [PATCH] * libtiff/tif_getimage.c: fix out-of-bound reads in
+ TIFFRGBAImage interface in case of unsupported values of
+ SamplesPerPixel/ExtraSamples for LogLUV / CIELab. Add explicit call to
+ TIFFRGBAImageOK() in TIFFRGBAImageBegin(). Fix CVE-2015-8665 reported by
+ limingxing and CVE-2015-8683 reported by zzf of Alibaba.
+
+Upstream-Status: Backport
+CVE: CVE-2015-8665
+CVE: CVE-2015-8683
+https://github.com/vadz/libtiff/commit/f94a29a822f5528d2334592760fbb7938f15eb55
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ChangeLog              |  8 ++++++++
+ libtiff/tif_getimage.c | 35 ++++++++++++++++++++++-------------
+ 2 files changed, 30 insertions(+), 13 deletions(-)
+
+Index: tiff-4.0.6/libtiff/tif_getimage.c
+===================================================================
+--- tiff-4.0.6.orig/libtiff/tif_getimage.c
++++ tiff-4.0.6/libtiff/tif_getimage.c
+@@ -182,20 +182,22 @@ TIFFRGBAImageOK(TIFF* tif, char emsg[102
+ 				    "Planarconfiguration", td->td_planarconfig);
+ 				return (0);
+ 			}
+-			if( td->td_samplesperpixel != 3 )
++			if( td->td_samplesperpixel != 3 || colorchannels != 3 )
+             {
+                 sprintf(emsg,
+-                        "Sorry, can not handle image with %s=%d",
+-                        "Samples/pixel", td->td_samplesperpixel);
++                        "Sorry, can not handle image with %s=%d, %s=%d",
++                        "Samples/pixel", td->td_samplesperpixel,
++                        "colorchannels", colorchannels);
+                 return 0;
+             }
+ 			break;
+ 		case PHOTOMETRIC_CIELAB:
+-            if( td->td_samplesperpixel != 3 || td->td_bitspersample != 8 )
++            if( td->td_samplesperpixel != 3 || colorchannels != 3 || td->td_bitspersample != 8 )
+             {
+                 sprintf(emsg,
+-                        "Sorry, can not handle image with %s=%d and %s=%d",
++                        "Sorry, can not handle image with %s=%d, %s=%d and %s=%d",
+                         "Samples/pixel", td->td_samplesperpixel,
++                        "colorchannels", colorchannels,
+                         "Bits/sample", td->td_bitspersample);
+                 return 0;
+             }
+@@ -255,6 +257,9 @@ TIFFRGBAImageBegin(TIFFRGBAImage* img, T
+ 	int colorchannels;
+ 	uint16 *red_orig, *green_orig, *blue_orig;
+ 	int n_color;
++	
++	if( !TIFFRGBAImageOK(tif, emsg) )
++		return 0;
+ 
+ 	/* Initialize to normal values */
+ 	img->row_offset = 0;
+@@ -2508,29 +2513,33 @@ PickContigCase(TIFFRGBAImage* img)
+ 		case PHOTOMETRIC_RGB:
+ 			switch (img->bitspersample) {
+ 				case 8:
+-					if (img->alpha == EXTRASAMPLE_ASSOCALPHA)
++					if (img->alpha == EXTRASAMPLE_ASSOCALPHA &&
++						img->samplesperpixel >= 4)
+ 						img->put.contig = putRGBAAcontig8bittile;
+-					else if (img->alpha == EXTRASAMPLE_UNASSALPHA)
++					else if (img->alpha == EXTRASAMPLE_UNASSALPHA &&
++							 img->samplesperpixel >= 4)
+ 					{
+ 						if (BuildMapUaToAa(img))
+ 							img->put.contig = putRGBUAcontig8bittile;
+ 					}
+-					else
++					else if( img->samplesperpixel >= 3 )
+ 						img->put.contig = putRGBcontig8bittile;
+ 					break;
+ 				case 16:
+-					if (img->alpha == EXTRASAMPLE_ASSOCALPHA)
++					if (img->alpha == EXTRASAMPLE_ASSOCALPHA &&
++						img->samplesperpixel >=4 )
+ 					{
+ 						if (BuildMapBitdepth16To8(img))
+ 							img->put.contig = putRGBAAcontig16bittile;
+ 					}
+-					else if (img->alpha == EXTRASAMPLE_UNASSALPHA)
++					else if (img->alpha == EXTRASAMPLE_UNASSALPHA &&
++							 img->samplesperpixel >=4 )
+ 					{
+ 						if (BuildMapBitdepth16To8(img) &&
+ 						    BuildMapUaToAa(img))
+ 							img->put.contig = putRGBUAcontig16bittile;
+ 					}
+-					else
++					else if( img->samplesperpixel >=3 )
+ 					{
+ 						if (BuildMapBitdepth16To8(img))
+ 							img->put.contig = putRGBcontig16bittile;
+@@ -2539,7 +2548,7 @@ PickContigCase(TIFFRGBAImage* img)
+ 			}
+ 			break;
+ 		case PHOTOMETRIC_SEPARATED:
+-			if (buildMap(img)) {
++			if (img->samplesperpixel >=4 && buildMap(img)) {
+ 				if (img->bitspersample == 8) {
+ 					if (!img->Map)
+ 						img->put.contig = putRGBcontig8bitCMYKtile;
+@@ -2635,7 +2644,7 @@ PickContigCase(TIFFRGBAImage* img)
+ 			}
+ 			break;
+ 		case PHOTOMETRIC_CIELAB:
+-			if (buildMap(img)) {
++			if (img->samplesperpixel == 3 && buildMap(img)) {
+ 				if (img->bitspersample == 8)
+ 					img->put.contig = initCIELabConversion(img);
+ 				break;
+Index: tiff-4.0.6/ChangeLog
+===================================================================
+--- tiff-4.0.6.orig/ChangeLog
++++ tiff-4.0.6/ChangeLog
+@@ -1,3 +1,11 @@
++2015-12-26  Even Rouault <even.rouault at spatialys.com>
++
++   * libtiff/tif_getimage.c: fix out-of-bound reads in TIFFRGBAImage
++   interface in case of unsupported values of SamplesPerPixel/ExtraSamples
++   for LogLUV / CIELab. Add explicit call to TIFFRGBAImageOK() in
++   TIFFRGBAImageBegin(). Fix CVE-2015-8665 reported by limingxing and
++   CVE-2015-8683 reported by zzf of Alibaba.
++
+ 2015-09-12  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>
+ 
+ 	* libtiff 4.0.6 released.
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
index e2e24e0..810a5e4 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
@@ -5,6 +5,7 @@ HOMEPAGE = "http://www.remotesensing.org/libtiff/"
 
 SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch \
+           file://CVE-2015-8665_8683.patch \
           "
 
 SRC_URI[md5sum] = "d1d2e940dea0b5ad435f21f03d96dd72"
-- 
2.3.5


