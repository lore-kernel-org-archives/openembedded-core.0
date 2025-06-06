Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD8FC5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 12:13:20 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.32086.1749211994351034614
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 05:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GxkW2YHK;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450cfb79177so11009485e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 05:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749211993; x=1749816793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2jzKGdQauT8pPXFKAGbFn/X1ktf+yS9UwezTmYNdHu4=;
        b=GxkW2YHKVurv4va5oh6wwIrq0oKD8w/h3PLnFmX9pOj/zrYKbn/DU1trOU5BKoWZ9L
         yjyaSaiuwrrSZdAhXKaXcM1qCjF7ZuPhuZRyt++54e7dsWAmihiemELj8X4iaxfdfmtn
         hdiM5V74Kk2SQ+zuYQVCSyGGg8b7itZuwH8wBmTKOEoFJBWYll5L4qsUBflI/23sTmOx
         W75euY3Mt0EYcvpauOfFuxTbGdfIt8PQVRbPD4W19VBQMGPWxYKDH75ua0hGQHILnYRF
         JCDq3MMTZN8JumuybuDxZbOSEnCak5/xG+avE6MaNv01nL1hdv0rCRvn9iYuQmEgIvph
         SNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749211993; x=1749816793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2jzKGdQauT8pPXFKAGbFn/X1ktf+yS9UwezTmYNdHu4=;
        b=EVpyITExcyCSvVjqDXvgIi7ZkBNaIz+BbvFr2PVhdS2c3+dlJL3ARC2jD/BiLOsjh9
         qXWMXn4xd+Joi3L7PJptGLK3eubApThKyCwiDJk89RxQdvtSLRUK3oJdwuXD5zQ7Pl9H
         aN81QnLbZnxrgI0lHTm7wEOOkuilH6GoUOes4T/UjqLRs+roi8//rclhyNuKUyjDceOe
         uwhXzkSd9caBdjHAs98eUL2jLoAx4Rr+DYyo7uAShM/7VHrcYcJSHeLQ9U6FV5gjrfe8
         Fi5Jb4FgXYSLAkVTaE40HUyQwMSt3oOcnVMtNhEueSUf8t1Mu92V0lH+cJEBfC75rTeQ
         BMXA==
X-Gm-Message-State: AOJu0YzkGvLibBU3eRKlxq5St0mxS0bs651Vd2VHfHTwdrXljoeN6X7s
	zktmFWQK2o7NienCKCeqA8ld2Y0Zq93HXBI0nlmekpmViC7ho+7ObjnW9zJH+Q==
X-Gm-Gg: ASbGncuaJj0zSY4TwWPRTAULxmZrfa8KSXuV6/u8sJagqiDtvvCgq2CyeLyutztmban
	Aqf6ICzwgV6D+u8otVTj2ZIJvUmf1SIIyqWrBUhMrGWIYIyJ6DYP4KqzWYf/8pyvpg9aHEZrQ7o
	uJfZuH6bVbLPErfuZ99Mn+HZMWVt1uxbcW3cndHsQRZFPHfnY3cT3gqNzREydqXDv9TagHUBGNM
	VR+M7w2GfgIQPT4B+E777zg6p17ModhmemV6ISVCXMvTlURZiCL+/T4Ls9aLqdl50JRKg6X5B2O
	wQ7+tsbJBQMv6/tiujxs81pNE6JESAddL6w9KbOXQhpLlwl3lIxz+z3yu/23Srx0rAVYNXJJ3uE
	cCoJy0tN8kxEvZ6r5wXIdezw=
X-Google-Smtp-Source: AGHT+IE8641h9n+2Jxd25mILW7U39j42JAkblKB9GOIV4u0qH5sjLepcaPfE4Cgy3XLcYlOn3zAwrA==
X-Received: by 2002:a05:600c:6989:b0:442:e9eb:1b48 with SMTP id 5b1f17b1804b1-452014977f7mr31206125e9.24.1749211992384;
        Fri, 06 Jun 2025 05:13:12 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e014sm1718391f8f.3.2025.06.06.05.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 05:13:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] qemu-system-native: enable sdl by default
Date: Fri,  6 Jun 2025 14:12:55 +0200
Message-Id: <20250606121256.487555-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 12:13:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218134

This is already done in target and nativesdk qemu, and in
default templates for both oe-core and poky. Let's just
make it universal.

This also simplifies configurations for bitbake-setup,
as they no longer have to enable sdl separately.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/qemu/qemu-system-native_10.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu-system-native_10.0.2.bb b/meta/recipes-devtools/qemu/qemu-system-native_10.0.2.bb
index 57a7e8515a..22462e2499 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_10.0.2.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_10.0.2.bb
@@ -9,7 +9,7 @@ DEPENDS += "glib-2.0-native zlib-native pixman-native qemu-native"
 
 EXTRA_OECONF:append = " --target-list=${@get_qemu_system_target_list(d)}"
 
-PACKAGECONFIG ??= "fdt alsa kvm pie slirp png pixman \
+PACKAGECONFIG ??= "fdt alsa kvm pie slirp png pixman sdl \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
 "
 
-- 
2.39.5


