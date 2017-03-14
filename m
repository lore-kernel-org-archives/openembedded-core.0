Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0AF4F7783D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 17:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489512527; x=1521048527;
	h=from:to:cc:subject:date:message-id;
	bh=bu1pMoKBKKYFITH+kcTP0fBFVulfW/r2E/uQJJ4JZIM=;
	b=qzM1d0KYMT4+xvN4dsDGZinfzgpVNdgCYynW8DPTn5eq0wicEf6g4y3K
	mhe2abqeG5oYBY6Jg1z0EOMpe7HsPg==;
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Mar 2017 10:28:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,165,1486454400"; d="scan'208";a="67345905"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 14 Mar 2017 10:28:45 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Mar 2017 19:27:47 +0200
Message-Id: <20170314172749.6643-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/3] rpm: add support for remote package feeds via PACKAGE_FEED_URIS variable
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
X-List-Received-Date: Tue, 14 Mar 2017 17:28:46 -0000

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
 meta-selftest/lib/oeqa/runtime/cases/selftest.py | 35 ++++++++++++++++++++++++
 meta/lib/oe/package_manager.py                   | 12 +++++++-
 meta/lib/oeqa/selftest/runtime-test.py           |  5 ++++
 3 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/lib/oeqa/runtime/cases/selftest.py b/meta-selftest/lib/oeqa/runtime/cases/selftest.py
index 19de7406236..e872ed85b12 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/selftest.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/selftest.py
@@ -1,5 +1,7 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
+from oeqa.runtime.cases.dnf import DnfTest
+from oeqa.utils.httpserver import HTTPService
 
 class Selftest(OERuntimeTestCase):
 
@@ -29,3 +31,36 @@ class Selftest(OERuntimeTestCase):
 
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
+        cls.repo_server.port = 8080
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
+        import re
+
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
index e8b483d7f8b..d23cb7cf46f 100644
--- a/meta/lib/oeqa/selftest/runtime-test.py
+++ b/meta/lib/oeqa/selftest/runtime-test.py
@@ -108,14 +108,19 @@ class TestImage(oeSelfTest):
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
+        features += 'PACKAGE_FEED_URIS = "http://192.168.7.1:8080"\n'
+        features += 'EXTRA_IMAGE_FEATURES += "package-management"\n'
+        features += 'PACKAGE_CLASSES = "package_rpm"'
         self.write_config(features)
 
         # Build core-image-sato and testimage
-- 
2.11.0


