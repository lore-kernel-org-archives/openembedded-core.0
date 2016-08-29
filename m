Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B3EFD6612D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 19:49:14 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 29 Aug 2016 12:49:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,252,1470726000"; d="scan'208";a="872304343"
Received: from dthoumin-mobl2.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.6.138])
	by orsmga003.jf.intel.com with ESMTP; 29 Aug 2016 12:49:10 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 22:48:31 +0300
Message-Id: <1472500111-12358-13-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472500111-12358-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472500111-12358-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 12/12] oeqa.buildperf: include commands log file name in results.json
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
X-List-Received-Date: Mon, 29 Aug 2016 19:49:16 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 0b2c0f8..be3a946 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -220,6 +220,8 @@ class BuildPerfTestResult(unittest.TextTestResult):
                                 'status': status,
                                 'start_time': test.start_time,
                                 'elapsed_time': test.elapsed_time,
+                                'cmd_log_file': os.path.relpath(test.cmd_log_file,
+                                                                self.out_dir),
                                 'measurements': test.measurements}
         results['tests'] = tests
 
@@ -312,6 +314,10 @@ class BuildPerfTestCase(unittest.TestCase):
     def out_dir(self):
         return os.path.join(self.base_dir, self.name)
 
+    @property
+    def cmd_log_file(self):
+        return os.path.join(self.out_dir, 'commands.log')
+
     def setUp(self):
         """Set-up fixture for each test"""
         if self.build_target:
@@ -328,9 +334,8 @@ class BuildPerfTestCase(unittest.TestCase):
         """Run a command and log it's output"""
         cmd_str = cmd if isinstance(cmd, str) else ' '.join(cmd)
         log.info("Logging command: %s", cmd_str)
-        cmd_log = os.path.join(self.out_dir, 'commands.log')
         try:
-            with open(cmd_log, 'a') as fobj:
+            with open(self.cmd_log_file, 'a') as fobj:
                 runCmd2(cmd, stdout=fobj)
         except CommandError as err:
             log.error("Command failed: %s", err.retcode)
@@ -368,9 +373,8 @@ class BuildPerfTestCase(unittest.TestCase):
         cmd_str = cmd if isinstance(cmd, str) else ' '.join(cmd)
         log.info("Timing command: %s", cmd_str)
         data_q = SimpleQueue()
-        cmd_log = os.path.join(self.out_dir, 'commands.log')
         try:
-            with open(cmd_log, 'a') as fobj:
+            with open(self.cmd_log_file, 'a') as fobj:
                 proc = Process(target=_worker, args=(data_q, cmd,),
                                kwargs={'stdout': fobj})
                 proc.start()
@@ -380,7 +384,7 @@ class BuildPerfTestCase(unittest.TestCase):
                 raise data
         except CommandError:
             log.error("Command '%s' failed, see %s for more details", cmd_str,
-                      cmd_log)
+                      self.cmd_log_file)
             raise
         etime = data['elapsed_time']
 
-- 
2.6.6


