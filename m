Return-Path: <andrey.z@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB27FC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 14:17:47 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web12.291.1645107466757686451
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 06:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K/JoB3J+;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: andrey.z@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id gb39so7690401ejc.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 06:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=beIWUy9Uy+jhKg610Z2WAITsmQcuoSw4FTeVfOxA8N8=;
        b=K/JoB3J+BMtOSsufTPI78qcWncGIvXYCUO7ZoDemMWzRH8zWu58gA+z41Y2GVsMODj
         RUlUr2DOE0uXeKUbuHw6KiZqvxxI/8EoCR0fFIkudKDy307oxQ+3i/IMOVz5KP561v9r
         EMyyipV4A0E8xObescs77e4uvyBiorIr/x5eFidphCbvl/mrNI6rLVsSNq7H/8iDPE6f
         SJdhDlayvlpHCwHwIHxRdT+M0XwSW0cuOUhqiI+7QfwWuKCovytg1tftQ2JvdhdA141f
         oxXRoQDrLzC5UKInLcHdZyppOowNbVkfydqFzMmOzXr3Hu5aNXvDzWXMhmtycq/TrVRS
         Q1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=beIWUy9Uy+jhKg610Z2WAITsmQcuoSw4FTeVfOxA8N8=;
        b=x4rA/LuN3OGoDiQHbZ45wWMjKmqZCs7xASavpP2chEhcLOsFHCtJDuNi6dZvt23XGN
         zt4qHUg4V3GM5dg1lDrcGlhg+gJA7haQgBG5yGvP3ApQIfGNMS+xrRo4vEUf0HQ+ef/0
         ErW2cRXQHF29+01QG2D56XU/qEirvAtRpOSfWP3FImcWhd4LPlR5gB77z/xJ7IQRGJ4L
         +q4rWlWRH91O+4nCHQlLPKmFNpklzNSqc6hYHjr6yXvcWjweG7o8n7h6go02S5FZXVC2
         Oc6tbV5zFQxmiknpwtG0YfN8YhNOozwgbwJ+48bTVrFTLxHZ9+NwYaaOl1h8fFIRFHpK
         6/+g==
X-Gm-Message-State: AOAM532h5KWpjMMk/aqLtU8mw3WwGDasT72eqxj34lRAwEFeWlmhFC8j
	MN+tdGEYlVqJ9LeiaLma05DC0SuDDsg=
X-Google-Smtp-Source: 
 ABdhPJz5RD/gLsb5yR90zUeSuR1734xPgfKtqyLzoWodpV6MXMkWaptfpKBDGJFE2wdJV9/DqGo+Pg==
X-Received: by 2002:a17:906:2cd0:b0:6cf:d02f:303b with SMTP id
 r16-20020a1709062cd000b006cfd02f303bmr2664054ejr.650.1645107465060;
        Thu, 17 Feb 2022 06:17:45 -0800 (PST)
Received: from aherlnxbspsrv01.lgs-net.com (ahersrvdom50.leica-geosystems.com.
 [193.8.40.94])
        by smtp.gmail.com with ESMTPSA id
 r8sm3183237edt.65.2022.02.17.06.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 06:17:44 -0800 (PST)
From: Andrey Zhizhikin <andrey.z@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrey Zhizhikin <andrey.z@gmail.com>
Subject: [PATCH] waffle: add wayland-protocols when building with wayland
Date: Thu, 17 Feb 2022 14:17:35 +0000
Message-Id: <20220217141735.3776221-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 14:17:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161799

When 'wayland is selected in ' DISTRO_FEATURES, following build error
occurs during do_configure:

| Run-time dependency wayland-protocols found: NO (tried pkgconfig)
|
| ../git/meson.build:120:2: ERROR: Dependency "wayland-protocols" not found, tried pkgconfig

Add "wayland-protocols" to PACKAGECONFIG to resolve missing dependency.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 meta/recipes-graphics/waffle/waffle_1.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/waffle/waffle_1.7.0.bb b/meta/recipes-graphics/waffle/waffle_1.7.0.bb
index ea11309940..0ff82036e7 100644
--- a/meta/recipes-graphics/waffle/waffle_1.7.0.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.7.0.bb
@@ -33,7 +33,7 @@ PACKAGECONFIG[glx] = "-Dglx=enabled,-Dglx=disabled,virtual/${MLPREFIX}libgl libx
 
 # I say virtual/libgl, actually wants wayland-egl.pc, egl.pc, and the wayland
 # DISTRO_FEATURE.
-PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/${MLPREFIX}libgl wayland wayland-native"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/${MLPREFIX}libgl wayland wayland-native wayland-protocols"
 
 # I say virtual/libgl, actually wants gbm.pc egl.pc
 PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled,virtual/${MLPREFIX}libgl udev"
-- 
2.25.1


