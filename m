Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 565E7E64032
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:54:51 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.10487.1732226088552476567
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:54:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qmD+QMC2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-720d01caa66so1413093b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226088; x=1732830888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cC56nw6kMVWH56xnm79/HVpJuEyzniQEHrzwswpKdUo=;
        b=qmD+QMC2ri4ArFe0XM+mQsyoJfneaYrgrnGkmcCHDf8TXlAOPnXFSKbA10HVH3Rv1N
         zjd5DWisaJcjGVouZtLiMDTC4gt0o3UTmUOw6zksjH1WzSXHbMxldEuiiZx/2sNfL/uZ
         plHImzSyy95EGXrb3S7KpyiygGmn9HE2mgTph0Jaqan6L+xfwH4J/0C0JNzfpmzkphQ2
         2NeodFBgwRfvXA7QlziH7RS4HdxQf4MmO09dxySPxjyBuH1HpNjI+hjcLj3CLx1YUaeb
         K8v3M3JiSvp8w6aVmWM4C7Fp63zCBtYHFr5DM3cbu5L1/mV8d2TqV/BkEBZjWU6d0YAf
         HwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226088; x=1732830888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cC56nw6kMVWH56xnm79/HVpJuEyzniQEHrzwswpKdUo=;
        b=T7u3FvZ1RlzZ/wzBVQHpzUQ9zCdgoqY7+KdJioaiFxjzdpx5KD94aKG/+13tPoszy/
         oRij7AWH5oWfaCgHPLdLYaxAvha4OgTYgqtQI/aOfIq73HYUtEpxMJvBAQh/QjTjxnOc
         NAHSgNvXaCl/BxGaHgy2oEaRLO2P7HYJc72/ARE6vwDdt65uNXEh/o3wTGUW3NEHJz70
         kZJqq3os0GV5Go3GOKtY1YfvQArvnNiirq4sPKlR3xQ4QnMvlEKSg1Ok2I/naFNFJUf3
         6Ahmnc96KAXQVa51YthhxzLeqpmTFXMfdGj6ddV5CKztMT4kDjeX1r0U0hwXr+azBi0x
         lXIg==
X-Gm-Message-State: AOJu0YzjeE/vknQ1NTM6VQHLpRxdKqujxWpZJMLkjaiq6K1SIrAI7YlQ
	/iR7985fxjxTOhiQKAfsxM8D7QesniF8WL5B+tNRai+5OEX8/7SllvLZeu1Gy8CQoUKCmvCyhEC
	/
X-Gm-Gg: ASbGncu9yAmpnnC9nvDZUF2duXCJyK77QOVTvLAek8fycz4tZkili57WvMSPURzc6Xj
	1ZgP59Rcsr/KxN/qctVwhR0HLtCwpbkt4pdBwg5CLJ3rOnxirwJGmjYJbdG9RiYv+63+RyajUCA
	w0CfAB3xXK7h0aHC3sOZnEykhduIpx7bU8QOIVW6dGZHUtkVkxgiYWbrwmgw07PXa2GbIMdcirK
	fTgX4UINdFu0Itu0L85+/UxRAzwRe+9wFW6xZs=
X-Google-Smtp-Source: AGHT+IH7/JVyKpzoVQh9ypapcJtrjcLQatA6muaJUdtzXFqCzHLUMFsFPTIAu3Gt51s9UT9Pssqz1w==
X-Received: by 2002:a05:6a00:13a8:b0:71e:795f:92f0 with SMTP id d2e1a72fcca58-724df3c81cdmr861341b3a.3.1732226086524;
        Thu, 21 Nov 2024 13:54:46 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/27] oeqa/runtime/ssh: Rework ssh timeout
Date: Thu, 21 Nov 2024 13:54:07 -0800
Message-Id: <0387107538d0528e09ef3c92d7ee969f80781770.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207572

From: Richard Purdie <richard.purdie@linuxfoundation.org>

After the changes to improve this test, we keep seeing image testing ssh
failures, particularly on mips.

It looks like part of the problem is that on a loaded system, 5s is too short
for mips to reliably establish an ssh connection. I've seen logs where it keeps
timing out and fails to work, then the debug code successfully uses ssh later after
everything else fails.

Change the timings/retries to give slow platforms enough time to respond.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ba64ccf3ad6e40461219b72d60eb0fe5cb38fddd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/ssh.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
index b86428002f..f5b76edff4 100644
--- a/meta/lib/oeqa/runtime/cases/ssh.py
+++ b/meta/lib/oeqa/runtime/cases/ssh.py
@@ -16,7 +16,7 @@ class SSHTest(OERuntimeTestCase):
     @OETestDepends(['ping.PingTest.test_ping'])
     @OEHasPackage(['dropbear', 'openssh-sshd'])
     def test_ssh(self):
-        for i in range(20):
+        for i in range(5):
           status, output = self.target.run("uname -a", timeout=5)
           if status == 0:
               break
@@ -29,7 +29,7 @@ class SSHTest(OERuntimeTestCase):
               # give it time for the port to open.
               # We sometimes see -15 (SIGTERM) on slow emulation machines too, likely
               # from boot/init not being 100% complete, retry for these too.
-              time.sleep(5)
+              time.sleep(30)
               continue
           else:
               self.fail("uname failed with \"%s\" (exit code %s)" % (output, status))
-- 
2.34.1


