Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6F14B77EA5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 16:22:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Oct 2017 09:22:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,477,1500966000"; d="scan'208";a="1178633343"
Received: from rbaldyga-mobl.ger.corp.intel.com (HELO
	jlock-mobl3.ger.corp.intel.com) ([10.252.24.204])
	by orsmga001.jf.intel.com with ESMTP; 04 Oct 2017 09:22:54 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Oct 2017 17:22:48 +0100
Message-Id: <20171004162248.6916-1-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] lib/oeqa/selftest/cases/gotoolchain: add selftest for the Go toolchain
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
X-List-Received-Date: Wed, 04 Oct 2017 16:22:54 -0000

Add a simple test case to being testing of the Go toolchain:
1) build meta-go-toolchain
2) create a temp directory and install the generated Go toolchain within
3) fetch an archive of the Go Dep tool
4) create an appropriately laid out GOROOT and inflate the dep archive there
5) build the dep command with the SDK's Go toolchain and check it returned
   successfully.

[YOCTO #12152]

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oeqa/selftest/cases/gotoolchain.py | 67 +++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/gotoolchain.py

diff --git a/meta/lib/oeqa/selftest/cases/gotoolchain.py b/meta/lib/oeqa/selftest/cases/gotoolchain.py
new file mode 100644
index 00000000000..1e23257f4de
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/gotoolchain.py
@@ -0,0 +1,67 @@
+import glob
+import os
+import shutil
+import tempfile
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import runCmd, bitbake, get_bb_vars
+
+
+class oeGoToolchainSelfTest(OESelftestTestCase):
+    """
+    Test cases for OE's Go toolchain
+    """
+
+    @staticmethod
+    def get_sdk_environment(tmpdir_SDKQA):
+        pattern = os.path.join(tmpdir_SDKQA, "environment-setup-*")
+        # FIXME: this is a very naive implementation
+        return glob.glob(pattern)[0]
+
+    @staticmethod
+    def get_sdk_toolchain():
+        bb_vars = get_bb_vars(['SDK_DEPLOY', 'TOOLCHAIN_OUTPUTNAME'],
+                              "meta-go-toolchain")
+        sdk_deploy = bb_vars['SDK_DEPLOY']
+        toolchain_name = bb_vars['TOOLCHAIN_OUTPUTNAME']
+        return os.path.join(sdk_deploy, toolchain_name + ".sh")
+
+    @classmethod
+    def setUpClass(cls):
+        super(oeGoToolchainSelfTest, cls).setUpClass()
+        cls.tmpdir_SDKQA = tempfile.mkdtemp(prefix='SDKQA')
+        cls.go_path = os.path.join(cls.tmpdir_SDKQA, "go")
+        # Build the SDK and locate it in DEPLOYDIR
+        bitbake("meta-go-toolchain")
+        cls.sdk_path = oeGoToolchainSelfTest.get_sdk_toolchain()
+        # Install the SDK into the tmpdir
+        runCmd("sh %s -y -d \"%s\"" % (cls.sdk_path, cls.tmpdir_SDKQA))
+        cls.env_SDK = oeGoToolchainSelfTest.get_sdk_environment(cls.tmpdir_SDKQA)
+
+    @classmethod
+    def tearDownClass(cls):
+        shutil.rmtree(cls.tmpdir_SDKQA, ignore_errors=True)
+        super(oeGoToolchainSelfTest, cls).tearDownClass()
+
+    def run_sdk_go_command(self, gocmd):
+        cmd = "cd %s; " % self.tmpdir_SDKQA
+        cmd = cmd + ". %s; " % self.env_SDK
+        cmd = cmd + "export GOPATH=%s; " % self.go_path
+        cmd = cmd + "${CROSS_COMPILE}go %s" % gocmd
+        return runCmd(cmd).status
+
+    def test_go_dep_build(self):
+        proj = "github.com/golang"
+        name = "dep"
+        ver = "v0.3.1"
+        archive = ".tar.gz"
+        url = "https://%s/%s/archive/%s%s" % (proj, name, ver, archive)
+
+        runCmd("cd %s; wget %s" % (self.tmpdir_SDKQA, url))
+        runCmd("cd %s; tar -xf %s" % (self.tmpdir_SDKQA, ver+archive))
+        runCmd("mkdir -p %s/src/%s" % (self.go_path, proj))
+        runCmd("mv %s/dep-0.3.1 %s/src/%s/%s"
+               % (self.tmpdir_SDKQA, self.go_path, proj, name))
+        retv = self.run_sdk_go_command('build  %s/%s/cmd/dep'
+                                       % (proj, name))
+        self.assertEqual(retv, 0,
+                         msg="Running go build failed for %s" % name)
-- 
2.13.6


