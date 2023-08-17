Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02319C2FC15
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 05:04:37 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.180181.1692248674681651750
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 22:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YHRpw1F6;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-319e93a1594so1280070f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692248673; x=1692853473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jLMovLvkpqDEY2WJ/PyHXu6wwtbX4ZiUBRXq0ULsIAw=;
        b=YHRpw1F6uDEEaZD1y2QGnTG9X36EVQjXyH/ky8sjAutgGcsNnRdW/4dz5DAIP/ZloD
         YVEuvXFWYpOYqvI0Tzm2qM/WHRlbYzqTUpu+ud5r3IXAVCZlPOBKfnyIJP3ncgz+VbkZ
         wypv4ttW3IfMycw3MBl++29DWf+MvNttKRSvJlR9n+m++CDNPci0CGPKX4Jff+JENL18
         YBJXyIBbK6adM1b91FuFn/RRQNVyLVI+DsijDvHp2dip0sbds7ZpE+0cZjzE4siWi+TV
         u97SUSXhSz1OO91TDctxVQtMwrcgKYbsyPH6qcefa2ta2Z8Qf3fH3V5hC8TJ0E+NXlP9
         UHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692248673; x=1692853473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLMovLvkpqDEY2WJ/PyHXu6wwtbX4ZiUBRXq0ULsIAw=;
        b=bPWPRdrKKV/dmLgZxfB7XbmIuL/e5audBD7VxoNhwIoCotV9kCdZOJw8kDTuWePnk+
         /02EtgHil6Hp0EEwGp82chDLX1B1fx/KWps0Iz7MU24WSE2/vuNxcngMPhKQWJdErwnw
         +JYt/8vrBWhypcAntOMmvPFpM3OAQHbN5nOSoAWSSnZFfdCNjL2kCN9SYA6aK4Ox47I5
         CH+1Oj1kBBDR9Fd9hpK2z4VhRMpGY8unqwYk2v42GqflY5vr6b1W1kqo83FuDpKJhSWF
         8ueGRXEE//SyPm0fDSqW1L6wyvqrkPnaI2Elxok3yN3vvc4bqvtJlB7DN+xZbKdjPood
         q8tg==
X-Gm-Message-State: AOJu0YzAUSIXtBVO/RRT8PZ9c7zGvwJcs/3PwQ55R/Vj2LmXa6mocUA+
	dwY0/sTLRo8uDm+DvuOnVJ01fhUQQM4=
X-Google-Smtp-Source: AGHT+IFYM4aP+qjR+1reizBdEJbEk3aCQuP/sDDoAcbuxORR2AlgEhcLv+YhUKk+ipVSMNkNujVKNg==
X-Received: by 2002:adf:d08c:0:b0:31a:d551:c2c9 with SMTP id y12-20020adfd08c000000b0031ad551c2c9mr836075wrh.6.1692248672460;
        Wed, 16 Aug 2023 22:04:32 -0700 (PDT)
Received: from work-pc.sigfox.io ([2a01:e0a:8d5:c6c0:67b0:818b:2f62:9f02])
        by smtp.gmail.com with ESMTPSA id s17-20020a7bc391000000b003fd2e89620asm1503040wmj.40.2023.08.16.22.04.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 22:04:32 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATHCH V6 4/4] oeqa/runtime/rust: correct rust test
Date: Thu, 17 Aug 2023 07:04:16 +0200
Message-Id: <cad5efa7339e23f999b07500602db5c8ec786279.1692248342.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692248342.git.frederic.martinsons@gmail.com>
References: <cover.1692248342.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 05:04:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186286

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


