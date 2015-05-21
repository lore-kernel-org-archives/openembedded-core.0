Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E554673231
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 16:16:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 21 May 2015 09:16:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,470,1427785200"; d="scan'208";a="733176210"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by orsmga002.jf.intel.com with ESMTP; 21 May 2015 09:16:08 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 09:15:38 +0000
Message-Id: <ba1bfb4332910bd53dd08bfa81e8c240dbc1e617.1432199284.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1432199284.git.alejandro.hernandez@linux.intel.com>
References: <cover.1432199284.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1432199284.git.alejandro.hernandez@linux.intel.com>
References: <cover.1432199284.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 4/5] python3-distribute: Upgrade to python3-setuptools 15.2
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
X-List-Received-Date: Thu, 21 May 2015 16:16:08 -0000

python3-distribute was merged back to python3-setuptools in 2013,
and it is no longer being maintained, this upgrade also provides
functionality that will be needed for python3-pip.

[YOCTO #7763]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/classes/setuptools3.bbclass                   |  2 +-
 ...ribute_0.6.32.bb => python3-setuptools_15.2.bb} | 40 ++++++++++++----------
 2 files changed, 23 insertions(+), 19 deletions(-)
 rename meta/recipes-devtools/python/{python3-distribute_0.6.32.bb => python3-setuptools_15.2.bb} (53%)

diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.bbclass
index 40c18c8..de6dd94 100644
--- a/meta/classes/setuptools3.bbclass
+++ b/meta/classes/setuptools3.bbclass
@@ -1,6 +1,6 @@
 inherit distutils3
 
-DEPENDS += "python3-distribute-native"
+DEPENDS += "python3-setuptools-native"
 
 DISTUTILS_INSTALL_ARGS = "--root=${D} \
     --prefix=${prefix} \
diff --git a/meta/recipes-devtools/python/python3-distribute_0.6.32.bb b/meta/recipes-devtools/python/python3-setuptools_15.2.bb
similarity index 53%
rename from meta/recipes-devtools/python/python3-distribute_0.6.32.bb
rename to meta/recipes-devtools/python/python3-setuptools_15.2.bb
index 0ef3a87..97058c1 100644
--- a/meta/recipes-devtools/python/python3-distribute_0.6.32.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_15.2.bb
@@ -1,28 +1,21 @@
 SUMMARY = "Download, build, install, upgrade, and uninstall Python packages"
-HOMEPAGE = "http://packages.python.org/distribute"
+HOMEPAGE = "http://packages.python.org/setuptools"
 SECTION = "devel/python"
 LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=234;endline=234;md5=26f6b02022b737126d3c88838782dddb"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=78;endline=78;md5=8a314270dd7a8dbca741775415f1716e"
 
-SRCNAME = "distribute"
-PR = "ml5"
+SRCNAME = "setuptools"
 DEPENDS += "python3"
 DEPENDS_class-native += "python3-native"
 
 SRC_URI = " \
-  http://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+  http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
 "
-SRC_URI[md5sum] = "acb7a2da81e3612bfb1608abe4f0e568"
-SRC_URI[sha256sum] = "8970cd1e148b5d1fea9430584aea66c45ea22d80e0933393ec49ebc388f718df"
+SRC_URI[md5sum] = "a9028a9794fc7ae02320d32e2d7e12ee"
+SRC_URI[sha256sum] = "381e78471fb0eff89c4b1a219e8739f48dd87c76ad2d3a790010ca3a62ee29a4"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-#  http://python-distribute.org/distribute_setup.py 
-
-# force the selection of python3
-#PYTHON_BASEVERSION = "3.3"
-#PYTHON_MAJMIN = "3.3"
-
 inherit distutils3
 
 DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${libdir}/${PYTHON_DIR}/site-packages"
@@ -37,15 +30,26 @@ do_install_append() {
     rm ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
     mv ${D}${bindir}/easy_install ${D}${bindir}/easy3_install
     echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
-    sed -i -e '1s|^#!.*python|#!/usr/bin/env python3|' \
-        ${D}${PYTHON_SITEPACKAGES_DIR}/distribute-${PV}-py${PYTHON_BASEVERSION}.egg/setuptools/tests/test_resources.py
 }
 
 RDEPENDS_${PN} = "\
   python3-distutils \
   python3-compression \
 "
-
-RPROVIDES_${PN} += "python3-setuptools"
-
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
 BBCLASSEXTEND = "native"
-- 
1.8.4.5


