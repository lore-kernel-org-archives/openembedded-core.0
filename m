Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F09AD37491
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 13:32:15 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.48949.1729171932536255270
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 06:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RyKgxqhv;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20cb7088cbcso7211685ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 06:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729171932; x=1729776732; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+2G/GUrlCPJswKYNSsBEZQf2yGD6i+CjDgB4h2EsaDA=;
        b=RyKgxqhvk0HElbPrp5R4k/FInyNSx1EmWGE025cERN+6Si7duXnn4z38KqxA4hwBJ+
         UMs1nr6qFZXW7kYESO+EB8SYGZf5WW52J88d1h8fkFtJVPX+J+g7dgoEJINc09W6iip6
         eh1p8PHOzo0AcXBfY4tnCbpVqDmezmPIrtrjnRSs+YSIBtu11+OnSQ40ZRa5CAiKx+kQ
         0euVf9rbDGkTOVH84lLKswXbdwEgyH13q5XICQ4UTou3PRtanFc1FzozCWUXbKAXhh/q
         blER4FNezVM7DaWHvktWRdOa7jbL6rsSx1HZjc0hPlscho1BR+Y1a8MhUtDxAfvCS7Tt
         bRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729171932; x=1729776732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2G/GUrlCPJswKYNSsBEZQf2yGD6i+CjDgB4h2EsaDA=;
        b=jh8Z4ToIwSG0oC2eYYXhAeUXG2EbQ6no20FYOljH0RX0LWkXRG+KYWjtn3GQmE8nV5
         qSVYtA5yM0VnD6ZqtOETmCerQWci6R/mJhmW0Jef+blH+OtdR9kXBfY3WWmu7BbMjfcE
         e5pivE/xrZ7YI92cux0gOcj04js8vzdS/jzZ6IIi/UpOYwwiiNgAVSEoI5qJS5DOiPLA
         Lj+E3PZ6UXpKidA9WWy35tOnkmoKAeFUYDJKT0SNUsqZP2qXW/Tm8x7AfP9FkSFQGcgc
         aNnCndKiLrnCFD0B0gBWEwLCKQb8f2LArmdgyll66R9GxUYmK4qKkWEzW8ifnRn4LG7F
         tKxg==
X-Gm-Message-State: AOJu0YxVdr+WIp0M78bm0osCjSkIjkGm5WTYcQzjp7xqjRcxGdVitH8k
	8Sji3fCDA40VLe2IUUXnhISh3StvAy80HGKZxc7aHAeNeDy/VSv7Ts39iKwMPKQsb9K39ka6f/C
	B
X-Google-Smtp-Source: AGHT+IFFu5xMolmuwjGcCv3DhZv48V5LKwoSCG0N6Mur3ooUo0WkbaQoDDtKvPr+veT4WkJGTJqmVw==
X-Received: by 2002:a17:902:d487:b0:20c:a44b:3221 with SMTP id d9443c01a7336-20ca44b34d5mr305082545ad.15.1729171931709;
        Thu, 17 Oct 2024 06:32:11 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1805b093sm44161595ad.254.2024.10.17.06.32.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 06:32:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/5] kmscube: create_framebuffer: backport modifier fix
Date: Thu, 17 Oct 2024 06:31:57 -0700
Message-Id: <983e3efb51ab22f1fa5f90cbbfba2d701aa425fc.1729170868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729170868.git.steve@sakoman.com>
References: <cover.1729170868.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 13:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206025

From: Randolph Sapp <rs@ti.com>

Backport the upstream buffer modifier fix for create_framebuffer to
handle the case where no valid modifiers are available.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...common.c-do-not-use-invalid-modifier.patch | 31 +++++++++++++++++++
 meta/recipes-graphics/kmscube/kmscube_git.bb  |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-graphics/kmscube/kmscube/0001-drm-common.c-do-not-use-invalid-modifier.patch

diff --git a/meta/recipes-graphics/kmscube/kmscube/0001-drm-common.c-do-not-use-invalid-modifier.patch b/meta/recipes-graphics/kmscube/kmscube/0001-drm-common.c-do-not-use-invalid-modifier.patch
new file mode 100644
index 0000000000..dff2f20613
--- /dev/null
+++ b/meta/recipes-graphics/kmscube/kmscube/0001-drm-common.c-do-not-use-invalid-modifier.patch
@@ -0,0 +1,31 @@
+From 23e3ab9b32258bfffd302769fdd290008da8277e Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 8 Aug 2022 20:22:39 +0200
+Subject: [PATCH] drm-common.c: do not use invalid modifier
+
+Prior to kernel 5.19 this was a soft failure, but 5.19
+adds checks that result in a hard syscall fail.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/kmscube/-/commit/23e3ab9b32258bfffd302769fdd290008da8277e]
+Signed-off-by: Randolph Sapp <rs@ti.com>
+
+---
+ drm-common.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drm-common.c b/drm-common.c
+index eb5ac20..e736922 100644
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
+-- 
+2.46.0
+
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 40c5a14492..4051058128 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -14,6 +14,7 @@ SRCREV = "9f63f359fab1b5d8e862508e4e51c9dfe339ccb0"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
            file://0001-texturator-Use-correct-GL-extension-header.patch \
            file://0001-common-fix-cast-type-in-init_egl.patch \
+           file://0001-drm-common.c-do-not-use-invalid-modifier.patch \
 "
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.34.1


