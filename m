Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 952F5C25B78
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 00:06:43 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3081.1717545993461914153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 17:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4E5CE40C8F
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Jun 2024 00:06:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aZ9YVPHKEG_y
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2024 00:06:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3BBEC40C67
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Jun 2024 00:06:32 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 64696163F85;
	Tue,  4 Jun 2024 20:06:31 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 1/2] wayland: upgrade 1.22.0 -> 1.23.0
Date: Tue,  4 Jun 2024 20:06:16 -0400
Message-Id: <20240605000617.1273011-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 00:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200349

This is the official release for Wayland 1.23.

Besides numerous bugfixes and protocol clarifications, Wayland 1.23 inclu=
des
the following new features:

- A mechanism to set the size of the internal connection buffer used by
  libwayland
- An enum-header mode for wayland-scanner to generate headers with only e=
nums
- wayland-scanner now generates validator functions for enums on the serv=
er
  side
- Protocols can now indicate with a "deprecated-since" XML attribute that=
 a
  request, event or enum entry is deprecated
- An API to set a name for a queue to aid debugging
- wl_client_get_user_data() and wl_client_set_user_data() to more easily =
attach
  custom data to a client
- OpenBSD support
- A wl_shm.release request for proper cleanup of this global

Changelog:
https://lists.freedesktop.org/archives/wayland-devel/2024-May/043636.html

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 ...build-Fix-strndup-detection-on-MinGW.patch |  9 ++--
 ...der-pkgconfig-sysroot-for-pkgdatadir.patch | 46 -------------------
 .../{wayland_1.22.0.bb =3D> wayland_1.23.0.bb}  |  3 +-
 3 files changed, 4 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/wayland/0002-Consider-p=
kgconfig-sysroot-for-pkgdatadir.patch
 rename meta/recipes-graphics/wayland/{wayland_1.22.0.bb =3D> wayland_1.2=
3.0.bb} (93%)

diff --git a/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup=
-detection-on-MinGW.patch b/meta/recipes-graphics/wayland/wayland/0001-bu=
ild-Fix-strndup-detection-on-MinGW.patch
index bc753de113..c6ddf8a1f9 100644
--- a/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detect=
ion-on-MinGW.patch
+++ b/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detect=
ion-on-MinGW.patch
@@ -1,4 +1,4 @@
-From b4c64b6f07743e3fb63ce52359bc664ab7d60df0 Mon Sep 17 00:00:00 2001
+From a90bfa622f7323074c715674b368cba80bc7d196 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Thu, 20 Feb 2020 15:20:45 -0600
 Subject: [PATCH] build: Fix strndup detection on MinGW
@@ -20,10 +20,10 @@ Signed-off-by: Denys Dmytriyenko <denis@denix.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index 3bc25c9..adde7b9 100644
+index 8e28f2a..b56ba91 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -38,11 +38,11 @@ have_funcs =3D [
+@@ -45,11 +45,11 @@ have_funcs =3D [
  	'prctl',
  	'memfd_create',
  	'mremap',
@@ -36,6 +36,3 @@ index 3bc25c9..adde7b9 100644
  config_h.set10('HAVE_XUCRED_CR_PID', cc.has_member('struct xucred', 'cr=
_pid', prefix : '#include <sys/ucred.h>'))
  have_broken_msg_cmsg_cloexec =3D false
  if host_machine.system() =3D=3D 'freebsd'
---=20
-2.7.4
-
diff --git a/meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfi=
g-sysroot-for-pkgdatadir.patch b/meta/recipes-graphics/wayland/wayland/00=
02-Consider-pkgconfig-sysroot-for-pkgdatadir.patch
deleted file mode 100644
index 4573bb635a..0000000000
--- a/meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfig-sysro=
ot-for-pkgdatadir.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From ff8ecbe8891d592e645927659318720f9e190054 Mon Sep 17 00:00:00 2001
-From: Andreas Cord-Landwehr <cordlandwehr@kde.org>
-Date: Sun, 6 Feb 2022 17:23:46 +0100
-Subject: [PATCH] Consider pkgconfig sysroot for pkgdatadir
-
-For libs/cflags this is done automatically, but not for manually accesse=
d
-variables. This matches what wayland-protocols does.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/wayla=
nd/-/merge_requests/272]
----
- src/meson.build | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index a8a1d2b..721e151 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -65,7 +65,7 @@ if get_option('scanner')
- 		version: meson.project_version(),
- 		variables: [
- 			'datarootdir=3D' + join_paths('${prefix}', get_option('datadir')),
--			'pkgdatadir=3D' + join_paths('${datarootdir}', meson.project_name())=
,
-+			'pkgdatadir=3D' + join_paths('${pc_sysrootdir}${datarootdir}', meson=
.project_name()),
- 			'bindir=3D' + join_paths('${prefix}', get_option('bindir')),
- 			'wayland_scanner=3D${bindir}/wayland-scanner'
- 		],
-@@ -211,7 +211,7 @@ if get_option('libraries')
- 		filebase: 'wayland-server',
- 		variables: [
- 			'datarootdir=3D' + join_paths('${prefix}', get_option('datadir')),
--			'pkgdatadir=3D' + join_paths('${datarootdir}', meson.project_name())
-+			'pkgdatadir=3D' + join_paths('${pc_sysrootdir}${datarootdir}', meson=
.project_name())
- 		]
- 	)
-
-@@ -250,7 +250,7 @@ if get_option('libraries')
- 		filebase: 'wayland-client',
- 		variables: [
- 			'datarootdir=3D' + join_paths('${prefix}', get_option('datadir')),
--			'pkgdatadir=3D' + join_paths('${datarootdir}', meson.project_name())
-+			'pkgdatadir=3D' + join_paths('${pc_sysrootdir}${datarootdir}', meson=
.project_name())
- 		]
- 	)
-
---
-2.37.2
diff --git a/meta/recipes-graphics/wayland/wayland_1.22.0.bb b/meta/recip=
es-graphics/wayland/wayland_1.23.0.bb
similarity index 93%
rename from meta/recipes-graphics/wayland/wayland_1.22.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.23.0.bb
index e7babc9ec6..8ff47ac171 100644
--- a/meta/recipes-graphics/wayland/wayland_1.22.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.23.0.bb
@@ -15,9 +15,8 @@ DEPENDS =3D "expat libffi wayland-native"
 SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland/-/releases/$=
{PV}/downloads/${BPN}-${PV}.tar.xz \
            file://run-ptest \
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
-           file://0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch \
            "
-SRC_URI[sha256sum] =3D "1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d12936=
ebb7e7cbc2425842"
+SRC_URI[sha256sum] =3D "05b3e1574d3e67626b5974f862f36b5b427c7ceeb965cb36=
a4e6c2d342e45ab2"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/wayland/wayland/-=
/tags"
 UPSTREAM_CHECK_REGEX =3D "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
--=20
2.25.1


