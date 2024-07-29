Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811CDC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:37 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.55666.1722258810645028105
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YVulEww2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2c964f5a037so1985665a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258810; x=1722863610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cj0CmydQgCcJEd8BsooaBT6rDw/bPTiAIxm8KzdKxE8=;
        b=YVulEww24RtWs2J3AKkix+2jKJsv1St60x2DzqBqCMgSSEYh2A4VDxKaxhW/F/BJKE
         GBWbJN1LC+9QX0Kz9rOpusGQzCQ4eNC+YPt5DhdXMVzPvPQRaHquMZlxpJnMKBcVZS/c
         HdNqmZn2WVmrUKvf9mXZ4nRipoTBriJaQVKw27TEDNlzjwJ5dYGaomSCSUVRYYjIwEhd
         c3NRMNV/Atth5MbEqmaMpMFfLMk2TRIrVNemQiwzLglkNMxzvVRftZDglZZMWPV1LK5s
         8AnwOdzP2EqowT6qAAQqkQleCms7toRC5a41bRhZqEP2BtefHqT/Uo4ufw+3qGDLg4eo
         lKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258810; x=1722863610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cj0CmydQgCcJEd8BsooaBT6rDw/bPTiAIxm8KzdKxE8=;
        b=uRr2JINPoES0nDzt3jDMA1N7VEMcJrWjFgA1r83zjViZlF3kvTU2VLozC7Zo1OH59k
         uEpyx9hfygZYtkAheJ+Qd0DQSC9+1zfBEPnEfMFdRffmnCU1yWV16iwXmrfQZ/L4A7cV
         c0hDSw6SrvvLFnofiZ1oSIoW/F91JDiDVgnIJzBgB2jw7bgx5Scz/vy1ZBFifJkkjsSu
         hkiiE1Ojo5INFFXdtTrrp1FYwPbUq9viLfKhBeY0bFnKbTbrZrUJseXhg82QIA7VPBTd
         otO/I4CxbSmvqJNguw6Y+arGXWmm/9fc1XOf8adtgozRGmeOcZSUtjw3poG42ovA5ZaH
         fP+Q==
X-Gm-Message-State: AOJu0Yw+K4guTpiwWooGcQAt01MCP20NRs0kruvg9aOV2iHmDZgmmupM
	JR/x632BKYlqPccv4WkJMIeC0rbaD4qZjtUUQIsfG4mD3UJ0tpy9ySUdVyXLQ/BontRbOb+KYP1
	77tWVJw==
X-Google-Smtp-Source: AGHT+IGmKJ4AGEkhs1ceUEJmL5FMTRRkXtBBeRkr1LnHgHm+IaFH9es/EgXIVveqMUi72D+xtChCwQ==
X-Received: by 2002:a17:90a:8a15:b0:2c9:6cd2:1732 with SMTP id 98e67ed59e1d1-2cf7d42322cmr5209580a91.0.1722258809590;
        Mon, 29 Jul 2024 06:13:29 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 24/37] oeqa/runtime: fix race-condition in minidebuginfo test
Date: Mon, 29 Jul 2024 06:12:34 -0700
Message-Id: <f7e824477ef75fcea8e0b777278413304def631c.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202638

From: Etienne Cordonnier <ecordonnier@snap.com>

Fix this error where 'coredumpctl info' warns that the coredump is still being
processed:

```
AssertionError: 1 != 0 : MiniDebugInfo Test failed: No match found.
-- Notice: 1 systemd-coredump@.service unit is running, output may be incomplete.
```

(From OE-Core rev: ad1ce64f5c1f22a7b10025d8cba20dc74354ac81)

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ed562345d5a5f2edb649028553199f3f7966e19e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/systemd.py | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
index 80fdae240a..640f28abe9 100644
--- a/meta/lib/oeqa/runtime/cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -150,12 +150,21 @@ class SystemdServiceTests(SystemdTest):
         t_thread.start()
         time.sleep(1)
 
-        status, output = self.target.run('pidof sleep')
+        status, sleep_pid = self.target.run('pidof sleep')
         # cause segfault on purpose
-        self.target.run('kill -SEGV %s' % output)
-        self.assertEqual(status, 0, msg = 'Not able to find process that runs sleep, output : %s' % output)
+        self.target.run('kill -SEGV %s' % sleep_pid)
+        self.assertEqual(status, 0, msg = 'Not able to find process that runs sleep, output : %s' % sleep_pid)
 
-        (status, output) = self.target.run('coredumpctl info')
+        # Give some time to systemd-coredump@.service to process the coredump
+        for x in range(20):
+            status, output = self.target.run('coredumpctl list %s' % sleep_pid)
+            if status == 0:
+                break
+            time.sleep(1)
+        else:
+            self.fail("Timed out waiting for coredump creation")
+
+        (status, output) = self.target.run('coredumpctl info %s' % sleep_pid)
         self.assertEqual(status, 0, msg='MiniDebugInfo Test failed: %s' % output)
         self.assertEqual('sleep_for_duration (busybox.nosuid' in output or 'xnanosleep (sleep.coreutils' in output,
                          True, msg='Call stack is missing minidebuginfo symbols (functions shown as "n/a"): %s' % output)
-- 
2.34.1


