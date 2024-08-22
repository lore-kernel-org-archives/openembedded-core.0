Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE772C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:30 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.9383.1724319328244843224
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fXeP5I3g;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5a10835487fso1077390a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319326; x=1724924126; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Acfg8ykXMkwzP0vk8dXLMUKxEOTI3SYYcmeSczooGMQ=;
        b=fXeP5I3gaFcZ+A3j2Ajb/1bt+ALNcovHqdR22BkrJswfMifqmMRXOGIBB9pAk1UBte
         hNgV1Jv/SqMuIMdFIuTWqM4SUqML/aIUmuXUTJPUj4KVqB3rJ9iXULXdIIdMZl1yLRN6
         E4X/xdTZsyvuWhp9jFvaF3cRZwsuAs6c6hCuYvJVHILqt408P50shvd/DGelR/WOiUqi
         127Px2FknYIq07omwaXJL+s5bS2gCeA/ZgeSRKNed/4kBZva+yeiezhcw6OobzlLEwxL
         BxHsz3v059m46fG00KOOUv5THnrD/bMgH7Y4ItrhA02DSeoIBt6TNGEFx+d+1T80wVm/
         GKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319326; x=1724924126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Acfg8ykXMkwzP0vk8dXLMUKxEOTI3SYYcmeSczooGMQ=;
        b=boaNG6s/r2TP6E/lpXEOs5HY70wO7hW/G17fJai2Zues/LOmR/hF2C4404KK9/h8BT
         E78N7Z3efsmpyLr+Qjj0K9dl8FDztGyJ4I+cP/CG/T+GFnY46fdOrcWpwVtm49FPrajG
         +zf1DK3JE1d+a6Flmdq3etfsIZwoNvV5M0q6JVw+fejlSZGhR8R9p7MD8pBhBxZ2wFuV
         lK3CbgBKTUCgYdOXgLAWNhuahz9hwV8A6a0XZirZOlyCVJ0pzoeYqbmo8s6IxVzeFKHe
         u5G7A7ATHgIlk+S1lAsNESs5LS80G7TKoC1YEWEyv0Q65zW4LzcWUO6kMyTJgtgvV+6f
         Nozw==
X-Gm-Message-State: AOJu0YxmEvZ5peBuSFUkDhff2hn1Z/e1to9tcZ58jQT2Cnj223Dcgg/i
	LmMnXXuK5ffZ91OgI6G7rWMDsEuzss7Hc4IHkV/2neNodafBMk2CrwJfKw==
X-Google-Smtp-Source: AGHT+IElwVNOy2fIGSuma4R6ALn2Pc1xvW+v6On6EOurB8yMcfwkd2ioEw+QYZi9Q3xrXd5Ngj3nDA==
X-Received: by 2002:a05:6402:2084:b0:5b9:462d:c538 with SMTP id 4fb4d7f45d1cf-5bf1f0b4f96mr3634748a12.3.1724319326003;
        Thu, 22 Aug 2024 02:35:26 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/32] mesa: set PV from the .inc file and not via filenames
Date: Thu, 22 Aug 2024 11:34:50 +0200
Message-Id: <20240822093521.36790-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203616

From: Alexander Kanavin <alex@linutronix.de>

This allows automated updates of the recipe together with mesa-gl
variant, and avoids having to check that update submissions
do include mesa-gl file rename.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/mesa/{mesa-gl_24.0.7.bb => mesa-gl.bb} | 0
 meta/recipes-graphics/mesa/{mesa_24.0.7.bb => mesa.bb}       | 0
 meta/recipes-graphics/mesa/mesa.inc                          | 1 +
 3 files changed, 1 insertion(+)
 rename meta/recipes-graphics/mesa/{mesa-gl_24.0.7.bb => mesa-gl.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_24.0.7.bb => mesa.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_24.0.7.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_24.0.7.bb
rename to meta/recipes-graphics/mesa/mesa-gl.bb
diff --git a/meta/recipes-graphics/mesa/mesa_24.0.7.bb b/meta/recipes-graphics/mesa/mesa.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_24.0.7.bb
rename to meta/recipes-graphics/mesa/mesa.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 973b7621357..4cf7eabbb06 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -24,6 +24,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
 "
 
 SRC_URI[sha256sum] = "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"
+PV = "24.0.7"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.39.2


