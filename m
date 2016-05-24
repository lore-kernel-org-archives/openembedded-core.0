Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C1C63731DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:54:23 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 24 May 2016 04:54:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498242"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:54:25 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:54:34 +0300
Message-Id: <8685e71fc30d2023380c52ef0a8176112a48f05a.1464088997.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 45/45] python3-numpy: add a recipe
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
X-List-Received-Date: Tue, 24 May 2016 11:54:24 -0000

This is needed for updating piglit to use Python 3.
Python 2 based recipe can be later moved to meta-oe.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../python-numpy/python3-numpy_1.10.4.bb           | 101 +++++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 meta/recipes-devtools/python-numpy/python3-numpy_1.10.4.bb

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.10.4.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.10.4.bb
new file mode 100644
index 0000000..dcd23ac
--- /dev/null
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.10.4.bb
@@ -0,0 +1,101 @@
+SUMMARY = "A sophisticated Numeric Processing Package for Python"
+SECTION = "devel/python"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9f4e88b5748e8313caaf33d081ce65a3"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
+           file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
+           file://remove-build-path-in-comments.patch \
+           file://add-glibc-check.patch \
+           ${CONFIGFILESURI} "
+
+CONFIGFILESURI ?= ""
+
+CONFIGFILESURI_aarch64 = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_arm = " \
+    file://config.h \
+    file://numpyconfig.h \
+"
+CONFIGFILESURI_armeb = " \
+    file://config.h \
+    file://numpyconfig.h \
+"
+CONFIGFILESURI_mipsel = " \
+    file://config.h \
+    file://numpyconfig.h \
+"
+CONFIGFILESURI_x86 = " \
+    file://config.h \
+    file://numpyconfig.h \
+"
+CONFIGFILESURI_x86-64 = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_mips = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_powerpc = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_powerpc64 = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_mips64 = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_mips64n32 = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+
+S = "${WORKDIR}/numpy-${PV}"
+
+inherit distutils3
+
+# Make the build fail and replace *config.h with proper one
+# This is a ugly, ugly hack - Koen
+do_compile_prepend_class-target() {
+    ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py build ${DISTUTILS_BUILD_ARGS} || \
+    true
+    cp ${WORKDIR}/*config.h ${S}/build/$(ls ${S}/build | grep src)/numpy/core/include/numpy/
+}
+
+FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a"
+
+SRC_URI[md5sum] = "90bb9034652cefbada19cf7d141a6a61"
+SRC_URI[sha256sum] = "f7f91842056a7cf680b0eaf8cefc5e46c69e2521e651128d2e6aaaccec8652ae"
+
+# install what is needed for numpy.test()
+RDEPENDS_${PN} = "python3-unittest \
+                  python3-difflib \
+                  python3-pprint \
+                  python3-pickle \
+                  python3-shell \
+                  python3-nose \
+                  python3-doctest \
+                  python3-datetime \
+                  python3-distutils \
+                  python3-misc \
+                  python3-mmap \
+                  python3-netclient \
+                  python3-numbers \
+                  python3-pydoc \
+                  python3-pkgutil \
+                  python3-email \
+                  python3-subprocess \
+                  python3-compression \
+                  python3-ctypes \
+                  python3-threading \
+"
+
+RDEPENDS_${PN}_class-native = ""
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.8.1


