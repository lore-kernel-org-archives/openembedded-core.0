Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBABE77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 21:17:34 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.31962.1736371046150854211
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 13:17:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VYzMnRJU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2167141dfa1so4078835ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 13:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736371045; x=1736975845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEvT5vhz+v1aa+UaLECoI8TBmTSxHaNwytK4nVpeicM=;
        b=VYzMnRJUzTDW9jXPjeTOnxhGy2LOy5U1boHZxiAMpyU0BSbp59dxhllFy9AguBhXFJ
         vVLG+6HkVA2A9sVCEDMxzfEISCnhnZPnDBydyPkfSLvtcuCkYq+ddkz2ECHZ53f3bYGQ
         3U94NNB8pmFLC0KVm2eMXYScA+xgj0kotCSme71zRh4sSRKHr8UcC8zK1s+Y8ADVtGOd
         I7M9ITSqHr0kvgsU1POUqIAUxPpwYxgl4ROPL1Yj0lPNLM1k2lSkyHCSTb0P/NjoE5E5
         ilHyGPE0EgltJIRd+vw71F9BiU7ocoXc/GSVYWAolrxdJCT/pid6KyZ5652Y6BNF6SPE
         7UFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736371045; x=1736975845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEvT5vhz+v1aa+UaLECoI8TBmTSxHaNwytK4nVpeicM=;
        b=pbEbqaPfJM5enqa8QIR3NVq9Q4ZXAf4WVAcjzyqr9vRnotTmVyj+tLFi2a4DGBxtyO
         1xhD8wosd7Tx92chK1nYGKgBkhYHYDPw8Fr3riBUCtSI2EC+NFcH517vDiezBmHAwoiy
         zynFsM5bscMu1APgA6XeDwyaKAm7uP6TBeyW0DBIGTvRWygykDHGEZS22ymeM69NDvFD
         d8eO5Cfu1DXbCa5sigSjd0US7j3Ib3o88WH0qOcVkuBrbyX2d+dzW0G39LWx84vDVmva
         jA2WMdxzmiQb09yzyTiKjR6B7t//M+c+ttCEZBWjde505YvYeZz36bTK/4anNtbTSq3C
         jgAw==
X-Gm-Message-State: AOJu0YxMvnbHSxZE3W62v0/J0jVSmfv47gzq7sQ0dnQ7lvoG45iHqKB+
	l2O7X8VeTY3SW2amN5P9pM1mGEPaocs9DUZugA7lpTX+bp3lItzxcM0UTxVZUGpO8S+RbiwYbL8
	xsS4=
X-Gm-Gg: ASbGnct3xtLU3oZFipCx5/QpcxuBYA58IrdatKEzeH/rIi7vEXFa46yZwULXmyuj5YN
	mg0pZBky6Q3Dw9u5UxKkg2UDHUMk+rGelJ4FEW7HyiEYJxAWCRtY/GL4xgm7z7T4rir0+RYAfdH
	mt1r850yZ15330+y3ad6UYng2s4KGFm5G9HBgDBO4+RohN4Cd1Av/fU3K0Z1y6FeDqSJy40mULK
	8HQs7qkP3WtD0nPLmyldrLQKqvbrV9PSKJ4I1pIypNaEw==
X-Google-Smtp-Source: AGHT+IH8CEDc2yS6gAykxltGw6veKZWNoJ13nu4GlsnLgqeDy6anHK5nOXuFJe4C/QKR01TWK9VLcg==
X-Received: by 2002:a17:902:d4c9:b0:216:6ef9:60d with SMTP id d9443c01a7336-21a8d6e9625mr10185225ad.23.1736371045401;
        Wed, 08 Jan 2025 13:17:25 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdd9bsm331403495ad.132.2025.01.08.13.17.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 13:17:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 06/18] linux-yocto/6.6: genericarm64.cfg: enable CONFIG_DMA_CMA
Date: Wed,  8 Jan 2025 13:16:56 -0800
Message-ID: <f0df0732632ca84b921e0a6a622a94f4ade950a3.1736370890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736370890.git.steve@sakoman.com>
References: <cover.1736370890.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 21:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209596

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: genericarm64.cfg: enable CONFIG_DMA_CMA
    Date: Thu, 24 Oct 2024 08:49:29 +0300

    It's needed for graphics on AMD KV260.

    Cc: Bill Mills <bill.mills@linaro.org>
    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 87bbf8eaa48cfc8bca02d86bd089df61846d2ca4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index fa4a8f564e..b663804e17 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "0dc843fc43271230499a7e5c39e7a22eb1dbd2b9"
-SRCREV_meta ?= "b1108273b878547b3d3281f21aba44a8c41ca741"
+SRCREV_meta ?= "b3f537ae33e504d33eeae8149f0c0972d886b3ff"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index d913e09212..0faf40ef2d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
-SRCREV_meta ?= "b1108273b878547b3d3281f21aba44a8c41ca741"
+SRCREV_meta ?= "b3f537ae33e504d33eeae8149f0c0972d886b3ff"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 9feaec24c4..db06c05c38 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
 SRCREV_machine:qemux86-64 ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
 SRCREV_machine:qemumips64 ?= "b15f0ede8d222c8fe745a21e830166a7a8da2f1f"
 SRCREV_machine ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
-SRCREV_meta ?= "b1108273b878547b3d3281f21aba44a8c41ca741"
+SRCREV_meta ?= "b3f537ae33e504d33eeae8149f0c0972d886b3ff"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0


