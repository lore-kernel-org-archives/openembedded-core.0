Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB0FCD98F5
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 21:47:54 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4351.1763070467919598351
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 13:47:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uVUuU+Zt;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2957850c63bso13485785ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 13:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763070467; x=1763675267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nULNdRKg1KPgcupE9XyamWwY4+DAH5AhhN7zspYR/Ak=;
        b=uVUuU+ZtlBdVPNjagMvhEQYhj2+Z0No8HVF+M7d9WDofAzFkvLZikqnZP0LTqrAThg
         DtRJHaI+bYIedST4AvWkThqCx1Q1eYuRO4nk3vfa2PH7WM5Ee4KKRdaZU+JI3uAscdKL
         JOIwyG/qXcQis26qpG2ACco6lcZxe4Op5lz31pq3T9W9cu3fIpjDHYndBcccioZ/A7ii
         HSvHXdo5SzQK+qIaMh14oX2tI1G7WPb29qY/u7Z9CfPJkUfxa05YcbqxyavEqXuLvdS9
         QVX6wb2PHGHywAtg3vzZFbsRZRiyh3JUgVwgm33FKHH9SaZSrFRxrJJmN1FH7E/IafvI
         TOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763070467; x=1763675267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nULNdRKg1KPgcupE9XyamWwY4+DAH5AhhN7zspYR/Ak=;
        b=aBNvkNsFMcX2t/KnPSOSFuWc546XiM+dDNo6W4UqhT2LfzcWl2WqRp8YotJ2SBCMhu
         zpIbf8lG2HHLT6Ow14oeQSwX35y9lCTO1A5zSc3TRvZQ5IXDApVJP9JnAkqshyUkHnP8
         aye6Jt5gFzazkSJopHgavfp80Ktm9/CPXvER6niodc5/Z5nrbqOg0y8Zx3+jLLwDQ5hF
         CQ5JNvHNEhqQ02lXsoIdDcwpJ9uQMxbpf43+PwSctL2cBD0IoBoP31DLAZFErw8aFfwA
         Wi6bX+1lE4mLauZ3tZjZMUqv50jSFKjIDmmSLKDMmnsigBMpcTupYOnEn8UYUwmPGMEd
         MdbQ==
X-Gm-Message-State: AOJu0YwNHUL+p5Wmusfj29/l/ook/sFXjhYPQtJuQFAa8RsfgXfJ999h
	hixBIBlTpR3h+v46tK0509LJ1Xkb3bvEJkxo8VxkRRyUAcgcNj7dsvNo9xHWxyDfj6wtR1WZzoa
	JjU4h
X-Gm-Gg: ASbGncs9GPHJJiu04TSM30D+NS7RnWzwPrhXMJ4rkoaGesDEW8VBMR6Ych0HJXG3hCd
	4CJrJAwgNnniEyqxxCEMDR/WplISskM0UIOI9j4WR54cE4Gv+T6a5JyEomdWXLp48bmjgXrKYD+
	5izzOMS+aB8vY5sObON/o9yrCDP+ldYqqLuCiySUiC19cU+OKyQ9XO+OtMrf6mJVXipKK4w6UYy
	ak/WM6+koK2ABilh2N+3kAqNV2xZvK3KI0yN1zFSi7lc2nS+3dBXEWb1UfJEHZrHNCvgz1jyWJJ
	0IrKwC4STNnYqZv3illbLaojPE9i2FlhXulXid+WbN1N8onPdBbN2a9dn/UthDPWVCzg652tQ8o
	rcW9OEFdt6ISfAqopfCc9r93pXYkqiL07OdfM/yeEM+vQTTrz0JShb0+4agLXW5qtJg==
X-Google-Smtp-Source: AGHT+IEqys+lNsDVOvXoYpStb+AhQwl9K27z3TOzHvIRUOIUSmOoXpOxGEyfO5nv2ztUBrmGCCMVHQ==
X-Received: by 2002:a17:902:dacf:b0:269:7840:de24 with SMTP id d9443c01a7336-2985a53e5d6mr49420015ad.21.1763070467202;
        Thu, 13 Nov 2025 13:47:47 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:70b:f91f:acd9:f6d9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0d68sm34639815ad.61.2025.11.13.13.47.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:47:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/10] efibootmgr: update SRC_URI branch
Date: Thu, 13 Nov 2025 13:47:26 -0800
Message-ID: <2c5b195e974ac54610d7b50c014752875004b0b9.1763070333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763070333.git.steve@sakoman.com>
References: <cover.1763070333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 21:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226279

From: Gyorgy Sarvari <skandigraun@gmail.com>

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
-- 
2.43.0


