Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4AAB5787B0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 18:14:53 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Nov 2017 10:14:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,441,1505804400"; d="scan'208";a="179341197"
Received: from wrath.jf.intel.com ([10.54.70.15])
	by fmsmga005.fm.intel.com with ESMTP; 23 Nov 2017 10:14:54 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Nov 2017 10:14:31 -0800
Message-Id: <6a2336ce735c0f54f804e5ef5bb4c4a18b17d440.1511458497.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1511458497.git.timothy.t.orling@linux.intel.com>
References: <cover.1511458497.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH 10/13] python-gitdb: use pypi.bbclass
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

* Simplify python3-gitdb using pypi.bbclass
* Consolidate common content in .inc

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python-gitdb.inc       | 15 +++++++++++----
 meta/recipes-devtools/python/python3-gitdb_0.6.4.bb |  7 +------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/python/python-gitdb.inc b/meta/recipes-devtools/python/python-gitdb.inc
index 08193fbf25..5fa8885eb9 100644
--- a/meta/recipes-devtools/python/python-gitdb.inc
+++ b/meta/recipes-devtools/python/python-gitdb.inc
@@ -4,13 +4,20 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=59e5ecb13339a936eedf83282eaf4528"
 
-SRC_URI = "https://files.pythonhosted.org/packages/source/g/gitdb/gitdb-${PV}.tar.gz"
+inherit pypi
 
 SRC_URI[md5sum] = "44e4366b8bdfd306b075c3a52c96ae1a"
 SRC_URI[sha256sum] = "a3ebbc27be035a2e874ed904df516e35f4a29a778a764385de09de9e0f139658"
 
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/gitdb/"
-
-S = "${WORKDIR}/gitdb-${PV}"
+DEPENDS = "${PYTHON_PN}-async ${PYTHON_PN}-smmap"
 
+RDEPENDS_${PN} += "${PYTHON_PN}-async \
+                   ${PYTHON_PN}-compression \
+                   ${PYTHON_PN}-crypt \
+                   ${PYTHON_PN}-io \
+                   ${PYTHON_PN}-lang \
+                   ${PYTHON_PN}-mmap \
+                   ${PYTHON_PN}-shell \
+                   ${PYTHON_PN}-smmap \
+"
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python3-gitdb_0.6.4.bb b/meta/recipes-devtools/python/python3-gitdb_0.6.4.bb
index 80d9d469af..e46a438757 100644
--- a/meta/recipes-devtools/python/python3-gitdb_0.6.4.bb
+++ b/meta/recipes-devtools/python/python3-gitdb_0.6.4.bb
@@ -1,7 +1,2 @@
-require python-gitdb.inc
-
-DEPENDS = "python3-async python3-smmap"
-
 inherit distutils3
-
-RDEPENDS_${PN} += "python3-smmap python3-async python3-mmap python3-lang python3-io python3-shell python3-crypt python3-compression"
+require python-gitdb.inc
-- 
2.13.6


