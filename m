Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id DA1056A598
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 15:09:22 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id t60so1354427wes.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 08:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=JPT9nS5wSlqECM7ufmzve8Bm/hFzDfYxJ7tgaULgqpc=;
	b=fEyqmyMroR30ZXIWg6HxRoPsuftxhohvbOpIZDq2922nxtF19MjGM+AZIgNBKQsNBh
	bF3+TdPbX1q1or4aEeaCLKHypZO8ygyIFNsBDPwI32EgwEJ+R0Mqf+XjMjfldRiAIq72
	L3s99+AjTo+VazFKTNFHqP4QhNbG3B80gTx3OQ7i2hCejppIjsuaSzItEPQO7+JeZ4R1
	X0+kjjlK3rgbCj0Um8RD6O/v8GVmkauHUQqJ301tPVU8zNDdCdBfN40t4dUGx3LvAtBc
	fcZuiAh0qySkW7RG4I9Nk1XmvzSMImhsJy3nR0onVNaCJfXMhd8PEaAhdUN8hQPxVMYA
	ERYg==
X-Received: by 10.194.104.105 with SMTP id gd9mr9963634wjb.1.1370012963618;
	Fri, 31 May 2013 08:09:23 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fu14sm4546170wic.8.2013.05.31.08.09.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 08:09:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 16:05:47 +0100
Message-Id: <125c91479244db72a603b9857949645bdaf5c5e0.1370012689.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370012689.git.ross.burton@intel.com>
References: <cover.1370012689.git.ross.burton@intel.com>
In-Reply-To: <cover.1370012689.git.ross.burton@intel.com>
References: <cover.1370012689.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnoMsnibLQBFoIALOi5OZ3VD4m170Nzsy1H0hRQSarI+OkRnjF82tMYlZ+1mOvlOVUz6eZt
Subject: [PATCH 11/11] gtk+3: fix repainting under Weston 1.1
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
X-List-Received-Date: Fri, 31 May 2013 15:09:23 -0000

Weston 1.1 is stricter with the protocol, so fix the behaviour in GTK+.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3/wayland-attach.patch |   42 ++++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb             |    3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/wayland-attach.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+3/wayland-attach.patch b/meta/recipes-gnome/gtk+/gtk+3/wayland-attach.patch
new file mode 100644
index 0000000..fa0d0e6
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/wayland-attach.patch
@@ -0,0 +1,42 @@
+Wayland 1.1 is enforcing the protocol whereas 1.0 was lenient.  Backport a patch
+from git to fix repainting.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+
+From 0d2c4617203c8fe907c722c9cb53c0345e0405e7 Mon Sep 17 00:00:00 2001
+From: Scott Moreau <oreaus@gmail.com>
+Date: Sun, 10 Mar 2013 10:51:01 -0600
+Subject: [PATCH] wayland: Always attach buffer before committing
+
+With recent changes in attach semantics, we always need to attach before
+committing. Without this changes to the window contents to not get reflected
+in the content of the surface.
+
+Signed-off-by: Rob Bradford <rob@linux.intel.com>
+---
+ gdk/wayland/gdkwindow-wayland.c |    7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/gdk/wayland/gdkwindow-wayland.c b/gdk/wayland/gdkwindow-wayland.c
+index 112a1f4..fa01e90 100644
+--- a/gdk/wayland/gdkwindow-wayland.c
++++ b/gdk/wayland/gdkwindow-wayland.c
+@@ -327,13 +327,6 @@ gdk_wayland_window_attach_image (GdkWindow *window)
+   if (GDK_WINDOW_DESTROYED (window))
+     return;
+ 
+-  /* The "drawn to" Cairo surface is the same as the Cairo surface from which
+-   * we are driving the buffer for the Wayland surface. Therefore we don't
+-   * need to do anything here
+-   */
+-  if (impl->server_surface == impl->cairo_surface)
+-    return;
+-
+   /* The wayland surface is attached to a buffer that is from the old "drawn
+    * to" surface. Unref the surface and restore the state.
+    */
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb b/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
index b9d4091..d92d8f3 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
@@ -3,7 +3,8 @@ require gtk+3.inc
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "http://download.gnome.org/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
-           file://no-x11-in-wayland.patch"
+           file://no-x11-in-wayland.patch \
+           file://wayland-attach.patch"
 
 SRC_URI[md5sum] = "8e878e18fc385f2b813419dc7b40a968"
 SRC_URI[sha256sum] = "1ca80c9c15a1df95d74cefb8c2afe4682ba272a4b489106f04877be2a7aff297"
-- 
1.7.10.4


