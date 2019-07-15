Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1E4D67D718
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 11:04:20 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 207so14715767wma.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 04:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=JzbZ3sYfCjI+zHq+sR8wPGeUEH5E+0Qz6qtn8fxXZp8=;
	b=1BDsyWXktgVYTbLxWxVhea6cYiSF2PL4N20eVs43TLWg7itRTaTFp0J5o9HSTUpfVn
	0HIRyNbLylYLaBbuKm0pkLcLG3wfSap2dQ5UsEneDFJo4IXMi/4c5RJMyZzij4Sx2D86
	ULNdjYPlC+XX16vxgxbbXnFHN9dVBNwBI8mYsXFbVBUbIGi0ufYziH7GaFQZnq1PwbeA
	cQ149cZI1a5uKVCvdpT6mPm+MGjpaO/Urm7oPOphOGM3cQBlfA+BFMmso1OlNfUyIQbJ
	19GIXNjtDepZIOm1QoWYy2RhdtjYewsC5qMcoc3j9a0GxP7KNJgzfoPKQMMrHN9KiAQn
	ysSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JzbZ3sYfCjI+zHq+sR8wPGeUEH5E+0Qz6qtn8fxXZp8=;
	b=lMhnaOqxm4KUT54yaSiNQ9k/E6uoVtZIpV4/ShFyFz2QjQYy+TQgw2ZTwsN7zjTKV+
	LWTaXvi/AVM9OZT0pk3/+nl1QinAfdgGj42oH48Dou98FF3rY8SdR+q09M2QirP06m3M
	W60LV1C5H1tObfaMnkC6tH3zA8f2p5maZvMaMsjwURL8xPXqduaAsFiHD9EaLrd8MRBt
	kbzq7MGfqwNCkkdB7aRlPoniCRgPcxM5M2fh5LJNviFCXI7woYd38hkGWmLIpbt2CV8b
	44HAzFtK4IeUITUI/7lrkWJnj43oPGCYob91gZ0YU/5veILZCWWaeHCeqZ7JR39f8GOl
	6MbA==
X-Gm-Message-State: APjAAAVBDoC4fptX5EYURhpMjpJQARi7SRb4oBx8m9DNq21RaYStJzK5
	i043ZIACjp5ETfRIv7dI3o+WWhzRylI=
X-Google-Smtp-Source: APXvYqyL0Ay09deFaGvSUSop7Nta3HgRX7r60SERp+AfLqVaZh1iXrVZmSbKov2JFP5ZUyc/sBSpaA==
X-Received: by 2002:a1c:f009:: with SMTP id a9mr23482952wmb.32.1563188660681; 
	Mon, 15 Jul 2019 04:04:20 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n1sm13495486wrx.39.2019.07.15.04.04.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 15 Jul 2019 04:04:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2019 12:04:12 +0100
Message-Id: <20190715110413.30525-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715110413.30525-1-ross.burton@intel.com>
References: <20190715110413.30525-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] tiff: fix CVE-2019-6128
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
X-List-Received-Date: Mon, 15 Jul 2019 11:04:21 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libtiff/tiff/CVE-2019-6128.patch          | 52 +++++++++++++++++++
 .../recipes-multimedia/libtiff/tiff_4.0.10.bb |  3 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2019-6128.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2019-6128.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2019-6128.patch
new file mode 100644
index 00000000000..6f1fd4d4478
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
index 7a30690ec17..3c055a15dc8 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 
 CVE_PRODUCT = "libtiff"
 
-SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz"
+SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
+           file://CVE-2019-6128.patch"
 SRC_URI[md5sum] = "114192d7ebe537912a2b97408832e7fd"
 SRC_URI[sha256sum] = "2c52d11ccaf767457db0c46795d9c7d1a8d8f76f68b0b800a3dfe45786b996e4"
 
-- 
2.20.1


