Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EFF11601D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 15:06:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 16 Feb 2016 07:05:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,455,1449561600"; d="scan'208";a="903651621"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 16 Feb 2016 07:05:22 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 26CF36A4002;
	Tue, 16 Feb 2016 07:53:10 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Feb 2016 17:09:01 +0200
Message-Id: <1455635341-28822-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] oeqa/selftest/bbtests: Test bitbake --setscene-only option
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
X-List-Received-Date: Tue, 16 Feb 2016 15:06:11 -0000

Bitbake option to restore from sstate only within a build
(i.e. execute no real tasks, only setscene)

fix for [YOCTO #8876]

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index 42ae9d0..b581b2b 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -232,3 +232,17 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
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
+            self.assertIn('_setscene', task, 'A task different from _setscene ran: %s' % task)
-- 
2.1.0


