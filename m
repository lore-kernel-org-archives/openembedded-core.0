Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1485CCF65D8
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 10:28:06 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17250.1769423279594284866
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 02:27:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cja8Hidv;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-81f4c0e2b42so2148822b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 02:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769423279; x=1770028079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zHzXYT1guTHWSTZuwHpO+GR8ldurP36N9A312x0Hl2w=;
        b=Cja8HidvlM+vpK5qB/Uww3mG2PRd6MNirXelQBofrCxxGqEipiun8aZPoPqVpo3PsJ
         kLTlMYq2zekF8Z/w1Jo1O9Q9U5Pco6rcBkcRUC+iSMlj/lVZeLKOMgOjPLdwqr3y/HJz
         lIXWyNteLbf+PEVF83w0HQjhBaLoNImEPH/Q6hU4qFWpQUtBbHurt+T1Ha9TuXW+5zfp
         PjysGTQMXR25T1dOE/VB2wkwXrGvgCiGv7OgOBLLDe0nQ6Gq0Xp5AFy2UXuLtRFLXeZj
         5Bb5MkpOu4F0zZxvqTgElyKFManr86PC13mw3c0DTbwqy2YDAV8lhwQU0byFYnM1S7Rv
         3X8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423279; x=1770028079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHzXYT1guTHWSTZuwHpO+GR8ldurP36N9A312x0Hl2w=;
        b=RDE1b9T9mXGQBUPGBYAWwZsN5IECy7g9rCsgwL1PmLrJ7MCSDUoUV4lmGyz5uFbopW
         1Oc6WaGkjQFsQ47GKWe3GqvgDZ00Tdu2M0dWV08HWLQPIMqq7kgwYQCNBcHOfLcEfTSE
         LiJoEhF7ivJp2PSGJVBF8CR9eUD1ctfzFyTL8x/2TNLiCg2CIZnlgvuRsQyU7KrjcRlE
         Th0hHUlIqxWW7pRbDHYUkK6v3pzVN7f13YqsDAQBNNcHDO0/WpWd6or3uUGbu3KMoMBw
         T06h3bq17QzLP6uJl65Dmas5QhIhwxSzjpW+wKgTEi9OSiOEpXn/FdIwmLeOuQw7VLxk
         WhIQ==
X-Gm-Message-State: AOJu0YwjzCaMkme9Mdcn3KLG6+ihVNgW5KK65g4F2TEvy5oHXdI8Yb4u
	FEAYkDuFYcorAV/tPpNhCeDPvOmQymG8ESXkgqgMOrCUxknEVMG+BKWdcdyJK3JG
X-Gm-Gg: AZuq6aJxjQkof0aGy8wicNKO+3HXcwLe4XuIgmR/k4SBWxMvfqLC3Y9wwhqFI9fS8X8
	Z9TRDcm5eX+QVoSyufdEI5qQfwtVmd2o8IjoHFO5WYC/N6kxx04zZisfrR6eDmZFwLER8uv0l9O
	NS4FJ3Dx/vaLqIV+GrJ1hO1/MvJFFCZ1oYlqGYxtmBxXpMORziqpUJbfvgFoRGlEs7yhVhnNwAe
	Mzu73GEAjxU2NJy3hcGG8UclObMY9JYkXNwQFFmu2lCBIPEoEAF+x7qeSgMGCpGru3h8V4sRgTV
	orbj/jkVO1TqW7RIhkH/ulU47P76UokKmHzl4i/MjR4Cq94uTtt36advgOnJ4oryubb06C8s3uh
	xcYpr5ZF664oUatBYqfDGq7qbL8vsr3sJCEz8L70ZBb/6UUoWXRzqg3UGJeMGpQeNZ5Q/ap8v5f
	d0WiNdWpnZTOY9hAsy0AchY/1D
X-Received: by 2002:a05:6a00:2294:b0:823:9c0:47a8 with SMTP id d2e1a72fcca58-823411db9dfmr3022926b3a.9.1769423278701;
        Mon, 26 Jan 2026 02:27:58 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318644989sm8880357b3a.13.2026.01.26.02.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:27:58 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 1/4] rgb: update 1.1.0 -> 1.1.1
Date: Mon, 26 Jan 2026 23:27:44 +1300
Message-ID: <20260126102747.1077552-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 10:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229979

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: updated md5 hash because of commit[1]

[1] https://gitlab.freedesktop.org/xorg/app/rgb/-/commit/fb06ee0b71ec15d63b6ee4797f954187ec014a37

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-graphics/xorg-app/{rgb_1.1.0.bb => rgb_1.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{rgb_1.1.0.bb => rgb_1.1.1.bb} (71%)

diff --git a/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb b/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb
similarity index 71%
rename from meta/recipes-graphics/xorg-app/rgb_1.1.0.bb
rename to meta/recipes-graphics/xorg-app/rgb_1.1.1.bb
index f14da7fd21..4e1b055f49 100644
--- a/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb
+++ b/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb
@@ -7,10 +7,10 @@ lookup, the rgb program to convert the text file into the binary database \
 format."
 
 DEPENDS += " xorgproto util-macros"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ef598adbe241bd0b0b9113831f6e249a"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dc4f23db04773a414e3c39cc97a9f415"
 PE = "1"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "fc03d7f56e5b2a617668167f8927948cce54f93097e7ccd9f056077f479ed37b"
+SRC_URI[sha256sum] = "c80ff280a02f56c30fadc2dfa210fc6979c4ab968afa315278cb97768b64ecab"
 
 FILES:${PN} += "${datadir}/X11"

