Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC41DCD8C8B
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:34:25 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6129.1780698858725687011
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TYRLyneu;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso1119646f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780698857; x=1781303657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qn5pM0pvCd+jTHAsFALwTqtFiTQj65/tBKpG0bHFZUE=;
        b=TYRLyneuM02uChJqkNgzCERHwZWbxFgVaJQbVVOyfrFfkzh5s6Pd8fzpsR4PNXZgW9
         Vm6KxSxzo1t6RX9eexjkDAMsmU6DHZGI5z5lJefoS+5L5L9m5XdZKQqyRF4aVfyTkBQC
         Z4gyxCcLXujz9K3glxheOc8OXxbSjsCkV9VyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698857; x=1781303657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qn5pM0pvCd+jTHAsFALwTqtFiTQj65/tBKpG0bHFZUE=;
        b=E5OlulxdFSY58BHWhqK1BnM+GjpLjKHOrGrfsoF5Mz3RcuaIipCMab6D0orQTSf6Ee
         qtwUgCNOgHiuCeD0VbtDmsdZPRstdqRVkrpOyiFHFw3ruCuZ8Odnklgi9oW9QR90zb4I
         nySSpfhoieoAlAlf9iul7zoWAOYtEgIp9DSWVkk3jna62hbVBcvMMtDUY0+jEzO533ei
         4abutpqKtrm3tb6ZjXlPz5eVoC3s0/PsNhX91pCxgDVpsPkCud7zHCCitetRoHopvhRe
         8ha2XzWXo7Rtsj8J4cPVeJXphqe7umSxeW+JIfGAYMyimzK7ACNkjmMFSolysgBRMdiv
         vjpA==
X-Gm-Message-State: AOJu0Yx4FYhIUIApYT/PfPkeqTbIjnsteIgtAh1UmUOQLcCNIuKwa1iE
	tFPHPPBhpFqR4/+omVJHWXqeEycnlLFqR/myDJYT6laEr+4sis+v1Ai/a/B+nHSVB0T1ULmt3qY
	Zh43m
X-Gm-Gg: Acq92OG+p//BLIgPRQ35vK41nxWeg0I7zhmDZ9b9hxJ3Cnb7DBEivR7hHoM8lEOA1G4
	glkJznbAkweWxwbsqkVJbVpoAodI3VHcL8gGrZmj7ytnwzoghp1GekNxvM53gykF3Owe6NwGQhY
	RqsqjYg9EyONKdoczVUMQifegMxT7tIAIB53ls4I2Q+a1VxEyladmPDYDvXBqWyJxeyXrP0OTCz
	PTfi+50ycA/2ewfeaFyHx+I3elTBNtlzDmr2W8qjhbYnEXpSE7+EH8FaDEF/ZndInA+VaHLqjZm
	YRHPRjWRT5QoETZL+fP00GE8PVyuHoUM6Miou3S/1XtRyxIUsSS6fCwCK8lQpxV3hl33VDAorgw
	oXpW8QgPE+oEIfL+QcGIJYhoqkcEt6vl520sH+glXvMXk6J/8dTWIE4nqGdq88UWiTCnH7l7F1L
	3hjWQSEbMTumb4w6e1vyXhlsypxAd7DJSOLDnSnqxvzjnzKIU5AvMH6xwMoW8dLS5jz6ik6F6cN
	xse2hfIBSOy9DuojGVuZ0ezQ8iSWgsvhUWxWWc=
X-Received: by 2002:a5d:4688:0:b0:45e:da9b:97d6 with SMTP id ffacd0b85a97d-4603061e47amr6814852f8f.27.1780698857044;
        Fri, 05 Jun 2026 15:34:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm22132409f8f.10.2026.06.05.15.34.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:34:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/25] oeqa: runtime: go: Increase test_go_compile/test_go_module timeout
Date: Sat,  6 Jun 2026 00:33:52 +0200
Message-ID: <c8a94dfc3a21403e8202a4adddbae9f3bd4a4549.1780698373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780698373.git.yoann.congal@smile.fr>
References: <cover.1780698373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238194

From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

These tests tend do take a bit of time, and this is probably why they
have been seen failing a few times in the past months. Rising the
timeout from 5 to 10 minutes appears to help.

Fixes [YOCTO #15999]

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 998ebfc77db4c8d7567d82560595e0994a310ae0)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/runtime/cases/go.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/go.py b/meta/lib/oeqa/runtime/cases/go.py
index d4b69438a56..0c9c4ff4cd3 100644
--- a/meta/lib/oeqa/runtime/cases/go.py
+++ b/meta/lib/oeqa/runtime/cases/go.py
@@ -35,7 +35,7 @@ class GoCompileTest(OERuntimeTestCase):
             self.skipTest('go command not found, output: %s' % output)
 
         # Compile the simple Go program
-        status, output = self.target.run('go build -o /tmp/test /tmp/test.go')
+        status, output = self.target.run('go build -o /tmp/test /tmp/test.go', 600)
         msg = 'go compile failed, output: %s' % output
         self.assertEqual(status, 0, msg=msg)
 
@@ -65,7 +65,7 @@ class GoCompileTest(OERuntimeTestCase):
         self.assertEqual(status, 0, msg=msg)
 
         # Build the module
-        status, output = self.target.run('cd /tmp/hello-go && go build -o hello main.go')
+        status, output = self.target.run('cd /tmp/hello-go && go build -o hello main.go', 600)
         msg = 'go build failed, output: %s' % output
         self.assertEqual(status, 0, msg=msg)
 

