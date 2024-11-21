Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FC6E6402B
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:54:51 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.10693.1732226089048162575
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EP3Fg95+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-72483f6e2fbso1316659b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226088; x=1732830888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NC6ZejAYjq4zzs89Ie3/1zeIkqzDxLx+DF3EOIoe5U8=;
        b=EP3Fg95+RsEDmZTlVnKZwKNQc/An6oh8HZOt40xvr0Vd5Z+FzdJDZHfQhNSDqDBWzC
         XZUccc7linyQWexB036ziDtrNnadKfTePlNiVfaXEUH3Bn2ZoybVx2t5bdWGU3EIb2C5
         wMM1Oh+ae/m8EEY8YjeZoxi7CoiEjmGHIN0FfqPgJ2Dn2hvhA5bSMzkO8o+oIX7atAmq
         d5VAanBdvnX2eQPLtNDRh8GctDa39cR8mNjeTy0IXh4GqJWIKZ+BOVTkUqXVaFI36dfM
         Gl1IPu0MINQwUzeyFhdiEV2Mm3dpYu0B6q1tj4XdlfVKpHQHf4ylKwISw3n9GdQ2TJKQ
         7LPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226088; x=1732830888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NC6ZejAYjq4zzs89Ie3/1zeIkqzDxLx+DF3EOIoe5U8=;
        b=BG3MwltkeA4QxFPyeubGKR0ajZ0zHDZWlhcxjlViRrQ6Dsz8Vku+KI+MFMZIjNPmig
         Fk87ALIUop2peqlku7tiXFkWEUmqzI1aJ6LZqLISLNvpS1GwLsdF66p1e37TEDFjoppc
         h+DDVmRx7vMM3pEcEaL+cPKz1C8K1wUH6lS0LOEF2teZdSXUtKbZNZiLnkbcKiDf6FyL
         VLGxCw8fy3LUXxlzLuUPbuSBCABIcR5hzVzrzyY1s//XiwTG50BCFUDqBAfh6HmSDMxs
         VZAYC0GIy1P5KiBG4vAGEBOBGnoUMfHRrzg83yRWLg7r5GHmqYJCasiyQH3N3TIC3YWs
         YBYg==
X-Gm-Message-State: AOJu0YzQimeqz79O5lFE98L3cQBMfEA/MXlm86ohpYWkZvdysoe9afSY
	4M94Gv2zwT89j86fUGEt4+s+HjQyye562DfZ79mgV9etxzfuZqn79XiVTYD62v3kJ/73sNiV0xG
	2
X-Gm-Gg: ASbGncuhXNa8nN/NwpFHw6cCm9+eaTrJwiEfXh2Fln4R/LNzn6+GwmJy41YdUiovAPx
	c2Iiu3qnTrMlxDMJbVJSKINNZlp8v6ourStPKN/dLi/dzLpLIC1qAxITSRKdBQpWFxkz02k7gcK
	p8uYsAkTAYqcOHVNskxA3lkhF22U8GwFOafpofvg7Q0uDzNJJhnGQVpH8GrUShLTcsz6PpFROlR
	zqhGXjOC62ESW9pGi92u4QuTwj5H1iEHtM1L1Y=
X-Google-Smtp-Source: AGHT+IFt8yB82R3WlH7vopBF+GNEj3Odi92mE1r2lAlHDaTtyJoEC8rrt4/LhqCnI0yzWNzEfkZ2Cw==
X-Received: by 2002:a05:6a00:2e89:b0:71e:8046:2728 with SMTP id d2e1a72fcca58-724df66b91bmr884897b3a.17.1732226087944;
        Thu, 21 Nov 2024 13:54:47 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/27] oeqa/runtime/ssh: Fix incorrect timeout fix
Date: Thu, 21 Nov 2024 13:54:08 -0800
Message-Id: <2d3b826b09014ff27a3d00706f37b7623dfed76e.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207573

From: Richard Purdie <richard.purdie@linuxfoundation.org>

I'd meant to change the command timeout in the previous change, fix
the correct one.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bb991988cb23be2c8947171726ada321f27e6eed)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/ssh.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
index f5b76edff4..89d64430e5 100644
--- a/meta/lib/oeqa/runtime/cases/ssh.py
+++ b/meta/lib/oeqa/runtime/cases/ssh.py
@@ -17,7 +17,7 @@ class SSHTest(OERuntimeTestCase):
     @OEHasPackage(['dropbear', 'openssh-sshd'])
     def test_ssh(self):
         for i in range(5):
-          status, output = self.target.run("uname -a", timeout=5)
+          status, output = self.target.run("uname -a", timeout=30)
           if status == 0:
               break
           elif status == 255 or status == -signal.SIGTERM:
@@ -29,7 +29,7 @@ class SSHTest(OERuntimeTestCase):
               # give it time for the port to open.
               # We sometimes see -15 (SIGTERM) on slow emulation machines too, likely
               # from boot/init not being 100% complete, retry for these too.
-              time.sleep(30)
+              time.sleep(5)
               continue
           else:
               self.fail("uname failed with \"%s\" (exit code %s)" % (output, status))
-- 
2.34.1


