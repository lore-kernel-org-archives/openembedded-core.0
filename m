Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AD69A6E5FC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 13:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489670406; x=1521206406;
	h=from:to:cc:subject:date:message-id;
	bh=Drxz6H5pZ4drLaKU2NVBDfGx3MrKn/y5Ecsk23tLS+0=;
	b=p9gcS5WuMukKBDRgxT8M7GPqXksYdU41AePlLI2xBrjmzuESvu8MPWBs
	BhQlQGaBpdSgYtmND7GHdPgH5kex3g==;
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Mar 2017 06:20:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,172,1486454400"; d="scan'208";a="68021668"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 16 Mar 2017 06:20:04 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 15:19:04 +0200
Message-Id: <20170316131907.19844-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/4] rpm: add support for remote package feeds via PACKAGE_FEED_URIS variable
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
X-List-Received-Date: Thu, 16 Mar 2017 13:20:05 -0000

I've used a previous patch (which was never merged) by
Humberto Ibarra <humberto.ibarra.lopez@intel.com> as a model
for how to do runtime testing of this feature (e.g. we need to boot
an image, run dnf on it, and check that it is indeed able to
access the remote repo over http). Here's his original commit message:

=====
Testing that feeds specified with PACKAGE_FEED_URIS var are set
correctly has two parts. First a build with this var set is required,
and then smart update needs to be issued in the running taget.

The previous is not a common selftest practice because this is a
simple test, but requires building and running a specific image,
which takes a lot of time. testimage is not a good fit either,
since the images tested there do not have the PACKAGE_FEED_URIS
var set.

For this test, the runtime-test module is being used, which is a
selftest module but runs a testimage command. The var and test
environment were set in runtime-perf.py and the actual test is
done in a new testcase added to meta-selftest layer.
=====

[YOCTO #10872]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-selftest/lib/oeqa/runtime/cases/selftest.py | 42 ++++++++++++++++++++++++
 meta/lib/oe/package_manager.py                   | 12 ++++++-
 meta/lib/oeqa/selftest/runtime-test.py           |  7 ++++
 3 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/lib/oeqa/runtime/cases/selftest.py b/meta-selftest/lib/oeqa/runtime/cases/selftest.py
index 19de7406236..e4985a6edd3 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/selftest.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/selftest.py
@@ -1,5 +1,7 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
+from oeqa.runtime.cases.dnf import DnfTest
+from oeqa.utils.httpserver import HTTPService
 
 class Selftest(OERuntimeTestCase):
 
@@ -29,3 +31,43 @@ class Selftest(OERuntimeTestCase):
 
         (status, output) = self.target.run("socat -V")
         self.assertNotEqual(status, 0, msg="socat is still installed")
+
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
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
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
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index d51609189d0..b016bc32dc5 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -533,10 +533,20 @@ class RpmPM(PackageManager):
         bb.utils.unlockfile(lf)
 
     def insert_feeds_uris(self, feed_uris, feed_base_paths, feed_archs):
+        from urllib.parse import urlparse
+
         if feed_uris == "":
             return
 
-        raise NotImplementedError("Adding remote dnf feeds not yet supported.")
+        bb.utils.mkdirhier(oe.path.join(self.target_rootfs, "etc", "yum.repos.d"))
+        remote_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
+        for uri in remote_uris:
+            repo_name = "oe-remote-repo" + "-".join(urlparse(uri).path.split("/"))
+            if feed_archs is not None:
+                repo_uris = [uri + "/" + arch for arch in feed_archs]
+            else:
+                repo_uris = [uri]
+            open(oe.path.join(self.target_rootfs, "etc", "yum.repos.d", repo_name + ".repo"), 'w').write("[%s]\nbaseurl=%s\n" % (repo_name, " ".join(repo_uris)))
 
     def _prepare_pkg_transaction(self):
         os.environ['D'] = self.target_rootfs
diff --git a/meta/lib/oeqa/selftest/runtime-test.py b/meta/lib/oeqa/selftest/runtime-test.py
index e8b483d7f8b..171a37329f5 100644
--- a/meta/lib/oeqa/selftest/runtime-test.py
+++ b/meta/lib/oeqa/selftest/runtime-test.py
@@ -108,14 +108,21 @@ class TestImage(oeSelfTest):
         Summary: Check install packages functionality for testimage/testexport.
         Expected: 1. Import tests from a directory other than meta.
                   2. Check install/uninstall of socat.
+                  3. Check that remote package feeds can be accessed
         Product: oe-core
         Author: Mariano Lopez <mariano.lopez@intel.com>
+        Author: Alexander Kanavin <alexander.kanavin@intel.com>
         """
         if get_bb_var('DISTRO') == 'poky-tiny':
             self.skipTest('core-image-full-cmdline not buildable for poky-tiny')
 
         features = 'INHERIT += "testimage"\n'
         features += 'TEST_SUITES = "ping ssh selftest"\n'
+        # We don't yet know what the server ip and port will be - they will be patched
+        # in at the start of the on-image test
+        features += 'PACKAGE_FEED_URIS = "http://bogus_ip:bogus_port"\n'
+        features += 'EXTRA_IMAGE_FEATURES += "package-management"\n'
+        features += 'PACKAGE_CLASSES = "package_rpm"'
         self.write_config(features)
 
         # Build core-image-sato and testimage
-- 
2.11.0


