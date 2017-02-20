Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9786362133
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:51:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 20 Feb 2017 10:51:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,187,1484035200"; d="scan'208";a="1100302754"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 20 Feb 2017 10:51:59 -0800
Received: from localhost.zpn.intel.com (unknown [10.219.4.140])
	by linux.intel.com (Postfix) with ESMTP id 3D3286A4080;
	Mon, 20 Feb 2017 10:51:59 -0800 (PST)
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Feb 2017 12:54:52 -0600
Message-Id: <6ffca9715a250277407dba45b26d22b819153f17.1487616539.git.humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1487616539.git.humberto.ibarra.lopez@intel.com>
References: <cover.1487616539.git.humberto.ibarra.lopez@intel.com>
Subject: [PATCH 1/1] selftest/runtime-test.py: Add test to check PACKAGE_FEED_URIS var
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
X-List-Received-Date: Mon, 20 Feb 2017 18:52:00 -0000

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

[YOCTO #10872]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 meta-selftest/lib/oeqa/runtime/cases/selftest.py | 32 ++++++++++++++++++++++++
 meta/lib/oeqa/selftest/runtime-test.py           |  3 +++
 2 files changed, 35 insertions(+)

diff --git a/meta-selftest/lib/oeqa/runtime/cases/selftest.py b/meta-selftest/lib/oeqa/runtime/cases/selftest.py
index 329470f..e49d028 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/selftest.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/selftest.py
@@ -1,5 +1,8 @@
+from oeqa.utils.httpserver import HTTPService
+
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
+from oeqa.runtime.cases.smart import SmartTest
 
 class Selftest(OERuntimeTestCase):
 
@@ -29,3 +32,32 @@ class Selftest(OERuntimeTestCase):
 
         (status, output) = self.target.run("socat -V")
         self.assertNotEqual(status, 0, msg="socat is still installed")
+
+class SmartSelftest(SmartTest):
+
+    @classmethod
+    def setUpClass(cls):
+        cls.repolist = []
+        cls.repo_server = HTTPService(os.path.join(cls.tc.td['WORKDIR'], 'rpms'),
+                                      cls.tc.target.server_ip)
+        cls.repo_server.port = 8080
+        cls.repo_server.start()
+
+    @classmethod
+    def tearDownClass(cls):
+        cls.repo_server.stop()
+        for repo in cls.repolist:
+            cls.tc.target.run('smart channel -y --remove %s' % repo)
+
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_verify_package_feeds(self):
+        """
+        Summary: Check correct setting of PACKAGE_FEED_URIS var
+        Expected: 1. Feeds were correctly set for smart
+                  2. Update recovers packages from host's repo
+        Author: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
+        """
+        output = self.smart('update')
+        import re
+        new_pkgs = re.match(r".*Channels have [0-9]+ new packages", output, re.DOTALL)
+        self.assertTrue(new_pkgs is not None, msg = "couldn't update packages")
diff --git a/meta/lib/oeqa/selftest/runtime-test.py b/meta/lib/oeqa/selftest/runtime-test.py
index 52e5b27..d96290e 100644
--- a/meta/lib/oeqa/selftest/runtime-test.py
+++ b/meta/lib/oeqa/selftest/runtime-test.py
@@ -111,6 +111,9 @@ class TestImage(oeSelfTest):
 
         features = 'INHERIT += "testimage"\n'
         features += 'TEST_SUITES = "ping ssh selftest"\n'
+        features += 'PACKAGE_FEED_URIS = "http://192.168.7.1:8080"\n'
+        features += 'EXTRA_IMAGE_FEATURES += "package-management"\n'
+        features += 'PACKAGE_CLASSES = "package_rpm"'
         self.write_config(features)
 
         # Build core-image-sato and testimage
-- 
2.7.4


