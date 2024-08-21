Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81DA4C54722
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 12:51:04 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.18885.1724244658244950205
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 05:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YnDXdrXh;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7cd8131c7f9so933087a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 05:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724244657; x=1724849457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRvEO6Ohaax2CHAdkoREjF7Q2aJAiV2c4RExO2URKIA=;
        b=YnDXdrXhtjcpN11pzyarFWDys/dYh3FESbDHk3ch44EUNKFRT1QWSbq4ZWBE0pBqEm
         dKq0o9hwCZIrxsMBotQOln+TNrKc2PzWxwWxJET0S2zl6V/tlUcVnZIQVFLHae+D4ut6
         gLDsBGBPc6wqgtRzePlEHQN+qgO8Xa/n9Q6SMlQ6tHyqE+d3LHOuKYFhqstCz9Njuv2U
         Sgdj8DuskbgKQHVPmmB+jPJ3QbbBYxzp06RWGxwye3JJ4A8VUsHsKzMeXWkHpfvUml0g
         VXnl5lKe3Rtj1oflwaxltEqK+r+x2ltZidAGQ8xdgmypEE4a732DmTl7SUlUA9Zxaw7B
         RayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724244657; x=1724849457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRvEO6Ohaax2CHAdkoREjF7Q2aJAiV2c4RExO2URKIA=;
        b=WUy1BI7KjYvRN6isizHAt44z7auWZxoXD+3xdF02iYASYDllWgi1/jxc70yMaQojHu
         +UW5Z3Lifk6uP07hGcb0fEX/n3HDi1Ab9iZA329Z7FYYHtuVAGIz7NM0U0C2+a7a9JuX
         rNzdDRvUBobEkMN3pkqvkxo6gQbu8yxJ9jlQjgXyL2yb9kn8g61RA0nf2ynnHMx+06Wh
         gmxx+B86WERyjtaIuQ5JFs/A8SmIZVzkt8ZGB5IHK02OMLM8cLwxZRnnapZK+logaHst
         WtmrBHPJweMf09Dw6yRGJs63kbbJq5fG6y/HlW5lPce3pEI6hse8GAGn1FCozd0SOyQ+
         rKQA==
X-Gm-Message-State: AOJu0YwTOTw/mYYX6sGOLosl21nqh7A5f3P6RH9vgnweYwMK8pVhaI0w
	ES1JhaswgVmGHUmK9CVGOvm0m6e9Vuv+b6eyOHaAvHP2hk7yZ5DyK7GMUo21/eAKYrJTUr/nrK4
	aQGA=
X-Google-Smtp-Source: AGHT+IGlUXGuxsltnFVXlalvhMiA+ghPg3DlQsoexcRIfAcfTR5rk0SaO7muBxZPEfB8w1PAImpGCg==
X-Received: by 2002:a05:6a21:6282:b0:1c4:8293:76db with SMTP id adf61e73a8af0-1cad80f3f35mr2630569637.29.1724244657400;
        Wed, 21 Aug 2024 05:50:57 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7142a8a481dsm691789b3a.36.2024.08.21.05.50.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:50:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/18] oeqa/runtime/ssh: check for all errors at the end
Date: Wed, 21 Aug 2024 05:50:27 -0700
Message-Id: <52a67132d4d7e656a39d87c03b1c6162018e8908.1724244509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724244509.git.steve@sakoman.com>
References: <cover.1724244509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 12:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203604

From: Jon Mason <jdmason@kudzu.us>

With the retry for the -SIGTERM, it is possible to still see that error
after the 5th attempt and mark the run a success.  Check for any
non-zero status in the final check and error out to close the gap.
While there, make the error print match the one above and be a little
more verbose.  Also, I'm seeing it take roughly 6 attempts on my local
(very slow) system to pass.  So, increasing the number of attempts to
10.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3c3ebe591eef6e0479d623ec2237cfea16db5c80)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/ssh.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
index 9a8deb3f25..08430ae9db 100644
--- a/meta/lib/oeqa/runtime/cases/ssh.py
+++ b/meta/lib/oeqa/runtime/cases/ssh.py
@@ -16,7 +16,7 @@ class SSHTest(OERuntimeTestCase):
     @OETestDepends(['ping.PingTest.test_ping'])
     @OEHasPackage(['dropbear', 'openssh-sshd'])
     def test_ssh(self):
-        for i in range(5):
+        for i in range(10):
           status, output = self.target.run("uname -a", timeout=5)
           if status == 0:
               break
@@ -33,5 +33,5 @@ class SSHTest(OERuntimeTestCase):
               continue
           else:
               self.fail("uname failed with \"%s\" (exit code %s)" % (output, status))
-        if status == 255:
-            self.fail("ssh error %s" %output)
+        if status != 0:
+            self.fail("ssh failed with \"%s\" (exit code %s)" % (output, status))
-- 
2.34.1


