Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A75B9C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:50:32 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.28072.1658155829908247914
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=uYC2Ia1Y;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id y15so4498906plp.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LDzEmCp2bnGPvzCZFahGPBW52QUZ4J5nW+UEzQQvB7E=;
        b=uYC2Ia1YvwlXE7Vh8qP80UknMofOnYcao1uXOCKKPWdxVOVgVZ0xF21SSeSiuLGbvA
         b56GtIh4XyoyXF3MjgCCrBwR6zp2AVkanV/s22xcETm4cQmyv6EDFrRJ1IHFKzgodF4k
         EfCZJDQUwar0dEomPc7E6QOoawWuJE/WaV6kfC7SR2CRoE8cihEt4hfgaJ8mXFEg+8e/
         yU3siBAIiwo0Kb620exiNA7n0FrXOenXr+UV29v0XOZiwl8JANaxPIm0pClMHHY6WD0d
         TtxqoMYxEMUdGgjQh40X59JQp2eLZAPgI2GTyqi4N9pRPSVeYQfVXAQZiPCI8/bqA2kK
         PvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LDzEmCp2bnGPvzCZFahGPBW52QUZ4J5nW+UEzQQvB7E=;
        b=7mL1OTDEPVKRZCx1KyIVyn3ZcBCYOEgUxth3mfbePKeo9Zx+AISVptvWCY2g7cRD9/
         03dzwn+PZAdDRvW6QsWIj6Dz8kFX1TCkm3H7GHZP7fmWk7pvjI08LSoBNv1GApXhqXLj
         5ejLgZ7XSnhRB1qyFk7hD5EuAcp9v0rDNfFKa/UGKSg95VnB7XV0ETPCRJpTtd/eeFed
         FY95bM6MH/1YWs+RB1vfiOT3ZTYm3e2FDM1OYzQk5LGIT+7id6VaEDjjzECzYklCmj+i
         keDZpaUlHKHxjnDH+mpazSduwbxjgZ3C4Gv6CyKWrxRjqWgSzZE6iTwaEaK0w5HCbh5x
         7Dzg==
X-Gm-Message-State: AJIora/Y9C/CQTGvtHiLvcd6y9Eo8YykZoVJAiEU1m8JwU708k4Lxh5v
	yjmsiDltccRjIRuPJaCyBfS4cAgf3xNQbFwz
X-Google-Smtp-Source: 
 AGRyM1tQn4opJNumGfAIoEQuOyVWyb/9eJXCH4tRl0Yywe62Cc6hkOQtcKxQvvBXfwyW01vepBHwfg==
X-Received: by 2002:a17:902:7209:b0:16b:fa09:5d6 with SMTP id
 ba9-20020a170902720900b0016bfa0905d6mr28680686plb.120.1658155828842;
        Mon, 18 Jul 2022 07:50:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.50.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:50:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/35] kernel-arch: Fix buildpaths leaking into
 external module compiles
Date: Mon, 18 Jul 2022 04:48:49 -1000
Message-Id: 
 <7acc1b9b572789015619e4baea2642197b8b1950.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:50:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168224

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Building external kernel modules like lttng-modules was showing build paths
inside the debug symbols for the modules and breaking build reproducibility.

Fix this by adding in the mapping needed to map the kernel build directory
to something more approriate on target.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b56dc9009ba93174de6bf4c01e17808ef249dc5c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-arch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 07ec242e63..348a3adf22 100644
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
2.25.1


