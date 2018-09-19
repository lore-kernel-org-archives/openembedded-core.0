Return-Path: <ee.peng.yeoh@intel.com>
X-Greylist: delayed 578 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 19 Sep 2018 08:56:02 UTC
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 045BF79080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 08:56:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Sep 2018 01:46:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,393,1531810800"; d="scan'208";a="264828010"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga006.fm.intel.com with ESMTP; 19 Sep 2018 01:46:21 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2018 16:31:00 +0800
Message-Id: <1537345860-32081-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1537345860-32081-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1537345860-32081-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 2/2] oeqa/selftest/context: enable selftest to write json testresult
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
X-List-Received-Date: Wed, 19 Sep 2018 08:56:03 -0000

To enable selftest to write testresult into json files, where
these json files will be used by future test case management
tools for test reporting.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/selftest/context.py | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index c78947e..9ed22ff 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -73,6 +73,9 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
 
         parser.add_argument('--machine', required=False, choices=['random', 'all'],
                             help='Run tests on different machines (random/all).')
+
+        parser.add_argument('-ej', '--export-json', action='store_true',
+                            help='Output test result in json format to files.')
         
         parser.set_defaults(func=self.run)
 
@@ -99,8 +102,8 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         return cases_paths
 
     def _process_args(self, logger, args):
-        args.output_log = '%s-results-%s.log' % (self.name,
-                time.strftime("%Y%m%d%H%M%S"))
+        args.test_start_time = time.strftime("%Y%m%d%H%M%S")
+        args.output_log = '%s-results-%s.log' % (self.name, args.test_start_time)
         args.test_data_file = None
         args.CASES_PATHS = None
 
@@ -222,6 +225,11 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
             rc = self.tc.runTests(**self.tc_kwargs['run'])
             rc.logDetails()
             rc.logSummary(self.name)
+            if args.export_json:
+                json_result_dir = os.path.join(os.path.dirname(os.path.abspath(args.output_log)),
+                                               'json_testresults-%s' % args.test_start_time,
+                                               'oe-selftest')
+                rc.logDetailsInJson(json_result_dir)
 
         return rc
 
-- 
2.7.4


