Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0354373163
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:37:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2016 03:37:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,520,1459839600"; d="scan'208";a="724410345"
Received: from skenned1-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.9.142])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2016 03:37:56 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 13:37:23 +0300
Message-Id: <1466764661-24544-11-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 10/28] oeqa.buildperf: method for measuring system resource usage
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
X-List-Received-Date: Fri, 24 Jun 2016 10:37:57 -0000

Extend BuildPerfTest class with a new method for measuring the system
resource usage of a shell command to BuildPerfTest class.  For now,
easurement of the elapsed time is done with the Gnu time utility,
similarly to the build-perf-test.sh shell script. And, it currently only
records the elapsed (wall clock).

The measured values (currently, only the elapsed time) is actually a
dictionary, making it possible to extend it with additional resource
values, e.g. cpu time or i/o usage, in the future.  In addition to the
actual values of the measurement each record contains a 'name' and
'legend' where name is supposed to function as a common key or id over
test runs, making comparison and trending easier, for example. Legend is
supposed to be a short human readable description.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 64 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 3ef0384..d608061 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -10,11 +10,14 @@
 # more details.
 #
 """Build performance test base classes and functionality"""
+import glob
 import logging
 import os
+import re
 import shutil
+import tempfile
 import time
-from datetime import datetime
+from datetime import datetime, timedelta
 
 from oeqa.utils.commands import runCmd, get_bb_vars
 
@@ -55,8 +58,24 @@ class KernelDropCaches(object):
         runCmd(cmd, data=input_data)
 
 
+def time_cmd(cmd, **kwargs):
+    """TIme a command"""
+    with tempfile.NamedTemporaryFile(mode='w+') as tmpf:
+        timecmd = ['/usr/bin/time', '-v', '-o', tmpf.name]
+        if isinstance(cmd, str):
+            timecmd = ' '.join(timecmd) + ' '
+        timecmd += cmd
+        # TODO: 'ignore_status' could/should be removed when globalres.log is
+        # deprecated. The function would just raise an exception, instead
+        ret = runCmd(timecmd, ignore_status=True, **kwargs)
+        timedata = tmpf.file.read()
+    return ret, timedata
+
+
 class BuildPerfTest(object):
     """Base class for build performance tests"""
+    SYSRES = 'sysres'
+
     name = None
     description = None
 
@@ -73,6 +92,10 @@ class BuildPerfTest(object):
         if not self.name:
             self.name = self.__class__.__name__
         self.bb_vars = get_bb_vars()
+        # TODO: remove the _failed flag when globalres.log is ditched as all
+        # failures should raise an exception
+        self._failed = False
+        self.cmd_log = os.path.join(self.out_dir, 'commands.log')
 
     def run(self):
         """Run test"""
@@ -82,12 +105,49 @@ class BuildPerfTest(object):
         self.results['elapsed_time'] = (datetime.now() -
                                         self.results['start_time'])
         # Test is regarded as completed if it doesn't raise an exception
-        self.results['status'] = 'COMPLETED'
+        if not self._failed:
+            self.results['status'] = 'COMPLETED'
 
     def _run(self):
         """Actual test payload"""
         raise NotImplementedError
 
+    def measure_cmd_resources(self, cmd, name, legend):
+        """Measure system resource usage of a command"""
+        def str_time_to_timedelta(strtime):
+            """Convert time strig from the time utility to timedelta"""
+            split = strtime.split(':')
+            hours = int(split[0]) if len(split) > 2 else 0
+            mins = int(split[-2])
+            secs, frac = split[-1].split('.')
+            secs = int(secs)
+            microsecs = int(float('0.' + frac) * pow(10, 6))
+            return timedelta(0, hours*3600 + mins*60 + secs, microsecs)
+
+        cmd_str = cmd if isinstance(cmd, str) else ' '.join(cmd)
+        log.info("Timing command: %s", cmd_str)
+        with open(self.cmd_log, 'a') as fobj:
+            ret, timedata = time_cmd(cmd, stdout=fobj)
+        if ret.status:
+            log.error("Time will be reported as 0. Command failed: %s",
+                      ret.status)
+            etime = timedelta(0)
+            self._failed = True
+        else:
+            match = re.search(r'.*wall clock.*: (?P<etime>.*)\n', timedata)
+            etime = str_time_to_timedelta(match.group('etime'))
+
+        measurement = {'type': self.SYSRES,
+                       'name': name,
+                       'legend': legend}
+        measurement['values'] = {'elapsed_time': etime}
+        self.results['measurements'].append(measurement)
+        nlogs = len(glob.glob(self.out_dir + '/results.log*'))
+        results_log = os.path.join(self.out_dir,
+                                   'results.log.{}'.format(nlogs + 1))
+        with open(results_log, 'w') as fobj:
+            fobj.write(timedata)
+
     @staticmethod
     def force_rm(path):
         """Equivalent of 'rm -rf'"""
-- 
2.6.6


