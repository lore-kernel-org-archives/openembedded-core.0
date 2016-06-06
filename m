Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4EB2F7710C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 15:21:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 06 Jun 2016 08:21:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,427,1459839600"; d="scan'208";a="714707626"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Jun 2016 08:21:11 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jun 2016 07:15:44 +0000
Message-Id: <46f86b1e8f7f9c886299f3a13797993c84a98957.1465196934.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1465196934.git.mariano.lopez@linux.intel.com>
References: <cover.1465196934.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1465196934.git.mariano.lopez@linux.intel.com>
References: <cover.1465196934.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv2 6/7] testexport.bbclass: Add support for testexport-tarball
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
X-List-Received-Date: Mon, 06 Jun 2016 15:21:10 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Add support to export the SDK tarball needed when a test
system doesn't have the required software to perform runtime
tests.

The support is when exporting the test and when running
the test on a remote system. The user of this feature just
need to set TEST_EXPORT_SDK_ENABLED to "1" and declare
the sdk packages in TEST_EXPORT_SDK_PACKAGES.

[YOCTO #7850]

(From OE-Core rev: a6041f81b81baa7564e4c712fc88de2b997e52e4)

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testexport.bbclass | 16 ++++++++++++++++
 meta/lib/oeqa/runexported.py    | 35 ++++++++++++++++++++++++++++++++++-
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index a320880..6009349 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -23,8 +23,14 @@ TEST_TARGET ?= "simpleremote"
 TEST_TARGET_IP ?= ""
 TEST_SERVER_IP ?= ""
 
+TEST_EXPORT_SDK_PACKAGES ?= ""
+TEST_EXPORT_SDK_ENABLED ?= "0"
+TEST_EXPORT_SDK_NAME ?= "testexport-tools-nativesdk"
+TEST_EXPORT_SDK_DIR ?= "sdk"
+
 TEST_EXPORT_DEPENDS = ""
 TEST_EXPORT_DEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:do_populate_sysroot', '', d)}"
+TEST_EXPORT_DEPENDS += "${@bb.utils.contains('TEST_EXPORT_SDK_ENABLED', '1', 'testexport-tarball:do_populate_sdk', '', d)}"
 TEST_EXPORT_LOCK = "${TMPDIR}/testimage.lock"
 
 python do_testexport() {
@@ -136,6 +142,16 @@ def exportTests(d,tc):
             dst_f = os.path.join(export_pkg_dir, root.replace(test_pkg_dir, "").lstrip("/"), f)
             shutil.copy2(src_f, dst_f)
 
+    # Copy SDK
+    if d.getVar("TEST_EXPORT_SDK_ENABLED", True) == "1":
+        sdk_deploy = d.getVar("SDK_DEPLOY", True)
+        tarball_name = "%s.sh" % d.getVar("TEST_EXPORT_SDK_NAME", True)
+        tarball_path = os.path.join(sdk_deploy, tarball_name)
+        export_sdk_dir = os.path.join(d.getVar("TEST_EXPORT_DIR", True),
+                                      d.getVar("TEST_EXPORT_SDK_DIR", True))
+        bb.utils.mkdirhier(export_sdk_dir)
+        shutil.copy2(tarball_path, export_sdk_dir)
+
     bb.plain("Exported tests to: %s" % exportpath)
 
 def testexport_main(d):
diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index f1366a6..5886739 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -31,8 +31,8 @@ except ImportError:
 sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "oeqa")))
 
 from oeqa.oetest import ExportTestContext
+from oeqa.utils.commands import runCmd
 from oeqa.utils.sshcontrol import SSHControl
-from oeqa.utils.dump import get_host_dumper
 
 # this isn't pretty but we need a fake target object
 # for running the tests externally as we don't care
@@ -107,6 +107,8 @@ def main():
         if not os.path.isdir(d["DEPLOY_DIR"]):
             print("WARNING: The path to DEPLOY_DIR does not exist: %s" % d["DEPLOY_DIR"])
 
+    extract_sdk(d)
+
     target = FakeTarget(d)
     for key in loaded["target"].keys():
         setattr(target, key, loaded["target"][key])
@@ -118,6 +120,37 @@ def main():
 
     return 0
 
+def extract_sdk(d):
+    """
+    Extract SDK if needed
+    """
+
+    export_dir = os.path.dirname(os.path.realpath(__file__))
+    tools_dir = d.getVar("TEST_EXPORT_SDK_DIR", True)
+    tarball_name = "%s.sh" % d.getVar("TEST_EXPORT_SDK_NAME", True)
+    tarball_path = os.path.join(export_dir, tools_dir, tarball_name)
+    extract_path = os.path.join(export_dir, "sysroot")
+    if os.path.isfile(tarball_path):
+        print ("Found SDK tarball %s. Extracting..." % tarball_path)
+        result = runCmd("%s -y -d %s" % (tarball_path, extract_path))
+        for f in os.listdir(extract_path):
+            if f.startswith("environment-setup"):
+                print("Setting up SDK environment...")
+                env_file = os.path.join(extract_path, f)
+                update_env(env_file)
+
+def update_env(env_file):
+    """
+    Source a file and update environment
+    """
+
+    cmd = ". %s; env -0" % env_file
+    result = runCmd(cmd)
+
+    for line in result.output.split("\0"):
+        (key, _, value) = line.partition("=")
+        os.environ[key] = value
+
 if __name__ == "__main__":
     try:
         ret = main()
-- 
2.6.6


