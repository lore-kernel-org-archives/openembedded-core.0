Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7B5C4707F
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:39 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.2680.1639608045575972098
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZO4mu0Fl;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id k9so22932408wrd.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MQAANzbQZDKppx2yDwyLQughdrYWlXhzAxAucgfT/xI=;
        b=ZO4mu0FlyZQr6653NvvcN60kHfGwBpBE7r+KqSoJJHdNuzUz0I3ABNSO4ymAdQGub2
         RaWBV2Y9DPz0IlNEYQAYjJ9/mbGm56sRlinummsjZuAzL4yBQxleLlA+dKPjB5swXPEO
         dQsLQ2ixIRoPzOvLQWKm4hDjBaj2WuyweRp2yntoql8Cf56D853RLgDt+YnRXKwrD1/k
         DFXt3uZQy5vgWagzjhJ21Ck1HYEF8hPk3HfSWueXWhTsJUUOIcTSv6LKZNkMrLGc8X4r
         byMCVzTWhiPSPEu3GuHegjTaSC2jIzzB2YSe4BAiyWaFOQMPT7t+hHw+PUEfsbH3i9rc
         gCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MQAANzbQZDKppx2yDwyLQughdrYWlXhzAxAucgfT/xI=;
        b=xyhaB1sALb2FNqaT4t8YmbZo3fQYHt7DXnc0tp/+Xi8LRtibI4yi6NFgbJfo6rcRNf
         HU9JZh6+iZqYGKiClbKY368ujWEi3te0iVcQVqo9h26AJSxk40WUIIFFgGkmgvXBnu03
         rcTzQXuv/c6FEwjq0JlgKIYp2jhIrXZ79ub5IB+koe1FCJOeuwl0gDdpENTYb1ixufWm
         F2x8/eiQpKclyGmYQBfxx0cwaAvk4psqx34VqG/hgMOTNyr5uHHy8JORnszDt+4Cl52I
         6sOFtC0cFfU5DpcDtqwIKJjq6Vt19AcdfnOiXBvKZX+Az/sCOeL1QktQpWF2x6tP0s1z
         38Zw==
X-Gm-Message-State: AOAM5302iNxlCfGxOxy6tZg1kQSz2bvXtpK8bZvXY+9izgO0wv10ySPy
	nRJpXp1KjC0upyCRT67D2b7meDU3UariWA==
X-Google-Smtp-Source: 
 ABdhPJw9xTvyu9Jq7A4CukW+e5Wudu/10FKi6/+SbVoSwi8JEtydTTMs/agYPVdGDVDzzgE9S5Lz9g==
X-Received: by 2002:a5d:6b09:: with SMTP id v9mr6165638wrw.591.1639608044139;
        Wed, 15 Dec 2021 14:40:44 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/26] python3-hypothesis: upgrade 6.30.0 -> 6.31.4
Date: Wed, 15 Dec 2021 23:40:16 +0100
Message-Id: <20211215224034.1814148-8-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215224034.1814148-1-alex@linutronix.de>
References: <20211215224034.1814148-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159750

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ython3-hypothesis_6.30.0.bb => python3-hypothesis_6.31.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.30.0.bb => python3-hypothesis_6.31.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.30.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.31.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.30.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.31.4.bb
index 59c56e2d94..6af290d8ca 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.30.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.31.4.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "6d81d409b4a1a3ff9458de5f2cf7ee37b1dd51473aacc79f257c62e2369a5fd7"
+SRC_URI[sha256sum] = "7fa3911d7be699a3139dfa1d9625deed649f651beaab3422c0339742e66d32d0"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.20.1


