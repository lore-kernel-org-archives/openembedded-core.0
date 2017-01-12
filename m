Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D4E8771975
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 19:44:33 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Jan 2017 11:44:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,219,1477983600"; d="scan'208";a="29654835"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.47])
	by orsmga002.jf.intel.com with ESMTP; 12 Jan 2017 11:44:33 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2017 13:46:04 -0600
Message-Id: <1484250364-30461-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] python3-setuptools: upgrade to 31.1.1
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
X-List-Received-Date: Thu, 12 Jan 2017 19:44:35 -0000

It is a simultaneous upgrade for python 2 and 3 over setuptools.

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
---
 meta/recipes-devtools/python/python-setuptools.inc |  4 +--
 .../python/python-setuptools_32.1.1.bb             | 38 ++++++++++++++++++++++
 .../python/python3-setuptools_32.1.1.bb            | 37 +++++++++++++++++++++
 3 files changed, 77 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-setuptools_32.1.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-setuptools_32.1.1.bb

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 858595c..40f47d4 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -9,8 +9,8 @@ SRCNAME = "setuptools"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "66da89eeb1f33c2b947f316cfb3d7c7e"
-SRC_URI[sha256sum] = "0818cc0de692c3a5c83ca83aa7ec7ba6bc206f278735f1e0267b8d0e095cfe7a"
+SRC_URI[md5sum] = "8b67868c3430e978833ebd0d1b766694"
+SRC_URI[sha256sum] = "8303fb24306385f09bf8b0e5a385c1548e42e8efc08558d64049bc0d55ea012d"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_32.1.1.bb b/meta/recipes-devtools/python/python-setuptools_32.1.1.bb
new file mode 100644
index 0000000..526474c
--- /dev/null
+++ b/meta/recipes-devtools/python/python-setuptools_32.1.1.bb
@@ -0,0 +1,38 @@
+require python-setuptools.inc
+
+PROVIDES = "python-distribute"
+
+DEPENDS += "python"
+DEPENDS_class-native += "python-native"
+
+inherit distutils
+
+DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR}"
+
+RDEPENDS_${PN} = "\
+  python-stringold \
+  python-email \
+  python-shell \
+  python-distutils \
+  python-compression \
+  python-pkgutil \
+  python-plistlib \
+  python-numbers \
+  python-html \
+  python-netserver \
+  python-ctypes \
+  python-subprocess \
+  python-unittest \
+  python-compile \
+"
+
+RDEPENDS_${PN}_class-native = "\
+  python-distutils \
+  python-compression \
+"
+
+RREPLACES_${PN} = "python-distribute"
+RPROVIDES_${PN} = "python-distribute"
+RCONFLICTS_${PN} = "python-distribute"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-setuptools_32.1.1.bb b/meta/recipes-devtools/python/python3-setuptools_32.1.1.bb
new file mode 100644
index 0000000..65af6f0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools_32.1.1.bb
@@ -0,0 +1,37 @@
+require python-setuptools.inc
+
+DEPENDS += "python3"
+DEPENDS_class-native += "python3-native"
+
+inherit distutils3
+
+DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR}"
+
+# The installer puts the wrong path in the setuptools.pth file.  Correct it.
+do_install_append() {
+    rm ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
+    mv ${D}${bindir}/easy_install ${D}${bindir}/easy3_install
+    echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
+}
+
+RDEPENDS_${PN} = "\
+  python3-distutils \
+  python3-compression \
+"
+RDEPENDS_${PN}_class-target = "\
+  python3-ctypes \
+  python3-distutils \
+  python3-email \
+  python3-importlib \
+  python3-numbers \
+  python3-compression \
+  python3-shell \
+  python3-subprocess \
+  python3-textutils \
+  python3-pkgutil \
+  python3-threading \
+  python3-misc \
+  python3-unittest \
+  python3-xml \
+"
+BBCLASSEXTEND = "native"
-- 
2.1.4


