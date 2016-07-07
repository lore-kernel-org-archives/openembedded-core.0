Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EE54E6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 15:39:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 07 Jul 2016 08:39:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,324,1464678000"; d="scan'208";a="990819830"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 07 Jul 2016 08:39:38 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2016 18:39:30 +0300
Message-Id: <b0ba31b71ad1e9d540ab007713fe034a3bc1f7d1.1467905611.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1467905611.git.jussi.kukkonen@intel.com>
References: <cover.1467905611.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/5] python-six: Add to oe-core
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
X-List-Received-Date: Thu, 07 Jul 2016 15:39:39 -0000

Recipes are moved from meta-openembedded/meta-python

Changes compared to meta-python version:
* Modified to not inherit pypi
* Fix python-io dependency for python3
* Support native, nativesdk

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-devtools/python/python-six.inc        | 23 ++++++++++++++++++++++
 meta/recipes-devtools/python/python-six_1.10.0.bb  |  4 ++++
 meta/recipes-devtools/python/python3-six_1.10.0.bb |  4 ++++
 3 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-six.inc
 create mode 100644 meta/recipes-devtools/python/python-six_1.10.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-six_1.10.0.bb

diff --git a/meta/recipes-devtools/python/python-six.inc b/meta/recipes-devtools/python/python-six.inc
new file mode 100644
index 0000000..6e1bd53
--- /dev/null
+++ b/meta/recipes-devtools/python/python-six.inc
@@ -0,0 +1,23 @@
+SUMMARY = "Python 2 and 3 compatibility library"
+HOMEPAGE = "https://pypi.python.org/pypi/six/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6f00d4a50713fa859858dd9abaa35b21"
+
+SRC_URI = "https://files.pythonhosted.org/packages/source/s/six/six-${PV}.tar.gz"
+SRC_URI[md5sum] = "34eed507548117b2ab523ab14b2f8b55"
+SRC_URI[sha256sum] = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/six/"
+UPSTREAM_CHECK_REGEX = "/six/(?P<pver>(\d+[\.\-_]*)+)"
+
+BBCLASSEXTEND = "native nativesdk"
+
+S = "${WORKDIR}/six-${PV}"
+
+do_compile_append() {
+    ${PYTHON} setup.py -q bdist_egg --dist-dir ./
+}
+do_install_append() {
+    install -m 0644 ${S}/*.egg ${D}/${PYTHON_SITEPACKAGES_DIR}/
+}
diff --git a/meta/recipes-devtools/python/python-six_1.10.0.bb b/meta/recipes-devtools/python/python-six_1.10.0.bb
new file mode 100644
index 0000000..4350485
--- /dev/null
+++ b/meta/recipes-devtools/python/python-six_1.10.0.bb
@@ -0,0 +1,4 @@
+inherit setuptools
+require python-six.inc
+
+RDEPENDS_${PN} += "python-io"
diff --git a/meta/recipes-devtools/python/python3-six_1.10.0.bb b/meta/recipes-devtools/python/python3-six_1.10.0.bb
new file mode 100644
index 0000000..38a47b7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-six_1.10.0.bb
@@ -0,0 +1,4 @@
+inherit setuptools3
+require python-six.inc
+
+RDEPENDS_${PN} += "python3-io"
-- 
2.1.4


