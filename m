Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9F14A7C2D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 11:00:07 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id a62so21155615wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 03:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=eWPDj60+exZxV/yyvQsNANQL16N11ETa87iyMcQicMY=;
	b=TBcC/dSW0v3dTy+w1nwwDrVbGMIrYr9LiGQtHJDMwg1KAMJbcCi7H1Dpjeoq7jUqfJ
	GcStXEURm4oNhupjsPhom2f5pjdrqnSEo1zSRh9HIFSjIaJVUdnoBRdEho8svzhxo1pk
	5DHm1ZZWQmQ2j7aqZpcnBDFPxxBLp7nCgJr7gASL7nj5TDzisD5TkBXgBbz7CrRtIQ9s
	qsJjzZckfZaxyClZpsc4/woEn+ew9tcJtAttw+XXojeo0uYkk5ruqkBqeQQYhJ5AtkxX
	Ulf0Oxj3+uD9nLNWYyuitS9yembYMC5eBmok4DVBc+b+puacJlJtQEslfDbns0FX/GVZ
	wrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eWPDj60+exZxV/yyvQsNANQL16N11ETa87iyMcQicMY=;
	b=DGX3IIUNypywqNmFZKWnvrSddKaWysTDxH71EJ/Mh83v70tGYTUUknVVCe4A/D4HrN
	H4a5qrtxqTSBlG38g8xdOMKt0EoioV0NY/HdYNNxLGofZ6XDvTUP0eQ+sNpo9vUhgwNV
	4vqN9oP0uPZ8YbqfFNMbYV0F4XZ7m9Zk6DX5swXURBRDwmjTchKiU1jgJTjF2kobmy6t
	IDcyfOjlvTp9hYo0z+IS7u9ySmZiL8O8pTIEs2ynAYtVp47UTE/EaVQQWg64WHJIuvwE
	syndaI6pXJ9O4YSuISF+zbC3EfBk6c2SarQHpIF3Wk0LyJXxWzNh9hPgS/YX5YkZt5qs
	Cdrg==
X-Gm-Message-State: AJcUukeCHiJeYIV04XaWM93VYcHJNjTt+cu6gKfUP3asj72N2YGDd/eA
	QsULFXamGH7Jvua7ThqMjNIFRY3R
X-Google-Smtp-Source: ALg8bN49++IcYpAjRRRguK77clUaVoEYNVzJaSKKepWo5T91CJhBNzw4fBAFq/t/gjqmvwxHQ/wjwA==
X-Received: by 2002:a7b:cd85:: with SMTP id y5mr23945263wmj.129.1548846008061; 
	Wed, 30 Jan 2019 03:00:08 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a18sm1127705wrp.13.2019.01.30.03.00.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 03:00:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:59:39 +0100
Message-Id: <146e4590e4f39f22f0585338fac2b5f50c15b39c.1548845917.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548845917.git.alex.kanavin@gmail.com>
References: <cover.1548845917.git.alex.kanavin@gmail.com>
Subject: [PATCH 16/20] qemu: add a backported patch to fix egl-headless support
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
X-List-Received-Date: Wed, 30 Jan 2019 11:00:08 -0000

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


