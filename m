Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 212A5787CE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 18:14:53 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Nov 2017 10:14:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,441,1505804400"; d="scan'208";a="179341192"
Received: from wrath.jf.intel.com ([10.54.70.15])
	by fmsmga005.fm.intel.com with ESMTP; 23 Nov 2017 10:14:54 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Nov 2017 10:14:28 -0800
Message-Id: <b3191933973f39c235f14a726c380b782e5712fa.1511458497.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1511458497.git.timothy.t.orling@linux.intel.com>
References: <cover.1511458497.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH 07/13] python-async: use pypi.bbclass
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

* Simplify by using pypi.bbclass
* Use PYTHON_PN for RDEPENDS in .inc to avoid duplication

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python-async.inc       | 7 +++----
 meta/recipes-devtools/python/python3-async_0.6.2.bb | 6 +-----
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/python/python-async.inc b/meta/recipes-devtools/python/python-async.inc
index 2c5cb4d191..0874667e0c 100644
--- a/meta/recipes-devtools/python/python-async.inc
+++ b/meta/recipes-devtools/python/python-async.inc
@@ -4,12 +4,11 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=88df8e78b9edfd744953862179f2d14e"
 
-SRC_URI = "https://files.pythonhosted.org/packages/source/a/async/async-${PV}.tar.gz"
+inherit pypi
+
 SRC_URI[md5sum] = "9b06b5997de2154f3bc0273f80bcef6b"
 SRC_URI[sha256sum] = "ac6894d876e45878faae493b0cf61d0e28ec417334448ac0a6ea2229d8343051"
 
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/async/"
-
-S = "${WORKDIR}/async-${PV}"
+RDEPENDS_${PN} += "${PYTHON_PN}-threading ${PYTHON_PN}-lang"
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python3-async_0.6.2.bb b/meta/recipes-devtools/python/python3-async_0.6.2.bb
index 54a30f5498..0da5fdecdc 100644
--- a/meta/recipes-devtools/python/python3-async_0.6.2.bb
+++ b/meta/recipes-devtools/python/python3-async_0.6.2.bb
@@ -1,6 +1,2 @@
-require python-async.inc
-
 inherit setuptools3
-
-RDEPENDS_${PN} += "python3-threading python3-lang"
-
+require python-async.inc
-- 
2.13.6


