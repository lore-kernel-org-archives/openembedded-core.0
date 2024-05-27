Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2349BC27C43
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 18:12:26 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.3776.1716833544254617688
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 11:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SQnS8EgY;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57863e2846aso2617962a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 11:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716833543; x=1717438343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLRS8bniCNdJ3Kgb8YMilt6rqC3a06pz1djN5eW8dBI=;
        b=SQnS8EgYf04Y/t326BSMrTJDGOB/PbLnW47kxqJM7s23nzQ8A6BGkZ4LtGVACwD3Kk
         JquQnp97c2yRKFB9yepTunUGUSxgOR4M/TMijHO/O6f8nc+XizPkzA2pVOiV3qwEHk3G
         qtZbbjna6LdAr0sMK9rBCdZ2vduVyV6ljymNallbVqLWT0g7y3C1havfZnhg+LKFgeY3
         w3Wqwf71Ru45Q9Klk/PbbesZ17pd19dScQG0keCJbXzbJWMAvxQ8NW8I1CosmazdpmQF
         TxYQNTNmhYr0NYKuyDkhGuu/ebiNOLcrNJV70TmTVYeNk475bMddvFMawgcbnTo30a1X
         l5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716833543; x=1717438343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLRS8bniCNdJ3Kgb8YMilt6rqC3a06pz1djN5eW8dBI=;
        b=J60eHPAxApOmrfdwed7bRfx7/PXbFhYRAfiVi7a3aDQJI5e0LB8SI95AsOBQ1blg4d
         cI5jCaUKZOF1hAGZLRBwzV1p9zh/w9Z3QDks+3TROYhHv8PrzIOV7jdcrgNwC9Rm3Cnd
         NPzgoRFxR6wPaIdWotBRLGCvnbJcxGulrjOJJqIYM3Nq6pIV6bg2hLUUe4awuw+LIGC5
         k458yCbEkObXgaDs2BoG2EEgrnldJPEcyHyZILAe/FmMooTGh2UE9NiU3qE2wFPWAaLI
         7XCS5StbWfPyccRtOvBNYO2lmlyFKu1y/ff+Zk2fcoAKAO/pNhxn0e2wuiXL3q0KDkYV
         RrUw==
X-Gm-Message-State: AOJu0YyS3B/t9eYW2hEDRZGmZzcowLLzFD/h0tQ/FX5gmFuwWCYGIij+
	SOj06MDtx0GWxx5M1ptXUk3g6ctdgmhih+uQj/9cqqHFRKsHdQYnGCilnw==
X-Google-Smtp-Source: AGHT+IElaF2a5RojY7Y9gRysda0rAug59oSFAIxVrp3BcimA/zFqJqvCBuvaoC9Z5OXNhNpN/QMP+g==
X-Received: by 2002:a17:906:a1c9:b0:a5a:44e:2b87 with SMTP id a640c23a62f3a-a62645d76e5mr696395366b.21.1716833542677;
        Mon, 27 May 2024 11:12:22 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc50064sm510272466b.107.2024.05.27.11.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 11:12:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/13] libxcb: upgrade 1.16.1 -> 1.17.0
Date: Mon, 27 May 2024 20:12:09 +0200
Message-Id: <20240527181214.1778037-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240527181214.1778037-1-alex.kanavin@gmail.com>
References: <20240527181214.1778037-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 18:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199925

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libxcb/0001-use-_Alignof-to-avoid-UB-in-ALIGNOF.patch  | 7 ++-----
 .../xorg-lib/{libxcb_1.16.1.bb => libxcb_1.17.0.bb}        | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxcb_1.16.1.bb => libxcb_1.17.0.bb} (93%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcb/0001-use-_Alignof-to-avoid-UB-in-ALIGNOF.patch b/meta/recipes-graphics/xorg-lib/libxcb/0001-use-_Alignof-to-avoid-UB-in-ALIGNOF.patch
index 5b159d646d2..604e987551c 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb/0001-use-_Alignof-to-avoid-UB-in-ALIGNOF.patch
+++ b/meta/recipes-graphics/xorg-lib/libxcb/0001-use-_Alignof-to-avoid-UB-in-ALIGNOF.patch
@@ -1,4 +1,4 @@
-From d55b6b1fa87700f3eae3a29522972d2e7be7d53e Mon Sep 17 00:00:00 2001
+From b529f25a3dcd1547f49d341a0a34fbc1379ed58d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 14 Jan 2023 10:11:35 -0800
 Subject: [PATCH] use _Alignof to avoid UB in ALIGNOF
@@ -20,7 +20,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/src/c_client.py b/src/c_client.py
-index fd256f0..4e48f13 100644
+index b7db543..ec81758 100644
 --- a/src/c_client.py
 +++ b/src/c_client.py
 @@ -288,7 +288,6 @@ def c_open(self):
@@ -40,6 +40,3 @@ index fd256f0..4e48f13 100644
               % (space,
                   'char'
                    if field.c_field_type == 'void' or field.type.is_switch
--- 
-2.39.0
-
diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb
similarity index 93%
rename from meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb
rename to meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb
index de3290aa9fb..fcd8aad3036 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
 SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.xz \
            file://0001-use-_Alignof-to-avoid-UB-in-ALIGNOF.patch"
 
-SRC_URI[sha256sum] = "f24d187154c8e027b358fc7cb6588e35e33e6a92f11c668fe77396a7ae66e311"
+SRC_URI[sha256sum] = "599ebf9996710fea71622e6e184f3a8ad5b43d0e5fa8c4e407123c88a59a6d55"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.39.2


