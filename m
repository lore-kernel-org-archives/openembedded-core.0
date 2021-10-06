Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDD9C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 11:20:23 +0000 (UTC)
Received: from forward102p.mail.yandex.net (forward102p.mail.yandex.net
 [77.88.28.102])
 by mx.groups.io with SMTP id smtpd.web11.10515.1633519221547717452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 04:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@zhukoff.net
 header.s=mail header.b=WtIQaAYs;
 spf=pass (domain: zhukoff.net, ip: 77.88.28.102, mailfrom: pavel@zhukoff.net)
Received: from iva5-8cd627e71aff.qloud-c.yandex.net
 (iva5-8cd627e71aff.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:7b87:0:640:8cd6:27e7])
	by forward102p.mail.yandex.net (Yandex) with ESMTP id 60AAF393F303;
	Wed,  6 Oct 2021 14:20:12 +0300 (MSK)
Received: from iva4-50c21cb1cb18.qloud-c.yandex.net
 (2a02:6b8:c0c:1510:0:640:50c2:1cb1 [2a02:6b8:c0c:1510:0:640:50c2:1cb1])
	by iva5-8cd627e71aff.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 KD5hqpQpFA-KBDaLgNI;
	Wed, 06 Oct 2021 14:20:12 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; s=mail;
 t=1633519212;
	bh=vvarjzczButdF+ayEWQ9jqHNqDlBcLvA0BlKYNibVNg=;
	h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
	b=WtIQaAYssfqHMr4srfhoy/U2/EGp9/pIakuwmq8uXdLKiwzulR23kyIoGI8GfeKVs
	 wkUv4mr10SYjrgfPSXkB4XsIhHJdEJ59J+JeEEId9qr2n1IcL6EnAeYR5Cz6yeR9x/
	 PxaicysCguXaYh5dR1uBofyiNNYlN1hrgsoyjs4k=
Authentication-Results: iva5-8cd627e71aff.qloud-c.yandex.net;
 dkim=pass header.i=@zhukoff.net
Received: by iva4-50c21cb1cb18.qloud-c.yandex.net (smtp/Yandex) with ESMTPS id
 Hnh6R11JGo-KAhWEDHX;
	Wed, 06 Oct 2021 14:20:10 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Pavel Zhukov <pavel.zhukov@huawei.com>,
	pavel@zhukoff.net,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [dunfell][PATCH v2] weston: Use systemd notify,
Date: Wed,  6 Oct 2021 13:19:13 +0200
Message-Id: <20211006111913.29107-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <16AB68BB0C865361.16814@lists.openembedded.org>
References: <16AB68BB0C865361.16814@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 11:20:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156691

From: Pavel Zhukov <pavel.zhukov@huawei.com>

Using systemd notify fixes the problem with dependency chain in case
if other services depend on running weston.
This change required more robust handling of weston modules arguments
due to custom argument parser impmentation in weston (only last
--modules argument is accepted) and fixes the bug in modules handling
in the weston-start script (only last argument is actually parsed by
weston). Master branch implements systemd-notify thus backport but
doesn't utilize modules anymore so this change is mostly dunfell
specific.

Upstream-status: Backport

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 .../wayland/weston-init/weston-start                 | 12 ++++++++++++
 .../wayland/weston-init/weston@.service              |  6 ++++++
 .../wayland/weston/systemd-notify.weston-start       |  9 +++++++++
 .../wayland/weston/xwayland.weston-start             |  3 +--
 meta/recipes-graphics/wayland/weston_8.0.0.bb        |  6 ++++++
 5 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston/systemd-notify.w=
eston-start

diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/met=
a/recipes-graphics/wayland/weston-init/weston-start
index ccc7093425..97471df80d 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -23,6 +23,15 @@ add_openvt_argument() {
 	openvt_args=3D"$openvt_args $1"
 }
=20
+## Add module to --modules argument
+add_weston_module() {
+	if [ -z "${weston_modules}" ]; then
+		weston_modules=3D"--modules "
+	fi;
+	weston_modules=3D"${weston_modules}${1},"
+}
+
+
 if [ -n "$WAYLAND_DISPLAY" ]; then
 	echo "ERROR: A Wayland compositor is already running, nested Weston ins=
tance is not supported yet."
 	exit 1
@@ -65,6 +74,9 @@ if [ -d "$modules_dir" ]; then
 		# process module
 		. $m
 	done
+	if [ -n "${weston_modules}" ]; then
+		add_weston_argument "${weston_modules} "
+	fi;
 fi
=20
 if test -z "$XDG_RUNTIME_DIR"; then
diff --git a/meta/recipes-graphics/wayland/weston-init/weston@.service b/=
meta/recipes-graphics/wayland/weston-init/weston@.service
index 39e193014a..70c706d75c 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston@.service
+++ b/meta/recipes-graphics/wayland/weston-init/weston@.service
@@ -1,3 +1,7 @@
+# SPDX-FileCopyrightText: Huawei Inc.
+#
+# SPDX-License-Identifier: Apache-2.0
+
 [Unit]
 Description=3DWeston Wayland Compositor
 RequiresMountsFor=3D/run
@@ -5,6 +9,8 @@ Conflicts=3Dplymouth-quit.service
 After=3Dsystemd-user-sessions.service plymouth-quit-wait.service
=20
 [Service]
+Type=3Dnotify
+NotifyAccess=3Dall
 User=3D%i
 PAMName=3Dlogin
 EnvironmentFile=3D-/etc/default/weston
diff --git a/meta/recipes-graphics/wayland/weston/systemd-notify.weston-s=
tart b/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
new file mode 100644
index 0000000000..fdb48cb609
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+# SPDX-FileCopyrightText: Huawei Inc.
+# SPDX-License-Identifier: Apache-2.0
+
+
+if [[ -x "/usr/lib/weston/systemd-notify.so" ]]; then
+	add_weston_module "systemd-notify.so"
+fi
diff --git a/meta/recipes-graphics/wayland/weston/xwayland.weston-start b=
/meta/recipes-graphics/wayland/weston/xwayland.weston-start
index b483c97cf1..22984f50a4 100644
--- a/meta/recipes-graphics/wayland/weston/xwayland.weston-start
+++ b/meta/recipes-graphics/wayland/weston/xwayland.weston-start
@@ -2,6 +2,5 @@
=20
 if type Xwayland  >/dev/null 2>/dev/null; then
 	mkdir -p /tmp/.X11-unix
-
-	add_weston_argument "--modules=3Dxwayland.so"
+	add_weston_module "xwayland.so"
 fi
diff --git a/meta/recipes-graphics/wayland/weston_8.0.0.bb b/meta/recipes=
-graphics/wayland/weston_8.0.0.bb
index 0b383f25f3..2b120d7404 100644
--- a/meta/recipes-graphics/wayland/weston_8.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_8.0.0.bb
@@ -5,9 +5,11 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd79ee9e66bb0f95d3386a7acae780=
b70 \
                     file://libweston/compositor.c;endline=3D27;md5=3D6c5=
3bbbd99273f4f7c4affa855c33c0a"
=20
+
 SRC_URI =3D "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.x=
z \
            file://weston.png \
            file://weston.desktop \
+           file://systemd-notify.weston-start \
            file://xwayland.weston-start \
            file://0001-weston-launch-Provide-a-default-version-that-does=
n-t.patch \
 "
@@ -101,6 +103,10 @@ do_install_append() {
 		install -Dm 644 ${WORKDIR}/xwayland.weston-start ${D}${datadir}/weston=
-start/xwayland
 	fi
=20
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'yes', 'no', d)}=
" =3D "yes" ]; then
+	        install -Dm 644 ${WORKDIR}/systemd-notify.weston-start ${D}${da=
tadir}/weston-start/systemd-notify
+	fi
+
 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'launch', 'yes', 'no', d)}"=
 =3D "yes" ]; then
 		chmod u+s ${D}${bindir}/weston-launch
 	fi
--=20
2.31.1


