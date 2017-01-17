Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 88B5D71A92
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 15:42:30 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP; 17 Jan 2017 07:42:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,245,1477983600"; d="scan'208";a="49719748"
Received: from yocto-ab04.ostc.intel.com ([10.54.69.51])
	by orsmga004.jf.intel.com with ESMTP; 17 Jan 2017 07:42:31 -0800
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2017 07:42:11 -0800
Message-Id: <fb56a1c1aaeb6f6cf4b415b029e58124057ef662.1484667160.git.jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1484667160.git.jose.a.lamego@linux.intel.com>
References: <cover.1484667160.git.jose.a.lamego@linux.intel.com>
Subject: [PATCH 3/3] python3-setuptools: Remove pth file creation at recipe level
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
X-List-Received-Date: Tue, 17 Jan 2017 15:42:30 -0000

Handling of installed eggs is now performed at the distutils3 bbclass.

This change removes the pth file creation at recipe level.

[YOCTO #8673]

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/recipes-devtools/python/python3-setuptools_31.0.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools_31.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_31.0.0.bb
index 65af6f0..b37b381 100644
--- a/meta/recipes-devtools/python/python3-setuptools_31.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_31.0.0.bb
@@ -7,11 +7,8 @@ inherit distutils3
 
 DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR}"
 
-# The installer puts the wrong path in the setuptools.pth file.  Correct it.
 do_install_append() {
-    rm ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
     mv ${D}${bindir}/easy_install ${D}${bindir}/easy3_install
-    echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
 }
 
 RDEPENDS_${PN} = "\
-- 
1.8.3.1


