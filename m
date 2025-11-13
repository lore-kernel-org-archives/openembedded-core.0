Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4FB7CD6E4C
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 12:28:57 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22641.1763036928834897013
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 04:28:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=IivVGTY7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2025111312284656fdb2b3890002077e-mb2xjb@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025111312284656fdb2b3890002077e
        for <openembedded-core@lists.openembedded.org>;
        Thu, 13 Nov 2025 13:28:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=S2ZJvUyhQHoksFcVhuBdPaxPux1n1/R68vQ3WRUOfuw=;
 b=IivVGTY7zcf9t4zY+8gQXYxHVK9nidtsMVW15cn9VTl+tuWOKlzERiB+6IWtaPy0cWWmQS
 frFCVJc1VVebA3r/TBoK3NatU0HgSFiTZPIF6myxpHEWWB10XMIy6Hb6FGjzm8OATl1Nkxqf
 Zivr/BmcCBtyVp5DQWlaKaHCjtS+w291LgppYx28O+b70kSwHUPYBtb514ju0Y8FiG17cX1C
 bRLoV9zWVgn5ew+AmhDqIghK5SdH0I8n0Ts+sc4q0tFhkV1PTq7IdTaTLdWGFvTToi3whxRD
 qbm47VjhrwmcE7qohQdgnO5rwmHxkSKmCZdwF93GmWjidLaR/hHsKsjw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 6/9] go: extend runtime test
Date: Thu, 13 Nov 2025 13:28:03 +0100
Message-Id: <20251113122806.16769-7-peter.marko@siemens.com>
In-Reply-To: <20251113122806.16769-1-peter.marko@siemens.com>
References: <20251113122806.16769-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 12:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226244

From: Osama Abdelkader <osama.abdelkader@gmail.com>

extend go runtime test with a simple test file, and simple
go module test to validate go compilation and execution on
target.

(From OE-Core rev: e3b2b9170f76f4bbdc41ea6ba7bccffc17d01968)

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oeqa/files/test.go       |  7 ++++
 meta/lib/oeqa/runtime/cases/go.py | 68 +++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta/lib/oeqa/files/test.go

diff --git a/meta/lib/oeqa/files/test.go b/meta/lib/oeqa/files/test.go
new file mode 100644
index 00000000000..9ca93026546
--- /dev/null
+++ b/meta/lib/oeqa/files/test.go
@@ -0,0 +1,7 @@
+package main
+
+import "fmt"
+
+func main() {
+	fmt.Println("Hello from Go!")
+}
diff --git a/meta/lib/oeqa/runtime/cases/go.py b/meta/lib/oeqa/runtime/cases/go.py
index 39a80f4dcae..fc7959b5f4b 100644
--- a/meta/lib/oeqa/runtime/cases/go.py
+++ b/meta/lib/oeqa/runtime/cases/go.py
@@ -4,10 +4,78 @@
 # SPDX-License-Identifier: MIT
 #
 
+import os
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 
+class GoCompileTest(OERuntimeTestCase):
+
+    @classmethod
+    def setUp(cls):
+        dst = '/tmp/'
+        src = os.path.join(cls.tc.files_dir, 'test.go')
+        cls.tc.target.copyTo(src, dst)
+
+    @classmethod
+    def tearDown(cls):
+        files = '/tmp/test.go /tmp/test'
+        cls.tc.target.run('rm %s' % files)
+        dirs = '/tmp/hello-go'
+        cls.tc.target.run('rm -r %s' % dirs)
+
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage('go')
+    @OEHasPackage('go-runtime')
+    @OEHasPackage('go-runtime-dev')
+    @OEHasPackage('openssh-scp')
+    def test_go_compile(self):
+        # Check if go is available
+        status, output = self.target.run('which go')
+        if status != 0:
+            self.skipTest('go command not found, output: %s' % output)
+
+        # Compile the simple Go program
+        status, output = self.target.run('go build -o /tmp/test /tmp/test.go')
+        msg = 'go compile failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        # Run the compiled program
+        status, output = self.target.run('/tmp/test')
+        msg = 'running compiled file failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage('go')
+    @OEHasPackage('go-runtime')
+    @OEHasPackage('go-runtime-dev')
+    @OEHasPackage('openssh-scp')
+    def test_go_module(self):
+        # Check if go is available
+        status, output = self.target.run('which go')
+        if status != 0:
+            self.skipTest('go command not found, output: %s' % output)
+
+        # Create a simple Go module
+        status, output = self.target.run('mkdir -p /tmp/hello-go')
+        msg = 'mkdir failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        # Copy the existing test.go file to the module
+        status, output = self.target.run('cp /tmp/test.go /tmp/hello-go/main.go')
+        msg = 'copying test.go failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        # Build the module
+        status, output = self.target.run('cd /tmp/hello-go && go build -o hello main.go')
+        msg = 'go build failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        # Run the module
+        status, output = self.target.run('cd /tmp/hello-go && ./hello')
+        msg = 'running go module failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
 class GoHelloworldTest(OERuntimeTestCase):
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['go-helloworld'])

