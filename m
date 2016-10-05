Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 964CE71A6E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 13:29:54 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 05 Oct 2016 06:29:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,449,1473145200"; d="scan'208";a="769127754"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Oct 2016 06:29:52 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Oct 2016 16:29:49 +0300
Message-Id: <1475674189-14766-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH v2] oeqa.buildperf: measure apparent size instead of real disk usage
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
X-List-Received-Date: Wed, 05 Oct 2016 13:29:55 -0000

This change aligns disk usage measurements of the eSDK test with the old
build-perf-test.sh script. And thus, also makes the results between the
old and the new script comparable.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py       | 9 +++++++--
 meta/lib/oeqa/buildperf/test_basic.py | 6 ++++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 2c10255..59dd025 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -408,9 +408,14 @@ class BuildPerfTestCase(unittest.TestCase):
                                                       int((e_sec % 3600) / 60),
                                                        e_sec % 60))
 
-    def measure_disk_usage(self, path, name, legend):
+    def measure_disk_usage(self, path, name, legend, apparent_size=False):
         """Estimate disk usage of a file or directory"""
-        ret = runCmd2(['du', '-s', path])
+        cmd = ['du', '-s', '--block-size', '1024']
+        if apparent_size:
+            cmd.append('--apparent-size')
+        cmd.append(path)
+
+        ret = runCmd2(cmd)
         size = int(ret.output.split()[0])
         log.debug("Size of %s path is %s", path, size)
         measurement = {'type': self.DISKUSAGE,
diff --git a/meta/lib/oeqa/buildperf/test_basic.py b/meta/lib/oeqa/buildperf/test_basic.py
index e448ed1..7a48c1e 100644
--- a/meta/lib/oeqa/buildperf/test_basic.py
+++ b/meta/lib/oeqa/buildperf/test_basic.py
@@ -114,7 +114,8 @@ class Test4(BuildPerfTestCase):
             self.bb_vars['SDK_DEPLOY'],
             self.bb_vars['TOOLCHAINEXT_OUTPUTNAME'] + '.sh')
         # Measure installer size
-        self.measure_disk_usage(installer, 'installer_bin', 'eSDK installer')
+        self.measure_disk_usage(installer, 'installer_bin', 'eSDK installer',
+                                apparent_size=True)
         # Measure deployment time and deployed size
         deploy_dir = os.path.join(tmp_dir, 'esdk-deploy')
         if os.path.exists(deploy_dir):
@@ -122,4 +123,5 @@ class Test4(BuildPerfTestCase):
         self.sync()
         self.measure_cmd_resources([installer, '-y', '-d', deploy_dir],
                                    'deploy', 'eSDK deploy')
-        self.measure_disk_usage(deploy_dir, 'deploy_dir', 'deploy dir')
+        self.measure_disk_usage(deploy_dir, 'deploy_dir', 'deploy dir',
+                                apparent_size=True)
-- 
2.6.6


