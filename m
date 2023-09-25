Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7853CE7AB9
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 18:10:26 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.68532.1695665421800370181
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 11:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fzvAcetJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-68bed2c786eso5392049b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 11:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695665421; x=1696270221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xhm2DFIbaQefAHE3S4wprTIHbqnOcevUbfnyh7aynKo=;
        b=fzvAcetJwtwFr0rn+56bTrVHsz+d+RKQQ07m7eGplGIKsG9k1zPH3PJx7BVkE931Tj
         LVlWeEfEYyeU/Xu+dWd7knTDeudUCg6Bd17CC31B01zoH8+hpEMza3KvzHfgHdRFqgFI
         kHAdEq7i6DiVfWnR4PSsM54sbNMubtlnYGO0G3xhbSDoqzlAutSQ2coDGfxR6RyD0YYH
         eKM64TZb8vT98zxqNXsk+YfRV5D7AEnAajHr7uFt5F00XW+lT6mN5G4ki44HKAGGJ/8B
         VBRkOZkQ3PP2l4BmrUjKdx5JYbXzPxg+KLKdiIBDuTES/AipQiiDy1+2dhzoRA4XYZBZ
         ljJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695665421; x=1696270221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhm2DFIbaQefAHE3S4wprTIHbqnOcevUbfnyh7aynKo=;
        b=vOcHE3SKsOeIUOOFvehWv2L2YKU//0Ch/5X6lUt6A8QYjws60tCTtxiT7Wxp5u9DVU
         kI4Cfw+ofSBb0TZMJF2Hke/k6x2fFBXk1EOf/hjHeWQviz+gAc1+rjaYjAJRxFjoOg1u
         4pyYamRHHR5zVn94slQ9vIAAJ+XR4IYEadde5CE7E6Q9HGwseBmctEzFeIjoHhdeoQ3E
         2mAmYuRdSDwG9nMrcHUOh4az9PWxXS4UYDQu68yt07S+pbI0adwVBvjc0ZEyZspVUNKE
         D+n7zzNQwv9EoaNTJmMOwesnBDoyVBQXCaKGUx9PfaRiJ1PeE1vapW4Q7JhoWLcFfzvw
         dkKQ==
X-Gm-Message-State: AOJu0YyvAFu5+c2/BxMqgNn0gxjN4JVlb+sg41+3TeiTZfO8xdNSnpXd
	6F1BNsKxi9Lcv3pv9vDkLS0+07If4xK/Ag==
X-Google-Smtp-Source: AGHT+IEJx3Ks1BwtEIg7lRvPZCfKDzVQuwmme0/wC8mqXdMno6SG1F7cNQGEpqvNEzTilHdYI5MmJw==
X-Received: by 2002:a05:6a00:2401:b0:68f:cc67:e723 with SMTP id z1-20020a056a00240100b0068fcc67e723mr6470926pfh.17.1695665420943;
        Mon, 25 Sep 2023 11:10:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::d373])
        by smtp.gmail.com with ESMTPSA id a22-20020a62e216000000b0068fe3a6c312sm8281402pfi.62.2023.09.25.11.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 11:10:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/2] glib-2.0: Enable possible locales with musl for ptests
Date: Mon, 25 Sep 2023 11:10:17 -0700
Message-ID: <20230925181018.2457010-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 18:10:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188207

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased.

 meta/recipes-core/glib-2.0/glib.inc | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index c314594d493..5183f37a6ef 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -171,6 +171,12 @@ RDEPENDS:${PN}-ptest += "\
             python3-modules \
             ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'python3-dbusmock', '', d)} \
             ${PN}-codegen \
+            locale-base-de-de \
+            locale-base-es-es \
+            locale-base-en-gb \
+            locale-base-en-us \
+            locale-base-fr-fr \
+            locale-base-ru-ru \
            "
 
 RDEPENDS:${PN}-ptest:append:libc-glibc = "\
@@ -185,18 +191,12 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = "\
             glibc-gconv-iso8859-15 \
             glibc-charmap-invariant \
             glibc-localedata-translit-cjk-variants \
-            locale-base-tr-tr \
             locale-base-lt-lt \
             locale-base-ja-jp.euc-jp \
             locale-base-fa-ir \
-            locale-base-ru-ru \
-            locale-base-de-de \
             locale-base-hr-hr \
             locale-base-el-gr \
-            locale-base-fr-fr \
-            locale-base-es-es \
-            locale-base-en-gb \
-            locale-base-en-us \
             locale-base-pl-pl \
             locale-base-pl-pl.iso-8859-2 \
+            locale-base-tr-tr \
            "
-- 
2.42.0


