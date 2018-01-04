Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C9CF4786A2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 22:56:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jan 2018 14:56:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,316,1511856000"; d="scan'208";a="192490905"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by fmsmga006.fm.intel.com with ESMTP; 04 Jan 2018 14:56:48 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jan 2018 14:56:44 -0800
Message-Id: <56c24dd22e765a999ab918a1f98f09cfb62a235b.1515106194.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1515106194.git.timothy.t.orling@linux.intel.com>
References: <cover.1515106194.git.timothy.t.orling@linux.intel.com>
Subject: [rocko][PATCH 1/1] python[3]-setuptools: inherit setuptools
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
X-List-Received-Date: Thu, 04 Jan 2018 22:56:46 -0000

* distutils[3].bbclass was not including pkg_resources module
* Drop uneeded DISTUTILS_INSTALL_ARGS as setuptools[3].bbclass provides it

Fixes [YOCTO #12148]

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python-setuptools_36.2.7.bb  | 4 +---
 meta/recipes-devtools/python/python3-setuptools_36.2.7.bb | 7 +------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/python/python-setuptools_36.2.7.bb b/meta/recipes-devtools/python/python-setuptools_36.2.7.bb
index 526474c7ea5..0efacc137af 100644
--- a/meta/recipes-devtools/python/python-setuptools_36.2.7.bb
+++ b/meta/recipes-devtools/python/python-setuptools_36.2.7.bb
@@ -5,9 +5,7 @@ PROVIDES = "python-distribute"
 DEPENDS += "python"
 DEPENDS_class-native += "python-native"
 
-inherit distutils
-
-DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR}"
+inherit setuptools
 
 RDEPENDS_${PN} = "\
   python-stringold \
diff --git a/meta/recipes-devtools/python/python3-setuptools_36.2.7.bb b/meta/recipes-devtools/python/python3-setuptools_36.2.7.bb
index 63f241809e0..a7bca974026 100644
--- a/meta/recipes-devtools/python/python3-setuptools_36.2.7.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_36.2.7.bb
@@ -4,15 +4,10 @@ DEPENDS += "python3"
 DEPENDS_class-native += "python3-native"
 DEPENDS_class-nativesdk += "nativesdk-python3"
 
-inherit distutils3
+inherit setuptools3
 
-DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR}"
-
-# The installer puts the wrong path in the setuptools.pth file.  Correct it.
 do_install_append() {
-    rm ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
     mv ${D}${bindir}/easy_install ${D}${bindir}/easy3_install
-    echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
 }
 
 RDEPENDS_${PN}_class-native = "\
-- 
2.13.6


