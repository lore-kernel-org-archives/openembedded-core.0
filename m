Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 192CC785D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 18:14:53 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Nov 2017 10:14:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,441,1505804400"; d="scan'208";a="179341190"
Received: from wrath.jf.intel.com ([10.54.70.15])
	by fmsmga005.fm.intel.com with ESMTP; 23 Nov 2017 10:14:54 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Nov 2017 10:14:27 -0800
Message-Id: <50120a89a921ebd31c24c834e2adc2f6d45cdb17.1511458497.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1511458497.git.timothy.t.orling@linux.intel.com>
References: <cover.1511458497.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH 06/13] python-six: use pypi.bbclass
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

* Simplify python3-six by using pypi.bbclass
  - Use PYTHON_PN in .inc to avoid duplication in RDEPENDS

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python-six.inc        | 8 +++-----
 meta/recipes-devtools/python/python3-six_1.11.0.bb | 2 --
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/python/python-six.inc b/meta/recipes-devtools/python/python-six.inc
index f9e7d6429d..c77498457d 100644
--- a/meta/recipes-devtools/python/python-six.inc
+++ b/meta/recipes-devtools/python/python-six.inc
@@ -4,13 +4,11 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=35cec5bf04dd0820d0a18533ea7c774a"
 
-SRC_URI = "https://files.pythonhosted.org/packages/source/s/six/six-${PV}.tar.gz"
 SRC_URI[md5sum] = "d12789f9baf7e9fb2524c0c64f1773f8"
 SRC_URI[sha256sum] = "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"
 
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/six/"
-UPSTREAM_CHECK_REGEX = "/six/(?P<pver>(\d+[\.\-_]*)+)"
+inherit pypi
 
-BBCLASSEXTEND = "native nativesdk"
+RDEPENDS_${PN} = "${PYTHON_PN}-io"
 
-S = "${WORKDIR}/six-${PV}"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-six_1.11.0.bb b/meta/recipes-devtools/python/python3-six_1.11.0.bb
index 38a47b77dd..8795313bec 100644
--- a/meta/recipes-devtools/python/python3-six_1.11.0.bb
+++ b/meta/recipes-devtools/python/python3-six_1.11.0.bb
@@ -1,4 +1,2 @@
 inherit setuptools3
 require python-six.inc
-
-RDEPENDS_${PN} += "python3-io"
-- 
2.13.6


