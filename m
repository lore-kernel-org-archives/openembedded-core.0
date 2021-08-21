Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web08.2591.1629576493221861582
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Aug 2021 13:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fYL9Wtzb;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id t42so9162788pfg.12
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Aug 2021 13:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xN7lWN7Emhv2xsRKqLZXza6NPxkQdRpJJdQTWvFjNSA=;
        b=fYL9Wtzb6fEb69tSrPvXsNczPcjJEcSKWwhN/kiSWHPAYBMXRYij/EOiUCwkg3QxGA
         cEZs31gLia1B3FbWeVMTPdZxW7otvyoiXvr6c+I/kQxsg+ncMmQsSmS+jzdZyO8KYBDk
         Vejd0JiZ5Q5qAfDZDJBfNfeSDKxrr2x/ZGgWWuagsfhOEftpFBogS4GV3+5zRus4cqaD
         JY4QlUHhYMFCm6m1ov/MkfTfFMFtGdAr31Pu3791C464EBoyfiKrWDBhloNeLOMFeYm4
         ROzMyLmsKckUImu8pwVvqdsjrdGNqOE5xXH3LcCaRB4+dkN312vMnN7zsgUQNISgEezs
         vWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xN7lWN7Emhv2xsRKqLZXza6NPxkQdRpJJdQTWvFjNSA=;
        b=KMDkNF4nwBO4EbBD2J+arI1WYAYHwnuKA1+3vCrPoKIt1Ah6/4SgGgsuM5DE3C/OYp
         4ZPp0uWKzq/QKb25q+5WIyxDbAaaF89gAfiuY/VIOL8lyrfhEC0lJUfXHNOb6Klf3mCG
         jvVNaM6fQiLlLg5GahewRo8U2pMKGueBIjrNE6Z8NmfJWTR4v9j79N5HBglRpQqS1o1W
         kH/OnPL/hJRxaFTz6XLcePcXkFpvvADk4CgiKYyUX1tkkfeEHW56yimvXzCZT+/+dQNa
         F88RBskCy33eJ/W3VUSB3L27rZq+FUNPoPkBkB+NwT3vg9tDG4Ek6nyj+JdlX8mroDHL
         DSkg==
X-Gm-Message-State: AOAM533ok6uuM4Ir+5T5Ccip14eyMGkXNhTNGUuhbUJMmCYomG/26Gls
	oKxicfrAc7+IhX16/j8xPVP5r9uwTnonZQ==
X-Google-Smtp-Source: ABdhPJwmuX8crkqPJjTQtOd0wi8b4OTpxqEuommbvm0Oq8fRo6IM5QIQP2/XB7Z9/hdCR5IyYzCkTg==
X-Received: by 2002:a62:7c96:0:b0:3e5:715b:f8a8 with SMTP id x144-20020a627c96000000b003e5715bf8a8mr11634000pfc.51.1629576492330;
        Sat, 21 Aug 2021 13:08:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1d09])
        by smtp.gmail.com with ESMTPSA id m2sm11175199pfo.45.2021.08.21.13.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 13:08:11 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] weston: Re-order gbm destruction at DRM-backend tear down
Date: Sat, 21 Aug 2021 13:08:09 -0700
Message-Id: <20210821200809.1196569-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes an annoying segfault seen on rpi4 when launching weston during
boot especially using systemd service or sysvinit script, if weston is
launched manually on VT, it works fine. This backport specifically
addresses the issue described above.

For more details see [1]

[1] https://gitlab.freedesktop.org/wayland/weston/-/issues/314

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d-drm-Re-order-gbm-destruction-at-DR.patch | 50 +++++++++++++++++++
 meta/recipes-graphics/wayland/weston_9.0.0.bb |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-libweston-backend-drm-Re-order-gbm-destruction-at-DR.patch

diff --git a/meta/recipes-graphics/wayland/weston/0001-libweston-backend-drm-Re-order-gbm-destruction-at-DR.patch b/meta/recipes-graphics/wayland/weston/0001-libweston-backend-drm-Re-order-gbm-destruction-at-DR.patch
new file mode 100644
index 0000000000..f8f7589499
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0001-libweston-backend-drm-Re-order-gbm-destruction-at-DR.patch
@@ -0,0 +1,50 @@
+From c8bfa1f8d576cdc6d515dbbac36c48c6166be0d5 Mon Sep 17 00:00:00 2001
+From: Marius Vlad <marius.vlad@collabora.com>
+Date: Thu, 1 Apr 2021 00:12:00 +0300
+Subject: [PATCH] libweston/backend-drm: Re-order gbm destruction at DRM-backend tear down
+
+Tearing down the drm-backend when there are no input devices, would call
+for the gbm device destruction before compositor shutdown. The latter
+would call into the renderer detroy function and assume that the
+EGLDisplay, which was created using the before-mentioned gbm device, is
+still available. This patch re-orders the gbm destruction after the
+compositor shutdown when no one would make use of it.
+
+Fixes: #314
+
+Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
+Suggested-by: Daniel Stone <daniel.stone@collabora.com>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/wayland/weston/-/commit/d171c7b3ba346c4d0bd6494f45ebf0be3c3cc5fb]
+---
+ libweston/backend-drm/drm.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libweston/backend-drm/drm.c b/libweston/backend-drm/drm.c
+index 2780f3b..fbcfeca 100644
+--- a/libweston/backend-drm/drm.c
++++ b/libweston/backend-drm/drm.c
+@@ -3025,10 +3025,6 @@ err_drm_source:
+ err_udev_input:
+ 	udev_input_destroy(&b->input);
+ err_sprite:
+-#ifdef BUILD_DRM_GBM
+-	if (b->gbm)
+-		gbm_device_destroy(b->gbm);
+-#endif
+ 	destroy_sprites(b);
+ err_udev_dev:
+ 	udev_device_unref(drm_device);
+@@ -3038,6 +3034,10 @@ err_launcher:
+ 	weston_launcher_destroy(compositor->launcher);
+ err_compositor:
+ 	weston_compositor_shutdown(compositor);
++#ifdef BUILD_DRM_GBM
++	if (b->gbm)
++		gbm_device_destroy(b->gbm);
++#endif
+ 	free(b);
+ 	return NULL;
+ }
+--
+2.33.0
diff --git a/meta/recipes-graphics/wayland/weston_9.0.0.bb b/meta/recipes-graphics/wayland/weston_9.0.0.bb
index fbf181b4a6..cbc2e6a1cd 100644
--- a/meta/recipes-graphics/wayland/weston_9.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_9.0.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
            file://0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch \
            file://0001-meson.build-fix-incorrect-header.patch \
+           file://0001-libweston-backend-drm-Re-order-gbm-destruction-at-DR.patch \
 "
 
 SRC_URI:append:libc-musl = " file://dont-use-plane-add-prop.patch "
-- 
2.33.0

