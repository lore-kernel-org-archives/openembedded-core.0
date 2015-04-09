Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2574A606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 07:10:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t397B0Gf001661
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 Apr 2015 00:11:00 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 9 Apr 2015 00:10:59 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Apr 2015 15:10:57 +0800
Message-ID: <1428563457-15238-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH] lib/oeqa/selftest/bblayers: improve test for add-layer and remove-layer
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
X-List-Received-Date: Thu, 09 Apr 2015 07:11:01 -0000
Content-Type: text/plain

Use absolute path instead of relative path for meta-skeleton.
Otherwise the case would fail if the builddir outside the poky source
tree.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/lib/oeqa/selftest/bblayers.py |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/bblayers.py b/meta/lib/oeqa/selftest/bblayers.py
index 5b046d0..3a18029 100644
--- a/meta/lib/oeqa/selftest/bblayers.py
+++ b/meta/lib/oeqa/selftest/bblayers.py
@@ -6,7 +6,7 @@ import shutil
 
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import runCmd
+from oeqa.utils.commands import runCmd, get_bb_var
 from oeqa.utils.decorators import testcase
 
 class BitbakeLayers(oeSelfTest):
@@ -44,15 +44,16 @@ class BitbakeLayers(oeSelfTest):
         self.assertTrue(find_in_contents)
 
     def test_bitbakelayers_add_remove(self):
+        test_layer = os.path.join(get_bb_var('COREBASE'), 'meta-skeleton')
         result = runCmd('bitbake-layers show-layers')
         self.assertNotIn('meta-skeleton', result.output, 'This test cannot run with meta-skeleton in bblayers.conf')
-        result = runCmd('bitbake-layers add-layer ../meta-skeleton')
+        result = runCmd('bitbake-layers add-layer %s' % test_layer)
         result = runCmd('bitbake-layers show-layers')
         self.assertIn('meta-skeleton', result.output)
-        result = runCmd('bitbake-layers remove-layer ../meta-skeleton')
+        result = runCmd('bitbake-layers remove-layer %s' % test_layer)
         result = runCmd('bitbake-layers show-layers')
         self.assertNotIn('meta-skeleton', result.output)
-        result = runCmd('bitbake-layers add-layer ../meta-skeleton')
+        result = runCmd('bitbake-layers add-layer %s' % test_layer)
         result = runCmd('bitbake-layers show-layers')
         self.assertIn('meta-skeleton', result.output)
         result = runCmd('bitbake-layers remove-layer */meta-skeleton')
-- 
1.7.9.5


