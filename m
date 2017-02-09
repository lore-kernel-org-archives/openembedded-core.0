Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D6267771AF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 21:19:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 09 Feb 2017 13:19:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,137,1484035200"; d="scan'208";a="42211796"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by orsmga002.jf.intel.com with ESMTP; 09 Feb 2017 13:19:41 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Feb 2017 13:15:14 +0000
Message-Id: <40e1bfb6c3a5058270a5becd60b0876949fd252d.1486645967.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1486645967.git.mariano.lopez@linux.intel.com>
References: <cover.1486645967.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] testimage.bbclass: Add check for empty test suite
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
X-List-Received-Date: Thu, 09 Feb 2017 21:19:42 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

If for some reason (most likely incorrect TEST_SUITES var)
you end with an empty test suite, testimage will start the
target (qemu by default) and will run an empty suite, so
better have a check before starting the target.

[YOCTO #10979]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testimage.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index c6e4cec..1312202 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -149,6 +149,7 @@ def testimage_main(d):
     from oeqa.runtime.context import OERuntimeTestContext
     from oeqa.runtime.context import OERuntimeTestContextExecutor
     from oeqa.core.target.qemu import supported_fstypes
+    from oeqa.core.utils.test import getSuiteCases
     from oeqa.utils import make_logger_bitbake_compatible
 
     def sigterm_exception(signum, stackframe):
@@ -250,6 +251,9 @@ def testimage_main(d):
     test_modules = d.getVar('TEST_SUITES')
     tc.loadTests(test_paths, modules=test_modules)
 
+    if not getSuiteCases(tc.suites):
+        bb.fatal('Empty test suite, please verify TEST_SUITES variable')
+
     package_extraction(d, tc.suites)
 
     bootparams = None
-- 
2.6.6


