Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FBEEC1E98
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 10:40:00 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17846.1770287999481755034
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 02:39:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bKYJwSnG;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59dd54b1073so1001090e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 02:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770287997; x=1770892797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tq+/ivgtiiFMt+Ee84LB7k908BWo+rsp3hSLmj2nAtQ=;
        b=bKYJwSnGWSM8yeXEhj/cU5+rfvetYFvZXU21cXvWvg65L4BNr9AB16SiLuIbNtyvKZ
         PbwnPqI0OG/LTFxVtzR6c3Zsn2yUrPb4Zg/E+tTcPKoz/z4OHlGnLoGD48k5CqabcDqC
         Xlay691TPfevR9G5JG9VUmuVAzQsoXl0NZRExDeE8AaY16ZgbaoWg+r8Hvs+u/oVjKwB
         vYZoDI0MuTF6qa2+QbBvinx4ydCt794QweX0JDnt6M+SF9Mk8htTyBXlJY3M6uUeZHY1
         0mP8u9LGXkg2YKPCy/FcTCo/V/yNnUiVV/WVMZNfZFjzPRUkTMNEF2uV6pQTC7sCIYtG
         lxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770287997; x=1770892797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tq+/ivgtiiFMt+Ee84LB7k908BWo+rsp3hSLmj2nAtQ=;
        b=OiVkb2PQgdC5IIyDs6Y1TIXZS6zXqz0f30jlzeiQCGZjWez1xzlJew4MhbEn+s0HoV
         9ssEQhqCZPdpfyUdYquJPhTMmMHMyYbdmIi64ShthVYDn4y5AKA0ikX6BTo4Mg1xDc5T
         6y2CR5aZgbX5jMIw29KlyQfO5ii3I7IHuWGFCksVMRyeXCLYxI4w5Lxk4WpHerIBbBGI
         Ct1O/3RQTQV/vjeFgw8SbrtPFsccxc8SxRgCSZRMxXxiA38JHqPXM7A7EDjr3MG7VigH
         xO/5TapWcyveBVu5m3M+TuToh3fbiGbACJk1Dp9AIM4zNoP6zL9iZ8Z148HRsd/ltPuR
         5aMg==
X-Gm-Message-State: AOJu0Yw5/eTHIjrySNCgNd5n6KMDMaGASWuCn+HF+R79kVEkjMPY+ckG
	dLevasS5mr/1pZHQ2QNUBNp5ftEqDUDqYeL5NUGeKW2Y98ZM+NCfw4r06qaPUQ==
X-Gm-Gg: AZuq6aLXxzLbFWKKIm0bOEO+31tsEQ46u4k/wRDsWHA3FJjfbs89vVawnfGW9SHVgMP
	nSD+43rCsm3/jI7oXU7KPm0RC/tNgX3kFtPsiUW5U0eQVs9w6ilK2hognU/T2YzOqDiQ0Swpi6o
	1CKg47bBclzjkPb60rKZfKM1jnWH8skvnWQfTWGCIvEd4wbYu8GJY8yf9cVOlPBrAr0oIdV3f39
	jKLV54/vHV/ne3loK4siOY93EAw/05X0Z4EOL91kWTi7XM/S62v8IgyDwU0GwVe8VEV7zC2gqUj
	ZX/t2+PU1Kn/f8f/JIzgEF04Z8FaGwE2RT37poByRKR6Y+3I2VGw2Oa9QuOpuNsZV/qwJRa3OIz
	6JPMUcXDY9p6Fh0LtOHQ3W/4mttzSLNQhfhbs19ca9uyWV1IiLTs1pJjvrwHv0PpZkfmur3GYx0
	+NleY80mPBER3GF/INkc0dRK//yry+xY/2tR4FyuNkD3/EoD8bY2I6DJHjUEWKZC4hsulqaj8Nv
	qCLM2EhticnBCCkNpltDrc=
X-Received: by 2002:a05:6512:1304:b0:59d:e589:c973 with SMTP id 2adb3069b0e04-59e38c4ac07mr2312700e87.48.1770287996785;
        Thu, 05 Feb 2026 02:39:56 -0800 (PST)
Received: from peterliu-precision-5680.emea.group.atlascopco.com ([2a02:aa1:164c:5789:c12a:fa54:9d4d:4016])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e38822d54sm1294556e87.73.2026.02.05.02.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 02:39:56 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [scarthgap] [PATCH] weston: fix a touch-calibrator issue
Date: Thu,  5 Feb 2026 11:39:51 +0100
Message-ID: <20260205103951.2013061-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 10:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230574

touch-calibrator of weston 13.0.1 does not work, backport the fix from
upstream:
https://gitlab.freedesktop.org/wayland/weston/-/commit/a5c5702112a9ccbf6abbbaac6078982f5f84bb2e

this issue only impact weston 13.0.1, has been fixed in 14.0.1.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 ...ator-Regularise-surface-view-mapping.patch | 78 +++++++++++++++++++
 .../recipes-graphics/wayland/weston_13.0.1.bb |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-touch-calibrator-Regularise-surface-view-mapping.patch

diff --git a/meta/recipes-graphics/wayland/weston/0001-touch-calibrator-Regularise-surface-view-mapping.patch b/meta/recipes-graphics/wayland/weston/0001-touch-calibrator-Regularise-surface-view-mapping.patch
new file mode 100644
index 0000000000..36e74fbfde
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
index d8f0279b65..d2e0383287 100644
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
-- 
2.43.0


