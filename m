Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC6F7F0E9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 04:03:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2019 21:03:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,305,1559545200"; d="scan'208";a="189233234"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga001.fm.intel.com with ESMTP; 24 Jul 2019 21:03:38 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2019 12:03:03 +0800
Message-Id: <1564027386-8107-8-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564027386-8107-1-git-send-email-anuj.mittal@intel.com>
References: <1564027386-8107-1-git-send-email-anuj.mittal@intel.com>
Subject: [warrior][PATCH 08/11] tiff: fix CVE-2019-6128
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
X-List-Received-Date: Thu, 25 Jul 2019 04:03:37 -0000

From: Ross Burton <ross.burton@intel.com>

(From OE-Core rev: 7293e417dd9bdd04fe0fec177a76c9286234ed46)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libtiff/tiff/CVE-2019-6128.patch               | 52 ++++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.10.bb     |  2 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2019-6128.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2019-6128.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2019-6128.patch
new file mode 100644
index 0000000..6f1fd4d
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2019-6128.patch
@@ -0,0 +1,52 @@
+CVE: CVE-2019-6128
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 0c74a9f49b8d7a36b17b54a7428b3526d20f88a8 Mon Sep 17 00:00:00 2001
+From: Scott Gayou <github.scott@gmail.com>
+Date: Wed, 23 Jan 2019 15:03:53 -0500
+Subject: [PATCH] Fix for simple memory leak that was assigned CVE-2019-6128.
+
+pal2rgb failed to free memory on a few errors. This was reported
+here: http://bugzilla.maptools.org/show_bug.cgi?id=2836.
+---
+ tools/pal2rgb.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/tools/pal2rgb.c b/tools/pal2rgb.c
+index 01d8502ec..9492f1cf1 100644
+--- a/tools/pal2rgb.c
++++ b/tools/pal2rgb.c
+@@ -118,12 +118,14 @@ main(int argc, char* argv[])
+ 	    shortv != PHOTOMETRIC_PALETTE) {
+ 		fprintf(stderr, "%s: Expecting a palette image.\n",
+ 		    argv[optind]);
++		(void) TIFFClose(in);
+ 		return (-1);
+ 	}
+ 	if (!TIFFGetField(in, TIFFTAG_COLORMAP, &rmap, &gmap, &bmap)) {
+ 		fprintf(stderr,
+ 		    "%s: No colormap (not a valid palette image).\n",
+ 		    argv[optind]);
++		(void) TIFFClose(in);
+ 		return (-1);
+ 	}
+ 	bitspersample = 0;
+@@ -131,11 +133,14 @@ main(int argc, char* argv[])
+ 	if (bitspersample != 8) {
+ 		fprintf(stderr, "%s: Sorry, can only handle 8-bit images.\n",
+ 		    argv[optind]);
++		(void) TIFFClose(in);
+ 		return (-1);
+ 	}
+ 	out = TIFFOpen(argv[optind+1], "w");
+-	if (out == NULL)
++	if (out == NULL) {
++		(void) TIFFClose(in);
+ 		return (-2);
++	}
+ 	cpTags(in, out);
+ 	TIFFGetField(in, TIFFTAG_IMAGEWIDTH, &imagewidth);
+ 	TIFFGetField(in, TIFFTAG_IMAGELENGTH, &imagelength);
+-- 
+2.21.0
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
index 152fa81..a82d744 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
@@ -6,8 +6,8 @@ CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch \
+           file://CVE-2019-6128.patch"
            "
-
 SRC_URI[md5sum] = "114192d7ebe537912a2b97408832e7fd"
 SRC_URI[sha256sum] = "2c52d11ccaf767457db0c46795d9c7d1a8d8f76f68b0b800a3dfe45786b996e4"
 
-- 
2.7.4


