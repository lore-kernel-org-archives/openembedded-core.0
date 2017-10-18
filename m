Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C15CC78303
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 21:07:42 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Oct 2017 14:07:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,398,1503385200"; d="scan'208";a="162077681"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga005.jf.intel.com with ESMTP; 18 Oct 2017 14:07:43 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Oct 2017 14:07:40 -0700
Message-Id: <fb813634dc4aded97ee3934655b63a32c798aaaa.1508360667.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1508360667.git.alejandro.hernandez@linux.intel.com>
References: <cover.1508360667.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1508360667.git.alejandro.hernandez@linux.intel.com>
References: <cover.1508360667.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 4/4] hwlatdetect: fix RDEPENDS to avoid QA failures
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
X-List-Received-Date: Wed, 18 Oct 2017 21:07:42 -0000

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
2.12.3


