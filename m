Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BA8D58075
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:43 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.17213.1732536101601693086
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MlbvMUYS;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-431695fa98bso37188395e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536100; x=1733140900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5K0VT/UTzDVRhQC781xudYEtwnUVX6KVS4oljI5IVcM=;
        b=MlbvMUYS0HjyZzyaSMsZl92mloRnp5Zh6cmMT5SGhqgQOI31p2fM96fcdT+r3PrJzL
         eVVZL0XA8127zfJ9tZzDqYqiz1un/XiZl5o3OqZkP0w76SEBYxpEFMGEx9lVQg/w9wBv
         xCYMz2rVP4chBRmjy9aV2mWWJDD440cxDI04oOMvIr50X5tr/8WAG+/834otbAS0F0En
         S6BZ7xFqseKIW2SfPlejOxgGRM3z5JBp/JYhyUrffUA8QgjlU/Uaz6fGc4xb2hXtRttk
         V9YKVkejkPyMDuNFJTfAXnxwzUFnG6W5+hQHj3TwM66ouvDcD23kFkJNqB6Gv7t+xOND
         wlAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536100; x=1733140900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5K0VT/UTzDVRhQC781xudYEtwnUVX6KVS4oljI5IVcM=;
        b=ACM+aVwr0H5xTIjs84wwOxV4KdfKHfGgXTfwOq2/kdEwh6tLPpy7Sh1CfovYCzGqau
         LU68q+07yFpfpwL3+oZUrIy6IG7nT5xeBzrmbD/scsODiqt3ngCDmBLFAegJclnccrPK
         QXkdMdaIGGWrLzW0ajAvtJUIlHPOPU+35y/JxdBdOhRzAqEvsggGwPs1fiH8sMrG5P8L
         kZrnA9+Ux1VaI0OGIdUdrV+DAYeTLP+Ww9bE/nE+5Qq7R5Sgc0UlCH14dUMqMHQfteMd
         rHBy5CmMqZcB5wXjiSXVKhrCAcAGfdYACmkCBisDHG5Uz18oTmm7/66x4kRyAjFkVfJn
         5d3w==
X-Gm-Message-State: AOJu0YxsQ5z213oGtIQ2Vd5WiRM26A0ri1nf4eHqc7kqA+IfAwhyNzzm
	KYF77T7b/9thQWRM31bIoxEZZubwGcizgiOZUh5fGAO7wNxRIc9n8QDJ8A==
X-Gm-Gg: ASbGncveMQDRBPweTDUGdLGN3LjwWJwNNN6ggIvl17+sezJ/OSLQstHWi44VpcPOSiL
	KaF5TYCzvL7zN15jF+muUWUcP37ZwPdNNOC4uhXG1wXayAczDFH2kE0SkCVqhxiuhE/lTE9iC9H
	ZBIGgTIut+RUMAh3Nxl8gA/fJlTYUP2FBCuXDH9VQhL05v6AGcjCMEczaL7VgaHAi8IdjRBOp1F
	7ZvZQmqT+IIuYSrRjY1FrhrfvbZTamTrKx21ui0GA+J3dHgsyyArvYnRbXDagHpOxoJwxl3UeCi
	KRpFslM3XJU=
X-Google-Smtp-Source: AGHT+IGvlvSyxjujeylFZ/OM+RFODbAL+FtVOl6HOy6t4xL10/A5mcwInPZIk/ZxXEHuMYxF29G+ww==
X-Received: by 2002:a05:600c:154f:b0:42f:80f4:ab31 with SMTP id 5b1f17b1804b1-433ce43561dmr112775735e9.18.1732536098305;
        Mon, 25 Nov 2024 04:01:38 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/35] libsolv: upgrade 0.7.30 -> 0.7.31
Date: Mon, 25 Nov 2024 13:01:04 +0100
Message-Id: <20241125120127.2205232-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207759

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch | 2 +-
 .../libsolv/{libsolv_0.7.30.bb => libsolv_0.7.31.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.30.bb => libsolv_0.7.31.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch b/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
index da93a12ed54..d6e983dec8a 100644
--- a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
+++ b/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
@@ -1,4 +1,4 @@
-From e1db3c41fa84391b7ab299f7351f58b413ed2994 Mon Sep 17 00:00:00 2001
+From da99bf09e83469612e2c821696025a4e591bb95c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 28 Oct 2021 22:28:45 -0700
 Subject: [PATCH] utils: Conside musl when wrapping qsort_r
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.30.bb b/meta/recipes-extended/libsolv/libsolv_0.7.31.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.30.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.31.bb
index 20d1baaaaf0..b395ff972dd 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.30.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.31.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "27aa6a72c7db73d78aa711ae412231768e77c9e0"
+SRCREV = "95aef5cc57d0f51782e55b6903b30ec93afbfa15"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.39.5


