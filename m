Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id C2DE77C5D4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 14:46:08 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id f16so3640379wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 06:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=eWPDj60+exZxV/yyvQsNANQL16N11ETa87iyMcQicMY=;
	b=vRScEUrk/Cck5mZe7v2JjKFKkU5G9rtFAvkz+dGJ7fEQVxfr/xmdKmTBd4fyGEGtae
	bjxC8elorFRJ1XQdmXj+jvM0s/RsNFiPIZfren8DCxMPQAyMZoFSjgJ9QuqXhNII1AWk
	mUb72+peOdUniSlczk/Oc+NrD0/ExjIIFkl9Pr4v37tvz9XkuZ4R3oEc3PvuQQspuZIb
	W0gMnmkJv+B9MzwgzBSYmpMHRXdEkCLypj1TSXBqzb963n5xrWc3EGIc5oWibXntA75E
	ukAgHPice+gZGCzu1TRYgWYiLxZMuBClYw4ZxtLwrEfVDRrmXSYy+IndVSwrexpnkxS5
	DzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eWPDj60+exZxV/yyvQsNANQL16N11ETa87iyMcQicMY=;
	b=hNr2CNp4WNOfmSzx87iR2rU8YZzDvSAkVG05EIx91Nf24k6PTvq+Xp8wIaYBDl9Nxr
	7KRCiIztNgXg+oUTcmxpWy/ENhPBSO39PjDKM2jan/v+n0LiqYIdJRXMJ8IlH9olGQVW
	ITzmdXjFjNCEkx8std9U5bU1LJAOJ2lz/NDAngQ8FHelCWWTrAufumqzzqkI2Bw9q+P/
	k2XCWHyR/GWQGUSJCF68zuKKF9CZHaVksXthywwxzxPDGHlX/cpEv9Rqgeb3DV5VVSf6
	b9EWMU857bQ5AxM1aVSt5U1cocVU9BeD3QwZD6LmxkzPKG83Fnbz0IXSJzzpR+LuKGsE
	tk/g==
X-Gm-Message-State: AHQUAuYW25WKUjFV4Ij/aA0f7GzhV6j3V2bKzLm1nzZnJktKxBh+0VUX
	CarPAAa1ukjVnbuoxH2IIG0/wwYI
X-Google-Smtp-Source: AHgI3Ia4fugpA5CyYSLuNgyxN4KmeFP1vu+J3kFhAeY9c2icJby4UWx3sCZOuMSkvTTiQ1faeQKA0w==
X-Received: by 2002:a1c:f901:: with SMTP id x1mr3331693wmh.84.1549637169186;
	Fri, 08 Feb 2019 06:46:09 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id j3sm3365709wmb.39.2019.02.08.06.46.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Feb 2019 06:46:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2019 15:45:50 +0100
Message-Id: <23429716ca07a990ca4189e1f4c2cac84f996f71.1549637121.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1549637121.git.alex.kanavin@gmail.com>
References: <cover.1549637121.git.alex.kanavin@gmail.com>
Subject: [PATCH 09/12] qemu: add a backported patch to fix egl-headless support
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
X-List-Received-Date: Fri, 08 Feb 2019 14:46:09 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-egl-headless-add-egl_create_context.patch | 50 +++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_3.1.0.bb      |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-egl-headless-add-egl_create_context.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0001-egl-headless-add-egl_create_context.patch b/meta/recipes-devtools/qemu/qemu/0001-egl-headless-add-egl_create_context.patch
new file mode 100644
index 00000000000..d9326c017ad
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-egl-headless-add-egl_create_context.patch
@@ -0,0 +1,50 @@
+From 952e5d584f5aabe41298c278065fe628f3f7aa7a Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Thu, 29 Nov 2018 13:35:02 +0100
+Subject: [PATCH] egl-headless: add egl_create_context
+
+We must set the correct context (via eglMakeCurrent) before
+calling qemu_egl_create_context, so we need a thin wrapper and can't
+hook qemu_egl_create_context directly as ->dpy_gl_ctx_create callback.
+
+Reported-by: Frederik Carlier <frederik.carlier@quamotion.mobi>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Message-id: 20181129123502.30129-1-kraxel@redhat.com
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=952e5d584f5aabe41298c278065fe628f3f7aa7a]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ ui/egl-headless.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/ui/egl-headless.c b/ui/egl-headless.c
+index 4cf3bbc0e4..519e7bad32 100644
+--- a/ui/egl-headless.c
++++ b/ui/egl-headless.c
+@@ -38,6 +38,14 @@ static void egl_gfx_switch(DisplayChangeListener *dcl,
+     edpy->ds = new_surface;
+ }
+ 
++static QEMUGLContext egl_create_context(DisplayChangeListener *dcl,
++                                        QEMUGLParams *params)
++{
++    eglMakeCurrent(qemu_egl_display, EGL_NO_SURFACE, EGL_NO_SURFACE,
++                   qemu_egl_rn_ctx);
++    return qemu_egl_create_context(dcl, params);
++}
++
+ static void egl_scanout_disable(DisplayChangeListener *dcl)
+ {
+     egl_dpy *edpy = container_of(dcl, egl_dpy, dcl);
+@@ -150,7 +158,7 @@ static const DisplayChangeListenerOps egl_ops = {
+     .dpy_gfx_update          = egl_gfx_update,
+     .dpy_gfx_switch          = egl_gfx_switch,
+ 
+-    .dpy_gl_ctx_create       = qemu_egl_create_context,
++    .dpy_gl_ctx_create       = egl_create_context,
+     .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
+     .dpy_gl_ctx_make_current = qemu_egl_make_context_current,
+     .dpy_gl_ctx_get_current  = qemu_egl_get_current_context,
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu_3.1.0.bb b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
index cd7cd67a3f0..ea4277eddea 100644
--- a/meta/recipes-devtools/qemu/qemu_3.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
            file://0011-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch \
            file://0001-Add-a-missing-X11-include.patch \
+           file://0001-egl-headless-add-egl_create_context.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.17.1


