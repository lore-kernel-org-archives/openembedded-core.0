Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 43D356C76F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 07:23:30 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Oct 2013 00:23:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,520,1378882800"; d="scan'208";a="376510190"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 18 Oct 2013 00:23:31 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 49DB56A4009;
	Fri, 18 Oct 2013 00:23:28 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Oct 2013 10:23:44 +0300
Message-Id: <1382081024-19912-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] lib/oeqa/runtime: build kernel module on target test
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
X-List-Received-Date: Fri, 18 Oct 2013 07:23:31 -0000

Builds a simple Hello World module on target.
Added to the defaults for core-image-sato-sdk.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/classes/testimage.bbclass                |  2 +-
 meta/lib/oeqa/runtime/files/hellomod.c        | 19 +++++++++++++++
 meta/lib/oeqa/runtime/files/hellomod_makefile |  8 +++++++
 meta/lib/oeqa/runtime/kernelmodule.py         | 33 +++++++++++++++++++++++++++
 4 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oeqa/runtime/files/hellomod.c
 create mode 100644 meta/lib/oeqa/runtime/files/hellomod_makefile
 create mode 100644 meta/lib/oeqa/runtime/kernelmodule.py

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 2f9c974..5d61c2b 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -28,7 +28,7 @@ TEST_LOG_DIR ?= "${WORKDIR}/testimage"
 DEFAULT_TEST_SUITES = "ping auto"
 DEFAULT_TEST_SUITES_pn-core-image-minimal = "ping"
 DEFAULT_TEST_SUITES_pn-core-image-sato = "ping ssh df connman syslog xorg scp vnc date rpm smart dmesg"
-DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "ping ssh df connman syslog xorg scp vnc date perl ldd gcc rpm smart dmesg"
+DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "ping ssh df connman syslog xorg scp vnc date perl ldd gcc rpm smart kernelmodule dmesg"
 
 TEST_SUITES ?= "${DEFAULT_TEST_SUITES}"
 
diff --git a/meta/lib/oeqa/runtime/files/hellomod.c b/meta/lib/oeqa/runtime/files/hellomod.c
new file mode 100644
index 0000000..a383397
--- /dev/null
+++ b/meta/lib/oeqa/runtime/files/hellomod.c
@@ -0,0 +1,19 @@
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+
+static int __init hello_init(void)
+{
+        printk(KERN_INFO "Hello world!\n");
+        return 0;
+}
+
+static void __exit hello_cleanup(void)
+{
+        printk(KERN_INFO "Cleaning up hellomod.\n");
+}
+
+module_init(hello_init);
+module_exit(hello_cleanup);
+
+MODULE_LICENSE("GPL");
diff --git a/meta/lib/oeqa/runtime/files/hellomod_makefile b/meta/lib/oeqa/runtime/files/hellomod_makefile
new file mode 100644
index 0000000..b92d5c8
--- /dev/null
+++ b/meta/lib/oeqa/runtime/files/hellomod_makefile
@@ -0,0 +1,8 @@
+obj-m := hellomod.o
+KDIR := /usr/src/kernel
+
+all:
+	$(MAKE) -C $(KDIR) M=$(PWD) modules
+
+clean:
+	$(MAKE) -C $(KDIR) M=$(PWD) clean
diff --git a/meta/lib/oeqa/runtime/kernelmodule.py b/meta/lib/oeqa/runtime/kernelmodule.py
new file mode 100644
index 0000000..cbc5742
--- /dev/null
+++ b/meta/lib/oeqa/runtime/kernelmodule.py
@@ -0,0 +1,33 @@
+import unittest
+import os
+from oeqa.oetest import oeRuntimeTest, skipModule
+from oeqa.utils.decorators import *
+
+def setUpModule():
+    if not oeRuntimeTest.hasFeature("tools-sdk"):
+        skipModule("Image doesn't have tools-sdk in IMAGE_FEATURES")
+
+
+class KernelModuleTest(oeRuntimeTest):
+
+    def setUp(self):
+        self.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "hellomod.c"), "/tmp/hellomod.c")
+        self.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "hellomod_makefile"), "/tmp/Makefile")
+
+    @skipUnlessPassed('test_ssh')
+    @skipUnlessPassed('test_gcc_compile')
+    def test_kernel_module(self):
+        cmds = [
+            'cd /usr/src/kernel && make scripts',
+            'cd /tmp && make',
+            'cd /tmp && insmod hellomod.ko',
+            'lsmod | grep hellomod',
+            'dmesg | grep Hello',
+            'rmmod hellomod', 'dmesg | grep "Cleaning up hellomod"'
+            ]
+        for cmd in cmds:
+            (status, output) = self.target.run(cmd, 900)
+            self.assertEqual(status, 0, msg="\n".join([cmd, output]))
+
+    def tearDown(self):
+        self.target.run('rm -f /tmp/Makefile /tmp/hellomod.c')
-- 
1.8.3.1


