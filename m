Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.8258.1621343176103184660
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 May 2021 06:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=JWNWZhGr;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pemorrow@linux.microsoft.com)
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 2D1DA20B7178;
	Tue, 18 May 2021 06:06:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2D1DA20B7178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1621343175;
	bh=jYC9I8Cuxa9e3Q2msSPzhflm8NP64OUEuI89NMIgn18=;
	h=From:To:Cc:Subject:Date:From;
	b=JWNWZhGruJp0JSSIAYtMKgKTUy1tI3fgRjjHckgVkWeuFpyl9lECvvf4jPfsQ5Oy8
	 gAHWrJjFTwE4aIbIzNhaF31nYHf/u6b/6NmmF8p5lo/u6BL8MpKCeNDuCr7MqtKXQk
	 oL6lQ+rCzkRYr/W55fRFVxvEn4VXKq5cgFUSM4S8=
From: "Peter Morrow" <pemorrow@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.morrow@microsoft.com
Subject: [PATCH] oeqa: sdk: basic go toolchain test support
Date: Tue, 18 May 2021 06:05:33 -0700
Message-Id: <1621343133-5221-1-git-send-email-pemorrow@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1

Add a simple build test for the golang toolchain which is produced into a SDK.

Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
---
 meta/lib/oeqa/sdk/cases/go.py   | 34 ++++++++++++++++++++++++++++++++++
 meta/lib/oeqa/sdk/files/test.go |  7 +++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/lib/oeqa/sdk/cases/go.py
 create mode 100644 meta/lib/oeqa/sdk/files/test.go

diff --git a/meta/lib/oeqa/sdk/cases/go.py b/meta/lib/oeqa/sdk/cases/go.py
new file mode 100644
index 0000000..1af5516
--- /dev/null
+++ b/meta/lib/oeqa/sdk/cases/go.py
@@ -0,0 +1,34 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+import os
+import shutil
+import unittest
+
+from oeqa.core.utils.path import remove_safe
+from oeqa.sdk.case import OESDKTestCase
+
+from oeqa.utils.subprocesstweak import errors_have_output
+errors_have_output()
+
+class GoCompileTest(OESDKTestCase):
+    @classmethod
+    def setUpClass(self):
+        files = {'test.go' : self.tc.files_dir}
+        for f in files:
+            shutil.copyfile(os.path.join(files[f], f),
+                    os.path.join(self.tc.sdk_dir, f))
+
+    def setUp(self):
+        if not self.tc.hasHostPackage("^nativesdk-go", regex=True):
+            raise unittest.SkipTest("GoCompileTest class: SDK doesn't contain a golang toolchain")
+
+    def test_go_compile(self):
+        self._run('go build -o %s/test %s/test.go' % (self.tc.sdk_dir, self.tc.sdk_dir))
+
+    @classmethod
+    def tearDownClass(self):
+        files = [os.path.join(self.tc.sdk_dir, f) for f in ['test.go', 'test']]
+        for f in files:
+            remove_safe(f)
diff --git a/meta/lib/oeqa/sdk/files/test.go b/meta/lib/oeqa/sdk/files/test.go
new file mode 100644
index 0000000..089f721
--- /dev/null
+++ b/meta/lib/oeqa/sdk/files/test.go
@@ -0,0 +1,7 @@
+package main
+
+import "fmt"
+
+func main() {
+    fmt.Println("hello world!")
+}
-- 
1.8.3.1

