Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A38C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 23:18:18 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.4342.1642634297015661495
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 15:18:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=qXzP1SXO;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A2A95832DA;
	Thu, 20 Jan 2022 00:18:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1642634294;
	bh=m2ECb7WRzJBZnUNrWiQlz7e1KamUi1w1hQJzyCay7V4=;
	h=From:To:Cc:Subject:Date:From;
	b=qXzP1SXOHsVTLFiQOjJUFb48bv0IRQrgRBF9JfvKKIxDwLkZZ1KCv37v/SYh5nlMU
	 +K49xxKc6IP9LlXbthrTTilPBRDmVyd7gRgA3xIQp0+ljAl2/BpaPAtlqQ+PMWzgaJ
	 xSZFx2R/PDnVY6oOly3iS7kbrYLhjJPYqNHhGeW93GuE9unU5kWPKiAOmOU958T6eD
	 fJ8WOicvjz8yW58svsp7t4Nom3jJQC2blTwaQlIBHKoAW40evCukpdKlnxjAzXd/x6
	 ehK3vk+v15B7gr7QIbQI4TPCU/3VNrGL/INqmRuq9f8xtMklRWBupARyRp6TP4OVAU
	 4DSePdyaBU6rQ==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Pavel Zhukov <pavel.zhukov@huawei.com>,
	Steve Sakoman <steve@sakoman.com>
Subject: [PATCH] [dunfell] Revert "weston: Use systemd notify,"
Date: Thu, 20 Jan 2022 00:17:55 +0100
Message-Id: <20220119231755.20960-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 23:18:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160745

Commit 4efdcc1090 ("weston: Use systemd notify,") has non-trivial to
backport dependencies without which it cannot work, revert backport.

In oe-core dunfell, weston is still started using /usr/bin/weston-start
script in meta/recipes-graphics/wayland/weston-init/weston@.service .
Since 76ed534267 ("weston-init: Use weston-launch when starting weston
as the first windowing system"), the weston-start script starts weston
using weston-launch executable in case $DISPLAY is not set, i.e. when
weston is started as the primary compositor.

When weston is started via weston-launch, the notification to systemd
is not delivered, and weston service fails to start with the following:
"
weston@root.service: start operation timed out. Terminating.
"

The weston systemd service has been reworked considerably since oe-core
dunfell in commit c21fa5a291 ("weston-init: Redefine weston service and
add socket activation option"), which replaced the use of weston-start
in weston@.service with plain weston, and has been further improved in
commit dd83fb40f7 ("weston-init: Stop running weston as root") . The
commit reverted here, oe-core/master commit c8aa0222ce ("weston: wrapper
for weston modules argument"), landed only with the two aforementioned
reworks already in place, therefore the commit could have never been
tested with weston started via weston-launch executable and the timeout
at delivering systemd notification could not have happened in master.

Both c21fa5a291 ("weston-init: Redefine weston service and add socket
activation option") and dd83fb40f7 ("weston-init: Stop running weston
as root") are large feature patches and thus unsuitable for stable
backports, hence this revert seems to be the least problematic way.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>
Cc: Pavel Zhukov <pavel.zhukov@huawei.com>
Cc: Steve Sakoman <steve@sakoman.com>
---
 .../wayland/weston-init/weston-start                 | 12 ------------
 .../wayland/weston-init/weston@.service              |  6 ------
 .../wayland/weston/systemd-notify.weston-start       |  9 ---------
 .../wayland/weston/xwayland.weston-start             |  3 ++-
 meta/recipes-graphics/wayland/weston_8.0.0.bb        |  6 ------
 5 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/systemd-notify.w=
eston-start

diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/met=
a/recipes-graphics/wayland/weston-init/weston-start
index 97471df80d..ccc7093425 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -23,15 +23,6 @@ add_openvt_argument() {
 	openvt_args=3D"$openvt_args $1"
 }
=20
-## Add module to --modules argument
-add_weston_module() {
-	if [ -z "${weston_modules}" ]; then
-		weston_modules=3D"--modules "
-	fi;
-	weston_modules=3D"${weston_modules}${1},"
-}
-
-
 if [ -n "$WAYLAND_DISPLAY" ]; then
 	echo "ERROR: A Wayland compositor is already running, nested Weston ins=
tance is not supported yet."
 	exit 1
@@ -74,9 +65,6 @@ if [ -d "$modules_dir" ]; then
 		# process module
 		. $m
 	done
-	if [ -n "${weston_modules}" ]; then
-		add_weston_argument "${weston_modules} "
-	fi;
 fi
=20
 if test -z "$XDG_RUNTIME_DIR"; then
diff --git a/meta/recipes-graphics/wayland/weston-init/weston@.service b/=
meta/recipes-graphics/wayland/weston-init/weston@.service
index 70c706d75c..39e193014a 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston@.service
+++ b/meta/recipes-graphics/wayland/weston-init/weston@.service
@@ -1,7 +1,3 @@
-# SPDX-FileCopyrightText: Huawei Inc.
-#
-# SPDX-License-Identifier: Apache-2.0
-
 [Unit]
 Description=3DWeston Wayland Compositor
 RequiresMountsFor=3D/run
@@ -9,8 +5,6 @@ Conflicts=3Dplymouth-quit.service
 After=3Dsystemd-user-sessions.service plymouth-quit-wait.service
=20
 [Service]
-Type=3Dnotify
-NotifyAccess=3Dall
 User=3D%i
 PAMName=3Dlogin
 EnvironmentFile=3D-/etc/default/weston
diff --git a/meta/recipes-graphics/wayland/weston/systemd-notify.weston-s=
tart b/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
deleted file mode 100644
index fdb48cb609..0000000000
--- a/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
+++ /dev/null
@@ -1,9 +0,0 @@
-#!/bin/sh
-
-# SPDX-FileCopyrightText: Huawei Inc.
-# SPDX-License-Identifier: Apache-2.0
-
-
-if [[ -x "/usr/lib/weston/systemd-notify.so" ]]; then
-	add_weston_module "systemd-notify.so"
-fi
diff --git a/meta/recipes-graphics/wayland/weston/xwayland.weston-start b=
/meta/recipes-graphics/wayland/weston/xwayland.weston-start
index 22984f50a4..b483c97cf1 100644
--- a/meta/recipes-graphics/wayland/weston/xwayland.weston-start
+++ b/meta/recipes-graphics/wayland/weston/xwayland.weston-start
@@ -2,5 +2,6 @@
=20
 if type Xwayland  >/dev/null 2>/dev/null; then
 	mkdir -p /tmp/.X11-unix
-	add_weston_module "xwayland.so"
+
+	add_weston_argument "--modules=3Dxwayland.so"
 fi
diff --git a/meta/recipes-graphics/wayland/weston_8.0.0.bb b/meta/recipes=
-graphics/wayland/weston_8.0.0.bb
index e647fbc686..5e4e2032c9 100644
--- a/meta/recipes-graphics/wayland/weston_8.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_8.0.0.bb
@@ -5,11 +5,9 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd79ee9e66bb0f95d3386a7acae780=
b70 \
                     file://libweston/compositor.c;endline=3D27;md5=3D6c5=
3bbbd99273f4f7c4affa855c33c0a"
=20
-
 SRC_URI =3D "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.x=
z \
            file://weston.png \
            file://weston.desktop \
-           file://systemd-notify.weston-start \
            file://xwayland.weston-start \
            file://0001-weston-launch-Provide-a-default-version-that-does=
n-t.patch \
            file://0002-desktop-shell-Remove-no-op-de-activation-of-the-x=
dg-.patch \
@@ -106,10 +104,6 @@ do_install_append() {
 		install -Dm 644 ${WORKDIR}/xwayland.weston-start ${D}${datadir}/weston=
-start/xwayland
 	fi
=20
-	if [ "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'yes', 'no', d)}=
" =3D "yes" ]; then
-	        install -Dm 644 ${WORKDIR}/systemd-notify.weston-start ${D}${da=
tadir}/weston-start/systemd-notify
-	fi
-
 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'launch', 'yes', 'no', d)}"=
 =3D "yes" ]; then
 		chmod u+s ${D}${bindir}/weston-launch
 	fi
--=20
2.34.1


