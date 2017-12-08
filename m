Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 062FF78744
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 22:45:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Dec 2017 14:46:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,379,1508828400"; 
   d="scan'208";a="1306963"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga008.jf.intel.com with ESMTP; 08 Dec 2017 14:46:00 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Dec 2017 14:45:23 -0800
Message-Id: <248f5fb59905959c00566983ac6b20496140ebc1.1512765771.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1512765771.git.timothy.t.orling@linux.intel.com>
References: <cover.1512765771.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH v2 11/19] python-nose: use pypi.bbclass
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
X-List-Received-Date: Fri, 08 Dec 2017 22:45:59 -0000

* Simplify python- and python3-nose by using pypi.bbclass
* Consolidate common content in python-nose.inc
  - Avoid duplication by using PYTHON_PN variable
* nosetests RDEPENDS on python-logging

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python-nose.inc       | 18 ++++++++++++++++
 meta/recipes-devtools/python/python-nose_1.3.7.bb  | 25 +++-------------------
 meta/recipes-devtools/python/python3-nose_1.3.7.bb | 24 +--------------------
 3 files changed, 22 insertions(+), 45 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-nose.inc

diff --git a/meta/recipes-devtools/python/python-nose.inc b/meta/recipes-devtools/python/python-nose.inc
new file mode 100644
index 00000000000..072be87356d
--- /dev/null
+++ b/meta/recipes-devtools/python/python-nose.inc
@@ -0,0 +1,18 @@
+SUMMARY = "Extends Python unittest to make testing easier"
+HOMEPAGE = "http://readthedocs.org/docs/nose/"
+DESCRIPTION = "nose extends the test loading and running features of unittest, \
+making it easier to write, find and run tests."
+SECTION = "devel/python"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://lgpl.txt;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+SRC_URI[md5sum] = "4d3ad0ff07b61373d2cefc89c5d0b20b"
+SRC_URI[sha256sum] = "f1bffef9cbc82628f6e7d7b40d7e255aefaa1adb6a1b1d26c69a8b79e6208a98"
+
+inherit pypi
+
+RDEPENDS_${PN}_class-target = "\
+  ${PYTHON_PN}-unittest \
+  "
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python-nose_1.3.7.bb b/meta/recipes-devtools/python/python-nose_1.3.7.bb
index 9b3509cafbb..584d604079b 100644
--- a/meta/recipes-devtools/python/python-nose_1.3.7.bb
+++ b/meta/recipes-devtools/python/python-nose_1.3.7.bb
@@ -1,25 +1,6 @@
-SUMMARY = "Extends Python unittest to make testing easier"
-HOMEPAGE = "http://readthedocs.org/docs/nose/"
-DESCRIPTION = "nose extends the test loading and running features of unittest, \
-making it easier to write, find and run tests."
-SECTION = "devel/python"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://lgpl.txt;md5=a6f89e2100d9b6cdffcea4f398e37343"
-
-SRC_URI = "https://files.pythonhosted.org/packages/source/n/nose/nose-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "4d3ad0ff07b61373d2cefc89c5d0b20b"
-SRC_URI[sha256sum] = "f1bffef9cbc82628f6e7d7b40d7e255aefaa1adb6a1b1d26c69a8b79e6208a98"
-
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/nose/"
-UPSTREAM_CHECK_REGEX = "/nose/(?P<pver>(\d+[\.\-_]*)+)"
-
-S = "${WORKDIR}/nose-${PV}"
-
+require python-nose.inc
 inherit setuptools
 
-RDEPENDS_${PN} = "\
-  python-unittest \
+RDEPENDS_${PN}_class-target += "\
+  python-logging \
   "
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-nose_1.3.7.bb b/meta/recipes-devtools/python/python3-nose_1.3.7.bb
index 1e2ff74f578..2d1ae3b8bf5 100644
--- a/meta/recipes-devtools/python/python3-nose_1.3.7.bb
+++ b/meta/recipes-devtools/python/python3-nose_1.3.7.bb
@@ -1,28 +1,6 @@
-SUMMARY = "Extends Python unittest to make testing easier"
-DESCRIPTION = "nose extends the test loading and running features of unittest, \
-making it easier to write, find and run tests."
-SECTION = "devel/python"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://lgpl.txt;md5=a6f89e2100d9b6cdffcea4f398e37343"
-
-SRC_URI = "https://files.pythonhosted.org/packages/source/n/nose/nose-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "4d3ad0ff07b61373d2cefc89c5d0b20b"
-SRC_URI[sha256sum] = "f1bffef9cbc82628f6e7d7b40d7e255aefaa1adb6a1b1d26c69a8b79e6208a98"
-
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/nose/"
-UPSTREAM_CHECK_REGEX = "/nose/(?P<pver>(\d+[\.\-_]*)+)"
-
-S = "${WORKDIR}/nose-${PV}"
-
+require python-nose.inc
 inherit setuptools3
 
 do_install_append() {
     mv ${D}${bindir}/nosetests ${D}${bindir}/nosetests3
 }
-
-RDEPENDS_${PN}_class-target = "\
-  python3-unittest \
-  "
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.13.6


