Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5832DEB64DC
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:54 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.7494.1686734990978410951
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Pu5X6yoJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5184abe9e86so3666933a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734989; x=1689326989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ythe3IERnzEUJFVpXuFRDZ2g/CI6rHyTKWIJIBfRFQ=;
        b=Pu5X6yoJPEyluWKUxdMvaRHl/Lbh3wDBZFX6jhKHWbtpo8rHQxyUK9unFhSrZJS2Gf
         oD77kYYwszy/c/ZaBb2TWosAc0rAcRmzV8bKaY5glm6hyO+/RSYIHmNVVCAllT49Tvxz
         gyD2xs1403oTYrSblPTdpY2h7b270yre6cjyFjCUyhqgfhWM05crW9mZl55Gs2PkatM+
         5SLem6PcBYrrosqmVqacAKlKmsgc3/Sy31jDn8eXix2POi5ZKKu2uCLyWaQmEVMSqD3c
         hpo/PqHulX3N8UXZx3rHHFdtzJG4HK1ZsM/RTN6GjAVoq3jVFCBhKjf5EUhadhDII6d4
         646Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734989; x=1689326989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ythe3IERnzEUJFVpXuFRDZ2g/CI6rHyTKWIJIBfRFQ=;
        b=SCfUiVLD76rpTfojKxcnnDIuh1QhRlSZDyvQ9jcTCZKpJRbDeKD8K+HHqAtg0fQMew
         sC/G+cSCzSlT+2KOpzA+UO6vL4RGYpKo+wA0z6tZW9JklMGNosQhVVQGdC67LvQw/4Jd
         Oz9nNL1Hsz+goGC6EjrrqqNhmHPB6TnNH88tiEwQkb5JIxE/+R8zFDh3qLRYwVoPMl0l
         mKCXqpM9/DTW4nhuVStxo69Nfoku3Vh/W9k+EsM+Fr6FpijaaywsHxgCsmzvvF64t0L9
         Bu7f8lvNEIAlj8ZkWfEpEaxDmAco1VONyEEkI+xHOSxnEnFslzAPocuVzw46wWfhCXQU
         jUAw==
X-Gm-Message-State: AC+VfDx0s5gqqoJL6ivvb5+jdiFA3dO1arQn+6BsVZiWr9yA9+UjLZmV
	U/VUwMQZV7N8Ym9grojDFeL/YC9iRtE=
X-Google-Smtp-Source: ACHHUZ6eY6x3BNTWEyeN4ZVRTwhRxSBohEV73W5VWKw5Ky/a/pLB7nwEmIwEGdiXlo4KIh/qUMyEig==
X-Received: by 2002:a17:907:787:b0:970:71c:df58 with SMTP id xd7-20020a170907078700b00970071cdf58mr13967375ejb.42.1686734989341;
        Wed, 14 Jun 2023 02:29:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 40/55] python3-flit-core: upgrade 3.8.0 -> 3.9.0
Date: Wed, 14 Jun 2023 11:29:03 +0200
Message-Id: <20230614092918.4065570-40-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182785

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-flit-core_3.8.0.bb => python3-flit-core_3.9.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-flit-core_3.8.0.bb => python3-flit-core_3.9.0.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-flit-core_3.8.0.bb b/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-flit-core_3.8.0.bb
rename to meta/recipes-devtools/python/python3-flit-core_3.9.0.bb
index 2e5b1e80695..b0bef4b6b69 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.8.0.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "https://github.com/pypa/flit/issues"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=41eb78fa8a872983a882c694a8305f08"
 
-SRC_URI[sha256sum] = "d0f2a8f4bd45dc794befbf5839ecc0fd3830d65a57bd52b5997542fac5d5e937"
+SRC_URI[sha256sum] = "d75edf5eb324da20d53570a6a6f87f51e606eee8384925cd66a90611140844c7"
 
 inherit pypi python_flit_core
 
-- 
2.30.2


