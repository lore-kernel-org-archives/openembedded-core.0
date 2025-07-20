Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E990C83F1A
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 20:05:27 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.24813.1753041917796222262
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 13:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QIWnOssG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2352400344aso32447195ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 13:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753041917; x=1753646717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R4+j2kZF326Ir3bVyhJaqWuD6cw8tDn8rLSdVAG6Owg=;
        b=QIWnOssGTAjST8tFHomC0ur2glYwrg0lJcLkRhF9retAV2z3OOLFJFqe4ilTYtkBOa
         i+QqM2nOXUdVZvMCi/4UorcwTm6erre20AiY0LSd5j0BBmhAwefJYHBIH8OVfqjTHOgO
         Gtp7MBF5TRFiQ+EGpYGwZ7weeQvBRSDPvkw/oBKXcOihuvxEw7FGRxsgKPpq3GaAhgsF
         Z+5tkVej+oue/YikGXbwtznfEcN0mjnzNikkpCbEjGR+1LtbRkFyhLJvwpQ7ZP991TWy
         YAfFwrD2+ab2kFYFOK5u+YP842BV5SBNvE7BgCBr2na8cfKiZz9H+A5Wqi7m8xwNLOMQ
         C5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753041917; x=1753646717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R4+j2kZF326Ir3bVyhJaqWuD6cw8tDn8rLSdVAG6Owg=;
        b=dQxk+5uWOxlafPmfb8LmqHZGioeLrkoViZTDtHxJd36zAYUNv7KF6WOkNCE4qFiMv3
         msDZugPdGG2Hl4fLctcVm8HVeXDeQRd5ElQ1ackWxZ5brbI+duzgnp0B1QrpAfdPe+K+
         mVlNHwPjQwTxLWx22Ghz6F/a3jyOyGuH/mVYgJS2ctwo9bOpQzgolAPScd0v6I0fvoeG
         ctq+JO+FnVe9Xi7Zfn2mCmpvswy33qhAdyWdAerTSpw+Id9oMmtnSLkz4h2dLtFu5gBQ
         7w9e6QnQF6qZs/jNotUDQOv9Svl2fQRdfwzltlkUHEC/7fkl3QTAsbRKZuv7cRf9QCH8
         NU5g==
X-Gm-Message-State: AOJu0YxtjziOa6vHov1OnBnXzNeziGZT5gXrLv+Y740kOf+/AezuUoD0
	2kdNSpuv2unAKTe9cKbSsecFPXbI2JQqGjyAcJHkUCIXFPRU50nCbjcvgkfpW1YPeEddIBvwZ9J
	fLLJvb1E=
X-Gm-Gg: ASbGncs8DLbhXFXdSa3QxM5YrJpGm5oGiZk6/RzUuY/Rm7n6CXB2Y2VSahZ8P6RpZcA
	/+Y7+ARZYR/4I7R+tHARvNDIvNxvVoyRP4pLEW4Ja9/yHo/xw86695zWO+Y+l0I87Znq0/Jx5mh
	7cMYWnE3CW1kIEZkKs/jQuCj8An4h/f1lKEGBZ5Kd8bBqfKIiMnCc4qOKaqMQNzMLleDfl4ZU6v
	1SuZCfa5Ql+K3+0ysqMhBB39vJblRWP8JFkUGUUfZppDm9iHqS9cvsyUKfm1IQDF5eVuRqk/Nja
	ctrAYPVx1Bd9iqx608MCmeyx4fnDSNYeN/qt3AMcfLBL3LRd+3RfrRbPkeUh3BkAXsbyjIh/K/+
	FzdceP6Q/N7NQ7w==
X-Google-Smtp-Source: AGHT+IHHHNdyu7rBNLKctVJrUv5xCJ2EcZS76nKix7lEr2w9GY9721J/dEXCY+JOw9v//N9+ZFm7pQ==
X-Received: by 2002:a17:903:2290:b0:234:a139:1210 with SMTP id d9443c01a7336-23e250012ccmr291327625ad.53.1753041915919;
        Sun, 20 Jul 2025 13:05:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:31c9:438f:a923:8d3c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60f096sm44894035ad.78.2025.07.20.13.05.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 13:05:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 09/12] linux-yocto-6.12: Update CVE list for 6.12.36
Date: Sun, 20 Jul 2025 13:04:46 -0700
Message-ID: <a17a9a395cf98290319844dd4d345ba7899be093.1753041740.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753041740.git.steve@sakoman.com>
References: <cover.1753041740.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 20:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220634

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 70f8975e142345a11905d6949f2ef4071baa8e77)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_6.12.inc              | 1135 ++++++++++++++++-
 1 file changed, 1079 insertions(+), 56 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 199ea019d5..6c816b66f4 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,12 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-06-05 16:29:20.725105+00:00 for kernel version 6.12.31
-# From cvelistV5 cve_2025-06-05_1600Z
+# Generated at 2025-07-09 07:57:09.220247+00:00 for kernel version 6.12.36
+# From cvelistV5 cve_2025-07-09_0700Z-1-gca2b12e7c08
+
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.31"
+    this_version = "6.12.36"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -536,8 +537,6 @@ CVE_STATUS[CVE-2021-47142] = "fixed-version: Fixed from version 5.13"
 
 CVE_STATUS[CVE-2021-47143] = "fixed-version: Fixed from version 5.13"
 
-CVE_STATUS[CVE-2021-47144] = "fixed-version: Fixed from version 5.13"
-
 CVE_STATUS[CVE-2021-47145] = "fixed-version: Fixed from version 5.13"
 
 CVE_STATUS[CVE-2021-47146] = "fixed-version: Fixed from version 5.13"
@@ -914,7 +913,7 @@ CVE_STATUS[CVE-2021-47340] = "fixed-version: Fixed from version 5.14"
 
 CVE_STATUS[CVE-2021-47341] = "fixed-version: Fixed from version 5.14"
 
-CVE_STATUS[CVE-2021-47342] = "fixed-version: Fixed from version 5.14"
+CVE_STATUS[CVE-2021-47342] = "fixed-version: Fixed from version 5.10.77"
 
 CVE_STATUS[CVE-2021-47343] = "fixed-version: Fixed from version 5.14"
 
@@ -2836,8 +2835,6 @@ CVE_STATUS[CVE-2022-49297] = "fixed-version: Fixed from version 5.19"
 
 CVE_STATUS[CVE-2022-49298] = "fixed-version: Fixed from version 5.19"
 
-CVE_STATUS[CVE-2022-49299] = "fixed-version: Fixed from version 5.19"
-
 CVE_STATUS[CVE-2022-49300] = "fixed-version: Fixed from version 5.19"
 
 CVE_STATUS[CVE-2022-49301] = "fixed-version: Fixed from version 5.19"
@@ -4050,33 +4047,615 @@ CVE_STATUS[CVE-2022-49917] = "fixed-version: Fixed from version 6.1"
 
 CVE_STATUS[CVE-2022-49918] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2022-49919] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2022-49919] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49920] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49921] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49922] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49923] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49924] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49925] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49926] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49927] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49928] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49929] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49930] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49931] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49932] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-49934] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49935] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49936] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49937] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49938] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49939] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49940] = "fixed-version: Fixed from version 5.19.8"
+
+CVE_STATUS[CVE-2022-49942] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49943] = "fixed-version: Fixed from version 5.19.8"
+
+CVE_STATUS[CVE-2022-49944] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49945] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49946] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49947] = "fixed-version: Fixed from version 5.19.8"
+
+CVE_STATUS[CVE-2022-49948] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49949] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49950] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49951] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49952] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49953] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49954] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49955] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49956] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49957] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49958] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49959] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49960] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49961] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49962] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49963] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49964] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49965] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49966] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49967] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49968] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49969] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49970] = "fixed-version: Fixed from version 5.19.8"
+
+CVE_STATUS[CVE-2022-49971] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49972] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49973] = "fixed-version: Fixed from version 5.19.8"
+
+CVE_STATUS[CVE-2022-49974] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49975] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49976] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49977] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49978] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49979] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49980] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49981] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49982] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49983] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49984] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49985] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49986] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49987] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49989] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49990] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49991] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49992] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49993] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49994] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49995] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49996] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49997] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49998] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-49999] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50000] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50001] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50002] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50003] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50004] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50005] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50006] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50007] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50008] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50009] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50010] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50011] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50012] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50013] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50014] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50015] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50016] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50017] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50019] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50020] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50021] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50022] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50023] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50024] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50025] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50026] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50027] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50028] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50029] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50030] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50031] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50032] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50033] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50034] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50035] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50036] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50037] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50038] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50039] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50040] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50041] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50042] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50043] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50044] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50045] = "fixed-version: Fixed from version 5.19.4"
+
+CVE_STATUS[CVE-2022-50046] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50047] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50048] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50049] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50050] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50051] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50052] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50053] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50054] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50055] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50056] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50057] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50058] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50059] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50060] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50061] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50062] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50063] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50064] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50065] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50066] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50067] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50068] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50069] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50070] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50071] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50072] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50073] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50074] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50075] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50076] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50077] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50078] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50079] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50080] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50082] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50083] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50084] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50085] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50086] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50087] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50088] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50089] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50090] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50091] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50092] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50093] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50094] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50095] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50096] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50097] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50098] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50099] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50100] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50101] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50102] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50103] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50104] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50105] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50106] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50107] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50108] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50109] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50110] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50111] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50112] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50113] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50114] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50115] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50116] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50117] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50118] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50119] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50120] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50121] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50122] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50123] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50124] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50125] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50126] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50127] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50129] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50130] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50131] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50132] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50133] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50134] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50135] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50136] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50137] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50138] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50139] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50140] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50141] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50142] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50143] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50144] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50145] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50146] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50147] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50148] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50149] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50151] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50152] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50153] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50154] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50155] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50156] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50157] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50158] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50159] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50160] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50161] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50162] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50163] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50164] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50165] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50166] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50167] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50168] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50169] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50170] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50171] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50172] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50173] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50174] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50175] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50176] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50177] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50178] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50179] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50181] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50182] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50183] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50184] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50185] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50186] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50187] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50188] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50189] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50190] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50191] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50192] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50193] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50194] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50195] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50196] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50197] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50198] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50199] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50200] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50201] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50202] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50203] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50204] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50205] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50206] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50207] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50208] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50209] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50210] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50211] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50212] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50213] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50214] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50215] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50217] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50218] = "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-50219] = "fixed-version: Fixed from version 6.0"
 
-CVE_STATUS[CVE-2022-49920] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2022-50220] = "fixed-version: Fixed from version 6.0"
 
-CVE_STATUS[CVE-2022-49921] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2022-50221] = "fixed-version: Fixed from version 6.0"
 
-CVE_STATUS[CVE-2022-49922] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2022-50222] = "fixed-version: Fixed from version 6.0"
 
-CVE_STATUS[CVE-2022-49923] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2022-50223] = "fixed-version: Fixed from version 6.0"
 
-CVE_STATUS[CVE-2022-49924] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2022-50224] = "fixed-version: Fixed from version 6.0"
 
-CVE_STATUS[CVE-2022-49925] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2022-50225] = "fixed-version: Fixed from version 6.0"
 
-CVE_STATUS[CVE-2022-49926] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2022-50226] = "fixed-version: Fixed from version 6.0"
 
-CVE_STATUS[CVE-2022-49927] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2022-50227] = "fixed-version: Fixed from version 6.0"
 
-CVE_STATUS[CVE-2022-49928] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2022-50228] = "fixed-version: Fixed from version 6.0"
 
-CVE_STATUS[CVE-2022-49929] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2022-50229] = "fixed-version: Fixed from version 6.0"
 
-CVE_STATUS[CVE-2022-49930] = "fixed-version: Fixed from version 6.1"
+# CVE-2022-50230 has no known resolution
 
-CVE_STATUS[CVE-2022-49931] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2022-50231] = "fixed-version: Fixed from version 6.0"
 
-CVE_STATUS[CVE-2022-49932] = "fixed-version: Fixed from version 6.3"
+# CVE-2022-50232 has no known resolution
 
 # CVE-2023-34319 has no known resolution
 
@@ -4562,8 +5141,6 @@ CVE_STATUS[CVE-2023-52731] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2023-52732] = "fixed-version: Fixed from version 6.2"
 
-# CVE-2023-52733 has no known resolution
-
 CVE_STATUS[CVE-2023-52735] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2023-52736] = "fixed-version: Fixed from version 6.2"
@@ -5526,7 +6103,7 @@ CVE_STATUS[CVE-2024-26708] = "fixed-version: Fixed from version 6.8"
 
 CVE_STATUS[CVE-2024-26709] = "fixed-version: Fixed from version 6.8"
 
-# CVE-2024-26710 has no known resolution
+CVE_STATUS[CVE-2024-26710] = "fixed-version: Fixed from version 6.7.6"
 
 CVE_STATUS[CVE-2024-26711] = "fixed-version: Fixed from version 6.8"
 
@@ -5690,8 +6267,6 @@ CVE_STATUS[CVE-2024-26792] = "fixed-version: Fixed from version 6.7.9"
 
 CVE_STATUS[CVE-2024-26793] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2024-26794] = "fixed-version: Fixed from version 6.7.9"
-
 CVE_STATUS[CVE-2024-26795] = "fixed-version: Fixed from version 6.8"
 
 CVE_STATUS[CVE-2024-26796] = "fixed-version: Fixed from version 6.8"
@@ -6346,8 +6921,6 @@ CVE_STATUS[CVE-2024-35786] = "fixed-version: Fixed from version 6.8"
 
 CVE_STATUS[CVE-2024-35787] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2024-35788 has no known resolution
-
 CVE_STATUS[CVE-2024-35789] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-35790] = "fixed-version: Fixed from version 6.8"
@@ -6794,8 +7367,6 @@ CVE_STATUS[CVE-2024-36020] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-36021] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2024-36022] = "fixed-version: Fixed from version 6.9"
-
 CVE_STATUS[CVE-2024-36023] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-36024] = "fixed-version: Fixed from version 6.9"
@@ -8422,8 +8993,6 @@ CVE_STATUS[CVE-2024-44953] = "fixed-version: Fixed from version 6.11"
 
 CVE_STATUS[CVE-2024-44954] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2024-44955] = "fixed-version: Fixed from version 6.11"
-
 CVE_STATUS[CVE-2024-44956] = "fixed-version: Fixed from version 6.11"
 
 CVE_STATUS[CVE-2024-44957] = "fixed-version: Fixed from version 6.11"
@@ -8632,8 +9201,6 @@ CVE_STATUS[CVE-2024-46698] = "fixed-version: Fixed from version 6.11"
 
 CVE_STATUS[CVE-2024-46699] = "fixed-version: Fixed from version 6.11"
 
-# CVE-2024-46700 has no known resolution
-
 CVE_STATUS[CVE-2024-46701] = "fixed-version: Fixed from version 6.11"
 
 CVE_STATUS[CVE-2024-46702] = "fixed-version: Fixed from version 6.11"
@@ -9546,8 +10113,6 @@ CVE_STATUS[CVE-2024-50030] = "fixed-version: Fixed from version 6.12"
 
 CVE_STATUS[CVE-2024-50031] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2024-50032] = "fixed-version: Fixed from version 6.11.4"
-
 CVE_STATUS[CVE-2024-50033] = "fixed-version: Fixed from version 6.12"
 
 CVE_STATUS[CVE-2024-50034] = "fixed-version: Fixed from version 6.12"
@@ -11012,8 +11577,6 @@ CVE_STATUS[CVE-2024-56784] = "cpe-stable-backport: Backported in 6.12.5"
 
 CVE_STATUS[CVE-2024-56785] = "cpe-stable-backport: Backported in 6.12.5"
 
-CVE_STATUS[CVE-2024-56786] = "cpe-stable-backport: Backported in 6.12.5"
-
 CVE_STATUS[CVE-2024-56787] = "cpe-stable-backport: Backported in 6.12.5"
 
 CVE_STATUS[CVE-2024-56788] = "cpe-stable-backport: Backported in 6.12.7"
@@ -11156,8 +11719,6 @@ CVE_STATUS[CVE-2024-57918] = "cpe-stable-backport: Backported in 6.12.10"
 
 CVE_STATUS[CVE-2024-57919] = "cpe-stable-backport: Backported in 6.12.10"
 
-# CVE-2024-57920 has no known resolution
-
 CVE_STATUS[CVE-2024-57921] = "cpe-stable-backport: Backported in 6.12.10"
 
 CVE_STATUS[CVE-2024-57922] = "cpe-stable-backport: Backported in 6.12.10"
@@ -11228,7 +11789,7 @@ CVE_STATUS[CVE-2024-57974] = "cpe-stable-backport: Backported in 6.12.13"
 
 CVE_STATUS[CVE-2024-57975] = "cpe-stable-backport: Backported in 6.12.13"
 
-# CVE-2024-57976 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2024-57976] = "cpe-stable-backport: Backported in 6.12.36"
 
 CVE_STATUS[CVE-2024-57977] = "cpe-stable-backport: Backported in 6.12.13"
 
@@ -11406,7 +11967,7 @@ CVE_STATUS[CVE-2024-58089] = "cpe-stable-backport: Backported in 6.12.17"
 
 CVE_STATUS[CVE-2024-58090] = "cpe-stable-backport: Backported in 6.12.18"
 
-# CVE-2024-58091 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2024-58091] = "cpe-stable-backport: Backported in 6.12.36"
 
 CVE_STATUS[CVE-2024-58092] = "cpe-stable-backport: Backported in 6.12.22"
 
@@ -11790,7 +12351,7 @@ CVE_STATUS[CVE-2025-21815] = "cpe-stable-backport: Backported in 6.12.14"
 
 CVE_STATUS[CVE-2025-21816] = "cpe-stable-backport: Backported in 6.12.14"
 
-# CVE-2025-21817 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2025-21817] = "fixed-version: only affects 6.13.2 onwards"
 
 CVE_STATUS[CVE-2025-21819] = "cpe-stable-backport: Backported in 6.12.14"
 
@@ -12352,7 +12913,7 @@ CVE_STATUS[CVE-2025-22099] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-22100] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2025-22101 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22101] = "cpe-stable-backport: Backported in 6.12.36"
 
 CVE_STATUS[CVE-2025-22102] = "cpe-stable-backport: Backported in 6.12.30"
 
@@ -12374,7 +12935,7 @@ CVE_STATUS[CVE-2025-22110] = "fixed-version: only affects 6.14 onwards"
 
 # CVE-2025-22111 needs backporting (fixed from 6.15)
 
-CVE_STATUS[CVE-2025-22112] = "fixed-version: only affects 6.14 onwards"
+CVE_STATUS[CVE-2025-22112] = "cpe-stable-backport: Backported in 6.12.35"
 
 # CVE-2025-22113 needs backporting (fixed from 6.15)
 
@@ -12388,15 +12949,15 @@ CVE_STATUS[CVE-2025-22114] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-22118] = "fixed-version: only affects 6.13 onwards"
 
-CVE_STATUS[CVE-2025-22119] = "fixed-version: only affects 6.14 onwards"
+CVE_STATUS[CVE-2025-22119] = "cpe-stable-backport: Backported in 6.12.35"
 
 CVE_STATUS[CVE-2025-22120] = "cpe-stable-backport: Backported in 6.12.26"
 
 # CVE-2025-22121 needs backporting (fixed from 6.15)
 
-# CVE-2025-22122 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22122] = "cpe-stable-backport: Backported in 6.12.33"
 
-# CVE-2025-22123 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22123] = "cpe-stable-backport: Backported in 6.12.33"
 
 # CVE-2025-22124 needs backporting (fixed from 6.15)
 
@@ -12406,7 +12967,7 @@ CVE_STATUS[CVE-2025-22126] = "cpe-stable-backport: Backported in 6.12.25"
 
 # CVE-2025-22127 needs backporting (fixed from 6.15)
 
-# CVE-2025-22128 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22128] = "cpe-stable-backport: Backported in 6.12.35"
 
 # CVE-2025-23129 needs backporting (fixed from 6.15)
 
@@ -12424,7 +12985,7 @@ CVE_STATUS[CVE-2025-23134] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-23136] = "cpe-stable-backport: Backported in 6.12.23"
 
-# CVE-2025-23137 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-23137] = "cpe-stable-backport: Backported in 6.12.35"
 
 CVE_STATUS[CVE-2025-23138] = "cpe-stable-backport: Backported in 6.12.23"
 
@@ -12458,7 +13019,7 @@ CVE_STATUS[CVE-2025-23153] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-23154] = "cpe-stable-backport: Backported in 6.12.24"
 
-# CVE-2025-23155 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-23155] = "cpe-stable-backport: Backported in 6.12.36"
 
 CVE_STATUS[CVE-2025-23156] = "cpe-stable-backport: Backported in 6.12.24"
 
@@ -12672,7 +13233,7 @@ CVE_STATUS[CVE-2025-37840] = "cpe-stable-backport: Backported in 6.12.24"
 
 CVE_STATUS[CVE-2025-37841] = "cpe-stable-backport: Backported in 6.12.24"
 
-# CVE-2025-37842 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-37842] = "cpe-stable-backport: Backported in 6.12.36"
 
 CVE_STATUS[CVE-2025-37843] = "cpe-stable-backport: Backported in 6.12.24"
 
@@ -12698,7 +13259,7 @@ CVE_STATUS[CVE-2025-37853] = "cpe-stable-backport: Backported in 6.12.24"
 
 CVE_STATUS[CVE-2025-37854] = "cpe-stable-backport: Backported in 6.12.24"
 
-# CVE-2025-37855 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-37855] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-37856] = "cpe-stable-backport: Backported in 6.12.24"
 
@@ -12938,8 +13499,6 @@ CVE_STATUS[CVE-2025-37974] = "cpe-stable-backport: Backported in 6.12.29"
 
 CVE_STATUS[CVE-2025-37975] = "cpe-stable-backport: Backported in 6.12.25"
 
-# CVE-2025-37976 has no known resolution
-
 CVE_STATUS[CVE-2025-37977] = "cpe-stable-backport: Backported in 6.12.26"
 
 CVE_STATUS[CVE-2025-37978] = "cpe-stable-backport: Backported in 6.12.25"
@@ -12986,12 +13545,476 @@ CVE_STATUS[CVE-2025-37998] = "cpe-stable-backport: Backported in 6.12.29"
 
 CVE_STATUS[CVE-2025-37999] = "cpe-stable-backport: Backported in 6.12.29"
 
+CVE_STATUS[CVE-2025-38000] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38001] = "cpe-stable-backport: Backported in 6.12.32"
+
+CVE_STATUS[CVE-2025-38002] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-38003] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38004] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38005] = "cpe-stable-backport: Backported in 6.12.30"
+
+CVE_STATUS[CVE-2025-38006] = "cpe-stable-backport: Backported in 6.12.30"
+
+CVE_STATUS[CVE-2025-38007] = "cpe-stable-backport: Backported in 6.12.30"
+
+CVE_STATUS[CVE-2025-38008] = "cpe-stable-backport: Backported in 6.12.30"
+
+CVE_STATUS[CVE-2025-38009] = "cpe-stable-backport: Backported in 6.12.30"
+
+CVE_STATUS[CVE-2025-38010] = "cpe-stable-backport: Backported in 6.12.30"
+
+CVE_STATUS[CVE-2025-38011] = "cpe-stable-backport: Backported in 6.12.30"
+
+CVE_STATUS[CVE-2025-38012] = "cpe-stable-backport: Backported in 6.12.30"
+
+CVE_STATUS[CVE-2025-38013] = "cpe-stable-backport: Backported in 6.12.30"
+
+CVE_STATUS[CVE-2025-38014] = "cpe-stable-backport: Backported in 6.12.30"
+
+CVE_STATUS[CVE-2025-38015] = "cpe-stable-backport: Backported in 6.12.30"
+
+CVE_STATUS[CVE-2025-38016] = "cpe-stable-backport: Backported in 6.12.30"
+
+CVE_STATUS[CVE-2025-38017] = "fixed-version: only affects 6.14.4 onwards"
+
+CVE_STATUS[CVE-2025-38018] = "cpe-stable-backport: Backported in 6.12.30"
+
+CVE_STATUS[CVE-2025-38019] = "cpe-stable-backport: Backported in 6.12.30"
+
+CVE_STATUS[CVE-2025-38020] = "cpe-stable-backport: Backported in 6.12.30"
+
+CVE_STATUS[CVE-2025-38021] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38022] = "cpe-stable-backport: Backported in 6.12.30"
+
+CVE_STATUS[CVE-2025-38023] = "cpe-stable-backport: Backported in 6.12.30"
+
+CVE_STATUS[CVE-2025-38024] = "cpe-stable-backport: Backported in 6.12.30"
+
+CVE_STATUS[CVE-2025-38025] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-38027] = "cpe-stable-backport: Backported in 6.12.30"
+
+CVE_STATUS[CVE-2025-38028] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2025-38029 needs backporting (fixed from 6.15)
+
+CVE_STATUS[CVE-2025-38031] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38032] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-38033] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38034] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38035] = "cpe-stable-backport: Backported in 6.12.31"
+
+# CVE-2025-38036 needs backporting (fixed from 6.15)
+
+CVE_STATUS[CVE-2025-38037] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38038] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38039] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38040] = "cpe-stable-backport: Backported in 6.12.31"
+
+# CVE-2025-38041 needs backporting (fixed from 6.15)
+
+# CVE-2025-38042 needs backporting (fixed from 6.15)
+
+CVE_STATUS[CVE-2025-38043] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38044] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38045] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38047] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38048] = "cpe-stable-backport: Backported in 6.12.31"
+
 CVE_STATUS[CVE-2025-38049] = "cpe-stable-backport: Backported in 6.12.23"
 
+CVE_STATUS[CVE-2025-38050] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38051] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38052] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38053] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38054] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38055] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38056] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38057] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38058] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38059] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38060] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38061] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38062] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38063] = "cpe-stable-backport: Backported in 6.12.31"
+
+# CVE-2025-38064 needs backporting (fixed from 6.15)
+
+CVE_STATUS[CVE-2025-38065] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38066] = "cpe-stable-backport: Backported in 6.12.31"
+
+# CVE-2025-38067 needs backporting (fixed from 6.15)
+
+CVE_STATUS[CVE-2025-38068] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38069] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38070] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-38071] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38072] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38073] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38074] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38075] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38076] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-38077] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38078] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38079] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38080] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38081] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38082] = "cpe-stable-backport: Backported in 6.12.32"
+
+CVE_STATUS[CVE-2025-38083] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38084] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38085] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38086] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38087] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38088] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38089] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38090] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38091] = "cpe-stable-backport: Backported in 6.12.32"
+
+CVE_STATUS[CVE-2025-38092] = "cpe-stable-backport: Backported in 6.12.32"
+
+CVE_STATUS[CVE-2025-38093] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38094] = "cpe-stable-backport: Backported in 6.12.30"
+
+CVE_STATUS[CVE-2025-38095] = "cpe-stable-backport: Backported in 6.12.30"
+
+CVE_STATUS[CVE-2025-38096] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38097] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38098] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38099] = "cpe-stable-backport: Backported in 6.12.31"
+
+CVE_STATUS[CVE-2025-38100] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38101] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38102] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38103] = "cpe-stable-backport: Backported in 6.12.34"
+
 # CVE-2025-38104 needs backporting (fixed from 6.15)
 
+# CVE-2025-38105 needs backporting (fixed from 6.16rc1)
+
+CVE_STATUS[CVE-2025-38106] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38107] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38108] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38109] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38110] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38111] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38112] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38113] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38114] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-38115] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38116] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38117] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38118] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38119] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38120] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38121] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38122] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38123] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38124] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38125] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38126] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38127] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38128] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-38129] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38130] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38131] = "cpe-stable-backport: Backported in 6.12.34"
+
+# CVE-2025-38132 needs backporting (fixed from 6.16rc1)
+
+CVE_STATUS[CVE-2025-38133] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38134] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38135] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38136] = "cpe-stable-backport: Backported in 6.12.34"
+
+# CVE-2025-38137 needs backporting (fixed from 6.16rc1)
+
+CVE_STATUS[CVE-2025-38138] = "cpe-stable-backport: Backported in 6.12.34"
+
+# CVE-2025-38139 needs backporting (fixed from 6.16rc1)
+
+# CVE-2025-38140 needs backporting (fixed from 6.16rc1)
+
+CVE_STATUS[CVE-2025-38141] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38142] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38143] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38144] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38145] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38146] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38147] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38148] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38149] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38150] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38151] = "cpe-stable-backport: Backported in 6.12.34"
+
 CVE_STATUS[CVE-2025-38152] = "cpe-stable-backport: Backported in 6.12.23"
 
+CVE_STATUS[CVE-2025-38153] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38154] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38155] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38156] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38157] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38158] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38159] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38160] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38161] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38162] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38163] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38164] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38165] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38166] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38167] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38168] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38169] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38170] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38171] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38172] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38173] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38174] = "cpe-stable-backport: Backported in 6.12.33"
+
+CVE_STATUS[CVE-2025-38175] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38176] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38177] = "cpe-stable-backport: Backported in 6.12.28"
+
+CVE_STATUS[CVE-2025-38178] = "fixed-version: only affects 6.16rc1 onwards"
+
+CVE_STATUS[CVE-2025-38179] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38180] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38181] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38182] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38183] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38184] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38185] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38186] = "cpe-stable-backport: Backported in 6.12.35"
+
+# CVE-2025-38187 needs backporting (fixed from 6.16rc3)
+
+CVE_STATUS[CVE-2025-38188] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38189] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38190] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38191] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38192] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38193] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38194] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38195] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38196] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-38197] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38198] = "cpe-stable-backport: Backported in 6.12.35"
+
+# CVE-2025-38199 needs backporting (fixed from 6.16rc1)
+
+CVE_STATUS[CVE-2025-38200] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38201] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38202] = "cpe-stable-backport: Backported in 6.12.35"
+
+# CVE-2025-38203 needs backporting (fixed from 6.16rc1)
+
+# CVE-2025-38204 needs backporting (fixed from 6.16rc1)
+
+# CVE-2025-38205 needs backporting (fixed from 6.16rc1)
+
+# CVE-2025-38206 needs backporting (fixed from 6.16rc1)
+
+# CVE-2025-38207 needs backporting (fixed from 6.16rc1)
+
+CVE_STATUS[CVE-2025-38208] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38209] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38210] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38211] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38212] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38213] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38214] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38215] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38216] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38217] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38218] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38219] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38220] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38221] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38222] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38223] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38224] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38225] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38226] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38227] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38228] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38229] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38230] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38231] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38232] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38233] = "fixed-version: only affects 6.13 onwards"
+
+# CVE-2025-38234 needs backporting (fixed from 6.16rc1)
+
+CVE_STATUS[CVE-2025-38235] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38236] = "cpe-stable-backport: Backported in 6.12.36"
+
+# CVE-2025-38237 needs backporting (fixed from 6.16rc1)
+
 CVE_STATUS[CVE-2025-38240] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-38479] = "cpe-stable-backport: Backported in 6.12.23"
-- 
2.43.0


