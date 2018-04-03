Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
	by mail.openembedded.org (Postfix) with ESMTP id E9A5F74953
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 15:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2605; q=dns/txt; s=iport;
	t=1522769115; x=1523978715;
	h=from:to:cc:subject:date:message-id;
	bh=DljciNfIQgRBu2hvrWa9/ftHYyQBBjhA3VtDk0Ckuwk=;
	b=jnjf0ztdSW9jXQQ+1aYkt9veUlamL8HpNVoyQcHvXkhXno6Pwph8H2CA
	49KIikx+9IjrlFAChzklFhvexpDWZnQyGUkogcOGwWGbHsDeM7KSXtVKS
	roeSghCAQA1YHQNNMQJBrpEMv+c1GG61XGLTPU0HiRwv5y9Z1kmn1kB87 A=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AXAgAgnMNa/49dJa1dGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYNCYW8omGSDA5RPCxuEaIREITcVAQIBAQEBAQECayiGIoF?=
	=?us-ascii?q?RhQ2vMIhDgiWHYYITg1yBf4NwhQgCjFOKaAiFUohdAoFoik2PVgIREwGBJTI?=
	=?us-ascii?q?igVJNIxWCfQmCFxeONh8wjj0BAQ?=
X-IronPort-AV: E=Sophos;i="5.48,401,1517875200"; d="scan'208";a="374177555"
Received: from rcdn-core-7.cisco.com ([173.37.93.143])
	by rcdn-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2018 15:25:12 +0000
Received: from kamensky-w541.cisco.com ([10.82.174.186]) (authenticated bits=0)
	by rcdn-core-7.cisco.com (8.14.5/8.14.5) with ESMTP id w33FP1rp001083
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Tue, 3 Apr 2018 15:25:10 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2018 08:25:01 -0700
Message-Id: <1522769101-4576-1-git-send-email-kamensky@cisco.com>
X-Mailer: git-send-email 2.7.4
X-Authenticated-User: kamensky@cisco.com
Cc: Alexander Kanavin <alexander.kanavin@intel.com>
Subject: [PATCH v2] oeqa/runtime/stap.py: add runtime test for systemtap
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
X-List-Received-Date: Tue, 03 Apr 2018 15:25:14 -0000

Add runtime test for stap to test basic SystemTap
operations: can compile very basic module and run on
target device.

Note we disable (-DSTP_NO_VERREL_CHECK) SystemTap
additional kernel release check since during OE testing
mismatching kernel-devsrc and kernels are used.

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---

 v2 updates:
    * prepare in /usr/src/kernel make as in
      kernelmodule.py

    * use of uname -r for kernel release retrieval

    * adds -DSTP_NO_VERREL_CHECK to allow mismatch
      between running kernel and kernel-devsrc

 meta/lib/oeqa/runtime/cases/stap.py   | 33 +++++++++++++++++++++++++++++++++
 meta/lib/oeqa/runtime/files/hello.stp |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/stap.py
 create mode 100644 meta/lib/oeqa/runtime/files/hello.stp

diff --git a/meta/lib/oeqa/runtime/cases/stap.py b/meta/lib/oeqa/runtime/cases/stap.py
new file mode 100644
index 0000000..fc728bf
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/stap.py
@@ -0,0 +1,33 @@
+import os
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfNotFeature
+
+class StapTest(OERuntimeTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        src = os.path.join(cls.tc.runtime_files_dir, 'hello.stp')
+        dst = '/tmp/hello.stp'
+        cls.tc.target.copyTo(src, dst)
+
+    @classmethod
+    def tearDownClass(cls):
+        files = '/tmp/hello.stp'
+        cls.tc.target.run('rm %s' % files)
+
+    @OETestID(1652)
+    @skipIfNotFeature('tools-profile',
+                      'Test requires tools-profile to be in IMAGE_FEATURES')
+    @OETestDepends(['kernelmodule.KernelModuleTest.test_kernel_module'])
+    def test_stap(self):
+        cmds = [
+            'cd /usr/src/kernel && make scripts prepare',
+            'cd /lib/modules/`uname -r` && (if [ ! -L build ]; then ln -s /usr/src/kernel build; fi)',
+            'stap --disable-cache -DSTP_NO_VERREL_CHECK /tmp/hello.stp'
+            ]
+        for cmd in cmds:
+            status, output = self.target.run(cmd, 900)
+            self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
diff --git a/meta/lib/oeqa/runtime/files/hello.stp b/meta/lib/oeqa/runtime/files/hello.stp
new file mode 100644
index 0000000..3677147
--- /dev/null
+++ b/meta/lib/oeqa/runtime/files/hello.stp
@@ -0,0 +1 @@
+probe oneshot { println("hello world") }
-- 
2.7.4


