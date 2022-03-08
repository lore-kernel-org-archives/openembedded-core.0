Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DA7C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 15:52:59 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.9689.1646754778863193525
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 07:52:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RdZ66wjL;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id z3so8960479plg.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 07:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ggpuQbtADVfXTsJWBTdchnnYyfUrDJWmJBfzwEBxmt8=;
        b=RdZ66wjLl+YBk9anL1wuSBNJ/0rtUu/+dQ1JLps46K8Hv0x2Wage8tqftT6J+8pnXP
         zYwRLPMNk/Lod134Ro7KVdcoLwcm24TDQ9oBkDPf3X9ccwCg1Te3duYZtst9O+FdSJt6
         OtjMVXp9BIkPlPJ0GVgEAUnRg67m+SgFtBbKSXp4MBQPjyyHyfToXL+miafox2XK0MXN
         vR5eUdUDYMZRqUz8aNf3HMaGZsEEQ1nbvWfr7Pt+OzukrDKIPVotU6VPzpcn4KYk/PNB
         eWxqEkmesXVVcY8NBCOE8e7IzjxUrPopZb0bVTiaMXBH06LEa+SIRN6YKNa9229JIkcL
         Pgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ggpuQbtADVfXTsJWBTdchnnYyfUrDJWmJBfzwEBxmt8=;
        b=b961QDoFzNVNoOO1vPte4S2x2oxDB5u46T/t+RB14hInCwR7eQzHWTCtJpZZQ1mmyf
         2/KcI+onSjGYFqQLhqCfL23VW9h3GnhqLuDt9mnmx8ciBZ9S5Ej1L2sbhNkFzcjhKGyE
         KOTIYLy+LqsrCMcisQ9yWiv7kdGpOh3OlW7OW1QpKpznlmWpmDyAO8KP2FInUHB6srHf
         FmffoibarMSSnWc5W1D0Sp45r8wfZQjpB+VuYQ9JRE86VavroJcwCm2X1Nehdyc+9yJW
         Fn+kDCFx8JS2nfpa9zWXS+adCxNAYuVz+KiM7YLs8hAzR4bs7VVfXhYBiA/oOqlw7AeY
         YcRA==
X-Gm-Message-State: AOAM532FrecE4kKSt5Q3I1e4eXR9qUVY5DF11ty2OQdTwv2e9GUgoWf+
	6gy2qELG6fnlbl5QlhHZXqiIqH7OIGSyCw==
X-Google-Smtp-Source: 
 ABdhPJw7ICHeNe3i66Hk1PAUlOoEY958YM6o57I6UXuOl+VPWaGbNzVTM/WLbY5YHT0NtGNmQQyAmw==
X-Received: by 2002:a17:902:e302:b0:151:bfe9:da34 with SMTP id
 q2-20020a170902e30200b00151bfe9da34mr17409160plc.100.1646754778188;
        Tue, 08 Mar 2022 07:52:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 o1-20020a637e41000000b003804d0e2c9esm6559106pgn.35.2022.03.08.07.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 07:52:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/5] waffle: Use the right dependencies as needed
Date: Tue,  8 Mar 2022 07:52:51 -0800
Message-Id: <20220308155252.2454464-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308155252.2454464-1-raj.khem@gmail.com>
References: <20220308155252.2454464-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 15:52:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162932

using virtual/libgl is a broad brush, we can be more specific and ask
for dependencies which are really needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/waffle/waffle_1.7.0.bb | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/waffle/waffle_1.7.0.bb b/meta/recipes-graphics/waffle/waffle_1.7.0.bb
index 0ff82036e7e..b9315157007 100644
--- a/meta/recipes-graphics/waffle/waffle_1.7.0.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.7.0.bb
@@ -31,16 +31,16 @@ REQUIRED_DISTRO_FEATURES += "${@bb.utils.contains('DEPENDS', 'virtual/${MLPREFIX
 # I say virtual/libgl, actually wants gl.pc
 PACKAGECONFIG[glx] = "-Dglx=enabled,-Dglx=disabled,virtual/${MLPREFIX}libgl libx11"
 
-# I say virtual/libgl, actually wants wayland-egl.pc, egl.pc, and the wayland
+# wants wayland-egl.pc, egl.pc, and the wayland
 # DISTRO_FEATURE.
-PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/${MLPREFIX}libgl wayland wayland-native wayland-protocols"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/${MLPREFIX}egl wayland wayland-native wayland-protocols"
 
-# I say virtual/libgl, actually wants gbm.pc egl.pc
-PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled,virtual/${MLPREFIX}libgl udev"
+# wants gbm.pc egl.pc
+PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled,virtual/${MLPREFIX}egl virtual/${MLPREFIX}libgbm udev"
 
-# I say virtual/libgl, actually wants egl.pc
-PACKAGECONFIG[x11-egl] = "-Dx11_egl=enabled,-Dx11_egl=disabled,virtual/${MLPREFIX}libgl libxcb"
-PACKAGECONFIG[surfaceless-egl] = "-Dsurfaceless_egl=enabled,-Dsurfaceless_egl=disabled,virtual/${MLPREFIX}libgl"
+# wants egl.pc
+PACKAGECONFIG[x11-egl] = "-Dx11_egl=enabled,-Dx11_egl=disabled,virtual/${MLPREFIX}egl libxcb"
+PACKAGECONFIG[surfaceless-egl] = "-Dsurfaceless_egl=enabled,-Dsurfaceless_egl=disabled,virtual/${MLPREFIX}egl"
 
 # TODO: optionally build manpages and examples
 
-- 
2.35.1


