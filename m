Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04753C61DF4
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 13:37:38 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.135944.1700833055013247100
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 05:37:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=q7dlx9Yz;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c897ba4057so23269041fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 05:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700833053; x=1701437853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pfhkZVV/Xe5By9YTt88Qh0qyzr6KpAO27IZeZaqMVoM=;
        b=q7dlx9YzLUhgtFGuqUzApkeKw1rAJxEO1aJIM8dS762X57CUdNIalklum1slUwPCAJ
         nzVFxiZDPhIOg8XM6eYLqoyq6JJMvXzw/vabYQlyMwD98coUlwhQnkV0CCPkpJkN8Lv1
         L+U5qZ9A66GXxqART6ZJDa8CDrqXJO0OSqvSplngO26fGOWp3ZIR7//eIKLg0bcgD7YM
         KWj0n4PtJ63MuWPreo/1taz+yXnECrrEFSJEjbp2vAAV+t6UMEDqbACFW02XgN6R8WLH
         aoTQke60cqkWta+3bZMS+AFf03fgc6GduY+CUksyOJAupQTHVchZ++1PiLMBm8HEC7oN
         VCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700833053; x=1701437853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pfhkZVV/Xe5By9YTt88Qh0qyzr6KpAO27IZeZaqMVoM=;
        b=CGBOHSlyIBz2Gd8eqJhzpI/3RhH9IswoTGZThv0So+ApFcpQSMKgw9ga8oH5kFRDlf
         mWxDJtAl3ibFQfIa5cJaMjVcIkU219XW2gvoIDwWNtL6+2ZhHgNh+puaeGwmkwrlEgFN
         nUvUAcG93TBV3LcJ/X9rJZBcch+C2c46rJm7LkVlcYMC9LiLSxInfpKIGsyxM9PFwbaO
         s7RxALXFqfpGX/+SBq2Qy5sL/yHvyvHLYI4vWmhWcSvqx9tuoFPDtCe0IKVta3XngzAf
         A0F24F/q9WZC4uYE0SjazEnqTtsxG96R2UUabBGIntHPMFLxWTzIZCC3lOVN9nhXD2aD
         P1yA==
X-Gm-Message-State: AOJu0YxYVed5OvjOX24IyYDsiSfnUrzrur0zoCWHuvfohIv7L/436TJw
	OklzEXR387CLZjd1BXze5WypIkmgoRZcpnrPB0g=
X-Google-Smtp-Source: AGHT+IFWgQbqcnZ08n8edo9VPlE5mTN0h2rTI0CiWsorw2eO3oukYqfrBBEpucGQnC3fU0ucx9tOOg==
X-Received: by 2002:a05:6512:3b10:b0:505:7113:1d0f with SMTP id f16-20020a0565123b1000b0050571131d0fmr2533412lfv.13.1700833052667;
        Fri, 24 Nov 2023 05:37:32 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d6-20020ac244c6000000b005041a71237asm507477lfm.111.2023.11.24.05.37.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 05:37:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libdrm: upgrade 2.4.117 -> 2.4.118
Date: Fri, 24 Nov 2023 16:37:31 +0300
Message-Id: <20231124133731.3964514-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 13:37:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191194

Upgrade the libdrm library to bring in updated modetest utility.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/{libdrm_2.4.117.bb => libdrm_2.4.118.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.117.bb => libdrm_2.4.118.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.117.bb b/meta/recipes-graphics/drm/libdrm_2.4.118.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.117.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.118.bb
index 3e6fb16e15d6..7e0b23e2198e 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.117.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.118.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "a2888d69e3eb1c8a77adc08a75a60fbae01f0d208d26f034d1a12e362361242b"
+SRC_URI[sha256sum] = "a777bd85f2b5fc9c57f886c82058300578317cafdbc77d0a769d7e9a9567ab88"
 
 inherit meson pkgconfig manpages
 
-- 
2.39.2


