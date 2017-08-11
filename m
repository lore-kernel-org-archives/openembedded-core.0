Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AFF7478270
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 10:52:06 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Aug 2017 03:52:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,357,1498546800"; d="scan'208";a="1002559077"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga003.jf.intel.com with ESMTP; 11 Aug 2017 03:52:07 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2017 13:51:59 +0300
Message-Id: <4eb7062b1b49a2e67dd84a274e371234021b3ce5.1502447434.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1502447434.git.markus.lehtonen@linux.intel.com>
References: <cover.1502447434.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH 5/5] dnf: expand dnf selftest to test signed package feeds
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
X-List-Received-Date: Fri, 11 Aug 2017 10:52:06 -0000

[YOCTO #12099]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta-selftest/files/signing/key.passphrase          |  1 +
 meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py | 12 ++++++++++++
 meta/lib/oeqa/selftest/cases/runtime_test.py        | 13 ++++++++++++-
 3 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta-selftest/files/signing/key.passphrase

diff --git a/meta-selftest/files/signing/key.passphrase b/meta-selftest/files/signing/key.passphrase
new file mode 100644
index 0000000000..5271a52680
--- /dev/null
+++ b/meta-selftest/files/signing/key.passphrase
@@ -0,0 +1 @@
+test123
diff --git a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
index 68e56f2c5e..3a299c75f6 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
@@ -31,12 +31,24 @@ class DnfSelftest(DnfTest):
         temp_file = os.path.join(self.temp_dir.name, 'tmp.repo')
         self.tc.target.copyFrom("/etc/yum.repos.d/oe-remote-repo.repo", temp_file)
         fixed_config = open(temp_file, "r").read().replace("bogus_ip", self.tc.target.server_ip).replace("bogus_port", str(self.repo_server.port))
+        fixed_config += 'repo_gpgcheck=1\n'
         with open(temp_file, "w") as f:
             f.write(fixed_config)
         self.tc.target.copyTo(temp_file, "/etc/yum.repos.d/oe-remote-repo.repo")
 
+        # First try should fail as the gpg pubkey is not available for dnf
         import re
         output_makecache = self.dnf('makecache')
+        self.assertTrue(re.match(r".*Failed to synchronize cache", output_makecache, re.DOTALL) is not None, msg = "dnf makecache should have failed: %s" %(output_makecache))
+
+        # Add public key to dnf config -> now we should succeed
+        fixed_config += 'gpgkey=file:///etc/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-%s\n' % self.tc.td['DISTRO_VERSION']
+        with open(temp_file, "w") as f:
+            f.write(fixed_config)
+        self.tc.target.copyTo(temp_file, "/etc/yum.repos.d/oe-remote-repo.repo")
+
+        output_makecache = self.dnf('-y makecache')
+        self.assertTrue(re.match(r".*Failed to synchronize cache", output_makecache, re.DOTALL) is None, msg = "dnf makecache failed to synchronize repo: %s" %(output_makecache))
         self.assertTrue(re.match(r".*Metadata cache created", output_makecache, re.DOTALL) is not None, msg = "dnf makecache failed: %s" %(output_makecache))
 
         output_repoinfo = self.dnf('repoinfo')
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 07d05b5972..e603c71f90 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -3,6 +3,7 @@ from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqem
 from oeqa.core.decorator.oeid import OETestID
 import os
 import re
+import tempfile
 
 class TestExport(OESelftestTestCase):
 
@@ -143,7 +144,17 @@ class TestImage(OESelftestTestCase):
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
+        features += 'IMAGE_INSTALL_append  = "signing-keys-packagefeed"\n'
         self.write_config(features)
 
         # Build core-image-sato and testimage
-- 
2.12.3


