Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 04D50787B0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 18:14:52 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Nov 2017 10:14:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,441,1505804400"; d="scan'208";a="179341188"
Received: from wrath.jf.intel.com ([10.54.70.15])
	by fmsmga005.fm.intel.com with ESMTP; 23 Nov 2017 10:14:54 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Nov 2017 10:14:26 -0800
Message-Id: <9017d894e18bcc8f0532fe66d10c9958e01b1c9b.1511458497.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1511458497.git.timothy.t.orling@linux.intel.com>
References: <cover.1511458497.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH 05/13] python-nose: use pypi.bbclass
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
X-List-Received-Date: Thu, 23 Nov 2017 18:14:53 -0000

* Simplify python- and python3-nose by using pypi.bbclass
* Consolidate common content in python-nose.inc
  - Avoid duplication by using PYTHON_PN variable

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python-nose.inc       | 18 ++++++++++++++++
 meta/recipes-devtools/python/python-nose_1.3.7.bb  | 25 +---------------------
 meta/recipes-devtools/python/python3-nose_1.3.7.bb | 24 +--------------------
 3 files changed, 20 insertions(+), 47 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-nose.inc

diff --git a/meta/recipes-devtools/python/python-nose.inc b/meta/recipes-devtools/python/python-nose.inc
new file mode 100644
index 0000000000..ccec68a0e1
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
+RDEPENDS_${PN} = "\
+  ${PYTHON_PN}-unittest \
+  "
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python-nose_1.3.7.bb b/meta/recipes-devtools/python/python-nose_1.3.7.bb
index 9b3509cafb..6d69d2d62e 100644
--- a/meta/recipes-devtools/python/python-nose_1.3.7.bb
+++ b/meta/recipes-devtools/python/python-nose_1.3.7.bb
@@ -1,25 +1,2 @@
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
 inherit setuptools
-
-RDEPENDS_${PN} = "\
-  python-unittest \
-  "
-
-BBCLASSEXTEND = "native nativesdk"
+require python-nose.inc
diff --git a/meta/recipes-devtools/python/python3-nose_1.3.7.bb b/meta/recipes-devtools/python/python3-nose_1.3.7.bb
index 1e2ff74f57..8bc1f49835 100644
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
 inherit setuptools3
+require python-nose.inc
 
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


