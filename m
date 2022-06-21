Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9371ACCA483
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 20:17:06 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.47954.1655842606808933030
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RK2SW/Du;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id pk21so6721291ejb.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QN/bChrvXZMfdeD8E1vBj3sVjeECRK7H6eWwhooI//A=;
        b=RK2SW/Du7YMoOxioXSc5zXsri3QKDwEtjCFqHV5/oEQ3vFBYUPAlSDN2PgW4+VpPbk
         9ixsDKxVCnnjprvjtvr8J/y1cKK4afX/k9smmJDm7uYHVBPVRc6bAgZO5NmahKUZ6Xpx
         z5bvkF1/tuHNgX9N5w8Ttst/YEeXyfzgo3x7dXaIEw4tQM3vb4qRiyTymkO8Ilrr4C7D
         8CBvv17+AiTuW8yQKKIyK4WaBvUv5O0KcsHJ2M1g7wl8yjglxKL0Lz7bTzMMc8AhntvF
         zNfhaFYDaBxmjlfoU6KmxiD04dR4dU05KL2eDp6JUHXuAvl3Twhfdw9NE0F7z5ds1TZ3
         FtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QN/bChrvXZMfdeD8E1vBj3sVjeECRK7H6eWwhooI//A=;
        b=qMcoyeKWzTdQ9AbYPugdEsTaw1SzWznTgQkcKrXOVF+yFt/Y0MxDF2SDokZJt5WgZO
         BRjSWHgC57g0PQ6V3PfTxgEECAr51im2o7cDcXoEkJQvzbzA6bzc2UFz4U+zUedTaBbF
         HffvC823iifzkZQNdZW52hKWOGNC8+zsjbulMwPJQEUsIAEC8ZRB8odIWAa5ffX8qBDt
         nA3L7U05FcM9err3lWy1oVVh8Xtb/NSK/jBy6zXy4aQDI2sSR9NkU4b+NzaCo3KykP4c
         I9o9ulSVaU7qAKQjY0EAgZxOxdxXlsOTMg0ygbAz8Go1no3f1caL1rkwApLqFQ6UjDRs
         J+0g==
X-Gm-Message-State: AJIora9d1ILPBS7Dx9MLdwUpi7H31C0PfkNoxWtkpmLrlbNXxeAIPmtX
	If+NvGK5tI9MP/V/d3OELSFC3hI6IE1j0w==
X-Google-Smtp-Source: 
 AGRyM1uTiMm2FTdcLhhP4ZXE9Q+9+uSIOozVXWslyYwBdPYc5aov9cEmv8s+CQutvsbpmQCKWe48LQ==
X-Received: by 2002:a17:907:8a13:b0:707:194c:30df with SMTP id
 sc19-20020a1709078a1300b00707194c30dfmr28087819ejc.154.1655842620259;
        Tue, 21 Jun 2022 13:17:00 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j8-20020a056402238800b0043590660f16sm3420890eda.35.2022.06.21.13.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 13:16:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/18] puzzles: upgrade to latest revision
Date: Tue, 21 Jun 2022 22:16:33 +0200
Message-Id: <20220621201637.1378306-14-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/167182

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 6f038cc475..94912bee60 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "c43a34fbfe430d235bafc379595761880a19ed9f"
+SRCREV = "387d323dd8d579db2c90b499b3b19f746cbdbce5"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.30.2


