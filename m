Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A6FEC433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:35:09 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.11494.1634657708439961245
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IM7Qa+gn;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 y74-20020a1c7d4d000000b00322f53b9bbfso3346156wmc.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p3jgbo6JCugiyN05cE0iyvibrL/Msaa/ubT4xzvprtE=;
        b=IM7Qa+gnknI8l9tzJkeMKJZ77T3cECKUGkVUIP+nrG00/4Bd+7EM2+M6lKRv8CVTtY
         XEKy0grkP+9492XZfjAGmHq0MxNKOiWtzNFuCnTgEZJpaqQRysrrRSfyg2/Dr2048l1h
         Q5t9vlyPGRGbThFwFWZAF1UKQ/6hyUexnT3WluFZfz6Tjfjx1k7ZNwPEHK3y0rBj/mGR
         vPNRWZcGBn9VhGGe3XJsBCJA5r/2+EfDUkFN3m2pShQDFjv4F2KOGt54GYSPIFzLDRy5
         hs5dW7aRcKrqDgMxMPS/uCwg22lBSR4Xh6oLoiII7i1KrNsx7ihM0M+T1sEUmRd2CqxH
         DzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p3jgbo6JCugiyN05cE0iyvibrL/Msaa/ubT4xzvprtE=;
        b=uxZ9Fe2fep/Lfz8VYAu9If9L0ByI/j8CRD6cAFI8SNvjxgda/LuC0ouHJTK3Ijj8z4
         DD2qyLbpxlv342PQCq6eE/nSSHrIUVJyI+x4BN8nz3sVgR2XQcQO0F1DZZyzn8moGdTa
         ttLgs2lWLdBYha+GVVUwLhKfuoa/Zq5aCKm/i9C0X6VgzUVjd1jwy2Pc1iReD0vrFVNg
         p8Huu07tSNb83h9MokAZI+PiPDw0RyEZinTaX9TfVP6wGTOpFObs4gs7RY39vqOsX7Sx
         MuKkYZrkT36Fap2jLOWHJF0yCpDwkdeC5viszwNmCoVA4zQA85ZNa0tHZsEfetZsSKYj
         dplw==
X-Gm-Message-State: AOAM5321UZsmDu99n8NmyBefPrzdtQxOsvNjEvFReqcjU1H9YYB2nm/k
	NLtvvQl4Hr5uluEbQ6O4GeKoiE7j7o4=
X-Google-Smtp-Source: 
 ABdhPJwGXbhU9rZCpNgwskCfSIzC3JvrzLjgcZStFPAj+RMvOzgB4loGxV4cVY1EngX4s5H8u93jmQ==
X-Received: by 2002:adf:9147:: with SMTP id
 j65mr45031454wrj.163.1634657707063;
        Tue, 19 Oct 2021 08:35:07 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:35:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 61/65] libmd: upgrade 1.0.3 -> 1.0.4
Date: Tue, 19 Oct 2021 17:34:15 +0200
Message-Id: <20211019153419.3319802-61-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:35:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157180

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/libmd/{libmd_1.0.3.bb => libmd_1.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmd/{libmd_1.0.3.bb => libmd_1.0.4.bb} (86%)

diff --git a/meta/recipes-support/libmd/libmd_1.0.3.bb b/meta/recipes-support/libmd/libmd_1.0.4.bb
similarity index 86%
rename from meta/recipes-support/libmd/libmd_1.0.3.bb
rename to meta/recipes-support/libmd/libmd_1.0.4.bb
index 2e6762e490..b93dc2d78d 100644
--- a/meta/recipes-support/libmd/libmd_1.0.3.bb
+++ b/meta/recipes-support/libmd/libmd_1.0.4.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD-3-Clause & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0436d4fb62a71f661d6e8b7812f9e1df"
 
 SRC_URI = "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz"
-SRC_URI[sha256sum] = "5a02097f95cc250a3f1001865e4dbba5f1d15554120f95693c0541923c52af4a"
+SRC_URI[sha256sum] = "f51c921042e34beddeded4b75557656559cf5b1f2448033b4c1eec11c07e530f"
 
 inherit autotools
 
-- 
2.20.1


