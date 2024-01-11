Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A11C47077
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 16:27:42 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.15720.1704990461095952306
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 08:27:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=c4tdQk8Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d4414ec9c7so28618865ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 08:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704990460; x=1705595260; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2QAvDM/oiC6y/CVgDOshdLdrZvd0rR2pXcTGpI2Rf4=;
        b=c4tdQk8QHX0D2iJ/mbMrb+onXRAOEUHHuhUvE17YbWxmNVcimAd9BXMFeSB+jCkaZA
         MUjxF7TgOEBGITGgGKbusYZZk6Hi8sY1X4YVzb5hHs23RxVzp1nATFqdgc2IyhJnYaam
         j8fzFJOrLhx6uKSNW8xRSmUXuCOe+SY4QMI4X9pJG74oCkXNSL+orv0wtDDTB8sHwLaV
         Lh0UnSzkTSQvUPrGMSg0/C3c1naFULMbKxsdw/X19o5JDx5Xim21wua8XFR2eml9IjD8
         MSZ9Q/R5jyc1jCJThWv6mzl03AHiXEwcHqMOf9nJDl7tc6TUP+ELqtFFnmkvhjOB2Z/q
         T0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704990460; x=1705595260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2QAvDM/oiC6y/CVgDOshdLdrZvd0rR2pXcTGpI2Rf4=;
        b=axNSu/K1QIR4v11GUyQIZ/grH1qVWZwJqtx08wE+kcALx/StzHsnt4yqfvYchQuZGu
         fds/TI+QfBpZs1+hzUOUvs7chIaDXFx7QuQC669sxTdixHidvnNLmKd5zMfvi2r5zbsz
         Z/eAQ3g+pyxBgRw36ElFuQeKtG0W3GYxboBjF5BpJ90yiIIRkhCU1vWNo7WzctFVdllw
         llm7wALIs8GTDt0Vu/GTKjeuklnMAkm7yzXi+FAp93g5zVj8hTh9wc64TKlfkuJ+f0bX
         BnSMkEOgplFFUoaWu+76p5xlRZd2MmnovCfxR9m7tWjQwMOzjuIh0ofaeqn0IZn7f9MR
         gg7Q==
X-Gm-Message-State: AOJu0YxjglI1mqS6dnd3lO14mSggKsmnHFQIZ2iXCxbOn1yN/N79/VTG
	MI/6EVudPBxfqLfH2xGx/NWUqMONEq5hA982MJzIXVJYh1tYnw==
X-Google-Smtp-Source: AGHT+IF1vdVP5+Y9kEnvpb5+k856M45bfGYvw4l4Z+CxsfIGTaGEXfWFlT8zufzfH/Bd0Y3/pCKQ2A==
X-Received: by 2002:a17:903:32c3:b0:1d3:9287:a1a9 with SMTP id i3-20020a17090332c300b001d39287a1a9mr1518497plr.57.1704990460155;
        Thu, 11 Jan 2024 08:27:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ee8600b001d04d730687sm1347577pld.103.2024.01.11.08.27.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 08:27:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 05/12] linux-firmware: Package iwlwifi .pnvm files
Date: Thu, 11 Jan 2024 06:27:18 -1000
Message-Id: <d4f7a9f4715ba2eda753ff6bac07f6905233c3d7.1704990330.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704990330.git.steve@sakoman.com>
References: <cover.1704990330.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 16:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193553

From: Jason Andryuk <jandryuk@gmail.com>

The iwlwifi uses the .pnvm files for newer AX210+ cards, so package them
into the iwlwifi-misc subpackage.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 056c4de1422ff06745c5669f871a1bb6f5390d01)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index c0394b9b3b..b849c086b6 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -1187,7 +1187,10 @@ FILES:${PN}-iwlwifi-7265d   = "${nonarch_base_libdir}/firmware/iwlwifi-7265D-*.u
 FILES:${PN}-iwlwifi-8000c   = "${nonarch_base_libdir}/firmware/iwlwifi-8000C-*.ucode"
 FILES:${PN}-iwlwifi-8265   = "${nonarch_base_libdir}/firmware/iwlwifi-8265-*.ucode"
 FILES:${PN}-iwlwifi-9000   = "${nonarch_base_libdir}/firmware/iwlwifi-9000-*.ucode"
-FILES:${PN}-iwlwifi-misc   = "${nonarch_base_libdir}/firmware/iwlwifi-*.ucode"
+FILES:${PN}-iwlwifi-misc   = " \
+    ${nonarch_base_libdir}/firmware/iwlwifi-*.ucode \
+    ${nonarch_base_libdir}/firmware/iwlwifi-*.pnvm \
+"
 
 RDEPENDS:${PN}-iwlwifi-135-6     = "${PN}-iwlwifi-license"
 RDEPENDS:${PN}-iwlwifi-3160-7    = "${PN}-iwlwifi-license"
-- 
2.34.1


