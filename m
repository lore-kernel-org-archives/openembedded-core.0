Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9596A60602
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 09:25:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6K9P38D022551
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 02:25:03 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 20 Jul 2018 02:25:02 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jul 2018 05:24:17 -0400
Message-ID: <1532078657-63235-2-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1532078657-63235-1-git-send-email-hongzhi.song@windriver.com>
References: <1532078657-63235-1-git-send-email-hongzhi.song@windriver.com>
MIME-Version: 1.0
Subject: [meta][PATCH] runtime selftest: test_trace_events_sample of ksample.py
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
X-List-Received-Date: Fri, 20 Jul 2018 09:25:02 -0000
Content-Type: text/plain

The debug info can not be written to trace buffer immediately
by thread. So we should sleep some seconds.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta/lib/oeqa/runtime/cases/ksample.py | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ksample.py b/meta/lib/oeqa/runtime/cases/ksample.py
index 260bc3c..26fbe9d 100644
--- a/meta/lib/oeqa/runtime/cases/ksample.py
+++ b/meta/lib/oeqa/runtime/cases/ksample.py
@@ -18,7 +18,8 @@ class KSample(OERuntimeTestCase):
         else:
             # check result
             result = ("%s" % match_string) in output
-            self.assertTrue(result)
+            msg = output
+            self.assertTrue(result, msg)
             self.assertEqual(status, 0, cmd)
 
     def check_config(self, config_opt=''):
@@ -126,7 +127,16 @@ class KSampleTest(KSample):
         self.cmd_and_check("echo 1 > /sys/kernel/debug/tracing/events/sample-trace/enable")
         self.cmd_and_check("cat /sys/kernel/debug/tracing/events/sample-trace/enable")
         # check result
-        self.cmd_and_check("cat /sys/kernel/debug/tracing/trace | grep hello | head -n1 | cut -d\':\' -f2", " foo_bar")
+        status = 1
+        count = 0
+        while status != 0:
+            time.sleep(1)
+            status, output = self.target.run('cat /sys/kernel/debug/tracing/trace | grep hello | head -n1 | cut -d\':\' -f2')
+            if " foo_bar" in output:
+                break
+            count = count + 1
+            if count > 5:
+                self.assertTrue(False, "Time out when check result")
         # disable trace
         self.cmd_and_check("echo 0 > /sys/kernel/debug/tracing/events/sample-trace/enable")
         # clean up trace
-- 
2.8.1


