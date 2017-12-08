Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C87AA78803
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 22:46:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Dec 2017 14:46:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,379,1508828400"; 
   d="scan'208";a="1307005"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga008.jf.intel.com with ESMTP; 08 Dec 2017 14:46:07 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Dec 2017 14:45:29 -0800
Message-Id: <c73d214ad1a4dffe206d9c45c50a94070c783c8e.1512765771.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1512765771.git.timothy.t.orling@linux.intel.com>
References: <cover.1512765771.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH v2 17/19] python-git: use pypi.bbclass
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
X-List-Received-Date: Fri, 08 Dec 2017 22:46:06 -0000

* Simplify python3-git recipe using pypi.bbclass
* Avoid duplication by using PYTHON_PN in .inc
* Sort RDEPENDS alphabetically

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python-git.inc       | 23 ++++++++++++++++++-----
 meta/recipes-devtools/python/python3-git_2.1.7.bb |  4 ----
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/python/python-git.inc b/meta/recipes-devtools/python/python-git.inc
index 0b7e44ac0c4..696f8081de9 100644
--- a/meta/recipes-devtools/python/python-git.inc
+++ b/meta/recipes-devtools/python/python-git.inc
@@ -8,14 +8,27 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
 
-SRC_URI = "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "a63fdd2a650694ea23e268fd0c952034"
 SRC_URI[sha256sum] = "13c7cd99c2bf277fc99accfc25148752fa90e7cc6c6d08a3f01d229dacb461d9"
 
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/GitPython/"
-UPSTREAM_CHECK_REGEX = "/GitPython/(?P<pver>(\d+[\.\-_]*)+)"
+PYPI_PACKAGE = "GitPython"
+
+inherit pypi
+
+DEPENDS = "${PYTHON_PN}-gitdb"
 
-S = "${WORKDIR}/GitPython-${PV}"
 
+RDEPENDS_${PN} += " \
+  ${PYTHON_PN}-datetime \
+  ${PYTHON_PN}-gitdb \
+  ${PYTHON_PN}-io \
+  ${PYTHON_PN}-logging \
+  ${PYTHON_PN}-math \
+  ${PYTHON_PN}-netclient \
+  ${PYTHON_PN}-shell \
+  ${PYTHON_PN}-stringold \
+  ${PYTHON_PN}-unittest \
+  ${PYTHON_PN}-unixadmin \
+  git \
+  "
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python3-git_2.1.7.bb b/meta/recipes-devtools/python/python3-git_2.1.7.bb
index ca42688f97e..1d69de5c782 100644
--- a/meta/recipes-devtools/python/python3-git_2.1.7.bb
+++ b/meta/recipes-devtools/python/python3-git_2.1.7.bb
@@ -1,7 +1,3 @@
 require python-git.inc
 
-DEPENDS = "python3-gitdb"
-
 inherit setuptools3
-
-RDEPENDS_${PN} += "python3-gitdb python3-io python3-shell python3-math python3-stringold python3-unixadmin python3-logging python3-datetime python3-netclient python3-unittest git"
-- 
2.13.6


