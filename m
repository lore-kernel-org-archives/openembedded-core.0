Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id AC60771B1F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 14:54:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 27 Jan 2017 06:54:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,295,1477983600"; d="scan'208";a="1118665706"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jan 2017 06:54:54 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 16:54:53 +0200
Message-Id: <20170127145453.22738-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] oeqa/buildperf: don't archive stdout/stderr of commands
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
X-List-Received-Date: Fri, 27 Jan 2017 14:54:55 -0000

Stop capturing output of the shell commands into <test>/commands.log.
Redirecting output into a file prevented the unittest framework from
capturing it, causing useless errors (with empty output) like:
oeqa.utils.CommandError: Command '['bitbake', 'core-image-sato']'
returned non-zero exit status 1 with output:

In general, the console output of commands is only interesting when
something fails. Also, dropping the commands.log file is a huge saving
in disk space, and thus, repository size when results are archived in
Git.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py       | 29 +++++++++--------------------
 meta/lib/oeqa/buildperf/test_basic.py | 10 +++++-----
 2 files changed, 14 insertions(+), 25 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 975524c..dd473a0 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -163,8 +163,6 @@ class BuildPerfTestResult(unittest.TextTestResult):
                                        ('status', status),
                                        ('start_time', test.start_time),
                                        ('elapsed_time', test.elapsed_time),
-                                       ('cmd_log_file', os.path.relpath(test.cmd_log_file,
-                                                                        self.out_dir)),
                                        ('measurements', test.measurements)])
             if status in ('ERROR', 'FAILURE', 'EXPECTED_FAILURE'):
                 test_result['message'] = str(test.err[1])
@@ -268,18 +266,13 @@ class BuildPerfTestCase(unittest.TestCase):
     def out_dir(self):
         return os.path.join(self.base_dir, self.name)
 
-    @property
-    def cmd_log_file(self):
-        return os.path.join(self.out_dir, 'commands.log')
-
     def shortDescription(self):
         return super(BuildPerfTestCase, self).shortDescription() or ""
 
     def setUp(self):
         """Set-up fixture for each test"""
         if self.build_target:
-            self.log_cmd_output(['bitbake', self.build_target,
-                                 '-c', 'fetchall'])
+            self.run_cmd(['bitbake', self.build_target, '-c', 'fetchall'])
 
     def run(self, *args, **kwargs):
         """Run test"""
@@ -287,13 +280,12 @@ class BuildPerfTestCase(unittest.TestCase):
         super(BuildPerfTestCase, self).run(*args, **kwargs)
         self.elapsed_time = datetime.now() - self.start_time
 
-    def log_cmd_output(self, cmd):
-        """Run a command and log it's output"""
+    def run_cmd(self, cmd):
+        """Convenience method for running a command"""
         cmd_str = cmd if isinstance(cmd, str) else ' '.join(cmd)
         log.info("Logging command: %s", cmd_str)
         try:
-            with open(self.cmd_log_file, 'a') as fobj:
-                runCmd2(cmd, stdout=fobj)
+            runCmd2(cmd)
         except CommandError as err:
             log.error("Command failed: %s", err.retcode)
             raise
@@ -338,17 +330,14 @@ class BuildPerfTestCase(unittest.TestCase):
         log.info("Timing command: %s", cmd_str)
         data_q = SimpleQueue()
         try:
-            with open(self.cmd_log_file, 'a') as fobj:
-                proc = Process(target=_worker, args=(data_q, cmd,),
-                               kwargs={'stdout': fobj})
-                proc.start()
-                data = data_q.get()
-                proc.join()
+            proc = Process(target=_worker, args=(data_q, cmd,))
+            proc.start()
+            data = data_q.get()
+            proc.join()
             if isinstance(data, Exception):
                 raise data
         except CommandError:
-            log.error("Command '%s' failed, see %s for more details", cmd_str,
-                      self.cmd_log_file)
+            log.error("Command '%s' failed", cmd_str)
             raise
         etime = data['elapsed_time']
 
diff --git a/meta/lib/oeqa/buildperf/test_basic.py b/meta/lib/oeqa/buildperf/test_basic.py
index 7a48c1e..897c3fc 100644
--- a/meta/lib/oeqa/buildperf/test_basic.py
+++ b/meta/lib/oeqa/buildperf/test_basic.py
@@ -38,8 +38,8 @@ class Test1P2(BuildPerfTestCase):
     def test12(self):
         """Measure bitbake virtual/kernel"""
         # Build and cleans state in order to get all dependencies pre-built
-        self.log_cmd_output(['bitbake', self.build_target])
-        self.log_cmd_output(['bitbake', self.build_target, '-c', 'cleansstate'])
+        self.run_cmd(['bitbake', self.build_target])
+        self.run_cmd(['bitbake', self.build_target, '-c', 'cleansstate'])
 
         self.sync()
         self.measure_cmd_resources(['bitbake', self.build_target], 'build',
@@ -74,7 +74,7 @@ class Test2(BuildPerfTestCase):
     def test2(self):
         """Measure bitbake core-image-sato -c rootfs with sstate"""
         # Build once in order to populate sstate cache
-        self.log_cmd_output(['bitbake', self.build_target])
+        self.run_cmd(['bitbake', self.build_target])
 
         self.rm_tmp()
         self.rm_cache()
@@ -106,8 +106,8 @@ class Test4(BuildPerfTestCase):
 
     def test4(self):
         """eSDK metrics"""
-        self.log_cmd_output("bitbake {} -c do_populate_sdk_ext".format(
-            self.build_target))
+        self.run_cmd(['bitbake', '-c', 'do_populate_sdk_ext',
+                     self.build_target])
         self.bb_vars = get_bb_vars(None, self.build_target)
         tmp_dir = self.bb_vars['TMPDIR']
         installer = os.path.join(
-- 
2.10.2


