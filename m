Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BD4C10F1D
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 21:17:16 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.30730.1671657434978134351
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 13:17:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U0kr8HRd;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id bx10so16254785wrb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 13:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaZVSThNxhLP0U5ZelX6j69OiGr3IC3+Zk5gqf7nA5c=;
        b=U0kr8HRdCoLdWmFUAb3rdySMWGRnI9YK319/U+pUrN8gNljrxUfEYHcaB9P6V/IYi9
         WgHISat8JtNH6FVhFT1jnoNfS+LxewdDVIt3Lck50Ryy8hc6RjoSFthgav50GaDHLLR6
         rbeOKEwPPmTAZpSpiP6mI9GJF+XaC0GD0cB0HZ+iC0oxWsIaEZ5Ako5/BgZPU4Vfv1pe
         5XVXJwAyX0LpkpPrBPWze+3L7NskFMk180ocZljzHss+kBgdqWT0+oAbPBkdIazdjueI
         OyNF7b9pQM4tUYeTsJcPJeJBAril5VdWhBzF6qByx5AO7kqaZ6ApPnR3Y06flwsgP6LM
         uM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uaZVSThNxhLP0U5ZelX6j69OiGr3IC3+Zk5gqf7nA5c=;
        b=rw6YtXzN/FQgsKMvZuBJpWCPbDW2myYUWM8wGK4B7/ptDefjoYJwyBdtM2sSceN0Yh
         fG7+V8LZL6Xt6g8IppQh56LjohCoWHT+Z+pZlCwd2EhUcLGwxUP2vsJ6gOp4QV6hFduM
         kyfgjRCw2EEfDVY0lJCzNdBVbXBjwn29td9Zc0THVEHIyEJ1WpOJits/iJq3K1Al2YKk
         PbRybki8j0wduvSfSWkNYZFW42NrKVXyP6ovdybzku7yWV94t3tALy+36E+rbnNX+lW7
         AimFBXwh6kZ8zLf0444nF5G0pEDK/MtSbo1D6/PjNci1BGwimM0xYKZqguKn5aPAhOfC
         MBlg==
X-Gm-Message-State: AFqh2kp/7ITxK1vz1LXphlP3XqyClMYCcPUGtK3sc8Txg33BgXFt6uWw
	Q+1m6gmhAPORWGytMyFTcpYna9yJA/s=
X-Google-Smtp-Source: AMrXdXtVeLQepp+8Us8hKnG8K4YXf5T+4DMbczUWtjbyjc8iwRBcLCEJqrtZtoHKinp3cMsFaJcvZA==
X-Received: by 2002:a5d:58fc:0:b0:242:7f6e:9192 with SMTP id f28-20020a5d58fc000000b002427f6e9192mr2209531wrd.52.1671657433211;
        Wed, 21 Dec 2022 13:17:13 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id bx25-20020a5d5b19000000b00225307f43fbsm16312442wrb.44.2022.12.21.13.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 13:17:12 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v3 01/10] oeqa/runtime/rust: Add basic compile/run test
Date: Wed, 21 Dec 2022 21:16:57 +0000
Message-Id: <20221221211706.25347-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221211706.25347-1-alex.kiernan@gmail.com>
References: <20221221211706.25347-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 21:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174941

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v3:
- Switch to packagegroup-core-sdk driven from TARGET_TOOLCHAIN_LANGS
  (which defaults to SDK_TOOLCHAIN_LANGS)

Changes in v2:
- Drop rust.inc/rust.bb merge, not actually made use of in the change
  set
- Reorder so cargo test goes after build fixes

 meta/lib/oeqa/files/test.rs         |  2 ++
 meta/lib/oeqa/runtime/cases/rust.py | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/lib/oeqa/files/test.rs

diff --git a/meta/lib/oeqa/files/test.rs b/meta/lib/oeqa/files/test.rs
new file mode 100644
index 000000000000..f79c691f0853
--- /dev/null
+++ b/meta/lib/oeqa/files/test.rs
@@ -0,0 +1,2 @@
+fn main() {
+}
diff --git a/meta/lib/oeqa/runtime/cases/rust.py b/meta/lib/oeqa/runtime/cases/rust.py
index 55b280d61d8a..186bb0d79e15 100644
--- a/meta/lib/oeqa/runtime/cases/rust.py
+++ b/meta/lib/oeqa/runtime/cases/rust.py
@@ -8,6 +8,30 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 
+class RustCompileTest(OERuntimeTestCase):
+
+    @classmethod
+    def setUp(cls):
+        dst = '/tmp/'
+        src = os.path.join(cls.tc.files_dir, 'test.rs')
+        cls.tc.target.copyTo(src, dst)
+
+    @classmethod
+    def tearDown(cls):
+        files = '/tmp/test.rs /tmp/test'
+        cls.tc.target.run('rm %s' % files)
+
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['rust'])
+    def test_rust_compile(self):
+        status, output = self.target.run('rustc /tmp/test.rs -o /tmp/test')
+        msg = 'rust compile failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        status, output = self.target.run('/tmp/test')
+        msg = 'running compiled file failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
 class RustHelloworldTest(OERuntimeTestCase):
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['rust-hello-world'])
-- 
2.39.0


