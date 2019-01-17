Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D3C587BFEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 09:44:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0H9i7a5006664
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 01:44:23 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 17 Jan 2019 01:44:15 -0800
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Jan 2019 01:44:15 -0800
Message-ID: <20190117094415.16064-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] oeqa/runtime/ksample.py: skip kprobe case except x86 and powerpc
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
X-List-Received-Date: Thu, 17 Jan 2019 09:44:33 -0000
Content-Type: text/plain

A new commit was introduced to kernel, which caused kprobe sample case
failed on arm.
[kernel commit: e46daee53bb50b, ARM: 8806/1: kprobes: Fix false positive
with FORTIFY_SOURCE]

And according to author, the case just works on x86 and powerpc.
So we just promise that the case can pass on x86 and powerpc.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta/lib/oeqa/runtime/cases/ksample.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/ksample.py b/meta/lib/oeqa/runtime/cases/ksample.py
index 354cc97673..584d0fb5e4 100644
--- a/meta/lib/oeqa/runtime/cases/ksample.py
+++ b/meta/lib/oeqa/runtime/cases/ksample.py
@@ -22,6 +22,12 @@ class KSample(OERuntimeTestCase):
             self.assertTrue(result, msg)
             self.assertEqual(status, 0, cmd)
 
+    def check_arch(self, archset=''):
+        status, output = self.target.run("uname -m")
+        result = ("%s" % output) in archset
+        if not result:
+            self.skipTest("This case doesn't support %s" % output)
+
     def check_config(self, config_opt=''):
         cmd = "zcat /proc/config.gz | grep %s" % config_opt
         status, output = self.target.run(cmd)
@@ -99,6 +105,7 @@ class KSampleTest(KSample):
     # kprobe
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_kprobe_test(self):
+        self.check_arch("x86 ppc")
         index = ["kprobe", "kretprobe"]
         for i in index:
             self.kprobe_func(i)
-- 
2.11.0


