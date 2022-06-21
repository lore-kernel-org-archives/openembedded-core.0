Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB18CCA473
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 20:17:06 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web12.48355.1655842617405100590
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iggcydGJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id e40so8360810eda.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ToLno+E8kKCpiSNpuM67x9nGlPsZGIREC4Btgpkcj3g=;
        b=iggcydGJCPi1aAnEGgNqH81yJn/EmSJcrQpuIIhEWnkWpd52NxfnbPIoHs48sm4azx
         MDq3io5v3nYIaeAH+JZF9ZaU8Xljq4v/oERDjYGesa2RxheBJGkVDSRO+bK9r5/3UiaI
         ax6O4DtQVtWvc5+Y22G8sE1H7mg8UXsA4OHphAGY5ZASLYIPrXoPMR5W0SKFjQ80PWMs
         dJeLM7X4XK3JbW5bXA1bFQL0jl+I9EVQIdRAbdSYQYSSge6RAKrvdTZAU4jzQNsGKkXM
         BDdbkyLcyhbex2qiR97m4nU0FcwBKTPpXZWsfB+IVgCdDXC9Mf3hel/FPPSmJkkHujhe
         OFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ToLno+E8kKCpiSNpuM67x9nGlPsZGIREC4Btgpkcj3g=;
        b=tkI7kKratxNRu+HLxHTsCJqnmH1JkQyCYJwURaJ7UQytbJ4oG8gUFLNsfxJA4p5ebi
         /9p46paqVai4CItsL6G9WLlo2fg+q9oFWWlsgi2AGcAxEL2nzvV5YlIa+b1fOxR1oe6B
         5Nbr/j9QsRH1oemNSKnAxGOasNSUYXzO8D2EMRhAFNS2fH9N3kccKgfC8MkP4lhSSUvE
         u8BnDSw3/+a4vloZu6/+kJrcSpegGDf/MHJoLkUceW3Oif6KJ+p2T3tV/FUC7VfVs5fr
         oC2SDi8naZJU8wt1KqdVoRhnBjjT5iuT43N9IvpQqmFq1WVtnNuh7c+B1xbCZ7oM97tr
         dOHA==
X-Gm-Message-State: AJIora/eY5DdWpU/bs3s0P7Tb0/bsqlH+E5Qq6MF4GK6bwgAJpIGuR4+
	rWyJ+CiX6wAovkzi/Jz9oACzBQNjesOV/w==
X-Google-Smtp-Source: 
 AGRyM1s3sH6exF3C2mMEVpNzHP/lhMdQTXDdKsBKAFV4PhbsxgadUpdy5s/Of/rKIs0AyOsAEC60pg==
X-Received: by 2002:a05:6402:278e:b0:431:73ab:49b9 with SMTP id
 b14-20020a056402278e00b0043173ab49b9mr37411274ede.415.1655842615955;
        Tue, 21 Jun 2022 13:16:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j8-20020a056402238800b0043590660f16sm3420890eda.35.2022.06.21.13.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 13:16:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/18] diffoscope: upgrade 215 -> 216
Date: Tue, 21 Jun 2022 22:16:30 +0200
Message-Id: <20220621201637.1378306-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220621201637.1378306-1-alex@linutronix.de>
References: <20220621201637.1378306-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 20:17:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167179

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../diffoscope/{diffoscope_215.bb => diffoscope_216.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_215.bb => diffoscope_216.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_215.bb b/meta/recipes-support/diffoscope/diffoscope_216.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_215.bb
rename to meta/recipes-support/diffoscope/diffoscope_216.bb
index a61d68f7eb..87172e9512 100644
--- a/meta/recipes-support/diffoscope/diffoscope_215.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_216.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "4754ad3356b0acc1d2ceffbfa516961a7df0a2d816cd3cce6c9d084ce54d9433"
+SRC_URI[sha256sum] = "7809caabf4369a1f1dffb9fa37e247b4326aa3366cabd6ab3eb7de5cb4402c39"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.30.2


