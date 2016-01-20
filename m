Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B37E360588
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 13:09:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 20 Jan 2016 05:08:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,321,1449561600"; d="scan'208";a="894596598"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 20 Jan 2016 05:08:42 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 15:08:41 +0200
Message-Id: <1453295321-3832-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/selftest/signing: use temporary rpmdb
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
X-List-Received-Date: Wed, 20 Jan 2016 13:09:27 -0000

Use temporary rpmdb when importing gpg public key and checking rpm
signature. This patch should fix a problem where test_signing_packages()
sometimes fails with
"pmdb: BDB1540 configured environment flags incompatible with existing
 environment"

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/selftest/signing.py | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
index c33662b..c402e37 100644
--- a/meta/lib/oeqa/selftest/signing.py
+++ b/meta/lib/oeqa/selftest/signing.py
@@ -3,6 +3,8 @@ from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 import os
 import glob
 import re
+import shutil
+import tempfile
 from oeqa.utils.decorators import testcase
 
 
@@ -69,11 +71,17 @@ class Signing(oeSelfTest):
 
         pkg_deploy = os.path.join(deploy_dir_rpm, package_arch, '.'.join((pf, package_arch, 'rpm')))
 
-        runCmd('%s/rpm --import %s%s' % (staging_bindir_native, self.gpg_dir, self.pub_key_name))
+        # Use a temporary rpmdb
+        rpmdb = tempfile.mkdtemp(prefix='oeqa-rpmdb')
 
-        ret = runCmd('%s/rpm --checksig %s' % (staging_bindir_native, pkg_deploy))
+        runCmd('%s/rpm --define "_dbpath %s" --import %s%s' %
+               (staging_bindir_native, rpmdb, self.gpg_dir, self.pub_key_name))
+
+        ret = runCmd('%s/rpm --define "_dbpath %s" --checksig %s' %
+                     (staging_bindir_native, rpmdb, pkg_deploy))
         # tmp/deploy/rpm/i586/ed-1.9-r0.i586.rpm: rsa sha1 md5 OK
         self.assertIn('rsa sha1 md5 OK', ret.output, 'Package signed incorrectly.')
+        shutil.rmtree(rpmdb)
 
     @testcase(1382)
     def test_signing_sstate_archive(self):
-- 
2.1.4


