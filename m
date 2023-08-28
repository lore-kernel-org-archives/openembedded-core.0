Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1017FC83F12
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 12:03:59 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.11687.1693224229403010338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 05:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=mfD+0fME;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2bcb50e194dso47462251fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 05:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693224227; x=1693829027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WD0cWa2ywPWath2EwCF0cyCk7dw5tIsnrUvYN9P+Z0g=;
        b=mfD+0fMEUUN5ErfsUJW1M52jRbhL1iiXlkcjhiPE4aU1PcKe/xkDiiGbaSrtkhLeQL
         M+S6BiGNh3prvE5nA1GSRdRLs9UcR7keEFUbhmtW3gce6pKswuAjdqNNP63iJeVRaeN3
         w3GXikN8vXxE7i9xlxHPeCPntJOniIOcBQVyV2J17+XKQtRBYKqmH6lFPWHSVIfROkAf
         l76CoPD9aD7mR3uDKg2PrEHKMPGr1rybxqarUFcCGvEof1hX6QUoPd+NDsYrWTCQ6gas
         UUb+aL7FjA6H+skEco1lnUwtbB/mlmGO0TwfXXw94nGydHJMKr51V/P42SfDIFiIaKf7
         S8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693224227; x=1693829027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WD0cWa2ywPWath2EwCF0cyCk7dw5tIsnrUvYN9P+Z0g=;
        b=AoRNnRPkXJ1O+P5W64jBNNw/dDBJhQc1CtgH1qas4PBK7ztT4HH5C5E4pkPbpjMBKZ
         0FUQjMptq2B/OL3imYfw8g8C2ixiyuaaiv7SmTIeCs73sJnhBiGNxCpnPUYk2EFisHR9
         spWAg9hB5JOQGfvkxafztSBWZ+gxTQlov9TK1DZaGLudcxm9t9c4qilMIugqo47UYVTJ
         /rXi5PwYh+4hW6kNG2DzHW6x01lYMVzHhv438Qrsc3neLVbtQc81dMZulXdgRVsGCDNr
         KFbvsY29f/xxTHam1XjGywUQU32w2JVfAdF2ivXjrKi9tDZZRHyLTlJbBL8xAKlQaNuS
         06eg==
X-Gm-Message-State: AOJu0YwL04DYLy04KjxKWJ/e2L6YFHI4ye8Oc+iZF2Q9Aty6mELUi0bQ
	lkPbX6dgnZz/QrvCdwPIFx4eLiWFg1w=
X-Google-Smtp-Source: AGHT+IF9pDovigV7HmzvDjk/RBtoJvoUwrbSpuljOus21UuVQaHeMiW6IHYh2zHdmv/sGCULgb3BgA==
X-Received: by 2002:a05:651c:32a:b0:2bd:ddf:8aa9 with SMTP id b10-20020a05651c032a00b002bd0ddf8aa9mr1808883ljp.24.1693224227307;
        Mon, 28 Aug 2023 05:03:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id pg23-20020a170907205700b0098e34446464sm4629179ejb.25.2023.08.28.05.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 05:03:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: luca.boccassi@microsoft.com,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] systemd-bootchart: musl fixes have been rejected upstream
Date: Mon, 28 Aug 2023 14:03:40 +0200
Message-Id: <20230828120340.2641669-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 12:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186822

Systemd upstream has reiterated that the only supported libc
implementation is glibc.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch | 2 +-
 .../systemd-bootchart/0002-musl-does-not-provide-printf-h.patch | 2 +-
 .../0003-musl-does-not-provide-canonicalize_file_name.patch     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
index 12eecc989be..812900051aa 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
@@ -12,7 +12,7 @@ systemd/0013-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
 Based on work by: Khem Raj <raj.khem@gmail.com>
 
 Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
-Upstream-Status: Submitted [https://github.com/systemd/systemd-bootchart/pull/47]
+Upstream-Status: Denied [https://github.com/systemd/systemd-bootchart/pull/47]
 ---
 
  src/util.h | 2 +-
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0002-musl-does-not-provide-printf-h.patch b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0002-musl-does-not-provide-printf-h.patch
index 8be3bed3955..2fac76a5494 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0002-musl-does-not-provide-printf-h.patch
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0002-musl-does-not-provide-printf-h.patch
@@ -10,7 +10,7 @@ Original patch author: Emil Renner Berthing <systemd@esmil.dk>
 Includes work by: Khem Raj <raj.khem@gmail.com>
 
 Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
-Upstream-Status: Submitted [https://github.com/systemd/systemd-bootchart/pull/47]
+Upstream-Status: Denied [https://github.com/systemd/systemd-bootchart/pull/47]
 ---
 
  Makefile.am               |   4 +
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0003-musl-does-not-provide-canonicalize_file_name.patch b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0003-musl-does-not-provide-canonicalize_file_name.patch
index c2c276e4588..fbe9c93d2d8 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0003-musl-does-not-provide-canonicalize_file_name.patch
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0003-musl-does-not-provide-canonicalize_file_name.patch
@@ -9,7 +9,7 @@ systemd/0007-check-for-missing-canonicalize_file_name.patch
 Based on work by: Khem Raj <raj.khem@gmail.com>
 
 Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
-Upstream-Status: Submitted [https://github.com/systemd/systemd-bootchart/pull/47]
+Upstream-Status: Denied [https://github.com/systemd/systemd-bootchart/pull/47]
 ---
 
  src/path-util.c | 2 +-
-- 
2.30.2


