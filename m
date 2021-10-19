Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53741C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:35:05 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.11407.1634657704227267434
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BY3+am42;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 a140-20020a1c7f92000000b0030d8315b593so3325414wmd.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wLfm7D7WQlHl5bZ50gT/pYy7MudGSljDUWAB6Rkw2YM=;
        b=BY3+am42s/2G2L7Hqr4tx1jLD8/JwkBQwl9yitl6SCVD9Bn8hSw9XkopS7GTU+8Ojy
         epehaJO+Whf80UW/wDJQAKaHZxZtBWACBSiYrsiTnjypr0mfL1vHL2cjzg2+cIzCnonx
         DqAu6Q/Anag+jmzhxXxL1vGFPLjK3MrLGebdDrg7KW/mMy0M5xefaPtap8XQcsNEUaQr
         ocwjStHMyZhEPdwv3SYSUb8GKjHeFxJ+bzO5QzAxw4Xh3mGzXml2BfcUzY474E+1LXzd
         l9jWQCDbsTiY6p7krHZ/gYr/vWtG4PmBRtWmhTgjRWnCHCUrXNVEXUQY6dlGR2tk8859
         x5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wLfm7D7WQlHl5bZ50gT/pYy7MudGSljDUWAB6Rkw2YM=;
        b=Dh5H9xeFTx//C6tcjRjKuJ63Jaa4aEZW8Lrw1XdW7aH8BrbTejCz4lIIKJTBR9K5xo
         g2OjB1HAAjXJ0stEEORPzyxt+sWjZSPDT8nLio54taFh66CqL9YaD9UtXL3PGhbKaRFm
         iM4PGDLEYvYubAYSy/FNzsS7JF78MqleSwqthN4BtSdnpBj184YNF5eTWVnoM2ckwl+L
         DpU9HVRQbLWTXTv2P0y3oxAt8tKzOxU+t3gdtkC4mjJS83gA0tfhq5Uiz6er8vFYmUfW
         YXRlkJK2oZv/jlREGWpD9+E/fr8n50hBzqaEp8lUc8L/sxaVcQD4tRteU6zcXvrquXuZ
         BzEw==
X-Gm-Message-State: AOAM533hSF/7ORXXKuzyeyOG7tllDgvkB64wN9qY1SqemQvnyqgwvblp
	UvMyC724adX2OGS8YofBvQunJ1dzbig=
X-Google-Smtp-Source: 
 ABdhPJxscnszqtlYNWdULYthdDs/J7cXNBxsM/dMZkhxWCt/Uz2BP7yH3lGRiLJiZqp9gKLd/SWdDA==
X-Received: by 2002:a5d:4c90:: with SMTP id z16mr20760917wrs.67.1634657702836;
        Tue, 19 Oct 2021 08:35:02 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:35:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 54/65] puzzles: upgrade to latest revision
Date: Tue, 19 Oct 2021 17:34:08 +0200
Message-Id: <20211019153419.3319802-54-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:35:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157173

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 298e29f559..1da9bb3676 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "8f3413c31ffd43c4ebde40894ac1b2f7cdf222c3"
+SRCREV = "42cbd7688a7f05e0a5d56a603a04293307c1e1b2"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.20.1


