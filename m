Return-Path: <osama.abdelkader@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B04A7CAC592
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 17:23:00 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.13742.1757870570559755861
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 10:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SvRX39KQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: osama.abdelkader@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45cb5e5e71eso21387015e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 10:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757870569; x=1758475369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IOYcms6oKzCvClZXVgY3DNLGiC+vPNZiWOnXm5UzT60=;
        b=SvRX39KQ31owN/EwM5Ykl6Aj5KdzXZkgFa8y+SVMdDlemBD06OmJ00NBwkj2WTYytz
         1g2CGJVmKfs1L5DBwdqZn3CT9C8SWO+/eZJf0HA2I4GVH/g1VrBlbThrNS0Cjg3x8Hie
         vmT/4WXj7jHsPd9Ld0cdZWsntVwkbGaniZXbT/3Uz3F4+X7RijPe3BgYTJczw9PJ3Tbx
         aTDa4uANRdaHkk20wfQ5k74uaqnFfThAnv9omthiNAQUIp3hCuJRU9gcZ3Sc/IIGbdOA
         V2Ih4Ml/cTkts1ZvAkYfzryKaVjIRoW7w5iv1Ng1fZzZU8gDRyL21F0xbSpg6PbEpUih
         PSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757870569; x=1758475369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOYcms6oKzCvClZXVgY3DNLGiC+vPNZiWOnXm5UzT60=;
        b=QpR8f5ckd/iK26ZWLH9gcYZkU3sZGnYT+eKnRS9AihlsGPf3wJfzWekOzvUX1fxnNb
         XqgOMsCfwR2qpT8QFC+sjRH/9glipHGwcHk615kmqrfJk7JiVYwIx/2l7+5ofQCnPt4P
         mq5+nGmdzoq34niWSqOM5UiT102xAwX/2EYwG5dLFPb0PGBHHEagl0SXpDI6lkRpQNZK
         ElMKlF7qE4zeyaiMubl78P6kaujKGYqjESDgkokurcRaG7ojkP8MbI1Babfi9kdASEQD
         t5fZ2OqwNI1mMwZx61Kv9NzaRuOkTUpbT0QMe7uXGyKfZ+RcLciZAbAQy9A2Yayy9l5b
         Ccdg==
X-Gm-Message-State: AOJu0Yw376gSwmKCuU5+ulyFiQXMqyxqFVN0Q5b0maP9hUcn0Wtl/ID7
	iVdxORRxlDIUriGNzGnH3xJMEijJhFdLv/Pr8+1kCbCpMP28SYzeEawm1piSWg==
X-Gm-Gg: ASbGnctMPjUeJ1LMjAzxV3SMrNRojvHPQwkc5yFbi9VeSa2AX8M/N9utL+zyXc1IhQE
	xIx3mav1IvrFa6MR25q+broAYS9Yw80oDrzdhCwtM0lUCdZmGtKa5FY+2dc7QCagaUyqFnAhwM3
	HYKPK7dqKSL8veGAW2DrkO8lYHL6zYWHTxzzkFDOLge5jgS4s4OPwYpaiR1uqP47Je/scqobsLI
	nMSKDGrVQ5O1cassxQq0tVEBPiogTlBZZq90eeJzaJr+CdJH4MzAR5ms+fs+88w2u+UG0yoXfkX
	/EkESHhIHvkjcVCjGRuAMJYvS5NeDLGeAdGdAcYyl1+R9gxZthGajxSdeRHIUSTUthT9QUJV4Pz
	k0TL8pWekXFHcR0jUX+pYPrIBTjRfiMUF1L0eiQUU7cAmlWVMz9PxSr6ll9vPDG3moo6En9yrP+
	sPee9kEhwWhtPdJQ==
X-Google-Smtp-Source: AGHT+IF/Hs7iepPzTurkgoKR7Ao1iVH0R6041NT2NmkmMPL91NxLDsb59zsmj9N0P7+B85KQctGNSw==
X-Received: by 2002:a05:6000:2407:b0:3e4:bb5f:ee6d with SMTP id ffacd0b85a97d-3e765795c68mr9033399f8f.15.1757870568708;
        Sun, 14 Sep 2025 10:22:48 -0700 (PDT)
Received: from osama.. ([156.223.20.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9b1ab74b8sm3467300f8f.5.2025.09.14.10.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 10:22:48 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com,
	mathieu.dubois-briand@bootlin.com
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH v2 1/2] go: extend runtime test
Date: Sun, 14 Sep 2025 19:22:42 +0200
Message-ID: <20250914172243.19403-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 17:23:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223362

extend go runtime test with a simple test file, and simple
go module test to validate go compilation and execution on
target.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 meta/lib/oeqa/files/test.go       |  7 ++++
 meta/lib/oeqa/runtime/cases/go.py | 70 ++++++++++++++++++++++++++++++-
 2 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oeqa/files/test.go

diff --git a/meta/lib/oeqa/files/test.go b/meta/lib/oeqa/files/test.go
new file mode 100644
index 0000000000..9ca9302654
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
index 39a80f4dca..6ac06d2629 100644
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
@@ -18,4 +86,4 @@ class GoHelloworldTest(OERuntimeTestCase):
         self.assertEqual(status, 0, msg=msg)
 
         msg = 'Incorrect output: %s' % output
-        self.assertEqual(output, "Hello, world!", msg=msg)
+        self.assertEqual(output, "Hello, world!", msg=msg)
\ No newline at end of file
-- 
2.43.0


