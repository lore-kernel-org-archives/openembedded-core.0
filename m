Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EC87678854
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 12:40:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2018 05:40:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,310,1517904000"; d="scan'208";a="211570252"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by fmsmga006.fm.intel.com with ESMTP; 15 Mar 2018 05:40:45 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 14:40:45 +0200
Message-Id: <20180315124045.44117-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] scripts/oe-build-perf-report: fix comparing arbitrary commits
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
X-List-Received-Date: Thu, 15 Mar 2018 12:40:46 -0000

Fix a crash when generating a txt report and the two commits to be
compared were not consecutive (but there were some tested commits
between them).

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-report | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index ac88f0fce5..dc999c45c1 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -639,10 +639,6 @@ def main(argv=None):
         data.append(AggregateTestData(aggregate_metadata(raw_m),
                                       aggregate_data(raw_d)))
 
-    # Re-map list indexes to the new table starting from index 0
-    index_r = index_r - index_0
-    index_l = index_l - index_0
-
     # Read buildstats only when needed
     buildstats = None
     if args.dump_buildstats or args.html:
@@ -653,10 +649,11 @@ def main(argv=None):
 
     # Print report
     if not args.html:
-        print_diff_report(data[index_l].metadata, data[index_l].results,
-                          data[index_r].metadata, data[index_r].results)
+        print_diff_report(data[0].metadata, data[0].results,
+                          data[1].metadata, data[1].results)
     else:
-        print_html_report(data, index_l, buildstats)
+        # Re-map 'left' list index to the data table where index_0 maps to 0
+        print_html_report(data, index_l - index_0, buildstats)
 
     return 0
 
-- 
2.13.6


