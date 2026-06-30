Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F56C44507
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 21:04:32 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30999.1782853467593782486
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 14:04:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MMzWDapo;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7e9fa42f08cso553363a34.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 14:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782853467; x=1783458267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Z2EPDVyBQGcOUVHtdSyMrcOgnpxSNgURZL34IR3pSk=;
        b=MMzWDapoYAWL2W7G1kpPhRhAZTN3CDhpZNE1wkLRwVDywZXB4zIo+u+3lTBTvoYszK
         4qEyOZSfXnVaUbq/JOaZdik7iVpZ5JqL7zu6BWKeojV1b8S/z4OkRLQJhwudep6JQOUP
         D/N4D9HMivZ/tUMwj+sktfAp9rMm2GHzPe+SA4X9CMwqxF0XyNMdc9/7l03fmOFmkBfc
         GyiM4N8IpoK0Hvo/s3kSk5CHl8MMraDDxPArbn76TxfWr/9BZPGoKNnC2mfK0M9e4YNO
         WoJ0bKhU0LPglkN0VnU5EtkZXQ4WLZDMNNjZyumN0dcTG6NXj1ivLdPavBydik/7X620
         8+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782853467; x=1783458267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Z2EPDVyBQGcOUVHtdSyMrcOgnpxSNgURZL34IR3pSk=;
        b=roj9KklfZJaztn6Bn51KcMpUAPNmHlx4P9s8lueNcHGRwVvbFtrmkzm3yPq+Hdwsr4
         vMcPWE5MVPbuhXVIvxr2nHzqzSGUDxOtCDGLVgVb4y+Y8j8fbxEGUNRs0pony8pxywF+
         ztuMCHrmMK2sR3GU2fetg/oj4DAl/FQBH0tCDic8IY2P2yHl6TvDXUAokT6uwsdPTH+L
         RwnmFYzu+tjXKe6q8w/oGvqSZhbmqpKp5WvzsywcECNe8FPoNEpcIgOGVWkplRhJOJ9r
         uxJrzd0Q2+Uq2JAPtoqo0Avn4UG5IIaQQ+HM9VAtzTjkv1qBNrj2XmQJqoFEOPz1ejXg
         +vAQ==
X-Gm-Message-State: AOJu0YyMxrkUk7D02L85vkU2l0k+wM1jrNAlssB++76p/nDtVZwqRsih
	mnWC1pmOjKDJ+uwsW/LAsgbRqU9nMlvrwH3BgJ3P890ARsX/AN+/irQkeOa5gg==
X-Gm-Gg: AfdE7cn8d0KSFkwyes5Ju8r5l3AAkKde3BnM0Tk09LPaTAIp9dkXCgln9lpcXH6b6xI
	z70EiwDzkUcBd1AwraPZJ2BDXMjU1fjcobkJQBrG9zOkjabyjoHNw5FjA4HeOvMru7rZgk+Czpn
	LvuFRh6oVDl2YfhD6A9x/kMXyOeSfwYzFV4fhE4h0g53wFmThJZImSH26BEP96vgjxv2eXjLwk9
	pytBr5SCUxmKidmMH1qqqC63RMluBOoWJK3hElmgEne/Bm4qTfGxWzwBNa4bxhemacxnSG96c4w
	Ts+GqS3vPQijCyFDXo7ib2N5y8kLfTwa/62W8ndW7IIItDK2ePPLGaOxBvoa1MQd2j61Q7sTZIX
	yWQMP83r3j8aNVt66o0XU739PJDBG0x2T6exFxHDxystu19P7OlYOUrHaIoyfks1DKnkHOauvM1
	5C5vXjffGNVA==
X-Received: by 2002:a05:6830:3c84:b0:7e9:e808:e9c1 with SMTP id 46e09a7af769-7e9ec620de9mr4111857a34.8.1782853466743;
        Tue, 30 Jun 2026 14:04:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::3cfc])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ebfd01cdsm3248143a34.8.2026.06.30.14.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:04:26 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 03/10] oeqa: Add SPDX deploy SBoM test
Date: Tue, 30 Jun 2026 15:01:37 -0600
Message-ID: <20260630210422.1903245-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630210422.1903245-1-JPEWhacker@gmail.com>
References: <20260624141706.2164567-1-JPEWhacker@gmail.com>
 <20260630210422.1903245-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 21:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239918

Adds a test that verifies that the deploy SBoM is created correctly

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 8285189382..af2a9dc236 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -443,3 +443,14 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
                 r'\d',
                 f"Version '{version}' for package '{name}' should contain digits"
             )
+
+    def test_deploy_sbom(self):
+        kernel_recipe = get_bb_var("PREFERRED_PROVIDER_virtual/kernel")
+
+        objset = self.check_recipe_spdx(
+            "virtual/kernel",
+            f"{{DEPLOY_DIR_IMAGE}}/{kernel_recipe}-deploy-sbom.spdx.json",
+        )
+
+        # Document should be fully linked
+        self.check_objset_missing_ids(objset)
-- 
2.54.0


