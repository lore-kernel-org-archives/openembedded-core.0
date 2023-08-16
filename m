Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A01C41513
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 05:42:37 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.154917.1692164552097724622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 22:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iAAreM8b;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so92998371fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 22:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692164550; x=1692769350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jLMovLvkpqDEY2WJ/PyHXu6wwtbX4ZiUBRXq0ULsIAw=;
        b=iAAreM8bwr3AZHe68argPfYoR95LDcjXMqfJvaCQY49I15eTXlE8cmr75dcRZz9n7G
         FBeMWWxJvGUzKMMsbT0Pzi4zQtXOBA0SqvIReub4YO7GbEAP1mxfckV5keNqTTuZ3481
         V5NbHgq3+2yqBdWz3kUAfwLzJQpR+gqV/yJgrJfvbgdPkotQWrHsELMQkfS3rVVFUU/V
         NbSL6+D6iMosh8fwDzrNgNhGLgnW05oGwSkaqOxv4HG32GrJfNJ3+/U0RtN504X+drmb
         /feEaaXId+tkGFKaZzN9F/4oCUFzRmI1hxn/LiE+a9GM+fA1LI5w/BzgDqLVbzcRWoUG
         81NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692164550; x=1692769350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLMovLvkpqDEY2WJ/PyHXu6wwtbX4ZiUBRXq0ULsIAw=;
        b=JcfZImrC3l+onfvi8RFL/R9uhpuIK/8c7/BaGKOCr93sAst7Nh9wttNH4bBEhaCjWw
         refWeT8GKyV09TArrG5cAu03hBa6DOUDTeZ4DafhzqQzBfCxzazggYZB5WZV3KcTOWZM
         0I110LOSHRFwZvPmSFrQQMmCHlljLHz5E8EKWDwTYQpV7fU9gqzx/V1Kt94SchirZFH1
         AzigDpJrm44tJxhv1WfRvPvKEc4S9IRqPXZSZiPXjSnr8EYJiqOArDBSz2KhgC8SU4QQ
         S9yGpDVixOE3Kb3fLfhcpwP89tVyuz30ml4BUFCpEk/KWk5PhJxGGYUKJhKaj3eoC41O
         h8FA==
X-Gm-Message-State: AOJu0YyXPtOp2KbtxLB0W0dXJY++goMQyjE3Srk3+UzCrDP6CZphq9jK
	Kq7nLISgQLKaIr+qvxcZavmk3zLFmIw=
X-Google-Smtp-Source: AGHT+IGci5MBJQ5GKvrXd0jtn2QX09zze4R5OLKD/reFA1ceSsB5FPzXhB8HYLBPGjIWU2eoCJPp1Q==
X-Received: by 2002:a2e:8295:0:b0:2b6:e0b5:b76d with SMTP id y21-20020a2e8295000000b002b6e0b5b76dmr597148ljg.45.1692164549879;
        Tue, 15 Aug 2023 22:42:29 -0700 (PDT)
Received: from work-pc.sigfox.io ([2a01:e0a:8d5:c6c0:bd52:73a6:cb33:609])
        by smtp.gmail.com with ESMTPSA id h18-20020a1ccc12000000b003fbd9e390e1sm23053371wmb.47.2023.08.15.22.42.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 22:42:29 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATHCH V4 4/4] oeqa/runtime/rust: correct rust test
Date: Wed, 16 Aug 2023 07:42:02 +0200
Message-Id: <f3edd23cf8958deeeb9636d1d79d29b0626a1ca4.1692164369.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692164369.git.frederic.martinsons@gmail.com>
References: <cover.1692164369.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 05:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186113

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


