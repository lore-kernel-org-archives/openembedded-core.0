Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4AAC54F30
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 14:57:55 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web10.8749.1748098667590100436
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 May 2025 07:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JE+NNcpl;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-7398d65476eso587134b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 07:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748098667; x=1748703467; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hnh0kTe451jqr6NnrrXEE8crqrjrUy5zMVE2omiqAns=;
        b=JE+NNcplbbFq3bFlgSIAUxwGz8EWjxAwOr4TpThHjIy0ZFS/phJr/mSNpGCovJeGyl
         33SOgCbVWuwGr43+dE6R29KzlZLlSLEbIe0R63F0uuQ4SUdnb9sRMFVpiOkTOcQzovy7
         Eozo6TQp6S2v0jTz1vP4HBmkaqIvE8qr0pr2FWzOpNOD8vb32Ei9wFvirwWSYA3M1Oog
         QjGsgXKLUh20E8N4wIyAmaSKVgwcStBFCQvO/1Hbqz7tMSGbUWHKk1KSQtu/u+dx/J+t
         /YFRPCy9+zQ5O8NARER6icTVF0DjtTLurCwLcHgeJBUiEElI/mAKLhYdQRAlQA1lW/J8
         p5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748098667; x=1748703467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hnh0kTe451jqr6NnrrXEE8crqrjrUy5zMVE2omiqAns=;
        b=Lb9B8DaU3Jk/5SV4daZWPgIpRqUkchKKs5NbvBzNAryvO1cKgqf85dMKq3XpOStHt9
         +xqd7RAHsUtRb348n3ZxyOv43WM6di747M09vZVKt4Hw0uzBViN8jHojnYNYIP/ILvk8
         WzAOoZLBdzVhgTkX9WTWFMGF/KNtic7YYGOjEbQV5xhdS4CR/N8g/IBK4PxCpnm2pgdK
         WjZZeSv1qKLUg4jv8BoUTUpm6aOMiofpjDpq99PLarqxXseTUulO2n2VI+hE8Q6M9r9v
         YMyZj1Dx+1M1JwkmvzFsaG/NU8aHzPFV4raAzwzPimNDB9Ia0MyGRxGnXkB9vez9vOTu
         GFdg==
X-Gm-Message-State: AOJu0YxM6e27rPc4Uym3DYwfrvEM3d8ipNK6Ir0MfB8rZlWZMzvKooQM
	yGvqpfu8rx8CTjc1tYP+l59DYL5bn4gZyzBqlpVurFmyQ8IUSV3h3trQsoesZNwbOHw=
X-Gm-Gg: ASbGnct4RjI5af+vcgwvDXxpW8U8QKMfYoU4h0B+gNEDYh8Ce2wV6NnO1fPEdTAnkOn
	Q3djalcV6E6IJIQ0H4gfffTcWYpj9tX0EB0yl7exNfOer4IzZD86W6hw2O047ztFhSCWLH4Kl24
	sjdb+MMhRrhLa/QtH/ii2MozbNr/NTmluCH+Yl4e+3iF0dSw46OBhVl4e6S7kyiQYbhlSdDRxfB
	G7wgrxwy9ih1lvXxgN8DNBtgEskHijAzLjNA99kG+jRPqy5fdZVpRJrUw/C4raIN3s7+t54gi8D
	xCEglwOiRRqmmI+beNU/ApVGB9WyxjzsA14VOSoSQAo=
X-Google-Smtp-Source: AGHT+IGujncI1y2Z/qAd+/6F77/Wj6v0FXCFHT1CxEjteT2uXzsqbv4Yu5nmVfTKDAelXBYTh10uzQ==
X-Received: by 2002:a05:6a20:7d8a:b0:1fe:8f7c:c8e with SMTP id adf61e73a8af0-2188b6edc73mr4745552637.15.1748098666565;
        Sat, 24 May 2025 07:57:46 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5f56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96e24d4sm14385437b3a.7.2025.05.24.07.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 07:57:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] busybox: Do not define global 'const' with clang
Date: Sat, 24 May 2025 07:57:43 -0700
Message-ID: <20250524145743.1162258-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 14:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217238

This helps fix segfaults when compiling with clang, the option to
define global const is configurable now in busybox [1] [2]

Turn ptr_to_globals and bb_errno to be non const

writing to a const variable is undefined behavior

This is undefined as per (C99 6.7.3 paragraph 5) see [1]
errno and ptr_to_globals is written to in code, this fails with
segfaults when compiled with clang

[1] https://git.busybox.net/busybox/commit/?id=1f925038a
[2] https://lists.busybox.net/pipermail/busybox/2022-January/089413.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 638b40c758f..4ebaeb92c97 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -16,6 +16,7 @@ SECTION = "base"
 # Whether to split the suid apps into a seperate binary
 BUSYBOX_SPLIT_SUID ?= "1"
 
+CFLAGS:append:toolchain-clang = " -DBB_GLOBAL_CONST=''"
 export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
 

