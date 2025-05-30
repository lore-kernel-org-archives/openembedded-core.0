Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E39C5B555
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 17:39:29 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.1351.1748626762850178887
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 10:39:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ROONTwpO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-73972a54919so2082272b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 10:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748626762; x=1749231562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4vEyXDq9WGCpK2MEkzWPH2MCnYaZZULt0yvzeGScFs=;
        b=ROONTwpOOGE/fRPr0XThKj4FYGL3A39tBd3Nmf0Mdz+2SiW2hInxKrwQNliR8Mzov+
         VMga/wUVzyW5e3uzAn+JCehDqrGPlKj9pzMp4yBAc2z5Voqr54qrkXpVeXV7QxkO7Fv6
         kz81849TXXwm2t6mpGikabbQTQZbqIA30A62fz/tebROxdAv6OaE3zdYQ6bFqGdM+UCc
         ZOHSKjrfyR8GGXmngjF18m+LX4d/4eO7j4n4iSHtEARPZCoJPHpmKJLwwPNdR5PCbnyG
         P0fwkqRCXRK3o0ixTgZNenQ22S1OMZ5+qgED4+gZDitFuFTAVE82QpOpbfZcAhl5gTKY
         qV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748626762; x=1749231562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4vEyXDq9WGCpK2MEkzWPH2MCnYaZZULt0yvzeGScFs=;
        b=KnK8Jf9QWiOyOLbn5qISlTq5yZEG9okQZ9GzKMc1RqS5IeB96f+ZVOMve2QA7FkC9Z
         nzIgPfZlGtDOFO6jJBM+hinkwV7prbgNlCMq2Vhw5Bfn3XLiTOS/mijCnUSiwuF6Fqow
         QTNWSEdCUk8FubDywxUlWTyPtmpTbnEeypACKajke3Lz3TYk2xCqFTYHuv/y7aq8XJQH
         LqOc7tmRcb/7JJwP4vi3DR+hsX2o1W6PLfhnGR9XWCh2Sf46fO0pLOOjDIAYDAEWpBoO
         tNx84Xi9mV6Ro9gH+zSMtbMdDnOwMZNdY8QP3LrTbokLtg7UwDF0k7XAwY+TfBnmGo/X
         byaQ==
X-Gm-Message-State: AOJu0YyH0jDE+pLcLRPPgO55Ah9m4D3hXce+DuXmW2sWKaQJRlmEIuat
	CAfFKE/rpyxsyovcXoX/K+OD829N+VJ+lpCuTZPNmfVccgMCUaX3P3F3GJAo6HMbvu/PbARJB7M
	T3NVy
X-Gm-Gg: ASbGncuwI1Fki6FZWGi4YGQUnYD/yT/jyktKoh+EQsa21+eUaJxh/qLB9ZdORx3VoEy
	phNyvHZc81fr4OCu4uY8s2kSbo0bndT/dDDWSY1pPkN5T741HIvk8Fhi1xzkLe8eFGW91gpVUPr
	rnFarPMsgCrruAS68c0FYiuDOYKKFAq1GaxCN1eNManf/ki/kuxjvGA9b8UlOsqTgXV4d0IpVSt
	UQC7a0bq4YFijTPngZQ2TsVcZCa2O45eDvepSLCuGgp1xf2mbniyN8rgDvxMrqbEg0/hYThOg+W
	DDt/DvtsN6CtDPPp4T61WIm6LyRGvsMGf8n0ixFtJcm2Sl76q3rBQw==
X-Google-Smtp-Source: AGHT+IHfjIB4A12nbDHLxQM4VdjuBgwYGcF1D5r3uHZeLf9qEPGb/YLioD2I44RA7yjTsm1zMxAW3w==
X-Received: by 2002:a05:6a21:339b:b0:1f5:87a0:60ed with SMTP id adf61e73a8af0-21ad956c327mr6432675637.19.1748626761984;
        Fri, 30 May 2025 10:39:21 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb5f40sm1554314a12.67.2025.05.30.10.39.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:39:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 09/12] linux-yocto/6.12: riscv config sync
Date: Fri, 30 May 2025 10:38:56 -0700
Message-ID: <9c36c898a43ccdd1f31d0bd45e1043a9f8a20b68.1748626640.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748626640.git.steve@sakoman.com>
References: <cover.1748626640.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 17:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217532

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Khem Raj
    Email: raj.khem@gmail.com
    Subject: bsp/qemuriscv32: Sync config with upstream defconfig 6.12+
    Date: Tue, 20 May 2025 09:36:06 -0700

    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d530bd296108ea38f77c12b097c8d65bfb6a2efd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index c6be153d16..f2ab88bc55 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "9ee7ecfcabe12ffae693f11c83d8cf6d8181f12a"
-SRCREV_meta ?= "020a66c734ee618ed2b25a89102fd8de2ef98f9b"
+SRCREV_meta ?= "da71eb19ceab34a7a6ff4284f1580e043c870168"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index f81f20e74e..bf7c61415e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
-SRCREV_meta ?= "020a66c734ee618ed2b25a89102fd8de2ef98f9b"
+SRCREV_meta ?= "da71eb19ceab34a7a6ff4284f1580e043c870168"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index e1a7d05fbb..79fc65f826 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
 SRCREV_machine:qemux86-64 ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
 SRCREV_machine:qemumips64 ?= "e2f38ec1df747da895699dcb9955606e1a8d60da"
 SRCREV_machine ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
-SRCREV_meta ?= "020a66c734ee618ed2b25a89102fd8de2ef98f9b"
+SRCREV_meta ?= "da71eb19ceab34a7a6ff4284f1580e043c870168"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0


