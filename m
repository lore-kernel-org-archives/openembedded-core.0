Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1FAC001DE
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:54 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.7363.1686734989282636154
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=S4w8so8N;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-977e7d6945aso88221066b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734988; x=1689326988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdwiF1CG6F1bnMTkgr4D4fQgOAlvrRhmZq0zvQXYV7c=;
        b=S4w8so8NgnbE0erSQlB10aTllvby1cfICjFlZqB5+j7lIHZ2JA89lrlgla31cfC3It
         dHChuHvslQHX1jYbKRisaDag41KRWZ2zjY6+Jv7A2FyrLMcXI6Y52acUlVEGpNCqEVNm
         Sj3QeFub6vITQaRaosiS9TqtoKcUJEeU0rdp/Ubgp/ajeADctIJpA/hMVN73lVqgaFBA
         mbbgyB8GiGZuybE7UYKZr9e4mEKUDFHS8R55fuxiM+JlTnjfsWXY/X+SaKr7wImmGk4/
         WjeCSnFFmVUXVj97vudPwrcwUICt9LMS4prZWI3VWm0aOpoSR0Pu9n4NS0oEEnEtTv+g
         vNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734988; x=1689326988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XdwiF1CG6F1bnMTkgr4D4fQgOAlvrRhmZq0zvQXYV7c=;
        b=LpARscFTBRkcO7701ISLA9vTF5GoP4AgA0UnDPI/el41Yg3wEO0/LjTJzF0uEJhpGd
         9K62TcXGkMDcRx4nbl+9oltGE1XfS+rNDQQQCPk0rJWtreSfAaSUGGSF/RzT9eSbNlwi
         nEdn6VxtH5wARiFLyJ1YuAitJVceOZhpp2+y081v0szmf+6346PkL4chwKdN5CQjQGC9
         poL6LVsDKid5bLc9Unb4fUwQ/KW8LouDDRUeOgKtE+FoHB7ZSXXYvhGZpzjDzrk0r19N
         lzAcm6ytG8Skt8gsOEQcdoe2Xygn9vthRMoXczH1dZuzDbVy7AtwxVezAKkEICtQw52l
         hS6A==
X-Gm-Message-State: AC+VfDyBCAhG40Z3gBt1bbzKHpuED9Kwujoo3/YGmJeFjdD18UBgIg2v
	X9Dn8VlMQIOmWwYMdFJwk6zblvT33DE=
X-Google-Smtp-Source: ACHHUZ6vVDhDCSacTW8xTfAdGHYHcTX3aa9GOn8lK2HFe0XTQWI1+5I4j1ZOCki7RBRJSxA2A/4vBg==
X-Received: by 2002:a17:907:6d9e:b0:97e:a917:e6a5 with SMTP id sb30-20020a1709076d9e00b0097ea917e6a5mr12763297ejc.19.1686734987747;
        Wed, 14 Jun 2023 02:29:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 37/55] python3: upgrade 3.11.2 -> 3.11.3
Date: Wed, 14 Jun 2023 11:29:00 +0200
Message-Id: <20230614092918.4065570-37-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182782

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Don-t-search-system-for-headers-libraries.patch        | 2 +-
 ...1-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch | 2 +-
 .../python3/12-distutils-prefix-is-inside-staging-area.patch    | 2 +-
 .../python/{python3_3.11.2.bb => python3_3.11.3.bb}             | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.11.2.bb => python3_3.11.3.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
index 96e5e813424..c9253832cfb 100644
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
@@ -1,4 +1,4 @@
-From 7d296dc635ad3ac2792955ce37e140a4104b098f Mon Sep 17 00:00:00 2001
+From 6cb667f37beacd832cb409e5244b3c90dfad32f7 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 4 Mar 2020 00:06:42 +0000
 Subject: [PATCH] Don't search system for headers/libraries
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index 86971f40482..d5b7ce2b95b 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From cab8b8b1390165a93dfb27c48c1cc4c3e4280dfd Mon Sep 17 00:00:00 2001
+From 4ed481f4928c361970e78f27c4d9be8700af176b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 10 Sep 2021 12:28:31 +0200
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index e080b5c5629..5ee4e4f126f 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,4 +1,4 @@
-From 79e7ed59750612e57647847957ab85709307ea38 Mon Sep 17 00:00:00 2001
+From 4c39252c71d8bca81fdc43753c83a59f8668c619 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH] python3: Add target and native recipes
diff --git a/meta/recipes-devtools/python/python3_3.11.2.bb b/meta/recipes-devtools/python/python3_3.11.3.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.11.2.bb
rename to meta/recipes-devtools/python/python3_3.11.3.bb
index 421a305e22f..c7974849b60 100644
--- a/meta/recipes-devtools/python/python3_3.11.2.bb
+++ b/meta/recipes-devtools/python/python3_3.11.3.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "29e4b8f5f1658542a8c13e2dd277358c9c48f2b2f7318652ef1675e402b9d2af"
+SRC_URI[sha256sum] = "8a5db99c961a7ecf27c75956189c9602c968751f11dbeae2b900dbff1c085b5e"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.30.2


