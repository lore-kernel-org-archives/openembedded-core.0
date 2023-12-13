Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34743C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:43:51 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.31452.1702453425772705042
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:43:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=beX+JdwR;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40c2718a768so65493775e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 23:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1702453423; x=1703058223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yjD0ZLkqvMCh0mi7rBmCVMGu8tIdYIj0pp8boRnEDz8=;
        b=beX+JdwRtaxP1RnR0kvuNu4gk6yO89jplkRZdnTng9WA6UxZe7/JMdwebvNuWrPWq4
         sQDSaWmgBi8ZdroHaywlD4RCMR9iaUOdQWjrHFt4bX5OalzDYFRJDpVw8GpUH04mVdHg
         QxvLym7JokaSAmpINCEs/57Za8tH9TfRTQHaznoBnnWdhN3Q/p+kVGEr4Ee73XUcr6KM
         wpkIJ9KYiGNNIBbT4UWJ0yHAGXZ0dSws1ohAmVn6C9tDLU2nbLuhmcbIhwXyyiXedWzg
         CdSN4vX0/mRxES3MLH29SL2Va1Lirv2DM9sjnUbQX9hGEdxWjR4RtgJhTbWlT582j+FE
         gQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702453423; x=1703058223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjD0ZLkqvMCh0mi7rBmCVMGu8tIdYIj0pp8boRnEDz8=;
        b=nAJIojm6+XMt53iNXBa/HqM6+3NeaseLEqZUCwMOK+y+F0ga1pMSNJJStQFhJ50D2R
         k6uXlR2QtaSOtYkjOC4cCJLcg1GMfgDZixn/2WAoCJtbmmHVnMcrInYb/LYC7W7P+GJc
         8Fd91v+louKntQNpfAjb0hg3EzG12oeMtdWxeazWNQ2hfNZcBt3pA1CZ/WL4U+hbrzw+
         I6XT3HZIu5wwCAxl3t0Bj53H5ItctMLtkgdX/17Yd/7GY0dHYaf5MjjcGWbO4Gh0z+ep
         KV5bJ+POU6xM89GN3l2x/PLD2jM0EzCN6bGfeUGFzUm0B8isML2c+hglWElEPhGkugeV
         jXvA==
X-Gm-Message-State: AOJu0Yyh61iL7NW938Sh1GFl8I0/GeDeIiPGRARN6l++hG0uTiybPCjc
	x0Mqc8IjHkLsGJyqssa2jjEp6yUFf6KDaBj0wyPCnw==
X-Google-Smtp-Source: AGHT+IESDypCrraXd4kXh321BGc+M+lAJk86HnguSiCvADWYuq5yN5Zw+nelJrb/0zGW0hUctFlzEw==
X-Received: by 2002:a05:600c:1da1:b0:40c:2aeb:a7e1 with SMTP id p33-20020a05600c1da100b0040c2aeba7e1mr4050308wms.65.1702453423492;
        Tue, 12 Dec 2023 23:43:43 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([2a02:8440:b218:5da4:7981:9acb:97b:5af4])
        by smtp.gmail.com with ESMTPSA id j12-20020a5d452c000000b003363db0399asm617488wra.94.2023.12.12.23.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:43:43 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH v2] strace: Disable bluetooth support by default
Date: Wed, 13 Dec 2023 08:43:23 +0100
Message-Id: <20231213074323.2547894-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 07:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192269

The bluetooth support adds a bluez5 dependency (and,recursively, a lot
of other stuff). Disable it by default to avoid having to build all of
this when it is not needed.

This decrease the number of tasks run for a core-image-minimal build by
~1000 (-21%).

To re-enable bluetooth support in strace, add "bluez" to strace
PACKAGECONFIG. For example, in local.conf:
  PACKAGECONFIG:append:pn-strace = "bluez"

Fixes [YOCTO #15323]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Suggested-by: Ross Burton <ross.burton@arm.com>
---
v1->v2:
* Fixed local.conf example (thanks Tim)
* Added Suggested-by: Ross (thanks Ross)
* Removed an extra empty line
---
 meta/recipes-devtools/strace/strace_6.6.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace_6.6.bb b/meta/recipes-devtools/strace/strace_6.6.bb
index a3de7941cf..eeffe477b3 100644
--- a/meta/recipes-devtools/strace/strace_6.6.bb
+++ b/meta/recipes-devtools/strace/strace_6.6.bb
@@ -22,10 +22,6 @@ inherit autotools ptest
 # Not yet ported to rv32
 COMPATIBLE_HOST:riscv32 = "null"
 
-PACKAGECONFIG:class-target ??= "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
-"
-
 PACKAGECONFIG[bluez] = "ac_cv_header_bluetooth_bluetooth_h=yes,ac_cv_header_bluetooth_bluetooth_h=no,bluez5"
 PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
 
-- 
2.30.2


