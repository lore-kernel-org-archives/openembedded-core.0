Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B3B8871C9F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 21:09:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 14:09:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,362,1503385200"; d="scan'208";a="1204825088"
Received: from jalamego-mobl3.zpn.intel.com ([10.219.128.138])
	by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2017 14:09:04 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 16:08:44 -0500
Message-Id: <1507756125-29469-2-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507756125-29469-1-git-send-email-jose.a.lamego@linux.intel.com>
References: <1507756125-29469-1-git-send-email-jose.a.lamego@linux.intel.com>
Subject: [PATCH 1/2] python3-pycairo: update to 1.15.3
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
X-List-Received-Date: Wed, 11 Oct 2017 21:09:04 -0000

python3-pycairo needs to be updated to latest stable release.

Changes in this update:
 SRC_URI updated to new GitHub repository.
 LICENSE updated to LGPLv2.1 & MPLv1.1.
 LICENSE_FILES_CHkSUM updated accordingly to new License.
 inherit distutils3 replaced with setuptools3.
 waf-related instructions dropped due to use of setuptools3.
 py3cairo header file copied to "includedir" where it is assumed
 to be located by some dependencies.

This change was tested in qemux86 running core-image-minimal

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 .../python/python3-pycairo_1.10.0.bb               | 42 ----------------------
 .../python/python3-pycairo_1.15.3.bb               | 30 ++++++++++++++++
 2 files changed, 30 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pycairo_1.10.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycairo_1.15.3.bb

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.10.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.10.0.bb
deleted file mode 100644
index 9258ba1..0000000
--- a/meta/recipes-devtools/python/python3-pycairo_1.10.0.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-SUMMARY = "Python bindings for the Cairo canvas library"
-HOMEPAGE = "http://cairographics.org/pycairo"
-BUGTRACKER = "http://bugs.freedesktop.org"
-SECTION = "python-devel"
-LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
-
-# cairo >= 1.8.8
-DEPENDS = "cairo"
-PR = "r2"
-
-SRC_URI = "http://cairographics.org/releases/pycairo-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "e6fd3f2f1e6a72e0db0868c4985669c5"
-SRC_URI[sha256sum] = "9aa4078e7eb5be583aeabbe8d87172797717f95e8c4338f0d4a17b683a7253be"
-
-S = "${WORKDIR}/pycairo-${PV}"
-
-inherit distutils3 pkgconfig
-
-CFLAGS += "-fPIC"
-
-BBCLASSEXTEND = "native"
-
-do_configure() {
-	PYTHON=${PYTHON} ./waf configure --prefix=${D}${prefix} --libdir=${D}${libdir}
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
-		py3cairo.pc.in > py3cairo.pc
-	install -m 0644 py3cairo.pc ${D}${libdir}/pkgconfig/
-}
diff --git a/meta/recipes-devtools/python/python3-pycairo_1.15.3.bb b/meta/recipes-devtools/python/python3-pycairo_1.15.3.bb
new file mode 100644
index 0000000..7863ad2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycairo_1.15.3.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Python bindings for the Cairo canvas library"
+HOMEPAGE = "http://cairographics.org/pycairo"
+BUGTRACKER = "http://bugs.freedesktop.org"
+SECTION = "python-devel"
+LICENSE = "LGPLv2.1 & MPLv1.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f2e071ab72978431b294a0d696327421 \
+                    file://COPYING-LGPL-2.1;md5=fad9b3332be894bab9bc501572864b29 \
+                    file://COPYING-MPL-1.1;md5=bfe1f75d606912a4111c90743d6c7325"
+
+# cairo >= 1.14
+DEPENDS = "cairo"
+
+SRC_URI = "https://github.com/pygobject/pycairo/releases/download/v${PV}/pycairo-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "7390cd413271fe5569f6eef73d72bf7a"
+SRC_URI[sha256sum] = "8642e36cef66acbfc02760d2b40c716f5f183d073fb063ba28fd29a14044719d"
+
+S = "${WORKDIR}/pycairo-${PV}"
+
+inherit setuptools3 pkgconfig
+
+CFLAGS += "-fPIC"
+
+BBCLASSEXTEND = "native"
+
+do_install_append() {
+    install -d ${D}${includedir}/pycairo/
+    install -m 0644 ${D}${datadir}/include/pycairo/py3cairo.h ${D}${includedir}/pycairo/
+}
+FILES_${PN} += "${datadir}/include/pycairo/py3cairo.h"
-- 
2.7.4


