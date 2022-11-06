Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB9BCC433FE
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:31 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.16727.1667744306937325343
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:18:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=NPTGcSf4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id io19so8913307plb.8
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9TEBbcuC6pY4JDBnByQ2zMxkSU8E45pFJr9ZCevqw2A=;
        b=NPTGcSf4tuxZH0PFJ61Q8vc22+O+LILMndbfntpRSNGiVFjcD8zca6/71AKFgkikwy
         ZNiI2S3K/BcpOOrOqQWJ+bmAsOY3D+bX4Tf5qSZ1Et4Xo7rIaWCVUO8cb82b4NT5DZkM
         zWhjZWZGj7h2sOTSZF/t+V1Mq2RnYaxi3zhlek7aJ+TTU17AlQ+rsPkJWkdtHfAuszJO
         LwHGzL7PA0BgsLomreORbq2xxOBqw0XNX3/6YcHnqjlcKQpVX5Y9OBXeam793wm7B9Y1
         Va3vErVlyJPRtvZKeEth5NWYgiF3CJCc5vowBNbRedJ6J2lF/sbj5NvxPgXO+1AYwXeI
         cXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9TEBbcuC6pY4JDBnByQ2zMxkSU8E45pFJr9ZCevqw2A=;
        b=zGhEhI2yqdUxGh18Vxkq55qTS3n5HpNJzZg/+dLJjHoksvq2M/cksevRt+4K0Raz9b
         9D4uJTK5M+Kweh2fG4aG6oatjZQrbRC/yLHV79XKTq0OY8YYdboElb0FV8Sq23taByVS
         XtrX4UTJJBQqCHZERro/oGwgi83yXnggfx+nLAcsGnykrGCc2hyEKD5EKHhoMVbwtG+5
         k54msPoWqJbY2Haqt0FJDhY+e7E2J+fiZbQyjdUCaqHvNGmH/0ry33bjxmXX0xA4e/1U
         aw6Xa0rj9HP3Lh7/ix/40I7xJ87lsMsvygDpLwXGjp96r66KoQ931aJUbC/5g8IVeai0
         bXFw==
X-Gm-Message-State: ACrzQf1xgiq0i5YSJSF8koPp4A4uWZdn3L0QDDOqa5ivI/kdDmL9d9Aj
	e/6S/g047dpmrXsYQ83cxF8M99ngLFznqp85
X-Google-Smtp-Source: AMsMyM7XG2RlH4pLh4lgeXlDHBKhN2WWu0WO6JIrhSSdOfhHUKegn0v47nVTQABBZ7QWLXaY1OvX2Q==
X-Received: by 2002:a17:90a:3e85:b0:213:36b6:fa16 with SMTP id k5-20020a17090a3e8500b0021336b6fa16mr45541291pjc.56.1667744309750;
        Sun, 06 Nov 2022 06:18:29 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.18.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:18:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 30/34] kernel: Clear SYSROOT_DIRS instead of replacing sysroot_stage_all
Date: Sun,  6 Nov 2022 04:17:13 -1000
Message-Id: <d9081df0dc62f733bef643340af678eeba74fe89.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172798

From: Sean Anderson <sean.anderson@seco.com>

Replacing sysroot_stage_all by a no-op recipe makes it difficult for
bbappends to stage files intentionally. Instead, just clear
SYSROOT_DIRS, allowing other bbappends to easily add new directories.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 849791e7086463a4c7c53c2c1ed9603a6c3a080d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index e4e69e0763..7bb3449223 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -594,9 +594,7 @@ do_shared_workdir () {
 }
 
 # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
-sysroot_stage_all () {
-	:
-}
+SYSROOT_DIRS = ""
 
 KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} olddefconfig || oe_runmake -C ${S} O=${B} oldnoconfig"
 
-- 
2.25.1


