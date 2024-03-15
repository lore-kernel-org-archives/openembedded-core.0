Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2532C54E6E
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 00:21:26 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.8847.1710462078265071902
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 17:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=me2OIQ/c;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-413fea12b50so4040835e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 17:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1710462076; x=1711066876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKaDkxtR9cOYPzsas+it4ICxNHE30PaV9zqWZnXRc5w=;
        b=me2OIQ/cT4ilFgXfRvDTrMjIh+D37u/qT4PfJV8o2ljDG+A9npdwExi6zZNjCHlt8d
         Vi8Rb8jxXX5DNMMWUNQQ6r0HqN71JomYTMFxkZJ9xRhoQvJX6BofEpJ+rDieEKYFNMOi
         O2y2XmB3VAO/JMYbYNbdXtZr2WlCEM0Lzw4/LYyUHgrl2gUw2WbYrSo/OHp7C1OB8HJe
         RSLnS2okxdB9RHbYvpTG2xb9qWOz5M2aMVkqOiJmwPKVlL7FMyrtSinSPzY2n+E7jhhp
         yRqy+raWVMFgvJoEcuNLltyjURs9iU9mnde8SqLw1e3BRPV64vGoCTqmlGOZ0wMyvX8q
         LShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710462076; x=1711066876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKaDkxtR9cOYPzsas+it4ICxNHE30PaV9zqWZnXRc5w=;
        b=v45ysxYtJdTAm1ZGlbVhvEOaFMfZsd21ByyMnN4vfWdiFoB9Vbp1kSH1chM3+1v7+Z
         e7VbctG2GkN0l7R/VwdPoIzfDmF/Vi7brQC9chGUGoe6xZCwJpEX+rxVgLKOseSaenQ4
         9qdRjm1ia1zqmTASOnjZo7yxO12Nv1+U0kudHPyUNLD1QVxKnJai/1nnwlsYV7qIcgqe
         Zkjd9EAINxW3ONubd65oFf+WQKPmNRXaE2LDfyam2EPEWdpSfLTnYOBppmlFnDQGWMns
         nAh0JhLInjJvRbDbt4ZPxoUsOgB3BDocHUvK9asTraepIJpR88zng8EI8g8qJSUyZN6L
         4Bzw==
X-Gm-Message-State: AOJu0Yytg6PUnVnTxwL9yPv45dDJcVRyXNI6qw7stKeUpyo4CbiQNlId
	2ctaY5lT9nuazSSRNNBe3lIHQjUBY0lgkCJMl5vFbUslmtVHscZgn6iJV0evn0ioel05Z4ou7Ij
	zDog=
X-Google-Smtp-Source: AGHT+IENqpNZdCgjxApAvVkwa8KjqVm80Il22HsB0X/n3C9bmLkAWl21/zQMWD94S2q3G2EQ0i3ISA==
X-Received: by 2002:a05:600c:a50:b0:413:3160:841d with SMTP id c16-20020a05600c0a5000b004133160841dmr1371980wmq.8.1710462075768;
        Thu, 14 Mar 2024 17:21:15 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id bs17-20020a056000071100b0033d9f0dcb35sm1868053wrb.87.2024.03.14.17.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 17:21:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 1/4] cve-update-nvd2-native: Remove duplicated CVE_CHECK_DB_FILE definition
Date: Fri, 15 Mar 2024 01:20:17 +0100
Message-Id: <20240315002020.2194310-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240315002020.2194310-1-yoann.congal@smile.fr>
References: <20240315002020.2194310-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 00:21:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197118

CVE_CHECK_DB_FILE is already defined in cve-check.bbclass which is
always inherited in cve-update-nvd2-native (There is a check line 40).

Remove it to avoid confusion. Otherwise, this should not change
anything.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index d565887498..8bdb4a4b46 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -37,8 +37,6 @@ CVE_DB_UPDATE_ATTEMPTS ?= "5"
 
 CVE_DB_TEMP_FILE ?= "${CVE_CHECK_DB_DIR}/temp_nvdcve_2.db"
 
-CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2.db"
-
 python () {
     if not bb.data.inherits_class("cve-check", d):
         raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not loaded.")
-- 
2.39.2


