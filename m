Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DABCD60DF6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 13:49:19 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 30 Nov 2015 05:49:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,364,1444719600"; d="scan'208";a="609941248"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Nov 2015 05:49:20 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 522A16A4005
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 05:48:11 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Nov 2015 11:01:21 +0200
Message-Id: <1448874081-23745-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1448874081-23745-1-git-send-email-maxin.john@intel.com>
References: <1448874081-23745-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] libjpeg-turbo: import the recipe from meta-oe
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
X-List-Received-Date: Mon, 30 Nov 2015 13:49:20 -0000

Moving the package from meta-oe as a replacement for libjpeg
package. libjpeg-turbo has same API/ABI as libjpeg. It is relatively
faster in JPEG compression/decompression than libjpeg.

[YOCTO #8628]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb

diff --git a/meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb b/meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
new file mode 100644
index 0000000..e79f800
--- /dev/null
+++ b/meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
@@ -0,0 +1,40 @@
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
+SRC_URI[md5sum] = "b1f6b84859a16b8ebdcda951fa07c3f2"
+SRC_URI[sha256sum] = "4bf5bad4ce85625bffbbd9912211e06790e00fb982b77724af7211034efafb08"
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
+EXTRA_OECONF = "--with-jpeg8 "
+
+PACKAGES =+ "jpeg-tools libturbojpeg"
+
+DESCRIPTION_jpeg-tools = "The jpeg-tools package includes client programs to access libjpeg functionality.  These tools allow for the compression, decompression, transformation and display of JPEG files and benchmarking of the libjpeg library."
+FILES_jpeg-tools = "${bindir}/*"
+
+FILES_libturbojpeg = "${libdir}/libturbojpeg.so"
+INSANE_SKIP_libturbojpeg = "dev-so"
+
+BBCLASSEXTEND = "native"
+
+LEAD_SONAME = "libjpeg.so.8"
-- 
2.4.0


