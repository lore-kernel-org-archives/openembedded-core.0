Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80139C433EF
	for <webhook@archiver.kernel.org>; Sat, 12 Feb 2022 10:40:36 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.7640.1644662435720130152
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 02:40:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XSuPwXQ0;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id z13so1690129edc.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 02:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XIVEgKPwkoF8rtqXsd4VAq8kuVVLcqGe6exQD822C88=;
        b=XSuPwXQ0AjYDk6QwDrWC6MI11xiBoFI1VNYEx88sx1NTKjRFeqw1pJhirTw7UNGHA4
         LfBQZCq2ka72RRp/tIcnvQvLzExCSQfR63K/k6eOY1Ip/d380MmntMnk/5vidD1NGpBu
         bSHXXNUrH6zV63vsx9STefA/ZviQ/+r76t8NDLzrjVaOEUDf66vYx0hNZuIgrlvqDoAq
         blGJfa6iHtEPLygr44mmhHap4USbQl5Bi0Km4i3KDFKw4WCIjjLCRNbYRQLw7ruSTGUh
         ya4f0mpNKXTPq2CAakNdbr9ycOySEOTz8Clq1b/OWhI8dy/mJ6u0oZkrCa7MtBeX8BUz
         kj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XIVEgKPwkoF8rtqXsd4VAq8kuVVLcqGe6exQD822C88=;
        b=XWG0kUsxDL7n2iDLGsI6KG16XKYgzUT8Kcao35OZ8bA6LootCe1d3UIYAxiyY8n376
         ezNMgX5WYNIrAvwTeCDJmlGxIDms+Yqw4dQD8mdLKWXrzh+uusA5bg53ARgYg2gh7ZBZ
         b+tPgmLndxnnrmYEu/DVPaqEIK+d51O8QfggbgWYuY4R0b/TjQ0MA3hQaIGeuZQjBP6L
         E3+jLjW1Xp+DpPcMWDq1NF0RCmiEPnP9JbvI/ydRRmB3Wt0INdbFGg1DaxAgCPk7Vdo9
         uvOxv1B3ocvKAocJ/StOamVDHjRnR+NWkfiChb9ydViv61wlYr1WqV7VHSN86G9hTslh
         TMmA==
X-Gm-Message-State: AOAM533ED/5TpUxTKih02yV/9mLYektlvY4vkCEE0p3osmUV/JVrOF9A
	IyyLc4cb4dSd9sPTRHiJVDRf7nBpSEM=
X-Google-Smtp-Source: 
 ABdhPJwIz9RBxpmnS2oUau5hzkMPUSq3zBWgIlxJwkftr9KVIGEJqAi58I9aAcvL2IymW+eDDMPogA==
X-Received: by 2002:a50:eb46:: with SMTP id z6mr6163478edp.229.1644662434116;
        Sat, 12 Feb 2022 02:40:34 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 cz12sm7135895edb.30.2022.02.12.02.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 02:40:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/3] weston-init: replace deprecated/disabled fbdev with drm
 backend
Date: Sat, 12 Feb 2022 11:40:20 +0100
Message-Id: <20220212104022.842655-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Feb 2022 10:40:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161667

drm will default to opengl rendering by default; if this is
problematic, --use-pixman option may help, apply only where
it's proven necessary.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/wayland/weston-init.bb | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index e02da0c358..8e8c0454be 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -19,13 +19,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[no-idle-timeout] = ",,"
 
 DEFAULTBACKEND ??= ""
-DEFAULTBACKEND:qemuall ?= "fbdev"
-DEFAULTBACKEND:qemuarm64 = "drm"
-DEFAULTBACKEND:qemux86 = "drm"
-DEFAULTBACKEND:qemux86-64 = "drm"
-# gallium swrast was found to crash weston on startup in x32 qemu
-DEFAULTBACKEND:qemux86-64:x86-x32 = "fbdev"
-DEFAULTBACKEND:x86-x32 = "fbdev"
+DEFAULTBACKEND:qemuall ?= "drm"
 
 do_install() {
         if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
-- 
2.20.1


