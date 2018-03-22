Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
	by mail.openembedded.org (Postfix) with ESMTP id C023771C14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 17:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2165; q=dns/txt; s=iport;
	t=1521741219; x=1522950819;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=zlz51M82rxCz203biIrkdENu0K+qEC3MPz3w6DVzhkA=;
	b=bK7xcXt5eDohwyty9BR6FOHD2y2MEDlw9d1nOr5SeDIrZcys/wBNFES/
	/0eCv3M83hmJsgyLMMqEf3Dn12JSKdW0a94pLfAp5dhe/JEYioATKp0/G
	MopaXBoxHKgfBvPUUqoCyy2XvVTrWA9UH3Qcb2e3CBFq3TZTUQOVJQrk/ 8=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AsAQBv7bNa/5NdJa1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYM9YXAoi1uNDIMEkmGCBgsbhGoCg2MhNBgBAgEBAQEBAQJrKIU?=
	=?us-ascii?q?mBnkQUVcZhQ6sfYg/gg6FL4IRghSDXoF/g3SFCQONAop8CIVeiRQCgXWLCgGPZ?=
	=?us-ascii?q?QIREwGBJRw4gVJNIxWCfQmCGBiONh8wkFoBAQ?=
X-IronPort-AV: E=Sophos;i="5.48,345,1517875200"; d="scan'208";a="371250017"
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
	by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2018 17:53:39 +0000
Received: from kamensky-w541.cisco.com ([10.24.9.3]) (authenticated bits=0)
	by rcdn-core-11.cisco.com (8.14.5/8.14.5) with ESMTP id w2MHrQEY001227
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Thu, 22 Mar 2018 17:53:38 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2018 10:53:26 -0700
Message-Id: <1521741206-5138-2-git-send-email-kamensky@cisco.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521741206-5138-1-git-send-email-kamensky@cisco.com>
References: <1521741206-5138-1-git-send-email-kamensky@cisco.com>
X-Authenticated-User: kamensky@cisco.com
Cc: Alexander Kanavin <alexander.kanavin@intel.com>,
	Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Subject: [PATCH] oeqa/runtime/stap.py: add runtime test for systemtap
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
X-List-Received-Date: Thu, 22 Mar 2018 17:53:37 -0000

Add runtime test for stap to test basic SystemTap
operations: can compile very basic module and run on
target device.

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
 meta/lib/oeqa/runtime/cases/stap.py   | 33 +++++++++++++++++++++++++++++++++
 meta/lib/oeqa/runtime/files/hello.stp |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/stap.py
 create mode 100644 meta/lib/oeqa/runtime/files/hello.stp

diff --git a/meta/lib/oeqa/runtime/cases/stap.py b/meta/lib/oeqa/runtime/cases/stap.py
new file mode 100644
index 0000000..005da71
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
+            'cd /usr/src/kernel && make scripts',
+            'cd /lib/modules/* && (if [ ! -L build ]; then ln -s /usr/src/kernel build; fi)',
+            'stap --disable-cache /tmp/hello.stp'
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


