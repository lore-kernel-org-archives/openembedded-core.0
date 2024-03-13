Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A8AC54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:33:47 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.2083.1710351222030657547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C7YfhQQX;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4132f37e170so664185e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 10:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710351220; x=1710956020; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G5yDHwKktFqQ2oUwgqUl1nNxAgNQzEAwuC1dREOo8jI=;
        b=C7YfhQQX1Ib1kpw0VItuwwsh8N2uOD7w7wSfSHiSiNOmpJqy8W6n3VM0Pe+tQRFfHL
         +oWrhV8BXc/z2vGHPtTLfmw63x8oL16Gq0p8b5vlZ9v/wf6eK0omxb9FqiDf5Sn2dJ0v
         60ABM5ObE7rSy2CsSJ0hJw0I60r2UWHUE0jdu95gLEoWRzTS5qqnk7hv71WnL1MtnHIg
         2IrRubCP6CqYYZpOTlOG/hkAaGzH/JzYhoXD0zzlKz/Mv3mIh+av0N2wtyvC1V0N7HX5
         HcuRnAJ+sZ+5Hqri1aXRLe2QT56nGpCHt4T9ZayWbBtpscOMjvTlBlCP4r599dKN0knv
         kaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710351220; x=1710956020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5yDHwKktFqQ2oUwgqUl1nNxAgNQzEAwuC1dREOo8jI=;
        b=A7bBv+aekDKoUaf5rTirZPHxZpxmTTtf0Izv8DEuJ+VLRSa7sQdj4LLHnHllG936Gq
         ukkOdeIgznkfbznwjnanIH7WhZzmoBOn96VngmPfMDIuWMOTCWEqqVBke1HVc8DE0Wuk
         KSOt/NFacMlGtZXqkhXJgbWEtZYHYPmbwe5h2oTxTVg5FANm7CsvxPGUTdKn8Uc14j4S
         0WH+zR2j2tDH7Dqb2GoHQuAageMVzvJtcb4RhZR3VZxK+vyucndEnoR1McTOue5WgFxU
         pszxH1QP+CkcOm/PVK+FgFgy9ucFZQqI78ZlT7wGch56uzLgsOIN19IjEs9H7aFJ8ONa
         pAAg==
X-Gm-Message-State: AOJu0YxtXgVOvVSat4a/uPdknaIv7QhsAMC54LyFkDcZ5XK4EzlOoVCz
	IUPzIya2L9/+lE76a0BcWOglbPPYo3M7PyGeK3czgoKqbOFkIEoebG+NxxmQ
X-Google-Smtp-Source: AGHT+IG3Ojx4g6XIVlRrGBohsaUh4SB1h2szWTlsBsaevhPFWkQoXcCCSwktSn80zux0fsN+Q8YF2w==
X-Received: by 2002:a05:600c:154b:b0:413:ef80:58d5 with SMTP id f11-20020a05600c154b00b00413ef8058d5mr135336wmg.0.1710351220213;
        Wed, 13 Mar 2024 10:33:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c1d0500b00412ea52b102sm2989710wms.34.2024.03.13.10.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:33:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/21] meson: correct upstream version check (exclude pre-releases)
Date: Wed, 13 Mar 2024 18:33:16 +0100
Message-Id: <20240313173336.3900178-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 17:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197053

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/meson/meson_1.3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/meson/meson_1.3.1.bb b/meta/recipes-devtools/meson/meson_1.3.1.bb
index 3a4bb14f09a..9cc0cc31ab1 100644
--- a/meta/recipes-devtools/meson/meson_1.3.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.3.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
 SRC_URI[sha256sum] = "6020568bdede1643d4fb41e28215be38eff5d52da28ac7d125457c59e0032ad7"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
 
-- 
2.39.2


