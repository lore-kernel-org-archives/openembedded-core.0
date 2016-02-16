Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E9DC06FF23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 15:36:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 16 Feb 2016 07:36:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,455,1449561600"; d="scan'208";a="652968471"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Feb 2016 07:36:51 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id A12096A4002;
	Tue, 16 Feb 2016 08:24:41 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Feb 2016 17:40:32 +0200
Message-Id: <1455637232-1652-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCHv2] oeqa/selftest/bbtests: Test bitbake --setscene-only option
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
X-List-Received-Date: Tue, 16 Feb 2016 15:36:52 -0000

Bitbake option to restore from sstate only within a build
(i.e. execute no real tasks, only setscene)

fix for [YOCTO #8876]

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index 42ae9d0..70e5b29 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -232,3 +232,18 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         self.assertEqual(result.status, 0, "Bitbake failed, exit code %s, output %s" % (result.status, result.output))
         self.assertFalse(os.path.isfile(os.path.join(self.builddir, 'tmp/deploy/licenses/readline/generic_GPLv3')))
         self.assertTrue(os.path.isfile(os.path.join(self.builddir, 'tmp/deploy/licenses/readline/generic_GPLv2')))
+
+    @testcase(1422)
+    def test_setscene_only(self):
+        """ Bitbake option to restore from sstate only within a build (i.e. execute no real tasks, only setscene)"""
+        test_recipe = 'ed'
+
+        bitbake(test_recipe)
+        bitbake('-c clean %s' % test_recipe)
+        ret = bitbake('--setscene-only %s' % test_recipe)
+
+        tasks = re.findall(r'task\s+(do_\S+):', ret.output)
+
+        for task in tasks:
+            self.assertIn('_setscene', task, 'A task different from _setscene ran: %s.\n'
+                                             'Executed tasks were: %s' % (task, str(tasks)))
-- 
2.1.0


