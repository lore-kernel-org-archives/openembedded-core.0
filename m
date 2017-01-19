Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 74DA871A6B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 11:12:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2017 03:12:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,253,1477983600"; d="scan'208";a="1114934252"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2017 03:12:45 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 13:12:33 +0200
Message-Id: <20170119111239.22506-6-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170119111239.22506-1-markus.lehtonen@linux.intel.com>
References: <20170119111239.22506-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 05/11] oeqa.buildperf: extend xml format to contain measurement data
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
X-List-Received-Date: Thu, 19 Jan 2017 11:12:45 -0000

Make the xml report format slightly non-standard by incorporating
measurement data into it.

[YOCTO #10590]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index de0ee40..efbe20c 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -269,6 +269,7 @@ class BuildPerfTestResult(unittest.TextTestResult):
 
         test_cnt = 0
         for status, (test, reason) in self.all_results():
+            test_cnt += 1
             testcase = ET.SubElement(suite, 'testcase')
             testcase.set('classname', test.__module__ + '.' + test.__class__.__name__)
             testcase.set('name', test.name)
@@ -287,7 +288,27 @@ class BuildPerfTestResult(unittest.TextTestResult):
                 result.text = reason
             elif status not in ('SUCCESS', 'UNEXPECTED_SUCCESS'):
                 raise TypeError("BUG: invalid test status '%s'" % status)
-            test_cnt += 1
+
+            for data in test.measurements:
+                measurement = ET.SubElement(testcase, data['type'])
+                measurement.set('name', data['name'])
+                measurement.set('legend', data['legend'])
+                vals = data['values']
+                if data['type'] == BuildPerfTestCase.SYSRES:
+                    ET.SubElement(measurement, 'time',
+                                  timestamp=vals['start_time'].isoformat()).text = \
+                        str(vals['elapsed_time'].total_seconds())
+                    if 'buildstats_file' in vals:
+                        ET.SubElement(measurement, 'buildstats_file').text = vals['buildstats_file']
+                    attrib = dict((k, str(v)) for k, v in vals['iostat'].items())
+                    ET.SubElement(measurement, 'iostat', attrib=attrib)
+                    attrib = dict((k, str(v)) for k, v in vals['rusage'].items())
+                    ET.SubElement(measurement, 'rusage', attrib=attrib)
+                elif data['type'] == BuildPerfTestCase.DISKUSAGE:
+                    ET.SubElement(measurement, 'size').text = str(vals['size'])
+                else:
+                    raise TypeError('BUG: unsupported measurement type')
+
         suite.set('tests', str(test_cnt))
 
         # Use minidom for pretty-printing
-- 
2.10.2


