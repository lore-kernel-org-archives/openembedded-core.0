Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3C0057875A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 18:14:53 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Nov 2017 10:14:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,441,1505804400"; d="scan'208";a="179341196"
Received: from wrath.jf.intel.com ([10.54.70.15])
	by fmsmga005.fm.intel.com with ESMTP; 23 Nov 2017 10:14:54 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Nov 2017 10:14:30 -0800
Message-Id: <e15f20ce36a67087bba498606abd63a21909653b.1511458497.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1511458497.git.timothy.t.orling@linux.intel.com>
References: <cover.1511458497.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH 09/13] python-smmap: use pypi.bbclass
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

* Simpify python3-smmap using pypi.bbclass
* Consolidate common content in .inc

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python-smmap.inc       | 12 ++++++------
 meta/recipes-devtools/python/python3-smmap_0.9.0.bb |  5 +----
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/python/python-smmap.inc b/meta/recipes-devtools/python/python-smmap.inc
index d67e6b5412..32438350c1 100644
--- a/meta/recipes-devtools/python/python-smmap.inc
+++ b/meta/recipes-devtools/python/python-smmap.inc
@@ -7,13 +7,13 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
 
-SRC_URI = "https://files.pythonhosted.org/packages/source/s/smmap/smmap-${PV}.tar.gz"
+inherit pypi
+
 SRC_URI[md5sum] = "d7932d5ace206bf4ae15198cf36fb6ab"
 SRC_URI[sha256sum] = "0e2b62b497bd5f0afebc002eda4d90df9d209c30ef257e8673c90a6b5c119d62"
 
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/smmap/"
-UPSTREAM_CHECK_REGEX = "/smmap/(?P<pver>(\d+[\.\-_]*)+)"
-
-S = "${WORKDIR}/smmap-${PV}"
-
+RDEPENDS_${PN} += "${PYTHON_PN}-codecs \
+                   ${PYTHON_PN}-lang \
+                   ${PYTHON_PN}-mmap \
+"
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python3-smmap_0.9.0.bb b/meta/recipes-devtools/python/python3-smmap_0.9.0.bb
index 9f8a26d79e..e87b8df8c5 100644
--- a/meta/recipes-devtools/python/python3-smmap_0.9.0.bb
+++ b/meta/recipes-devtools/python/python3-smmap_0.9.0.bb
@@ -1,5 +1,2 @@
-require python-smmap.inc
-
 inherit setuptools3
-
-RDEPENDS_${PN} += "python3-codecs python3-mmap python3-lang"
+require python-smmap.inc
-- 
2.13.6


