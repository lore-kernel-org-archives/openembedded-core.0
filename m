Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CCCC27C40
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 17:36:29 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.3014.1692812180450260480
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 10:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=czVhelAh;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so93830551fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 10:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692812178; x=1693416978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XBjfIWYtKAxc6mPPSPEVERdiBgSPreJDqwCrFxJvm1g=;
        b=czVhelAhUshdTy75iXEOeFOPq9zoOXj1mglsp/sZvX4PtEWCCGHY0+wI1sZANopXX8
         EKFv6zpSLM+PfrdqPWpb5V9mYYz4IUdts5XfMe1/AqzLPBx83sRqp1XYqA4C15UWTa8O
         ieGxfB4bKl2nokDejcc17UWvYRqtIKniUEjBKSI94luCn1hGtnfPWlOxiAIb0qpm24M9
         lsmhONdNugnypwfC0uhvFttJSzyk6rcJn/UexxaH1YABFdNq6xcRuLUewiYhUcgVIMd2
         qWOjUHfiSGnFAi9Yt7ovX9UT4znbZz1G4NlAdV/G/CVKbFALz/UEM+pFSRcLEAzyTfdj
         7Dcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692812178; x=1693416978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XBjfIWYtKAxc6mPPSPEVERdiBgSPreJDqwCrFxJvm1g=;
        b=F6YkD1QzFZ9h+a3oO+N5KvlFyeEfAdo5cIf71Qng2JP/QGECjc/4QK+oc4zPEQtAJ+
         0Gnhus6peziZW0e8ehp0+kR9HZ3NpmkjjwZZQ0Tf+2k+7gBJt+NMAXFQYx0jBoHgKMvh
         v2abfanVKbdpMGxzXluIA0pMJZJYmI07amoB8HzijqEdGk6fWYo+9966P5kzaLAIEYOP
         7Y0jJMjDsIKaxzfDMWHT8Z1UsEnuioefiomu2fS6ZU29ial9VRfDy8rwYZMuz5Ntug3w
         lVGAVeL6K4TY79/O3q/Toq2Yk1ee/qRcX6awzAD8NYjDW5jM1UqK4XJ1MvMNb/1Z680T
         Fx0g==
X-Gm-Message-State: AOJu0YzJ88VRWV/2qxqv4Q3JfswJrt8yh0rOteWeAWV3bxBNUORX+Xz5
	6lrPxukD0kPwyBgkB0I+le9qhIb52+Qpl+Kw4rM=
X-Google-Smtp-Source: AGHT+IHiE6YIhFKcibNunFIAcC9dYRbow83/bMVSMblGIeOykTlVb4cBoXrQH6UfLnm9il5zYVeAxw==
X-Received: by 2002:a2e:994b:0:b0:2bc:de11:453b with SMTP id r11-20020a2e994b000000b002bcde11453bmr1754195ljj.1.1692812178165;
        Wed, 23 Aug 2023 10:36:18 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v22-20020a2e9256000000b002b9f4f3e16dsm3341578ljg.85.2023.08.23.10.36.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 10:36:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-firmware: upgrade 20230625 -> 20230804
Date: Wed, 23 Aug 2023 20:36:08 +0300
Message-Id: <20230823173610.1589565-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 17:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186624

License-Update: additional firmwares

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...{linux-firmware_20230625.bb => linux-firmware_20230804.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230625.bb => linux-firmware_20230804.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
index 6765226b9d78..4defab434de2 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
@@ -134,7 +134,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "57bf874056926f12aec2405d3fc390d9"
+WHENCE_CHKSUM  = "41f9a48bf27971b126a36f9344594dcd"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,7 +212,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "87597111c0d4b71b31e53cb85a92c386921b84c825a402db8c82e0e86015500d"
+SRC_URI[sha256sum] = "88d46c543847ee3b03404d4941d91c92974690ee1f6fdcbee9cef3e5f97db688"
 
 inherit allarch
 
-- 
2.39.2


