Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A05CFC44507
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:33 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155312.1783358250954563264
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=haUz0NOi;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so1848048f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358249; x=1783963049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=diEYMk5D9DkHtGtLjRDlRWZwZNN7YRNoD9OC4u5Ti2Q=;
        b=haUz0NOiw1m56Oy74Oja5ySLaFclpXaH4/dyfQvE3HnaucY83D5zva+HPOZdqyEnMG
         ZYt6cyLWMfs8fvWHlYoENTnNdviP9qeu+/p5rxX68VhxDnQb3EJaiKWrTvRu9JDOO1IQ
         9xLoEiYTIjf/F5mhzCyda5oWT2BRs6bxmAFnQqnoxi+DNEvMULwb2NSD7VEp2ZLTS/Rx
         MR+huneFyQFuMwYck3S6UvyPr0f0ktlaOnhTiy9mtSxFiTt48Mbu+0Lc8vdnTuXOsyiI
         xHWMh+tNoi1TXGKr9VNGFNiWRyc+L/C0yMeaiE8VxivHt+Bme7ylmsXZG6hVKhO8I2x+
         ON0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358249; x=1783963049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=diEYMk5D9DkHtGtLjRDlRWZwZNN7YRNoD9OC4u5Ti2Q=;
        b=Ohl5XZO9kQ4A10JGq7FCX1wpTkBU9OelONpnXix9AlNoPmyH+Dpkmcr55EWz+L/DBU
         x9fUGHZclDWx5nHFJlPIxDF+1Hl0fW0VDcNUa8HJvb1HXMXTUd2UGnXPKBbyFsSOU+ll
         ZmrNvNGSJ6V/iGnKsuI+76lMcY/YSV/7CUahF2h2oYqFP6HXnATkCs3gGUI11h7ff9HH
         /FIBUlCQrJ3wjl2QIVnroWRS7dpCCbpjR1a4C5WewBtfsUssT/4nv6MafXlZpD907y9o
         nRnXOedwYZfV//vXJGzwphSHBbP0g6NlarpEtrcksRTymOdjU1ZlfqbgobAV3iAhSquJ
         cwRQ==
X-Gm-Message-State: AOJu0YyxTH+DE50eKlic43VOH77P2Ue1tEJ/THSUxG9MDxYZEq6HHmBa
	HeCrUz3H3MkQ10oJpKNt8ijfNDwSibAt086hDsOpaWybCaIjFdyfAGg8dN7F6g==
X-Gm-Gg: AfdE7clEkAH/GGoZaYLo8crQebhPBnFzDOOyksnV8NrwiqEJCT10w10LyyK4axb1bok
	PHJgx4ogmJBWYQNaSQ9ODb4Um+M4O8fEYZA2lCz9FreUft2hS5zBkXRKHBy1G6sAxq3oae4RvK6
	tH3Wxg3r/kJ1EV9bgUJIzJCyeSUcXZgKaX2r0Bc5OII4ZN7d0DowN8cmkJVGovrOTQaMkQrvzzF
	56fse95Ubk6uTUn3564GgdbqLVeDK10DVFeWQQc8oSmIvy2Sbi9aIixt4DtdKrTu9UI/seCTgY1
	wjJYDVEm2BC1Xt5eQiGPjSz9ImOsWH+PsYsFhKq23pRFvlwyVZZc3g6hAenqb/7pesPmySmm9x3
	ZUKRzndnywgB5An5OcjURtajrYt3Og14XGWG7317ulchdtYa7KCsN8qPSowpb12ZLinoiiEF70y
	U7EgYLOrWsA0oNePs3xpjG8lmOS5VgvIgjDRsJVe8xfFDvkc8rh/SK/Kk42d8=
X-Received: by 2002:a05:600c:8b88:b0:492:41c9:886b with SMTP id 5b1f17b1804b1-493df08b6dbmr16905605e9.14.1783358249181;
        Mon, 06 Jul 2026 10:17:29 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 27/45] python3-hypothesis: upgrade 6.155.2 -> 6.155.7
Date: Mon,  6 Jul 2026 19:16:41 +0200
Message-ID: <20260706171701.70536-27-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240313

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...hon3-hypothesis_6.155.2.bb => python3-hypothesis_6.155.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.155.2.bb => python3-hypothesis_6.155.7.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.155.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.155.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb
index c828671ac8..70ae7877a1 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.155.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "ae36880287c9c5defe9f199d3d2b67d9947a4da2a46e6c57373cbdf2345b20e1"
+SRC_URI[sha256sum] = "d8d6091753d0669db3c90c5e5b346cb37c72f3dd9378c8413acb1fd5da63f7ea"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.3


