Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 442266B05F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 17:26:32 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id w10so3363546pde.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 09:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=26WHmVkfw1B+0Iy5JvYozVR/ms/EEIYB5buDlCkaT48=;
	b=aW9K/VRCC5Car97ln2DDE7Wjj/wS9V/KaOEmfY1XIW1B7vQatQ6PA4QKrfXmAvEi/Y
	4XBRhu0fvvrhdyGs6SlXQ4joAJPsVZCgJG2cLrTqMfkStWUg3p7r9sCpyyAGhvLumhNm
	0y4nmnfpcP6T8Nwp9BnMNdlrBczVSxqDybTWmDG7/sLhI4CWdCUOPhqO7LxJOalzXPwL
	UY6clxj2EdQXp6kNwgYPVD9jocx3ETonlBpfBxZrLJaJ3NHPV8a2QVHsiQwucSyNgQGN
	viUUAKMJkeqlgxyO9C0/fVwOw4ZAS9JCFkyG1vEH7JDZ+/LE3X5nQRS7Ro8A1n9OBjOO
	hvnQ==
X-Received: by 10.68.197.165 with SMTP id iv5mr15731428pbc.150.1390584391039; 
	Fri, 24 Jan 2014 09:26:31 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id g6sm11967168pat.2.2014.01.24.09.26.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 24 Jan 2014 09:26:29 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jan 2014 10:26:24 -0700
Message-Id: <1390584384-28941-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] tiff: flesh out PACKAGECONFIG
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
X-List-Received-Date: Fri, 24 Jan 2014 17:26:33 -0000

Adds packageconfigs for all appropriate configure arguments (other than jpeg
8/12 bit mode support, where I wasn't clear on the deps, and which I doubt we
care about).

jpeg, zlib, and xz dependencies can now be controlled.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.0.3.bb | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
index 2400b54..9cb8edf 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
@@ -2,7 +2,6 @@ SUMMARY = "Provides support for the Tag Image File Format (TIFF)"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 HOMEPAGE = "http://www.remotesensing.org/libtiff/"
-DEPENDS = "zlib jpeg xz"
 
 SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch \
@@ -17,6 +16,29 @@ inherit autotools
 
 CACHED_CONFIGUREVARS = "ax_cv_check_gl_libgl=no"
 
+PACKAGECONFIG ?= "cxx jpeg zlib lzma \
+                  strip-chopping extrasample-as-alpha check-ycbcr-subsampling"
+
+PACKAGECONFIG[cxx] = "--enable-cxx,--disable-cxx,,"
+PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg,"
+PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib,"
+PACKAGECONFIG[lzma] = "--enable-lzma,--disable-lzma,xz,"
+
+# Convert single-strip uncompressed images to multiple strips of specified
+# size (default: 8192) to reduce memory usage
+PACKAGECONFIG[strip-chopping] = "--enable-strip-chopping,--disable-strip-chopping,,"
+
+# Treat a fourth sample with no EXTRASAMPLE_ value as being ASSOCALPHA
+PACKAGECONFIG[extrasample-as-alpha] = "--enable-extrasample-as-alpha,--disable-extrasample-as-alpha,,"
+
+# Control picking up YCbCr subsample info. Disable to support files lacking
+# the tag
+PACKAGECONFIG[check-ycbcr-subsampling] = "--enable-check-ycbcr-subsampling,--disable-check-ycbcr-subsampling,,"
+
+# Support a mechanism allowing reading large strips (usually one strip files)
+# in chunks when using TIFFReadScanline. Experimental 4.0+ feature
+PACKAGECONFIG[chunky-strip-read] = "--enable-chunky-strip-read,--disable-chunky-strip-read,,"
+
 PACKAGES =+ "tiffxx tiffxx-dbg tiffxx-dev tiffxx-staticdev tiff-utils tiff-utils-dbg"
 FILES_tiffxx = "${libdir}/libtiffxx.so.*"
 FILES_tiffxx-dev = "${libdir}/libtiffxx.so ${libdir}/libtiffxx.la"
-- 
1.8.3.4


