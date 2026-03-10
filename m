Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84003FD4F17
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 18:14:02 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2079.1773166441284096645
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 11:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FidIX4fA;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852f73d0a3so30241395e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 11:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773166440; x=1773771240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Z5yClBMw/WYK5rXahP2tuBdwLN1TqvkGtDHVvLHxSY=;
        b=FidIX4fAMCKCRNQv8+K8HzoQiwQF1S1V3TgfvBprafeXek0PjAeKwuepTd+fv7DVkC
         vC5B45/HOJtkSYNz7fXHkF75qsYllmta28gMbcuheWatoo1d57ClyRVqMiRmwNQHSDVD
         lIy9nBkQijkDbo4CSrCzIbnA/cGXaKGU9ey8TyDOT+/wOmzvizg4YUu+ad/9eMdu/Zor
         80jpBIGtSFJYHkvzOvE26PrlhsMhtwTOVbpTaaFuibgd114NyLzGFXsXpPiwDr1iZh50
         N0hMqysHj/ldeZP8xMUjoHAsRllOIaLZunW/OsPsENVAZABKd9sYZZ0YZmIm+i668myw
         Ltsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773166440; x=1773771240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Z5yClBMw/WYK5rXahP2tuBdwLN1TqvkGtDHVvLHxSY=;
        b=nigET5PFXnrwfYPqjFHCUw9iPh8zYYdzNnrjVggegSZroWv3IHM/XQnkMcrlSKUtIJ
         En0mSGqNnY/1bssmWkfqU3rmSjptIaghdvAWHTjnA8VQUQHKFrH6fytJVn0XskT/M+qM
         WPF+wBM2DdA/x/KR4yKxaoUAHTsQoYCFD2tqOJPhUXlZ5cxzvfL7mEwu/CzO5AaJy3Y+
         PcK3VvDV1T9ERs89R9TVhUonrhYv6jzG0bIHibqnHqjLK2XgcE0T6v45HJ2xU4n6S2az
         D2ICPAFISOVA5u9ZxI0CWHo//4MNRkl4rO2BOY7401xs7z/Wtgct2aJnEDBQO5IBg9a3
         fY6Q==
X-Gm-Message-State: AOJu0YyeujjTdXGClIyKU62lBGDgNtkYKU2M2WN5IPi2O8PQFx/uF3W2
	eS92TZO27JfqErLJFQ7D6qUnMMWl+2nfnHn1hTVTTDBKCEzV7gvlkR+jxY7IaA==
X-Gm-Gg: ATEYQzy3lmUKgcy16Yr5xX+BKQrNBdGi8HJ+dr4HMqta0DPbZo5FilcD6zupV+ncKUm
	LV2dZQE+wvES9EGlRRaqTTuWmAUKhbrHasbEMd5mxBLngEd/NxFbChMJYgLoK9N96M5NVGtc6ia
	B2+H9mRis7JMaA1ltRVUWCSt6L1J3KBHnyzJnk14semyDROw+0IuyPrholre+2BK7FinbKYIh+6
	qdgLJZbaXtm/oGwtttjMEQsTqj3rguMr8voQdX1UmPcjeheanorHbkRALZN9pEzE+m/t3fPtY7z
	Q6O50NlqoPf0Q+pdQ1DzwzHCpJ+b58XOjZdHCMPMiCL0G/Hti3s3v8U3TDVf/MS69Od5w7h0kY7
	qaFIlHiLCXoO2vPKwAP/ek0eWR1iybvHfxUX7PrCwv+LwuZBk+TXEvr5r3nNUXC0Ue6vv/iBzHN
	vWPN0ylStH5eGHBdJcJQgN58ZMVxfubMThKheRaN5a55jpQBZ+iraiePEeNuA=
X-Received: by 2002:a05:600c:3b0c:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-48526979668mr265337415e9.24.1773166439375;
        Tue, 10 Mar 2026 11:13:59 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2b9ccsm37717631f8f.19.2026.03.10.11.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:13:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] rust: dynamically link with llvm for all rust variants
Date: Tue, 10 Mar 2026 19:13:54 +0100
Message-ID: <20260310181354.2396448-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 18:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232809

From: Alexander Kanavin <alex@linutronix.de>

This is a followup to an earlier fix, which did it only
for rust-native; additional testing revealed that nativsdk
and target builds have the same problem as they bootstrap
the compiler by first building an internal native version
that links with native llvm parts.

[YOCTO #16058]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/rust/rust_1.94.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.94.0.bb b/meta/recipes-devtools/rust/rust_1.94.0.bb
index 2be0bd8d89..cfee48ec78 100644
--- a/meta/recipes-devtools/rust/rust_1.94.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.94.0.bb
@@ -124,8 +124,7 @@ python do_configure() {
 
     # [llvm]
     config.add_section("llvm")
-    if d.getVar('PN') == "rust-native":
-        config.set("llvm", "link-shared", e(True))
+    config.set("llvm", "link-shared", e(True))
     config.set("llvm", "static-libstdcpp", e(False))
     config.set("llvm", "download-ci-llvm", e(False))
     if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""):
-- 
2.47.3


