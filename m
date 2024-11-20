Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4963AD63940
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:34 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.13840.1732111053577507930
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jBndPQNb;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2eade1cad26so214928a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111053; x=1732715853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cC56nw6kMVWH56xnm79/HVpJuEyzniQEHrzwswpKdUo=;
        b=jBndPQNb3uHcbwMYDF0p6DYkbMiGVUuaMOPx58CEr7YPZyo5lo7KtJ7kXih7GS6/Bb
         Xj2sZnl3Fr0WgkQeyjPC3URluFAVHFd/mz6fwHwKuFkZTOQhHF5FiUkAjeVESf1n079/
         3ES4QXCz8fGSevqmPcNLvJ9BWX8Vitn0CKj3UzZ5jIrUyvj9OwaRe88bV2yB6iEgKWWM
         bFY6Pwt4sU+OVd/9Y/a+Wbwbn2pBEENU4xe3f8b6bHSMKnTLY9bVqlqiWaGrb9a27I1M
         FHVAMK8M3PBCgCRJvPmRlL96p/s+ZoyGZFBtfxlP0zBxnD1gQ3kxmokCmjGbiaBLsWTj
         nJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111053; x=1732715853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cC56nw6kMVWH56xnm79/HVpJuEyzniQEHrzwswpKdUo=;
        b=SohQWV9K4YD3PsHUj2HPF9FTshInPdf/3spcngs19mXdulYV+Um0ZGgO+kE9mp4W+s
         smBedGHtdtCcvaf9oj8JmxNS+gcT3Tg/CIRnRhFm+lnmw7uZ5w8rVRVQTlhZdRsZjKN1
         BCopgcrQCTBqofeT6k4xc4kADM/9i1wk1SbNeiJbxOOIwPICdrTxI8iZtdO2GRIs0YCy
         loSgKMxSvT/WpOicPKqs+WsIfO0eNh1439oQiPR8TK6yQjs4BHMCNL11tWXAWHb/cVma
         1UNBOcvI9nfY+tsD5F5exN/8k/tu6PZiO5Iz16HYtgmdOht5/D+AnT3hAS0OdsU+H9MN
         j5mA==
X-Gm-Message-State: AOJu0Yx4KDB7hJzNghG7eNWuGgxPPHfaVswvgJg2TRQGDq0ORagd9IiR
	uZ8EvQ08Lo4kZdknHMk5KXLNuE4LzATur0G3uZC7SVE+MKa8bmbakgh8tq6raJG/F9vWNrRaU4d
	W
X-Google-Smtp-Source: AGHT+IFSPhX9ntmvRqxAf1UYBXKB4ukWpxp0OcnuWvlpDMjXywdI68VVB5MR+ZHTdzCZRWUqMTE00Q==
X-Received: by 2002:a17:90b:2d0b:b0:2ea:8c5c:ff63 with SMTP id 98e67ed59e1d1-2eaca7cecc2mr3304907a91.29.1732111052792;
        Wed, 20 Nov 2024 05:57:32 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 14/31] oeqa/runtime/ssh: Rework ssh timeout
Date: Wed, 20 Nov 2024 05:56:46 -0800
Message-Id: <a94919397473e51d471f504a55b40b5b36d3f340.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207438

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


