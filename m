Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 929C0C46467
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 14:19:36 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.23042.1671459569503144233
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 06:19:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H/PFrrVV;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id i187-20020a1c3bc4000000b003d1e906ca23so6005882wma.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 06:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=liWL3cTQ3dTC5E759CHzteu41e+Xim81hnFws7PW5Bs=;
        b=H/PFrrVV7edgxoOVkTIYt6Gd0svm7m+lAWtAJMv4FUNUVUDgNtHVBWYry8IjGE73gq
         fCIOpIohdTKoct+9n6bcpmVkMiF/eFelvnJmL1FrwHlo5WMAIIpEp3zbpXWmfieVghZ2
         zc5+nkO2yAdZ0iRIVNBdMJXiUy8VkCumTBOKFM+VyBGOyRGzfCJIP4GjBubZGgAnW8CH
         n6t7oNX1WudDei6KhJzoT7wei0VWcbmcfPIpLF+3HgXHBlCmH2GoxlYL6sUHsEo5s5q3
         LAU1O6ArruChrYpIGvf0ZLkGmu7y9qmwKMh8keQ+Ah2eIwaeuXUNW56BQtZMLC1sWznl
         R+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=liWL3cTQ3dTC5E759CHzteu41e+Xim81hnFws7PW5Bs=;
        b=WWkBhN1+eTcH1UxB2gbF1ACg6CqW4GVKafMBx4SX3rPOQsTYVlnjYLRF5NmXESwRA4
         gnalXgq1y1+C/kw7RGo9NAYQ4turthKPVmflLan/Pa94GRTLaL/5vvs8W4shpRsIljt3
         aa7WYFNBkQTkhenvP3Oi7SK6EiRSeagFiu99IPSXbaTr2dMf0YnK7fvnbiy3m0naVSis
         njeYJMcQlQbACZL4EO3z98oYVkR8aiR4azOsD4cl34nq4UdJotn/FbPS/n+U46ulepfD
         F7dKU715c38FN8o090EwSMoIW2WvDlIpvbfgiOuKhOCTqsL09ypb4tB610TWWRPWI7e7
         vcpA==
X-Gm-Message-State: ANoB5pl1JSbDaULj0fNkQPeIuNP1cBbLnAlcZ3Ck2uWZUOLB098bGnEy
	H+WtlqV8T+iOPbAYqvV43RiFsNBoFQ4=
X-Google-Smtp-Source: AA0mqf4lluBFXYzmlYUtw57ZxD/KLkZdFXAOETo0e2Xv8pJcl/+zXlVlzdaylCRXvL/jxocdJPY37g==
X-Received: by 2002:a05:600c:a11:b0:3d2:2a74:3a90 with SMTP id z17-20020a05600c0a1100b003d22a743a90mr21860788wmp.22.1671459567628;
        Mon, 19 Dec 2022 06:19:27 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id n7-20020a05600c3b8700b003b492753826sm13678126wms.43.2022.12.19.06.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 06:19:27 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH] oeqa/runtime/rust: Add basic compile/run test
Date: Mon, 19 Dec 2022 14:18:41 +0000
Message-Id: <20221219141840.26358-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 14:19:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174814

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


