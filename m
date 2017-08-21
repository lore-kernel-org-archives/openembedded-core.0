Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3CC79782B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 22:11:30 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Aug 2017 15:11:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,410,1498546800"; d="scan'208";a="302829051"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga004.fm.intel.com with ESMTP; 21 Aug 2017 15:11:31 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 15:11:30 -0700
Message-Id: <20170821221130.2065-1-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH] hwlatdetect: fix RDEPENDS to avoid QA failures
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
X-List-Received-Date: Mon, 21 Aug 2017 22:11:31 -0000

When listing python3 as an RDEPENDS, the image will in fact
contain python3-modules, but the QA check fails to get
RPROVIDERS correctly (since the python3 package does not
actually exist), /usr/bin/python3 is provided by the
python3-core package, so by fixing the RDEPENDS and listing
python3-creo instead of python3, the QA check works correctly
and we avoid failures

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb b/meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb
index 60b44a4d258..5f61c4ecddc 100644
--- a/meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb
+++ b/meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb
@@ -22,5 +22,5 @@ do_install() {
 }
 
 FILES_${PN} += "${libdir}/python${PYTHON_BASEVERSION}/dist-packages/hwlatdetect.py"
-RDEPENDS_${PN} = "python3 "
+RDEPENDS_${PN} = "python3-core "
 RRECOMMENDS_${PN} = "kernel-module-hwlat-detector"
-- 
2.12.3


