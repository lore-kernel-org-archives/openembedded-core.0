Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web09.17107.1621247758834901947
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 03:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jnKJU56x;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id k19so4646526pfu.5
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 03:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pqiczdLxsK1xUwPnFu3XP0NR2/B0G+GRnUpJo6UToZ4=;
        b=jnKJU56xYielh26DYBZ2XN7ZqM4jvR3FaStlRMYHzCa96LIY4ZUWsEaVGDPXtQhFI2
         NVAGDFs10V0Vc0Gsk79nL44hznB85ENkgJHKRzGvCo6J6zLznd9du2VEDNlfV9IlU15F
         8fTj/pmusMnfp/oTM/uGwx+3j9KIz12sSCI+Nht5Rwa9eh3qZf0SKV717CoHRNdB8wTL
         CNX4jbBUN3SZUg5lfDM0Vk2az31rEaKW93VkVECheEt0oTXqBtNxz7DP891/y91BQV7m
         6mXw7/Pq6lnk0r6KVu7BOdFTtzFhTp1+WtZ1C749NGOGGcRlrbQe8glvOJFNDtmYfZDB
         8V2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pqiczdLxsK1xUwPnFu3XP0NR2/B0G+GRnUpJo6UToZ4=;
        b=hyAEF0mn/lnxLxrFPC1ap/B0fJ8QD6bida4QHr7xC+ifF2KBTcQnEwxPf9xi7vmnFI
         W7/+h0MCItN2AnAU1hNYA6wOjyrduGoLh4kkZwkc1wtrTgt9BU9QNXm4d4QyjCjTU4JS
         ZqsYWf1mPZ9BF8iUZXg115OLYKlSuVc9/O/FNoeZKPVrYLgsiCy0wzJZglSYsqHMShrv
         6xEEiMEq0Op6297wlya9ly6xvrIp8PKC+HstSjbZUGsscaiUsd1oS/5mnN3jqEvkCJeX
         ITpiLTCGV0qEqJdbfGCRgtSFoXhINY09WoJWpHFgJYNFVpPfrV8ht3ZXQ9Q2T3wg33qU
         HiHA==
X-Gm-Message-State: AOAM530jC1neB2D4rAxD0MALUg1nu2OKFttbk8r2sMLw9BqpfPZ3w/DW
	yvD5i0VzuxN0I5dtbpE0ZRLrI4zSVB+SGvQ1
X-Google-Smtp-Source: ABdhPJz1O00euXOPN9SC9fBxS7Btp3zwdYeRz0MAEIJL6TBSKeSvdpo8uw1MDSEZtbddDbkMFwRcow==
X-Received: by 2002:a65:624b:: with SMTP id q11mr59872592pgv.375.1621247758049;
        Mon, 17 May 2021 03:35:58 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id m20sm14903365pjq.40.2021.05.17.03.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 03:35:57 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Cc: kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	alex.kanavin@gmail.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v2 7/7] rust.inc : Fix for aarch64 feature.
Date: Mon, 17 May 2021 03:35:28 -0700
Message-Id: <20210517103528.24434-7-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210517103528.24434-1-vinay.m.engg@gmail.com>
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com>

While executing ui testing observed failures due to below warning,
"'+v8' is not a recognized feature for this target (ignoring feature)"

Same got fixed by backporting below patch,
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rmacleod/rust-wip-2021-02-16&id=f243e4bbd5414ce519336753a68c53ee60cbe89e

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/recipes-devtools/rust/rust.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index ee3176b559..fb20bbd0fb 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -64,9 +64,6 @@ def llvm_features_from_tune(d):
     if 'neon' in feat:
         f.append("+neon")
 
-    if 'aarch64' in feat:
-        f.append("+v8")
-
     if 'mips32' in feat:
         f.append("+mips32")
 
-- 
2.17.1

