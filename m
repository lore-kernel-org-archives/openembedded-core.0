Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 38A946FF60
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 07:33:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 00:33:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,580,1464678000"; d="scan'208";a="1020615519"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 26 Aug 2016 00:33:16 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 10:33:10 +0300
Message-Id: <1472196791-24336-4-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472196791-24336-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472196791-24336-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 3/4] oeqa.buildperf: treat failed measurements as errors
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
X-List-Received-Date: Fri, 26 Aug 2016 07:33:15 -0000

Now failed measurements correctly cause a test failure (recorded as an
error). There should be no need to continue the test if one step fails,
especially now that the tests don't depend on each other.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 36 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 83439f1..dbc534e 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -75,9 +75,7 @@ def time_cmd(cmd, **kwargs):
         if isinstance(cmd, str):
             timecmd = ' '.join(timecmd) + ' '
         timecmd += cmd
-        # TODO: 'ignore_status' could/should be removed when globalres.log is
-        # deprecated. The function would just raise an exception, instead
-        ret = runCmd2(timecmd, ignore_status=True, **kwargs)
+        ret = runCmd2(timecmd, **kwargs)
         timedata = tmpf.file.read()
     return ret, timedata
 
@@ -315,16 +313,15 @@ class BuildPerfTestCase(unittest.TestCase):
         cmd_str = cmd if isinstance(cmd, str) else ' '.join(cmd)
         log.info("Timing command: %s", cmd_str)
         cmd_log = os.path.join(self.out_dir, 'commands.log')
-        with open(cmd_log, 'a') as fobj:
-            ret, timedata = time_cmd(cmd, stdout=fobj)
-        if ret.status:
-            log.error("Time will be reported as 0. Command failed: %s",
-                      ret.status)
-            etime = timedelta(0)
-            self._failed = True
-        else:
-            match = re.search(r'.*wall clock.*: (?P<etime>.*)\n', timedata)
-            etime = str_time_to_timedelta(match.group('etime'))
+        try:
+            with open(cmd_log, 'a') as fobj:
+                ret, timedata = time_cmd(cmd, stdout=fobj)
+        except CommandError:
+            log.error("Command '%s' failed, see %s for more details", cmd_str,
+                      cmd_log)
+            raise
+        match = re.search(r'.*wall clock.*: (?P<etime>.*)\n', timedata)
+        etime = str_time_to_timedelta(match.group('etime'))
 
         measurement = {'type': self.SYSRES,
                        'name': name,
@@ -344,16 +341,9 @@ class BuildPerfTestCase(unittest.TestCase):
 
     def measure_disk_usage(self, path, name, legend):
         """Estimate disk usage of a file or directory"""
-        # TODO: 'ignore_status' could/should be removed when globalres.log is
-        # deprecated. The function would just raise an exception, instead
-        ret = runCmd2(['du', '-s', path], ignore_status=True)
-        if ret.status:
-            log.error("du failed, disk usage will be reported as 0")
-            size = 0
-            self._failed = True
-        else:
-            size = int(ret.output.split()[0])
-            log.debug("Size of %s path is %s", path, size)
+        ret = runCmd2(['du', '-s', path])
+        size = int(ret.output.split()[0])
+        log.debug("Size of %s path is %s", path, size)
         measurement = {'type': self.DISKUSAGE,
                        'name': name,
                        'legend': legend}
-- 
2.6.6


