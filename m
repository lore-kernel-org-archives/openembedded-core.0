Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 57F5E78710
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 22:45:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Dec 2017 14:45:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,379,1508828400"; 
   d="scan'208";a="1306939"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga008.jf.intel.com with ESMTP; 08 Dec 2017 14:45:53 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Dec 2017 14:45:16 -0800
Message-Id: <6820e7cbefbc72d6d5ba9ebed4e133cc434a9c21.1512765771.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1512765771.git.timothy.t.orling@linux.intel.com>
References: <cover.1512765771.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH v2 04/19] hwlatdetect: fix RDEPENDS to avoid QA failures
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
X-List-Received-Date: Fri, 08 Dec 2017 22:45:51 -0000

From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>

When listing python3 as an RDEPENDS, the image will in fact
contain python3-modules, but the QA check fails to get
RPROVIDERS correctly (since the python3 package does not
actually exist), /usr/bin/python3 is provided by the
python3-core package, so by fixing the RDEPENDS and listing
python3-core instead of python3, the QA check works correctly
and we avoid failures.

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
2.13.6


