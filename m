Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.732.1793665338566266182
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 16:22:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 904A640BC4
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Nov 2026 00:22:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XyDbPB5asoWb
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2026 00:22:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 740D040B88
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Nov 2026 00:22:17 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9A03B1761CA;
	Mon,  2 Nov 2026 19:22:16 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 1/2] weston: upgrade 16.0.0 -> 16.0.2
Date: Mon,  2 Nov 2026 19:22:12 -0500
Message-Id: <20261103002213.1827359-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 00:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249229
Content-Type: text/plain; charset="utf-8"

Drop previously backported patch.

Changes in 16.0.1:

A few fixes have been pilling over a few months, including one that
allows i915 to run back again on the native drm-backend, which was
causing some issues on fairly newer kernels (related to BACKGROUND_CRTC
property).

Changes in 16.0.2:

A few more useful fixes have landed Weston 16, so I decided to do
another Weston bug-fix release to get these in.

In short this release addresses the following situations:

- make use of all hardware overlay planes in the system when using the
  DRM backend
- do not fallback to TLS-only authentication if the NLA db is missing
  when using the RDP backend
- be able load lua modules when using the lua-shell

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 .../weston/Allow-libdisplay-info-0.4.0.patch  | 28 -------------------
 .../{weston_16.0.0.bb =3D> weston_16.0.2.bb}    |  3 +-
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/Allow-libdisplay=
-info-0.4.0.patch
 rename meta/recipes-graphics/wayland/{weston_16.0.0.bb =3D> weston_16.0.=
2.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/weston/Allow-libdisplay-info-0=
.4.0.patch b/meta/recipes-graphics/wayland/weston/Allow-libdisplay-info-0=
.4.0.patch
deleted file mode 100644
index 07f37b277f..0000000000
--- a/meta/recipes-graphics/wayland/weston/Allow-libdisplay-info-0.4.0.pa=
tch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 54cd5c3354c618815addd7e1d82fc66247099136 Mon Sep 17 00:00:00 2001
-From: Tom Pollard <tom.pollard@codethink.co.uk>
-Date: Tue, 28 Jul 2026 10:51:27 +0100
-Subject: [PATCH] Allow libdisplay-info 0.4.0
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/wayland/weston=
/-/commit/54cd5c3354c618815addd7e1d82fc66247099136]
-
-Signed-off-by: Tom Pollard <tom.pollard@codethink.co.uk>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 03f4d3201f..4814a81592 100644
---- a/meson.build
-+++ b/meson.build
-@@ -180,7 +180,7 @@ endif
-=20
- dep_libdisplay_info =3D dependency(
- 	'libdisplay-info',
--	version: ['>=3D 0.2.0', '< 0.4.0'],
-+	version: ['>=3D 0.2.0', '< 0.5.0'],
- 	fallback: ['display-info', 'di_dep'],
- 	default_options: [
- 		'werror=3Dfalse',
---=20
-GitLab
-
diff --git a/meta/recipes-graphics/wayland/weston_16.0.0.bb b/meta/recipe=
s-graphics/wayland/weston_16.0.2.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/weston_16.0.0.bb
rename to meta/recipes-graphics/wayland/weston_16.0.2.bb
index 8e5d79aec3..e9b8b392aa 100644
--- a/meta/recipes-graphics/wayland/weston_16.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_16.0.2.bb
@@ -11,10 +11,9 @@ SRC_URI =3D "https://gitlab.freedesktop.org/wayland/we=
ston/-/releases/${PV}/downlo
            file://weston.desktop \
            file://xwayland.weston-start \
            file://systemd-notify.weston-start \
-           file://Allow-libdisplay-info-0.4.0.patch \
            "
=20
-SRC_URI[sha256sum] =3D "dfb32e2bccabda957b94a8d0ec6075acd18c71c87ebc543e=
e3e618d294ca0f7f"
+SRC_URI[sha256sum] =3D "49dd87d18cb229384264d2f69cb5a51f14f61a111e9227bf=
edb91b3ca8c39643"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/wayland/weston/-/=
tags"
 UPSTREAM_CHECK_REGEX =3D "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
--=20
2.25.1

