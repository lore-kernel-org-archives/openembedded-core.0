Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C21D8787C9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 05:04:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Dec 2017 21:04:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,394,1508828400"; d="scan'208";a="15240466"
Received: from chiron.jf.intel.com ([10.7.159.61])
	by orsmga001.jf.intel.com with ESMTP; 11 Dec 2017 21:04:32 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Dec 2017 21:04:14 -0800
Message-Id: <e364a030b6e509d83784cbe2ca4e24c790a60bf1.1513054233.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1513054233.git.timothy.t.orling@linux.intel.com>
References: <cover.1513054233.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH v3 09/14] python-mako: use pypi.bbclass
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
X-List-Received-Date: Tue, 12 Dec 2017 05:04:31 -0000

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
2.14.3


