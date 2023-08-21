Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73297EE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 14:38:11 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.1010.1692628688626281325
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 07:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=vP0GuoiO;
 spf=pass (domain: baylibre.com, ip: 209.85.221.52, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-31aeedbb264so1747375f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 07:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692628687; x=1693233487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y+MF47D+3LfTdjEs2RTnklJkQFqrCT9yILtOw7btsM0=;
        b=vP0GuoiODugc8OtG94HsiTwYy/44XYZGe1bTfKHK97zYmm1OnTLmznyh+KgpgAZxvh
         DMy4P+Tj1Pk4UCnpXoZZFhov6dXHDWh7zlnfSX9xzRbbR8227x7uAkB71iveGKNCvWTE
         Fnfkcx16l/lDcYxioA5/eVt1nF6dNGZmh5NyR9H+G638nQRRJEljC918Po/qNhqCNnKA
         9OpFKDm3IaKva3GFZ0FBMNzdmtRHNzU8fEoyqBx9ZubUDzjiBmbNF/vgR2BSddhXZESc
         5YsaDnWYsZMrfjDmtzunc6uOzUKfjDthLtlRsK10qgiFH9nPU/N5Ry31s+hJ74u2B5/M
         NStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692628687; x=1693233487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+MF47D+3LfTdjEs2RTnklJkQFqrCT9yILtOw7btsM0=;
        b=PHe+rD0jYe0TN9QEIZlECE6p1BEalZz2J0WoLk71rkEUnrMnvN/CYjSLhwtz0iUZKF
         S9RI7qeZHmspLnCD5b5VUJM/rJ/kUXzUigINa5DTzpR59zRCY6kRtz1T04UdjfPLNLGb
         Ac3F7YMGmBy2ZMWgTlXIozg+1LL/EBh0KbNezww+L83ZQzBdmQvMBCKRMCHlS8cQiZhs
         Yr8MCL85StfyAr6+1KmPtFR41Zec1BHnv7yQTzq71gYgCGiVtrcpNTi1Qkt1iA63F9QF
         O/e3O/Y+wx1lWTGQV2L24sCTPX+8Cu9ZqGlR62vQrz+cJwy32KUyyNGU8rK9ivIjK8MI
         /Uig==
X-Gm-Message-State: AOJu0YzuOXHFVbsEQyam2LpZFQ1N1ePyJ4XnDdO2iYUqffdv2OCHkOVN
	y3CLVDsrzJkDxyiyOE782pSBYlNSW+S/ndeDf1HG2Q==
X-Google-Smtp-Source: AGHT+IF+9rf4k/HzAOyxSDUT7X228Jo+mguXbVOUwZ5Pka7GosvLr68ZNVVX2LoFomZaGwpBovov2Q==
X-Received: by 2002:a5d:6084:0:b0:319:854f:7b02 with SMTP id w4-20020a5d6084000000b00319854f7b02mr5639082wrt.51.1692628686738;
        Mon, 21 Aug 2023 07:38:06 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:fd3b:9fed:e621:cc8f])
        by smtp.gmail.com with ESMTPSA id i14-20020a5d630e000000b0031980783d78sm12667558wru.54.2023.08.21.07.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 07:38:06 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v5 1/2] less: upgrade 633 -> 643
Date: Mon, 21 Aug 2023 16:38:00 +0200
Message-ID: <20230821143801.2797029-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821143801.2797029-1-jstephan@baylibre.com>
References: <20230821143801.2797029-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 14:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186448

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/recipes-extended/less/{less_633.bb => less_643.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_633.bb => less_643.bb} (93%)

diff --git a/meta/recipes-extended/less/less_633.bb b/meta/recipes-extended/less/less_643.bb
similarity index 93%
rename from meta/recipes-extended/less/less_633.bb
rename to meta/recipes-extended/less/less_643.bb
index 2defb5ccb7a..008bbd5581a 100644
--- a/meta/recipes-extended/less/less_633.bb
+++ b/meta/recipes-extended/less/less_643.bb
@@ -27,7 +27,7 @@ DEPENDS = "ncurses"
 
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "2f201d64b828b88af36dfe6cfdba3e0819ece2e446ebe6224813209aaefed04f"
+SRC_URI[sha256sum] = "2911b5432c836fa084c8a2e68f6cd6312372c026a58faaa98862731c8b6052e8"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.41.0


