Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B875CDB46D
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:26 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5960.1781960422916586174
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BV6fZM2W;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4629051c9d1so2087411f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960421; x=1782565221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FztXDc0Ggh+2S1cZPE/sTwbrlJIo+v4a+px6yXZO+4s=;
        b=BV6fZM2WineBcsiK0gYxN5Pwm6RK90swbjhPlR9tji3QISQ1I0XAfKI1dedTOLLjUY
         /b+92G+526DJQwDe6j3NFJhDupty/bYRptXiFe3Rc90R7lkgUzhr/MGeOBCkxsscgDHX
         RUOzdL1UBJUfGlk4XIm472bf+3xkgpps2ZOlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960421; x=1782565221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FztXDc0Ggh+2S1cZPE/sTwbrlJIo+v4a+px6yXZO+4s=;
        b=r8Zd9t3yagIoj48epBt09QlK/twH5Vcs3UKvORp6CPJYI5ZjV6JbMntPTg0jQr6lxe
         4Qa6ClchjZBU+B0oj6ofWlX/PDfm9cdmF0Ceae80pXCyPvDy7kl8xMOJiRQiL1u94O6r
         qxQuwTyU5JeHk9gFQlYvuAuuVvzhjBsglBEmtB4qPJ0VuzxZ2Oz+RyxHSBVIO+D1a1eN
         z6egKxw7Te6xJfsRf3R7H7rRwMv8vgU28bzOgtL+wJez/6ZazWwbCEqDm7rVeo9X0V+u
         fKa8z4thWpFTaRYKslNhCW+cpjlIluyYbZSnXszTcm1dP8NgdU6u/h8d7SPP9UEmKFLq
         mOgg==
X-Gm-Message-State: AOJu0YzBbWLnmyBbFqzuzwd+tE+zBprDzPvSTJDEqNQV+g86CCnwmsGK
	meIo9pymEk/kS30JglwNpo7sK4/Vw2iXqzOSQvtC6C1GrRSZL74cA/sOikiEvTzFmXeob6p7vtT
	EM8Bw
X-Gm-Gg: AfdE7cm1R9KF2oVQzLdqE3Xdmei3mKrZXD3nZyqdPwsedtKaLwmzQ77glK93RxE4Ieo
	4SjWnD7EV8JKzGvuwwzWmWhTV+7pbIfJ0yTEZrCjqNTj2pGyMUXkhFkvOR9GfRPWWMCBgKiusFB
	4nfeNBwa9NMMWADiMs0DhrlFbd9glGE8uJ2Hnag6t+GqSxTr//NqxGasd700aV1Wb8z7TqTzS1L
	9rtG33XU8XydKCR9Mif2q28+y4zgdQmCauwmA4m9PWwzEgwMggoGvYGgQ7IgNtdmpBHvgNxzLsL
	Fcet/PMkn0Q1l2WdCWISi5fJvExha9FQp+yfdsSUhV7rZ29xB3wEGkO1czZWJtJQgXXBDkBqWRD
	7D/Vqg7K6E707cJVETnRyr8AOjSRBWcnvrR4k8uCY9ScTIritnATMjKj7s/Kavd7MXXyDpx4kMl
	GsAHX1x6K3EFJISnIwq1rn/9IHSMthll1Bg4pkzJD7GYUa0fLs18aef5xq5zi7EJ59ukIxo5KaP
	nCvbGh/GNfcUiaw
X-Received: by 2002:a05:6000:1c7:b0:463:4b73:87f5 with SMTP id ffacd0b85a97d-46509788e13mr10206259f8f.26.1781960421067;
        Sat, 20 Jun 2026 06:00:21 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 19/36] oeqa/core/runner: stub addDuration in OETestResult
Date: Sat, 20 Jun 2026 14:59:34 +0200
Message-ID: <65148e12f992ea229e1aa797af03b1437b5304f0.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239229

From: Ross Burton <ross.burton@arm.com>

We have a custom TestResult implementation, and Python 3.12 added a new
method addDuration() to the TestResult interface.  This would be useful
to implement correctly, but for now stub it out to silence the warning
when running under Python 3.12:

/usr/lib64/python3.12/unittest/case.py:580: RuntimeWarning: TestResult has no addDuration method
  warnings.warn("TestResult has no addDuration method",

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2d6fff81b34476b890f6943997615fbf8d3d133f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/core/runner.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index b683d9b80a7..0d2bc3a3ed0 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -78,6 +78,10 @@ class OETestResult(_TestResult):
                     self.shownmsg.append(test.id())
                     break
 
+    # Python 3.12 added this, stub it out for now
+    def addDuration(self, test, elapsed):
+         pass
+
     def logSummary(self, component, context_msg=''):
         elapsed_time = self.tc._run_end_time - self.tc._run_start_time
         self.tc.logger.info("SUMMARY:")

