Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id AF9A07854D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 12:54:57 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 15 Sep 2017 05:54:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,396,1500966000"; d="scan'208";a="1014792750"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga003.jf.intel.com with ESMTP; 15 Sep 2017 05:54:58 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Sep 2017 15:54:50 +0300
Message-Id: <08c347fec3d4f6184f9c173a0bfb9b57264378a9.1505479710.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
References: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
References: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/7] scripts/oe-build-perf-report: add AggregateTestData class
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
X-List-Received-Date: Fri, 15 Sep 2017 12:54:57 -0000

Making the code a bit more readable.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/build_perf/report.py |  5 ++++-
 scripts/oe-build-perf-report     | 16 +++++++++-------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/build_perf/report.py b/scripts/lib/build_perf/report.py
index eb00ccca2d..d99a36797f 100644
--- a/scripts/lib/build_perf/report.py
+++ b/scripts/lib/build_perf/report.py
@@ -11,12 +11,15 @@
 # more details.
 #
 """Handling of build perf test reports"""
-from collections import OrderedDict, Mapping
+from collections import OrderedDict, Mapping, namedtuple
 from datetime import datetime, timezone
 from numbers import Number
 from statistics import mean, stdev, variance
 
 
+AggregateTestData = namedtuple('AggregateTestData', ['metadata', 'results'])
+
+
 def isofmt_to_timestamp(string):
     """Convert timestamp string in ISO 8601 format into unix timestamp"""
     if '.' in string:
diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index 23081db173..3a76ab621d 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -29,7 +29,8 @@ sys.path.append(os.path.join(scripts_path, 'lib'))
 import scriptpath
 from build_perf import print_table
 from build_perf.report import (metadata_xml_to_json, results_xml_to_json,
-                               aggregate_data, aggregate_metadata, measurement_stats)
+                               aggregate_data, aggregate_metadata, measurement_stats,
+                               AggregateTestData)
 from build_perf import html
 
 scriptpath.add_oe_lib_path()
@@ -337,13 +338,13 @@ def print_html_report(data, id_comp):
                 'hostname': {'title': 'Hostname', 'value': 'foobar'},
                 'commit': {'title': 'Commit', 'value': '1234'}
                }
-    metadata = metadata_diff(data[id_comp][0], data[-1][0])
+    metadata = metadata_diff(data[id_comp].metadata, data[-1].metadata)
 
 
     # Generate list of tests
     tests = []
-    for test in data[-1][1]['tests'].keys():
-        test_r = data[-1][1]['tests'][test]
+    for test in data[-1].results['tests'].keys():
+        test_r = data[-1].results['tests'][test]
         new_test = {'name': test_r['name'],
                     'description': test_r['description'],
                     'status': test_r['status'],
@@ -576,7 +577,8 @@ def main(argv=None):
 
     data = []
     for raw_m, raw_d in raw_data:
-        data.append((aggregate_metadata(raw_m), aggregate_data(raw_d)))
+        data.append(AggregateTestData(aggregate_metadata(raw_m),
+                                      aggregate_data(raw_d)))
 
     # Re-map list indexes to the new table starting from index 0
     index_r = index_r - index_0
@@ -584,8 +586,8 @@ def main(argv=None):
 
     # Print report
     if not args.html:
-        print_diff_report(data[index_l][0], data[index_l][1],
-                          data[index_r][0], data[index_r][1])
+        print_diff_report(data[index_l].metadata, data[index_l].results,
+                          data[index_r].metadata, data[index_r].results)
     else:
         print_html_report(data, index_l)
 
-- 
2.12.3


