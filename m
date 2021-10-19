Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51EB7C433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:35:06 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.11522.1634657705435405979
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mOrsR12V;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id p21so12447048wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kGsDa+iNHCIWGhFCRPQjQIJH32XSpeEPVBN/72+h2uU=;
        b=mOrsR12VJge0trMLmVs96YHsKUU3ZpSt6Q7uBHRTn/0hrP6Lj5DcZJVfCXP4Xy/jqQ
         uDDnp27MertPby4mkmmsz6zVeQzVDugFTHg9u0V9qc0MtSBwNLv4UWq11ekaZFQPv0d7
         eWCMNry6ydzBG9LlWi0qGHnbExZtkMt6eTaol9ObKfJYF5YsNiSKLjpSQyUATW7oc+Gt
         Gg2xdmKbiKm5RvVgHv+OL1pehxZ9pYbcKbiUIGb+8IbEvuWE501he+u5KJeQmDZq/pyq
         opVAuOHFHRxYVVv1elCAMy6P//K3LiPrCzVpy5G4L54gPqFrgRE7vfC1cQMRd8t0rrQA
         JOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kGsDa+iNHCIWGhFCRPQjQIJH32XSpeEPVBN/72+h2uU=;
        b=QHvs8u/Uu6RyN+EDzemedrHY5HfCL+UhGEw9yVFsaWEpEK7nutUh7IBd444/3FLPDd
         I3HmS7byxo13DdE6NyjH6yQ/2aFmbPEOlISCWnLDjrve35N+GJtLdMdSzvVb8IqHeHQc
         o2veCefLTfR1G01omGYIhlKsQWlIdodIiZC9xC5GYpCs5a9mQ8zXH2aqqFL+8l9f/1jK
         Qwbxe51EM89Vj4BzCJi5riUMMDCgk79EE1WZBLWh9YYxj3islVAvvLRmjqMjiPb/hym/
         UIsBNAH4bUQitzuVUaqOmfAQxbPqjFs45qqf8UAz1jEjdnZTQUDVT8EKkvcbZ4m19sdf
         ZJQw==
X-Gm-Message-State: AOAM530qORYFgKZ48rW5LSlkkPSIL2M+zv9UHfuXamurz2QITdyflIo4
	5ON7RL5fevM08/0MJexyF8h+VrWVewI=
X-Google-Smtp-Source: 
 ABdhPJy0QJGQjvLxBM4ryqmQfRglO1d+uvYt9Ot5S0qUz5PaC2vheBT/CKtt3h9LwN+OirLLilImSA==
X-Received: by 2002:adf:a31d:: with SMTP id
 c29mr43791967wrb.381.1634657704074;
        Tue, 19 Oct 2021 08:35:04 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:35:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 56/65] diffoscope: upgrade 182 -> 187
Date: Tue, 19 Oct 2021 17:34:10 +0200
Message-Id: <20211019153419.3319802-56-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:35:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157175

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../diffoscope/{diffoscope_182.bb => diffoscope_187.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_182.bb => diffoscope_187.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_182.bb b/meta/recipes-support/diffoscope/diffoscope_187.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_182.bb
rename to meta/recipes-support/diffoscope/diffoscope_187.bb
index d5875423c4..e10a068cbb 100644
--- a/meta/recipes-support/diffoscope/diffoscope_182.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_187.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "5969c6f0060c5c553e5ae9fdff45fbd344f102ee8fb2c5673cf0c73999c50df4"
+SRC_URI[sha256sum] = "e8340880eb9cce0d99498f71bcdb69c6cc4385c972b5bc12e739e71eaca29c5a"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.20.1


