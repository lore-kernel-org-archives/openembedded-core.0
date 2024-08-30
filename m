Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B87CA0ECC
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 00:43:44 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.2294.1724978623889034513
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 17:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: otavio.salvador@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7141d7b270dso1029428b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 17:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724978622; x=1725583422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OT49Dt7auJCi7zIWATvSzBZZDSSemQoPqWjAL+cABno=;
        b=Nx9lKpgl/mjXxg5JF+O20BoSpIdeoXsvS+pjXtwRS3paiccy4FWq1GOEYeVTtrgENK
         bB/wQ3eXb3PRBHEB/it/HwUHNpODMx9GlfaWoQ7XvDroaVx963WaPqQ+tLrtjAJquFw8
         XMY2PoqgwLnXNh/bz8/6ETQhmR8CN5D/JLcLGLtzsSOCS4HniLJFPGILO3YQ87gG3TiQ
         cYnlqKFwn2NpMisIKqdxuWRYOGnzJr5EqJ3wL89oMLoyqrCILy7v7ioZUT9WgOo4eyNQ
         Uu4fC1qI1aJMWnNa2IcOzevHXnHEdPu3rTUpVfgvkEZdZMrBAwLiYeFuJejWneegtyON
         lsEw==
X-Gm-Message-State: AOJu0YxYwYcXfrz6YmYXtKBQFz673uFqMzzE2CbHhKO1PpOUdska7WHz
	YOEF1lbmSqRqfhXmHkmYKorvY7KSmLIw1ATBJuaxgfJGCd7jKrj/eAWO7/hi
X-Google-Smtp-Source: AGHT+IHomD5Yp7uGdqK6qJeShtESeCbOv2Gp5Rqhj1WwLIVWW6gkndS5iwpjILfcRIJAWGRfB0sK4A==
X-Received: by 2002:a05:6a00:9452:b0:714:1c0e:1336 with SMTP id d2e1a72fcca58-715dfb90e89mr5406994b3a.4.1724978622358;
        Thu, 29 Aug 2024 17:43:42 -0700 (PDT)
Received: from localhost (189-30-34-54.user3p.v-tal.net.br. [189.30.34.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e569e9bfsm1712585b3a.130.2024.08.29.17.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 17:43:41 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	U-Boot Mailing List <u-boot@lists.denx.de>
Subject: [PATCH] u-boot: Ensure we use BFD as linker even if using GCC for it
Date: Thu, 29 Aug 2024 21:43:24 -0300
Message-ID: <20240830004331.2856512-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 00:43:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203950

If we are using 'ld-is-gold' as DISTRO_FEATURE, the U-Boot Makefile has
mechanisms to ensure that we use BFD as linker. However, this does not
work for the GCC when it is used as linking tool.

To support that, we added explicit BFD use whenever we have the
DISTRO_FEATURE feature enabled.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-bsp/u-boot/u-boot.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 5a7bd6703f..ed3822784e 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -9,7 +9,8 @@ inherit uboot-config uboot-extlinux-config uboot-sign deploy python3native kerne
 
 DEPENDS += "swig-native"
 
-EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${DEBUG_PREFIX_MAP}" V=1'
+EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} V=1'
+EXTRA_OEMAKE += 'CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)} ${DEBUG_PREFIX_MAP}"'
 EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
 EXTRA_OEMAKE += 'STAGING_INCDIR=${STAGING_INCDIR_NATIVE} STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'
 
-- 
2.45.2


