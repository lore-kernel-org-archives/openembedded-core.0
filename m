Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 161BDCFD314
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 22:15:14 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3769.1763849706486067922
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 14:15:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yItI+W28;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-343f52d15efso2881373a91.3
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 14:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763849706; x=1764454506; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzjsQQtJYMQioekYxe9GPABswCu5A3JFdvJpb/7sw+I=;
        b=yItI+W28VweQQOktMRQ1hzvUJVY/A4z6TlbXsIIAMWi/s2wGx9ycDaXBbCcD0+yT6V
         jNdMW49V6ACOXJWiOFNbepza2BYmDcAhEvBcr6sgji/Gs2oc7SS5MqURhp+HXkekfsUr
         UFt9LVuxSBdmnIRN/nCz8/CrmsIJEPBVTZWf16crHfySMOn4vgjpYxObItKiFa22t4Uc
         PW1zkqAeeT12sewUtSSDY0UWTXKZ1xoGuXylq8Y5tMZc7X1+Z8dM2JB81MIkV+HoowtW
         R5L25YP4VC8YK8nOW2EzXKdky0MYiCczKo1/dZ5dR7U08CF2Gf9nnllSExzDBftChCo0
         Pufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763849706; x=1764454506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MzjsQQtJYMQioekYxe9GPABswCu5A3JFdvJpb/7sw+I=;
        b=E0E2CX0GUXUekbi9MNlrnSowwtX+kjiidSnejhMCuw/czw5HjZiNF9lVz2lHY0ZHIp
         t1L8Ue3BVI1kV+o6JHTeC4ukGOCWc/O3pq6gx6IX3/9KVPdl6xZkPcwyAIALeCCTOHpV
         vFq4Y5zz2m285KCQwFOOeeKdbn/7jErw6LTVosW/sty52bRrxXVlLnL1uMMCnbMJb+Qd
         WV2BNfaE8YymAhLPXRlAUBYQHD8GLivotGVu31Qbu6g4HtM8mqlfg4+U4k94mq7QJD6x
         eUMYpLnGNAV6bcjMvBBwL4kyLv+L0vAvePe9/qy7ZQqE8LCR+9o8f6Fj51WOsdtLMzy4
         bOZw==
X-Gm-Message-State: AOJu0YxpLZfthttZv+Cl86CEeVZrD8QqngcIvdhsZ0Kpvt6KSZGllA2M
	X5hbdx22oNWkiMlJivi9GY4LXmJWZ38h6FQL8T2p0eA6I/E3tYVkXkU5GPqX3sMz2KpagF7dI/N
	D47wG
X-Gm-Gg: ASbGnctSI8RhGMydjMZb70/o5RDvykmV/S2R7hDdSOxY+eIp4QDaXm5Pc4aHLMRKQ3V
	uUf2ZoxSQRyzvuw4cQKUZdzVA6LycNch3x5rKK8eN0resxs0LEzb07pG0y9DukLrSFefXqb0R8X
	An80j54TdTxZTgRXl9DFTAzOQTdkd9aRrAL5UnLF5nvpfszlQ3wAY+/rxx4o85cfLGAvUloTq/J
	CqDSn6epHODPVimu1WSlHvW1/Nj2+ppq+/ImXSn4oyj9gUZ6Vj2D/z9ybnlLJixaW8BjoVz7nZG
	5nUQ1AOEfxRtFktL8UdMiD6jczMrccMvyF3bKTmlTkJqndhr0vGbuk6tkYFVzhX0VYZ5G1Bt91a
	Br8VCRib9cdRKtRgIv5qHjourpY3UqQSOApSm8dCI0n5WbHlLclYHswEOHzRGg9nHleQ2Ny9Rox
	ejaQ==
X-Google-Smtp-Source: AGHT+IEXD3sdCT44xh40QV0pM9UkYywhqYvbokCSsHEfWgPfHTho7CI7pSvYF2sVdXiOCLikzjIsYw==
X-Received: by 2002:a17:90b:380a:b0:340:b152:efe7 with SMTP id 98e67ed59e1d1-34733e5934cmr6845712a91.11.1763849705698;
        Sat, 22 Nov 2025 14:15:05 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:a812:a9e4:3291:bb61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af26d8b1sm7158274a91.3.2025.11.22.14.15.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:15:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/21] go: extend runtime test
Date: Sat, 22 Nov 2025 14:14:23 -0800
Message-ID: <bda3e3711f84394423c15f48fb4e75258fec199a.1763849517.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763849517.git.steve@sakoman.com>
References: <cover.1763849517.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 22:15:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226715

From: Osama Abdelkader <osama.abdelkader@gmail.com>

extend go runtime test with a simple test file, and simple
go module test to validate go compilation and execution on
target.

(From OE-Core rev: e3b2b9170f76f4bbdc41ea6ba7bccffc17d01968)

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/files/test.go       |  7 ++++
 meta/lib/oeqa/runtime/cases/go.py | 68 +++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)
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
index 39a80f4dca..fc7959b5f4 100644
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
-- 
2.43.0


