Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B05C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 18:31:22 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.2168.1659983481453643168
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 11:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iJHNVkH7;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id gk3so18098133ejb.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 11:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Br9+DhNzDydKJdyjt2AUmn2qyvaotXMaj+hUzZx8A5M=;
        b=iJHNVkH7JqRo6cVXHUTVxXWvAKwEd+s7xCuYs+Hkk0Znf+siMKN7loSThVdsgHWe/D
         7mAB6Z/pv+H/kg9HCzx4wCX5ZorJxEtIqpKxwH9e6thEMkpFRf5GZ0P5owd+If9FCwwi
         dUXea1nW/TdoLeKeZVAlh7x0LX/CCSLqB3Jew5t58dnWzTShkjyoBFmFLoGuv7pebGsp
         RpKx1c+8tKRTUtPqAO1knaumPtNcrQD0VAoqbHlh1RYkYa2GLgOddZ16jm15ZFErC5uZ
         NNpP4DBKCoFBx5INmhgsDx1xOxV0fpZawaocAZU1jxorOK8DtAK24zXY3FB4RzqvX6xS
         Rr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Br9+DhNzDydKJdyjt2AUmn2qyvaotXMaj+hUzZx8A5M=;
        b=iS52owRJeqPoUI6oa6UdtqesI+z4Py+WqelA0UCiUCz1hPWQXfWFQw7U7/9p6nvkaf
         yEnL9OI6KL/LgPWXaBCDe2aQ2tFNEdjee+aTYkjR9R4jP7ON1goUaTDA3uiW52z3eQ2y
         34ZvKJxvrHt7b9spNpsBc7CftEd/u1oxyUezThwgXHogrXGG24bYLyfgw6gH8Es1z9dX
         DpcE1GLgcfDbcjEKwenycgjX0Dx4h9B0s2qidpsOT949+OuIExMX+uTV82UT63EJlmBr
         AR6o00bYhZS+DlyuSnPKoIp5+HzuTvLBD/wDcFO6DvxfvPzt8a5zHXOF6oL6j4tIzofB
         0tKw==
X-Gm-Message-State: ACgBeo3B4ppft72a4VNpIYP9teU3fdcLvXk1S7GZ3RuSTH5bXAmb3noP
	I8N+Fxrhvl8wvHGlV6VR6M2HWKPcXdM=
X-Google-Smtp-Source: 
 AA6agR7wKX4uIqHiNI4vEyBcgCQZNtNwbIjmGtymqaUWPQ5VZVoJkQT/7LePF4XaT28AZ00rYmyrsQ==
X-Received: by 2002:a17:906:58d6:b0:72f:25c0:af2b with SMTP id
 e22-20020a17090658d600b0072f25c0af2bmr14840986ejs.326.1659983479815;
        Mon, 08 Aug 2022 11:31:19 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q23-20020aa7cc17000000b0043d5c9281a3sm4867153edt.96.2022.08.08.11.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 11:31:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] kmscube: address linux 5.19 fails
Date: Mon,  8 Aug 2022 20:31:15 +0200
Message-Id: <20220808183115.779592-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 18:31:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169113

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...common.c-do-not-use-invalid-modifier.patch | 27 +++++++++++++++++++
 meta/recipes-graphics/kmscube/kmscube_git.bb  |  6 +++--
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/kmscube/kmscube/0001-drm-common.c-do-not-use-invalid-modifier.patch

diff --git a/meta/recipes-graphics/kmscube/kmscube/0001-drm-common.c-do-not-use-invalid-modifier.patch b/meta/recipes-graphics/kmscube/kmscube/0001-drm-common.c-do-not-use-invalid-modifier.patch
new file mode 100644
index 0000000000..58ff3ba561
--- /dev/null
+++ b/meta/recipes-graphics/kmscube/kmscube/0001-drm-common.c-do-not-use-invalid-modifier.patch
@@ -0,0 +1,27 @@
+From bdde833c254092a47df6c7109a9751653c82aaae Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 8 Aug 2022 20:22:39 +0200
+Subject: [PATCH] drm-common.c: do not use invalid modifier
+
+Prior to kernel 5.19 this was a soft failure, but 5.19
+adds checks that result in a hard syscall fail.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/kmscube/-/merge_requests/33]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ drm-common.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drm-common.c b/drm-common.c
+index 5c9cca2..964e1c3 100644
+--- a/drm-common.c
++++ b/drm-common.c
+@@ -92,7 +92,7 @@ struct drm_fb * drm_fb_get_from_bo(struct gbm_bo *bo)
+ 			modifiers[i] = modifiers[0];
+ 		}
+ 
+-		if (modifiers[0]) {
++		if (modifiers[0] && modifiers[0] != DRM_FORMAT_MOD_INVALID) {
+ 			flags = DRM_MODE_FB_MODIFIERS;
+ 			printf("Using modifier %" PRIx64 "\n", modifiers[0]);
+ 		}
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 58ce26a3d5..f7ee6e4e10 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -11,8 +11,10 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm"
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
 SRCREV = "9f63f359fab1b5d8e862508e4e51c9dfe339ccb0"
-SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https"
-SRC_URI += "file://0001-texturator-Use-correct-GL-extension-header.patch"
+SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
+           file://0001-texturator-Use-correct-GL-extension-header.patch \
+           file://0001-drm-common.c-do-not-use-invalid-modifier.patch \
+           "
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
-- 
2.30.2


