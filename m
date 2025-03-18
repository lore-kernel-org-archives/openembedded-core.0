Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AAFC35FFC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:38:55 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.2934.1742323131206037470
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 11:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WNWY2S3n;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-301918a4e1bso3407173a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323130; x=1742927930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1//C5f+cDIyqp/SSDe+JcoDCw4ACDBF8//yc/IKcaw=;
        b=WNWY2S3nA80vsPH2UPXHENZF8HAc/Zi+W2AU8fD8fsWWpMin0iegWkHSG4bFK9QvH1
         r2mVXuCByVTd6Fy+QEBd4/OYZHitD3rovc6OEC7aB3isaWlxHrrFNGFFwR8tGPzS31CV
         wP58GvGxvE7nQ/yL6ghbLMb2Xst+IE525h4gV0M/KIM748LhCx2hjfIUu56yQCLmIfvX
         wvwx1bPaYt+mH+aEpdhmZrUt49yvORHWbSW7OqjxpCbwyS82IZD2UXAQf1YWDE2QqHpy
         Ll0IJG8ZNZG5nw/qgxi1PHtOaEfkJYWJe1DykJcLMbnTiZXk3S/Mg1YIzwllPWN7Syrw
         d+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323130; x=1742927930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1//C5f+cDIyqp/SSDe+JcoDCw4ACDBF8//yc/IKcaw=;
        b=Z/zcQaXx0N5uDp8Sx4NEov0oMoxn2cYz07Let3BbJ5r5c6A/WRzxrHU4HA3nTIakTx
         bCcqBrpbOtQerpbZFDcm56uhsFByESvhSgXp4/5K28Ma++90Z6jj1VifSc0eljjCAx+t
         TgcALlo4sMTmWY6PSsPhknxTiRv0+z2C0VyJe+9TQQt6tV2r1RVjaC06z+V/Pybs9ApT
         DK+1t7tDn9w6zkGG3M5153IihWlJGoQTQ9AclCG4XSZn5qq/Uarcxv+tjQhQklE078gP
         UqQQrjcN5R/Z4hYWilBjKmY3BhBHiU8Ci6AkrlXiGtnLuYAxN9iGeH53sLSHPlKcU/20
         2vhw==
X-Gm-Message-State: AOJu0YwUedtlSzpLqXmVLapW7wQggrvsjmj9ZZgjQclypG3r7DaswIoQ
	SDqlgZ/V8qoQlSyyMQCifLTWLHH0z5yhX97DT8BqKfGB8ZgyADVdt2klLkeo
X-Gm-Gg: ASbGnctnRj6ihRA1jdfbV944/hej2wlkesMv85LQRYdkfNZHs7ewxmcm/7H319Sp0X3
	xzH7CvOXy5+thghdfX9raQkp6c5MbZbcdY77aVY1DzsiyUvImZHi7rm4Fl+oUIcnLBqHBJOMVcf
	XNbOBMfHR0FECl0fTDH7nY5qXUD1eFELRkNsnfGhNVD4IVAdD1xRr8EkuN8qe/0wdL0vizWRBdA
	rOCuber95JkTqKEhS7CrglSxY01aH69xz7nL+y4fQGxqiIDhq8IAo7+jmtu8rjtleM0GlsIyP87
	yiLeFz9vodjX8O+x19i4aEb1c6A8aP7oM9znP3+17tc6i8M=
X-Google-Smtp-Source: AGHT+IGM6Ws6lWcF91SYOu8nqx8sZ41zbANee+P3DGPwze66IIwPr4Yxl6+Q7iqQyskwZTmUGKfLjg==
X-Received: by 2002:a17:90b:54cf:b0:2fc:ec7c:d371 with SMTP id 98e67ed59e1d1-301a5b006c0mr4424240a91.3.1742323130365;
        Tue, 18 Mar 2025 11:38:50 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8537489a91.28.2025.03.18.11.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:38:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 07/25] readline: Fixed build with GCC-15
Date: Tue, 18 Mar 2025 11:38:22 -0700
Message-ID: <20250318183842.2256284-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318183842.2256284-1-raj.khem@gmail.com>
References: <20250318183842.2256284-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213233

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ages-that-are-not-compatible-with-C2.patch | 29 +++++++++++++++++++
 meta/recipes-core/readline/readline_8.2.13.bb |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/readline/readline/0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch

diff --git a/meta/recipes-core/readline/readline/0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch b/meta/recipes-core/readline/readline/0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch
new file mode 100644
index 00000000000..3bb4d539601
--- /dev/null
+++ b/meta/recipes-core/readline/readline/0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch
@@ -0,0 +1,29 @@
+From 9459ee899a291c55f08341df63e9a1b9b7af200a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 16 Mar 2025 12:48:46 -0700
+Subject: [PATCH] Add fix for packages that are not compatible with C23
+
+Fixes builds with GCC-15
+Sourced from Fedora: https://src.fedoraproject.org/rpms/readline/c/c47eb813afb942128253213ad5b8221770557e48?branch=rawhide
+
+Help getting packages like bluez5 building
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-readline/2025-03/msg00001.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ rlstdc.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rlstdc.h b/rlstdc.h
+index 2aaa30b..a7a0ef3 100644
+--- a/rlstdc.h
++++ b/rlstdc.h
+@@ -44,7 +44,7 @@
+ 
+ /* Moved from config.h.in because readline.h:rl_message depends on these
+    defines. */
+-#if defined (__STDC__) && defined (HAVE_STDARG_H)
++#if defined (__STDC__)
+ #  define PREFER_STDARG
+ #  define USE_VARARGS
+ #else
diff --git a/meta/recipes-core/readline/readline_8.2.13.bb b/meta/recipes-core/readline/readline_8.2.13.bb
index 78b988365a6..19b5cb6f583 100644
--- a/meta/recipes-core/readline/readline_8.2.13.bb
+++ b/meta/recipes-core/readline/readline_8.2.13.bb
@@ -1,5 +1,7 @@
 require readline.inc
 
-SRC_URI += "  file://norpath.patch"
+SRC_URI += "file://norpath.patch \
+            file://0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch \
+            "
 
 SRC_URI[archive.sha256sum] = "0e5be4d2937e8bd9b7cd60d46721ce79f88a33415dd68c2d738fb5924638f656"

