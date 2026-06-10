Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57987CD98CC
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 14:12:37 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21470.1781100749959001947
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 07:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aFbgp5H1;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso3267976f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 07:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781100748; x=1781705548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WRtY6xGL7WnHCrNbDv0gbr0oXzrqEE/9XIOmUh+8xs=;
        b=aFbgp5H14l9AaG8bjHP6IJNLwvHPCJMpraHIHeg+ZUjlPreKBNldcITRv8NTo4HUrU
         0Duj4OXGotvCbJwqiP+zC+SInZEYDZ7y1jT/oRlyyom8iB68ySVBLBV1CjBvj3DhYUCs
         gefT9D6oNJ1L1IUQUw2d4eAePyzjuV00jBq1xjy2CxS8XeHjHnseOi1kVRL1OMN0m2V8
         wkQ3BLqaMykj4OGrAh5jpwu5vojADt8hptOaMHlYQ7PMiozSAQPXYqS+Rh233cjTjCUj
         Yzl9s5zH/NRIvdcXo13PdusSNyu1YBTV0O37X0bmzgPEPTWxF7Zav4m2sBBAGlnEu3kK
         DyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781100748; x=1781705548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2WRtY6xGL7WnHCrNbDv0gbr0oXzrqEE/9XIOmUh+8xs=;
        b=TEEZuM0pB5LoZBUdLefn42DTpOC25jkNlEpfQ8Lzse17+RQbn8S7CJr7+tufGcGmXU
         XoWimKxWSKwXW2YBjthD+F3FIdPnNgCxPhPjiVbddSUly/lFyhKLxuB8DB+wQofyYijx
         sFBDzlVpXvB+5OTi5dL9l5HEm3g547APR5fAbdIGnhBt2gPAPoRKzL5vctCNfIWuvRM4
         gMDR92vUrxI7mGafQsBXVuTJand2Eg9eArT03qkkvIgpLo5uLcopP1F2iWm9QL3ZA79m
         T7tkbzyJfeh97hQEJQxN5p2ehI4srq+d0WRbeAjvwj4MDy/eJVl1CRBBW6KFGDl1asxF
         kPFw==
X-Gm-Message-State: AOJu0YxHuPJjpxBDercozFVlRVRXdvE02GyB72EchQfnsmRdbzn3HFWW
	oeiyLTbc7M6HrV7/ALtk/ff18PIGRVpJBKoRnESRQ9Hpq/E05DrDjaAgSP/Ntvrr
X-Gm-Gg: Acq92OEWprhJzMf/sDcNA2BigRVo9VsWGhaoXGoYdrRNf4Ph8I/AoaiYRenNe4YuXSC
	Y2piMWXnV07nJ0NC8nFl+6VFUJF082lsGNKJqUJtywl4cmrDswuBSnog5MRd0CZVxt6mUeRj5zl
	C+LPm4fehQeisL0fpiL42Z8MkBtSHNL6bXOnRYWmRh/gdBZtQdR4riTsUHTwZWv/5AkU3GSKWJ7
	8J9gEVPFMYpk7iH906ZGBgknIn3eyKBee36CSgr0NqcF2pg/JO++ZbtHUofJTeWjdhA8R2CZ1id
	cNWF5IOLqfjWp7PeUbkxRBx5FLDhGgbCatDGUrmDkNUcB1LKvXN7e0bJB0fvg6Fwb7Xy+4vyGcz
	1SNuMx5Te1c5vi6S6slsMY6p3Fcn4zCNtwqOxN5o7+ZzZZikgDDKJP52Em7FGKuNRE6QMR8XnDi
	lGnRS+mlXq3bHEEdcA84nZ38d+6sjEanYmKBCZmLSnEa3Qm2eWPtPvCSPqBbGB082XEou82Q==
X-Received: by 2002:a05:6000:4a09:b0:45e:779a:302c with SMTP id ffacd0b85a97d-460566c94ddmr9089899f8f.29.1781100748264;
        Wed, 10 Jun 2026 07:12:28 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm73090471f8f.2.2026.06.10.07.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 07:12:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/4] qemu: add a workaround patch to address crashes in x11-only setups
Date: Wed, 10 Jun 2026 16:12:09 +0200
Message-ID: <20260610141220.709884-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610141220.709884-1-alex.kanavin@gmail.com>
References: <20260610141220.709884-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 14:12:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238365

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-ui-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 8efb2370c6..3071f74650 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -36,6 +36,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
+           file://0001-ui-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch \
            "
 # file index at download.qemu.org isn't reliable: https://gitlab.com/qemu-project/qemu-web/-/issues/9
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
diff --git a/meta/recipes-devtools/qemu/qemu/0001-ui-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch b/meta/recipes-devtools/qemu/qemu/0001-ui-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch
new file mode 100644
index 0000000000..6b84254ac1
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-ui-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch
@@ -0,0 +1,28 @@
+From ba4efe836c488d00e0f44929ee45feb3b1c1e014 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 10 Jun 2026 15:00:26 +0200
+Subject: [PATCH] ui/sdl2.c: force-disable SDL_HINT_VIDEO_X11_FORCE_EGL,
+
+This is problematic in X11-only environments, as it sets
+SDL on a code path that ends in a crash:
+https://gitlab.com/qemu-project/qemu/-/work_items/3540
+
+Upstream-Status: Inappropriate [yocto-specific workaround]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ ui/sdl2.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ui/sdl2.c b/ui/sdl2.c
+index 987ad334b..b4c8a50de 100644
+--- a/ui/sdl2.c
++++ b/ui/sdl2.c
+@@ -871,7 +871,7 @@ static void sdl2_set_hint_x11_force_egl(void)
+          * It's always safe to set the hint even if X11 is not used by SDL.
+          * SDL will work regardless of the hint.
+          */
+-        SDL_SetHint(SDL_HINT_VIDEO_X11_FORCE_EGL, "1");
++        //SDL_SetHint(SDL_HINT_VIDEO_X11_FORCE_EGL, "1");
+         eglTerminate(egl_display);
+     }
+ 
-- 
2.47.3


