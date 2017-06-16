Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9E206783CF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:28:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:28:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279513"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:28:54 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:28 +0300
Message-Id: <020db817377b40489754f3411e5c6b2b69c563ba.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/32] libpng12: remove the recipe
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
X-List-Received-Date: Fri, 16 Jun 2017 12:28:53 -0000

It was only in oe-core because of LSB; let's remove it. Current libpng is 1.6.x.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../packagegroups/packagegroup-core-lsb.bb         |  1 -
 meta/recipes-lsb4/libpng/libpng12_1.2.57.bb        | 36 ----------------------
 2 files changed, 37 deletions(-)
 delete mode 100644 meta/recipes-lsb4/libpng/libpng12_1.2.57.bb

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 61b35e68921..a6fb3023052 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -177,7 +177,6 @@ RDEPENDS_packagegroup-core-lsb-core = "\
     ncurses \
     zlib \
     nspr \
-    libpng12 \
     nss \
 "
 
diff --git a/meta/recipes-lsb4/libpng/libpng12_1.2.57.bb b/meta/recipes-lsb4/libpng/libpng12_1.2.57.bb
deleted file mode 100644
index 9f74f5fdb5a..00000000000
--- a/meta/recipes-lsb4/libpng/libpng12_1.2.57.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "PNG image format decoding library"
-HOMEPAGE = "http://www.libpng.org/"
-SECTION = "libs"
-LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=597b8a91994a3e27ae6aa79bf02677d9 \
-                    file://png.h;beginline=19;endline=109;md5=166406397718925b660f0033f7558ef7"
-DEPENDS = "zlib"
-
-PN = "libpng12"
-S = "${WORKDIR}/libpng-${PV}"
-
-SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz"
-
-SRC_URI[md5sum] = "307052e5e8af97b82b17b64fb1b3677a"
-SRC_URI[sha256sum] = "0f4620e11fa283fedafb474427c8e96bf149511a1804bdc47350963ae5cf54d8"
-
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libpng/files/libpng12/"
-UPSTREAM_CHECK_REGEX = "/libpng12/(?P<pver>(\d+[\.\-_]*)+)/"
-
-BINCONFIG_GLOB = "${PN}-config"
-
-inherit autotools binconfig pkgconfig
-
-do_install_append() {
-	# The follow link files link to corresponding png12*.h and libpng12* files
-	# They conflict with higher verison, so drop them
-	rm ${D}/${includedir}/png.h
-	rm ${D}/${includedir}/pngconf.h
-
-	rm ${D}/${libdir}/libpng.la
-	rm ${D}/${libdir}/libpng.so
-	rm ${D}/${libdir}/libpng.a || true
-	rm ${D}/${libdir}/pkgconfig/libpng.pc
-
-	rm ${D}/${bindir}/libpng-config
-}
-- 
2.11.0


