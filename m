Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE77C8302F
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 07:34:21 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.4577.1751355254691711631
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 00:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=x+IfkEzk;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b3b250621so50039651fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 00:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751355253; x=1751960053; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3R2dEA1OM3H9BLmAYzVTmitPM3HIu1HbgrsQr3EeoZE=;
        b=x+IfkEzk3Mfvn51xo5K7dm+SV10PtFFuudS02X/1JCgttsv3EIAB0lofC6EqxeWiDC
         sP+dqGVk4QB5k3M2JncC6kxqnwpk39F9PW9xNhUUtFs5v0Jl9enPlCKsi3j8GyKQmBxD
         PIbJZJX3Jj6+Q/E2Hkci5+wKf26G6toUpfTSp+fB1Cq15nIeFur4EV+s0WnwqtpcLqy2
         XbwFdRaMdsZH1UpcfZUJMiz2U0GaAmpXLCIZ+kq1Ydk7Tr7niFHqWNGos7dtynqDV6+g
         i6mNVNS9wrmxDFIWJh/Zcx3/P2t7dQhDobZc1S3hZAVBgvN59n5/+PQOahsEkGPU7Up5
         L1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751355253; x=1751960053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3R2dEA1OM3H9BLmAYzVTmitPM3HIu1HbgrsQr3EeoZE=;
        b=jt2/aoTG6oq7Hbr8ceeg5b7U/MnfV4AsP0bmPJbJ722PzJuy/ivaDkJXX9zFHaQNUd
         zljVW9mzUMeNmFPOmpZazD+VIAbynAd7FO9QU2da1GyCkObFJDSFNS/g1XcVxbPg4chg
         MIfmTlCfclbI0BvA/V3z1w5SNbniJtkpiPrXvSNuemfLvnpNQOPU340lBbjkHbixYEWG
         k+xzG0aJc6HkFJsgZRFroNQWdvp9exIvopT89hus2TUPm5AkgRLovs6MGHJs9h3Rc0n6
         Y4RAfV7D1NoSqGmUKZk1ghvjVoF8uCbcIUkn/OQm1/RJJintNSgjDXCD1cvC7JSm8A/U
         Oc6Q==
X-Gm-Message-State: AOJu0Yy8C8oYf/xyYBkvYmLZyPxH1Ngh/xWpZ1I/OJs/5VPoGlXAN7u5
	ei763fT4zPOBii2J0Z49EBP5z4q45K32pqH4p5ZE7/42yycaqWU6hggEligfuzbWCvM7uP0zGnn
	Jl/X5iLA=
X-Gm-Gg: ASbGncv/Ly3gDuC6o9YrrLoW4I27ZynrZzcLISxyjPcx1xTYtC6bd5rBdswFZp0T5m7
	AhnfUaQB/KrCh8jFeHs0g25zN8BdIACWz5EHn6KK+3SUvHPQG9SPExntp7JG0F7zpY5fXtkIDck
	ojEvWpguKekvCNv6YEMus9qtKv1+FcwAnRWBLIsu6Og6IBFp7YB6wzn44fFmxG7bdxfsKFBirTX
	0MzslPD28sQN3WghHAs9+Vu1ig8PYi5wu5t64xZNd+DAcKkDoNywXdREdWBBNeuIza42GNcnY2T
	E2V13uqpEvqBMfu5ZROK0Q+tzGaeMJQqMousvzc3ZCDfYBdT57ixvMnWTfwDlThnuzsansQ+5Lj
	k6qw0jncywfXSWRS0XpV6tmgufLEUOEKtyTvFbLw=
X-Google-Smtp-Source: AGHT+IGQfE63R3LjisRsdvL76yktK9w1/M4RH09axLATQB/Qb7D4Zj0EHP5oXih7qDcz0ZktVgnQfA==
X-Received: by 2002:a2e:be11:0:b0:32c:de97:6ff7 with SMTP id 38308e7fff4ca-32cde977153mr56930641fa.29.1751355252597;
        Tue, 01 Jul 2025 00:34:12 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2dead99sm15268581fa.22.2025.07.01.00.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 00:34:12 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 1/6] oeqa runtime: set self.runner and handle None
Date: Tue,  1 Jul 2025 10:33:54 +0300
Message-ID: <20250701073359.979368-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 07:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219548

Set default self.runner to None. qemu target sets
the runner to qemu. Then handle self.runner None in
run_network_serialdebug(). This way ssh runner
and failing ping or ssh tests handle the error cases.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/core/target/__init__.py | 1 +
 meta/lib/oeqa/runtime/case.py         | 2 ++
 2 files changed, 3 insertions(+)

v2: setting self.runner for all target types instead of target conditional
    paths in tests

v1: https://lists.openembedded.org/g/openembedded-core/message/219377
    and https://lists.openembedded.org/g/openembedded-core/message/219378

diff --git a/meta/lib/oeqa/core/target/__init__.py b/meta/lib/oeqa/core/target/__init__.py
index 1382aa9b5239..177f648fe358 100644
--- a/meta/lib/oeqa/core/target/__init__.py
+++ b/meta/lib/oeqa/core/target/__init__.py
@@ -10,6 +10,7 @@ class OETarget(object):
 
     def __init__(self, logger, *args, **kwargs):
         self.logger = logger
+        self.runner = None
 
     @abstractmethod
     def start(self):
diff --git a/meta/lib/oeqa/runtime/case.py b/meta/lib/oeqa/runtime/case.py
index 9515ca2f3d62..2a47771a3d47 100644
--- a/meta/lib/oeqa/runtime/case.py
+++ b/meta/lib/oeqa/runtime/case.py
@@ -23,6 +23,8 @@ class OERuntimeTestCase(OETestCase):
         uninstall_package(self)
 
 def run_network_serialdebug(runner):
+    if not runner:
+        return
     status, output = runner.run_serial("ip addr")
     print("ip addr on target: %s %s" % (output, status))
     status, output = runner.run_serial("ping -c 1 %s" % self.target.server_ip)
-- 
2.43.0


