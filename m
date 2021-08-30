Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.13900.1630308851415211051
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 00:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="197789573"
X-IronPort-AV: E=Sophos;i="5.84,362,1620716400"; 
   d="scan'208";a="197789573"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2021 00:34:18 -0700
X-IronPort-AV: E=Sophos;i="5.84,362,1620716400"; 
   d="scan'208";a="509469272"
Received: from hongkekh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.234.105])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2021 00:34:17 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 4/9] weston: Re-order gbm destruction at DRM-backend tear down
Date: Mon, 30 Aug 2021 15:33:55 +0800
Message-Id: <922ed57043282cdf0c264d42f16362bd8d0890b2.1630306698.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1630306698.git.anuj.mittal@intel.com>
References: <cover.1630306698.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Fixes an annoying segfault seen on rpi4 when launching weston during
boot especially using systemd service or sysvinit script, if weston is
launched manually on VT, it works fine. This backport specifically
addresses the issue described above.

For more details see [1]

[1] https://gitlab.freedesktop.org/wayland/weston/-/issues/314

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 74e0249af85782af436791d1339ce864536d2022)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
index bcbac06d58..ef12cb8c85 100644
--- a/meta/recipes-graphics/wayland/weston_9.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_9.0.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
            file://0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch \
            file://0001-meson.build-fix-incorrect-header.patch \
+           file://0001-libweston-backend-drm-Re-order-gbm-destruction-at-DR.patch \
 "
 
 SRC_URI_append_libc-musl = " file://dont-use-plane-add-prop.patch "
-- 
2.31.1

