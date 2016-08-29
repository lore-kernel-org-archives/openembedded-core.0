Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6B93E60797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 19:48:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 29 Aug 2016 12:48:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,252,1470726000"; d="scan'208";a="872304293"
Received: from dthoumin-mobl2.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.6.138])
	by orsmga003.jf.intel.com with ESMTP; 29 Aug 2016 12:48:54 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 22:48:26 +0300
Message-Id: <1472500111-12358-8-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472500111-12358-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472500111-12358-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 07/12] oeqa.buildperf: don't use Gnu time
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
X-List-Received-Date: Mon, 29 Aug 2016 19:48:55 -0000

Use Python standard library functionality instead of the time utility
for measuring elapsed (wall clock) time of commands. The time.* log
files are also ditched. However, the same detailed resource usage data,
previously found in time.* logs is now provided in results.json file.
This data is collected through the resource module of Python.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 72 ++++++++++++++++++++++-------------------
 1 file changed, 39 insertions(+), 33 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index de22850..5987bfb 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -15,14 +15,16 @@ import json
 import logging
 import os
 import re
+import resource
 import shutil
 import socket
-import tempfile
 import time
 import traceback
 import unittest
 from datetime import datetime, timedelta
 from functools import partial
+from multiprocessing import Process
+from multiprocessing import SimpleQueue
 
 import oe.path
 from oeqa.utils.commands import CommandError, runCmd, get_bb_vars
@@ -69,16 +71,9 @@ class KernelDropCaches(object):
         runCmd2(cmd, data=input_data)
 
 
-def time_cmd(cmd, **kwargs):
-    """TIme a command"""
-    with tempfile.NamedTemporaryFile(mode='w+') as tmpf:
-        timecmd = ['/usr/bin/time', '-v', '-o', tmpf.name]
-        if isinstance(cmd, str):
-            timecmd = ' '.join(timecmd) + ' '
-        timecmd += cmd
-        ret = runCmd2(timecmd, **kwargs)
-        timedata = tmpf.file.read()
-    return ret, timedata
+def str_to_fn(string):
+    """Convert string to a sanitized filename"""
+    return re.sub(r'(\W+)', '-', string, flags=re.LOCALE)
 
 
 class ResultsJsonEncoder(json.JSONEncoder):
@@ -338,45 +333,56 @@ class BuildPerfTestCase(unittest.TestCase):
 
     def measure_cmd_resources(self, cmd, name, legend):
         """Measure system resource usage of a command"""
-        def str_time_to_timedelta(strtime):
-            """Convert time strig from the time utility to timedelta"""
-            split = strtime.split(':')
-            hours = int(split[0]) if len(split) > 2 else 0
-            mins = int(split[-2])
+        def _worker(data_q, cmd, **kwargs):
+            """Worker process for measuring resources"""
             try:
-                secs, frac = split[-1].split('.')
-            except:
-                secs = split[-1]
-                frac = '0'
-            secs = int(secs)
-            microsecs = int(float('0.' + frac) * pow(10, 6))
-            return timedelta(0, hours*3600 + mins*60 + secs, microsecs)
+                start_time = datetime.now()
+                ret = runCmd2(cmd, **kwargs)
+                etime = datetime.now() - start_time
+                rusage_struct = resource.getrusage(resource.RUSAGE_CHILDREN)
+                rusage = {}
+                # Skip unused fields, (i.e. 'ru_ixrss', 'ru_idrss', 'ru_isrss',
+                # 'ru_nswap', 'ru_msgsnd', 'ru_msgrcv' and 'ru_nsignals')
+                for key in ['ru_utime', 'ru_stime', 'ru_maxrss', 'ru_minflt',
+                            'ru_majflt', 'ru_inblock', 'ru_oublock',
+                            'ru_nvcsw', 'ru_nivcsw']:
+                    rusage[key] = getattr(rusage_struct, key)
+                data_q.put({'ret': ret,
+                            'start_time': start_time,
+                            'elapsed_time': etime,
+                            'rusage': rusage})
+            except Exception as err:
+                data_q.put(err)
 
         cmd_str = cmd if isinstance(cmd, str) else ' '.join(cmd)
         log.info("Timing command: %s", cmd_str)
+        data_q = SimpleQueue()
         cmd_log = os.path.join(self.out_dir, 'commands.log')
         try:
             with open(cmd_log, 'a') as fobj:
-                ret, timedata = time_cmd(cmd, stdout=fobj)
+                proc = Process(target=_worker, args=(data_q, cmd,),
+                               kwargs={'stdout': fobj})
+                proc.start()
+                data = data_q.get()
+                proc.join()
+            if isinstance(data, Exception):
+                raise data
         except CommandError:
             log.error("Command '%s' failed, see %s for more details", cmd_str,
                       cmd_log)
             raise
-        match = re.search(r'.*wall clock.*: (?P<etime>.*)\n', timedata)
-        etime = str_time_to_timedelta(match.group('etime'))
+        etime = data['elapsed_time']
 
         measurement = {'type': self.SYSRES,
                        'name': name,
                        'legend': legend}
-        measurement['values'] = {'elapsed_time': etime}
+        measurement['values'] = {'start_time': data['start_time'],
+                                 'elapsed_time': etime,
+                                 'rusage': data['rusage']}
         self.measurements.append(measurement)
-        e_sec = etime.total_seconds()
-        nlogs = len(glob.glob(self.out_dir + '/results.log*'))
-        results_log = os.path.join(self.out_dir,
-                                   'results.log.{}'.format(nlogs + 1))
-        with open(results_log, 'w') as fobj:
-            fobj.write(timedata)
+
         # Append to 'times' array for globalres log
+        e_sec = etime.total_seconds()
         self.times.append('{:d}:{:02d}:{:.2f}'.format(int(e_sec / 3600),
                                                       int((e_sec % 3600) / 60),
                                                        e_sec % 60))
-- 
2.6.6


