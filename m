Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1799CC4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 14:58:25 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.15133.1671202702238821849
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 06:58:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=v8S1uiwY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id g10so2527644plo.11
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 06:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYpu9m/Y7zssU+vmNrOZYju82zhxqPAY0ai2LyYZvG8=;
        b=v8S1uiwY1+2SbQp/1fAf57yXIxuCZFhqSOZFXSGRRCYLPBe05TNODYlSAWdde4v+4l
         2PCb9fjD2wBWDf4kOrkNKVCH0IYt3eLmLUJN/7pZCtiMa0/Y6SyXekg12S+PEPYKP7FD
         VNoneyHtjRqEf0Yn0XdsKX1CGSso97tbi0vUe1N+SMjhDxr1NRKRIph256UjWvKi9x8F
         E3SE4Hfb8cLAN64KusX48KqAyfCa2qBOLQFUkeq6nlNQpQE9jP3TylSjXFpHdAEOVFbu
         /MgpceyooxjILZ1/P5NXm0bOiL8b7f+QJAgvRM2P+bYSktu37koPIzkA/nV46YH7xeYE
         /nOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYpu9m/Y7zssU+vmNrOZYju82zhxqPAY0ai2LyYZvG8=;
        b=6YT4ABitYosy3wT/FlLsFavxN1EuObNHzpLbnh6dt5kOiuWpRCUccijMk36aSSXngr
         kRFo43TgqGE4tUVnM2+kJqkTEVqg/1oqVL24rCcrsDcKH46hWN5awAtSaXZFGPE72HX/
         WmdAqjSpdOTj+7HdpHipheX9j8CgRfNFJLg7FP/Daps6yVk64bvOFJjKhN/ZEruSPWVH
         Q+AeGFvfoGwW1iW8dKKlXvWlz8+MWNN3QgQM7JhDWkUz/5dkakpa3vy/VL8r3C6id0Ut
         VKFZZhxsQhXau0Xbtls9Tx85yzLJEtIgw4RaRwlHH7Ffo3in9XtskpZuoaYoCD9xLS9N
         VsFA==
X-Gm-Message-State: ANoB5pk7dnXeMTKnCTU2Tx3QoSWIoUL9DXBblUcHKmTdsjcR6sSvbXcJ
	pU6D/PtdTk3R6gnIFETZlYir9gHFGcFcgd81HfU=
X-Google-Smtp-Source: AA0mqf6oMuavIjjquxMRhKwHcfwo0fRBGwWXBFCT1EkPKs7Mg028CppSYRY/t3FYnQ8U2k0EqOSWSQ==
X-Received: by 2002:a17:90a:784a:b0:213:3918:f2a0 with SMTP id y10-20020a17090a784a00b002133918f2a0mr33449447pjl.15.1671202701168;
        Fri, 16 Dec 2022 06:58:21 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r21-20020a17090b051500b00219eefe47c7sm1482230pjz.47.2022.12.16.06.58.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 06:58:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/13] classes: make TOOLCHAIN more permissive for kernel
Date: Fri, 16 Dec 2022 04:57:50 -1000
Message-Id: <7d45d4696970c45534b905dc7a65418073108f97.1671202568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671202568.git.steve@sakoman.com>
References: <cover.1671202568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 14:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174755

From: Alexey Smirnov <pyih.soft@gmail.com>

Currently TOOLCHAIN is strictly set to gcc in kernel-arch.bbclass.
And this prevents any TOOLCHAIN changes for any kernel recipe.
This change makes TOOLCHAIN configurable as usual.

Signed-off-by: Alexey Smirnov <pyih.soft@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit be1634fc35dcc81f0301d942064a6eed584e0704)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-arch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 348a3adf22..4cd08b96fb 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -64,5 +64,5 @@ HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
 KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}"
 KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
-TOOLCHAIN = "gcc"
+TOOLCHAIN ?= "gcc"
 
-- 
2.25.1


