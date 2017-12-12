Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2420E78854
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 05:04:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Dec 2017 21:04:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,394,1508828400"; d="scan'208";a="15240469"
Received: from chiron.jf.intel.com ([10.7.159.61])
	by orsmga001.jf.intel.com with ESMTP; 11 Dec 2017 21:04:32 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Dec 2017 21:04:17 -0800
Message-Id: <58e5153e2d9161a9cbe79cf3ad33d0103582eedc.1513054233.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1513054233.git.timothy.t.orling@linux.intel.com>
References: <cover.1513054233.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH v3 12/14] python-git: use pypi.bbclass
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
X-List-Received-Date: Tue, 12 Dec 2017 05:04:32 -0000

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
2.14.3


