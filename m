Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 37EB1772CB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 09:26:54 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jun 2016 02:26:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="114703397"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 02 Jun 2016 02:26:29 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 12:25:52 +0300
Message-Id: <51155ff1f82d12fc839613ba527b6176ea08dccb.1464859158.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
References: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
References: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 15/31] python-pycairo: move to Python 3
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
X-List-Received-Date: Thu, 02 Jun 2016 09:26:54 -0000

The Python 3 version comes in a separate tarball, and is relicensed
under LGPLv3:
http://cairographics.org/pycairo/

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../python/python-pycairo_1.10.0.bb                | 41 ----------------------
 .../python/python3-pycairo_1.10.0.bb               | 40 +++++++++++++++++++++
 2 files changed, 40 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-pycairo_1.10.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycairo_1.10.0.bb

diff --git a/meta/recipes-devtools/python/python-pycairo_1.10.0.bb b/meta/recipes-devtools/python/python-pycairo_1.10.0.bb
deleted file mode 100644
index 78e8a4e..0000000
--- a/meta/recipes-devtools/python/python-pycairo_1.10.0.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "Python bindings for the Cairo canvas library"
-HOMEPAGE = "http://cairographics.org/pycairo"
-BUGTRACKER = "http://bugs.freedesktop.org"
-SECTION = "python-devel"
-LICENSE = "LGPLv2.1 & MPL-1.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f2e071ab72978431b294a0d696327421 \
-                    file://COPYING-LGPL-2.1;md5=fad9b3332be894bab9bc501572864b29 \
-                    file://COPYING-MPL-1.1;md5=bfe1f75d606912a4111c90743d6c7325"
-
-# cairo >= 1.8.8
-DEPENDS = "cairo"
-PR = "r2"
-
-SRC_URI = "http://cairographics.org/releases/py2cairo-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "20337132c4ab06c1146ad384d55372c5"
-SRC_URI[sha256sum] = "d30439f06c2ec1a39e27464c6c828b6eface3b22ee17b2de05dc409e429a7431"
-
-S = "${WORKDIR}/py2cairo-${PV}"
-
-inherit distutils pkgconfig
-
-BBCLASSEXTEND = "native"
-
-do_configure() {
-	./waf configure --prefix=${D}${prefix} --libdir=${D}${libdir}
-}
-
-do_compile() {
-	./waf build ${PARALLEL_MAKE}
-}
-
-do_install() {
-	./waf install
-	sed \
-		-e 's:@prefix@:${prefix}:' \
-		-e 's:@VERSION@:${PV}:' \
-		-e 's:@includedir@:${includedir}:' \
-		pycairo.pc.in > pycairo.pc
-	install -m 0644 pycairo.pc ${D}${libdir}/pkgconfig/
-}
diff --git a/meta/recipes-devtools/python/python3-pycairo_1.10.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.10.0.bb
new file mode 100644
index 0000000..f9031b3
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycairo_1.10.0.bb
@@ -0,0 +1,40 @@
+SUMMARY = "Python bindings for the Cairo canvas library"
+HOMEPAGE = "http://cairographics.org/pycairo"
+BUGTRACKER = "http://bugs.freedesktop.org"
+SECTION = "python-devel"
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+# cairo >= 1.8.8
+DEPENDS = "cairo"
+PR = "r2"
+
+SRC_URI = "http://cairographics.org/releases/pycairo-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "e6fd3f2f1e6a72e0db0868c4985669c5"
+SRC_URI[sha256sum] = "9aa4078e7eb5be583aeabbe8d87172797717f95e8c4338f0d4a17b683a7253be"
+
+S = "${WORKDIR}/pycairo-${PV}"
+
+inherit distutils3 pkgconfig
+
+BBCLASSEXTEND = "native"
+
+do_configure() {
+	PYTHON=${PYTHON} ./waf configure --prefix=${D}${prefix} --libdir=${D}${libdir}
+}
+
+do_compile() {
+	./waf build ${PARALLEL_MAKE}
+}
+
+do_install() {
+	./waf install
+	sed \
+		-e 's:@prefix@:${prefix}:' \
+		-e 's:@VERSION@:${PV}:' \
+		-e 's:@includedir@:${includedir}:' \
+		py3cairo.pc.in > py3cairo.pc
+	install -m 0644 py3cairo.pc ${D}${libdir}/pkgconfig/
+}
-- 
2.8.1


