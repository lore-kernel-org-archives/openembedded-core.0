Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 0E577780CB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 17:15:21 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 05 Jun 2017 10:15:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,302,1493708400"; d="scan'208";a="111121135"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 05 Jun 2017 10:15:22 -0700
Received: from localhost.zpn.intel.com (unknown [10.219.4.140])
	by linux.intel.com (Postfix) with ESMTP id 949B95805CF;
	Mon,  5 Jun 2017 10:15:21 -0700 (PDT)
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Jun 2017 12:19:34 -0500
Message-Id: <55f37bf3fbaedb7d1f6d8ebf4278249ec996f69f.1496682874.git.humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.7.5
In-Reply-To: <cover.1496682874.git.humberto.ibarra.lopez@intel.com>
References: <cover.1496682874.git.humberto.ibarra.lopez@intel.com>
Subject: [PATCH 1/1] runtime-test.py: Split different tests inside selftest.py
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
X-List-Received-Date: Mon, 05 Jun 2017 17:15:22 -0000

There were two completely different tests inside selftest.py,
and the only reason for them to be together was that both needed
the same mechanism to execute (run testimage from within selftest)

This fixes the design issue and error-prone situation by separating
these tests. In add a new module for dnf-runtime and also has an
extra time added to running the tests, but it is minimal since
the builds reuse data from previuous build.

[YOCTO #11436]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 .../lib/oeqa/runtime/cases/dnf-runtime.py          | 42 ++++++++++++++++++++++
 meta-selftest/lib/oeqa/runtime/cases/selftest.py   | 42 ----------------------
 meta/lib/oeqa/selftest/runtime-test.py             | 20 +++++++++--
 3 files changed, 60 insertions(+), 44 deletions(-)
 create mode 100644 meta-selftest/lib/oeqa/runtime/cases/dnf-runtime.py

diff --git a/meta-selftest/lib/oeqa/runtime/cases/dnf-runtime.py b/meta-selftest/lib/oeqa/runtime/cases/dnf-runtime.py
new file mode 100644
index 0000000..123e725
--- /dev/null
+++ b/meta-selftest/lib/oeqa/runtime/cases/dnf-runtime.py
@@ -0,0 +1,42 @@
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.runtime.cases.dnf import DnfTest
+from oeqa.utils.httpserver import HTTPService
+
+class DnfSelftest(DnfTest):
+
+    @classmethod
+    def setUpClass(cls):
+        cls.repo_server = HTTPService(os.path.join(cls.tc.td['WORKDIR'], 'oe-rootfs-repo'),
+                                      cls.tc.target.server_ip)
+        cls.repo_server.start()
+
+    @classmethod
+    def tearDownClass(cls):
+        cls.repo_server.stop()
+
+    @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
+    def test_verify_package_feeds(self):
+        """
+        Summary: Check correct setting of PACKAGE_FEED_URIS var
+        Expected: 1. Feeds were correctly set for dnf
+                  2. Update recovers packages from host's repo
+        Author: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
+        Author: Alexander Kanavin <alexander.kanavin@intel.com>
+        """
+        # When we created an image, we had to supply fake ip and port
+        # for the feeds. Now we can patch the real ones into the config file.
+        import tempfile
+        temp_file = tempfile.TemporaryDirectory(prefix="oeqa-remotefeeds-").name
+        self.tc.target.copyFrom("/etc/yum.repos.d/oe-remote-repo.repo", temp_file)
+        fixed_config = open(temp_file, "r").read().replace("bogus_ip", self.tc.target.server_ip).replace("bogus_port", str(self.repo_server.port))
+        open(temp_file, "w").write(fixed_config)
+        self.tc.target.copyTo(temp_file, "/etc/yum.repos.d/oe-remote-repo.repo")
+
+        import re
+        output_makecache = self.dnf('makecache')
+        self.assertTrue(re.match(r".*Metadata cache created", output_makecache, re.DOTALL) is not None, msg = "dnf makecache failed: %s" %(output_makecache))
+
+        output_repoinfo = self.dnf('repoinfo')
+        matchobj = re.match(r".*Repo-pkgs\s*:\s*(?P<n_pkgs>[0-9]+)", output_repoinfo, re.DOTALL)
+        self.assertTrue(matchobj is not None, msg = "Could not find the amount of packages in dnf repoinfo output: %s" %(output_repoinfo))
+        self.assertTrue(int(matchobj.group('n_pkgs')) > 0, msg = "Amount of remote packages is not more than zero: %s\n" %(output_repoinfo))
diff --git a/meta-selftest/lib/oeqa/runtime/cases/selftest.py b/meta-selftest/lib/oeqa/runtime/cases/selftest.py
index e4985a6..19de740 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/selftest.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/selftest.py
@@ -1,7 +1,5 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.runtime.cases.dnf import DnfTest
-from oeqa.utils.httpserver import HTTPService
 
 class Selftest(OERuntimeTestCase):
 
@@ -31,43 +29,3 @@ class Selftest(OERuntimeTestCase):
 
         (status, output) = self.target.run("socat -V")
         self.assertNotEqual(status, 0, msg="socat is still installed")
-
-
-class DnfSelftest(DnfTest):
-
-    @classmethod
-    def setUpClass(cls):
-        cls.repo_server = HTTPService(os.path.join(cls.tc.td['WORKDIR'], 'oe-rootfs-repo'),
-                                      cls.tc.target.server_ip)
-        cls.repo_server.start()
-
-    @classmethod
-    def tearDownClass(cls):
-        cls.repo_server.stop()
-
-    @OETestDepends(['ssh.SSHTest.test_ssh'])
-    def test_verify_package_feeds(self):
-        """
-        Summary: Check correct setting of PACKAGE_FEED_URIS var
-        Expected: 1. Feeds were correctly set for dnf
-                  2. Update recovers packages from host's repo
-        Author: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
-        Author: Alexander Kanavin <alexander.kanavin@intel.com>
-        """
-        # When we created an image, we had to supply fake ip and port
-        # for the feeds. Now we can patch the real ones into the config file.
-        import tempfile
-        temp_file = tempfile.TemporaryDirectory(prefix="oeqa-remotefeeds-").name
-        self.tc.target.copyFrom("/etc/yum.repos.d/oe-remote-repo.repo", temp_file)
-        fixed_config = open(temp_file, "r").read().replace("bogus_ip", self.tc.target.server_ip).replace("bogus_port", str(self.repo_server.port))
-        open(temp_file, "w").write(fixed_config)
-        self.tc.target.copyTo(temp_file, "/etc/yum.repos.d/oe-remote-repo.repo")
-
-        import re
-        output_makecache = self.dnf('makecache')
-        self.assertTrue(re.match(r".*Metadata cache created", output_makecache, re.DOTALL) is not None, msg = "dnf makecache failed: %s" %(output_makecache))
-
-        output_repoinfo = self.dnf('repoinfo')
-        matchobj = re.match(r".*Repo-pkgs\s*:\s*(?P<n_pkgs>[0-9]+)", output_repoinfo, re.DOTALL)
-        self.assertTrue(matchobj is not None, msg = "Could not find the amount of packages in dnf repoinfo output: %s" %(output_repoinfo))
-        self.assertTrue(int(matchobj.group('n_pkgs')) > 0, msg = "Amount of remote packages is not more than zero: %s\n" %(output_repoinfo))
diff --git a/meta/lib/oeqa/selftest/runtime-test.py b/meta/lib/oeqa/selftest/runtime-test.py
index 13a4c03..59cd758 100644
--- a/meta/lib/oeqa/selftest/runtime-test.py
+++ b/meta/lib/oeqa/selftest/runtime-test.py
@@ -108,16 +108,32 @@ class TestImage(oeSelfTest):
         Summary: Check install packages functionality for testimage/testexport.
         Expected: 1. Import tests from a directory other than meta.
                   2. Check install/uninstall of socat.
-                  3. Check that remote package feeds can be accessed
         Product: oe-core
         Author: Mariano Lopez <mariano.lopez@intel.com>
-        Author: Alexander Kanavin <alexander.kanavin@intel.com>
         """
         if get_bb_var('DISTRO') == 'poky-tiny':
             self.skipTest('core-image-full-cmdline not buildable for poky-tiny')
 
         features = 'INHERIT += "testimage"\n'
         features += 'TEST_SUITES = "ping ssh selftest"\n'
+        self.write_config(features)
+
+        # Build core-image-sato and testimage
+        bitbake('core-image-full-cmdline socat')
+        bitbake('-c testimage core-image-full-cmdline')
+
+    def test_testimage_dnf(self):
+        """
+        Summary: Check package feeds functionality for dnf
+        Expected: 1. Check that remote package feeds can be accessed
+        Product: oe-core
+        Author: Alexander Kanavin <alexander.kanavin@intel.com>
+        """
+        if get_bb_var('DISTRO') == 'poky-tiny':
+            self.skipTest('core-image-full-cmdline not buildable for poky-tiny')
+
+        features = 'INHERIT += "testimage"\n'
+        features += 'TEST_SUITES = "ping ssh dnf-runtime"\n'
         # We don't yet know what the server ip and port will be - they will be patched
         # in at the start of the on-image test
         features += 'PACKAGE_FEED_URIS = "http://bogus_ip:bogus_port"\n'
-- 
2.7.5


