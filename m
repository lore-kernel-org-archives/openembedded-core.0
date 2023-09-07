Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377A5EB8FCB
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 11:38:19 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.10717.1694086690482349003
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 04:38:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=xeOWsMTp;
 spf=pass (domain: baylibre.com, ip: 209.85.128.52, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-402e7968042so8526955e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 04:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694086689; x=1694691489; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mmYzOYCR7P5QnhR0yixIl7EwLZFP5KXOHTB6zn92qO4=;
        b=xeOWsMTpOEBau4RVOQnVQC9Ahg8uyZNDSz8MY27i1SZbc5MAs5rJEs6PlQ1Hbj7kjX
         duXagomxSbpNixucHkk0ip8Q6qLcrdoSWh8lksqOiokjeTg9+bMyt+Ra21mCKXomXZEO
         kCdxwdloWt1PQpgDQ7FPMjY4nAHQDfOEZANoDGfj5eU6CqmxzVkVWLBY9uAHSdW8M0M0
         x8gmFQd0cFzPZM4/XzxAk85+7x9NBsQWKnLVLx2lRTgtimvPcfw2hWkxB+7YZUBPAT9e
         JBJ7nyjC9baNTH7yh0yFC4hVZDGS4soUv8fqpv71u7jGJDuqc7sOe97NbE/Xt3mC8N9j
         Ghgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694086689; x=1694691489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmYzOYCR7P5QnhR0yixIl7EwLZFP5KXOHTB6zn92qO4=;
        b=Hf4iMgAGKpXuHnFdpZMewwpPHKwzGHt9xjWuPa9OoDSggL1l2iwMwIQt/2Np0A0UlW
         6X3624S+wd2yhO7Cpm/JCStu9vpY7BPoUYRqkrpHwdmRPOvNS85UnlwY8arm+JTIxr8J
         y3ZHL7gedhm30vA4Ogu5LAzbRozgQzqFN0T6reqI0PACdbnIGbqMQ9RVAnRWVF3zAKBk
         +VUMYcYLFKT0pMkNq+tFzOCntTFbWz79ZOmzjJ6AG8KM/E/EsQIT0XnpAjSdkK8ug7iU
         efoFmaEJ7iW2Szywg7jO2XwSN6F7LpkmAWFfyVpMzUmXZBNQypXfZzRqjXE+wuhxHl0r
         3s9w==
X-Gm-Message-State: AOJu0YzI3KfWcPaENbCU8Y83f2ICcx6/7uQRms89/pT/YIhxw3R+yy2P
	tNU04OBL0CULTRunGEaP8H7JwkCwD5zCxxA/OLCFIw==
X-Google-Smtp-Source: AGHT+IFzg+2uieKzXVVdz2hTdHFo6+XUgeeMFR6frlC6ocNWYBTu4WCBYwfnKe4vfHk5DtjHXVOlPA==
X-Received: by 2002:a7b:c7d9:0:b0:3fe:207c:1aea with SMTP id z25-20020a7bc7d9000000b003fe207c1aeamr4237152wmk.23.1694086688684;
        Thu, 07 Sep 2023 04:38:08 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id l10-20020a7bc44a000000b003fedcd02e2asm2277293wmi.35.2023.09.07.04.38.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 04:38:08 -0700 (PDT)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] populate_sdk_base.bbclass: PATH to nativesdk-intercept chown/chgrp
Date: Thu,  7 Sep 2023 11:38:02 +0000
Message-Id: <7d08e28bb59c6734f3e018722411205630886419.1694086051.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694086051.git.pidge@baylibre.com>
References: <cover.1694086051.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 11:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187380

[YOCTO #15023]

This patch fixes building the sdk with api-documentation enabled by
appending PATH with the nativesdk-intercept directory which contains a
special version of chown and chgrp.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index b23ea26d409..632266cc162 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -17,6 +17,7 @@ COMPLEMENTARY_GLOB[dbg-pkgs] = '*-dbg'
 COMPLEMENTARY_GLOB[src-pkgs] = '*-src'
 COMPLEMENTARY_GLOB[ptest-pkgs] = '*-ptest ${MLPREFIX}ptest-runner'
 COMPLEMENTARY_GLOB[bash-completion-pkgs] = '*-bash-completion'
+PATH:prepend = "${COREBASE}/scripts/nativesdk-intercept:"
 
 def complementary_globs(featurevar, d):
     all_globs = d.getVarFlags('COMPLEMENTARY_GLOB')
-- 
2.34.1


