Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9446CD343C
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 18:08:09 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4188.1762970888694312507
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 10:08:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q6/Zyb5h;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so8379585e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 10:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762970887; x=1763575687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9raCWHB8XYfq9OWAiw0B69mMGE/+joRWIGe79M4vsDA=;
        b=Q6/Zyb5hdd9hd8iAbTKPYJuUIygYOXm3QPsXgyCGdTQPhMQyLepm7N4rta82Kylwfq
         p1zoQF3p6SKRuRUhsaaoU0tyezt7q2Qo3G8xDO7Q6FWqbtPCgCzkhBSE7G9cYRGL69LT
         pSgT9bQNmzn8UJCVIf6hfbOVQA1IPYYl+oUBFiTXOOL649wEm+T7DaWW0z3QOjvkaNNr
         2zjorRTeELJWHDYIxzMwPRs8gW6F3PRxeLSFrN3a5iL1K/QpFCsdaPEw04BcXOlR6AHH
         HVQorI8T1KkanXTzEpWjhOCRn08ruCWd9BTBOrFDA9FOEK9FjFcAvMvyd2sS2wH+a7UN
         0AFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762970887; x=1763575687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9raCWHB8XYfq9OWAiw0B69mMGE/+joRWIGe79M4vsDA=;
        b=SA5K1EqsX3ZkzyJGwSeHDrS6r77Zq97IS+SdbB4rgEJGR3hznFgLRD8lgT6koVORLV
         zjto6Lx5I4UBJEG5gOLBQZlwv4GYisRT3E2g7vzHjTHesZbVzY2b8it7uHinxbodxRx6
         D0W/NoCbzri4kSRFrW6Sorozsenspd5j4xEKagntrO8eOavqWk5i9bQD3OqWnJK6n18w
         /YrCAkwzFG5GsaOZY44fQyO7gOAKwQG6Uh9RiyP3oEFRlYNpMCG/n+94dpHwIZgabWDc
         wBeuFLsuS6Q8e9bnbd5CaDhpvfK7/hKPdKG1So6xpdVs+nA5qPAZH6CROXI3lr86RpYP
         NDTw==
X-Gm-Message-State: AOJu0Yz1MUBVDrgfnLrmH7814z2mn393ZqJS4Ntn+G1OWQmb+lNBni4W
	+S2k88LA60nxy+l1TZWRCB6ImCq6VPBsu/pk9lDPQe97ZvGs2ZNNX4jHwL2Yn5cu
X-Gm-Gg: ASbGncssOT+HCq+/0BKn9c8OhwuawrXk9yAT/B0u+smYGLR0W+3xma3wLm2g0Rm1QhS
	/jSZq+0LaOLrAaKem4Cg9WF8z5wXl5YLv0mc/fyFN/iP/5lfRgyFV0JF4BY2vW9RnfFwnNdSxto
	zUQSFRHKIYJuWNCaxop89oIxStLFemSl6T33EI+nfkfuphjkZx5grF6XajDV650Xcw1hrv2PWH4
	sT7vpDyhNllE/dk1Nqxj4B7AnL0zlV6NmGj6pieYMG+5FO4F7tLvRwjV5k/6toQ1bXPLXTcAzYx
	m5af23jnN65ukXGATYdaLiZVV65LcqH0abl5W4ualL7rS3jcfFbBtkSbKN7qkxmoECHGiObZZKu
	3KbXLz2uQeiyZLWQg+Ul95JNhiIWOut52mQZR+y0Pzv3Iu/KuE7oZUNEv3SrjeBLu3vhlUmaaBA
	==
X-Google-Smtp-Source: AGHT+IHhwyPUEBjw/gyI86Obaj4DPJC2/SJtTgOs4UaJ3BhO/AcdPDIfc0z2rH3MUhCyLR73+DAfSA==
X-Received: by 2002:a05:600c:4514:b0:471:1765:839c with SMTP id 5b1f17b1804b1-47787095e0bmr34982415e9.20.1762970886745;
        Wed, 12 Nov 2025 10:08:06 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e486fbsm45552585e9.5.2025.11.12.10.08.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 10:08:06 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 1/2] efibootmgr: update SRC_URI branch
Date: Wed, 12 Nov 2025 19:08:04 +0100
Message-ID: <20251112180805.773151-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 18:08:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226213

master branch was renamed to main

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-bsp/efibootmgr/efibootmgr_17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
index be6571b3fa..b6d3dadadf 100644
--- a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
@@ -10,7 +10,7 @@ DEPENDS = "efivar popt"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https;branch=main \
            file://0001-remove-extra-decl.patch \
            file://97668ae0bce776a36ea2001dea63d376be8274ac.patch \
            file://0001-src-make-compatible-with-efivar-38.patch \

