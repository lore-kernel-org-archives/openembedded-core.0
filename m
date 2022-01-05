Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C45DC433EF
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 22:22:06 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.538.1641421324165006120
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 14:22:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=BEjXYy0s;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9DA7F80FDD;
	Wed,  5 Jan 2022 23:21:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1641421315;
	bh=0eECOm9HnFE7bd9pRfCVBE0xsxAnZTlTIHxyY3MAX2U=;
	h=From:To:Cc:Subject:Date:From;
	b=BEjXYy0s3eAJolhCFd5UEjl7a8G5t9hKjpTZCJ79jT3TXrxZ/v8Nrx01UD62lCHyI
	 nyStzHLLH+7AlZDHyFDG36ZyTj+4xLCmaMhwHtpTajNpGhVCDq3SL1bFB/9Zt6jN7U
	 6uu1Le/1HavcoiocM/HRF46Q3xtL8TGTBGrKI9jZfM23laJME7I/EoZTXeSsS/pJRJ
	 XDxlQgF2mBlPYYxbNr10oQHHhDWc2bBHLBDvLgwBOYFP1JGOLRG2acpSyOlLIQsZ/w
	 n3IeqrmTVI5d5GrORJIUQu8vj4qA3hvMqNJ9DEQlHqjxv9LSIAHV0Z/u7UvDDYd2Xv
	 ao8CtAUDRrqMA==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Steve Sakoman <steve@sakoman.com>
Subject: [PATCH] weston: Backport patches to always activate the top-level
 surface
Date: Wed,  5 Jan 2022 23:21:41 +0100
Message-Id: <20220105222141.25234-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 22:22:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160215

In case the device has only touchscreen input device and no keyboard or m=
ouse,
the top level surface is never activated. The behavior differs from a dev=
ice
which has a keyboard (or gpio-keys, or even uinput-emulated keyboard), wh=
ere
callchain activate()->weston_view_activate()->weston_seat_set_keyboard_fo=
cus()->
weston_keyboard_set_focus()->wl_signal_emit(&keyboard->focus_signal, keyb=
oard)->
handle_keyboard_focus()->weston_desktop_surface_set_activated(..., true);=
 sets
the top level surface as activated. On device with touchscreen, the above=
 is
never called, hence the top level surface is never activated. Add explici=
t
weston_desktop_surface_set_activated(shsurf->desktop_surface, true); into
activate() to always active the top level surface.

This fixes at least two known issues on such devices:
- Wayland terminal cursor is an empty bar (full bar with keyboard present=
)
- Chromium dropdown menus are randomly placed (they are placed correctly
  when keyboard is present, because then chromium can find the activated
  top level surface)

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Steve Sakoman <steve@sakoman.com>
---
 ...move-no-op-de-activation-of-the-xdg-.patch | 32 ++++++
 ...name-gain-lose-keyboard-focus-to-act.patch | 57 +++++++++++
 ...bed-keyboard-focus-handle-code-when-.patch | 99 +++++++++++++++++++
 meta/recipes-graphics/wayland/weston_8.0.0.bb |  3 +
 4 files changed, 191 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/0002-desktop-she=
ll-Remove-no-op-de-activation-of-the-xdg-.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/0003-desktop-she=
ll-Rename-gain-lose-keyboard-focus-to-act.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/0004-desktop-she=
ll-Embed-keyboard-focus-handle-code-when-.patch

diff --git a/meta/recipes-graphics/wayland/weston/0002-desktop-shell-Remo=
ve-no-op-de-activation-of-the-xdg-.patch b/meta/recipes-graphics/wayland/=
weston/0002-desktop-shell-Remove-no-op-de-activation-of-the-xdg-.patch
new file mode 100644
index 0000000000..fb36d3817a
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0002-desktop-shell-Remove-no-o=
p-de-activation-of-the-xdg-.patch
@@ -0,0 +1,32 @@
+From 5c74a0640e873694bf60a88eceb21f664cb4b8f7 Mon Sep 17 00:00:00 2001
+From: Marius Vlad <marius.vlad@collabora.com>
+Date: Fri, 5 Mar 2021 20:03:49 +0200
+Subject: [PATCH 2/5] desktop-shell: Remove no-op de-activation of the xd=
g
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
+@@ -2427,8 +2427,6 @@ desktop_surface_added(struct weston_desktop_surfac=
e *desktop_surface,
+ 	wl_list_init(&shsurf->children_link);
+=20
+ 	weston_desktop_surface_set_user_data(desktop_surface, shsurf);
+-	weston_desktop_surface_set_activated(desktop_surface,
+-					     shsurf->focus_count > 0);
+ }
+=20
+ static void
+--=20
+2.34.1
+
diff --git a/meta/recipes-graphics/wayland/weston/0003-desktop-shell-Rena=
me-gain-lose-keyboard-focus-to-act.patch b/meta/recipes-graphics/wayland/=
weston/0003-desktop-shell-Rename-gain-lose-keyboard-focus-to-act.patch
new file mode 100644
index 0000000000..dcd0700fca
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0003-desktop-shell-Rename-gain=
-lose-keyboard-focus-to-act.patch
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
+@@ -1869,14 +1869,14 @@ handle_pointer_focus(struct wl_listener *listene=
r, void *data)
+ }
+=20
+ static void
+-shell_surface_lose_keyboard_focus(struct shell_surface *shsurf)
++shell_surface_deactivate(struct shell_surface *shsurf)
+ {
+ 	if (--shsurf->focus_count =3D=3D 0)
+ 		weston_desktop_surface_set_activated(shsurf->desktop_surface, false);
+ }
+=20
+ static void
+-shell_surface_gain_keyboard_focus(struct shell_surface *shsurf)
++shell_surface_activate(struct shell_surface *shsurf)
+ {
+ 	if (shsurf->focus_count++ =3D=3D 0)
+ 		weston_desktop_surface_set_activated(shsurf->desktop_surface, true);
+@@ -1891,7 +1891,7 @@ handle_keyboard_focus(struct wl_listener *listener=
, void *data)
+ 	if (seat->focused_surface) {
+ 		struct shell_surface *shsurf =3D get_shell_surface(seat->focused_surf=
ace);
+ 		if (shsurf)
+-			shell_surface_lose_keyboard_focus(shsurf);
++			shell_surface_deactivate(shsurf);
+ 	}
+=20
+ 	seat->focused_surface =3D weston_surface_get_main_surface(keyboard->fo=
cus);
+@@ -1899,7 +1899,7 @@ handle_keyboard_focus(struct wl_listener *listener=
, void *data)
+ 	if (seat->focused_surface) {
+ 		struct shell_surface *shsurf =3D get_shell_surface(seat->focused_surf=
ace);
+ 		if (shsurf)
+-			shell_surface_gain_keyboard_focus(shsurf);
++			shell_surface_activate(shsurf);
+ 	}
+ }
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-graphics/wayland/weston/0004-desktop-shell-Embe=
d-keyboard-focus-handle-code-when-.patch b/meta/recipes-graphics/wayland/=
weston/0004-desktop-shell-Embed-keyboard-focus-handle-code-when-.patch
new file mode 100644
index 0000000000..7ca72f8494
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0004-desktop-shell-Embed-keybo=
ard-focus-handle-code-when-.patch
@@ -0,0 +1,99 @@
+From 899ad5a6a8a92f2c10e0694a45c982b7d878aed6 Mon Sep 17 00:00:00 2001
+From: Marius Vlad <marius.vlad@collabora.com>
+Date: Fri, 5 Mar 2021 21:44:26 +0200
+Subject: [PATCH 4/5] desktop-shell: Embed keyboard focus handle code whe=
n
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
+@@ -1885,22 +1885,7 @@ shell_surface_activate(struct shell_surface *shsu=
rf)
+ static void
+ handle_keyboard_focus(struct wl_listener *listener, void *data)
+ {
+-	struct weston_keyboard *keyboard =3D data;
+-	struct shell_seat *seat =3D get_shell_seat(keyboard->seat);
+-
+-	if (seat->focused_surface) {
+-		struct shell_surface *shsurf =3D get_shell_surface(seat->focused_surf=
ace);
+-		if (shsurf)
+-			shell_surface_deactivate(shsurf);
+-	}
+-
+-	seat->focused_surface =3D weston_surface_get_main_surface(keyboard->fo=
cus);
+-
+-	if (seat->focused_surface) {
+-		struct shell_surface *shsurf =3D get_shell_surface(seat->focused_surf=
ace);
+-		if (shsurf)
+-			shell_surface_activate(shsurf);
+-	}
++	/* FIXME: To be removed later. */
+ }
+=20
+ /* The surface will be inserted into the list immediately after the lin=
k
+@@ -2438,6 +2423,7 @@ desktop_surface_removed(struct weston_desktop_surf=
ace *desktop_surface,
+ 	struct shell_surface *shsurf_child, *tmp;
+ 	struct weston_surface *surface =3D
+ 		weston_desktop_surface_get_surface(desktop_surface);
++	struct weston_seat *seat;
+=20
+ 	if (!shsurf)
+ 		return;
+@@ -2448,6 +2434,18 @@ desktop_surface_removed(struct weston_desktop_sur=
face *desktop_surface,
+ 	}
+ 	wl_list_remove(&shsurf->children_link);
+=20
++	wl_list_for_each(seat, &shsurf->shell->compositor->seat_list, link) {
++		struct shell_seat *shseat =3D get_shell_seat(seat);
++		/* activate() controls the focused surface activation and
++		 * removal of a surface requires invalidating the
++		 * focused_surface to avoid activate() use a stale (and just
++		 * removed) surface when attempting to de-activate it. It will
++		 * also update the focused_surface once it has a chance to run.
++		 */
++		if (surface =3D=3D shseat->focused_surface)
++			shseat->focused_surface =3D NULL;
++	}
++
+ 	wl_signal_emit(&shsurf->destroy_signal, shsurf);
+=20
+ 	if (shsurf->fullscreen.black_view)
+@@ -3836,6 +3834,7 @@ activate(struct desktop_shell *shell, struct westo=
n_view *view,
+ 	struct workspace *ws;
+ 	struct weston_surface *old_es;
+ 	struct shell_surface *shsurf, *shsurf_child;
++	struct shell_seat *shseat =3D get_shell_seat(seat);
+=20
+ 	main_surface =3D weston_surface_get_main_surface(es);
+ 	shsurf =3D get_shell_surface(main_surface);
+@@ -3855,6 +3854,16 @@ activate(struct desktop_shell *shell, struct west=
on_view *view,
+=20
+ 	weston_view_activate(view, seat, flags);
+=20
++	if (shseat->focused_surface) {
++		struct shell_surface *current_focus =3D
++			get_shell_surface(shseat->focused_surface);
++		assert(current_focus);
++		shell_surface_deactivate(current_focus);
++	}
++
++	shseat->focused_surface =3D main_surface;
++	shell_surface_activate(shsurf);
++
+ 	state =3D ensure_focus_state(shell, seat);
+ 	if (state =3D=3D NULL)
+ 		return;
+--=20
+2.34.1
+
diff --git a/meta/recipes-graphics/wayland/weston_8.0.0.bb b/meta/recipes=
-graphics/wayland/weston_8.0.0.bb
index 2b120d7404..e647fbc686 100644
--- a/meta/recipes-graphics/wayland/weston_8.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_8.0.0.bb
@@ -12,6 +12,9 @@ SRC_URI =3D "https://wayland.freedesktop.org/releases/$=
{BPN}-${PV}.tar.xz \
            file://systemd-notify.weston-start \
            file://xwayland.weston-start \
            file://0001-weston-launch-Provide-a-default-version-that-does=
n-t.patch \
+           file://0002-desktop-shell-Remove-no-op-de-activation-of-the-x=
dg-.patch \
+           file://0003-desktop-shell-Rename-gain-lose-keyboard-focus-to-=
act.patch \
+           file://0004-desktop-shell-Embed-keyboard-focus-handle-code-wh=
en-.patch \
 "
 SRC_URI[md5sum] =3D "53e4810d852df0601d01fd986a5b22b3"
 SRC_URI[sha256sum] =3D "7518b49b2eaa1c3091f24671bdcc124fd49fc8f1af511619=
27afa4329c027848"
--=20
2.34.1


