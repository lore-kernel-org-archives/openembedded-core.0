Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7137971B13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 11:12:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2017 03:12:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,253,1477983600"; d="scan'208";a="1114934279"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2017 03:12:51 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 13:12:39 +0200
Message-Id: <20170119111239.22506-12-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170119111239.22506-1-markus.lehtonen@linux.intel.com>
References: <20170119111239.22506-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 11/11] oeqa.buildperf: store measurements as a dict (object) in the JSON report
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
X-List-Received-Date: Thu, 19 Jan 2017 11:12:51 -0000

Store measurements as a dict, instead of an array, in the JSON report.
This change makes traversing of the report much easier. The change also
disallows identically named measurements under one test, as a sanity
check for the test cases.

[YOCTO #10590]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 28c3e29..975524c 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -214,7 +214,7 @@ class BuildPerfTestResult(unittest.TextTestResult):
             elif status not in ('SUCCESS', 'UNEXPECTED_SUCCESS'):
                 raise TypeError("BUG: invalid test status '%s'" % status)
 
-            for data in test.measurements:
+            for data in test.measurements.values():
                 measurement = ET.SubElement(testcase, data['type'])
                 measurement.set('name', data['name'])
                 measurement.set('legend', data['legend'])
@@ -255,7 +255,7 @@ class BuildPerfTestCase(unittest.TestCase):
         self.base_dir = None
         self.start_time = None
         self.elapsed_time = None
-        self.measurements = []
+        self.measurements = OrderedDict()
         # self.err is supposed to be a tuple from sys.exc_info()
         self.err = None
         self.bb_vars = get_bb_vars()
@@ -298,6 +298,13 @@ class BuildPerfTestCase(unittest.TestCase):
             log.error("Command failed: %s", err.retcode)
             raise
 
+    def _append_measurement(self, measurement):
+        """Simple helper for adding measurements results"""
+        if measurement['name'] in self.measurements:
+            raise ValueError('BUG: two measurements with the same name in {}'.format(
+                self.__class__.__name__))
+        self.measurements[measurement['name']] = measurement
+
     def measure_cmd_resources(self, cmd, name, legend, save_bs=False):
         """Measure system resource usage of a command"""
         def _worker(data_q, cmd, **kwargs):
@@ -357,7 +364,7 @@ class BuildPerfTestCase(unittest.TestCase):
             measurement['values']['buildstats_file'] = \
                     os.path.relpath(bs_file, self.base_dir)
 
-        self.measurements.append(measurement)
+        self._append_measurement(measurement)
 
         # Append to 'times' array for globalres log
         e_sec = etime.total_seconds()
@@ -379,7 +386,7 @@ class BuildPerfTestCase(unittest.TestCase):
                                    ('name', name),
                                    ('legend', legend)])
         measurement['values'] = OrderedDict([('size', size)])
-        self.measurements.append(measurement)
+        self._append_measurement(measurement)
         # Append to 'sizes' array for globalres log
         self.sizes.append(str(size))
 
-- 
2.10.2


