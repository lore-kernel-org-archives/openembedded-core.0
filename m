Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850AACF6D41
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 13:13:34 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.6952.1727874810233681212
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Oct 2024 06:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FmYmH03L;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-718d91eef2eso567019b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 06:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727874809; x=1728479609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g15M8Y28QR/V0Wv6eTZlvltyXk7759R0GNdG5TIeGLg=;
        b=FmYmH03LrpoHnkoXMdVegpDCopdXdTnF0izwkJczjy9PJjsiMALNkNjJoBksToHx6O
         E1YMXVhbInLTNQi0l2pKMuOj12MR6fKk957E11qOJyATbj8T7F8k/Vq91rgggnOGSxIH
         Lub++SAPNkBw/ZNrWN6GOzkgjN4DNvizOgbHhee+VdE8DLm3iT8Q36O8v5vAVAAIYQyY
         0NQc3YnSBzarXdeykDqnXcDG8VRtMtMQOS/lIPXrmFKC0DKtAdKXm3YMbm1WEASSeeBx
         jyX/mhqGzoTUtZ7xn3wgqOTRG04kLYNsxw75pBVAbprHlN+U8jy04beb7H3hPcVlcNeq
         JFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874809; x=1728479609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g15M8Y28QR/V0Wv6eTZlvltyXk7759R0GNdG5TIeGLg=;
        b=vtoXb3CbFDAPSRvUs7V4581I6j6L5eEdojbFzbGDSxd04xD8RLmPa/YDy+EtPVb+Gv
         4bQk9llOHI8AuItlmaQWV4v73Mr/+O7DpgplHtjHADL6X1Hx2Sgr1RLsVk391jxglZVr
         g4OL9krtpFU+hQJyjjm2UdMgofUXTypytRb3mjKzDjTWHYqmEtZB0o2KcijxrujjjcBw
         X5bw2KXWhNra+vjf4so9ldW92/Edg2t0uP76VynOf+rMX2h6cUtxGqE0UU93qpo0eMzL
         rKmXC2Zb8IwbDVn51j3RsderkW8oP+wFAtVKlK981MbqwWv0J+dpo1k3zaoQkbXqWrfC
         Q1vQ==
X-Gm-Message-State: AOJu0YzEeTerazOWx9J5HROQZTrKhA0w5GedshATrf3sXV3yPoHzdliN
	lw1p8tZukiEMSKTpSJUdrzeqjuUWObbNyQTmUcWJ62z7X8ajfcjGOhbzHqF0H9Ewuc0AuyGwX3A
	MUxE=
X-Google-Smtp-Source: AGHT+IEHRii807WkX/GjArzhPerFuzDrm0fJheyChJ0PfngCgLHgTvEkm+/EILKrMV4e/uE9sbIg3w==
X-Received: by 2002:a05:6a00:2192:b0:719:110e:fc8f with SMTP id d2e1a72fcca58-71db79bb452mr12959917b3a.1.1727874809303;
        Wed, 02 Oct 2024 06:13:29 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2649c775sm9773436b3a.29.2024.10.02.06.13.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:13:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/16] kmscube: Add patch to fix -int-conversion build error
Date: Wed,  2 Oct 2024 06:12:55 -0700
Message-Id: <19a899d2ec69572e0eae4576d9fc55a7ba857309.1727874367.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727874367.git.steve@sakoman.com>
References: <cover.1727874367.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 13:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205199

From: Purushottam Choudhary <purushottam27.kumar@lge.com>

On some platforms, `EGLNativeDisplayType` is an int instead of
a pointer, in which case the void pointer will raise
a `-Wint-conversion`.

Add change as a patch instead of updating SRCREV .
if we update SRCREV might will get compatiblity issue
with current gstreamer 1.20.7 version because SRCREV brings changes
which resolves negotiation issues encountered with V4L2 stateless
hardware video decoders when using kmscube video playback option
which has gstreamer dependency requirement to 1.22.0

Signed-off-by: Purushottam Choudhary <purushottam27.kumar@lge.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...001-common-fix-cast-type-in-init_egl.patch | 34 +++++++++++++++++++
 meta/recipes-graphics/kmscube/kmscube_git.bb  |  6 ++--
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/kmscube/kmscube/0001-common-fix-cast-type-in-init_egl.patch

diff --git a/meta/recipes-graphics/kmscube/kmscube/0001-common-fix-cast-type-in-init_egl.patch b/meta/recipes-graphics/kmscube/kmscube/0001-common-fix-cast-type-in-init_egl.patch
new file mode 100644
index 0000000000..50df211d60
--- /dev/null
+++ b/meta/recipes-graphics/kmscube/kmscube/0001-common-fix-cast-type-in-init_egl.patch
@@ -0,0 +1,34 @@
+From b2f97f53e01e07a920761e5d3e3ba22898b794a4 Mon Sep 17 00:00:00 2001
+From: Eric Engestrom <eric@igalia.com>
+Date: Tue, 24 Sep 2024 17:57:45 +0200
+Subject: [PATCH] common: fix cast type in init_egl()
+
+On some platforms, `EGLNativeDisplayType` is an int instead of
+a pointer, in which case the void pointer will raise
+a `-Wint-conversion`.
+
+Let's cast it to the correct type directly.
+
+Closes: https://gitlab.freedesktop.org/mesa/kmscube/-/issues/16
+        https://gitlab.freedesktop.org/mesa/kmscube/-/merge_requests/57
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/kmscube/-/commit/b2f97f53e01e07a920761e5d3e3ba22898b794a4]
+
+Signed-off-by: Purushottam Choudhary <Purushottam27.kumar@lge.com>
+---
+ common.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/common.c b/common.c
+index e52d480..e1e2dcf 100644
+--- a/common.c
++++ b/common.c
+@@ -341,7 +341,7 @@ int init_egl(struct egl *egl, const struct gbm *gbm, int samples)
+ 		egl->display = egl->eglGetPlatformDisplayEXT(EGL_PLATFORM_GBM_KHR,
+ 				gbm->dev, NULL);
+ 	} else {
+-		egl->display = eglGetDisplay((void *)gbm->dev);
++		egl->display = eglGetDisplay((EGLNativeDisplayType)gbm->dev);
+ 	}
+ 
+ 	if (!eglInitialize(egl->display, &major, &minor)) {
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 98f110527e..40c5a14492 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -11,8 +11,10 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
 SRCREV = "9f63f359fab1b5d8e862508e4e51c9dfe339ccb0"
-SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https"
-SRC_URI += "file://0001-texturator-Use-correct-GL-extension-header.patch"
+SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
+           file://0001-texturator-Use-correct-GL-extension-header.patch \
+           file://0001-common-fix-cast-type-in-init_egl.patch \
+"
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


