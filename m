Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BD6C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 09:28:20 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.8963.1645435699274987186
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 01:28:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e9CoV/Cv;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id c6so25193264edk.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 01:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XIVEgKPwkoF8rtqXsd4VAq8kuVVLcqGe6exQD822C88=;
        b=e9CoV/CvQ9E0mtYjijKCktzI7qr3urA/GEEIcNTv7xOElBVkhqMIPY5JrFStq2O5l8
         R/6M8nfmYr+5Q6XfhBpzuEY8Ld134END5a6DPnhUlLYkkHd2dG/beIwQuNFzTV5k3WLE
         xQcWgeL0ezLM0K5Earn1POmAo04kYuGI4fRWSxcdRgstxEOhUOiM/Gda36I8E2Isv06e
         vxn0KCBshv/D8FJ9mIQhJ4xebCTaO5eyJi49geqmSjg7NoKf9iPqE9CDNKf2eOLyUoQb
         gyQAYVhrO/2WEBBFeSTN3GguDHSR9RgN7s622kYWiazu2QQJzUGiWFnCpUubMhKRKydI
         vgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XIVEgKPwkoF8rtqXsd4VAq8kuVVLcqGe6exQD822C88=;
        b=XA6Y2AXOdQBquL1JScdZOTDN+a8Tjr9ACqD9Okb6YQc0OyqMhBW+qZnwoTZavryg9C
         AaYB3O1xZv/OlW5dVrmyDnAvLzc9m7g+0Cd24CNNQQcxiOvKmm3V0+o3RevH8I8y87C+
         O3WAo5DcLhFhlJj2B2GivilZ6dkrtyx7rNa7vVWxmPZtA3A57Gy46ubUYhS8zJxRSk3e
         Ghea89nIRFJzTP8gMbTPs2FXpR9Gajocp5MuHSHTLA/Dgitliwi0LHXWgCmUMwS1Zk9y
         oi5CKkiiCjix/i9XFvAuFjQ9NSKIVifaLUjGVX40FoTJzAhgXTyqcAoKDEBXpgxlb00Q
         GnEg==
X-Gm-Message-State: AOAM53003HTZhTaxa6+yy6V+Z4dbSjRLY79OQ7I6OcQue1qOoFds7iMa
	3XRSJPSK2ESvLzoTcEUvtyVUpnCGcGQ=
X-Google-Smtp-Source: 
 ABdhPJz3CsnmstJx8kDai2ngiE7gslKe3tk59Cv/M4PKqxaYGGDRSzfvkfQ3qMl79lDYKcDOQagedw==
X-Received: by 2002:a05:6402:190c:b0:408:80a7:ed8a with SMTP id
 e12-20020a056402190c00b0040880a7ed8amr20686587edz.137.1645435697689;
        Mon, 21 Feb 2022 01:28:17 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j11sm6895220eda.106.2022.02.21.01.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 01:28:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] weston-init: replace deprecated/disabled fbdev with drm
 backend
Date: Mon, 21 Feb 2022 10:28:11 +0100
Message-Id: <20220221092812.3332815-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 09:28:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162021

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


