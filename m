Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 57648787E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 18:14:53 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Nov 2017 10:14:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,441,1505804400"; d="scan'208";a="179341199"
Received: from wrath.jf.intel.com ([10.54.70.15])
	by fmsmga005.fm.intel.com with ESMTP; 23 Nov 2017 10:14:55 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Nov 2017 10:14:32 -0800
Message-Id: <90471154b7c16fb320649d24276223cfc46668af.1511458497.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1511458497.git.timothy.t.orling@linux.intel.com>
References: <cover.1511458497.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH 11/13] python-git: use pypi.bbclass
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
X-List-Received-Date: Thu, 23 Nov 2017 18:14:54 -0000

* Simplify python3-git by using pypi.bbclass
* Consolidate common content in .inc

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python-git.inc       | 26 ++++++++++++++++++-----
 meta/recipes-devtools/python/python3-git_2.1.7.bb |  5 -----
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/python/python-git.inc b/meta/recipes-devtools/python/python-git.inc
index 0b7e44ac0c..7b0707e008 100644
--- a/meta/recipes-devtools/python/python-git.inc
+++ b/meta/recipes-devtools/python/python-git.inc
@@ -8,14 +8,30 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
 
-SRC_URI = "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-${PV}.tar.gz"
+PYPI_PACKAGE = "GitPython"
+
+inherit pypi
 
 SRC_URI[md5sum] = "a63fdd2a650694ea23e268fd0c952034"
 SRC_URI[sha256sum] = "13c7cd99c2bf277fc99accfc25148752fa90e7cc6c6d08a3f01d229dacb461d9"
 
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/GitPython/"
-UPSTREAM_CHECK_REGEX = "/GitPython/(?P<pver>(\d+[\.\-_]*)+)"
-
-S = "${WORKDIR}/GitPython-${PV}"
+DEPENDS = "${PYTHON_PN}-gitdb"
 
+RDEPENDS_${PN} += "${PYTHON_PN}-argparse \
+                   ${PYTHON_PN}-datetime \
+                   ${PYTHON_PN}-enum \
+                   ${PYTHON_PN}-gitdb \
+                   ${PYTHON_PN}-io \
+                   ${PYTHON_PN}-lang \
+                   ${PYTHON_PN}-logging \
+                   ${PYTHON_PN}-math \
+                   ${PYTHON_PN}-netclient \
+                   ${PYTHON_PN}-re \
+                   ${PYTHON_PN}-shell \
+                   ${PYTHON_PN}-stringold \
+                   ${PYTHON_PN}-subprocess \
+                   ${PYTHON_PN}-unittest \
+                   ${PYTHON_PN}-unixadmin \
+                   git \
+"
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python3-git_2.1.7.bb b/meta/recipes-devtools/python/python3-git_2.1.7.bb
index 4ac2a0ec79..ac320fa56b 100644
--- a/meta/recipes-devtools/python/python3-git_2.1.7.bb
+++ b/meta/recipes-devtools/python/python3-git_2.1.7.bb
@@ -1,7 +1,2 @@
 require python-git.inc
-
-DEPENDS = "python3-gitdb"
-
 inherit setuptools3
-
-RDEPENDS_${PN} += "python3-gitdb python3-lang python3-io python3-shell python3-math python3-re python3-subprocess python3-stringold python3-unixadmin python3-enum python3-logging python3-datetime python3-netclient python3-unittest python3-argparse git"
-- 
2.13.6


