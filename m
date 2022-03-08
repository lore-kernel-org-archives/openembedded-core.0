Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965A5C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 15:53:00 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.9752.1646754779834927192
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 07:52:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gcykBBe6;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id s42so5075249pfg.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 07:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t8xwW6YBNsrNQ3tbtFZ1pqCpXR1F43dKW1bx+zIqpeU=;
        b=gcykBBe6tJ/gWjGVIGkQQQ5XsX5PwMBPFHe7RudVSxsa2p9YAWQVPFhZlCfJQydAeS
         YicYU8YjTnGntxW7LBeoi5gSTa/nLZitqU9LjtIjSmjWPxN53I9pA4MLorIoJB8uX4pZ
         zkUc+5OiC5yLhgtTewjBn/XFwn608KfIDbKgIwsnAf5gvW1NvfJUErpsNW0zXlk8MU2T
         ztly3QA76sGJUYN/cwFVImg7lF+IMYfKKLw8d2mBUjmK+g7t0PxgqbgMYkKII8TdCcYz
         RvmlFE00NfoKa2ydvUlA8fm/bNU7MYIJpaGEjn+Mo0NMEJjUBdj2ZL46vn55x/+oQOqY
         PJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t8xwW6YBNsrNQ3tbtFZ1pqCpXR1F43dKW1bx+zIqpeU=;
        b=TAAkt7Jda4ayDOAzIniDt7Y/maRiW2gf+aMUbtlw7PWc3oIV6SPRzdf2OUkYN2GuGD
         w9b43bh51hIIRedFqd8s+wU0gKkcS2zsXIgVHEaxt8ZZ1t9ehaYVYqFmp0u7SDKB6L1q
         i/Ohfm2PNFDbRiR1B4CLpL1hz/rvlOFhd6VEklRUcCFJwjmy0/qwyii4qHNVg0cTTOTX
         flpFo9OzQNvGLo3ymKgu5Oh6njNFlornlgj9l5NS4fVXLQJgYTPp+viKvbV3RYeYg5OW
         PkCIuAeBwMpsDELtgRD0PlHcMrd3uyHM8BRyDo9sQWRJmMOqL/XInQtK4eoOYkT/kTgX
         7pVg==
X-Gm-Message-State: AOAM530UxjCl3+vOGAkH3jIld5zbjfuGT7ehq3McCleuquPJDKZJ+2Hs
	zNTRmIVX0aOvZvYDAwJ5rtjs8yyYmlS06w==
X-Google-Smtp-Source: 
 ABdhPJzMU2bUZLySfQk1BxaifHb25EHDfGT/3hVCugDF7/95hs3hyuJyqM89V21pPXuSVA2cYnTCFg==
X-Received: by 2002:a63:5a4a:0:b0:380:260d:47b0 with SMTP id
 k10-20020a635a4a000000b00380260d47b0mr10764885pgm.45.1646754779158;
        Tue, 08 Mar 2022 07:52:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 o1-20020a637e41000000b003804d0e2c9esm6559106pgn.35.2022.03.08.07.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 07:52:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/5] webkitgtk: Depend on virtual/egl instead of virtual/libgl
Date: Tue,  8 Mar 2022 07:52:52 -0800
Message-Id: <20220308155252.2454464-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308155252.2454464-1-raj.khem@gmail.com>
References: <20220308155252.2454464-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 15:53:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162933

This ensures that platforms not implementing GL ( perhaps only providing
GLES ) are able to build webkit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.34.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb
index 52cc185eb33..8cea8a86000 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb
@@ -60,8 +60,8 @@ PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/lib
 PACKAGECONFIG[geoclue] = "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
 PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant2"
 PACKAGECONFIG[gles2] = "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
-PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/libgl"
-PACKAGECONFIG[opengl] = "-DENABLE_GRAPHICS_CONTEXT_GL=ON,-DENABLE_GRAPHICS_CONTEXT_GL=OFF,virtual/libgl"
+PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/egl"
+PACKAGECONFIG[opengl] = "-DENABLE_GRAPHICS_CONTEXT_GL=ON,-DENABLE_GRAPHICS_CONTEXT_GL=OFF,virtual/egl"
 PACKAGECONFIG[opengl-or-es] = "-DUSE_OPENGL_OR_ES=ON,-DUSE_OPENGL_OR_ES=OFF"
 PACKAGECONFIG[libsecret] = "-DUSE_LIBSECRET=ON,-DUSE_LIBSECRET=OFF,libsecret"
 PACKAGECONFIG[libhyphen] = "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
-- 
2.35.1


