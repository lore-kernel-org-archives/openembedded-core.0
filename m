Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EF71E78766
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 22:45:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Dec 2017 14:45:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,379,1508828400"; 
   d="scan'208";a="1306959"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga008.jf.intel.com with ESMTP; 08 Dec 2017 14:45:58 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Dec 2017 14:45:21 -0800
Message-Id: <8fce55b8a30b760a26d7fda712db02ef2b9c5a81.1512765771.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1512765771.git.timothy.t.orling@linux.intel.com>
References: <cover.1512765771.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH v2 09/19] python*-setuptools: upgrade to 38.2.3; use pypi.bbclass; improvements
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
X-List-Received-Date: Fri, 08 Dec 2017 22:45:57 -0000

* Simplify python- and python3-setuptools with pypi.bbclass
* inherit setuptools rather than distutils
* Consolidate common settings in python-setuptools.inc
  - use PYTHON_PN variable to eliminate duplication
  - python3-setuptools had RDEPENDS on _markupbase
    - prior commit it added to -core rather than -misc catchall
  - installer no longer creates setuptools.pth, drop fixes
  - easy_install script is installed in /usr/bin/, add --script-dir

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python-setuptools.inc | 39 ++++++++++++++++++----
 .../python/python-setuptools_36.5.0.bb             | 38 ---------------------
 .../python/python-setuptools_38.2.3.bb             |  9 +++++
 .../python/python3-setuptools_36.5.0.bb            | 35 -------------------
 .../python/python3-setuptools_38.2.3.bb            |  6 ++++
 5 files changed, 48 insertions(+), 79 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-setuptools_36.5.0.bb
 create mode 100644 meta/recipes-devtools/python/python-setuptools_38.2.3.bb
 delete mode 100644 meta/recipes-devtools/python/python3-setuptools_36.5.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-setuptools_38.2.3.bb

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 1eae0b6174d..dcabd4c9288 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -5,17 +5,44 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=1;endline=19;md5=9a33897f1bca1160d7aad3835152e158"
 
-SRCNAME = "setuptools"
+PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.zip"
+SRC_URI[md5sum] = "0ae64455d276ff864b40aca9c06ea7c1"
+SRC_URI[sha256sum] = "63c394084de7d11bbbec59a4f9a9a6bab10209657c615e76ef62ae25cea39288"
 
-SRC_URI[md5sum] = "704f500dd55f4bd0be905444f3ba892c"
-SRC_URI[sha256sum] = "ce2007c1cea3359870b80657d634253a0765b0c7dc5a988d77ba803fc86f2c64"
+inherit pypi
 
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
+DEPENDS += "${PYTHON_PN}"
+DEPENDS_class-native += "${PYTHON_PN}-native"
+DEPENDS_class-nativesdk += "nativesdk-${PYTHON_PN}"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR} \
+                           --script-dir=${bindir}"
+
+RDEPENDS_${PN}_class-native = "\
+  ${PYTHON_PN}-distutils \
+  ${PYTHON_PN}-compression \
+"
+RDEPENDS_${PN} = "\
+  ${PYTHON_PN}-compile \
+  ${PYTHON_PN}-compression \
+  ${PYTHON_PN}-ctypes \
+  ${PYTHON_PN}-distutils \
+  ${PYTHON_PN}-email \
+  ${PYTHON_PN}-html \
+  ${PYTHON_PN}-netserver \
+  ${PYTHON_PN}-numbers \
+  ${PYTHON_PN}-pkgutil \
+  ${PYTHON_PN}-plistlib \
+  ${PYTHON_PN}-shell \
+  ${PYTHON_PN}-stringold \
+  ${PYTHON_PN}-threading \
+  ${PYTHON_PN}-unittest \
+  ${PYTHON_PN}-xml \
+"
 
 do_install_prepend() {
     install -d ${D}${PYTHON_SITEPACKAGES_DIR}
 }
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python-setuptools_36.5.0.bb b/meta/recipes-devtools/python/python-setuptools_36.5.0.bb
deleted file mode 100644
index 526474c7ea5..00000000000
--- a/meta/recipes-devtools/python/python-setuptools_36.5.0.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-require python-setuptools.inc
-
-PROVIDES = "python-distribute"
-
-DEPENDS += "python"
-DEPENDS_class-native += "python-native"
-
-inherit distutils
-
-DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR}"
-
-RDEPENDS_${PN} = "\
-  python-stringold \
-  python-email \
-  python-shell \
-  python-distutils \
-  python-compression \
-  python-pkgutil \
-  python-plistlib \
-  python-numbers \
-  python-html \
-  python-netserver \
-  python-ctypes \
-  python-subprocess \
-  python-unittest \
-  python-compile \
-"
-
-RDEPENDS_${PN}_class-native = "\
-  python-distutils \
-  python-compression \
-"
-
-RREPLACES_${PN} = "python-distribute"
-RPROVIDES_${PN} = "python-distribute"
-RCONFLICTS_${PN} = "python-distribute"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python-setuptools_38.2.3.bb b/meta/recipes-devtools/python/python-setuptools_38.2.3.bb
new file mode 100644
index 00000000000..cf9440495bd
--- /dev/null
+++ b/meta/recipes-devtools/python/python-setuptools_38.2.3.bb
@@ -0,0 +1,9 @@
+require python-setuptools.inc
+
+PROVIDES = "python-distribute"
+
+inherit setuptools
+
+RREPLACES_${PN} = "python-distribute"
+RPROVIDES_${PN} = "python-distribute"
+RCONFLICTS_${PN} = "python-distribute"
diff --git a/meta/recipes-devtools/python/python3-setuptools_36.5.0.bb b/meta/recipes-devtools/python/python3-setuptools_36.5.0.bb
deleted file mode 100644
index dab8ad89b01..00000000000
--- a/meta/recipes-devtools/python/python3-setuptools_36.5.0.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-require python-setuptools.inc
-
-DEPENDS += "python3"
-DEPENDS_class-native += "python3-native"
-DEPENDS_class-nativesdk += "nativesdk-python3"
-
-inherit distutils3
-
-DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR}"
-
-# The installer puts the wrong path in the setuptools.pth file.  Correct it.
-do_install_append() {
-    rm ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
-    mv ${D}${bindir}/easy_install ${D}${bindir}/easy3_install
-    echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
-}
-
-RDEPENDS_${PN}_class-native = "\
-  python3-distutils \
-  python3-compression \
-"
-RDEPENDS_${PN} = "\
-  python3-ctypes \
-  python3-distutils \
-  python3-email \
-  python3-numbers \
-  python3-compression \
-  python3-shell \
-  python3-pkgutil \
-  python3-threading \
-  python3-misc \
-  python3-unittest \
-  python3-xml \
-"
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-setuptools_38.2.3.bb b/meta/recipes-devtools/python/python3-setuptools_38.2.3.bb
new file mode 100644
index 00000000000..0dc1ed86227
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools_38.2.3.bb
@@ -0,0 +1,6 @@
+require python-setuptools.inc
+inherit setuptools3
+
+do_install_append() {
+    mv ${D}${bindir}/easy_install ${D}${bindir}/easy3_install
+}
-- 
2.13.6


