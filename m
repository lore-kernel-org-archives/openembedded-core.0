Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1412CC83F10
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 16:38:19 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.1005.1693154292944081012
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 09:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=HZl4TaAi;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-26b44247123so1548677a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 09:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693154292; x=1693759092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iuTLGKcJ0rjinGlUFnLEzxyhtNsQo88yleB0xVXp+TA=;
        b=HZl4TaAi01Rl3FYkW1cLfAbxUG9HpNkK4DZCSSW52ny1muSWws7hkTyuQ+3Nv9jE9W
         7UHPXaIprGpbjTJys31xCEZOoo5KzLX8Re8iLvU2OuU6Ebteofa+mRENTS/VSbJG1E3G
         cU1kZWI9wQ0B489z3w41qtU1V94MyvkdWeiCKtWzSq2PdUgyHxodvTDUXI58MGK6a5c7
         x8LGnwbZByRJmz+siuMzN2IPHl1dOQ6Ut7zc0I8MY5looyikzWOeTAGC6JD2XVQPVr63
         nCwhxPHzNf038OhCHvLanzAc9FujISajcPr4VXCGp+BVRIBdE0eHpvyTsFyClcsPABH6
         G5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693154292; x=1693759092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iuTLGKcJ0rjinGlUFnLEzxyhtNsQo88yleB0xVXp+TA=;
        b=BLyqUTH/H+D3cP1ZHGSEMhgDZ5aFf4h9VRo9z3bM2X+vBEk2+fuMfJG4GrwBGzURjK
         Iew4Rgld5xQSFNq0a/melQDFJ1mC4FG+yTH58Ib4ggWXaLgvXf3up75FD7Ko40zqSJDl
         CTWdKWJkxE51Ar0Gp8OHZrg+yt8g3egvt64bMFvcaJ4+GIRGr7eM9SWOk11bq7r8Yy4z
         oq8UXRhPgx63eBFBdpEZsdZkLfpJUrXawojJPrTEcx9LBIcKKDIclinNx1Cgm+AcXiah
         on7uc2Xa50piIWkpdb83sDh/99F5V1Wp3UU6TNNUmi1ub/LO4wAI6/IAfBea8BDrOz3u
         SyZw==
X-Gm-Message-State: AOJu0YzAJoWiEn2q609KiH2hOzwyWexIRYUS+iNXVxzXtwnY2DySmltB
	vFCOWmZsDjYVnqN07DuRVNCgZg5/SeGupA==
X-Google-Smtp-Source: AGHT+IH/znFmzo7XMW827+LGIp4Qk+CB9lE/biUYh7EWeNuXh6RToDk2HiimLu4qxCt6vcFBej4dvw==
X-Received: by 2002:a17:90a:ea81:b0:267:fb26:32bd with SMTP id h1-20020a17090aea8100b00267fb2632bdmr21862971pjz.7.1693154292062;
        Sun, 27 Aug 2023 09:38:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71d2])
        by smtp.gmail.com with ESMTPSA id p21-20020a17090adf9500b002717a368efasm2291654pjv.12.2023.08.27.09.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 09:38:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qemu: Fix CVE-2023-40360
Date: Sun, 27 Aug 2023 09:38:09 -0700
Message-ID: <20230827163809.3127870-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 16:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186777

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...w-nvme-fix-null-pointer-access-in-di.patch | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-CVE-2023-40360-hw-nvme-fix-null-pointer-access-in-di.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 82a7b361b13..b98169c2433 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -28,6 +28,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch \
            file://0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch \
            file://0001-tracetool-use-relative-paths-for-line-preprocessor-d.patch \
+	   file://0001-CVE-2023-40360-hw-nvme-fix-null-pointer-access-in-di.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
diff --git a/meta/recipes-devtools/qemu/qemu/0001-CVE-2023-40360-hw-nvme-fix-null-pointer-access-in-di.patch b/meta/recipes-devtools/qemu/qemu/0001-CVE-2023-40360-hw-nvme-fix-null-pointer-access-in-di.patch
new file mode 100644
index 00000000000..731b0281f43
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-CVE-2023-40360-hw-nvme-fix-null-pointer-access-in-di.patch
@@ -0,0 +1,39 @@
+From 83dd3da9fac872fac9739b9dcb96232c93675824 Mon Sep 17 00:00:00 2001
+From: Klaus Jensen <k.jensen@samsung.com>
+Date: Tue, 8 Aug 2023 17:16:13 +0200
+Subject: [PATCH] CVE-2023-40360 hw/nvme: fix null pointer access in directive
+ receive
+
+nvme_directive_receive() does not check if an endurance group has been
+configured (set) prior to testing if flexible data placement is enabled
+or not.
+
+Fix this.
+
+CVE: CVE-2023-40360
+Upstream-Status: Backport [https://gitlab.com/birkelund/qemu/-/commit/6c8f8456cb0b239812dee5211881426496da7b98]
+Cc: qemu-stable@nongnu.org
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1815
+Fixes: 73064edfb864 ("hw/nvme: flexible data placement emulation")
+Reviewed-by: Jesper Wendel Devantier <j.devantier@samsung.com>
+Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
+---
+ hw/nvme/ctrl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
+index 2097fb131..36a2846c3 100644
+--- a/hw/nvme/ctrl.c
++++ b/hw/nvme/ctrl.c
+@@ -6862,7 +6862,7 @@ static uint16_t nvme_directive_receive(NvmeCtrl *n, NvmeRequest *req)
+     case NVME_DIRECTIVE_IDENTIFY:
+         switch (doper) {
+         case NVME_DIRECTIVE_RETURN_PARAMS:
+-            if (ns->endgrp->fdp.enabled) {
++            if (ns->endgrp && ns->endgrp->fdp.enabled) {
+                 id.supported |= 1 << NVME_DIRECTIVE_DATA_PLACEMENT;
+                 id.enabled |= 1 << NVME_DIRECTIVE_DATA_PLACEMENT;
+                 id.persistent |= 1 << NVME_DIRECTIVE_DATA_PLACEMENT;
+-- 
+2.42.0
+
-- 
2.42.0


