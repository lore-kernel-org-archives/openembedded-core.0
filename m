Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD56C04A6A
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 17:03:07 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.2711.1691168579296051098
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 10:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YyU2XiVM;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1bb775625e2so16328715ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 10:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691168578; x=1691773378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jZ4s1qVb7xy4xigISpzVzJYiY97NjGaE3MfkJqtN9A8=;
        b=YyU2XiVMt3qG+SZqtaNEkVSWT5x/GX4t8PvZcEu9kcvqsrU4mAZD5EAKvr7vLjg7v8
         wH7bB4/1+dq2tCybB7E3WYrLSe1rk2aKzi5qYvrPcLOSnH50RFz0F7zJyKEKKhnyhVsT
         kdwOGMiXXcMz6kQM3hGag5AIRp2hxQajzBrM0Tpl6rNaxRYxm7hQZqmDSEXh073thjtQ
         ZRfRK7/4h93313lQ/EzjSGSFmWBuhtd8hGo5dMP8l1q6qi7svDuflonsM0pRXgPmiehM
         sMMjP6olqmLbeqn+eJgyvVi37Ohs63cYJN53E4LKRf7neFO3d2YPcpfGXZRhR/UyBJ2z
         sEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691168578; x=1691773378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZ4s1qVb7xy4xigISpzVzJYiY97NjGaE3MfkJqtN9A8=;
        b=Y03ZFu5aq5PDPxpWRvNHyWoAgxQP6P6kub/CJr1yW0gt5YLjiWWteZNBr5WqigKqsz
         f8QV4M5gPetzbxfcykufLFDjx1qEMpcKmSMIUT8u0cxg64htz9YEbaduGlkLa+q9oPfO
         ZFO3WjX3bBewNiSSDsPIf/SBmTMy9po83G/1FYT1/vKs2LXEkJ9GZBh3ITqKoFhT9gqo
         VZCYF9eaTa4VUQHAI8kVVD67bgPY/LrKxlFtz7EVbF/tmIIYoJ4lASrmyXveWOrYlYMB
         Bl+Oj5RMWpFxkBruWSxmnM0ij1fvpre6XHU/KjEiN4U8bS85cN2OIWFRdYD86y3EpcJn
         +jaQ==
X-Gm-Message-State: AOJu0YxNQDqYw9hxO1aH5upOCIvUAZzK1ZNJgcMXpHp8f4UOJ8FRjNAJ
	o20jCRbIygt39CckVh9To67WJ3dIRa+dmA==
X-Google-Smtp-Source: AGHT+IGMKA0LlqJnTKGE9AePulvMY9Cuyg5oZWvYZuSkeJe1Cvr9haGR2Xci41ZVHzu9YqJd3FqPKg==
X-Received: by 2002:a17:902:ea05:b0:1b6:9954:2030 with SMTP id s5-20020a170902ea0500b001b699542030mr295075plg.8.1691168578263;
        Fri, 04 Aug 2023 10:02:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::94c8])
        by smtp.gmail.com with ESMTPSA id v11-20020a170902d68b00b001b50cbc0b4fsm1997876ply.111.2023.08.04.10.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 10:02:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/6] tunes: Add support for sve instructions on armv8/armv9
Date: Fri,  4 Aug 2023 10:02:50 -0700
Message-ID: <20230804170255.2784609-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 17:03:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185532

This helps in defining correct compiler options and configure options
for glibc and overall ABI for toolchain

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebase

 meta/conf/machine/include/arm/feature-arm-sve.inc | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/feature-arm-sve.inc

diff --git a/meta/conf/machine/include/arm/feature-arm-sve.inc b/meta/conf/machine/include/arm/feature-arm-sve.inc
new file mode 100644
index 00000000000..279bf8c4862
--- /dev/null
+++ b/meta/conf/machine/include/arm/feature-arm-sve.inc
@@ -0,0 +1,5 @@
+# Scalable Vector Extension (SVE) for:
+# armv8.2-a, armv8.3-a, armv8.4-a, armv8.5-a, armv8.6-a, armv8-r, armv9a
+
+TUNEVALID[sve] = "Enable SVE instructions for ARMv8 and ARMv9"
+TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', 'sve', '+sve', '', d)}"
-- 
2.41.0


