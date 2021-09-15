Received: from forward103o.mail.yandex.net (forward103o.mail.yandex.net [37.140.190.177])
 by mx.groups.io with SMTP id smtpd.web10.4769.1631695858087840286
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 01:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@zhukoff.net header.s=mail header.b=OvNu1Q8O;
 spf=pass (domain: zhukoff.net, ip: 37.140.190.177, mailfrom: pavel@zhukoff.net)
Received: from forward103q.mail.yandex.net (forward103q.mail.yandex.net [IPv6:2a02:6b8:c0e:50:0:640:b21c:d009])
	by forward103o.mail.yandex.net (Yandex) with ESMTP id 0C24C10AA86F;
	Wed, 15 Sep 2021 11:50:54 +0300 (MSK)
Received: from vla5-37f61b527e71.qloud-c.yandex.net (vla5-37f61b527e71.qloud-c.yandex.net [IPv6:2a02:6b8:c18:341d:0:640:37f6:1b52])
	by forward103q.mail.yandex.net (Yandex) with ESMTP id 078AF56A0002;
	Wed, 15 Sep 2021 11:50:54 +0300 (MSK)
Received: from vla5-8422ddc3185d.qloud-c.yandex.net (vla5-8422ddc3185d.qloud-c.yandex.net [2a02:6b8:c18:3495:0:640:8422:ddc3])
	by vla5-37f61b527e71.qloud-c.yandex.net (mxback/Yandex) with ESMTP id 60ulKoZzFC-orDi0Hed;
	Wed, 15 Sep 2021 11:50:54 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; s=mail; t=1631695854;
	bh=w1mov7N9l/ycl2UAfYaW7KMgs0Oeu3gfhJKS036GO4E=;
	h=Message-Id:Date:Subject:To:From:Cc;
	b=OvNu1Q8ODOgcYuXkxsFsl9NihfViR8UlFlTopXyIFm4XoXtrmX9IEA5mIaeEbT1Zu
	 HD0NgNnZrwkPfRCDMIJtCF3wOO8tc5bewz6u9UzHrtu8GN1Rndh17kCLh20W4tc5ED
	 coT39GrL5hewvV0Bja45f+gOEkd4hPXIDQm4/cz0=
Authentication-Results: vla5-37f61b527e71.qloud-c.yandex.net; dkim=pass header.i=@zhukoff.net
Received: by vla5-8422ddc3185d.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id xC8l9BM4IX-oqoGmeh4;
	Wed, 15 Sep 2021 11:50:53 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
From: "Pavel Zhukov" <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Subject: [PATCH v2] weston: wrapper for weston modules argument
Date: Wed, 15 Sep 2021 10:50:37 +0200
Message-Id: <20210915085037.11973-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Due to custom option parser implementation weston accepts only one
argument of a given type. As the result if multiple modules add
multiple --modules agruments only last will be used. This fix
introduces wrapper around modules in terms of weston-init to prepare
proper modules argument for weston and adds systemd-notify module into
weston-init module to support Type=3Dnotify in systemd service file.

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 .../recipes-graphics/wayland/weston-init/weston-start | 11 +++++++++++
 .../wayland/weston/systemd-notify.weston-start        |  9 +++++++++
 meta/recipes-graphics/wayland/weston_9.0.0.bb         |  5 +++++
 3 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/systemd-notify.w=
eston-start

diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/met=
a/recipes-graphics/wayland/weston-init/weston-start
index 0b93dc964a..0f1bc4c29d 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -21,6 +21,14 @@ add_weston_argument() {
 # Add openvt extra argument
 add_openvt_argument() {
 	openvt_args=3D"$openvt_args $1"
+
+}
+## Add module to --modules argument
+add_weston_module() {
+	if [[ "x${weston_modules}" =3D=3D "x" ]]; then
+		weston_modules=3D"--modules "
+	fi;
+	weston_modules+=3D"${1},"
 }
=20
 if [ -n "$WAYLAND_DISPLAY" ]; then
@@ -68,6 +76,9 @@ if [ -d "$modules_dir" ]; then
=20
 		# process module
 		. $m
+		if [[ x"{$weston_modules}" !=3D "x" ]]; then
+			add_weston_argument "${weston_modules}"
+		fi;
 	done
 fi
=20
diff --git a/meta/recipes-graphics/wayland/weston/systemd-notify.weston-s=
tart b/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
new file mode 100644
index 0000000000..a97e7b38d9
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
@@ -0,0 +1,9 @@
+#!/bin/sh
+ =20
+# SPDX-FileCopyrightText: Huawei Inc.
+# SPDX-License-Identifier: Apache-2.0
+
+
+if [[ -x "/usr/lib/weston/systemd-notify.so" ]]; then
+        add_weston_module "systemd-notify.so"
+fi
diff --git a/meta/recipes-graphics/wayland/weston_9.0.0.bb b/meta/recipes=
-graphics/wayland/weston_9.0.0.bb
index 1f1d62ea7c..59ab217a3b 100644
--- a/meta/recipes-graphics/wayland/weston_9.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_9.0.0.bb
@@ -9,6 +9,7 @@ SRC_URI =3D "https://wayland.freedesktop.org/releases/${B=
PN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
            file://xwayland.weston-start \
+           file://systemd-notify.weston-start \
            file://0001-weston-launch-Provide-a-default-version-that-does=
n-t.patch \
            file://0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-a=
nd-.patch \
            file://0001-meson.build-fix-incorrect-header.patch \
@@ -111,6 +112,10 @@ do_install:append() {
 		install -Dm 644 ${WORKDIR}/xwayland.weston-start ${D}${datadir}/weston=
-start/xwayland
 	fi
=20
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'yes', 'no', d)}=
" =3D "yes" ]; then
+		install -Dm 644 ${WORKDIR}/systemd-notify.weston-start ${D}${datadir}/=
weston-start/systemd-notify
+	fi
+
 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'launch', 'yes', 'no', d)}"=
 =3D "yes" ]; then
 		chmod u+s ${D}${bindir}/weston-launch
 	fi
--=20
2.31.1

