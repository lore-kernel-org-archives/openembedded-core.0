Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.9634.1605627379456851254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:36:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: SR8RAdqxkjF/HCbw4RBrpUeTWRcLrMm5Vy/qaQRqMgaI9cDmI619QdMGdZcx43hKVXSIJYGB3h
 DyrPb9rj7IEA==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158720003"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="158720003"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:29 -0800
IronPort-SDR: w7im0CbKJ5Sw7VFI5UNNCAzdLEkqHVilM9asDtxp9WkcZywHrgkQPJCPXZ8He1Ib+xDk+z4/mD
 xePc7uxl8S1Q==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="400802974"
Received: from sbinisma-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.40.254])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:28 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 11/19] testimage: print results for interrupted runs
Date: Tue, 17 Nov 2020 23:36:00 +0800
Message-Id: <54a7e5feee2bec78f8d526b69076fd0e8e50e228.1605626675.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1605626675.git.anuj.mittal@intel.com>
References: <cover.1605626675.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Konrad Weihmann <kweihmann@outlook.com>

When a run is ended by overall timeout, print the already executed
testcases, to provide some hints which testcase might made the
test suite reach global timeout.
Nonetheless make the testrun exit with an error

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2bcc643195a3b3c66d698fac8b7af037c08545ac)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/testimage.bbclass | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index e3feef02f8..78da4b09bd 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -367,6 +367,7 @@ def testimage_main(d):
     package_extraction(d, tc.suites)
 
     results = None
+    complete = False
     orig_sigterm_handler = signal.signal(signal.SIGTERM, sigterm_exception)
     try:
         # We need to check if runqemu ends unexpectedly
@@ -378,6 +379,7 @@ def testimage_main(d):
         except ValueError:
             pass
         results = tc.runTests()
+        complete = True
     except (KeyboardInterrupt, BlockingIOError) as err:
         if isinstance(err, KeyboardInterrupt):
             bb.error('testimage interrupted, shutting down...')
@@ -385,20 +387,21 @@ def testimage_main(d):
             bb.error('runqemu failed, shutting down...')
         if results:
             results.stop()
-            results = None
+        results = tc.results
     finally:
         signal.signal(signal.SIGTERM, orig_sigterm_handler)
         tc.target.stop()
 
     # Show results (if we have them)
-    if not results:
+    if results:
+        configuration = get_testimage_configuration(d, 'runtime', machine)
+        results.logDetails(get_testimage_json_result_dir(d),
+                        configuration,
+                        get_testimage_result_id(configuration),
+                        dump_streams=d.getVar('TESTREPORT_FULLLOGS'))
+        results.logSummary(pn)
+    if not results or not complete:
         bb.fatal('%s - FAILED - tests were interrupted during execution' % pn, forcelog=True)
-    configuration = get_testimage_configuration(d, 'runtime', machine)
-    results.logDetails(get_testimage_json_result_dir(d),
-                       configuration,
-                       get_testimage_result_id(configuration),
-                       dump_streams=d.getVar('TESTREPORT_FULLLOGS'))
-    results.logSummary(pn)
     if not results.wasSuccessful():
         bb.fatal('%s - FAILED - check the task log and the ssh log' % pn, forcelog=True)
 
-- 
2.28.0

