Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF86C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 10:00:42 +0000 (UTC)
Received: from forward106o.mail.yandex.net (forward106o.mail.yandex.net
 [37.140.190.187])
 by mx.groups.io with SMTP id smtpd.web08.9679.1633514440300301486
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 03:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@zhukoff.net
 header.s=mail header.b=2CdKT3hn;
 spf=pass (domain: zhukoff.net, ip: 37.140.190.187,
 mailfrom: pavel@zhukoff.net)
Received: from forward101q.mail.yandex.net (forward101q.mail.yandex.net
 [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb98])
	by forward106o.mail.yandex.net (Yandex) with ESMTP id B6638568C8B8;
	Wed,  6 Oct 2021 13:00:35 +0300 (MSK)
Received: from vla3-fd8580bf9bb2.qloud-c.yandex.net
 (vla3-fd8580bf9bb2.qloud-c.yandex.net
 [IPv6:2a02:6b8:c15:2588:0:640:fd85:80bf])
	by forward101q.mail.yandex.net (Yandex) with ESMTP id B228413E80002;
	Wed,  6 Oct 2021 13:00:35 +0300 (MSK)
Received: from vla1-62318bfe5573.qloud-c.yandex.net
 (2a02:6b8:c0d:3819:0:640:6231:8bfe [2a02:6b8:c0d:3819:0:640:6231:8bfe])
	by vla3-fd8580bf9bb2.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 kp2rdFjNnK-0ZEmxlI8;
	Wed, 06 Oct 2021 13:00:35 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; s=mail;
 t=1633514435;
	bh=7wHBnBDw21B+0HO8/oq0rDyMgMzNvwntlNNHv4Xo0Ws=;
	h=Message-Id:Date:Subject:To:From:Cc;
	b=2CdKT3hnFl7XaSLDiP+/bg5XrLGNCne3lNNppJfIOkQpjLSUVYfiJw0Qpdl7wANxt
	 nj43BB3nzEODIoFKpfFNkUZKZV+ZJ7ouAkU/kYp7t1iP9BQCxTA15pKCZvhj9AH4n2
	 E6vRIU1Ig0KBw4huu4W0mx24br/iK1YURRLBPk6M=
Authentication-Results: vla3-fd8580bf9bb2.qloud-c.yandex.net;
 dkim=pass header.i=@zhukoff.net
Received: by vla1-62318bfe5573.qloud-c.yandex.net (smtp/Yandex) with ESMTPS id
 UiQZyXL6Fc-0YNebAol;
	Wed, 06 Oct 2021 13:00:34 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
From: pavel@zhukoff.net
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Pavel Zhukov <pavel.zhukov@huawei.com>,
	pavel@zhukoff.net,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [dunfell][PATCH] weston-init: Override the systemd service by a
 notify-based one
Date: Wed,  6 Oct 2021 12:00:13 +0200
Message-Id: <20211006100013.24757-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 10:00:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156682

From: Pavel Zhukov <pavel.zhukov@huawei.com>

Using systemd notify, a service dependency would be more robust. This
allows, for example, another service to depend on weston-init without
having to hack a sleep (or similar). This change required more robust
handling of weston modules argument due to custom argument parser
impmentation in weston (only last --modules argument is accepted).

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


