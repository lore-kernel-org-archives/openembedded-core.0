Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD599C54E73
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:33:57 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.2045.1710351229959679935
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i2Wt8vaG;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-413ef6908ccso627635e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 10:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710351228; x=1710956028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7H6miMHeC2ViNEMcOOnr/5fYnkRrHcGRi1jaCP+XnI=;
        b=i2Wt8vaGgflfu+r+Wqhtt8RsaaqXhz+5OO2ND+t7eK9kajc7S5JWuvtozYKIA2+YAG
         zEkemp29JHl8c2/la+btUgMfsnrlohIQMwPA6tQvXMq8SXCJIqTBaPvbI/jCNJkOvK/4
         SAQyXkFZ2C44gONG7e3kpPOruO1hnyPfvzrDkZd1qiwCVLcQhDH6ljJ4dvK+sqJEWgvO
         uJ1FzOOeCRdlwxsAM4zV2wrLiuJmlIR7t/pl4frfROIZh+R7oaecW66kjk3REWDw/BDW
         pOEQJS0aCWmvWzyoL52xI2dwQRUBQOiP2TFjMWKltUHYUwv3uwQMxhFTz5q2Ts8CNolQ
         4PmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710351228; x=1710956028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7H6miMHeC2ViNEMcOOnr/5fYnkRrHcGRi1jaCP+XnI=;
        b=Qio+Fq0jcmvgyTY1zyPCwLTfbiHBTDhByetxWElDN4K/M0fydWTWs/5rRAZWu6wx+d
         eJB6EtQi/EDSs2bJG7sSGBKMdk0UzTvC3kcSpgOk9vbRMaWJUkHIhCFPIsDORwLlNicP
         5JhbnOKO3GkymdTWZPSKoMklVWQYlWPbP6gj1qqy/pWaiT2YXz6YkBXZxzDa9RKBiCk6
         GgTeeCeMlhPA2lLTU88YBT4mGJH6RkSJU1qc+enln3kSRRXpi/KTs+XzUB0P81Lqh0UO
         OsRRIH88e4B9ZXuNy/OhsrwykxWKSWjCobt/NjnkYFL2REdr7GdKoReX94ZUR4oOK4w/
         07xw==
X-Gm-Message-State: AOJu0Yzd5Zf5KSazxWlPhsDA4oGweIpxtFIQlgFKcnWMKyfz/Y2/Oim4
	NjfDv7BICQlPqQAildGlmyudqMTzeqCJxcWQ7GEqgaY8skZGgoPKlZvsmSmx
X-Google-Smtp-Source: AGHT+IFrKqHOFsSi89zzAJvWaUHPR8FiHsxn+O/P4mp4J6VJciMMLZJXpfC36WIWeJTHEiVjUdeTYg==
X-Received: by 2002:a05:600c:500d:b0:413:286c:5de2 with SMTP id n13-20020a05600c500d00b00413286c5de2mr406496wmr.40.1710351228414;
        Wed, 13 Mar 2024 10:33:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c1d0500b00412ea52b102sm2989710wms.34.2024.03.13.10.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:33:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/21] python3-lxml: update 5.0.0 -> 5.1.0
Date: Wed, 13 Mar 2024 18:33:29 +0100
Message-Id: <20240313173336.3900178-14-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313173336.3900178-1-alex@linutronix.de>
References: <20240313173336.3900178-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 17:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197066

Upstream issued the new version in .tar.gz format, so .zip
setting can be dropped.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-lxml_5.0.0.bb => python3-lxml_5.1.0.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-lxml_5.0.0.bb => python3-lxml_5.1.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-lxml_5.0.0.bb b/meta/recipes-devtools/python/python3-lxml_5.1.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-lxml_5.0.0.bb
rename to meta/recipes-devtools/python/python3-lxml_5.1.0.bb
index 66cb8b09383..43719086f08 100644
--- a/meta/recipes-devtools/python/python3-lxml_5.0.0.bb
+++ b/meta/recipes-devtools/python/python3-lxml_5.1.0.bb
@@ -18,11 +18,10 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "2219cbf790e701acf9a21a31ead75f983e73daf0eceb9da6990212e4d20ebefe"
+SRC_URI[sha256sum] = "3eea6ed6e6c918e468e693c41ef07f3c3acc310b70ddd9cc72d9ef84bc9564ca"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-PYPI_PACKAGE_EXT = "zip"
 
 # {standard input}: Assembler messages:
 # {standard input}:1488805: Error: branch out of range
-- 
2.39.2


