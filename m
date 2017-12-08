Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2E2C3787E0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 22:46:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Dec 2017 14:46:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,379,1508828400"; 
   d="scan'208";a="1307000"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga008.jf.intel.com with ESMTP; 08 Dec 2017 14:46:04 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Dec 2017 14:45:27 -0800
Message-Id: <20cad9f4d15bd735753c11a4c1d629b2e862072c.1512765771.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1512765771.git.timothy.t.orling@linux.intel.com>
References: <cover.1512765771.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH v2 15/19] python-smmap: use pypi.bbclass
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
X-List-Received-Date: Fri, 08 Dec 2017 22:46:03 -0000

* Simpify python3-smmap using pypi.bbclass
* Consolidate common content in .inc

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python-smmap.inc       | 9 +++++----
 meta/recipes-devtools/python/python3-smmap_0.9.0.bb | 2 --
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python-smmap.inc b/meta/recipes-devtools/python/python-smmap.inc
index d67e6b54124..4117c947947 100644
--- a/meta/recipes-devtools/python/python-smmap.inc
+++ b/meta/recipes-devtools/python/python-smmap.inc
@@ -7,13 +7,14 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
 
-SRC_URI = "https://files.pythonhosted.org/packages/source/s/smmap/smmap-${PV}.tar.gz"
 SRC_URI[md5sum] = "d7932d5ace206bf4ae15198cf36fb6ab"
 SRC_URI[sha256sum] = "0e2b62b497bd5f0afebc002eda4d90df9d209c30ef257e8673c90a6b5c119d62"
 
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/smmap/"
-UPSTREAM_CHECK_REGEX = "/smmap/(?P<pver>(\d+[\.\-_]*)+)"
+inherit pypi
 
-S = "${WORKDIR}/smmap-${PV}"
+RDEPENDS_${PN} += " \
+  ${PYTHON_PN}-codecs \
+  ${PYTHON_PN}-mmap \
+  "
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python3-smmap_0.9.0.bb b/meta/recipes-devtools/python/python3-smmap_0.9.0.bb
index 1df74c172c4..9c25ca18096 100644
--- a/meta/recipes-devtools/python/python3-smmap_0.9.0.bb
+++ b/meta/recipes-devtools/python/python3-smmap_0.9.0.bb
@@ -1,5 +1,3 @@
 require python-smmap.inc
 
 inherit setuptools3
-
-RDEPENDS_${PN} += "python3-codecs python3-mmap"
-- 
2.13.6


