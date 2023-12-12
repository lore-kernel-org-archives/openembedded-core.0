Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1BAC4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 23:37:57 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.11374.1702424266900190222
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 15:37:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=sinH50RY;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-32f8441dfb5so5802072f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 15:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1702424265; x=1703029065; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V1uOBRcMF9qvNqgvfbW7zOXt9XLiZKYS7rG5K7vCz8c=;
        b=sinH50RYAK9V6a9ZsCOAer6KznzunbzDZ4VKYwvv9kn/u6qgt+5pWJprt9Gwg5BOxG
         ISeovKNIMeLx4H13qwmH8+cYnSO4UQ5oIp4/5KjjkLGtjeTyCqvfZkbshDJGUVMp/J5H
         9nc7tt2joqqE1i6bS38HoU1BP59FehrJzj6otRVXhefpOF/uFJyb1xJo716kqxqx0NWG
         4ZZQBf5tOLywp9efOaIQhVAzSx/fgsDTbxEAJv61L0j12p3Qn0Vp2DLskXlr6hh8n5bK
         QuCA4lg5fpyv9jd1F7tLeLpG/hvMBYa2/mB2/lqGaBNZfAoA6fw6EWByGwsq4yVUMG4e
         AY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702424265; x=1703029065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1uOBRcMF9qvNqgvfbW7zOXt9XLiZKYS7rG5K7vCz8c=;
        b=RifJFidL6stSheNDvj0OSIxkXG9ISQvbNfb+ej92PFU4j7hIFl8oOENFhu86vb4BN0
         rbp3+TVSMZhtkQAVS8rD9Jyi23uESrubx76dsjjNNfbX3Q3gegql+Vq5ZwDGWaYpZShu
         YocKZXxXzugTvz7Od8ntq5kZhOToX9HF4/SwoEuGjeBXCf+K8edpEqeTWF2898GBbAy8
         tiI5vzZVVLCVKJTb9r6xET0YM83uwmCtj94LvJC284b/r2iwV7iIoawcijnnbO7PRegk
         mC75L6m0hfM3uj16kKxrKm7AufUt1v8JL41G9NHeh1LJ5f+ub5ImMTcHcMtMPmpB1lWD
         U0ag==
X-Gm-Message-State: AOJu0YymFXzWWklFJrBpmI+Vf6PYU344ZH7vjU2KpWicuArXisWjN8dG
	FnMnDRQZ6dpaQzsRnPn6M2CMS6fgTLPcqGlQRWY=
X-Google-Smtp-Source: AGHT+IHq5naYoMzs5ddkEkwca0d1igCsD7GYWiRfpwge3Gcf2dFGxgt9elAl6a4cr/uMOV5UhjYOnA==
X-Received: by 2002:a5d:5103:0:b0:333:58f7:6f91 with SMTP id s3-20020a5d5103000000b0033358f76f91mr3010476wrt.29.1702424264581;
        Tue, 12 Dec 2023 15:37:44 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id g12-20020adfa48c000000b003335eded7f5sm11898115wrb.68.2023.12.12.15.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 15:37:44 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] strace: Disable bluetooth support by default
Date: Wed, 13 Dec 2023 00:37:23 +0100
Message-Id: <20231212233723.2543380-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 23:37:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192253

The bluetooth support adds a bluez5 dependency (and,recursively, a lot
of other stuff). Disable it by default to avoid having to build all of
this when it is not needed.

This decrease the number of tasks run for a core-image-minimal build by
~1000 (-21%).

To re-enable bluetooth support in strace, add "bluez" to strace
PACKAGECONFIG. For example, in local.conf:
  PACKAGECONFIG:append:pn-strace = "bluetooth"

Fixes [YOCTO #15323]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/strace/strace_6.6.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace_6.6.bb b/meta/recipes-devtools/strace/strace_6.6.bb
index a3de7941cf..c355b45b20 100644
--- a/meta/recipes-devtools/strace/strace_6.6.bb
+++ b/meta/recipes-devtools/strace/strace_6.6.bb
@@ -22,9 +22,6 @@ inherit autotools ptest
 # Not yet ported to rv32
 COMPATIBLE_HOST:riscv32 = "null"
 
-PACKAGECONFIG:class-target ??= "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
-"
 
 PACKAGECONFIG[bluez] = "ac_cv_header_bluetooth_bluetooth_h=yes,ac_cv_header_bluetooth_bluetooth_h=no,bluez5"
 PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
-- 
2.30.2


