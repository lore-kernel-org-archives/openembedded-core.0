Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A91F357CB
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:12 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21471.1771943582912773153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aNr+3gR5;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48069a48629so57415945e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943581; x=1772548381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/TfIeYbwDYwq2jt5K0tEtbShIgKRu8f7OGmcyjLDVwM=;
        b=aNr+3gR5A5oSykGeCDVjt9phaMVlBSHbN2jEnOIlTuoOk5/x8eHNn2SdP/Rtvun6r2
         N9QpvAG8sMvymZQneK6T7kyMhDNe5BuaPgATGyrpIHazm1pDbBTrL0KSB47VLcjMwxVi
         mkOpRoAKepXjnJxJTnxHXUq7qLV6kvKM841qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943581; x=1772548381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/TfIeYbwDYwq2jt5K0tEtbShIgKRu8f7OGmcyjLDVwM=;
        b=OvBeHR9Qd5IEI5rkzCAvh3WFqO85RVwHXU+QzywYuFMurs+MrSKgp7ATNAh/kkvfgt
         +d91RG1qGN7ZPcYdLY2MI64mX5SmyV+MkZdASBIHRAXKIy73PoriSAhSuzJRKqQpVxrp
         Kv+STcch0yxKhPKs+HxYEAhXujf9Q/oaKp9U4avudC023LF9T1z+rc+2rvU09uHYpYhd
         PmQhwVY/oUTxselKPTfXKi7+SQBkYCpmAczP9WsP1S1kEL8YY+t6XNqWH5AqZ2crFB2/
         AaIuapvMMFwrdm3aU1UhIULDxIwRhnUkkIvKOgzz4kurg8GdKFH4iu8UeQ8ah9P38G8i
         8M2Q==
X-Gm-Message-State: AOJu0Yxq5DtXhwf341w0MccWPhrRVXHjLrCS98MRsy3kPdzecTTQod6h
	Zp4XMQAKQouRtQ+Hqwg0RsFowVt46YHJ4cu4Y8Zyz5614TL50Ccik7LVkxxMBTPJnOuRSQPlRAW
	yZi6c
X-Gm-Gg: AZuq6aKM3ZiGPATq5JVisfiQnsaQnR5ozCghsjhMlwHx86c27BrdHH71Sbl9UZJ8BAR
	jLL2eEGeJW1hB7FQFOqDEAd89n024fv8dYvBEIxcotiFKoZwuFmmM5j4bs3ce6w2pGDjWjJzalI
	SkLoStiMR30AJ12tdX73epSUDIQL9z1TNpVyP9Ou/LFKcWzn9ZzTQdNr7QnyglN6eZRPeTJuQah
	yaIL82hY4B81yf45Z7JFIal7LocGyUKG5ERC1Z6dbubps/xcLRqT/MDHNhdJ99JWw8vivk5QBuq
	51P4mGtU7nnA6U8tZ04BqMamA3iuKSzD5OG/A/cHgJcrrWWh0gXoL/P5sdPMHn6ij9+pmKOgzjS
	3r907Go59NSPgmUSwNzGwr7kd+zvXmieZAvlVz8RlTnvJyuYqrITQtEB6IF800GO83T0JXCrMbx
	mG1D767YGrDRXVNNbHsy15VTJVrjxBzaD1HTRkfaozZVYqv2tKe4Adp1q+Y5R7yRgvsIy11d4Tg
	GHnJMrt6b4vRpsFCQC7bz5tUO5PPTTBTQ==
X-Received: by 2002:a05:600c:1e28:b0:477:5af7:6fa with SMTP id 5b1f17b1804b1-483a95fe96bmr181369315e9.32.1771943580877;
        Tue, 24 Feb 2026 06:33:00 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.32.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:00 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/44] weston: fix a touch-calibrator issue
Date: Tue, 24 Feb 2026 15:31:46 +0100
Message-ID: <8628c7199caf78c6a8da4b23132d60e86939da49.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231825

From: Ming Liu <liu.ming50@gmail.com>

touch-calibrator of weston 13.0.1 does not work, backport the fix from
upstream:
https://gitlab.freedesktop.org/wayland/weston/-/commit/a5c5702112a9ccbf6abbbaac6078982f5f84bb2e

this issue only impact weston 13.0.1, has been fixed in 14.0.1.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ator-Regularise-surface-view-mapping.patch | 78 +++++++++++++++++++
 .../recipes-graphics/wayland/weston_13.0.1.bb |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-touch-calibrator-Regularise-surface-view-mapping.patch

diff --git a/meta/recipes-graphics/wayland/weston/0001-touch-calibrator-Regularise-surface-view-mapping.patch b/meta/recipes-graphics/wayland/weston/0001-touch-calibrator-Regularise-surface-view-mapping.patch
new file mode 100644
index 00000000000..36e74fbfdef
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0001-touch-calibrator-Regularise-surface-view-mapping.patch
@@ -0,0 +1,78 @@
+From a5c5702112a9ccbf6abbbaac6078982f5f84bb2e Mon Sep 17 00:00:00 2001
+From: Daniel Stone <daniels@collabora.com>
+Date: Thu, 23 Nov 2023 16:44:10 +0000
+Subject: [PATCH] touch-calibrator: Regularise surface/view mapping
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/wayland/weston/-/commit/a5c5702112a9ccbf6abbbaac6078982f5f84bb2e]
+
+Manually mark the surface as mapped exactly once - in the committed
+handler where we have our content, and assert that it's correct when we
+want to use the surface by instantiating a view.
+
+The view handling can be made much more simple by simply using the new
+view helpers.
+
+Signed-off-by: Daniel Stone <daniels@collabora.com>
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+---
+ libweston/touch-calibration.c | 22 ++++++++++++----------
+ 1 file changed, 12 insertions(+), 10 deletions(-)
+
+diff --git a/libweston/touch-calibration.c b/libweston/touch-calibration.c
+index 45689ddd..f4c9366a 100644
+--- a/libweston/touch-calibration.c
++++ b/libweston/touch-calibration.c
+@@ -189,6 +189,7 @@ map_calibrator(struct weston_touch_calibrator *calibrator)
+ 	assert(calibrator->output);
+ 	assert(calibrator->surface);
+ 	assert(calibrator->surface->resource);
++	assert(weston_surface_is_mapped(calibrator->surface));
+ 
+ 	calibrator->view = weston_view_create(calibrator->surface);
+ 	if (!calibrator->view) {
+@@ -196,17 +197,9 @@ map_calibrator(struct weston_touch_calibrator *calibrator)
+ 		return;
+ 	}
+ 
+-	weston_layer_entry_insert(&c->calibrator_layer.view_list,
+-				  &calibrator->view->layer_link);
+-
+ 	weston_view_set_position(calibrator->view, calibrator->output->pos);
+-	calibrator->view->output = calibrator->surface->output;
+-	calibrator->view->is_mapped = true;
+-
+-	calibrator->surface->output = calibrator->output;
+-	weston_surface_map(calibrator->surface);
+-
+-	weston_output_schedule_repaint(calibrator->output);
++	weston_view_move_to_layer(calibrator->view,
++				  &c->calibrator_layer.view_list);
+ 
+ 	device->ops->get_calibration(device, &device->saved_calibration);
+ 	device->ops->set_calibration(device, &identity);
+@@ -260,6 +253,13 @@ touch_calibrator_surface_committed(struct wl_listener *listener, void *data)
+ 	wl_list_remove(&calibrator->surface_commit_listener.link);
+ 	wl_list_init(&calibrator->surface_commit_listener.link);
+ 
++	if (!weston_surface_has_content(surface)) {
++		wl_resource_post_error(calibrator->resource,
++				       WESTON_TOUCH_CALIBRATOR_ERROR_BAD_SIZE,
++				       "calibrator surface size has no content");
++		return;
++	}
++
+ 	if (surface->width != calibrator->output->width ||
+ 	    surface->height != calibrator->output->height) {
+ 		wl_resource_post_error(calibrator->resource,
+@@ -268,6 +268,8 @@ touch_calibrator_surface_committed(struct wl_listener *listener, void *data)
+ 		return;
+ 	}
+ 
++	weston_surface_map(surface);
++
+ 	weston_compositor_set_touch_mode_calib(calibrator->compositor);
+ 	/* results in call to touch_calibrator_mode_changed() */
+ }
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/wayland/weston_13.0.1.bb b/meta/recipes-graphics/wayland/weston_13.0.1.bb
index d8f0279b657..d2e0383287f 100644
--- a/meta/recipes-graphics/wayland/weston_13.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_13.0.1.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
 SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
            file://0001-libweston-tools-Include-libgen.h-for-basename-signat.patch \
            file://0001-vnc-Allow-neatvnc-in-version-0.8.0.patch \
+           file://0001-touch-calibrator-Regularise-surface-view-mapping.patch \
            file://weston.png \
            file://weston.desktop \
            file://xwayland.weston-start \

