Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF3EC8300F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 06:30:34 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.7315.1751005827333370410
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 23:30:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OBWf0LN5;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55350d0eedeso1974122e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 23:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751005825; x=1751610625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bY2VEikW0RjaEyaNiLpJGfV1xI/BJcH0PmO3qJX7Qp8=;
        b=OBWf0LN5yYRxpmJ0HNKicch6ScNVM9rgBKo3nkIdo2zfyao4XFIlySOKDncEFWtLn7
         DxBehCP9hSkxKiAzPGmG2sGen7fNT3zL/jwvphwnct6P7+s0STQ7juJdSlZFmyT2O9rR
         ZqJEup9aFy8H3k7UVYTKKFh39W5gfZF7/1R7iHDyNpuMsDWoWib6BvAavqZ0H4pVS+B3
         xtfqTBbZdk/I+CvkJacVjYfS/sr18CIpkEW4FYZB9hxOGTViINaNJ4GXL2qARNSdfPb2
         Ak43uSvF1wdnP/8lm3JuVjhgHPpAHDQNoulOpcf4nR8vjUyH6hG1x6sYAzK4B9nUA0rx
         2Tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751005825; x=1751610625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bY2VEikW0RjaEyaNiLpJGfV1xI/BJcH0PmO3qJX7Qp8=;
        b=Iz9oTb42pPvUktDt0spWfHFjDNNEG2CBkcaIV+7JnfMUcL3FPno8SeqsbinRq5p++e
         MvNTQbKdiRqhhWONWorlE8gHJ3c1OIHadkdeNfrfmUVIXd7UidXkvIP82FExiaMfOWTa
         0ZhBYXp34qGmjlgz1zCW5spTOhjziRTDEmG5/w2CObzDZH4fNCX7ZvCV48fAxGWkCefb
         hTuXeskTj1Y0X7a9DAc49GFzKU9M0ckEkAXT+HqCe/VnGLLGR3lmkyS1hm0Je8CXAW1j
         kSAVtHVt3dM+4HU/X0Q4RcXdTDfvkW7hOj8SQxr6BKg6L9d91PoWxmFroZiftOllky3T
         oUZA==
X-Gm-Message-State: AOJu0Yxcad5vEp+Qg/FIrq5vpirDhG7P2kEFCwDhtnBxrb2ftH5gnXyQ
	JTmIFLn88Qi9jgeYdf5ugOJDahyif+tEVHSCilf8yo2wwzT/irMCwCJlU82dOdWHgTHmwjHzkUV
	Va5TkuxM=
X-Gm-Gg: ASbGnctU3m6aH+BnHQ96ADXgxcJf1WG1meySCxwff7p2Y/WKLIUt06s+65gx9bt1AUA
	Ta6uZbQOuoE/62d8jCYpwu7ddz0hTUx8GHr8MjzfSwGrWEJeE/5unWSk/BIGljo4cgzkgQ+x5NU
	YxBZKSK+2OPzxIMpPlEAw6LJ96XJOIrgn7I3qrweGfMBwi6kbsw0LJlox/LcWPdwJHiJUtxpwgE
	+uI8LDH+nf3dfX0HAoB627qJIzGthj1Fb9dkilyxWEkRtc9Tws3raPkieCEUcpDmdYdtagRi2t0
	Km2abIos+UoZbPj2/1WNNs5mgenM5UwxLqE8myZkkFS7oinZ7q5wjP/Jp3q/4gIKIXevkoHDbiv
	XZVnbJwkmcf1ByKrsSTjeUukIGG7pgmU4d1uLBjk=
X-Google-Smtp-Source: AGHT+IFRy2BPYPmk29oKBDetu6BC/GjrunZ7vKupCFZs1eumxiSR4mSA0vQLS6dfjK8ee2p+sRS13Q==
X-Received: by 2002:a05:6512:3c8c:b0:553:2c01:ff44 with SMTP id 2adb3069b0e04-5550b7e9fb6mr698578e87.2.1751005825401;
        Thu, 26 Jun 2025 23:30:25 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2a740csm318916e87.89.2025.06.26.23.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 23:30:25 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 4/6] oeqa context.py: use TEST_SUITES if set
Date: Fri, 27 Jun 2025 09:30:02 +0300
Message-ID: <20250627063004.781560-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627063004.781560-1-mikko.rapeli@linaro.org>
References: <20250627063004.781560-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 06:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219380

If build target has set TEST_SUITES, then that should
be the default test modules to execute. Fixes testexport.bbclass
to run same tests as testimage.bbclass which already
uses TEST_SUITES.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/core/context.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 9313271f5865..a0eb16e71602 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -179,9 +179,14 @@ class OETestContextExecutor(object):
         else:
             self.tc_kwargs['init']['td'] = {}
 
+        # Run image specific TEST_SUITE like testimage.bbclass by default
+        test_suites = self.tc_kwargs['init']['td'].get("TEST_SUITES").split()
+
         if args.run_tests:
             self.tc_kwargs['load']['modules'] = args.run_tests
             self.tc_kwargs['load']['modules_required'] = args.run_tests
+        elif test_suites:
+            self.tc_kwargs['load']['modules'] = test_suites
         else:
             self.tc_kwargs['load']['modules'] = []
 
-- 
2.43.0


