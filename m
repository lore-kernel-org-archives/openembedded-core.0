Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CE2CCFA05
	for <webhook@archiver.kernel.org>; Sun,  2 Nov 2025 08:49:33 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6881.1762073373333963968
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 01:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Co9fULE7;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7a9e8a15502so348291b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 01:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762073372; x=1762678172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23j8EwX2PUcQ3OhBWZBMob7dlweJb8oEfFdu/xaKtdg=;
        b=Co9fULE7a8V7vob+eL9jR04xFqbeV0L1EallyOnlsiSclL+x7jrpDa6HW6JQlVmhT7
         /ox28x0V/3DjcxxAZZfRKe2xBRRvHdg73WbSrUGUlyD04ggdJ56C/eM05+G89a8jFhQ8
         yRCOqNt5hsnJh7MPUzNQw1GmGlsWUCRFaVEiiCWHOSwY4TMEct5vQq5tlSea/VKXyKTk
         C9bXSKeFibHOIh8+m7A+tdIKXiNiiIKukPQ1ufAmR06h8ptrBwieH9rz3K0ORu/G8wte
         OPeo1gwF35/kLisP3AXvQ0Dn00hYvqrpbPbyYMPbdu3apNcBhQf4opS8H1RD/dEI1Z/4
         kktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762073372; x=1762678172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23j8EwX2PUcQ3OhBWZBMob7dlweJb8oEfFdu/xaKtdg=;
        b=Qr9dCgR2mBerQrvx16PwB3aRVVbta+s+VwBd6RlEYz58NMgZNtLvWXHDUYwdmeKaNt
         gperS+CuszLv2SVQmkWWjX4FH8PvYg+SWHP/p1drB4i4kJkN+pGCWeE21XAM37hj4pxE
         nurbyG5N8kBOIEJVFNPFEGgCL5K88OsZ3ju6UKCCjXU18JFdDdKI6hzPBwKswWEJcf4u
         B+RW4M8835SvHvLU/pVMp4771x/FoJ46PRjqFGa0+EPJzC1qUQTDFLrkZjPNKSmQ41si
         YgbxpiT4grlg6R26MYh+AIzBr98Q2079wNucIrbnCFpq4zBnJ2s7XNBcQtFY+zhBceYv
         9yLg==
X-Gm-Message-State: AOJu0YwjClBuKvWfAbwRonULK/UyS1TYhscRbJTQV+luej2J7loDOb8N
	5j6WPbiIBDoT2zYrdkeZwX2RtI/OENdNiQoess1/8SsOs27XJnSG6uboKmTY8A==
X-Gm-Gg: ASbGncvrbFwTuvdhqQ3BNIsu1EBaXk/sC8wDRAT3ZXKkZ+6JPyyaSvaR6rb0IDSpWIQ
	QTB01cuXKdoY1eKsTlQAlmM7Fwzm4JviP4IOA20/aB39nEVcCyb3ewF2yxyUXo49FzaV9COPvQb
	dPTrD9Qp9klbaMEqrBSlm/+mpL7cqPr6b415FYPa7/Dd25GQDIJejh8f5Jiap2d3kOGH7x+WXPn
	IXQFK03UOHIpEhmqx8Na+0dOSCe4CprolNYe+WMiQydI4u5Cxa8xTcIDPvGYBmuZSKLooa+AZEt
	z9yJIhAJLMeVLADraceKOXSko+m6junOgcg98FMEdJa0noSVMLRTVuiwsHlJPEtMVAv/TETh572
	2ckFPis2mJwasYATndJO4qAN4YuBNKMacoWa65zwq66pTz6+xjS6cjYh5gYa1MPl0OBm4BK0yGO
	if5xf2sTV/FFbl7g==
X-Google-Smtp-Source: AGHT+IGccz2jYkpnKwcmD0yE87SQARE1qqY4Q1Mo+DH5d9DOkFJJTuOjJOLPKLt48/IIVfUGoHRAhA==
X-Received: by 2002:a05:6a20:3d86:b0:343:70a2:bcac with SMTP id adf61e73a8af0-348c9f671fcmr10507188637.9.1762073372573;
        Sun, 02 Nov 2025 01:49:32 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7aaf449e8f1sm113891b3a.11.2025.11.02.01.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 01:49:32 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 5/5] harfbuzz: upgrade 11.4.5 -> 11.5.1
Date: Sun,  2 Nov 2025 21:48:55 +1300
Message-ID: <20251102084855.1555197-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251102084855.1555197-1-ankur.tyagi85@gmail.com>
References: <20251102084855.1555197-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 08:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225572

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/harfbuzz/harfbuzz/releases/tag/11.5.0
https://github.com/harfbuzz/harfbuzz/releases/tag/11.5.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../harfbuzz/{harfbuzz_11.4.5.bb => harfbuzz_11.5.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_11.4.5.bb => harfbuzz_11.5.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_11.5.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_11.5.1.bb
index 9e0e42b717..08b72190ca 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.5.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "0f052eb4ab01d8bae98ba971c954becb32be57d7250f18af343b1d27892e03fa"
+SRC_URI[sha256sum] = "972a60a8d274d49e70361da6920c3a73dfb0fb4387f6c6811906a47ba634d8a1"
 
 DEPENDS += "glib-2.0-native"
 

