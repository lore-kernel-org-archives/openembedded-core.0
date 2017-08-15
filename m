Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id B2B83784E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 11:35:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 15 Aug 2017 04:35:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,377,1498546800"; d="scan'208";a="1205843518"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2017 04:35:07 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Aug 2017 14:34:57 +0300
Message-Id: <da867ed46f849c900ef913bc5dabd3801712c3c4.1502795847.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1502795847.git.markus.lehtonen@linux.intel.com>
References: <cover.1502795847.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v4 8/8] dnf: expand dnf selftest to test signed package feeds
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
X-List-Received-Date: Tue, 15 Aug 2017 11:35:06 -0000

[YOCTO #11209]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta-selftest/files/signing/key.passphrase          |  1 +
 meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py |  4 +++-
 meta/lib/oeqa/selftest/cases/runtime_test.py        | 12 +++++++++++-
 3 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 meta-selftest/files/signing/key.passphrase

diff --git a/meta-selftest/files/signing/key.passphrase b/meta-selftest/files/signing/key.passphrase
new file mode 100644
index 0000000000..5271a52680
--- /dev/null
+++ b/meta-selftest/files/signing/key.passphrase
@@ -0,0 +1 @@
+test123
diff --git a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
index 68e56f2c5e..6742e8c080 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
@@ -36,7 +36,9 @@ class DnfSelftest(DnfTest):
         self.tc.target.copyTo(temp_file, "/etc/yum.repos.d/oe-remote-repo.repo")
 
         import re
-        output_makecache = self.dnf('makecache')
+        # Use '-y' for non-interactive mode: automatically import the feed signing key
+        output_makecache = self.dnf('-y makecache')
+        self.assertTrue(re.match(r".*Failed to synchronize cache", output_makecache, re.DOTALL) is None, msg = "dnf makecache failed to synchronize repo: %s" %(output_makecache))
         self.assertTrue(re.match(r".*Metadata cache created", output_makecache, re.DOTALL) is not None, msg = "dnf makecache failed: %s" %(output_makecache))
 
         output_repoinfo = self.dnf('repoinfo')
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 27cf584ea5..673b1998ac 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -3,6 +3,7 @@ from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqem
 from oeqa.core.decorator.oeid import OETestID
 import os
 import re
+import tempfile
 
 class TestExport(OESelftestTestCase):
 
@@ -143,7 +144,16 @@ class TestImage(OESelftestTestCase):
         # in at the start of the on-image test
         features += 'PACKAGE_FEED_URIS = "http://bogus_ip:bogus_port"\n'
         features += 'EXTRA_IMAGE_FEATURES += "package-management"\n'
-        features += 'PACKAGE_CLASSES = "package_rpm"'
+        features += 'PACKAGE_CLASSES = "package_rpm"\n'
+
+        # Enable package feed signing
+        self.gpg_home = tempfile.TemporaryDirectory(prefix="oeqa-feed-sign-")
+        signing_key_dir = os.path.join(self.testlayer_path, 'files', 'signing')
+        runCmd('gpg --batch --homedir %s --import %s' % (self.gpg_home.name, os.path.join(signing_key_dir, 'key.secret')))
+        features += 'INHERIT += "sign_package_feed"\n'
+        features += 'PACKAGE_FEED_GPG_NAME = "testuser"\n'
+        features += 'PACKAGE_FEED_GPG_PASSPHRASE_FILE = "%s"\n' % os.path.join(signing_key_dir, 'key.passphrase')
+        features += 'GPG_PATH = "%s"\n' % self.gpg_home.name
         self.write_config(features)
 
         # Build core-image-sato and testimage
-- 
2.12.3


