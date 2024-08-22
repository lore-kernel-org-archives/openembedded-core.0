Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB9E4C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:40 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.9501.1724319330544506467
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WlDiQY/d;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5bef4d9e7f8so916895a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319329; x=1724924129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TC8E1V/L/z6kgicdUFBRHIZATSDxO9ps3NP3NlwSKk=;
        b=WlDiQY/d0g9tZSDXd68cvFvngGIMqXTMbPssg077xc5/sE31mW7ejGp57AF/RFORBT
         OYAhEND44YO6OcqTZ+mIP2CibMZgpS0EidjTzxoMruNn3UXVSpJuPabeMjWenDoK8nMT
         TlMgAnei4kVtMcPG1tFQsUD/ob0ehHefEg/ZBd2oPv+LuevVzCbblE1A5C3Lt6Dr1SNZ
         7nv3BQbYQJd3eTGRV90OEOpqs2vyyC9nJK79kZI4l7OVAHV7qon1QM8F3kf54AtMIrwf
         n6dUjRG3/mZENpNiete/yO05RU5qMBRtxsW3gA7WYYLIgyGMiSD7+2qDSpAiJAZswFme
         Mhjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319329; x=1724924129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0TC8E1V/L/z6kgicdUFBRHIZATSDxO9ps3NP3NlwSKk=;
        b=qIUaS/ibsD/bGiL/Vxj8NQvcmGAM9ycnSWIYu0PHVjxDgzuLxPHKrwwsOrmbmzX9uB
         2VgkRMK+DXNW2aWin3yDC3DnI9luqYWm2zy8uQSKSgcED0w9P3rLwwuDsz8IJemOdBB5
         o5DkrLRfxhwN1XHGeWRobbSpmg6XFIuZfh8kpOeARHMT/yQZE7bKSDjdVHxrPzsxmcUz
         Gf8ao8I5efTfprjfzGj+u/ePyQs2LR7tXsCHBTfCrKCECgN+RaZ2qhP1UlfTZVgiBEgF
         uQJ0002plqsm76Rm4SUzBbv+5ZuDSreSRKEuwQWst1PCSgjA61pitDJr/zp+fymyKg3n
         NWVg==
X-Gm-Message-State: AOJu0YycH9LyU9g1Z3fr7Nge99nafyq9qWTzMpEiZfxw3PmmZsDYyiNQ
	26oMil/uvhcmlTpxKWhCL0QCM3vnNzzjAkj8/FqeM5M5gheG+xZB54rboQ==
X-Google-Smtp-Source: AGHT+IGE0RbTJDGT7pX8zuWo0eLgHAZaAr9TPnCvoBtnEhlo51/+8xwxNHB8tJi4mfE8hCWQwgCRQQ==
X-Received: by 2002:a05:6402:35c5:b0:5be:feb0:ade6 with SMTP id 4fb4d7f45d1cf-5bf1f0a4b5dmr3434512a12.6.1724319328380;
        Thu, 22 Aug 2024 02:35:28 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/32] ccache: upgrade 4.10.1 -> 4.10.2
Date: Thu, 22 Aug 2024 11:34:54 +0200
Message-Id: <20240822093521.36790-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203620

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../ccache/{ccache_4.10.1.bb => ccache_4.10.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.10.1.bb => ccache_4.10.2.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.10.1.bb b/meta/recipes-devtools/ccache/ccache_4.10.2.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.10.1.bb
rename to meta/recipes-devtools/ccache/ccache_4.10.2.bb
index 6ae85af4f5d..361c1643f91 100644
--- a/meta/recipes-devtools/ccache/ccache_4.10.1.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.10.2.bb
@@ -17,7 +17,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "8f8ad60d9363857812aa8af3fa7fb72be5ea5cf193f824d16d237a8a79256be4"
+SRC_URI[sha256sum] = "108100960bb7e64573ea925af2ee7611701241abb36ce0aae3354528403a7d87"
 
 inherit cmake github-releases
 
-- 
2.39.2


