Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6C2CF77142
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 14:36:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 10 Nov 2015 06:36:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,270,1444719600"; d="scan'208";a="847579579"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 10 Nov 2015 06:36:37 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 77DAA6A4083;
	Tue, 10 Nov 2015 06:35:32 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Nov 2015 16:38:39 +0200
Message-Id: <1447166319-6756-2-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1447166319-6756-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1447166319-6756-1-git-send-email-daniel.alexandrux.istrate@intel.com>
Subject: [PATCHv3 2/2] oeqa/selftest/signing: Added new test for signing sstate.
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
X-List-Received-Date: Tue, 10 Nov 2015 14:36:39 -0000

[YOCTO #8182] Optional signing sstate archives and signature verification
[YOCTO #8559] Signing sstate archives with custom dir for gpg keys

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/selftest/signing.py | 48 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
index 879c3e0..c33662b 100644
--- a/meta/lib/oeqa/selftest/signing.py
+++ b/meta/lib/oeqa/selftest/signing.py
@@ -2,6 +2,7 @@ from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 import os
 import glob
+import re
 from oeqa.utils.decorators import testcase
 
 
@@ -74,3 +75,50 @@ class Signing(oeSelfTest):
         # tmp/deploy/rpm/i586/ed-1.9-r0.i586.rpm: rsa sha1 md5 OK
         self.assertIn('rsa sha1 md5 OK', ret.output, 'Package signed incorrectly.')
 
+    @testcase(1382)
+    def test_signing_sstate_archive(self):
+        """
+        Summary:     Test that sstate archives can be signed
+        Expected:    Package should be signed with the correct key
+        Product:     oe-core
+        Author:      Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        """
+
+        test_recipe = 'ed'
+
+        builddir = os.environ.get('BUILDDIR')
+        sstatedir = os.path.join(builddir, 'test-sstate')
+
+        self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
+        self.add_command_to_tearDown('bitbake -c cleansstate %s' % test_recipe)
+        self.add_command_to_tearDown('rm -rf %s' % sstatedir)
+
+        # Determine the pub key signature
+        ret = runCmd('gpg --homedir %s --list-keys' % self.gpg_dir)
+        pub_key = re.search(r'^pub\s+\S+/(\S+)\s+', ret.output, re.M)
+        self.assertIsNotNone(pub_key, 'Failed to determine the public key signature.')
+        pub_key = pub_key.group(1)
+
+        feature = 'SSTATE_SIG_KEY ?= "%s"\n' % pub_key
+        feature += 'SSTATE_SIG_PASSPHRASE ?= "test123"\n'
+        feature += 'SSTATE_VERIFY_SIG ?= "1"\n'
+        feature += 'GPG_PATH = "%s"\n' % self.gpg_dir
+        feature += 'SSTATE_DIR = "%s"\n' % sstatedir
+
+        self.write_config(feature)
+
+        bitbake('-c cleansstate %s' % test_recipe)
+        bitbake(test_recipe)
+
+        recipe_sig = glob.glob(sstatedir + '/*/*:ed:*_package.tgz.sig')
+        recipe_tgz = glob.glob(sstatedir + '/*/*:ed:*_package.tgz')
+
+        self.assertEqual(len(recipe_sig), 1, 'Failed to find .sig file.')
+        self.assertEqual(len(recipe_tgz), 1, 'Failed to find .tgz file.')
+
+        ret = runCmd('gpg --homedir %s --verify %s %s' % (self.gpg_dir, recipe_sig[0], recipe_tgz[0]))
+        # gpg: Signature made Thu 22 Oct 2015 01:45:09 PM EEST using RSA key ID 61EEFB30
+        # gpg: Good signature from "testuser (nocomment) <testuser@email.com>"
+        self.assertIn('gpg: Good signature from', ret.output, 'Package signed incorrectly.')
+
-- 
2.1.0


