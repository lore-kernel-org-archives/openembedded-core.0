Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 606AA77AB3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 13:57:50 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Sep 2017 06:57:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,441,1500966000"; d="scan'208";a="153489056"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga005.jf.intel.com with ESMTP; 26 Sep 2017 06:57:23 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Sep 2017 06:57:20 -0700
Message-Id: <20170926135720.4598-2-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20170926135720.4598-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170926135720.4598-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 2/2] selftest/cases/runtime_test: ignore removal errors when cleaning temporary gpg directory
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
X-List-Received-Date: Tue, 26 Sep 2017 13:57:50 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The high-level method tempfile.TemporaryDirectory give us no way to ignore erros on
removal thus use tempfile.mkdtemp instead. Ignoring possible issues on removal
is neccesary because it contains gpg sockets that are automatically removed by
the system once the process terminates, otherwise the following log is observed:

  File "/usr/lib/python3.5/shutil.py", line 436, in _rmtree_safe_fd
    os.unlink(name, dir_fd=topfd)
  FileNotFoundError: [Errno 2] No such file or directory: 'S.gpg-agent.browser'

This is the same fix as 7e3a7cd2426feac757def81850dc44156cd0f33e, but this applies
to runtime (instead of signing).

[YOCTO #11821]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 673b1998ac..7d105f2fed 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -4,6 +4,7 @@ from oeqa.core.decorator.oeid import OETestID
 import os
 import re
 import tempfile
+import shutil
 
 class TestExport(OESelftestTestCase):
 
@@ -147,19 +148,22 @@ class TestImage(OESelftestTestCase):
         features += 'PACKAGE_CLASSES = "package_rpm"\n'
 
         # Enable package feed signing
-        self.gpg_home = tempfile.TemporaryDirectory(prefix="oeqa-feed-sign-")
+        self.gpg_home = tempfile.mkdtemp(prefix="oeqa-feed-sign-")
         signing_key_dir = os.path.join(self.testlayer_path, 'files', 'signing')
-        runCmd('gpg --batch --homedir %s --import %s' % (self.gpg_home.name, os.path.join(signing_key_dir, 'key.secret')))
+        runCmd('gpg --batch --homedir %s --import %s' % (self.gpg_home, os.path.join(signing_key_dir, 'key.secret')))
         features += 'INHERIT += "sign_package_feed"\n'
         features += 'PACKAGE_FEED_GPG_NAME = "testuser"\n'
         features += 'PACKAGE_FEED_GPG_PASSPHRASE_FILE = "%s"\n' % os.path.join(signing_key_dir, 'key.passphrase')
-        features += 'GPG_PATH = "%s"\n' % self.gpg_home.name
+        features += 'GPG_PATH = "%s"\n' % self.gpg_home
         self.write_config(features)
 
         # Build core-image-sato and testimage
         bitbake('core-image-full-cmdline socat')
         bitbake('-c testimage core-image-full-cmdline')
 
+        # remove the oeqa-feed-sign temporal directory
+        shutil.rmtree(self.gpg_home, ignore_errors=True)
+
 class Postinst(OESelftestTestCase):
     @OETestID(1540)
     def test_verify_postinst(self):
-- 
2.12.3


