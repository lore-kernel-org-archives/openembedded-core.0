Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A43C3DA7B
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 18:07:24 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.57309.1671559636214307821
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 10:07:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QQvwOcxs;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id f13-20020a1cc90d000000b003d08c4cf679so9451770wmb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 10:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkX+OL5XGvyNxIw1EJ1jBvBfH7lZ2ywO9otqk6cGgFY=;
        b=QQvwOcxsaICNWgpGWxeySH3FTFQFsVSFKIMxPFid7MiriR1RKWj7c2U1YUShIqSiIl
         NnLQ5MzCFUayA9hwGDr1gUR/euskY5qGGWl17EbqaFHPJRaME94/DbVsRM/JsF71yC3O
         6w55EjaFJkqVa0rQCcgijWfcWu+5cLQ2hwIKs6ksFF+ZJF3Gss+r3o6acKidjssk1paI
         8lpaBV2k4SINPDKeKuWD2QZDNLSkythwhqJPyghSco/Ylx9geLa+uqJ1MsyJvFIKs1N/
         H4Rq4W7bDSxQ7Gxe9KpAoUrgR82XFibCpzEciyy0TeSIHTPAImSmrWWVYCiyw4SUZQ9k
         CnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AkX+OL5XGvyNxIw1EJ1jBvBfH7lZ2ywO9otqk6cGgFY=;
        b=2R+gE4G2AXsEjjJMxQicm3KTdmRGWbZd1hoASRQ4s5BYQF2+ZzPBJIWL6MMA/Yefl7
         ysFc8kQmFmISUlBJFankAfWpsGQ5yHrXCqZTotQPI4sXwgbEoswxRP0kK9/RQ996f+Ve
         uewg1OL4O8+faprKAoaKzHlH/+GqSeZiYAEV4z8JwoREPBOcHAQ2OJac6CAwm+UdPiIn
         ZWjp2pjiMh41MZnmesNpfT2NJjbB+mPtOMPNA11ilX2n4C5m5N8a4b3NSAAVnq7LFEtk
         42sATuZO3ce9TntdSWizlIVVEfluYYxJ2y0zw2NUew/5yBk5QaV3LjHQo/4wjJkGsZKM
         MQ3A==
X-Gm-Message-State: ANoB5pnL6FmJJ5j0gk6uGXBD4bqZUJX2drDNyPv6vCJxiKPqS9U6RYRP
	zaFzXXewHldYILTWP9a+hm44joY/Zg8=
X-Google-Smtp-Source: AA0mqf7jYUibT9H5j797GwnDdhcc6XccUDKyn8gXTDZiyuGg16J+pWvYS+NXoHffWJvLEt3KqRWfug==
X-Received: by 2002:a05:600c:5407:b0:3c6:e63e:89a6 with SMTP id he7-20020a05600c540700b003c6e63e89a6mr36279169wmb.2.1671559634447;
        Tue, 20 Dec 2022 10:07:14 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id u9-20020a05600c00c900b003cf37c5ddc0sm16243754wmm.22.2022.12.20.10.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 10:07:14 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH][PATCH 01/11] oeqa/runtime/rust: Add basic compile/run test
Date: Tue, 20 Dec 2022 18:06:02 +0000
Message-Id: <20221220180612.24555-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221220180612.24555-1-alex.kiernan@gmail.com>
References: <20221220180612.24555-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 18:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174861

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

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


