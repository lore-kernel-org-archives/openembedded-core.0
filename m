Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74432C04A94
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 10:33:48 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.157547.1692182026957445556
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 03:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KMWtLD66;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-31963263938so3988364f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 03:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692182025; x=1692786825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jLMovLvkpqDEY2WJ/PyHXu6wwtbX4ZiUBRXq0ULsIAw=;
        b=KMWtLD66GDClwLmcIcShe6NAn4kYcusnFYDClELN4czXk1zrHP+XnttyOovIhgf4zO
         C5SX8QSLza3bLnYK0Lvlo9IeCOgO46tkoDZzzfaF2RIs/XJZrURGFWn9HckZk7XiqkX+
         e12d/DL4HLYwkNrFYswijRfQyhsoVprlffpspvxZXH4ax6siVh8HpvuR6eET43N1Jy3x
         NujGrgS5LoggBHHgeBmSN4KgyXV4vuL2y38D23zVlz53KzftmKRrmMV6+LT8n9eXU9Y8
         GUtz7zx/5CclLfTQ9K990NIuDi0ZzNjXOdLVzcAFmxly2ufyeu8bqbIvgsuG5oNxvyKx
         w2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692182025; x=1692786825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLMovLvkpqDEY2WJ/PyHXu6wwtbX4ZiUBRXq0ULsIAw=;
        b=gA6p6QjbVKKKs9PflpItCM4HnrxBi+PiMdSf0H6peWWbcIonc8gI72tW/PmVfgPpRB
         2gn7/026Uf5siREra1lkHP4dbVC4LWkHE2x4F6Lg8kRaRYzu7xTqTgWZalZpkZyhTELC
         dJ6qhbm4dQ4AH4bEGmeUHDsZNZwVIusR5pzrpAL5MGCourJdQvZjyfuZyqqpKxfI3hx2
         fQrBqeqwiPcYcN3SVlE9ihWTD4LBML1ZaL/Sofje/PUwKV1YtmTjQyRtKFzI1UXAgIBO
         yQZ4EKnlFuVlbziDHAzBMXitmirFNyyJ1uwLyzmaYvhNQGbH2dCxHVXD1hKM1YYjG/TD
         8u/Q==
X-Gm-Message-State: AOJu0YwmOhiC3EwD7hNjWsEuTZhJKVBgSHNZ3fl7VnBkKeqE2oYv/7Ws
	sigXDu8gEge2eKkgPPGttfVlTxAWheI=
X-Google-Smtp-Source: AGHT+IEZcLKlWeTgWwgLNRyv61+UwFwRgBofS/0+APbkU83hFZxayL+2tbfIo/4YaFME3MGhzKoT1Q==
X-Received: by 2002:adf:e906:0:b0:313:eaf5:515 with SMTP id f6-20020adfe906000000b00313eaf50515mr1133576wrm.6.1692182025213;
        Wed, 16 Aug 2023 03:33:45 -0700 (PDT)
Received: from work-pc.sigfox.io ([2a01:e0a:8d5:c6c0:bd52:73a6:cb33:609])
        by smtp.gmail.com with ESMTPSA id d2-20020a5d6dc2000000b00317f70240afsm20889582wrz.27.2023.08.16.03.33.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 03:33:44 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATHCH V5 4/4] oeqa/runtime/rust: correct rust test
Date: Wed, 16 Aug 2023 12:33:33 +0200
Message-Id: <b5c5e5c251fad7b25d1531a9e9221f242057f27a.1692181166.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692181166.git.frederic.martinsons@gmail.com>
References: <cover.1692181166.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 10:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186129

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


