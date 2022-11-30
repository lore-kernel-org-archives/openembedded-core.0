Return-Path: <pyih.soft@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE6CC433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 16:23:54 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.15917.1669825429912071400
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 08:23:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VtiGsnf0;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: pyih.soft@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id b9so21473194ljr.5
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 08:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FteTPS0Ykl1po7Q5ByPufcBeeQ5DIWf+Qqsx7aRXr74=;
        b=VtiGsnf0w5c2doVmArYqeXcVmasy2NGfNqYn4PvzECBh6b9TrMVLwsOY2TfvptAGyR
         l5gTYnp4lfo+oncSQfGlXwgWMz1C/1kuL8fUegzCU/zgyEiLYCbP/XpIIEQOm7twxlTH
         FRNKr4o6rinxR/chy93IQ8Bh7K3gQh0QWMX4DtU1lYcorn3myg4r8xQy4gZNJG0l5wF5
         7IxXVdFkGrU+rLV1KUKB0pRBELlT4oqLjJfa28e4LIFgsRrb91S+WCwJJ0nk4CbW6IlJ
         f/YY0/IZ+KaRCGIXZTNlk3IPtBpC6/nIw39mm6VvjDXUKa6SCQHPkf/Vc92ynCj7VWgs
         zGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FteTPS0Ykl1po7Q5ByPufcBeeQ5DIWf+Qqsx7aRXr74=;
        b=lzreIvI7bnY+WAdNfSnXT+x9pYbBzEq746rlkauI2TeLQOY5kSjMgQw2or/DINfVfs
         IS7Qqv8R5uU+FdDJbVS6cZRWG+5f2jBM9Uhre3t/UY8Ljd0WBx7u+IzGR4GMzgkeUy5T
         j36TGFP7zXaG5S9sMgO+I0fRUoz+wgytBmiwzXuoJmfuw7q5uzM2wJFf5arcb59xDTBn
         WrkIgmaWunt64FBuvqn5BJ+gXsxXX6CmGBq8OY5BRiz99GchgQJOOltYdCb62m9ZSJXg
         JtJ1dX1J3LHfjKDWG19HacSZOGsAOODmN5YFVR/pRFYiiR8JicS2R9TYf9RTWr0174gN
         x+TA==
X-Gm-Message-State: ANoB5plE3dDAqbq4uaHF96DYbmPppDW63m2mzEy5V8zpYjukKI9uHQUX
	MCFyDHANOG9gqhfeO3Bh97bCMPQfs6LCog==
X-Google-Smtp-Source: AA0mqf5Dz3VCKtQTRUUtIsUun0TJQPAlRfzMwBKSZpp86XCEar9/lYmwhawM0bsgym/8EmujtY9Kiw==
X-Received: by 2002:a2e:a4b4:0:b0:26c:5cf3:cc89 with SMTP id g20-20020a2ea4b4000000b0026c5cf3cc89mr20475919ljm.483.1669825427680;
        Wed, 30 Nov 2022 08:23:47 -0800 (PST)
Received: from build.cyp.yadro.com ([80.254.50.127])
        by smtp.gmail.com with ESMTPSA id g3-20020a056512118300b0049ad2619becsm307584lfr.131.2022.11.30.08.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 08:23:47 -0800 (PST)
From: Alexey Smirnov <pyih.soft@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexey Smirnov <pyih.soft@gmail.com>
Subject: [PATCH] classes: make TOOLCHAIN more permissive for kernel
Date: Wed, 30 Nov 2022 19:21:13 +0300
Message-Id: <20221130162113.3731385-1-pyih.soft@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 16:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174023

Currently TOOLCHAIN is strictly set to gcc in kernel-arch.bbclass.
And this prevents any TOOLCHAIN changes for any kernel recipe.
This change makes TOOLCHAIN configurable as usual.

Signed-off-by: Alexey Smirnov <pyih.soft@gmail.com>
---
 meta/classes-recipe/kernel-arch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 6f5d3bde6c..1531ae6cd5 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -70,5 +70,5 @@ HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
 KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}"
 KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
-TOOLCHAIN = "gcc"
+TOOLCHAIN ?= "gcc"
 
-- 
2.30.2


