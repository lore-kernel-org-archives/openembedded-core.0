Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E00AC001DB
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 08:24:25 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.82042.1691915062211819842
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 01:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=LwuEvt8v;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3180fd48489so2694053f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 01:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691915060; x=1692519860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGYcqouuGqHiwQ27tVXRcTenVfN2DRWGUBfi3QrDGkA=;
        b=LwuEvt8vDvUaoELLNC6cCFXN53wa2J6+YyRabhAbXAoNSnJcANsRcG3VXbtRlR5A6F
         KtLLYREiqCcRsm0o1qauha2ZJaa6eO5o1puI3R6EslqX7cUAuhROS/IltIIqs5NH8iLM
         0UGuX0QkN3wKQ1FlwqRYOXyFVsu0n2xhU+RVKzs5Iw7K13fa6p6UJ+/cGNcQWETw7hqm
         03p5+gK3VyJ1j23S8De0Zh7MTONr4T5gKhOZx7s8vlEHphudM+ToQ+ev94gEQ1+LGlem
         +waYFZfRkDZftqXQyN2m513w1JoaI3Sadl8Pn0Iak5Q6oNGgRvKUfKS9LJZ/JIWe4y0a
         mV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691915060; x=1692519860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lGYcqouuGqHiwQ27tVXRcTenVfN2DRWGUBfi3QrDGkA=;
        b=lzFaN6LCGt/P3kr74LQnTdkqylzuvC8agR6HdHMK2Z3xmbwICKMjLr53ev8faiWdAu
         GeY46SiduzZglpvDCk1Hs3uZ1fRkWM/FS9DtIgeziboXRNvvABQgDPZfFS0x4KZ0Ewe6
         UvTF8GfCaYbLVwUemULNlATMRAhy/9PWK0j+ybedPzVi24AcEbQADPHTI/z5At9HgvHN
         9h/3bF0sNrntEfxaq1EeQ1sANao4NZk3NhuYuguf+Vyjkg9/hsv4t/xi8nvtD18MRDxm
         v7XfpE74cdomugRj8Fae9yn7TjKVaEqRVs+XdFTChFRNE8CGY6YKZTY1MVwtCJ+BL0QQ
         NhzA==
X-Gm-Message-State: AOJu0YwKZZGJH4LDHlyUXE2P1NMCyNRFLpo7H5OiDq9xQplGXre6nL3C
	y2aqqS+DJwgoKnKaDzFww5IAcyg7h3w=
X-Google-Smtp-Source: AGHT+IHRs47sG6gLnyHJv44xeLz6uF/zKKAKMFD/8ah0Ty6tpvlrWpEsKu1+HCiVhLgle/gYBA8Kqw==
X-Received: by 2002:adf:ee52:0:b0:317:e7e0:8528 with SMTP id w18-20020adfee52000000b00317e7e08528mr4779600wro.50.1691915060312;
        Sun, 13 Aug 2023 01:24:20 -0700 (PDT)
Received: from work-pc.sigfox.io ([2a01:e0a:8d5:c6c0:e135:6fa3:a98f:aed0])
        by smtp.gmail.com with ESMTPSA id l11-20020a5d480b000000b00318147fd2d3sm10601450wrq.41.2023.08.13.01.24.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 01:24:19 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCHV2 4/4] oeqa/runtime/rust: correct rust test
Date: Sun, 13 Aug 2023 10:23:57 +0200
Message-Id: <06ec3e1167cd65850d1c8a6e7ce8f40beae3b007.1691914589.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691914589.git.frederic.martinsons@gmail.com>
References: <cover.1691914589.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 08:24:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185867

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
 meta/lib/oeqa/runtime/cases/rust.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/rust.py b/meta/lib/oeqa/runtime/cases/rust.py
index e709e4f8aa..fa6fe486e4 100644
--- a/meta/lib/oeqa/runtime/cases/rust.py
+++ b/meta/lib/oeqa/runtime/cases/rust.py
@@ -24,7 +24,7 @@ class RustCompileTest(OERuntimeTestCase):
         cls.tc.target.run('rm -r %s' % dirs)
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
-    @OEHasPackage(['rust'])
+    @OEHasPackage(['rust', 'openssh-scp'])
     def test_rust_compile(self):
         status, output = self.target.run('rustc /tmp/test.rs -o /tmp/test')
         msg = 'rust compile failed, output: %s' % output
@@ -35,7 +35,7 @@ class RustCompileTest(OERuntimeTestCase):
         self.assertEqual(status, 0, msg=msg)
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
-    @OEHasPackage(['cargo'])
+    @OEHasPackage(['cargo', 'openssh-scp'])
     def test_cargo_compile(self):
         status, output = self.target.run('cargo new /tmp/hello')
         msg = 'cargo new failed, output: %s' % output
-- 
2.34.1


