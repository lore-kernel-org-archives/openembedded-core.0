Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57370C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 11:51:09 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.8048.1657626658810968843
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 04:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gbQw8llb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id b26so10818373wrc.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 04:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N6WpQJSzyuDO86YeZKXfYRk8U7ZJQUlgea0HFaMqmng=;
        b=gbQw8llbr/jhrE74mfxi3UnDnWwCJPAaiZs1wZ26C54ZEVVzyNbXWs4zMSIAqo8Uwk
         82BUy0mPYgZTdKnd+O1b1gaMbLSoQfHL1On3Y/VPBRtI6TUu+IxsZxs/oot4P73JZaAx
         dKQMYqaA68CdtzZy9Bs1eeeboH+YF0zSby2WM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N6WpQJSzyuDO86YeZKXfYRk8U7ZJQUlgea0HFaMqmng=;
        b=FujP4Ds3YubGLFUjpKyg1d1LhU2mB91eBwvibx/8t2feP1efkJN7PHorC0jhw87EhK
         ZxzsVM7Ke6GEZbbJVR878lvSJ+8CdclGzHuIA4OGLtKD4q5JjIWFv715V7X2oXz+hv4R
         NZwoaMp66TbX44nkr1UE3QmkcsZbmaV2HOMWkAuSRjCBs/HOI8WHLUN5e+Hb+O/Wo16N
         CiZzf76Tm1QSvZ+a1cKvHjdZ/mGjc/Wx5ri0E/gmSHsFyWn5VFI4Xoe7dnPL6a89qLe9
         J22DNy4zkVOZimjNon9WkA5anvPFFQvUdW2RSjc2pOzhjR47ow7JT+AuQ1ccb1lpaCU2
         ut4A==
X-Gm-Message-State: AJIora9LQNsoZXtvNdRP/zaQ01VcmuPJSl3KeqYE6b9Q4eyAoYVn56hb
	rwmJyvJ5SyR4Xw5l9JG6lu49Hzqp2RsJZQ==
X-Google-Smtp-Source: 
 AGRyM1ubYe0koKaXyVcRmACLeUT1TrOWinj6x5nueSIqAkMI5tLjIPYT22LPMuIUKAHr6kq71lIYrA==
X-Received: by 2002:a05:6000:1a41:b0:20e:687f:1c3 with SMTP id
 t1-20020a0560001a4100b0020e687f01c3mr21354069wry.415.1657626656955;
        Tue, 12 Jul 2022 04:50:56 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:375:1449:b69:de14])
        by smtp.gmail.com with ESMTPSA id
 a8-20020adffb88000000b0021d7b999949sm8104428wrr.111.2022.07.12.04.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 04:50:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] kernel-arch: Fix buildpaths leaking into external module
 compiles
Date: Tue, 12 Jul 2022 12:50:54 +0100
Message-Id: <20220712115054.177016-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 11:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167922

Building external kernel modules like lttng-modules was showing build paths
inside the debug symbols for the modules and breaking build reproducibility.

Fix this by adding in the mapping needed to map the kernel build directory
to something more approriate on target.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel-arch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 07ec242e63b..348a3adf225 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -61,7 +61,7 @@ HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
 TARGET_AR_KERNEL_ARCH ?= ""
 HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
 
-KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH}"
+KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}"
 KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
 TOOLCHAIN = "gcc"
-- 
2.34.1


