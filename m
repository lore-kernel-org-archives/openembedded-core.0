Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E834AC52D6F
	for <webhook@archiver.kernel.org>; Sat, 24 Aug 2024 22:54:08 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.22516.1724540039577739394
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Aug 2024 15:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aiVhvqFp;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2d1daa2577bso2391093a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Aug 2024 15:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724540039; x=1725144839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GixtJ+D2EFW3Y8ickQ9JfOlcgMyM0UMehtAyGzWHOwo=;
        b=aiVhvqFpABnbk1l4hoyt4ZVuqTzmFM+OkgI03idT1KyBLNezEoToI1NdswK4I7WyRL
         CpaFZCTMvlASZ7arTDMuxYyc9r3BvzU2pt3mQTuqqeFmOzWy+HymoC6JyTuu7+7QBfeY
         yZetl+zEVFkwdopX9WcUKHz362n/fIX6DVpPB3pe41uRq292YV4MN+iyLwZDlbsKeroB
         On8Mkl1pWcCbZlcgHwWRNi0WMoAC0bAsZziop9HWpI0F1TiH7zeSyt9zDTOGVXrCYKtk
         FRlPnDQOeLPioLwW1EnJKkXKIDaGacmOrv2o8zNeNBv06fQRQCoqEsmMw2IgzWNhDBQO
         I71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724540039; x=1725144839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GixtJ+D2EFW3Y8ickQ9JfOlcgMyM0UMehtAyGzWHOwo=;
        b=cCFeLdj6YBQE9Hc47DzA6YuL3Shc7Q7Kjenli/WWzg9KdJqhpAVqMLsImQ2IQZjfIv
         inaU41eOwu82Z+O6gmK4dMMifbXsQPTDQXiuYKk22bQltISv1dI0e9Bf5f48P+YFqf4D
         KyrmjExNY9oykzJnAxVSdfZedpZqqaTmfV319uh+HKtaCmO5xXPmDqe1OcIoQhuMgT2V
         wXV/FhQxi9SWxhk5crL0j7mXrPTsrTsznEsi9IT/+DIJw4t0AP5Dw9cytNaR6OiYFv0J
         bbUdM2Jn0xb2p/cfn1KUB26eo6f+Wj4wFbTx32dRffJ+FniauRmk9FR321luktxau3Ui
         zznA==
X-Gm-Message-State: AOJu0Yzks4LB/IjuMNpOdPbUcJp7tSCm1iyQPdLItUfnTjTkZiAlYWss
	Aus2OZT2hWcdZP5O2MnLH0JN9vlja5we3TCpHE769mWG7mxLNf/AulO2JQ==
X-Google-Smtp-Source: AGHT+IFqn0knrCJbfyMo2tNIu/DpxVxqeReM6U+ZzTpsGVisCCgHGZUTS9lGDijZDex5sH/qAZT2mA==
X-Received: by 2002:a17:90b:390e:b0:2ca:5ec8:576c with SMTP id 98e67ed59e1d1-2d646bcd7c5mr6518252a91.5.1724540038703;
        Sat, 24 Aug 2024 15:53:58 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::77e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d6124a9a16sm6650066a91.0.2024.08.24.15.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 15:53:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemd: Refresh patch to remove patch-fuzz
Date: Sat, 24 Aug 2024 15:53:55 -0700
Message-ID: <20240824225355.2075245-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Aug 2024 22:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203715

Fixes
ERROR: systemd-1_256.5-r0 do_patch: QA Issue: Fuzz detected:

Applying patch 0017-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
patching file src/basic/missing_syscall.h
Hunk #1 succeeded at 20 with fuzz 1.

The issue surfaces when building with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...sing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0017-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/systemd/0017-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
index 04b2fb712f6..a7a641e0ad5 100644
--- a/meta/recipes-core/systemd/systemd/0017-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0017-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
@@ -15,8 +15,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/shared/base-filesystem.c | 1 +
  2 files changed, 7 insertions(+)
 
-diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
-index 86280771c4..20d05db506 100644
 --- a/src/basic/missing_syscall.h
 +++ b/src/basic/missing_syscall.h
 @@ -20,6 +20,12 @@
@@ -31,9 +29,7 @@ index 86280771c4..20d05db506 100644
 +
  #include "macro.h"
  #include "missing_keyctl.h"
- #include "missing_stat.h"
-diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
-index 67aa8ea1f2..8d9824495e 100644
+ #include "missing_sched.h"
 --- a/src/shared/base-filesystem.c
 +++ b/src/shared/base-filesystem.c
 @@ -20,6 +20,7 @@
@@ -44,6 +40,3 @@ index 67aa8ea1f2..8d9824495e 100644
  
  typedef struct BaseFilesystem {
          const char *dir;      /* directory or symlink to create */
--- 
-2.45.1
-

