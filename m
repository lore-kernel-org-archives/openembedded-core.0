Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id EF1267C4A7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 13:06:12 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id v13so7006618wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2019 05:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eWPDj60+exZxV/yyvQsNANQL16N11ETa87iyMcQicMY=;
	b=UcvS13TVOF01HrWqJVVt0zMzZ4USGuVUNip+zyb+hhHhWtrTqDr97vU2cKwVlr8rrX
	9trKJOqZ78H7vAkyAGLfOo10r7FRJD1HUAJCMWnCqTYNfLTtOmQAi/nDTG/j2H5rZGjT
	kJsnROIooAZgfb4j8nBkDQ1JKwvVqCp9wrjZR9a7ybr4bGOa51gknFzL74fMiV2mDWGN
	2n3blFRKjcCwzYtuN1EVqYgEsyi1cIJd7xv2UQQlVYBIkY6V3sI9umQLXh4SdRL4v2b5
	u0rlhj+65CThFnjErNMc4WOLjP0XAUh4jyGjrm+qaIePaKP8Vk8e0sdT3qUZfCm7z0Qm
	jKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eWPDj60+exZxV/yyvQsNANQL16N11ETa87iyMcQicMY=;
	b=o0LoGp8Zo55N+/iw/lwYOnVyER/LR2pc4UDgX4s2qBqvzQuBWkMyfIivy9uPHX1DMX
	roe9SPdcMsXqFamXZIxEsCGpUYagnUr/8LxmrkGbymapWng+jAhII7KcKY+W3Qz2w4DS
	PNCXxBs0m1i8Rx05+UeJXuY+BTHWZ7al2nGG6RrKu0fHfc0iNA1fWB4jul+PRr8Iyp2R
	BCHGpPQtM3Xvg8mpPILYWgPwEDEjVGRIy/pRc4XneHRaIzTVNi2/kXWZDgTL8uS1hDUe
	fYfFVUfipH9yPCrBuzimcptBkxbnDwByFR2W1ljVbK6Ru/W/9kze+v85F2MZA0RqB9oE
	JLWA==
X-Gm-Message-State: AJcUukdWJZ5an+E0MGvXvFd0W26j1jhCxwY+M7X2JkPI2m/BCpHT/fFQ
	ZVYks2Zl00VagSODyHwmX6MqkAgJ
X-Google-Smtp-Source: ALg8bN4APU+TMQr6BunzbYTVgTkRliRNtQ2pDQIZRU7Y8UwrhB5foU5eIurMXxExUz4RFz4JXw/HPg==
X-Received: by 2002:a5d:6889:: with SMTP id h9mr38227940wru.222.1549026373272; 
	Fri, 01 Feb 2019 05:06:13 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a14sm1273972wrr.13.2019.02.01.05.06.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Feb 2019 05:06:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2019 14:05:51 +0100
Message-Id: <20190201130554.90094-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190201130554.90094-1-alex.kanavin@gmail.com>
References: <20190201130554.90094-1-alex.kanavin@gmail.com>
Subject: [PATCH 10/13] qemu: add a backported patch to fix egl-headless support
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
X-List-Received-Date: Fri, 01 Feb 2019 13:06:13 -0000

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


