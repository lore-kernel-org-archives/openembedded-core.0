Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097DEC04A6A
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 15:36:13 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.137297.1692113771380049153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 08:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jfjnOlUg;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3197b461bb5so1544405f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 08:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692113769; x=1692718569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jLMovLvkpqDEY2WJ/PyHXu6wwtbX4ZiUBRXq0ULsIAw=;
        b=jfjnOlUgZAa5TBOYIS+KazZPoOFKmc6dK1RUbQQGQM2T0g1nogVUe4iell0atgB0g+
         BUy5C+ToCE8K1lvsyOnu88Wn/sqeoEW4y6oKf6sVQ7F0B1Pz83RSlG8wgPvhJFIpBTgw
         RzApKJtKnF0S3JRK5Rh2DxTq923uUmJL0AM8n2YtITW/4npZD3DQv3mlm48BkNjtLk09
         Vb3/idqnbZ4qQgjatI+T2J2usXM7Ox7VX9wMM4Z2ElweB4fliI2Gl7XNqdYTIingWIzD
         WqEHKUuk2gXIOxUHfgFiIxPyWHPUu/nQLf5jbMNj7EDLieTHTCgfHHRdbhWRRqOv1Ywc
         iipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692113769; x=1692718569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLMovLvkpqDEY2WJ/PyHXu6wwtbX4ZiUBRXq0ULsIAw=;
        b=TrxgvVUf8F8B5T5raXtIvSoctDFbuD2TXMJ1bfqGva9KmzmnCf0k7rgVJ2RpvD/H92
         DZeUUAcH7Bx6xu+AexfRkUiXAM0qxIjG4uCNFceGMzajUeMFyI9m3qwoiVD1yJCCDr2l
         xIhB+a3pmNgwxId+rpijKg17ZsTZimoc8RKfTtDlUEV/BH2zjcXb3mq5eVYt3MyAj5Gp
         HL9fROXrpZcj0lv61F8rxSf+ksyWe2oO3w0/Go4xGT1YmTPCFV6B2k1CREFxCOIf3RU5
         kk7OpnCMMtnCpUfE719gMWMkB1ZjqozMylEzJKclZ8SbVmtWT4COzsFn22gXuvm0N+5+
         R+pA==
X-Gm-Message-State: AOJu0YznE5EA74XUhKz3vIH2dvfR/pEuhWoeWjREdRe0pYlzVYql4k9Z
	beojH6NMmMMhF9ziXOLA21PzH6b+6KI=
X-Google-Smtp-Source: AGHT+IFceJBe/rACmh2yx4/IMqJJGfY/WtMgGYpQp8DsOhQZ9dl6IFUaPYKdzsko811MR2r34bMoyQ==
X-Received: by 2002:a05:6000:120e:b0:319:82c9:8e7d with SMTP id e14-20020a056000120e00b0031982c98e7dmr2463235wrx.31.1692113769527;
        Tue, 15 Aug 2023 08:36:09 -0700 (PDT)
Received: from work-pc.sigfox.io ([2a01:e0a:8d5:c6c0:fa4d:a159:cb9e:8fc4])
        by smtp.gmail.com with ESMTPSA id f6-20020adffcc6000000b0031984b370f2sm3046241wrs.47.2023.08.15.08.36.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 08:36:09 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATHCH V3 4/4] oeqa/runtime/rust: correct rust test
Date: Tue, 15 Aug 2023 17:35:37 +0200
Message-Id: <54350619f9061e564455a380e7e415bb5e6fcba6.1692099121.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692099121.git.frederic.martinsons@gmail.com>
References: <cover.1692099121.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 15:36:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186076

From: Frederic Martinsons <frederic.martinsons@gmail.com>

Since setUp of RustCompileTest use cls.tc.copyTo, those tests needs the scp command:

NOTE: ======================================================================
NOTE: FAIL: test_cargo_compile (rust.RustCompileTest)
NOTE: ----------------------------------------------------------------------
NOTE: Traceback (most recent call last):
  File "/home/jenkins/yocto-poky-master/poky/meta/lib/oeqa/core/case.py", line 53, in _oeSetUp
    self.setUpMethod()
  File "/home/jenkins/yocto-poky-master/poky/meta/lib/oeqa/runtime/cases/rust.py", line 17, in setUp
    cls.tc.target.copyTo(src, dst)
  File "/home/jenkins/yocto-poky-master/poky/meta/lib/oeqa/core/target/ssh.py", line 132, in copyTo
    return self._run(scpCmd, ignore_status=False)
  File "/home/jenkins/yocto-poky-master/poky/meta/lib/oeqa/core/target/ssh.py", line 81, in _run
    raise AssertionError("Command '%s' returned non-zero exit "
AssertionError: Command '['scp', '-o', 'ServerAliveCountMax=2', '-o', 'ServerAliveInterval=30', '-o', 'UserKnownHostsFile=/dev/null', '-o', 'StrictHostKeyChecking=no', '-o', 'LogLevel=ERROR', '-r', '-P', '2222', '/home/jenkins/yocto-poky-master/poky/meta/lib/oeqa/files/test.rs', 'root@127.0.0.1:/tmp/']' returned non-zero exit status 1:
sh: scp: not found
lost connection

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/lib/oeqa/runtime/cases/rust.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/rust.py b/meta/lib/oeqa/runtime/cases/rust.py
index 39707cf5cf..123c942012 100644
--- a/meta/lib/oeqa/runtime/cases/rust.py
+++ b/meta/lib/oeqa/runtime/cases/rust.py
@@ -24,7 +24,8 @@ class RustCompileTest(OERuntimeTestCase):
         cls.tc.target.run('rm -r %s' % dirs)
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
-    @OEHasPackage(['rust'])
+    @OEHasPackage('rust')
+    @OEHasPackage('openssh-scp')
     def test_rust_compile(self):
         status, output = self.target.run('rustc /tmp/test.rs -o /tmp/test')
         msg = 'rust compile failed, output: %s' % output
@@ -35,7 +36,8 @@ class RustCompileTest(OERuntimeTestCase):
         self.assertEqual(status, 0, msg=msg)
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
-    @OEHasPackage(['cargo'])
+    @OEHasPackage('cargo')
+    @OEHasPackage('openssh-scp')
     def test_cargo_compile(self):
         status, output = self.target.run('cargo new /tmp/hello')
         msg = 'cargo new failed, output: %s' % output
-- 
2.34.1


