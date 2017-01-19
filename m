Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 76CBA6093F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 11:12:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2017 03:12:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,253,1477983600"; d="scan'208";a="1114934276"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2017 03:12:50 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 13:12:38 +0200
Message-Id: <20170119111239.22506-11-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170119111239.22506-1-markus.lehtonen@linux.intel.com>
References: <20170119111239.22506-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 10/11] oeqa.buildperf: change sorting in json report
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
X-List-Received-Date: Thu, 19 Jan 2017 11:12:50 -0000

Use OrderedDict() instead of sort_keys=True (of json.dump()). Makes for
more logical sorting of the values in the report.

[YOCTO #10590]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 63 +++++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index f6faedb..28c3e29 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -19,6 +19,7 @@ import socket
 import time
 import unittest
 import xml.etree.ElementTree as ET
+from collections import OrderedDict
 from datetime import datetime, timedelta
 from functools import partial
 from multiprocessing import Process
@@ -151,31 +152,31 @@ class BuildPerfTestResult(unittest.TextTestResult):
 
     def write_results_json(self):
         """Write test results into a json-formatted file"""
-        results = {'tester_host': self.hostname,
-                   'start_time': self.start_time,
-                   'elapsed_time': self.elapsed_time}
+        results = OrderedDict([('tester_host', self.hostname),
+                               ('start_time', self.start_time),
+                               ('elapsed_time', self.elapsed_time),
+                               ('tests', OrderedDict())])
 
-        tests = {}
         for status, test, reason in self.all_results():
-            tests[test.name] = {'name': test.name,
-                                'description': test.shortDescription(),
-                                'status': status,
-                                'start_time': test.start_time,
-                                'elapsed_time': test.elapsed_time,
-                                'cmd_log_file': os.path.relpath(test.cmd_log_file,
-                                                                self.out_dir),
-                                'measurements': test.measurements}
+            test_result = OrderedDict([('name', test.name),
+                                       ('description', test.shortDescription()),
+                                       ('status', status),
+                                       ('start_time', test.start_time),
+                                       ('elapsed_time', test.elapsed_time),
+                                       ('cmd_log_file', os.path.relpath(test.cmd_log_file,
+                                                                        self.out_dir)),
+                                       ('measurements', test.measurements)])
             if status in ('ERROR', 'FAILURE', 'EXPECTED_FAILURE'):
-                tests[test.name]['message'] = str(test.err[1])
-                tests[test.name]['err_type'] = test.err[0].__name__
-                tests[test.name]['err_output'] = reason
+                test_result['message'] = str(test.err[1])
+                test_result['err_type'] = test.err[0].__name__
+                test_result['err_output'] = reason
             elif reason:
-                tests[test.name]['message'] = reason
+                test_result['message'] = reason
 
-        results['tests'] = tests
+            results['tests'][test.name] = test_result
 
         with open(os.path.join(self.out_dir, 'results.json'), 'w') as fobj:
-            json.dump(results, fobj, indent=4, sort_keys=True,
+            json.dump(results, fobj, indent=4,
                       cls=ResultsJsonEncoder)
 
     def write_results_xml(self):
@@ -306,12 +307,12 @@ class BuildPerfTestCase(unittest.TestCase):
                 ret = runCmd2(cmd, **kwargs)
                 etime = datetime.now() - start_time
                 rusage_struct = resource.getrusage(resource.RUSAGE_CHILDREN)
-                iostat = {}
+                iostat = OrderedDict()
                 with open('/proc/{}/io'.format(os.getpid())) as fobj:
                     for line in fobj.readlines():
                         key, val = line.split(':')
                         iostat[key] = int(val)
-                rusage = {}
+                rusage = OrderedDict()
                 # Skip unused fields, (i.e. 'ru_ixrss', 'ru_idrss', 'ru_isrss',
                 # 'ru_nswap', 'ru_msgsnd', 'ru_msgrcv' and 'ru_nsignals')
                 for key in ['ru_utime', 'ru_stime', 'ru_maxrss', 'ru_minflt',
@@ -344,13 +345,13 @@ class BuildPerfTestCase(unittest.TestCase):
             raise
         etime = data['elapsed_time']
 
-        measurement = {'type': self.SYSRES,
-                       'name': name,
-                       'legend': legend}
-        measurement['values'] = {'start_time': data['start_time'],
-                                 'elapsed_time': etime,
-                                 'rusage': data['rusage'],
-                                 'iostat': data['iostat']}
+        measurement = OrderedDict([('type', self.SYSRES),
+                                   ('name', name),
+                                   ('legend', legend)])
+        measurement['values'] = OrderedDict([('start_time', data['start_time']),
+                                             ('elapsed_time', etime),
+                                             ('rusage', data['rusage']),
+                                             ('iostat', data['iostat'])])
         if save_bs:
             bs_file = self.save_buildstats(legend)
             measurement['values']['buildstats_file'] = \
@@ -374,10 +375,10 @@ class BuildPerfTestCase(unittest.TestCase):
         ret = runCmd2(cmd)
         size = int(ret.output.split()[0])
         log.debug("Size of %s path is %s", path, size)
-        measurement = {'type': self.DISKUSAGE,
-                       'name': name,
-                       'legend': legend}
-        measurement['values'] = {'size': size}
+        measurement = OrderedDict([('type', self.DISKUSAGE),
+                                   ('name', name),
+                                   ('legend', legend)])
+        measurement['values'] = OrderedDict([('size', size)])
         self.measurements.append(measurement)
         # Append to 'sizes' array for globalres log
         self.sizes.append(str(size))
-- 
2.10.2


