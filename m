Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD40C433FE
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 21:14:47 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.4153.1637788486119800633
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OG7qiKfE;
 spf=pass (domain: gmail.com, ip: 209.85.219.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id j9so2631864qvm.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+hzo2U8aZDCQkWa1JmHCTxj7OP9+x88B1Otc0EF5fZc=;
        b=OG7qiKfEy1KDipRVaT6Nuv/ZgZbV0CfFFtOAgCbG/+bX5WgLk0l44TwqWx+VpGanCX
         Y9asa/5z6ooWEa3hgkKf9ywhVrff0BmKQHEktzNkxYMHujBFlMDE4DvcZJVU3Ibb0FnK
         rF2IPwhp92UfVAaezQmU8R/GlQpEgRI2BIqS+m5NlrsvTnyks6FU8DiZPB0D7/lk2WzO
         tX3Qh7hgVVoZjtaFhMGfOLv+w6FgHhsNenyv5BCEoBftsW5dBLSp98FnjexWOs+xuX8P
         lHsJgm3bzwP37IQhISd6qxdDMETg5TqMg3Iwr/coTidIVv3bgh1FZgL+N0neqSPN8N0f
         LdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+hzo2U8aZDCQkWa1JmHCTxj7OP9+x88B1Otc0EF5fZc=;
        b=oR4BKwcYmFfblWUHYlw8QShsgwu1GQsFHTnH/d2Rku/SKgB1Iv0CoEjaq7iB0aA6U0
         nHFKKP32Tn5QcafQ2WSa5Ql0NHqyuCvc9zdIPAzyJPyVruXsYn2su1pXDXxS3t699ynn
         79rgHc8DsBy/GrqC5KjTzN/QBKO2s3ktQiJFBtqNJhyNN2EdFvLU9sZDMgFULaEvZhaO
         Ujj85G3RxMJ/9uElDxja8tr5zy1rAtCwcXuRx0GKPnKOPOq/NEDuTJ1i3h5FND2CIyHT
         Ee5LdCVCq+aMcTe4wqd3lhzOp8LmPA43GG3vvP1DnuLvDy8TWVMUAkdH6rgzVuG4Z40V
         883Q==
X-Gm-Message-State: AOAM531GoZzzPV4+Ly6JUpLHSmKifvlqUoaaw9/3l7vFibRK8dLSUr8F
	PjELkH8vOl1Ualq/8l7q0e0KqiNNcX3gDA==
X-Google-Smtp-Source: 
 ABdhPJwHONaE6tSe4Uwp7wy5VIn1EpjXaX4WdcY75tmJkVv2zIfYos4Coc22hDF3ey0Ch2/Og/rDKQ==
X-Received: by 2002:a05:6214:2584:: with SMTP id
 fq4mr11714763qvb.53.1637788485285;
        Wed, 24 Nov 2021 13:14:45 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id u9sm495095qta.17.2021.11.24.13.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:14:44 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 16/20] linux-yocto: export pkgconfig variables to devshell
Date: Wed, 24 Nov 2021 16:14:22 -0500
Message-Id: 
 <b6b1ebec75b4852b066520c8becaf28c7a379151.1637788184.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637788184.git.bruce.ashfield@gmail.com>
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 21:14:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158762

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Not all of the kernel host/build Makefiles allow pkg-config
to be overriden to pkg-config-native. Exporting these variables
allow us to debug host tool issues with the kernel build.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 15fc7ff724..a3b2416367 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -61,3 +61,12 @@ KERNEL_FEATURES:append:qemuall=" features/kernel-sample/kernel-sample.scc"
 
 KERNEL_DEBUG_OPTIONS ?= "stack"
 KERNEL_EXTRA_ARGS:append:x86-64 = "${@bb.utils.contains('KERNEL_DEBUG_OPTIONS', 'stack', 'HOST_LIBELF_LIBS="-L${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig/../../../usr/lib/ -lelf"', '', d)}"
+
+do_devshell:prepend() {
+    # setup native pkg-config variables (kconfig scripts call pkg-config directly, cannot generically be overriden to pkg-config-native)
+    d.setVar("PKG_CONFIG_DIR", "${STAGING_DIR_NATIVE}${libdir_native}/pkgconfig")
+    d.setVar("PKG_CONFIG_PATH", "${PKG_CONFIG_DIR}:${STAGING_DATADIR_NATIVE}/pkgconfig")
+    d.setVar("PKG_CONFIG_LIBDIR", "${PKG_CONFIG_DIR}")
+    d.setVarFlag("PKG_CONFIG_SYSROOT_DIR", "unexport", "1")
+    d.appendVar("OE_TERMINAL_EXPORTS", " PKG_CONFIG_DIR PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR")
+}
-- 
2.19.1


