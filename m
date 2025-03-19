Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8900C36009
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:28 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.2939.1742372180502163559
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WLuORZO8;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-225fbdfc17dso62538465ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372180; x=1742976980; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1//C5f+cDIyqp/SSDe+JcoDCw4ACDBF8//yc/IKcaw=;
        b=WLuORZO86OtlyeFDS8iVpBte6Yzop8Ok5CwWjKBFI1BguRk64sAZgwvNCatou/Hs89
         fLi+mbgQqEPlvzV3ZLwj9ulJhIdswp4BrvBK0MnI0C/5aI7ziC32M0MX3xINSxQgmlxC
         dr36/7JiQRw+j6IudSh2IG2VyRalw+wx+sBrzOKHA/kqPkVh7bxJCkP/4uIEPORVDdbx
         LcIvhY+pkwKEu2GYGGiGD3eztB56QIb0uM9VdFufNIFeNjh/yLGT1zSWJQc9JJ2zt5x9
         VMUrqjmdIpiTASDnHYYAfGOCFIbbHR6jGAOOcYjLHGTnmQz/4SNbSI1JbQvVBZ2i9Ouo
         /TbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372180; x=1742976980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1//C5f+cDIyqp/SSDe+JcoDCw4ACDBF8//yc/IKcaw=;
        b=AhZs2CSoHCYxGzU6mICI3TTEApmVG1DbaPuc+O0b/3ttduvM4axatn3bgLcn9d6TXp
         EV0uROnK0Duw4SJqVuDgyteaGXtpU6vQjDCeRHr+h4qtVhecjUu7J8ITy16dzdHKY7Xr
         79AerVqfqxknj9N+PDbEfI0M9upnnMoA74Sw80Q+fGcbzRHEx8qkJ8Sk0jr7C0E0KAap
         n/5nD+sfy3YGcy1j2z9llkZOj4I9PKCpj4hjXoaAju7xQdlN0sMgqRGizOXuyTLp7v7k
         p1cbSnfSkSRXgkPKrO3B3RYibxdwrI1o/ylVBeg1Ql4SwojGnPc7168ZlATNFUvy253h
         w3WQ==
X-Gm-Message-State: AOJu0YyUkJg2NxohkqSbSt6R50XnHHZiElDwWkS55sfZLbpJW4jVtH8n
	NEu5NHoxZdpEWMaBkL16+NFvvlYmDY1PnfYzBsnc405G3AxyZDRgwj42VAI6
X-Gm-Gg: ASbGncuF4nzX5XSFPl3l96g6p5gdBWHNCyATQSWlCU6V35IzWOrEOF+U9YwaHFDv4Vq
	Vn+oOE0kFiMuaeNHl0eKTTW5oMqjSdcM/GPbnW5v7j0dvo0Tk5JuP3uCCMIdBS6cRdJNCmKusW/
	dv6grPOAsJKnT2z8PQmc65piHN5l8ZkVZKYx3KIl1czNWODgaRk/Qj2SKJ6Hoow6IzccxAATwak
	TFYhN3qND4vka7kU3T62XETQH8f0N19TogYC2iPk64NhUYJZLLpPRyosilaqQsLx1tcQ4Gu1F4a
	OElcK312PO/bG6uXQk9YPIrPSUlwqRyFg1gt
X-Google-Smtp-Source: AGHT+IHjlIlKaGPoxcRIfFZdqA6NkvlU8k7AVaDA37J6C7Rc5bMy1KDJEGPUaxjhBhhYNbIZUhnLvQ==
X-Received: by 2002:a05:6a20:4388:b0:1f3:26e5:55bc with SMTP id adf61e73a8af0-1fbed5fe419mr3059608637.42.1742372179668;
        Wed, 19 Mar 2025 01:16:19 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 07/27] readline: Fixed build with GCC-15
Date: Wed, 19 Mar 2025 01:15:35 -0700
Message-ID: <20250319081610.3536475-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213273

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

