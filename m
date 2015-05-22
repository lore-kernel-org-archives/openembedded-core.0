Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4E4FE73232
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 18:18:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 May 2015 11:18:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,477,1427785200"; d="scan'208";a="733876633"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by orsmga002.jf.intel.com with ESMTP; 22 May 2015 11:18:59 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 11:18:27 +0000
Message-Id: <1432293507-48944-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH v2] python3-pip: Adds recipe for python3-pip
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
X-List-Received-Date: Fri, 22 May 2015 18:18:58 -0000

PIP is installed by default since python 3.4, due to issues with the
autobuilders, its default installation had to be disabled, this creates
a recipe for it, it brings a lot of new dependencies so it is chosen not
to be installed by default along with python3-core.

[YOCTO #7762]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python3-pip_6.1.1.bb | 40 +++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pip_6.1.1.bb

diff --git a/meta/recipes-devtools/python/python3-pip_6.1.1.bb b/meta/recipes-devtools/python/python3-pip_6.1.1.bb
new file mode 100644
index 0000000..cc44036
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip_6.1.1.bb
@@ -0,0 +1,40 @@
+SUMMARY = "The PyPA recommended tool for installing Python packages"
+sHOMEPAGEsss = "https://pypi.python.org/pypi/pip"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=45665b53032c02b35e29ddab8e61fa91"
+
+SRCNAME = "pip"
+DEPENDS += "python3 python3-setuptools"
+
+SRC_URI = " \
+  http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+"
+SRC_URI[md5sum] = "6b19e0a934d982a5a4b798e957cb6d45"
+SRC_URI[sha256sum] = "89f3b626d225e08e7f20d85044afa40f612eb3284484169813dc2d0631f2a556"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit distutils3
+
+DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${libdir}/${PYTHON_DIR}/site-packages"
+
+do_install_prepend() {
+    install -d ${D}/${libdir}/${PYTHON_DIR}/site-packages
+}
+
+# Use setuptools site.py instead, avoid shared state issue
+do_install_append() {
+    rm ${D}/${libdir}/${PYTHON_DIR}/site-packages/site.py
+    rm ${D}/${libdir}/${PYTHON_DIR}/site-packages/__pycache__/site.cpython-34.pyc
+}
+
+RDEPENDS_${PN} = "\
+  python3-compile \
+  python3-io \
+  python3-json \
+  python3-netserver \
+  python3-setuptools \
+  python3-unixadmin \
+  python3-xmlrpc \
+"
-- 
1.8.4.5


