Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1D009787D2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 22:46:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Dec 2017 14:46:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,379,1508828400"; 
   d="scan'208";a="1306997"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga008.jf.intel.com with ESMTP; 08 Dec 2017 14:46:03 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Dec 2017 14:45:26 -0800
Message-Id: <2dd4792241d9f03830607c8099dc740dceebbb69.1512765771.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1512765771.git.timothy.t.orling@linux.intel.com>
References: <cover.1512765771.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH v2 14/19] python-mako: use pypi.bbclass
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
X-List-Received-Date: Fri, 08 Dec 2017 22:46:02 -0000

* Simplify python3-mako by using pypi.bbclass
* Avoid duplication by using PYTHON_PN in .inc

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python-mako.inc       | 14 +++++++++-----
 meta/recipes-devtools/python/python3-mako_1.0.7.bb |  9 ---------
 2 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/python/python-mako.inc b/meta/recipes-devtools/python/python-mako.inc
index 1c83af6a239..7adae6161e8 100644
--- a/meta/recipes-devtools/python/python-mako.inc
+++ b/meta/recipes-devtools/python/python-mako.inc
@@ -4,13 +4,17 @@ SECTION = "devel/python"
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
-
-S = "${WORKDIR}/Mako-${PV}"
+RDEPENDS_${PN}_class-target += " \
+  ${PYTHON_PN}-html \
+  ${PYTHON_PN}-netclient \
+  ${PYTHON_PN}-threading \
+  "
 
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-mako_1.0.7.bb b/meta/recipes-devtools/python/python3-mako_1.0.7.bb
index 2b50ffd08ad..156d4f16829 100644
--- a/meta/recipes-devtools/python/python3-mako_1.0.7.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.0.7.bb
@@ -1,11 +1,2 @@
 require python-mako.inc
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
-- 
2.13.6


