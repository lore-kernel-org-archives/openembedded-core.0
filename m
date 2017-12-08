Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0986E786EA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 22:46:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Dec 2017 14:46:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,379,1508828400"; 
   d="scan'208";a="1306981"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga008.jf.intel.com with ESMTP; 08 Dec 2017 14:46:02 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Dec 2017 14:45:25 -0800
Message-Id: <49e0bf7522943a9da4687710cd2d3cc9178ce389.1512765771.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1512765771.git.timothy.t.orling@linux.intel.com>
References: <cover.1512765771.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH v2 13/19] python-async: use pypi.bbclass
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
X-List-Received-Date: Fri, 08 Dec 2017 22:46:01 -0000

* Simplify by using pypi.bbclass
* Use PYTHON_PN for RDEPENDS in .inc to avoid duplication

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python-async.inc       | 5 ++---
 meta/recipes-devtools/python/python3-async_0.6.2.bb | 3 ---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python-async.inc b/meta/recipes-devtools/python/python-async.inc
index 2c5cb4d1916..56e9592ac02 100644
--- a/meta/recipes-devtools/python/python-async.inc
+++ b/meta/recipes-devtools/python/python-async.inc
@@ -4,12 +4,11 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=88df8e78b9edfd744953862179f2d14e"
 
-SRC_URI = "https://files.pythonhosted.org/packages/source/a/async/async-${PV}.tar.gz"
 SRC_URI[md5sum] = "9b06b5997de2154f3bc0273f80bcef6b"
 SRC_URI[sha256sum] = "ac6894d876e45878faae493b0cf61d0e28ec417334448ac0a6ea2229d8343051"
 
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/async/"
+inherit pypi
 
-S = "${WORKDIR}/async-${PV}"
+RDEPENDS_${PN} += "${PYTHON_PN}-threading"
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python3-async_0.6.2.bb b/meta/recipes-devtools/python/python3-async_0.6.2.bb
index f45781c44f8..e62b21fcaef 100644
--- a/meta/recipes-devtools/python/python3-async_0.6.2.bb
+++ b/meta/recipes-devtools/python/python3-async_0.6.2.bb
@@ -1,6 +1,3 @@
 require python-async.inc
 
 inherit setuptools3
-
-RDEPENDS_${PN} += "python3-threading"
-
-- 
2.13.6


