Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4F914787EE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 22:46:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Dec 2017 14:46:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,379,1508828400"; 
   d="scan'208";a="1307002"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga008.jf.intel.com with ESMTP; 08 Dec 2017 14:46:05 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Dec 2017 14:45:28 -0800
Message-Id: <0ba2a42adb0c9860458654f190a4ee3714b6b67a.1512765771.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1512765771.git.timothy.t.orling@linux.intel.com>
References: <cover.1512765771.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH v2 16/19] python-gitdb: use pypi.bbclass
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
X-List-Received-Date: Fri, 08 Dec 2017 22:46:04 -0000

* Simplify python3-gitdb recipe using pypi.bblass
* Avoid duplication by using PYTHON_PN in .inc
* Sort RDEPENDS alphabetically

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python-gitdb.inc       | 16 ++++++++++++----
 meta/recipes-devtools/python/python3-gitdb_0.6.4.bb |  4 ----
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/python/python-gitdb.inc b/meta/recipes-devtools/python/python-gitdb.inc
index 08193fbf258..45c75ef3089 100644
--- a/meta/recipes-devtools/python/python-gitdb.inc
+++ b/meta/recipes-devtools/python/python-gitdb.inc
@@ -4,13 +4,21 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=59e5ecb13339a936eedf83282eaf4528"
 
-SRC_URI = "https://files.pythonhosted.org/packages/source/g/gitdb/gitdb-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "44e4366b8bdfd306b075c3a52c96ae1a"
 SRC_URI[sha256sum] = "a3ebbc27be035a2e874ed904df516e35f4a29a778a764385de09de9e0f139658"
 
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/gitdb/"
+inherit pypi
+
+DEPENDS = "${PYTHON_PN}-async ${PYTHON_PN}-smmap"
 
-S = "${WORKDIR}/gitdb-${PV}"
+RDEPENDS_${PN} += " \
+  ${PYTHON_PN}-async \
+  ${PYTHON_PN}-compression \
+  ${PYTHON_PN}-crypt \
+  ${PYTHON_PN}-io \
+  ${PYTHON_PN}-mmap \
+  ${PYTHON_PN}-shell \
+  ${PYTHON_PN}-smmap \
+  "
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python3-gitdb_0.6.4.bb b/meta/recipes-devtools/python/python3-gitdb_0.6.4.bb
index a209c52f9ee..412cf8c02c9 100644
--- a/meta/recipes-devtools/python/python3-gitdb_0.6.4.bb
+++ b/meta/recipes-devtools/python/python3-gitdb_0.6.4.bb
@@ -1,7 +1,3 @@
 require python-gitdb.inc
 
-DEPENDS = "python3-async python3-smmap"
-
 inherit distutils3
-
-RDEPENDS_${PN} += "python3-smmap python3-async python3-mmap python3-io python3-shell python3-crypt python3-compression"
-- 
2.13.6


