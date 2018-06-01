Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8218574F05
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 16:02:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w51G1wil025256
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jun 2018 09:02:18 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 1 Jun 2018 09:02:02 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Jun 2018 12:01:31 -0400
Message-ID: <1527868891-231168-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta][lib/oeqa][PATCH v2] Meta runtime cases: add testcases for kernel sample
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
X-List-Received-Date: Fri, 01 Jun 2018 16:02:28 -0000
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
 meta/lib/oeqa/runtime/cases/ksample.py     | 272 +++++++++++++++++++++++++++++
 meta/lib/oeqa/runtime/cases/ksample_abs.py | 272 +++++++++++++++++++++++++++++
 2 files changed, 544 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/ksample.py
 create mode 100644 meta/lib/oeqa/runtime/cases/ksample_abs.py

diff --git a/meta/lib/oeqa/runtime/cases/ksample.py b/meta/lib/oeqa/runtime/cases/ksample.py
new file mode 100644
index 0000000..719f1a0
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/ksample.py
@@ -0,0 +1,272 @@
+import os
+import time
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfNotFeature
+
+class KSample(OERuntimeTestCase):
+    def send_cmd(self, cmd='', content=''):
+        comd = cmd + " " + content
+        status, ret = self.target.run(comd)
+        msg = '%s failed, %s' % (comd, ret)
+        self.assertEqual(status, 0, msg=msg)
+
+    def check_config(self, config_opt=''):
+        cmd = "zcat /proc/config.gz | grep %s" % config_opt
+        status, ret = self.target.run(cmd)
+        result = ("%s=y" % config_opt) in ret
+        if not result:
+            self.skipTest("CONFIG error")
+
+    def check_module_exist(self, path='', module_name=''):
+        status, ret = self.target.run("uname -r")
+        cmd = "ls " + "/lib/modules/" + ret + "/kernel/samples/" + path + module_name
+        status, output = self.target.run(cmd)
+        if status != 0:
+            error_info = module_name + "doesn't exist"
+            self.skipTest(error_info)
+
+    def send_check(self, cmd='', content='', comp=''):
+        comd = cmd + " " + content
+        status, ret = self.target.run(comd)
+        self.assertEqual(ret, comp, comd)
+
+    def send_check_in(self, cmd='', content='', comp=''):
+        comd = cmd + " " + content
+        status, ret = self.target.run(comd)
+        result = ("%s" % comp) in ret
+        self.assertTrue(result)
+        self.assertEqual(status, 0, comd)
+
+class KSampleTest(KSample):
+    #trace
+    @OETestID(33)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_trace_events(self):
+        # check config
+        self.check_config("CONFIG_TRACING_SUPPORT")
+        # make sure if module exists
+        self.check_module_exist("trace_events/", "trace-events-sample.ko")
+        # modprobe
+        self.send_cmd("modprobe", "trace-events-sample")
+        # lsmod
+        self.send_check("lsmod", "| grep trace_events_sample | cut -d\' \' -f1", "trace_events_sample")
+        # check dir
+        self.send_check("ls", "/sys/kernel/debug/tracing/events/ | grep sample-trace", "sample-trace")
+        # enable trace
+        self.send_cmd("echo 1 > /sys/kernel/debug/tracing/events/sample-trace/enable")
+        self.send_cmd("cat /sys/kernel/debug/tracing/events/sample-trace/enable")
+        # check result
+        self.send_check("cat", "/sys/kernel/debug/tracing/trace | grep hello | head -n1 | cut -d\':\' -f2", " foo_bar")
+        # disable trace
+        self.send_cmd('echo 0 > /sys/kernel/debug/tracing/events/sample-trace/enable')
+        # clean up trace
+        self.send_cmd('echo > /sys/kernel/debug/tracing/trace')
+        # rmmod
+        self.send_cmd('rmmod trace-events-sample')
+
+    @OETestID(34)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_trace_printk(self):
+        # check config
+        self.check_config("CONFIG_TRACING_SUPPORT")
+        # make sure if module exists
+        self.check_module_exist("trace_printk/", "trace-printk.ko")
+        # modprobe
+        self.send_cmd('modprobe', 'trace-printk')
+        # lsmod
+        self.send_check("lsmod", "| grep trace_printk | cut -d\' \' -f1", "trace_printk")
+        # check result
+        self.send_check("cat", "/sys/kernel/debug/tracing/trace | grep trace_printk_irq_work | head -n1 | cut -d\':\' -f2", " trace_printk_irq_work")
+        # clean up trace
+        self.send_cmd('echo > /sys/kernel/debug/tracing/trace')
+        # rmmod
+        self.send_cmd('rmmod trace-printk')
+    # kprobe
+    @OETestID(43)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_kprobe_example(self):
+        # check config
+        self.check_config("CONFIG_KPROBES")
+        # make sure if module exists
+        self.check_module_exist("kprobes/", "kprobe_example.ko")
+        # modprobe
+        self.send_cmd('modprobe', 'kprobe_example')
+        # lsmod
+        self.send_check("lsmod", "| grep kprobe_example | cut -d\' \' -f1", "kprobe_example")
+        # check result
+        self.send_check_in("cat", "/var/log/messages | grep _do_fork", "_do_fork")
+        # rmmod
+        self.send_cmd('rmmod', 'kprobe_example')
+
+    @OETestID(44)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_kretprobe_example(self):
+        # check config
+        self.check_config("CONFIG_KPROBES")
+        # make sure if module exists
+        self.check_module_exist("kprobes/", "kretprobe_example.ko")
+        # modprobe
+        self.send_cmd('modprobe', 'kretprobe_example')
+        # lsmod
+        self.send_check("lsmod", "| grep kretprobe_example | cut -d\' \' -f1", "kretprobe_example")
+        # check result
+        self.send_check_in("dmesg", "| grep Planted | head -n10", "Planted")
+#        status, output = self.target.run('dmesg | grep Planted | head -n10')
+#        msg = 'check result, output: %s' % output
+#        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        self.send_cmd('rmmod kretprobe_example')
+
+    @OETestID(63)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_kobject_example(self):
+        # make sure if module exists
+        self.check_module_exist("kobject/", "kobject-example.ko")
+        # modprobe
+        self.send_cmd('modprobe', 'kobject_example')
+        # lsmod
+        self.send_check("lsmod", "| grep kobject_example | cut -d\' \' -f1", "kobject_example")
+        # check result
+        status, output = self.target.run('ls /sys/kernel/kobject_example/')
+        msg = 'check result failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        self.send_cmd('rmmod kobject_example')
+
+    @OETestID(64)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_kset_example(self):
+        # make sure if module exists
+        self.check_module_exist("kobject/", "kset-example.ko")
+        # modprobe
+        self.send_cmd('modprobe', 'kset_example')
+        # lsmod
+        self.send_check("lsmod", "| grep kset_example | cut -d\' \' -f1", "kset_example")
+        # check result
+        status, output = self.target.run('ls /sys/kernel/kset_example/')
+        msg = 'check result failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        self.send_cmd('rmmod kset_example')
+
+    # kfifo
+    @OETestID(53)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_dma_example(self):
+        # make sure if module exists
+        self.check_module_exist("kfifo/", "dma-example.ko")
+        # modprobe
+        self.send_cmd('modprobe', 'dma-example')
+        # lsmod
+        self.send_check("lsmod", "| grep dma_example | cut -d\' \' -f1", "dma_example")
+        # check result
+        status, output = self.target.run('dmesg | grep \"test passed\"')
+        msg = 'check result failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        self.send_cmd('rmmod dma-example')
+
+    @OETestID(54)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_bytestream_example(self):
+        # make sure if module exists
+        self.check_module_exist("kfifo/", "bytestream-example.ko")
+        # modprobe
+        self.send_cmd('modprobe', 'bytestream-example')
+        # lsmod
+        self.send_check("lsmod", "| grep bytestream_example | cut -d\' \' -f1", "bytestream_example")
+        # check result
+        status, output = self.target.run('dmesg | grep \"test passed\"')
+        msg = 'check result failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        self.send_cmd('rmmod bytestream-example')
+
+    @OETestID(55)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_inttype_example(self):
+        # make sure if module exists
+        self.check_module_exist("kfifo/", "inttype-example.ko")
+        # modprobe
+        self.send_cmd('modprobe', 'inttype-example')
+        # lsmod
+        self.send_check("lsmod", "| grep inttype_example | cut -d\' \' -f1", "inttype_example")
+        # check result
+        status, output = self.target.run('dmesg | grep \"test passed\"')
+        msg = 'check result failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        self.send_cmd('rmmod inttype-example')
+
+    @OETestID(56)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_inttype_example(self):
+        # make sure if module exists
+        self.check_module_exist("kfifo/", "record-example.ko")
+        # modprobe
+        self.send_cmd('modprobe', 'record-example')
+        # lsmod
+        self.send_check("lsmod", "| grep record_example | cut -d\' \' -f1", "record_example")
+        # check result
+        status, output = self.target.run('dmesg | grep \"test passed\"')
+        msg = 'check result failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        self.send_cmd('rmmod record-example')
+
+    @OETestID(63)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_hw_breakpoint_example(self):
+        # check config
+        self.check_config("CONFIG_KALLSYMS_ALL")
+        # make sure if module exists
+        self.check_module_exist("hw_breakpoint/", "data_breakpoint.ko")
+        # modprobe
+        self.send_cmd('modprobe', 'data_breakpoint')
+        # lsmod
+        self.send_check("lsmod", "| grep data_breakpoint | cut -d\' \' -f1", "data_breakpoint")
+        # check result
+        self.send_check_in("cat", "/var/log/messages | grep sample_hbp_handler", "sample_hbp_handler")
+        # rmmod
+        self.send_cmd('rmmod data_breakpoint')
+
+    @OETestID(73)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_configfs_sample(self):
+        # make sure if module exists
+        self.check_module_exist("configfs/", "configfs_sample.ko")
+        # modprobe
+        self.send_cmd('modprobe', 'configfs_sample')
+        # lsmod
+        self.send_check("lsmod", "| grep configfs_sample | cut -d\' \' -f1 | head -n1", "configfs_sample")
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
+
+    @OETestID(83)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_cn_test(self):
+        # check config
+        status, ret = self.target.run('zcat /proc/config.gz | grep CONFIG_CONFIGFS_FS')
+        if not ["CONFIG_CONFIGFS_FS=m" in ret or "CONFIG_CONFIGFS_FS=y" in ret]:
+            self.skipTest("CONFIG error")
+        # make sure if module exists
+        self.check_module_exist("connector/", "cn_test.ko")
+        # modprobe
+        self.send_cmd('modprobe', 'cn_test')
+        # lsmod
+        self.send_check("lsmod", "| grep cn_test | cut -d\' \' -f1", "cn_test")
+        # check result
+        self.send_check_in("cat", "/proc/net/connector | grep cn_test | head -n1 | cut -d\' \' -f1", "cn_test")
diff --git a/meta/lib/oeqa/runtime/cases/ksample_abs.py b/meta/lib/oeqa/runtime/cases/ksample_abs.py
new file mode 100644
index 0000000..719f1a0
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/ksample_abs.py
@@ -0,0 +1,272 @@
+import os
+import time
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfNotFeature
+
+class KSample(OERuntimeTestCase):
+    def send_cmd(self, cmd='', content=''):
+        comd = cmd + " " + content
+        status, ret = self.target.run(comd)
+        msg = '%s failed, %s' % (comd, ret)
+        self.assertEqual(status, 0, msg=msg)
+
+    def check_config(self, config_opt=''):
+        cmd = "zcat /proc/config.gz | grep %s" % config_opt
+        status, ret = self.target.run(cmd)
+        result = ("%s=y" % config_opt) in ret
+        if not result:
+            self.skipTest("CONFIG error")
+
+    def check_module_exist(self, path='', module_name=''):
+        status, ret = self.target.run("uname -r")
+        cmd = "ls " + "/lib/modules/" + ret + "/kernel/samples/" + path + module_name
+        status, output = self.target.run(cmd)
+        if status != 0:
+            error_info = module_name + "doesn't exist"
+            self.skipTest(error_info)
+
+    def send_check(self, cmd='', content='', comp=''):
+        comd = cmd + " " + content
+        status, ret = self.target.run(comd)
+        self.assertEqual(ret, comp, comd)
+
+    def send_check_in(self, cmd='', content='', comp=''):
+        comd = cmd + " " + content
+        status, ret = self.target.run(comd)
+        result = ("%s" % comp) in ret
+        self.assertTrue(result)
+        self.assertEqual(status, 0, comd)
+
+class KSampleTest(KSample):
+    #trace
+    @OETestID(33)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_trace_events(self):
+        # check config
+        self.check_config("CONFIG_TRACING_SUPPORT")
+        # make sure if module exists
+        self.check_module_exist("trace_events/", "trace-events-sample.ko")
+        # modprobe
+        self.send_cmd("modprobe", "trace-events-sample")
+        # lsmod
+        self.send_check("lsmod", "| grep trace_events_sample | cut -d\' \' -f1", "trace_events_sample")
+        # check dir
+        self.send_check("ls", "/sys/kernel/debug/tracing/events/ | grep sample-trace", "sample-trace")
+        # enable trace
+        self.send_cmd("echo 1 > /sys/kernel/debug/tracing/events/sample-trace/enable")
+        self.send_cmd("cat /sys/kernel/debug/tracing/events/sample-trace/enable")
+        # check result
+        self.send_check("cat", "/sys/kernel/debug/tracing/trace | grep hello | head -n1 | cut -d\':\' -f2", " foo_bar")
+        # disable trace
+        self.send_cmd('echo 0 > /sys/kernel/debug/tracing/events/sample-trace/enable')
+        # clean up trace
+        self.send_cmd('echo > /sys/kernel/debug/tracing/trace')
+        # rmmod
+        self.send_cmd('rmmod trace-events-sample')
+
+    @OETestID(34)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_trace_printk(self):
+        # check config
+        self.check_config("CONFIG_TRACING_SUPPORT")
+        # make sure if module exists
+        self.check_module_exist("trace_printk/", "trace-printk.ko")
+        # modprobe
+        self.send_cmd('modprobe', 'trace-printk')
+        # lsmod
+        self.send_check("lsmod", "| grep trace_printk | cut -d\' \' -f1", "trace_printk")
+        # check result
+        self.send_check("cat", "/sys/kernel/debug/tracing/trace | grep trace_printk_irq_work | head -n1 | cut -d\':\' -f2", " trace_printk_irq_work")
+        # clean up trace
+        self.send_cmd('echo > /sys/kernel/debug/tracing/trace')
+        # rmmod
+        self.send_cmd('rmmod trace-printk')
+    # kprobe
+    @OETestID(43)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_kprobe_example(self):
+        # check config
+        self.check_config("CONFIG_KPROBES")
+        # make sure if module exists
+        self.check_module_exist("kprobes/", "kprobe_example.ko")
+        # modprobe
+        self.send_cmd('modprobe', 'kprobe_example')
+        # lsmod
+        self.send_check("lsmod", "| grep kprobe_example | cut -d\' \' -f1", "kprobe_example")
+        # check result
+        self.send_check_in("cat", "/var/log/messages | grep _do_fork", "_do_fork")
+        # rmmod
+        self.send_cmd('rmmod', 'kprobe_example')
+
+    @OETestID(44)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_kretprobe_example(self):
+        # check config
+        self.check_config("CONFIG_KPROBES")
+        # make sure if module exists
+        self.check_module_exist("kprobes/", "kretprobe_example.ko")
+        # modprobe
+        self.send_cmd('modprobe', 'kretprobe_example')
+        # lsmod
+        self.send_check("lsmod", "| grep kretprobe_example | cut -d\' \' -f1", "kretprobe_example")
+        # check result
+        self.send_check_in("dmesg", "| grep Planted | head -n10", "Planted")
+#        status, output = self.target.run('dmesg | grep Planted | head -n10')
+#        msg = 'check result, output: %s' % output
+#        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        self.send_cmd('rmmod kretprobe_example')
+
+    @OETestID(63)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_kobject_example(self):
+        # make sure if module exists
+        self.check_module_exist("kobject/", "kobject-example.ko")
+        # modprobe
+        self.send_cmd('modprobe', 'kobject_example')
+        # lsmod
+        self.send_check("lsmod", "| grep kobject_example | cut -d\' \' -f1", "kobject_example")
+        # check result
+        status, output = self.target.run('ls /sys/kernel/kobject_example/')
+        msg = 'check result failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        self.send_cmd('rmmod kobject_example')
+
+    @OETestID(64)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_kset_example(self):
+        # make sure if module exists
+        self.check_module_exist("kobject/", "kset-example.ko")
+        # modprobe
+        self.send_cmd('modprobe', 'kset_example')
+        # lsmod
+        self.send_check("lsmod", "| grep kset_example | cut -d\' \' -f1", "kset_example")
+        # check result
+        status, output = self.target.run('ls /sys/kernel/kset_example/')
+        msg = 'check result failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        self.send_cmd('rmmod kset_example')
+
+    # kfifo
+    @OETestID(53)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_dma_example(self):
+        # make sure if module exists
+        self.check_module_exist("kfifo/", "dma-example.ko")
+        # modprobe
+        self.send_cmd('modprobe', 'dma-example')
+        # lsmod
+        self.send_check("lsmod", "| grep dma_example | cut -d\' \' -f1", "dma_example")
+        # check result
+        status, output = self.target.run('dmesg | grep \"test passed\"')
+        msg = 'check result failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        self.send_cmd('rmmod dma-example')
+
+    @OETestID(54)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_bytestream_example(self):
+        # make sure if module exists
+        self.check_module_exist("kfifo/", "bytestream-example.ko")
+        # modprobe
+        self.send_cmd('modprobe', 'bytestream-example')
+        # lsmod
+        self.send_check("lsmod", "| grep bytestream_example | cut -d\' \' -f1", "bytestream_example")
+        # check result
+        status, output = self.target.run('dmesg | grep \"test passed\"')
+        msg = 'check result failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        self.send_cmd('rmmod bytestream-example')
+
+    @OETestID(55)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_inttype_example(self):
+        # make sure if module exists
+        self.check_module_exist("kfifo/", "inttype-example.ko")
+        # modprobe
+        self.send_cmd('modprobe', 'inttype-example')
+        # lsmod
+        self.send_check("lsmod", "| grep inttype_example | cut -d\' \' -f1", "inttype_example")
+        # check result
+        status, output = self.target.run('dmesg | grep \"test passed\"')
+        msg = 'check result failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        self.send_cmd('rmmod inttype-example')
+
+    @OETestID(56)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_inttype_example(self):
+        # make sure if module exists
+        self.check_module_exist("kfifo/", "record-example.ko")
+        # modprobe
+        self.send_cmd('modprobe', 'record-example')
+        # lsmod
+        self.send_check("lsmod", "| grep record_example | cut -d\' \' -f1", "record_example")
+        # check result
+        status, output = self.target.run('dmesg | grep \"test passed\"')
+        msg = 'check result failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # rmmod
+        self.send_cmd('rmmod record-example')
+
+    @OETestID(63)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_hw_breakpoint_example(self):
+        # check config
+        self.check_config("CONFIG_KALLSYMS_ALL")
+        # make sure if module exists
+        self.check_module_exist("hw_breakpoint/", "data_breakpoint.ko")
+        # modprobe
+        self.send_cmd('modprobe', 'data_breakpoint')
+        # lsmod
+        self.send_check("lsmod", "| grep data_breakpoint | cut -d\' \' -f1", "data_breakpoint")
+        # check result
+        self.send_check_in("cat", "/var/log/messages | grep sample_hbp_handler", "sample_hbp_handler")
+        # rmmod
+        self.send_cmd('rmmod data_breakpoint')
+
+    @OETestID(73)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_configfs_sample(self):
+        # make sure if module exists
+        self.check_module_exist("configfs/", "configfs_sample.ko")
+        # modprobe
+        self.send_cmd('modprobe', 'configfs_sample')
+        # lsmod
+        self.send_check("lsmod", "| grep configfs_sample | cut -d\' \' -f1 | head -n1", "configfs_sample")
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
+
+    @OETestID(83)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_cn_test(self):
+        # check config
+        status, ret = self.target.run('zcat /proc/config.gz | grep CONFIG_CONFIGFS_FS')
+        if not ["CONFIG_CONFIGFS_FS=m" in ret or "CONFIG_CONFIGFS_FS=y" in ret]:
+            self.skipTest("CONFIG error")
+        # make sure if module exists
+        self.check_module_exist("connector/", "cn_test.ko")
+        # modprobe
+        self.send_cmd('modprobe', 'cn_test')
+        # lsmod
+        self.send_check("lsmod", "| grep cn_test | cut -d\' \' -f1", "cn_test")
+        # check result
+        self.send_check_in("cat", "/proc/net/connector | grep cn_test | head -n1 | cut -d\' \' -f1", "cn_test")
-- 
2.8.1


