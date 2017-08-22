Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A008B7829F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 01:23:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7M1NHjJ032730
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 18:23:17 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 21 Aug 2017 18:23:17 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Aug 2017 18:23:07 -0700
Message-ID: <7dd3402bd0c040e20a837b066b35d60947a2ab26.1503364879.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1503364879.git.liezhi.yang@windriver.com>
References: <cover.1503364879.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 3/9] runtime/cases/_ptest.py: add skip status
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
X-List-Received-Date: Tue, 22 Aug 2017 01:23:16 -0000
Content-Type: text/plain

The packages' test cases maybe skipped, check and save them.

[YOCTO #11547]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/runtime/cases/_ptest.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/_ptest.py b/meta/lib/oeqa/runtime/cases/_ptest.py
index 6d23949..ec8c038 100644
--- a/meta/lib/oeqa/runtime/cases/_ptest.py
+++ b/meta/lib/oeqa/runtime/cases/_ptest.py
@@ -10,6 +10,7 @@ class PtestRunnerTest(OERuntimeTestCase):
     def parse_ptest(self, logfile):
         parser = Lparser(test_0_pass_regex="^PASS:(.+)",
                          test_0_fail_regex="^FAIL:(.+)",
+                         test_0_skip_regex="^SKIP:(.+)",
                          section_0_begin_regex="^BEGIN: .*/(.+)/ptest",
                          section_0_end_regex="^END: .*/(.+)/ptest")
         parser.init()
@@ -38,6 +39,10 @@ class PtestRunnerTest(OERuntimeTestCase):
                     result.store(current_section, name, status)
                     continue
 
+                if line_type == 'test' and status == 'skip':
+                    result.store(current_section, name, status)
+                    continue
+
         result.sort_tests()
         return result
 
@@ -70,7 +75,7 @@ class PtestRunnerTest(OERuntimeTestCase):
 
         # Parse and save results
         parse_result = self.parse_ptest(ptest_runner_log)
-        parse_result.log_as_files(ptest_log_dir, test_status = ['pass','fail'])
+        parse_result.log_as_files(ptest_log_dir, test_status = ['pass','fail', 'skip'])
         if os.path.exists(ptest_log_dir_link):
             # Remove the old link to create a new one
             os.remove(ptest_log_dir_link)
-- 
2.10.2


