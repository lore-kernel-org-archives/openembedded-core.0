Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B441260588
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 16:45:43 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jan 2016 08:45:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,326,1449561600"; d="scan'208";a="33686160"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by fmsmga004.fm.intel.com with ESMTP; 21 Jan 2016 08:45:17 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jan 2016 16:46:06 +0000
Message-Id: <9933e8b1687c8629ffe6cf7f48a157788934c594.1453394707.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1453394707.git.alejandro.hernandez@linux.intel.com>
References: <cover.1453394707.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] python-setuptools: Unify and upgrade python-setuptools and python3-setuptools to 19.4
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
X-List-Received-Date: Thu, 21 Jan 2016 16:45:44 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python-setuptools.inc | 21 ++++++++++++++++++++
 ...etuptools_19.2.bb => python-setuptools_19.4.bb} | 20 +------------------
 ...tuptools_19.2.bb => python3-setuptools_19.4.bb} | 23 ++--------------------
 3 files changed, 24 insertions(+), 40 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-setuptools.inc
 rename meta/recipes-devtools/python/{python-setuptools_19.2.bb => python-setuptools_19.4.bb} (49%)
 rename meta/recipes-devtools/python/{python3-setuptools_19.2.bb => python3-setuptools_19.4.bb} (51%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
new file mode 100644
index 0000000..0917e88
--- /dev/null
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -0,0 +1,21 @@
+SUMMARY = "Download, build, install, upgrade, and uninstall Python packages"
+HOMEPAGE = "https://pypi.python.org/pypi/setuptools"
+SECTION = "devel/python"
+LICENSE = "PSF | ZPL-2.0"
+
+LIC_FILES_CHKSUM = "file://setup.py;beginline=78;endline=78;md5=8a314270dd7a8dbca741775415f1716e"
+
+SRCNAME = "setuptools"
+
+SRC_URI = "http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "c5a7d90c1e0acf8c4ec5c2bf31bc25b5"
+SRC_URI[sha256sum] = "214bf29933f47cf25e6faa569f710731728a07a19cae91ea64f826051f68a8cf"
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+do_install_prepend() {
+    install -d ${D}/${libdir}/${PYTHON_DIR}/site-packages
+}
diff --git a/meta/recipes-devtools/python/python-setuptools_19.2.bb b/meta/recipes-devtools/python/python-setuptools_19.4.bb
similarity index 49%
rename from meta/recipes-devtools/python/python-setuptools_19.2.bb
rename to meta/recipes-devtools/python/python-setuptools_19.4.bb
index 404d301..86bbebf 100644
--- a/meta/recipes-devtools/python/python-setuptools_19.2.bb
+++ b/meta/recipes-devtools/python/python-setuptools_19.4.bb
@@ -1,10 +1,4 @@
-SUMMARY = "Downloads, builds, installs, upgrades, and uninstalls Python packages"
-HOMEPAGE = "https://pypi.python.org/pypi/setuptools"
-SECTION = "devel/python"
-LICENSE = "Python-2.0 | ZPL-2.0"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=78;endline=78;md5=8a314270dd7a8dbca741775415f1716e"
-
-SRCNAME = "setuptools"
+require python-setuptools.inc
 
 PROVIDES = "python-distribute"
 
@@ -13,20 +7,8 @@ DEPENDS_class-native += "python-native"
 
 inherit distutils
 
-SRC_URI = "https://pypi.python.org/packages/source/s/setuptools/setuptools-${PV}.tar.gz"
-SRC_URI[md5sum] = "78353b1f80375ca5e088f4b4627ffe03"
-SRC_URI[sha256sum] = "f90ed8eb70b14b0594ba74e9de4ffca040c0ec8ee505cbf3570499467859f71a"
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-
 DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${libdir}/${PYTHON_DIR}/site-packages"
 
-do_install_prepend() {
-    install -d ${D}/${libdir}/${PYTHON_DIR}/site-packages
-}
-
 RDEPENDS_${PN} = "\
   python-stringold \
   python-email \
diff --git a/meta/recipes-devtools/python/python3-setuptools_19.2.bb b/meta/recipes-devtools/python/python3-setuptools_19.4.bb
similarity index 51%
rename from meta/recipes-devtools/python/python3-setuptools_19.2.bb
rename to meta/recipes-devtools/python/python3-setuptools_19.4.bb
index bb57982..fb2931c 100644
--- a/meta/recipes-devtools/python/python3-setuptools_19.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_19.4.bb
@@ -1,32 +1,13 @@
-SUMMARY = "Download, build, install, upgrade, and uninstall Python packages"
-HOMEPAGE = "http://packages.python.org/setuptools"
-SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=78;endline=78;md5=8a314270dd7a8dbca741775415f1716e"
+require python-setuptools.inc
 
-SRCNAME = "setuptools"
 DEPENDS += "python3"
 DEPENDS_class-native += "python3-native"
 
-SRC_URI = " \
-  http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-"
-SRC_URI[md5sum] = "78353b1f80375ca5e088f4b4627ffe03"
-SRC_URI[sha256sum] = "f90ed8eb70b14b0594ba74e9de4ffca040c0ec8ee505cbf3570499467859f71a"
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
 inherit distutils3
 
 DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${libdir}/${PYTHON_DIR}/site-packages"
 
-do_install_prepend() {
-    install -d ${D}/${libdir}/${PYTHON_DIR}/site-packages
-}
-#
-#  The installer puts the wrong path in the setuptools.pth file.  Correct it.
-#
+# The installer puts the wrong path in the setuptools.pth file.  Correct it.
 do_install_append() {
     rm ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
     mv ${D}${bindir}/easy_install ${D}${bindir}/easy3_install
-- 
1.8.4.5


