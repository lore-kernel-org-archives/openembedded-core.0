Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBECC433FE
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 21:58:08 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.823.1637704687682703720
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:58:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YHF83PoZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id q14so686320qtx.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+hzo2U8aZDCQkWa1JmHCTxj7OP9+x88B1Otc0EF5fZc=;
        b=YHF83PoZ+5buYpd0HkwojMxtDR5l+lll+sx8IJfyqjUrsGPdouW6YCEaD7UhsHU2Ed
         OXAXGNpRpaACOfYSH749JFMOm1RmY5xXjgbMdTSHsZIzX5bqz68d1+0IbG7VLWgJYKS3
         CqdzUGy4ovK6+vicmoK4rBKPVwXUhA1WgkVmMjJLtqI1V7j9uaW9Ny4N3aISARaB9eN/
         L+orSyceROHckrtDz/I35XpTJTsMxXktdSWVW7MQ9o3j1kr4XKYWCfYOYxGp18yrkBvv
         Qs3xf21d5rz9VETBKS0+56ec8mifdgQo+NXVFsiH3UW+VhRvfmm8+KRWsMr0iH6HMObY
         otJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+hzo2U8aZDCQkWa1JmHCTxj7OP9+x88B1Otc0EF5fZc=;
        b=vfXcd+R14CCZyisYAKy8dHKQOuKdzyAQ9GG/+FzNTvjputCKQRgU8u/IWeuGRrbAho
         gZ91fINDUmzCPfg6qLNqJ7coVKPeVnOrUoKLhh5FSaXRcO9KfH95xd0eBEvYOU3fRotf
         cPxeXTwtl3rpL0VAqzNrqAnt0Op6DktYsQZZio+AJ69nQiHlWxXoZI1HRQ0psBuVpdyH
         IujvgtVHkeX3tOrWDbkGUmzLyXwgadBdxnL6qGRJEGYwd3Xige0cmWN6ZaL2fIUsWSxy
         CykkN59jk2i3tEY8bo2Z0k29RhIeQcSyABJ2g3IB1BtiGFwnZuHpVI8V/s8+FvGSDbCW
         wRxA==
X-Gm-Message-State: AOAM530cjAxKcBQroTsXBI0gMM8YOA7WSFOb/G9VrBhFjJvcso9yUWYt
	XO2FcCOHMuAMbzHV7TwXFE4V42rgcldjEw==
X-Google-Smtp-Source: 
 ABdhPJx/xGvxAMWUBd9cIwKWuLHJIAMtFvjgt3xA6LvwBWx9xkRpMip/7q54h82RPN7+wcE1GdJuhA==
X-Received: by 2002:a05:622a:1d4:: with SMTP id
 t20mr946499qtw.84.1637704686809;
        Tue, 23 Nov 2021 13:58:06 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 m9sm6395640qtn.73.2021.11.23.13.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 13:58:06 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 16/20] linux-yocto: export pkgconfig variables to devshell
Date: Tue, 23 Nov 2021 16:57:43 -0500
Message-Id: 
 <0f6b65320dc8949c11afbdf81cc1980ceca94762.1637703810.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637703810.git.bruce.ashfield@gmail.com>
References: <cover.1637703810.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 21:58:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158637

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


