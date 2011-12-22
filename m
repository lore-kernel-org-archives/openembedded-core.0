Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rddbu-0005N8-Rx
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:02:43 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2011 23:55:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89233727"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.90])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2011 23:55:34 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 23:55:08 -0800
Message-Id: <7197efde264bee4d8deb37b9fd08cc9cc83d1ac4.1324540322.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/26] python-pycairo: Upgrade to 1.10.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Dec 2011 08:02:43 -0000

tweak the pycairo.pc correctly.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../python/python-pycairo_1.10.0.bb                |   39 ++++++++++++++++++++
 .../python/python-pycairo_1.8.10.bb                |   31 ----------------
 2 files changed, 39 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-pycairo_1.10.0.bb
 delete mode 100644 meta/recipes-devtools/python/python-pycairo_1.8.10.bb

diff --git a/meta/recipes-devtools/python/python-pycairo_1.10.0.bb b/meta/recipes-devtools/python/python-pycairo_1.10.0.bb
new file mode 100644
index 0000000..812acfb
--- /dev/null
+++ b/meta/recipes-devtools/python/python-pycairo_1.10.0.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "Python Bindings for the Cairo canvas library"
+HOMEPAGE = "http://cairographics.org/pycairo"
+BUGTRACKER = "http://bugs.freedesktop.org"
+SECTION = "python-devel"
+LICENSE = "LGPLv1.1 & MPL-1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f2e071ab72978431b294a0d696327421 \
+                    file://COPYING-LGPL-2.1;md5=fad9b3332be894bab9bc501572864b29 \
+                    file://COPYING-MPL-1.1;md5=bfe1f75d606912a4111c90743d6c7325"
+
+# cairo >= 1.8.8
+DEPENDS = "cairo"
+PR = "r0"
+
+SRC_URI = "http://cairographics.org/releases/py2cairo-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "20337132c4ab06c1146ad384d55372c5"
+SRC_URI[sha256sum] = "d30439f06c2ec1a39e27464c6c828b6eface3b22ee17b2de05dc409e429a7431"
+
+S = "${WORKDIR}/py2cairo-${PV}"
+
+inherit distutils pkgconfig
+
+do_configure() {
+	BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} ./waf configure --prefix=${D}${prefix}
+}
+
+do_compile() {
+	./waf build
+}
+
+do_install() {
+	./waf install
+	sed \
+		-e 's:@prefix@:${prefix}:' \
+		-e 's:@VERSION@:${PV}:' \
+		-e 's:@includedir@:${includedir}:' \
+		pycairo.pc.in > pycairo.pc
+	install -m 0644 pycairo.pc ${D}${libdir}/pkgconfig/
+}
diff --git a/meta/recipes-devtools/python/python-pycairo_1.8.10.bb b/meta/recipes-devtools/python/python-pycairo_1.8.10.bb
deleted file mode 100644
index 02ec353..0000000
--- a/meta/recipes-devtools/python/python-pycairo_1.8.10.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION = "Python Bindings for the Cairo canvas library"
-HOMEPAGE = "http://cairographics.org/pycairo"
-BUGTRACKER = "http://bugs.freedesktop.org"
-SECTION = "python-devel"
-LICENSE = "LGPLv2.1 & MPL-1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f2e071ab72978431b294a0d696327421"
-# cairo >= 1.8.8
-DEPENDS = "cairo"
-PR = "r2"
-
-SRC_URI = "http://cairographics.org/releases/py2cairo-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "87421a6a70304120555ba7ba238f3dc3"
-SRC_URI[sha256sum] = "b15f71019e42e06d86f7e8fe5587f07c3de5a59a6c3a071b25fe100796dbcd56"
-S = "${WORKDIR}/pycairo-${PV}"
-
-inherit distutils pkgconfig
-
-do_compile_prepend() {
-#fix the installation path of __init__.py
-#It was going in the sysroot instead of target install location
-	sed -i -e "s#dsy.get_python_lib()#'${D}${PYTHON_SITEPACKAGES_DIR}'#" ${S}/setup.py
-}
-
-do_install_append () {
-	install -d ${D}${includedir}
-	install -d ${D}${libdir}
-	mv ${D}${datadir}/include/* ${D}${includedir}
-	mv ${D}${datadir}/lib/* ${D}${libdir}
-	sed -i -e 's#prefix=.*#prefix=${prefix}#' ${D}${libdir}/pkgconfig/pycairo.pc
-}
-- 
1.7.6.4



