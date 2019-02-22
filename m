Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2AF447CBE4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 14:34:02 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id v26so2166701wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 06:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=eWPDj60+exZxV/yyvQsNANQL16N11ETa87iyMcQicMY=;
	b=b1Bvm6F6mh6k16mG6a554MfL4jJlHwSZRcqm4DkgTYsLdL4PgbLulixQ8NIuL7KJ9u
	5cBqLUr167oiS1LDDodOfk2RVzIpYDyOOuyFeLXMZrmhtPUjEDN1KosTP9v3gCIOxkHe
	MQn6CX/Iix4ySYGjZdHnPvNbZPbhy9dHJbt0U4+ZpcTSXChYK6+9DNAdTZqIRsQZ7L7Q
	A9sxNFIB8bJ0d6Wz/MITwcxSFN4O1hgcbpnVDOSgF25e/7uuMkJIHSscGQGE63xYEo6n
	51ux8CuoC3/x9aqzCLlGDJETXjN+2cbnuKuKDDyNkR/BwVNF5pP4RBeRn7voZjBHFvHw
	eo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eWPDj60+exZxV/yyvQsNANQL16N11ETa87iyMcQicMY=;
	b=qvh6s+2ek3f01ywz9mF74RianMoKHD+ZGJrI9D+5IwHtaErmztXMW5I2xDZ2RQRAF1
	4Iirv8Selw4pvUNgCMIbY3r1GFWw3r8XenmeR9hjQ4z73N9SJqofnkZMYBoNMMSefxs9
	Douoi0B8r99u6BBqqVoKwYiNWV0aOdIupMufUPUkd4gqT91pQZ/+fxX7rN+8wh1Qqfvr
	0316YZu3hm1VbZxEP8zykUrWelXaAyu+itvw232mfN1PVXug1SAMdtwfjBew+6vOBLjm
	7igmgy9jQQ1j5PscGWMsYKaaGWptfui991A1gIwEL1AJbWhaEkxc+/donRuOwLXgfSF4
	6cSw==
X-Gm-Message-State: AHQUAuZ4WKmoPF/fInIEgxHyMfSUthppD5fQq+qtLQcrWaY52L1o7JaT
	Ca5ZYyuDIlvL3nrdenjgG1CRuWXt
X-Google-Smtp-Source: AHgI3IbTlPnUfW1F9BOlNUW5MlaPcLO3C0UO5qsRjbABh/OB/yBaME2/Ca7cYoIybCASAOV8OUup5g==
X-Received: by 2002:a1c:e715:: with SMTP id e21mr2653023wmh.122.1550846043501; 
	Fri, 22 Feb 2019 06:34:03 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id p1sm2085184wrx.50.2019.02.22.06.34.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 06:34:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2019 15:33:44 +0100
Message-Id: <1f49a95e2a00d7c75620194aab6ad3de526ffd80.1550845989.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1550845989.git.alex.kanavin@gmail.com>
References: <cover.1550845989.git.alex.kanavin@gmail.com>
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
X-List-Received-Date: Fri, 22 Feb 2019 14:34:03 -0000

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


