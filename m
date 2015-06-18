Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E5F65759FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 12:36:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 18 Jun 2015 05:36:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,638,1427785200"; d="scan'208";a="745804112"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2015 05:36:01 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jun 2015 15:35:48 +0300
Message-Id: <f24e893f433551176665877d6e1b72e8811d6d87.1434630758.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <6ef0af09f1d738f8f447f286ccefb0b74c4511de.1434630758.git.alexander.kanavin@linux.intel.com>
References: <6ef0af09f1d738f8f447f286ccefb0b74c4511de.1434630758.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1434630758.git.alexander.kanavin@linux.intel.com>
References: <cover.1434630758.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 10/21] libwebp: add a recipe from meta-oe
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
X-List-Received-Date: Thu, 18 Jun 2015 12:36:01 -0000

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


