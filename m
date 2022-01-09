Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9F5C433F5
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:04:49 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.23774.1641765888946999773
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:04:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=dhVl77hR;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id
 r16-20020a17090a0ad000b001b276aa3aabso20190396pje.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FATPQAYl2Iy7UR4tZhtL8WuLH10jg+chr7x6mKC3XCY=;
        b=dhVl77hRzMbMWbhPnOAksMgrxM+2PCOQbaoClhPEjFi3wjikJgF4jGSBKvS2cP4LUX
         poEHuF1JjTFq0IAD0fRAP3Pfn6HfnQgTGINKXoSRTlABJXtJc94oaPb5sSPkTgrq7VWn
         0Z3dLbOWXilPFkfEVn8CgAKX/oZZH81yc1HZOkevZFFJIiNNDFZPVw8LT4T37P0RuKsQ
         Kk1wLci4sbojQMUF9nOAg7E7ehFhxcqVbS7zhOckqhDCBPp/qpPQCY11Vz4h1NeAUiJL
         B4VR1ahpfdNogOrKYCjEVtyqy7Td6lhWIjYNEJTEb+U4nWwFr0dl9Q4Je4OUHH8egU+O
         kRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FATPQAYl2Iy7UR4tZhtL8WuLH10jg+chr7x6mKC3XCY=;
        b=s9mxnqO2eCA4ZDAJHc7P6KYb/tivZjPa8aCjBKYKx5Lb758oPHQj6MqZjrYWvEovOH
         7hHnvGyc/91MDc6ytF0LHyCqBDRgY2QL2/aExdYtQ0XEppS1RLexmm1mmxYB5sp3OfRB
         Kzu7OYaSCPUOfTsjhUtGnZCw7T10n+EbySy4sSbbzky1pB2ifZvaWmG4INqx79I6SOvW
         7ma343AqoNRC5Uc9y1b7ikpyuhkHHwbcr+UZRFEZRNSQvXFqgdQkO2SK4x7dYeetiige
         /xSQPxB8uNrnifeKnhGUBxg33qjBzRqG408ei1O5ZADyIcK6i9aWqloxvjfdNcq7dSIT
         C+Iw==
X-Gm-Message-State: AOAM530KQfddS34NYcdMVgRu5xbe8+ucoci4oJr2C8BguzpnbNLfWk5Y
	u1B/HVllKkMPXfoOjsUzNAV8emHn+6ygYTugqfg=
X-Google-Smtp-Source: 
 ABdhPJwSj0RhmFGlbybFcas85xwcXEIKT6OF70eUR3UXgrl1MMNq8elSBx8pPESh+tKHZdAvwxo0iQ==
X-Received: by 2002:a17:90a:d585:: with SMTP id
 v5mr24515868pju.124.1641765887595;
        Sun, 09 Jan 2022 14:04:47 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 k10sm4426150pfi.52.2022.01.09.14.04.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:04:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/12] weston: Backport patches to always activate
 the top-level surface
Date: Sun,  9 Jan 2022 12:04:11 -1000
Message-Id: 
 <0a2da895284f1687cf75297fb0f4b20cc9b53489.1641765639.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1641765639.git.steve@sakoman.com>
References: <cover.1641765639.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:04:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160298

From: Marek Vasut <marex@denx.de>

In case the device has only touchscreen input device and no keyboard or mouse,
the top level surface is never activated. The behavior differs from a device
which has a keyboard (or gpio-keys, or even uinput-emulated keyboard), where
callchain activate()->weston_view_activate()->weston_seat_set_keyboard_focus()->
weston_keyboard_set_focus()->wl_signal_emit(&keyboard->focus_signal, keyboard)->
handle_keyboard_focus()->weston_desktop_surface_set_activated(..., true); sets
the top level surface as activated. On device with touchscreen, the above is
never called, hence the top level surface is never activated. Add explicit
weston_desktop_surface_set_activated(shsurf->desktop_surface, true); into
activate() to always active the top level surface.

This fixes at least two known issues on such devices:
- Wayland terminal cursor is an empty bar (full bar with keyboard present)
- Chromium dropdown menus are randomly placed (they are placed correctly
  when keyboard is present, because then chromium can find the activated
  top level surface)

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...move-no-op-de-activation-of-the-xdg-.patch | 32 ++++++
 ...name-gain-lose-keyboard-focus-to-act.patch | 57 +++++++++++
 ...bed-keyboard-focus-handle-code-when-.patch | 99 +++++++++++++++++++
 meta/recipes-graphics/wayland/weston_8.0.0.bb |  3 +
 4 files changed, 191 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/0002-desktop-shell-Remove-no-op-de-activation-of-the-xdg-.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/0003-desktop-shell-Rename-gain-lose-keyboard-focus-to-act.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/0004-desktop-shell-Embed-keyboard-focus-handle-code-when-.patch

diff --git a/meta/recipes-graphics/wayland/weston/0002-desktop-shell-Remove-no-op-de-activation-of-the-xdg-.patch b/meta/recipes-graphics/wayland/weston/0002-desktop-shell-Remove-no-op-de-activation-of-the-xdg-.patch
new file mode 100644
index 0000000000..fb36d3817a
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0002-desktop-shell-Remove-no-op-de-activation-of-the-xdg-.patch
@@ -0,0 +1,32 @@
+From 5c74a0640e873694bf60a88eceb21f664cb4b8f7 Mon Sep 17 00:00:00 2001
+From: Marius Vlad <marius.vlad@collabora.com>
+Date: Fri, 5 Mar 2021 20:03:49 +0200
+Subject: [PATCH 2/5] desktop-shell: Remove no-op de-activation of the xdg
+ top-level surface
+
+The shsurf is calloc'ed so the surface count is always 0.  Not only
+that but the surface is not set as active by default, so there's no
+need to de-activate it.
+
+Upstream-Status: Backport [05bef4c18a3e82376a46a4a28d978389c4c0fd0f]
+Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
+---
+ desktop-shell/shell.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/desktop-shell/shell.c b/desktop-shell/shell.c
+index 442a625f..3791be25 100644
+--- a/desktop-shell/shell.c
++++ b/desktop-shell/shell.c
+@@ -2427,8 +2427,6 @@ desktop_surface_added(struct weston_desktop_surface *desktop_surface,
+ 	wl_list_init(&shsurf->children_link);
+ 
+ 	weston_desktop_surface_set_user_data(desktop_surface, shsurf);
+-	weston_desktop_surface_set_activated(desktop_surface,
+-					     shsurf->focus_count > 0);
+ }
+ 
+ static void
+-- 
+2.34.1
+
diff --git a/meta/recipes-graphics/wayland/weston/0003-desktop-shell-Rename-gain-lose-keyboard-focus-to-act.patch b/meta/recipes-graphics/wayland/weston/0003-desktop-shell-Rename-gain-lose-keyboard-focus-to-act.patch
new file mode 100644
index 0000000000..dcd0700fca
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0003-desktop-shell-Rename-gain-lose-keyboard-focus-to-act.patch
@@ -0,0 +1,57 @@
+From edb31c456ae3da7ffffefb668a37ab88075c4b67 Mon Sep 17 00:00:00 2001
+From: Marius Vlad <marius.vlad@collabora.com>
+Date: Fri, 5 Mar 2021 21:40:22 +0200
+Subject: [PATCH 3/5] desktop-shell: Rename gain/lose keyboard focus to
+ activate/de-activate
+
+This way it better reflects that it handles activation rather that input
+focus.
+
+Upstream-Status: Backport [ab39e1d76d4f6715cb300bc37f5c2a0e2d426208]
+Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
+---
+ desktop-shell/shell.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/desktop-shell/shell.c b/desktop-shell/shell.c
+index 3791be25..c4669f11 100644
+--- a/desktop-shell/shell.c
++++ b/desktop-shell/shell.c
+@@ -1869,14 +1869,14 @@ handle_pointer_focus(struct wl_listener *listener, void *data)
+ }
+ 
+ static void
+-shell_surface_lose_keyboard_focus(struct shell_surface *shsurf)
++shell_surface_deactivate(struct shell_surface *shsurf)
+ {
+ 	if (--shsurf->focus_count == 0)
+ 		weston_desktop_surface_set_activated(shsurf->desktop_surface, false);
+ }
+ 
+ static void
+-shell_surface_gain_keyboard_focus(struct shell_surface *shsurf)
++shell_surface_activate(struct shell_surface *shsurf)
+ {
+ 	if (shsurf->focus_count++ == 0)
+ 		weston_desktop_surface_set_activated(shsurf->desktop_surface, true);
+@@ -1891,7 +1891,7 @@ handle_keyboard_focus(struct wl_listener *listener, void *data)
+ 	if (seat->focused_surface) {
+ 		struct shell_surface *shsurf = get_shell_surface(seat->focused_surface);
+ 		if (shsurf)
+-			shell_surface_lose_keyboard_focus(shsurf);
++			shell_surface_deactivate(shsurf);
+ 	}
+ 
+ 	seat->focused_surface = weston_surface_get_main_surface(keyboard->focus);
+@@ -1899,7 +1899,7 @@ handle_keyboard_focus(struct wl_listener *listener, void *data)
+ 	if (seat->focused_surface) {
+ 		struct shell_surface *shsurf = get_shell_surface(seat->focused_surface);
+ 		if (shsurf)
+-			shell_surface_gain_keyboard_focus(shsurf);
++			shell_surface_activate(shsurf);
+ 	}
+ }
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-graphics/wayland/weston/0004-desktop-shell-Embed-keyboard-focus-handle-code-when-.patch b/meta/recipes-graphics/wayland/weston/0004-desktop-shell-Embed-keyboard-focus-handle-code-when-.patch
new file mode 100644
index 0000000000..7ca72f8494
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0004-desktop-shell-Embed-keyboard-focus-handle-code-when-.patch
@@ -0,0 +1,99 @@
+From 899ad5a6a8a92f2c10e0694a45c982b7d878aed6 Mon Sep 17 00:00:00 2001
+From: Marius Vlad <marius.vlad@collabora.com>
+Date: Fri, 5 Mar 2021 21:44:26 +0200
+Subject: [PATCH 4/5] desktop-shell: Embed keyboard focus handle code when
+ activating
+
+We shouldn't be constrained by having a keyboard plugged-in, so avoid
+activating/de-activating the window/surface in the keyboard focus
+handler and embed it straight into the window activation part.
+
+Upstream-Status: Backport [f12697bb3e4c6eb85437ed905e7de44ae2a0ba69]
+Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
+---
+ desktop-shell/shell.c | 41 +++++++++++++++++++++++++----------------
+ 1 file changed, 25 insertions(+), 16 deletions(-)
+
+diff --git a/desktop-shell/shell.c b/desktop-shell/shell.c
+index c4669f11..c6a4fe91 100644
+--- a/desktop-shell/shell.c
++++ b/desktop-shell/shell.c
+@@ -1885,22 +1885,7 @@ shell_surface_activate(struct shell_surface *shsurf)
+ static void
+ handle_keyboard_focus(struct wl_listener *listener, void *data)
+ {
+-	struct weston_keyboard *keyboard = data;
+-	struct shell_seat *seat = get_shell_seat(keyboard->seat);
+-
+-	if (seat->focused_surface) {
+-		struct shell_surface *shsurf = get_shell_surface(seat->focused_surface);
+-		if (shsurf)
+-			shell_surface_deactivate(shsurf);
+-	}
+-
+-	seat->focused_surface = weston_surface_get_main_surface(keyboard->focus);
+-
+-	if (seat->focused_surface) {
+-		struct shell_surface *shsurf = get_shell_surface(seat->focused_surface);
+-		if (shsurf)
+-			shell_surface_activate(shsurf);
+-	}
++	/* FIXME: To be removed later. */
+ }
+ 
+ /* The surface will be inserted into the list immediately after the link
+@@ -2438,6 +2423,7 @@ desktop_surface_removed(struct weston_desktop_surface *desktop_surface,
+ 	struct shell_surface *shsurf_child, *tmp;
+ 	struct weston_surface *surface =
+ 		weston_desktop_surface_get_surface(desktop_surface);
++	struct weston_seat *seat;
+ 
+ 	if (!shsurf)
+ 		return;
+@@ -2448,6 +2434,18 @@ desktop_surface_removed(struct weston_desktop_surface *desktop_surface,
+ 	}
+ 	wl_list_remove(&shsurf->children_link);
+ 
++	wl_list_for_each(seat, &shsurf->shell->compositor->seat_list, link) {
++		struct shell_seat *shseat = get_shell_seat(seat);
++		/* activate() controls the focused surface activation and
++		 * removal of a surface requires invalidating the
++		 * focused_surface to avoid activate() use a stale (and just
++		 * removed) surface when attempting to de-activate it. It will
++		 * also update the focused_surface once it has a chance to run.
++		 */
++		if (surface == shseat->focused_surface)
++			shseat->focused_surface = NULL;
++	}
++
+ 	wl_signal_emit(&shsurf->destroy_signal, shsurf);
+ 
+ 	if (shsurf->fullscreen.black_view)
+@@ -3836,6 +3834,7 @@ activate(struct desktop_shell *shell, struct weston_view *view,
+ 	struct workspace *ws;
+ 	struct weston_surface *old_es;
+ 	struct shell_surface *shsurf, *shsurf_child;
++	struct shell_seat *shseat = get_shell_seat(seat);
+ 
+ 	main_surface = weston_surface_get_main_surface(es);
+ 	shsurf = get_shell_surface(main_surface);
+@@ -3855,6 +3854,16 @@ activate(struct desktop_shell *shell, struct weston_view *view,
+ 
+ 	weston_view_activate(view, seat, flags);
+ 
++	if (shseat->focused_surface) {
++		struct shell_surface *current_focus =
++			get_shell_surface(shseat->focused_surface);
++		assert(current_focus);
++		shell_surface_deactivate(current_focus);
++	}
++
++	shseat->focused_surface = main_surface;
++	shell_surface_activate(shsurf);
++
+ 	state = ensure_focus_state(shell, seat);
+ 	if (state == NULL)
+ 		return;
+-- 
+2.34.1
+
diff --git a/meta/recipes-graphics/wayland/weston_8.0.0.bb b/meta/recipes-graphics/wayland/weston_8.0.0.bb
index 2b120d7404..e647fbc686 100644
--- a/meta/recipes-graphics/wayland/weston_8.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_8.0.0.bb
@@ -12,6 +12,9 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://systemd-notify.weston-start \
            file://xwayland.weston-start \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
+           file://0002-desktop-shell-Remove-no-op-de-activation-of-the-xdg-.patch \
+           file://0003-desktop-shell-Rename-gain-lose-keyboard-focus-to-act.patch \
+           file://0004-desktop-shell-Embed-keyboard-focus-handle-code-when-.patch \
 "
 SRC_URI[md5sum] = "53e4810d852df0601d01fd986a5b22b3"
 SRC_URI[sha256sum] = "7518b49b2eaa1c3091f24671bdcc124fd49fc8f1af51161927afa4329c027848"
-- 
2.25.1


