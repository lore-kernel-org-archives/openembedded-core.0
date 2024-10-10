Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E0CCEE323
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 09:34:48 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.39505.1728552878658153343
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 02:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N86efZ2f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4311ae6426aso469305e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 02:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728552877; x=1729157677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zu8YOvRiX15dECMc8R+jVbRilsu9QOp66Yk8wyTkd4o=;
        b=N86efZ2fCRB2S9Nm+PPR7bsTijXwOMBYG7OpFKjLMyPuHms/Y6O8BoWxr+nXkKK0CV
         Q9zpOXit+N6wwDAH0c+xwvPNHATA5VXpNjYScHevzkqOVPR8/PGOPPd1uRjjcaaGH/P+
         PPkmSYXShZssHz1dBYJQV4d44zB8k++ngPZuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728552877; x=1729157677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zu8YOvRiX15dECMc8R+jVbRilsu9QOp66Yk8wyTkd4o=;
        b=Y+cHnHeFKIjaqwp0GxkfqBeTCSKr5iVzIlAzhM0AUg/axCPMTZ+8culEBAL3uU2pBh
         VW4Op4WknMchxmbBn9b4CgZPcoQZTMBhr3FWkpdghSRZY+ptP6nko3sJxZVacR5Vvllg
         7NSTstV/kj4dWkgn1Cfzu5Pl5bbJZG5lMHYw+/OLvgU2wfhfBeYiB9vhjjETgPEDIoVZ
         kVqB00BxwnCPK+psR60Ap0k/f7uR2Rwf7Kljwkdp4RbMjQjDbX0bV/rRVo/rXAoXFYs5
         J93YJASdgJ0ORgfRvln4E/GrryrultVhmzylqOIrNgLhFO1lsPuWjF5njFRBrWQF69Bz
         tA0Q==
X-Gm-Message-State: AOJu0YwAl4DyW+eAekZAmReXTB0z1hxDloYxlJodJp1RC4XoJhWVAGi2
	QGH1/XJrc0M8KNyKDQJYPRecwrTq/4T/uNFios9YTgaDczkxGHxDtmCsH0JyxDjBPvruw1AO+G6
	K
X-Google-Smtp-Source: AGHT+IFXR4nio88iAXH24wwDPAFLcyoX2Iw8InzC3Pz0u7n1PWoqtGPm57VO43V3A1W3guWvo89yqA==
X-Received: by 2002:a05:600c:4448:b0:426:554a:e0bf with SMTP id 5b1f17b1804b1-430ccf4355bmr45704855e9.16.1728552876653;
        Thu, 10 Oct 2024 02:34:36 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a7cf:f342:7de0:8e9a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6cfb2asm1020786f8f.51.2024.10.10.02.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 02:34:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Jon Mason <jdmason@kudzu.us>
Subject: [PATCH] oeqa/runtime/ssh: Rework ssh timeout
Date: Thu, 10 Oct 2024 10:34:35 +0100
Message-ID: <20241010093435.527603-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 09:34:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205402

After the changes to improve this test, we keep seeing image testing ssh
failures, particularly on mips.

It looks like part of the problem is that on a loaded system, 5s is too short
for mips to reliably establish an ssh connection. I've seen logs where it keeps
timing out and fails to work, then the debug code successfully uses ssh later after
everything else fails.

Change the timings/retries to give slow platforms enough time to respond.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/ssh.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
index b86428002f6..f5b76edff40 100644
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

