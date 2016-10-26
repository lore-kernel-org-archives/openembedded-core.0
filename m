Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D296071AAD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 08:27:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9Q8RDH8012408
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 01:27:13 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 26 Oct 2016 01:27:12 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Oct 2016 16:26:48 +0800
Message-ID: <48d4f88a3012d5e46e1e59d71350493fea25f163.1477470209.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1477470209.git.yi.zhao@windriver.com>
References: <cover.1477470209.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH 5/5] tiff: Security fix CVE-2016-3622
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
X-List-Received-Date: Wed, 26 Oct 2016 08:27:12 -0000
Content-Type: text/plain

CVE-2016-3622 libtiff: The fpAcc function in tif_predict.c in the
tiff2rgba tool in LibTIFF 4.0.6 and earlier allows remote attackers to
cause a denial of service (divide-by-zero error) via a crafted TIFF
image.

External References:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3622
http://www.openwall.com/lists/oss-security/2016/04/07/4

Patch from:
https://github.com/vadz/libtiff/commit/92d966a5fcfbdca67957c8c5c47b467aa650b286

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libtiff/files/CVE-2016-3622.patch              | 129 +++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |   1 +
 2 files changed, 130 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3622.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-3622.patch b/meta/recipes-multimedia/libtiff/files/CVE-2016-3622.patch
new file mode 100644
index 0000000..0c8b716
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2016-3622.patch
@@ -0,0 +1,129 @@
+From 92d966a5fcfbdca67957c8c5c47b467aa650b286 Mon Sep 17 00:00:00 2001
+From: bfriesen <bfriesen>
+Date: Sat, 24 Sep 2016 23:11:55 +0000
+Subject: [PATCH] * libtiff/tif_getimage.c (TIFFRGBAImageOK): Reject attempts
+ to read floating point images.
+
+* libtiff/tif_predict.c (PredictorSetup): Enforce bits-per-sample
+requirements of floating point predictor (3).  Fixes CVE-2016-3622
+"Divide By Zero in the tiff2rgba tool."
+
+CVE: CVE-2016-3622
+Upstream-Status: Backport
+https://github.com/vadz/libtiff/commit/92d966a5fcfbdca67957c8c5c47b467aa650b286
+
+Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
+---
+ ChangeLog              | 11 ++++++++++-
+ libtiff/tif_getimage.c | 38 ++++++++++++++++++++------------------
+ libtiff/tif_predict.c  | 11 ++++++++++-
+ 3 files changed, 40 insertions(+), 20 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 26d6f47..a628277 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,12 @@
++2016-09-24  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>
++
++	* libtiff/tif_getimage.c (TIFFRGBAImageOK): Reject attempts to
++	read floating point images.
++
++	* libtiff/tif_predict.c (PredictorSetup): Enforce bits-per-sample
++	requirements of floating point predictor (3).  Fixes CVE-2016-3622
++	"Divide By Zero in the tiff2rgba tool."
++
+ 2016-08-15 Even Rouault <even.rouault at spatialys.com>
+ 
+ 	* tools/rgb2ycbcr.c: validate values of -v and -h parameters to
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index 386cee0..3e689ee 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -95,6 +95,10 @@ TIFFRGBAImageOK(TIFF* tif, char emsg[1024])
+ 			    td->td_bitspersample);
+ 			return (0);
+ 	}
++        if (td->td_sampleformat == SAMPLEFORMAT_IEEEFP) {
++                sprintf(emsg, "Sorry, can not handle images with IEEE floating-point samples");
++                return (0);
++        }
+ 	colorchannels = td->td_samplesperpixel - td->td_extrasamples;
+ 	if (!TIFFGetField(tif, TIFFTAG_PHOTOMETRIC, &photometric)) {
+ 		switch (colorchannels) {
+@@ -182,27 +186,25 @@ TIFFRGBAImageOK(TIFF* tif, char emsg[1024])
+ 				    "Planarconfiguration", td->td_planarconfig);
+ 				return (0);
+ 			}
+-			if( td->td_samplesperpixel != 3 || colorchannels != 3 )
+-            {
+-                sprintf(emsg,
+-                        "Sorry, can not handle image with %s=%d, %s=%d",
+-                        "Samples/pixel", td->td_samplesperpixel,
+-                        "colorchannels", colorchannels);
+-                return 0;
+-            }
++			if ( td->td_samplesperpixel != 3 || colorchannels != 3 ) {
++                                sprintf(emsg,
++                                        "Sorry, can not handle image with %s=%d, %s=%d",
++                                        "Samples/pixel", td->td_samplesperpixel,
++                                        "colorchannels", colorchannels);
++                                return 0;
++                        }
+ 			break;
+ 		case PHOTOMETRIC_CIELAB:
+-            if( td->td_samplesperpixel != 3 || colorchannels != 3 || td->td_bitspersample != 8 )
+-            {
+-                sprintf(emsg,
+-                        "Sorry, can not handle image with %s=%d, %s=%d and %s=%d",
+-                        "Samples/pixel", td->td_samplesperpixel,
+-                        "colorchannels", colorchannels,
+-                        "Bits/sample", td->td_bitspersample);
+-                return 0;
+-            }
++                        if ( td->td_samplesperpixel != 3 || colorchannels != 3 || td->td_bitspersample != 8 ) {
++                                sprintf(emsg,
++                                        "Sorry, can not handle image with %s=%d, %s=%d and %s=%d",
++                                        "Samples/pixel", td->td_samplesperpixel,
++                                        "colorchannels", colorchannels,
++                                        "Bits/sample", td->td_bitspersample);
++                                return 0;
++                        }
+ 			break;
+-		default:
++                default:
+ 			sprintf(emsg, "Sorry, can not handle image with %s=%d",
+ 			    photoTag, photometric);
+ 			return (0);
+diff --git a/libtiff/tif_predict.c b/libtiff/tif_predict.c
+index 081eb11..555f2f9 100644
+--- a/libtiff/tif_predict.c
++++ b/libtiff/tif_predict.c
+@@ -80,6 +80,15 @@ PredictorSetup(TIFF* tif)
+ 				    td->td_sampleformat);
+ 				return 0;
+ 			}
++                        if (td->td_bitspersample != 16
++                            && td->td_bitspersample != 24
++                            && td->td_bitspersample != 32
++                            && td->td_bitspersample != 64) { /* Should 64 be allowed? */
++                                TIFFErrorExt(tif->tif_clientdata, module,
++                                             "Floating point \"Predictor\" not supported with %d-bit samples",
++                                             td->td_bitspersample);
++				return 0;
++                            }
+ 			break;
+ 		default:
+ 			TIFFErrorExt(tif->tif_clientdata, module,
+@@ -174,7 +183,7 @@ PredictorSetupDecode(TIFF* tif)
+ 		}
+ 		/*
+ 		 * Allocate buffer to keep the decoded bytes before
+-		 * rearranging in the ight order
++		 * rearranging in the right order
+ 		 */
+ 	}
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
index 466dfbb..796d86e 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2016-3990.patch \
            file://CVE-2016-3991.patch \
            file://CVE-2016-3623.patch \
+           file://CVE-2016-3622.patch \
           "
 
 SRC_URI[md5sum] = "d1d2e940dea0b5ad435f21f03d96dd72"
-- 
2.7.4


