Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 31E9D787D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 18:14:53 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Nov 2017 10:14:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,441,1505804400"; d="scan'208";a="179341194"
Received: from wrath.jf.intel.com ([10.54.70.15])
	by fmsmga005.fm.intel.com with ESMTP; 23 Nov 2017 10:14:54 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Nov 2017 10:14:29 -0800
Message-Id: <4d7028d4af224d1d72fd164b2862223bb6091254.1511458497.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1511458497.git.timothy.t.orling@linux.intel.com>
References: <cover.1511458497.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH 08/13] python-mako: use pypi.bbclass
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

* Simpify python3-mako by using pypi.bbclass
* Consolidate common content in .inc

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python-mako.inc       | 13 +++++++++----
 meta/recipes-devtools/python/python3-mako_1.0.7.bb | 11 +----------
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/python/python-mako.inc b/meta/recipes-devtools/python/python-mako.inc
index 1c83af6a23..e265bde85f 100644
--- a/meta/recipes-devtools/python/python-mako.inc
+++ b/meta/recipes-devtools/python/python-mako.inc
@@ -4,13 +4,18 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1bb21fa2d2f7a534c884b990430a6863"
 
-SRC_URI = "https://files.pythonhosted.org/packages/source/M/Mako/Mako-${PV}.tar.gz"
+PYPI_PACKAGE = "Mako"
+
+inherit pypi
 
 SRC_URI[md5sum] = "5836cc997b1b773ef389bf6629c30e65"
 SRC_URI[sha256sum] = "4e02fde57bd4abb5ec400181e4c314f56ac3e49ba4fb8b0d50bba18cb27d25ae"
 
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/mako/"
-UPSTREAM_CHECK_REGEX = "/Mako/(?P<pver>(\d+[\.\-_]*)+)"
+RDEPENDS_${PN} = "${PYTHON_PN}-html \
+                  ${PYTHON_PN}-netclient \
+                  ${PYTHON_PN}-threading \
+"
 
-S = "${WORKDIR}/Mako-${PV}"
+RDEPENDS_${PN}_class-native = ""
 
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-mako_1.0.7.bb b/meta/recipes-devtools/python/python3-mako_1.0.7.bb
index 2b50ffd08a..22ceeeb395 100644
--- a/meta/recipes-devtools/python/python3-mako_1.0.7.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.0.7.bb
@@ -1,11 +1,2 @@
-require python-mako.inc
-
 inherit setuptools3
-
-RDEPENDS_${PN} = "python3-threading \
-                  python3-netclient \
-                  python3-html \
-"
-RDEPENDS_${PN}_class-native = ""
-
-BBCLASSEXTEND = "native nativesdk"
+require python-mako.inc
-- 
2.13.6


