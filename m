Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BC8FD6FF56
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 13:25:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 10 Jun 2016 06:25:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,449,1459839600"; d="scan'208";a="984831398"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2016 06:25:19 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 136F96A4006
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 07:12:44 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jun 2016 11:32:20 +0300
Message-Id: <1465547540-15709-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH v3] libjpeg-turbo: update to 1.5.0
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
X-List-Received-Date: Fri, 10 Jun 2016 13:25:18 -0000

1. LIC_FILES_CHKSUM updates only involves changes in Copyright holders.
   LICENSE remains the same.

2. libjpeg-turbo don't have non-floating point ABI support in MIPS.
   Provide a work around for that.

3. Provide a workaround if Altivec unit is not present in PPC

4. Rename the recipe to fix upstream version check

[YOCTO #9606]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...eg-turbo_8d+1.4.2.bb => libjpeg-turbo_1.5.0.bb} | 24 +++++++++++++---------
 1 file changed, 14 insertions(+), 10 deletions(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_8d+1.4.2.bb => libjpeg-turbo_1.5.0.bb} (56%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_8d+1.4.2.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.0.bb
similarity index 56%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_8d+1.4.2.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.0.bb
index 4859431..8c2df05 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_8d+1.4.2.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.0.bb
@@ -2,22 +2,19 @@ DESCRIPTION = "libjpeg-turbo is a derivative of libjpeg that uses SIMD instructi
 HOMEPAGE = "http://libjpeg-turbo.org/"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=cad955d15145c3fdceec6855e078e953 \
-                    file://jpeglib.h;endline=14;md5=dfc803dc51ae21178d1376ec73c4454d \
-                    file://djpeg.c;endline=9;md5=e93a8f2061e8a0ac71c7a485c10489e2 \
+LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=13;md5=05bab7c7ad899d85bfba60da1a1271f2 \
+                    file://jpeglib.h;endline=16;md5=f67d70e547a2662c079781c72f877f72 \
+                    file://djpeg.c;endline=11;md5=b90b6d2b4119f9e5807cd273f525d2af \
 "
-
 DEPENDS = "nasm-native"
 
-BASEPV = "${@d.getVar('PV',True).split('+')[1]}"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${BASEPV}.tar.gz"
-SRC_URI[md5sum] = "86b0d5f7507c2e6c21c00219162c3c44"
-SRC_URI[sha256sum] = "521bb5d3043e7ac063ce3026d9a59cc2ab2e9636c655a2515af5f4706122233e"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "3fc5d9b6a8bce96161659ae7a9939257"
+SRC_URI[sha256sum] = "9f397c31a67d2b00ee37597da25898b03eb282ccd87b135a50a69993b6a2035f"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-S = "${WORKDIR}/${BPN}-${BASEPV}"
+PE= "1"
 
 # Drop-in replacement for jpeg
 PROVIDES = "jpeg"
@@ -30,6 +27,13 @@ inherit autotools pkgconfig
 # Work around missing x32 ABI support
 EXTRA_OECONF_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", "--without-simd", "", d)}"
 
+# Work around missing non-floating point ABI support in MIPS
+EXTRA_OECONF_append_class-target = " ${@bb.utils.contains("MIPSPKGSFX_FPU", "-nf", "--without-simd", "", d)}"
+
+# Provide a workaround if Altivec unit is not present in PPC
+EXTRA_OECONF_append_class-target_powerpc = "${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "--without-simd", d)}"
+EXTRA_OECONF_append_class-target_powerpc64 = "${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "--without-simd", d)}"
+
 PACKAGES =+ "jpeg-tools libturbojpeg"
 
 DESCRIPTION_jpeg-tools = "The jpeg-tools package includes client programs to access libjpeg functionality.  These tools allow for the compression, decompression, transformation and display of JPEG files and benchmarking of the libjpeg library."
-- 
2.4.0


