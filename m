Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F45D6394F
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:44 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.13944.1732111054942894369
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qtBR3AV0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21116b187c4so32910015ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111054; x=1732715854; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NC6ZejAYjq4zzs89Ie3/1zeIkqzDxLx+DF3EOIoe5U8=;
        b=qtBR3AV0XbO2g0uPGEu2s3bnJlRYjsfmT71+GIm/+kWSFHurAZJx5lPgsGWSCr5+yM
         jpydXSXrk93/qDNSbP8O6cRaszSb/n47ssOV3JxgiDHqrgrNDvNl9oBp9cemvbr/NzGs
         fkfzpydl4g8es4M16b9xJ1YHliuSbXce9dVC7tV0dE2FuZV4ETi82hDY9Ka1m5gTCZWq
         kR2pbZ9T3tfkYoA22eTX62WBGKOwmSgpkckjhH9rmiAtVkxxXDtz8eimVUX87be2DFoF
         Bl3Xp6FxItx6iaLBsaP2H1FrjYIcNSD3nkIXSvXE4xu1zH6SykbLs42a3HB2iKGY5mqD
         JHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111054; x=1732715854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NC6ZejAYjq4zzs89Ie3/1zeIkqzDxLx+DF3EOIoe5U8=;
        b=uC0BpvFAli8ZMnIpEnGYPgFt5VZayMvNe1W74k2vvnYdNMmthkBpJ5hsD2/tD1VpCn
         i2AyW27nK88J9JN509U38hrJLegyq2AJQoewDzGzLZCNImD8S2Wa59ZXswMYuPP6iU27
         swZvA8pkkpijhpmUflqti+czMI+FxNcYLoOvmYXyOQ2g45VqMi5JUqx3cyAD5tW9DTcd
         IdfoyM/RW1ZLgkGBBlTgOJxp4QST+9F2Zyla4hczSfnZ5rmq/PuRmsORuxGx79aOLMsT
         4kZfxt8uymFI6ogY84xaBZNtdpZGn0Et8+Hbyxsb+w9irdWjzbYNaQ5kexbtimBqoozN
         81rg==
X-Gm-Message-State: AOJu0YzXl55j1nc05ekayKmU27sLONRA/5QeUElfyEN+4eDEfGtcSbVa
	ywWVc7Nbps+QleQ/4fM2TtTvsdGL1Xkh9+w06dPMZwHOK+qEr8E4phslTnG4i8kL5ueszUVQwK5
	d
X-Google-Smtp-Source: AGHT+IHmn73358fXgP7phdR+tuMFVKeq0N7z/L7HM+Osa7z8U5CONNkgcb+WCyQQvbJzH94xmEylow==
X-Received: by 2002:a17:902:e550:b0:20c:9ec9:9a77 with SMTP id d9443c01a7336-2126a4750abmr29300735ad.37.1732111054060;
        Wed, 20 Nov 2024 05:57:34 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 15/31] oeqa/runtime/ssh: Fix incorrect timeout fix
Date: Wed, 20 Nov 2024 05:56:47 -0800
Message-Id: <29fa3c132c5c1fdb2352a175b3c882472fea11a8.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207439

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


