Return-Path: <andrey.konovalov@linaro.org>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 475BC786D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 09:12:35 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id f3so20982453lfe.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 01:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=fS4EZejR9fVZFBt83bSx2BqgJiRgapXo/EQhYpEfwaA=;
	b=L7ha4kuR0D6QkEsAUy5tLPGcaX9z08qjQ2mR2bD/C8g3ZDpvDNYw1NPH+COEn0yz/C
	bB79mAy/fmsIyqmQ/v3QPK0Wfq5nxqODPII1UxM9eup5SCQcJoMfbWmYvWKqLo+qRUEw
	CtkYSRTolbRaY7ujmgAsBtVnzdwTBkDMEqthY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fS4EZejR9fVZFBt83bSx2BqgJiRgapXo/EQhYpEfwaA=;
	b=VywsG7UKqI28a80PJnwWWk/4FdFo5yypMOJC5AxZv/CY7aj9vMlNTg81gaTSWnpMtZ
	GE6OGjOaZkfO5xgyeXyfcWbcJYby9q1tFeYEasTjfxGLAM8cUQD9Ewrtq3kH3uztqtad
	pfRheOuGQpyrVQ3BeATyN7HHmyiljgtBlAwIlLBTsN0qz83M1PImGahvq//0/BkgEGFo
	XNdlp7bb/VsX8be2GX3pxGSfW9/K61OzcMfO1WwSFnpTzY4dps4TxhdfVsvc1Ej2I3LQ
	/KuAWTmeag3KUGHVYQmKMV6lmXE1OhDPL5zs9ex940T2YjSXPe49RhvOaKmtRclGyEBs
	PoSA==
X-Gm-Message-State: AKwxyteaUG7NHgU2I5XtPsDGnReZGmWaPjJ8jjUVQLHnTv0d/2KB74sy
	+hIxKs8M2I6baeh6CIPxqLo+2zqIn+w=
X-Google-Smtp-Source: ACJfBotE0G7hlAE8gxfENVRZEO8tK7evSj7LxCSIsKoFHKE3iAodIXBRjJpHbLd/OPabDo8Okx5/oA==
X-Received: by 10.25.83.198 with SMTP id h67mr19590568lfl.135.1516180356249;
	Wed, 17 Jan 2018 01:12:36 -0800 (PST)
Received: from ynk-TM8481.dev.rtsoft.ru ([62.117.114.130])
	by smtp.googlemail.com with ESMTPSA id
	d81sm706996lfd.39.2018.01.17.01.12.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Jan 2018 01:12:35 -0800 (PST)
From: Andrey Konovalov <andrey.konovalov@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2018 12:12:18 +0300
Message-Id: <1516180338-6414-1-git-send-email-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.7.4
Subject: [rocko][RESEND PATCH] weston: add patch to set pitch correctly for subsampled textures
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jan 2018 09:12:36 -0000

This fixes display issue with YUV420/I420 and NV12 formats, that
can result in crash of weston.

The master branch has this fix as part of commit 148920f3971d "weston:
Bump version to 3.0.0". The patch has been rebased to apply cleanly
to weston 2.0.0.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 ...t-pitch-correctly-for-subsampled-textures.patch | 55 ++++++++++++++++++++++
 meta/recipes-graphics/wayland/weston_2.0.0.bb      |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch

diff --git a/meta/recipes-graphics/wayland/weston/weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch b/meta/recipes-graphics/wayland/weston/weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch
new file mode 100644
index 0000000..c188018
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch
@@ -0,0 +1,55 @@
+Multi-plane sub-sampled textures have partial width/height, e.g.
+YUV420/I420 has a full-size Y plane, followed by a half-width/height U
+plane, and a half-width/height V plane.
+
+zwp_linux_dmabuf_v1 allows clients to pass an explicit pitch for each
+plane, but for wl_shm this must be inferred. gl-renderer was correctly
+accounting for the width and height when subsampling, but the pitch was
+being taken as the pitch for the first plane.
+
+This does not match the requirements for GStreamer's waylandsink, in
+particular, as well as other clients. Fix the SHM upload path to
+correctly set the pitch for each plane, according to subsampling.
+
+Tested with:
+  $ gst-launch-1.0 videotestsrc ! waylandsink
+
+Upstream-Status: Backport [https://patchwork.freedesktop.org/patch/180767/]
+
+Signed-off-by: Daniel Stone <daniels@collabora.com>
+Fixes: fdeefe42418 ("gl-renderer: add support of WL_SHM_FORMAT_YUV420")
+Reported-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
+Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=103063
+
+---
+ libweston/gl-renderer.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libweston/gl-renderer.c b/libweston/gl-renderer.c
+index 244ce309..40bf0bb6 100644
+--- a/libweston/gl-renderer.c
++++ b/libweston/gl-renderer.c
+@@ -1285,14 +1285,13 @@ gl_renderer_flush_damage(struct weston_surface *surface)
+ 		goto done;
+ 	}
+ 
+-	glPixelStorei(GL_UNPACK_ROW_LENGTH_EXT, gs->pitch);
+-
+ 	if (gs->needs_full_upload) {
+ 		glPixelStorei(GL_UNPACK_SKIP_PIXELS_EXT, 0);
+ 		glPixelStorei(GL_UNPACK_SKIP_ROWS_EXT, 0);
+ 		wl_shm_buffer_begin_access(buffer->shm_buffer);
+ 		for (j = 0; j < gs->num_textures; j++) {
+ 			glBindTexture(GL_TEXTURE_2D, gs->textures[j]);
++			glPixelStorei(GL_UNPACK_ROW_LENGTH_EXT, gs->pitch / gs->hsub[j]);
+ 			glTexImage2D(GL_TEXTURE_2D, 0,
+ 				     gs->gl_format[j],
+ 				     gs->pitch / gs->hsub[j],
+@@ -1317,6 +1316,7 @@ gl_renderer_flush_damage(struct weston_surface *surface)
+ 		glPixelStorei(GL_UNPACK_SKIP_ROWS_EXT, r.y1);
+ 		for (j = 0; j < gs->num_textures; j++) {
+ 			glBindTexture(GL_TEXTURE_2D, gs->textures[j]);
++			glPixelStorei(GL_UNPACK_ROW_LENGTH_EXT, gs->pitch / gs->hsub[j]);
+ 			glTexSubImage2D(GL_TEXTURE_2D, 0,
+ 					r.x1 / gs->hsub[j],
+ 					r.y1 / gs->vsub[j],
diff --git a/meta/recipes-graphics/wayland/weston_2.0.0.bb b/meta/recipes-graphics/wayland/weston_2.0.0.bb
index 54b07bd..063494c 100644
--- a/meta/recipes-graphics/wayland/weston_2.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_2.0.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-configure.ac-Fix-wayland-protocols-path.patch \
            file://xwayland.weston-start \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
+           file://weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch \
 "
 SRC_URI[md5sum] = "15f38945942bf2a91fe2687145fb4c7d"
 SRC_URI[sha256sum] = "b4e446ac27f118196f1609dab89bb3cb3e81652d981414ad860e733b355365d8"
-- 
2.7.4


