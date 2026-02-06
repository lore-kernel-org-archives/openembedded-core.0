Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6518EE2089
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 10:43:51 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8403.1770374623431496938
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 02:43:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H6w8crmN;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8220bd582ddso1434846b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 02:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770374622; x=1770979422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxhVjaBZ7Sz83ZRhmELgIKDy9HoKv8TndSuBfWOLnHI=;
        b=H6w8crmN/Oim0QPQAoLO/sSbTY09RFPuWn5LfoXVHkeW0t7QWpCr2ul/koPOMHGfk6
         I3f4h6H0BkAA1YIMzZ5MqxrzLdv6oYh/5KJh/Jm9pnQnENwtCUJvsJxkUnTUxUD9qY1b
         JIwV4wLuCAu8JEMSr0XVRz9irb+lN/rJT7lac7AiI8Y5suJfw0h1Dzor7gKg74WBNBDW
         +tdbzVJ/TBH7YDndX88f/6TG6Edorzs/bJfSpBPFC1O7wGBvGtwlFUVjOy7GBhGDqAoB
         +W4RC9NYaZDoVL0EqiIJcxZu6zqRvPwzsHj0zuf2jnwko4ZbM8ueVtxIsLWNyOCSxq4X
         bVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770374623; x=1770979423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pxhVjaBZ7Sz83ZRhmELgIKDy9HoKv8TndSuBfWOLnHI=;
        b=bgZnYZ3j2DzbRnBRmZxmnOlV65KmF+wsndQnHSZaQ8QvDybkgYnKeSmX9k/ygjdoAi
         xv5e3C8WreHughF1oWZMqVANmOfgzUuhTOZwyi4h21OjZTuhH/uaJGbXzqBHcQoTkB5z
         sbfaia2Ozmk0iH08jkNfFNXZ3bZGyFkNKfxWGMzH84IKzjtmO2Bf/jOvX/9nCUmQ9lPZ
         /NKoJuF0kWk3Xv0NaKPFsB/vy76Nr9G5dSZVXlbKRonRNjsbEsuPmJhKKevBPQpWn2tB
         35oS5z3mxxlo2GWoPzPCN6l2d8bgrhAUEmD4K8SposLZ7K9n7W/ZgHl7bXAL3R/QHn8C
         sk7A==
X-Gm-Message-State: AOJu0YyOAboOYvvBe9Kkp0rxHPa6wAhREfoatYp70eN005Qv9aE8c+L1
	kETKgPRjKdq1O21wJUJ9sp5LBUHxcVz3Mh5udODe62hr47UhWLQ42nIHcaVz7w==
X-Gm-Gg: AZuq6aIcf4+iLBy7tZW+5KxwStGoUjh0c2qXp3DILJj9Dr4CH/yKb1GYcMdADsUQLg7
	5h+6PuOtD8q5UIdSixNKDO8CuCtG8JcKd8cYWo80hwXCQv8/iZ3cpR8UG8DP34r5pTxp3i2+U5l
	JLtOs6pT/jKDmjzmXS+Ct3dlfkraijK+36XK0cIvnl46swHQJ2UYNkqTmM7lCU7kkM8fAaxqoV/
	kKNdHFfaGxiUdPuukGYmT+wiRI/RnntYryrVlYnmTwyZVQDoxgwtGdWTk8JAvXX8y/sBNR/Atwx
	izKmsIzBFGjjuLNYCgKmb0tMDzDSgGQYEEwpoCdyBItLwb/+2zLKWYqzGW5G4A47Cn2cluq/NU9
	/mg12SjuhNt8/USLyiyochRq+NinsbkY/D4Mpf2xD4cbdUxDFPkJFEA8ADdM1GA0lJ2tEc6KEtK
	GitZkc6jWaldJv8O4VHj1iki8=
X-Received: by 2002:a05:6a00:21d6:b0:81f:5263:eeee with SMTP id d2e1a72fcca58-8244163c349mr1640684b3a.21.1770374622478;
        Fri, 06 Feb 2026 02:43:42 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418ff231sm2374434b3a.69.2026.02.06.02.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 02:43:42 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 3/5] mpg123: upgrade 1.33.3 -> 1.33.4
Date: Fri,  6 Feb 2026 23:43:20 +1300
Message-ID: <20260206104322.2604271-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206104322.2604271-1-ankur.tyagi85@gmail.com>
References: <20260206104322.2604271-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 10:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230605

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
mpg123: In terminal control, ignore 7-bit escape sequences to avoid spurious actions, e.g. when hitting cursor keys.
ports/cmake: Avoid possibly conflicting use of SIZEOF_OFF_T CMake variable when embedding mpg123 with other projects using cmake and different off_t semantics.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mpg123/{mpg123_1.33.3.bb => mpg123_1.33.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.33.3.bb => mpg123_1.33.4.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.33.3.bb b/meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.33.3.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb
index b1897fe95d..648eb21500 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.33.3.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "6a0c6472dd156e213c2068f40115ebbb73978c2d873e66bae2a250e2d2198d26"
+SRC_URI[sha256sum] = "3ae8c9ff80a97bfc0e22e89fbcd74687eca4fc1db315b12607f27f01cb5a47d9"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 

