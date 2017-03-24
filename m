Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E7BDF77BB4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 14:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490365096; x=1521901096;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=cNxItaWykqZfI3ABe9vYx13+LMjXVRoqxlAG/HNYmKs=;
	b=BWO3dbrwTsdTuxyjI/2bEIRf70YDztPh/+TLb4WK+dKSAtoDUwpQ79GY
	/KkboGFe68sIqAnuc/6u0NNIYJo+1g==;
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Mar 2017 07:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,215,1486454400"; d="scan'208";a="1146511853"
Received: from mlehtone-mac02.fi.intel.com (HELO mqz-osx-suse64.fi.intel.com)
	([10.237.66.34])
	by fmsmga002.fm.intel.com with ESMTP; 24 Mar 2017 07:17:36 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 16:17:25 +0200
Message-Id: <1490365050-11776-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1490365050-11776-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1490365050-11776-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/6] oe-build-perf-test: pack all buildstat in one file
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
X-List-Received-Date: Fri, 24 Mar 2017 14:18:15 -0000

Write out all buildstats into one big json file, instead of using
multiple per-measurement files. Individual buildstats will be indexed
using "<test_name>.<measurement_name>" as the key. Also, changes the
per-testcase working directories into temporary directories that will be
removed after test execution as there are no more per-testcase data files
to store permanently.

[YOCTO #10582]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py       | 42 ++++++++++++++++++++---------------
 meta/lib/oeqa/buildperf/test_basic.py | 24 +++++++++-----------
 scripts/oe-build-perf-test            |  1 +
 3 files changed, 36 insertions(+), 31 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index dd473a0..ffe42dc 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -16,6 +16,7 @@ import os
 import re
 import resource
 import socket
+import shutil
 import time
 import unittest
 import xml.etree.ElementTree as ET
@@ -127,7 +128,6 @@ class BuildPerfTestResult(unittest.TextTestResult):
     def startTest(self, test):
         """Pre-test hook"""
         test.base_dir = self.out_dir
-        os.mkdir(test.out_dir)
         log.info("Executing test %s: %s", test.name, test.shortDescription())
         self.stream.write(datetime.now().strftime("[%Y-%m-%d %H:%M:%S] "))
         super(BuildPerfTestResult, self).startTest(test)
@@ -150,6 +150,16 @@ class BuildPerfTestResult(unittest.TextTestResult):
         return sorted(compound, key=lambda info: info[1].start_time)
 
 
+    def write_buildstats_json(self):
+        """Write buildstats file"""
+        buildstats = OrderedDict()
+        for _, test, _ in self.all_results():
+            for key, val in test.buildstats.items():
+                buildstats[test.name + '.' + key] = val
+        with open(os.path.join(self.out_dir, 'buildstats.json'), 'w') as fobj:
+            json.dump(buildstats, fobj, cls=ResultsJsonEncoder)
+
+
     def write_results_json(self):
         """Write test results into a json-formatted file"""
         results = OrderedDict([('tester_host', self.hostname),
@@ -221,8 +231,6 @@ class BuildPerfTestResult(unittest.TextTestResult):
                     ET.SubElement(measurement, 'time',
                                   timestamp=vals['start_time'].isoformat()).text = \
                         str(vals['elapsed_time'].total_seconds())
-                    if 'buildstats_file' in vals:
-                        ET.SubElement(measurement, 'buildstats_file').text = vals['buildstats_file']
                     attrib = dict((k, str(v)) for k, v in vals['iostat'].items())
                     ET.SubElement(measurement, 'iostat', attrib=attrib)
                     attrib = dict((k, str(v)) for k, v in vals['rusage'].items())
@@ -238,7 +246,6 @@ class BuildPerfTestResult(unittest.TextTestResult):
         dom_doc = minidom.parseString(ET.tostring(top, 'utf-8'))
         with open(os.path.join(self.out_dir, 'results.xml'), 'w') as fobj:
             dom_doc.writexml(fobj, addindent='  ', newl='\n', encoding='utf-8')
-        return
 
 
 class BuildPerfTestCase(unittest.TestCase):
@@ -254,6 +261,7 @@ class BuildPerfTestCase(unittest.TestCase):
         self.start_time = None
         self.elapsed_time = None
         self.measurements = OrderedDict()
+        self.buildstats = OrderedDict()
         # self.err is supposed to be a tuple from sys.exc_info()
         self.err = None
         self.bb_vars = get_bb_vars()
@@ -263,17 +271,24 @@ class BuildPerfTestCase(unittest.TestCase):
         self.sizes = []
 
     @property
-    def out_dir(self):
-        return os.path.join(self.base_dir, self.name)
+    def tmp_dir(self):
+        return os.path.join(self.base_dir, self.name + '.tmp')
 
     def shortDescription(self):
         return super(BuildPerfTestCase, self).shortDescription() or ""
 
     def setUp(self):
         """Set-up fixture for each test"""
+        if not os.path.isdir(self.tmp_dir):
+            os.mkdir(self.tmp_dir)
         if self.build_target:
             self.run_cmd(['bitbake', self.build_target, '-c', 'fetchall'])
 
+    def tearDown(self):
+        """Tear-down fixture for each test"""
+        if os.path.isdir(self.tmp_dir):
+            shutil.rmtree(self.tmp_dir)
+
     def run(self, *args, **kwargs):
         """Run test"""
         self.start_time = datetime.now()
@@ -349,9 +364,7 @@ class BuildPerfTestCase(unittest.TestCase):
                                              ('rusage', data['rusage']),
                                              ('iostat', data['iostat'])])
         if save_bs:
-            bs_file = self.save_buildstats(legend)
-            measurement['values']['buildstats_file'] = \
-                    os.path.relpath(bs_file, self.base_dir)
+            self.save_buildstats(name)
 
         self._append_measurement(measurement)
 
@@ -379,7 +392,7 @@ class BuildPerfTestCase(unittest.TestCase):
         # Append to 'sizes' array for globalres log
         self.sizes.append(str(size))
 
-    def save_buildstats(self, label=None):
+    def save_buildstats(self, measurement_name):
         """Save buildstats"""
         def split_nevr(nevr):
             """Split name and version information from recipe "nevr" string"""
@@ -451,14 +464,7 @@ class BuildPerfTestCase(unittest.TestCase):
                                                                    task))
             buildstats.append(recipe_bs)
 
-        # Write buildstats into json file
-        postfix = '.' + str_to_fn(label) if label else ''
-        postfix += '.json'
-        outfile = os.path.join(self.out_dir, 'buildstats' + postfix)
-        with open(outfile, 'w') as fobj:
-            json.dump(buildstats, fobj, indent=4, sort_keys=True,
-                      cls=ResultsJsonEncoder)
-        return outfile
+        self.buildstats[measurement_name] = buildstats
 
     def rm_tmp(self):
         """Cleanup temporary/intermediate files and directories"""
diff --git a/meta/lib/oeqa/buildperf/test_basic.py b/meta/lib/oeqa/buildperf/test_basic.py
index 1333407..a9e4a5b 100644
--- a/meta/lib/oeqa/buildperf/test_basic.py
+++ b/meta/lib/oeqa/buildperf/test_basic.py
@@ -51,21 +51,19 @@ class Test1P3(BuildPerfTestCase):
 
     def test13(self):
         """Build core-image-sato with rm_work enabled"""
-        postfile = os.path.join(self.out_dir, 'postfile.conf')
+        postfile = os.path.join(self.tmp_dir, 'postfile.conf')
         with open(postfile, 'w') as fobj:
             fobj.write('INHERIT += "rm_work"\n')
-        try:
-            self.rm_tmp()
-            self.rm_sstate()
-            self.rm_cache()
-            self.sync()
-            cmd = ['bitbake', '-R', postfile, self.build_target]
-            self.measure_cmd_resources(cmd, 'build',
-                                       'bitbake' + self.build_target,
-                                       save_bs=True)
-            self.measure_disk_usage(self.bb_vars['TMPDIR'], 'tmpdir', 'tmpdir')
-        finally:
-            os.unlink(postfile)
+
+        self.rm_tmp()
+        self.rm_sstate()
+        self.rm_cache()
+        self.sync()
+        cmd = ['bitbake', '-R', postfile, self.build_target]
+        self.measure_cmd_resources(cmd, 'build',
+                                   'bitbake' + self.build_target,
+                                   save_bs=True)
+        self.measure_disk_usage(self.bb_vars['TMPDIR'], 'tmpdir', 'tmpdir')
 
 
 class Test2(BuildPerfTestCase):
diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 8950c32..669470f 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -209,6 +209,7 @@ def main(argv=None):
         result.write_results_xml()
     else:
         result.write_results_json()
+    result.write_buildstats_json()
     if args.globalres_file:
         update_globalres_file(result, args.globalres_file, metadata)
     if result.wasSuccessful():
-- 
2.6.6


