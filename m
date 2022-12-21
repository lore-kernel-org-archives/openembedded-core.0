Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B1CC3DA7C
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 12:53:23 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.17930.1671627196303025828
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 04:53:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MfArz5sJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id i187-20020a1c3bc4000000b003d1e906ca23so1437650wma.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 04:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gs7qJ10r1MW7uLXSk86BxIm8lJ3fMF94ITbsaI5Wy6Y=;
        b=MfArz5sJQE+gmhly6pUsGWXfYC2z3umuPRG70CbTV0YwQGkKE5CEumuQ0JQNrmUNPt
         RXKm6+0yYkwsU+SBTXrGH97wir6c1RVavgJZAGChFd3dXh40exPTA0GMsJgDNlxtA6Ai
         xvLuDEFXg4x4PwoqfR2TWD5tv1rC85Zu5Qw1gp2qMTlIL+OjVS8v+nMwbIUcxu2KCpTD
         J33/ly9cmqgjV3thvrA6qKrumZat+oXtd75Df2qspvDWGW9eC7AkNGAC6/FLXSTboc+A
         kgKB1oRd/YLIohxtuEwuDNLgFJtNHSpXaS7ApW2gTZpMHse6LGTlCG80I2bAWcJRbioa
         G+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gs7qJ10r1MW7uLXSk86BxIm8lJ3fMF94ITbsaI5Wy6Y=;
        b=UBu7dC2/f9cTqbsYWx9sxqWf7Hf+vjZXVEw0lyg7uXNRaLmomKLW1Gd3T/DFMccPJW
         sbclOtBfO0G4rLIKn9csVo/TqvCcVADW57EnOL/oHuJwP8nYbExFIMxOTw7J8AqHcw7F
         pSF8zg3HY1XSvHjYQ16lgnx5hRz6CK7hC+DWrqoMOA3pZcUxu1Nye/flv4/DNQFGqY8N
         jRtgRBHanpDnu/SSFHmUARhN/VyQwx1Yc4zOSgVOugLaLyrWReCT3T1JWGSZoarpQNG1
         FrfSCjTl2QSSw/bztOQ9iHYciTXTXvN/c4mUElTsRmb6g3XzGdyTGa36EAtq6QNKbRIm
         UcGQ==
X-Gm-Message-State: AFqh2krq0iSBnwuFgmedR6BhBhWbudU8w8zqZfdryGnrQvLzpyaG/2u5
	6ao1tcrkOUTTESl9VhELmMz3cHBOLhQ=
X-Google-Smtp-Source: AMrXdXvE48pLsKqMJCW3PdEDYYwwxIJ1gkyDB25XyotN+c0kLyb2fkSD/v2gyMch+DYiAI+3Gp1RGw==
X-Received: by 2002:a1c:6a14:0:b0:3d1:f302:1975 with SMTP id f20-20020a1c6a14000000b003d1f3021975mr1569541wmc.33.1671627194360;
        Wed, 21 Dec 2022 04:53:14 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id m6-20020a7bcb86000000b003b47ff307e1sm2124097wmi.31.2022.12.21.04.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 04:53:13 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 01/10] oeqa/runtime/rust: Add basic compile/run test
Date: Wed, 21 Dec 2022 12:52:56 +0000
Message-Id: <20221221125306.13779-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221125306.13779-1-alex.kiernan@gmail.com>
References: <20221221125306.13779-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 12:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174907

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

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


