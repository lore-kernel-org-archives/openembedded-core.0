Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DD97D78873
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 05:04:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Dec 2017 21:04:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,394,1508828400"; d="scan'208";a="15240462"
Received: from chiron.jf.intel.com ([10.7.159.61])
	by orsmga001.jf.intel.com with ESMTP; 11 Dec 2017 21:04:32 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Dec 2017 21:04:10 -0800
Message-Id: <d3d895d7d894fad7c82b9ed930cf769634849e48.1513054233.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1513054233.git.timothy.t.orling@linux.intel.com>
References: <cover.1513054233.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH v3 05/14] python3-pip: use pypi.bbclass
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
X-List-Received-Date: Tue, 12 Dec 2017 05:04:33 -0000

* Simplify recipe by using pypi.bbclass

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python3-pip_9.0.1.bb | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pip_9.0.1.bb b/meta/recipes-devtools/python/python3-pip_9.0.1.bb
index 9b907a2631..4ce13da410 100644
--- a/meta/recipes-devtools/python/python3-pip_9.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_9.0.1.bb
@@ -1,22 +1,15 @@
 SUMMARY = "The PyPA recommended tool for installing Python packages"
-sHOMEPAGEsss = "https://pypi.python.org/pypi/pip"
+HOMEPAGE = "https://pypi.python.org/pypi/pip"
 SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=25fba45109565f87de20bae85bc39452"
 
-SRCNAME = "pip"
 DEPENDS += "python3 python3-setuptools-native"
 
-SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "35f01da33009719497f01a4ba69d63c9"
 SRC_URI[sha256sum] = "09f243e1a7b461f654c26a725fa373211bb7ff17a9300058b205c61658ca940d"
 
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pip"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit distutils3
+inherit pypi distutils3
 
 DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR}"
 
@@ -33,7 +26,7 @@ do_install_append() {
     rm ${D}/${bindir}/pip
 
     # Installed eggs need to be passed directly to the interpreter via a pth file
-    echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}-${PV}.pth
+    echo "./${PYPI_PACKAGE}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON_SITEPACKAGES_DIR}/${PYPI_PACKAGE}-${PV}.pth
 
     # Make sure we use /usr/bin/env python3
     for PYTHSCRIPT in `grep -rIl ${bindir} ${D}${bindir}/pip3*`; do
-- 
2.14.3


