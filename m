Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66ACC369BA
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 17:00:25 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.24869.1744822824102160706
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 10:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aJnvBlrj;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22c33e5013aso11951295ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 10:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744822823; x=1745427623; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4B6qLktscwJn9AuyWyJbKMsLWEFLvffBJT+iyhKznZY=;
        b=aJnvBlrj/CzObAaPEoJ1007Bb/2QkPvCFMf0fr/mda29Js54ORWozwqMg57mX/oS1Q
         Ctx0aBth0yJ+BFOOnmURcXQO8XEs+39D0c92kwaQD8QFa+4iR4sH+BSisZkkQB3aa754
         sCdtGeiyuPFlkwKO1fxSXfQeVJn0EaanWGq5wwvoC2bl6VEoSTxpgmb89pBsrKKcG/aZ
         5oJSBydZk9PerhvJv4peT7om3zwdR45i5vlt+7jDCOtCCOJ4Cm5HPiyJCYqbyDfJo+RK
         q8dJy3GThj4kpGbBfKB0UJmmghXJsxW3KR8jjRDSRssrrOOsd00yiMhbZ4D8LLONVP3K
         ZawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744822823; x=1745427623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4B6qLktscwJn9AuyWyJbKMsLWEFLvffBJT+iyhKznZY=;
        b=qqcv5xUPQMafQ5MPxiuxcaq2/p39FKbMui/BYoMrjZJd0Xj7GRl6iWHv5EEXg3w+Ko
         pGTmYm9QAcvthHRbjBb0eBVvOTrEdJmh1KecZpxSyIMmsgc0cUoiZaDKW9fN4Nxgybfq
         Oi3dzW/lRfiXQrxKHptz24rk6U5scqBhEVOGtKLCH3AAa8SIPwL9lBo6Fhg+hH2vv6xp
         pzIzcWcQUoqgNrHOY7wdq0L96mpJ5QvAZrFWKmMjXssmmZN1lwvu7M0o79wgqPGp8h++
         Xd90jgEYipMljSMT1HNPnRDItyMgEXdOwH/8quiM5E2FmY0KL5moaBmanAMYneflVysH
         +T0Q==
X-Gm-Message-State: AOJu0Yy59DLJWMJmBpxPtwbIJtfqrMdkZuS3QGZbujLu7YQP3VO25ue3
	fq9dvm59nonTvfCXd7aM1DaoYPfu4W0Rz1t+SYLqDw7asrXiyxvffZlYYJpO
X-Gm-Gg: ASbGncuWeh0WOeHlQyyHJDOZJnW5jgkgHaP2hDuBClQq0wpvYiDQlL1U++dYza6nDLn
	aH6AAOdoIVFFtdAF+RwVwKNc438qHoVByZQgQweOgOD+c9/GTAypeIH+shTnMLGQ5nWBg0N2jQo
	G+l+aqmfvtfAExxp2M3zHcxcq0yh1nBPc1xx8ysGey+y2PVwmgmB//0mNGlgBQh79hiKxY40c2C
	o3gvt/zM2fuDKaIKUDdQVsjGcyaGRo7j7ktEEXgy2i3zkN2sHiEtG8+IHTMu5FIzY/yphNwpRRD
	7WRmxJ4FBnWQZvwTg9UB67pfo3ghPr1oCHlK+W2Os+Q=
X-Google-Smtp-Source: AGHT+IGiNC7/rBGiXvcXYFByqvkcBaF14XYnGqzeT4FYa8cIUaODEl+WiPZ2VSYoNHnh+K7RX9z7IA==
X-Received: by 2002:a17:902:d4ca:b0:227:ac2a:1dcf with SMTP id d9443c01a7336-22c359112camr36393665ad.23.1744822822666;
        Wed, 16 Apr 2025 10:00:22 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2199535sm11015613b3a.14.2025.04.16.10.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 10:00:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] python3-pdm: upgrade 2.22.4 -> 2.23.1
Date: Wed, 16 Apr 2025 10:00:19 -0700
Message-ID: <20250416170020.2259697-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 17:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215003

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/{python3-pdm_2.22.4.bb => python3-pdm_2.23.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.22.4.bb => python3-pdm_2.23.1.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.22.4.bb b/meta/recipes-devtools/python/python3-pdm_2.23.1.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pdm_2.22.4.bb
rename to meta/recipes-devtools/python/python3-pdm_2.23.1.bb
index e6f35b3c7ac..acab401392c 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.22.4.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.23.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "8483f3d2285039cea7e07c5ba6ac7e1fcba358129f8831fb75065a797d27b923"
+SRC_URI[sha256sum] = "cf12cd2201df78a6543a5485ac1d7015a73b3a6b10c98b66dfae6ebd481386fe"
 
 inherit pypi python_setuptools_build_meta
 

