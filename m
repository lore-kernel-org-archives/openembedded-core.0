Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0E60375999
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 13:19:44 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 17 Jun 2015 06:19:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,632,1427785200"; d="scan'208";a="729205455"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2015 06:19:44 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 16:19:20 +0300
Message-Id: <1434547172-24620-11-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/22] Add a recipe for libwebp
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
X-List-Received-Date: Wed, 17 Jun 2015 13:19:44 -0000

libwebp is a dependency of webkit

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/webp/libwebp_0.4.3.bb | 47 +++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 meta/recipes-multimedia/webp/libwebp_0.4.3.bb

diff --git a/meta/recipes-multimedia/webp/libwebp_0.4.3.bb b/meta/recipes-multimedia/webp/libwebp_0.4.3.bb
new file mode 100644
index 0000000..3ab2e5b
--- /dev/null
+++ b/meta/recipes-multimedia/webp/libwebp_0.4.3.bb
@@ -0,0 +1,47 @@
+SUMMARY = "WebP is an image format designed for the Web"
+DESCRIPTION = "WebP is a method of lossy and lossless compression that can be \
+               used on a large variety of photographic, translucent and \
+               graphical images found on the web. The degree of lossy \
+               compression is adjustable so a user can choose the trade-off \
+               between file size and image quality. WebP typically achieves \
+               an average of 30% more compression than JPEG and JPEG 2000, \
+               without loss of image quality."
+HOMEPAGE = "https://developers.google.com/speed/webp/"
+SECTION = "libs"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb"
+
+DEPENDS = "giflib"
+
+SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
+SRC_URI[md5sum] = "08813525eeeffe7e305b4cbfade8ae9b"
+SRC_URI[sha256sum] = "efbe0d58fda936f2ed99d0b837ed7087d064d6838931f282c4618d2a3f7390c4"
+
+EXTRA_OECONF = " \
+    --disable-experimental \
+    --disable-wic \
+    --enable-libwebpmux \
+    --enable-libwebpdemux \
+    --enable-threading \
+"
+
+inherit autotools lib_package
+
+PACKAGECONFIG ??= ""
+
+# libwebpdecoder is a subset of libwebp, don't build it unless requested
+PACKAGECONFIG[decoder] = "--enable-libwebpdecoder,--disable-libwebpdecoder"
+
+# Apply for examples programs: cwebp and dwebp
+PACKAGECONFIG[jpeg] = ",ac_cv_header_jpeglib_h=no,jpeg"
+PACKAGECONFIG[png] = ",ac_cv_header_png_h=no,libpng"
+PACKAGECONFIG[tiff] = ",ac_cv_header_tiffio_h=no,tiff"
+
+# Apply only for example program vwebp
+PACKAGECONFIG[gl] = ",,mesa-glut"
+
+PACKAGES =+ "${PN}-gif2webp"
+
+DESCRIPTION_${PN}-gif2webp = "Simple tool to convert animated GIFs to WebP"
+FILES_${PN}-gif2webp = "${bindir}/gif2webp"
-- 
2.1.4


