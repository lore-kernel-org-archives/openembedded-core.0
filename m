Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AED4C74A17
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 08:03:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5183F5P011271
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jun 2018 01:03:37 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 1 Jun 2018 01:03:10 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Jun 2018 04:02:38 -0400
Message-ID: <1527840158-99078-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] Meta runtime cases: add testcases for kernel sample
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
X-List-Received-Date: Fri, 01 Jun 2018 08:03:46 -0000
Content-Type: text/plain

We are going to let runtime test support kernel tests. Now we just add
kernel self-contained sample tests. And we plan to add overall kernel
tests in the future.

This patch is just add kernel samples test which contains about 13 tests
enabled by kernel-sample.scc. So it needs statement,
KERNEL_FEATURES_append += " kernel-sample/kernel-sample.scc" in
local.conf.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta/lib/oeqa/runtime/cases/ksample.py | 440 +++++++++++++++++++++++++++++++++
 1 file changed, 440 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/ksample.py

diff --git a/meta/lib/oeqa/runtime/cases/ksample.py b/meta/lib/oeqa/runtime/cases/ksample.py
new file mode 100644
index 0000000..8a9d136
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/ksample.py
@@ -0,0 +1,440 @@
+import os
+import time
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfNotFeature
+
+class KSampleTest(OERuntimeTestCase):
+
+    @OETestID(33)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_trace_events(self):
+        # check config
+        status, ret = self.target.run('zcat /proc/config.gz | grep CONFIG_TRACING_SUPPORT')
+        result = "CONFIG_TRACING_SUPPORT=y" in ret
+        if not result:
+            self.skipTest("CONFIG error")
+        # make sure if module exists
+        status, ret = self.target.run('uname -r')
+        cmd = "ls " + "/lib/modules/" + ret + "/kernel/samples/trace_events/trace-events-sample.ko"
+        status, output = self.target.run(cmd)
+        if status != 0:
+            self.skipTest("trace-events-sample.ko doesn't exist")
+
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
+        # check config
+        status, ret = self.target.run('zcat /proc/config.gz | grep CONFIG_TRACING_SUPPORT')
+        result = "CONFIG_TRACING_SUPPORT=y" in ret
+        if not result:
+            self.skipTest("CONFIG error")
+        # make sure if module exists
+        status, ret = self.target.run('uname -r')
+        cmd = "ls " + "/lib/modules/" + ret + "/kernel/samples/trace_printk/trace-printk.ko"
+        status, output = self.target.run(cmd)
+        if status != 0:
+            self.skipTest("trace-printk.ko doesn't exist")
+
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
+        status, output = self.target.run('cat /sys/kernel/debug/tracing/trace | grep trace_printk_irq_work | head -n1 | cut -d\':\' -f2')
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
+
+    @OETestID(43)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_kprobe_example(self):
+        # check config
+        status, ret = self.target.run('zcat /proc/config.gz | grep CONFIG_KPROBES')
+        result = "CONFIG_KPROBES=y" in ret
+        if not result:
+            self.skipTest("CONFIG error")
+        # make sure if module exists
+        status, ret = self.target.run('uname -r')
+        cmd = "ls " + "/lib/modules/" + ret + "/kernel/samples/kprobes/kprobe_example.ko"
+        status, output = self.target.run(cmd)
+        if status != 0:
+            self.skipTest("kprobe_example.ko doesn't exist")
+
+        # modprobe
+        status, output = self.target.run('modprobe kprobe_example')
+        msg = 'modprobe kprobe_example, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # lsmod
+        status, output = self.target.run('lsmod | grep kprobe_example | cut -d\' \' -f1')
+        self.assertEqual(output, "kprobe_example", 'lsmod kprobe_example failed')
+        msg = 'lsmod kprobe_example failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # check result
+        status, ret = self.target.run('cat /var/log/messages | grep _do_fork')
+        result = "_do_fork" in ret
+        self.assertTrue(result)
+        msg = 'check result failed, output: %s' % ret
+        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        status, output = self.target.run('rmmod kprobe_example')
+        msg = 'rmmod, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestID(44)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_kretprobe_example(self):
+        # check config
+        status, ret = self.target.run('zcat /proc/config.gz | grep CONFIG_KPROBES')
+        result = "CONFIG_KPROBES=y" in ret
+        if not result:
+            self.skipTest("CONFIG error")
+        # make sure if module exists
+        status, ret = self.target.run('uname -r')
+        cmd = "ls " + "/lib/modules/" + ret + "/kernel/samples/kprobes/kretprobe_example.ko"
+        status, output = self.target.run(cmd)
+        if status != 0:
+            self.skipTest("kretprobe_example.ko doesn't exist")
+
+        # modprobe
+        status, output = self.target.run('modprobe kretprobe_example')
+        msg = 'modprobe kretprobe_example, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # lsmod
+        status, output = self.target.run('lsmod | grep kretprobe_example | cut -d\' \' -f1')
+        self.assertEqual(output, "kretprobe_example", 'lsmod kretprobe_example failed')
+        msg = 'lsmod kretprobe_example failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # check result
+        status, output = self.target.run('dmesg | grep Planted | head -n10')
+        msg = 'check result, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        status, output = self.target.run('rmmod kretprobe_example')
+        msg = 'rmmod, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestID(63)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_kobject_example(self):
+        # make sure if module exists
+        status, ret = self.target.run('uname -r')
+        cmd = "ls " + "/lib/modules/" + ret + "/kernel/samples/kobject/kobject-example.ko"
+        status, output = self.target.run(cmd)
+        if status != 0:
+            self.skipTest("kobject-example.ko doesn't exist")
+
+        # modprobe
+        status, output = self.target.run('modprobe kobject_example')
+        msg = 'modprobe kobject_example, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # lsmod
+        status, output = self.target.run('lsmod | grep kobject_example | cut -d\' \' -f1')
+        self.assertEqual(output, "kobject_example", 'lsmod kobject_example failed')
+        msg = 'lsmod kobject_example failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # check result
+        status, output = self.target.run('ls /sys/kernel/kobject_example/')
+        msg = 'check result failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        status, output = self.target.run('rmmod kobject-example')
+        msg = 'rmmod, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestID(64)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_kset_example(self):
+        # make sure if module exists
+        status, ret = self.target.run('uname -r')
+        cmd = "ls " + "/lib/modules/" + ret + "/kernel/samples/kobject/kset-example.ko"
+        status, output = self.target.run(cmd)
+        if status != 0:
+            self.skipTest("kset-example.ko doesn't exist")
+
+        # modprobe
+        status, output = self.target.run('modprobe kset_example')
+        msg = 'modprobe kset_example, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # lsmod
+        status, output = self.target.run('lsmod | grep kset_example | cut -d\' \' -f1')
+        self.assertEqual(output, "kset_example", 'lsmod kset_example failed')
+        msg = 'lsmod kset_example failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # check result
+        status, output = self.target.run('ls /sys/kernel/kset_example/')
+        msg = 'check result failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        status, output = self.target.run('rmmod kset-example')
+        msg = 'rmmod, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestID(53)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_dma_example(self):
+        # make sure if module exists
+        status, ret = self.target.run('uname -r')
+        cmd = "ls " + "/lib/modules/" + ret + "/kernel/samples/kfifo/dma-example.ko"
+        status, output = self.target.run(cmd)
+        if status != 0:
+            self.skipTest("dma-example.ko doesn't exist")
+
+        # modprobe
+        status, output = self.target.run('modprobe dma-example')
+        msg = 'modprobe dma-example, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # lsmod
+        status, output = self.target.run('lsmod | grep dma_example | cut -d\' \' -f1')
+        self.assertEqual(output, "dma_example", 'lsmod dma_example failed')
+        msg = 'lsmod dma_example failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # check result
+        status, output = self.target.run('dmesg | grep \"test passed\"')
+        msg = 'check result failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        status, output = self.target.run('rmmod dma-example')
+        msg = 'rmmod, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestID(54)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_bytestream_example(self):
+        # make sure if module exists
+        status, ret = self.target.run('uname -r')
+        cmd = "ls " + "/lib/modules/" + ret + "/kernel/samples/kfifo/bytestream-example.ko"
+        status, output = self.target.run(cmd)
+        if status != 0:
+            self.skipTest("bytestream-example.ko doesn't exist")
+
+        # modprobe
+        status, output = self.target.run('modprobe bytestream-example')
+        msg = 'modprobe bytestream-example, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # lsmod
+        status, output = self.target.run('lsmod | grep bytestream_example | cut -d\' \' -f1')
+        self.assertEqual(output, "bytestream_example", 'lsmod bytestream_example failed')
+        msg = 'lsmod bytestream_example failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # check result
+        status, output = self.target.run('dmesg | grep \"test passed\"')
+        msg = 'check result failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        status, output = self.target.run('rmmod bytestream-example')
+        msg = 'rmmod, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestID(55)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_inttype_example(self):
+        # make sure if module exists
+        status, ret = self.target.run('uname -r')
+        cmd = "ls " + "/lib/modules/" + ret + "/kernel/samples/kfifo/inttype-example.ko"
+        status, output = self.target.run(cmd)
+        if status != 0:
+            self.skipTest("inttype-example.ko doesn't exist")
+
+        # modprobe
+        status, output = self.target.run('modprobe inttype-example')
+        msg = 'modprobe inttype-example, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # lsmod
+        status, output = self.target.run('lsmod | grep inttype_example | cut -d\' \' -f1')
+        self.assertEqual(output, "inttype_example", 'lsmod inttype_example failed')
+        msg = 'lsmod inttype_example failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # check result
+        status, output = self.target.run('dmesg | grep \"test passed\"')
+        msg = 'check result failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        status, output = self.target.run('rmmod inttype-example')
+        msg = 'rmmod, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestID(56)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_record_example(self):
+        # make sure if module exists
+        status, ret = self.target.run('uname -r')
+        cmd = "ls " + "/lib/modules/" + ret + "/kernel/samples/kfifo/record-example.ko"
+        status, output = self.target.run(cmd)
+        if status != 0:
+            self.skipTest("record-example.ko doesn't exist")
+
+        # modprobe
+        status, output = self.target.run('modprobe record-example')
+        msg = 'modprobe record-example, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # lsmod
+        status, output = self.target.run('lsmod | grep record_example | cut -d\' \' -f1')
+        self.assertEqual(output, "record_example", 'lsmod record_example failed')
+        msg = 'lsmod record_example failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # check result
+        status, output = self.target.run('dmesg | grep \"test passed\"')
+        msg = 'check result failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        status, output = self.target.run('rmmod record_example')
+        msg = 'rmmod, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestID(63)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_hw_breakpoint_example(self):
+        # check config
+        status, ret = self.target.run('zcat /proc/config.gz | grep CONFIG_KALLSYMS_ALL')
+        result = "CONFIG_KALLSYMS_ALL=y" in ret
+        if not result:
+            self.skipTest("CONFIG error")
+        # make sure if module exists
+        status, ret = self.target.run('uname -r')
+        cmd = "ls " + "/lib/modules/" + ret + "/kernel/samples/hw_breakpoint/data_breakpoint.ko"
+        status, output = self.target.run(cmd)
+        if status != 0:
+            self.skipTest("data_breakpoint.ko doesn't exist")
+
+        # modprobe
+        status, output = self.target.run('modprobe data_breakpoint')
+        msg = 'modprobe kobject_example, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # lsmod
+        status, output = self.target.run('lsmod | grep data_breakpoint | cut -d\' \' -f1')
+        self.assertEqual(output, "data_breakpoint", 'lsmod data_breakpoint failed')
+        msg = 'lsmod data_breakpoint failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # check result
+        status, output = self.target.run('cat /var/log/messages | grep sample_hbp_handler')
+        result = "sample_hbp_handler" in output
+        self.assertTrue(result)
+        msg = 'check result failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        status, output = self.target.run('rmmod data_breakpoint')
+        msg = 'rmmod, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestID(73)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_configfs_sample(self):
+        # make sure if module exists
+        status, ret = self.target.run('uname -r')
+        cmd = "ls " + "/lib/modules/" + ret + "/kernel/samples/configfs/configfs_sample.ko"
+        status, output = self.target.run(cmd)
+        if status != 0:
+            self.skipTest("configfs_sample.ko doesn't exist")
+
+        # modprobe
+        status, output = self.target.run('modprobe configfs_sample')
+        msg = 'modprobe configfs_sample, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # lsmod
+        status, output = self.target.run('lsmod | grep configfs_sample | head -n1 | cut -d\' \' -f1')
+        self.assertEqual(output, "configfs_sample", 'lsmod configfs_sample failed')
+        msg = 'lsmod configfs_sample failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        status = 1
+        count = 0
+        while status != 0:
+            time.sleep(1)
+            status, ret = self.target.run('cat /sys/kernel/config/01-childless/description')
+            count = count + 1
+            if count > 300:
+                self.skipTest("Time out for check dir")
+
+        # rmmod
+        status, output = self.target.run('rmmod configfs_sample')
+        msg = 'rmmod, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestID(83)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_cn_test(self):
+        # check config
+        status, ret = self.target.run('zcat /proc/config.gz | grep CONFIG_CONFIGFS_FS')
+        if not ["CONFIG_CONFIGFS_FS=m" in ret or "CONFIG_CONFIGFS_FS=y" in ret]:
+            self.skipTest("CONFIG error")
+
+        # make sure if module exists
+        status, ret = self.target.run('uname -r')
+        cmd = "ls " + "/lib/modules/" + ret + "/kernel/samples/connector/cn_test.ko"
+        status, output = self.target.run(cmd)
+        if status != 0:
+            self.skipTest("cn_test.ko doesn't exist")
+
+        # modprobe
+        status, output = self.target.run('modprobe cn_test')
+        msg = 'modprobe cn_test, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # lsmod
+        status, output = self.target.run('lsmod | grep cn_test | head -n1 | cut -d\' \' -f1')
+        self.assertEqual(output, "cn_test", 'lsmod cn_test failed')
+        msg = 'lsmod cn_test failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # check result
+        status, ret = self.target.run('cat /proc/net/connector | grep cn_test | head -n1 | cut -d\' \' -f1')
+        result = "cn_test" in ret
+        self.assertTrue(result)
+        msg = 'check result failed, output: %s' % ret
+        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        status, output = self.target.run('rmmod cn_test')
+        msg = 'rmmod, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
-- 
2.8.1


