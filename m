Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD73C433FE
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 11:49:15 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.9591.1639655344770717361
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 03:49:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=hABi+w3q;
 spf=pass (domain: madison.systems, ip: 209.85.215.170,
 mailfrom: matt@madison.systems)
Received: by mail-pg1-f170.google.com with SMTP id a23so18265632pgm.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 03:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OBbkafeV4UQmy7WPgjRfpXLdfU1Fx36bqsR2MC/ypt4=;
        b=hABi+w3qPJjlhitTl26ddRM3soYkNNKKbWCeXwZ32ACs9emggbPB6sc7D2xRsVbgs1
         VzW+Aa18ku5BYhBrzMT57vPbS/s6tiFJoPABi7nQvHeGKwX4QsZgalQA6fx64A7fhMzk
         3gRlOcHMEYkZrM5iRxmKIJ/Zpq2flTV2LWthEXeaLTWsVoTPS/9pdPKaajO4Vi/2F67l
         SbMA6BKogi5I0m5c6NGXS9q5YC9aNx+8+8BLgQDxbpz5ceCPDclW1xyzMa4R3C1v1ejv
         OXQyaReiLuFmvweabYR5OF9QWvWchmnGXVOfmYMkd+oMBWMWus1z37IUxfsDqOLbXVH8
         Xb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OBbkafeV4UQmy7WPgjRfpXLdfU1Fx36bqsR2MC/ypt4=;
        b=Epzo2bmnfdKhKJUw6G5MnWjpDPB4RudoW7HJkw5HfVxEIKcx07KEodMZbS4EONVcQh
         FjkHsKoDaqBWbMdcVCIWTVqidAyUK9cDqadeJHm4H9pMgHSY2bWP7AvQxyV32fVw/jxl
         P3WlvAMEqoQ6dX9LAh8HIM0Da9hZNtXLXSjkJENuBfIwyCHhm6Jg7Z403iOVeezYceOy
         Hgd24ka29j3augfgjlIMZRNc0fbWtO5wYcim4izLbeAbgCiwjv5z9XVnMJau7VRrVyCw
         gHQX18hIsDmRQ+smD6DPkpQKNH84h1U7Ah38UyQQCvWeCXd/ArtEbIuqmyaV6LpJKBqJ
         fyIQ==
X-Gm-Message-State: AOAM530qiQBBdYqHqsrWw/JjxHyWb9uY82cq3LoHkpxuAAanNK+hcSuN
	zLAc68JNyWVgggmmbatYDcYcjdlmAcspKA==
X-Google-Smtp-Source: 
 ABdhPJw++8VdbjTzjYd/K2OexuCy8xzTJbmLZgAghbSsVq7KJDh7PWj5U5ZRnWp9CIff7LdIZ7YMvw==
X-Received: by 2002:aa7:98dd:0:b0:49f:bab8:3b67 with SMTP id
 e29-20020aa798dd000000b0049fbab83b67mr13610820pfm.86.1639655343814;
        Thu, 16 Dec 2021 03:49:03 -0800 (PST)
Received: from visar.local (76-209-242-28.lightspeed.mtryca.sbcglobal.net.
 [76.209.242.28])
        by smtp.gmail.com with ESMTPSA id
 q19sm5103175pgb.77.2021.12.16.03.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 03:49:03 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Matt Madison <matt@madison.systems>
Subject: [OE-core][PATCH v2 0/2] qemu.bbclass: drop OLDEST_KERNEL reference
Date: Thu, 16 Dec 2021 03:48:34 -0800
Message-Id: <20211216114836.964835-1-matt@madison.systems>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 11:49:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159781

This addresses an issue with allarch recipes that use meson, where
inheriting qemu.bbclass causes task signature changes when built with
MACHINEs with different architectures due to the reference to the
OLDEST_KERNEL variable for setting up qemu wrapper invocations.

V2:
  * Backport Khem's qemu patch to set minimum kernel version for riscv32.
    With this patch, qemu for all supported archs should have a built-in
    oldest kernel setting, eliminating the need for putting it on the
    command line.

Matt Madison (2):
  qemu.bbclass: drop OLDEST_KERNEL reference
  qemu: add patch to set minimum kernel version for riscv32

 meta/classes/qemu.bbclass                     |  2 +-
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...s-minimum-kernel-version-for-riscv32.patch | 40 +++++++++++++++++++
 3 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-riscv-Set-5.4-as-minimum-kernel-version-for-riscv32.patch

-- 
2.32.0


