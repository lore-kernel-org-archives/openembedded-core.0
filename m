Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2C05E6067C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 13:27:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 02 Dec 2015 05:27:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,373,1444719600"; d="scan'208";a="611278936"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Dec 2015 05:27:22 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 3837B6A4005
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 05:26:13 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Dec 2015 10:39:35 +0200
Message-Id: <1449045575-11382-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH v3] libjpeg: Replace libjpeg with libjpeg-turbo
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
X-List-Received-Date: Wed, 02 Dec 2015 13:27:23 -0000

Moving libjpeg-turbo from meta-oe as a replacement for libjpeg
package. libjpeg-turbo has same API/ABI as libjpeg. It is
relatively faster in JPEG compression/decompression than libjpeg.

[YOCTO #8628]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-core/jpeg/jpeg_9a.bb                | 29 -------------------
 meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.2.bb | 36 ++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-core/jpeg/jpeg_9a.bb
 create mode 100644 meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.2.bb

diff --git a/meta/recipes-core/jpeg/jpeg_9a.bb b/meta/recipes-core/jpeg/jpeg_9a.bb
deleted file mode 100644
index ea2e65d..0000000
--- a/meta/recipes-core/jpeg/jpeg_9a.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "libjpeg is a library for handling the JPEG (JFIF) image format"
-DESCRIPTION = "libjpeg contains a library for handling the JPEG (JFIF) image format, as well as related programs for accessing the libjpeg functions."
-HOMEPAGE = "http://www.ijg.org/"
-
-LICENSE ="BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://README;md5=ea93a8a2fed10106b63bc21679edacb9"
-
-SECTION = "libs"
-
-SRC_URI = "http://www.ijg.org/files/jpegsrc.v${PV}.tar.gz \
-	  "
-
-SRC_URI[md5sum] = "3353992aecaee1805ef4109aadd433e7"
-SRC_URI[sha256sum] = "3a753ea48d917945dd54a2d97de388aa06ca2eb1066cbfdc6652036349fe05a7"
-
-inherit autotools
-
-PACKAGES =+ 		"jpeg-tools "
-DESCRIPTION_jpeg-tools = "The jpeg-tools package includes the client programs for access libjpeg functionality.  These tools allow for the compression, decompression, transformation and display of JPEG files."
-FILES_jpeg-tools = 	"${bindir}/*"
-
-BBCLASSEXTEND = "native"
-
-pkg_postinst_${PN}_linuxstdbase () {
-    if [ ! -e $D${libdir}/libjpeg.so.62 ]; then
-        JPEG=`find $D${libdir} -type f -name libjpeg.so.\*.\*.\*`
-        ln -sf `basename $JPEG` $D${libdir}/libjpeg.so.62
-    fi
-}
diff --git a/meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.2.bb b/meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.2.bb
new file mode 100644
index 0000000..0947763
--- /dev/null
+++ b/meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.2.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "libjpeg-turbo is a derivative of libjpeg that uses SIMD instructions (MMX, SSE2, NEON) to accelerate baseline JPEG compression and decompression"
+HOMEPAGE = "http://libjpeg-turbo.org/"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=cad955d15145c3fdceec6855e078e953 \
+                    file://jpeglib.h;endline=14;md5=dfc803dc51ae21178d1376ec73c4454d \
+                    file://djpeg.c;endline=9;md5=e93a8f2061e8a0ac71c7a485c10489e2 \
+"
+
+DEPENDS = "nasm-native"
+
+BASEPV = "${@d.getVar('PV',True).split('+')[1]}"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${BASEPV}.tar.gz"
+SRC_URI[md5sum] = "86b0d5f7507c2e6c21c00219162c3c44"
+SRC_URI[sha256sum] = "521bb5d3043e7ac063ce3026d9a59cc2ab2e9636c655a2515af5f4706122233e"
+
+S = "${WORKDIR}/${BPN}-${BASEPV}"
+
+# Drop-in replacement for jpeg
+PROVIDES = "jpeg"
+RPROVIDES_${PN} += "jpeg"
+RREPLACES_${PN} += "jpeg"
+RCONFLICTS_${PN} += "jpeg"
+
+inherit autotools pkgconfig
+
+PACKAGES =+ "jpeg-tools libturbojpeg"
+
+DESCRIPTION_jpeg-tools = "The jpeg-tools package includes client programs to access libjpeg functionality.  These tools allow for the compression, decompression, transformation and display of JPEG files and benchmarking of the libjpeg library."
+FILES_jpeg-tools = "${bindir}/*"
+
+DESCRIPTION_libturbojpeg = "A SIMD-accelerated JPEG codec which provides only TurboJPEG APIs"
+FILES_libturbojpeg = "${libdir}/libturbojpeg.so.*"
+
+BBCLASSEXTEND = "native"
-- 
2.4.0


