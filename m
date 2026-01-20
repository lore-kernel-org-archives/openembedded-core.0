Return-Path: <ungerer.ricardo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CFBD2629A
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 19:47:49 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15080.1768938463345248668
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 11:47:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oh3jOmWO;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: ungerer.ricardo@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b685d2b79so5760728e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 11:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768938461; x=1769543261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvbtazrSmmBTfhLiBCH2JL2jkbxn9kQ8Sm8e9do1RnE=;
        b=Oh3jOmWOdTLgnQ3tzKXYU8hsHGAlOLoi3X0I//Mg6SKcCvlVuP5O+elawwlzwecUUM
         LQkHPhPvUxa2kCVl1Auq33Wq3/B54/293xAN2pn0GNvinMzhv3BOMgdQYbDbN+Q4fauX
         48bbixhvJ2vw69Cj2h3nJ77qqXAr+TYl7xvNSZg2YOMAt9u/fmgm1HvFm+5VJmMabrZO
         R8w8PVmvReenckj3YWrWmAj2kuA1Lz1kRaAco/zFzLQz2QFGtJjC7YXHZygVs81knQkG
         rFfBvdt+ErODQIghzFr9CurWyHO1hZO5tXWcRsjuzMjP/RNzxEQxHUq2SU2L3/2VBP9Q
         wgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768938461; x=1769543261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yvbtazrSmmBTfhLiBCH2JL2jkbxn9kQ8Sm8e9do1RnE=;
        b=SyRyvf93w/wpTU9xrDMP1SXot2/8tITGFCXg0hpu7BO9J3i89qn9nffFyavlTv7go3
         Fn/90HYERH2HK5PQe1lQ8LOwUXwVqo6GEvRPR8JnSTxv/F7m3UYuXyz5s8CsTMXbmivV
         ejhcuz+CJxxWgEu+/7QtCdjHl1uRTu0Yy2Q4d0zVeVuEzurqBpvf3WIF55Bye11efpbv
         H7NQqrK7i0pZd6VaVEP60jBrnpSd7Sku1BgRPUKStZdzgRKumTogbWDjzSnI/POwUaQn
         hl57AEiJGv38SxmeK+JBhgDfmesAIl89M4FLuHI2EfEfz7LWtBJVBa7hbWK6Ukcth5yU
         sZ2g==
X-Gm-Message-State: AOJu0YwoV9DwlCnZ5JmYKCUtxa/8iDAEi/bBik6vcHQHQfpNjC5uTTVP
	nVwd4aikG8ATdybbltQ4BYFnM9vnstNL89zFEbasUwFnkH0CPn5I4L1PVCZCpA==
X-Gm-Gg: AZuq6aJ5mdHwtAOun1YKAduGOVxjyc6FA41TTKRGCqyzZll40hpJqoJcUke59hQLqke
	YhsfmwekcUla7KajpN1GJL9uk2ElHbVR0Mt5bWxnzou9MMj6sjwdPOUv+I9erUqIcKHsAlBmXFM
	SXHbhtGebnixR60eg29/ClCygQYRLaqLomHH0knPs1kl5ZHPwfUmmB+1m8u/VPGruDihUysmFQR
	llDdGWI0v0oTdYB9WE1O4Gk22s3I1yyjjl2sr7c65mpZeOoDsefNR8c4EP+kRrt0ViS5iDQgs9w
	aIrYk90VOw9NKC1VchaO71Bzd5gZbzak4cecNcObavslHFhjygKn/9H7tyvMPfMHd8jOaPnuSdy
	dUET7hYJLXCL7o5XkeyVft4ZWdYSWcPB6SgDq8xDaGI6n/ChPMEkHBamoE1dP+vB005uN5DlKKW
	hO+yPvl0Tilg+G87E6
X-Received: by 2002:a05:6512:4025:b0:594:2c64:54c9 with SMTP id 2adb3069b0e04-59baeee3979mr4748836e87.37.1768938460743;
        Tue, 20 Jan 2026 11:47:40 -0800 (PST)
Received: from bolonheso.. ([45.94.208.114])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-59baf9d442dsm4395035e87.94.2026.01.20.11.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 11:47:40 -0800 (PST)
From: Ricardo Ungerer <ungerer.ricardo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ricardo Ungerer <ungerer.ricardo@gmail.com>
Subject: [PATCH 3/3] yocto-check-layer: Add docstring to test_readme method
Date: Tue, 20 Jan 2026 19:47:22 +0000
Message-ID: <20260120194722.142355-4-ungerer.ricardo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120194722.142355-1-ungerer.ricardo@gmail.com>
References: <20260120194722.142355-1-ungerer.ricardo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 19:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229791

Signed-off-by: Ricardo Ungerer <ungerer.ricardo@gmail.com>
---
 scripts/lib/checklayer/cases/common.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checklayer/cases/common.py
index 9ea7592ba6..d20559e163 100644
--- a/scripts/lib/checklayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -12,6 +12,16 @@ from checklayer.case import OECheckLayerTestCase
 
 class CommonCheckLayer(OECheckLayerTestCase):
     def test_readme(self):
+        """
+        Test that the layer contains a valid README file and that is meets
+        the following criteria:
+        1. A README file exists in the layer's root directory (case-insensitive)
+        2. The README file is not empty
+        3. The README contains maintainer information (checks for the word "maintainer")
+        4. The README contains patching instructions (checks for the word "patch")
+        5. The README contains at least one email address
+        If the README references another README file, steps 3, 4, and 5 are skipped.
+        """
         if self.tc.layer['type'] == LayerType.CORE:
             raise unittest.SkipTest("Core layer's README is top level")
 
-- 
2.43.0


