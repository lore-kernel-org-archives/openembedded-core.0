Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 135177F825
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 09:50:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Nov 2019 01:50:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,277,1569308400"; d="scan'208";a="201359992"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga007.fm.intel.com with ESMTP; 07 Nov 2019 01:50:39 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 17:50:29 +0800
Message-Id: <1573120230-33685-4-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573120230-33685-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1573120230-33685-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 3/4] scripts/resulttool/report: Add total statistic to test result.
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
X-List-Received-Date: Thu, 07 Nov 2019 09:50:39 -0000

Add total passed, failed, and skipped statistic to test result.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/resulttool/report.py                          | 5 +++++
 scripts/lib/resulttool/template/test_report_full_text.txt | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index 0c83fb6..692dd7a 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -186,6 +186,10 @@ class ResultsTextReport(object):
                 havefailed = True
             if line['machine'] not in machines:
                 machines.append(line['machine'])
+        reporttotalvalues = {}
+        for k in cols:
+            reporttotalvalues[k] = '%s' % sum([line[k] for line in test_count_reports])
+        reporttotalvalues['count'] = '%s' % len(test_count_reports)
         for (machine, report) in self.ptests.items():
             for ptest in self.ptests[machine]:
                 if len(ptest) > maxlen['ptest']:
@@ -199,6 +203,7 @@ class ResultsTextReport(object):
                 if len(ltpposixtest) > maxlen['ltpposixtest']:
                     maxlen['ltpposixtest'] = len(ltpposixtest)
         output = template.render(reportvalues=reportvalues,
+                                 reporttotalvalues=reporttotalvalues,
                                  havefailed=havefailed,
                                  machines=machines,
                                  ptests=self.ptests,
diff --git a/scripts/lib/resulttool/template/test_report_full_text.txt b/scripts/lib/resulttool/template/test_report_full_text.txt
index 17c99cb..2efba2e 100644
--- a/scripts/lib/resulttool/template/test_report_full_text.txt
+++ b/scripts/lib/resulttool/template/test_report_full_text.txt
@@ -8,7 +8,8 @@ Test Result Status Summary (Counts/Percentages sorted by testseries, ID)
 {{ report.testseries.ljust(maxlen['testseries']) }} | {{ report.result_id.ljust(maxlen['result_id']) }} | {{ (report.passed|string).ljust(maxlen['passed']) }} | {{ (report.failed|string).ljust(maxlen['failed']) }} | {{ (report.skipped|string).ljust(maxlen['skipped']) }}
 {% endfor %}
 --------------------------------------------------------------------------------------------------------------
-
+{{ 'Total'.ljust(maxlen['testseries']) }} | {{ reporttotalvalues['count'].ljust(maxlen['result_id']) }} | {{ reporttotalvalues['passed'].ljust(maxlen['passed']) }} | {{ reporttotalvalues['failed'].ljust(maxlen['failed']) }} | {{ reporttotalvalues['skipped'].ljust(maxlen['skipped']) }}
+--------------------------------------------------------------------------------------------------------------
 
 {% for machine in machines %}
 {% if ptests[machine] %}
-- 
2.7.4


