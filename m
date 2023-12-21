Return-Path: <ludovic.jozeau@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F24FC35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 14:24:30 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.51746.1703168665911083617
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 06:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=EoHBe5Ln;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: ludovic.jozeau@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40d22d3e751so11840715e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 06:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1703168664; x=1703773464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vnNt0Vyxlgl8kQf3YaVG1tAR7gQGEpDhWYaHiNeN1u8=;
        b=EoHBe5LnUE4Ljr3YStrcfXctoA9RGA10G6xAZ6tWO392Kjx+djvnJyrikTo8AnkkUr
         MyIkgUREtejmEq0raGeVWchuFemgMggh2G1sbQPB1Ee7wexsfibC4YrH5VEDNCM9ZIK+
         tSCc4QyQYpAjG+Sg5TJ8b6sHdWWutDBjjcuz7TRMYtfbk9ZcAihb7sxPzWEJXJLJbzeH
         nR73SO6777Qe8tflf3RJWESlKZZaT8RbuveaOracz3lS/UIKSvHgbuvi3rSMAWkIbQvS
         LBYks370C59rBYnK4FmZLGotE6XWJ+ArHxJwwwDuongDRDuJ3dIfFoEmV2mhQJhzcEJx
         64QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703168664; x=1703773464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnNt0Vyxlgl8kQf3YaVG1tAR7gQGEpDhWYaHiNeN1u8=;
        b=h54NYxlVgQIUajeA0sduZuZ/ZeVB6xsP2PmYn7ggim0rDzRhRQERo+uQ9JkTOYg7Jz
         14ZwBSgh9nPY1m4D4d1eOydCRtC4/GplLYOAh7wmfvu5n5MA5+yh87rU2CN1Z+w8ehqQ
         +Fdcs2n9UIXccz4yq/6wL/baoQgHTIr7bUTCRm91gZX6fuquXFWjneVtgyx+ziSkxo9Q
         jFQrlC2PaEfu+QQ9EebMJz3QTXEPBoBrxZ+7JHU5yeL7nKNr8D1+ic25BHmI891MSsEz
         mI77/xYKDnx5W8+xFvyTDq8YT28dAJ99Hugg+SWlPKiQj3/cG/Zk/NNwGDi1jwO/tPZc
         SFBg==
X-Gm-Message-State: AOJu0YzRSoYu1DKuVlFy8JD3xMYw9gz/KbSgmzZtzR2XTJPPcPzMlfAM
	tQe/2CC2U0jvIMoFnNgZBQe9Efrn11BrNi8YFz209w==
X-Google-Smtp-Source: AGHT+IGt1lKwobWABrzthlNpNtwOCMQoxFgYNtjvCa2/OyLp2Qt07t/InL8SY1XbJ8NR7bRnQjtH7g==
X-Received: by 2002:a05:600c:2050:b0:40d:39c0:c42b with SMTP id p16-20020a05600c205000b0040d39c0c42bmr582271wmg.94.1703168664318;
        Thu, 21 Dec 2023 06:24:24 -0800 (PST)
Received: from localhost.localdomain ([37.166.87.45])
        by smtp.gmail.com with ESMTPSA id n35-20020a05600c3ba300b004064e3b94afsm11650437wms.4.2023.12.21.06.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 06:24:24 -0800 (PST)
From: Ludovic Jozeau <ludovic.jozeau@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Ludovic Jozeau <ludovic.jozeau@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] image-live.bbclass: LIVE_ROOTFS_TYPE support compression
Date: Thu, 21 Dec 2023 15:24:21 +0100
Message-ID: <20231221142421.168190-1-ludovic.jozeau@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 14:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192828

The task for fstypes with compression is the same as the task for the
uncompressed fstypes, e.g. when adding tar.xz to `IMAGE_FSTYPES`, it will
be included into the do_image_tar task and not creating a separate
do_image_tar.xz task.

This commit fixes `LIVE_ROOTFS_TYPE` with compressed fstypes by
depending on the actual task instead of the non-existent
do_image_<fstype>.<compression> task.

Fixes [YOCTO #15331]

Signed-off-by: Ludovic Jozeau <ludovic.jozeau@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/image-live.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image-live.bbclass b/meta/classes-recipe/image-live.bbclass
index 95dd44a8c0..da919d52f9 100644
--- a/meta/classes-recipe/image-live.bbclass
+++ b/meta/classes-recipe/image-live.bbclass
@@ -31,7 +31,7 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
                         virtual/kernel:do_deploy \
                         ${MLPREFIX}syslinux:do_populate_sysroot \
                         syslinux-native:do_populate_sysroot \
-                        ${@'%s:do_image_%s' % (d.getVar('PN'), d.getVar('LIVE_ROOTFS_TYPE').replace('-', '_')) if d.getVar('ROOTFS') else ''} \
+                        ${@'%s:do_image_%s' % (d.getVar('PN'), d.getVar('LIVE_ROOTFS_TYPE').replace('-', '_').split('.')[0]) if d.getVar('ROOTFS') else ''} \
                         "
 
 
-- 
2.43.0


