Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 47FFE601F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 09:55:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4T9sxiC003786
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 02:55:14 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 29 May 2018 02:54:48 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 May 2018 02:54:48 -0700
Message-ID: <20180529095448.21102-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] oe-selftest: add kernel sample of trace-events to oe-selftest
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
X-List-Received-Date: Tue, 29 May 2018 09:55:24 -0000
Content-Type: text/plain

We are going to let oe-selftest support kernel tests. Now we just add
kernel self-contained sample tests. And we plan to add overall kernel
tests in the future.

This patch is just one of kernel samples which contains about 13 tests
enabled by kernel-sample.scc. So it needs KERNEL_FEATURES_append =
" kernel-sample/kernel-sample.scc" in local.conf.

kernel-sample.scc has been accepted by kernel-cache with master branch.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta/lib/oeqa/runtime/cases/ksample_trace.py | 76 ++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/ksample_trace.py

diff --git a/meta/lib/oeqa/runtime/cases/ksample_trace.py b/meta/lib/oeqa/runtime/cases/ksample_trace.py
new file mode 100644
index 0000000000..102c1b8aaf
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/ksample_trace.py
@@ -0,0 +1,76 @@
+import os
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfNotFeature
+
+class KSampleTraceTest(OERuntimeTestCase):
+
+
+    @OETestID(33)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_trace_events(self):
+        # modprobe
+        status, output = self.target.run('modprobe trace-events-sample')
+        msg = 'modprobe trace-events failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # lsmod
+        status, output = self.target.run('lsmod | grep trace_events_sample | cut -d\' \' -f1')
+        self.assertEqual(output, "trace_events_sample", 'lsmod trace_events_sample failed')
+        msg = 'lsmod trace-events failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # check dir
+        status, output = self.target.run('ls /sys/kernel/debug/tracing/events/ | grep sample-trace')
+        self.assertEqual(output, "sample-trace", 'no dir of sample-trace')
+        msg = 'if create dir of sample-tree, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # enable trace
+        status, output = self.target.run('echo 1 > /sys/kernel/debug/tracing/events/sample-trace/enable')
+        status, output = self.target.run('cat /sys/kernel/debug/tracing/events/sample-trace/enable')
+        self.assertEqual(output, "1", 'failed to enable')
+        msg = 'cat enable, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # check result
+        status, output = self.target.run('cat /sys/kernel/debug/tracing/trace | grep hello | head -n1 | cut -d\':\' -f2')
+        self.assertEqual(output, " foo_bar", 'failed')
+        msg = 'cat trace-events, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # enable trace
+        status, output = self.target.run('echo 0 > /sys/kernel/debug/tracing/events/sample-trace/enable')
+        msg = 'disable, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # clean up trace
+        status, output = self.target.run('echo > /sys/kernel/debug/tracing/trace')
+        msg = 'clearup trace, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        status, output = self.target.run('rmmod trace-events-sample')
+        msg = 'rmmod, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestID(34)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_trace_printk(self):
+        # modprobe
+        status, output = self.target.run('modprobe trace-printk')
+        msg = 'modprobe trace-printk failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg) 
+        # lsmod
+        status, output = self.target.run('lsmod | grep trace_printk | cut -d\' \' -f1')
+        self.assertEqual(output, "trace_printk", 'lsmod trace_printk failed')
+        msg = 'lsmod trace-printk failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg) 
+        # check result 
+        status, output = self.target.run('cat /sys/kernel/debug/tracing/trace | grep trace_printk | head -n1 | cut -d\':\' -f2')
+        self.assertEqual(output, " trace_printk_irq_work", 'failed')
+        msg = 'cat  trace-printk, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # clean up trace 
+        status, output = self.target.run('echo > /sys/kernel/debug/tracing/trace')
+        msg = 'clean up trace, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        status, output = self.target.run('rmmod trace-printk')
+        msg = 'rmmod, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
-- 
2.11.0


