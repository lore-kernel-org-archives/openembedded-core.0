Return-Path: <osama.abdelkader@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47164CAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 23:21:51 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.1593.1757719302152691910
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 16:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XvLzV1nk;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: osama.abdelkader@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b9a856dc2so15957815e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 16:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757719300; x=1758324100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dbfFhPaEIr4NJyb38J/qdvXcIOzSkj+wW5aafXq1J3A=;
        b=XvLzV1nk7cvGw1+KYhSljEr7XurbTT/YipoCLLJ1fPa79FbUWWdOFfEUDDFjmw5AHn
         Mm7jLmkA8xHD+0+ZgcHhu4ku90I5GwRdX4Xrc+trmYwz+X2IgqUXxQsYtQvc8DzuzcId
         ERwFJNZ8i4SLomvGGZGMiFpT6NHtUuL9FOam1P9AYDsKlCiaHYO+b0LQQ0wsywuK1Koq
         yuP6mtBLolTNr8TZ66YGYeI9pNTnDr4yDNpzlbiCcf4W7Cnm9csdIGllhZZboPU5pvDH
         wjuW0RfUR4xqOwjvL702Mn+nlKKPmLBjwqTaxwpIT0K84U8TQ3/2+ZtQc3RTvp+ioM92
         2F/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757719300; x=1758324100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dbfFhPaEIr4NJyb38J/qdvXcIOzSkj+wW5aafXq1J3A=;
        b=rFRnrbRHVrzPtToYo0zJ9FQKIEIp20M9cdIoYEC+3+14+Sbjrxk26o08RhnXwgVLhw
         yvNCyXmfs7kaUPUIrJVEeA6f9dWNs0ALnS5MXEF0ewQIAusZmG3zbd9iMWojZ1xFUJOO
         j9m+BavX71t4my+JA2lIVkvZuioD4zmbnzM4tpGUUPuqwnpCFtv2tHMSp+IImENRrQk3
         k3QuWaRXxNc7F3N6RIj4VM+J95fOZj0092PAZoSh6Qllc332gNsRRts4FvYhdHvkPGWv
         Z5yY5hkIfBAVFsdbGJkmOau7FWSlOWxavyNSX3VKAos3GqgrLwTNojGncvlDLP21NWnt
         UfdA==
X-Gm-Message-State: AOJu0YxPGNq6DCqiiveP7UWcabMe3Nn1h0QtSVbNXiaDKa9ChkXIM8XR
	WzbG3DJutSF27y3u7ePIaoK49Tt4sUBK69oLTcswpQZAAXryvz2PZJL4179EdA==
X-Gm-Gg: ASbGncuj5hCyllqULefNfqfmkB/bXNcbA5I8l2kKEO4p8hOBfOi4mll7h9nZCSAO7uy
	0ufvvhj8hukIBByyuMqQ3WA8lQae5TCm601sjtq+BpTxlNJZP/it8lXblNdn+yRoTwAafRWjIz7
	wYNc+IJSrHP/zLlau8ss552E6QRnwXOpW/1PTR/+3H1ZjgE8cM1lyDHeq9fykyL6ZZ6nu+k1JvH
	Rm9/vJ4aBwC48HEso018uEcOAbwSKeiIJTHy5ICu8UQ+/Ucu/cjZu2LFeERUZo4s9jASYgP9wkf
	sNPNRa1HB3C0gBLzAbG9inhpn/MUI19edRPaP+DXrn8AfakwCjLr3LF7v9Rd/Iib2aUJ+JWdGpR
	iWmuFcaAMThgifVzpT88InbIDrH16eZ5lD5DgO/pYVcRQzCXV/sXZ369ZewU6h3HHchVKUG9DTc
	1/jA==
X-Google-Smtp-Source: AGHT+IGgPDnWYVTLVqchqy2wbUr2VetqpEhElhmiHxaYn8vFRpPioErOPbiKftCN6Z+fOsMzYLhR9Q==
X-Received: by 2002:a05:600c:26d2:b0:45d:e326:96ef with SMTP id 5b1f17b1804b1-45f211cff73mr33730035e9.15.1757719300316;
        Fri, 12 Sep 2025 16:21:40 -0700 (PDT)
Received: from osama.. ([41.232.5.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037c3ce5sm76808145e9.16.2025.09.12.16.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 16:21:39 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH 1/2] go: extend runtime test
Date: Sat, 13 Sep 2025 01:21:09 +0200
Message-ID: <20250912232110.1794088-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 23:21:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223338

extend go runtime test with a simple test file, and simple
go module test to validate go compilation and execution on
target.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 meta/lib/oeqa/files/test.go       |  7 ++++
 meta/lib/oeqa/runtime/cases/go.py | 61 ++++++++++++++++++++++++++++++-
 2 files changed, 67 insertions(+), 1 deletion(-)
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
index 39a80f4dca..abcf9f231a 100644
--- a/meta/lib/oeqa/runtime/cases/go.py
+++ b/meta/lib/oeqa/runtime/cases/go.py
@@ -4,10 +4,69 @@
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
+    @OEHasPackage('openssh-scp')
+    def test_go_compile(self):
+        # Check if go is available
+        status, output = self.target.run('which go')
+        msg = 'go command not found, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
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
+    @OEHasPackage('openssh-scp')
+    def test_go_module(self):
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
@@ -18,4 +77,4 @@ class GoHelloworldTest(OERuntimeTestCase):
         self.assertEqual(status, 0, msg=msg)
 
         msg = 'Incorrect output: %s' % output
-        self.assertEqual(output, "Hello, world!", msg=msg)
+        self.assertEqual(output, "Hello, world!", msg=msg)
\ No newline at end of file
-- 
2.43.0


