Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6382265CC7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 21:33:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Aug 2017 14:33:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,339,1498546800"; d="scan'208";a="1179988371"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga001.fm.intel.com with ESMTP; 07 Aug 2017 14:33:54 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Aug 2017 14:33:50 -0700
Message-Id: <20170807213351.600-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH v3 1/2] sstatetests: Use python function instead of bitbake-diffsigs script
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
X-List-Received-Date: Mon, 07 Aug 2017 21:33:53 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Using a python function instead of launching a subprocess fasten the
diffsigs computation.

[YOCTO #11651]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 07a206824a..0b36027918 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -8,6 +8,8 @@ from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer
 from oeqa.selftest.cases.sstate import SStateBase
 from oeqa.core.decorator.oeid import OETestID
 
+import bb.siggen
+
 class SStateTests(SStateBase):
 
     # Test sstate files creation and their location
@@ -469,9 +471,11 @@ http_proxy = "http://example.com/"
         for k in files1.keys() | files2.keys():
             if k in files1 and k in files2:
                 print("%s differs:" % k)
-                print(subprocess.check_output(("bitbake-diffsigs",
-                                               self.topdir + "/tmp-sstatesamehash/stamps/" + k + "." + files1[k],
-                                               self.topdir + "/tmp-sstatesamehash2/stamps/" + k + "." + files2[k])))
+                sigdatafile1 = self.topdir + "/tmp-sstatesamehash/stamps/" + k + "." + files1[k]
+                sigdatafile2 = self.topdir + "/tmp-sstatesamehash2/stamps/" + k + "." + files2[k]
+                output = bb.siggen.compare_sigfiles(sigdatafile1, sigdatafile2)
+                if output:
+                    print('\n'.join(output))
             elif k in files1 and k not in files2:
                 print("%s in files1" % k)
             elif k not in files1 and k in files2:
-- 
2.12.3


