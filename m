Received: from forward105p.mail.yandex.net (forward105p.mail.yandex.net [77.88.28.108])
 by mx.groups.io with SMTP id smtpd.web09.8134.1631085263217496922
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 00:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=mail header.b=Zp0/ux4N;
 spf=pass (domain: zhukoff.net, ip: 77.88.28.108, mailfrom: pavel@zhukoff.net)
Received: from sas1-f3a441df9f84.qloud-c.yandex.net (sas1-f3a441df9f84.qloud-c.yandex.net [IPv6:2a02:6b8:c14:2726:0:640:f3a4:41df])
	by forward105p.mail.yandex.net (Yandex) with ESMTP id AB81E2FDA072
	for <Openembedded-core@lists.openembedded.org>; Wed,  8 Sep 2021 10:14:18 +0300 (MSK)
Received: from sas1-e20a8b944cac.qloud-c.yandex.net (sas1-e20a8b944cac.qloud-c.yandex.net [2a02:6b8:c14:6696:0:640:e20a:8b94])
	by sas1-f3a441df9f84.qloud-c.yandex.net (mxback/Yandex) with ESMTP id SI9b3M86eo-EIDGKCd2;
	Wed, 08 Sep 2021 10:14:18 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; s=mail; t=1631085258;
	bh=MDqPk1ZcfWjLKqr0V5mxzGJStMVqTZXejFa3cu0L6EE=;
	h=Date:Subject:To:From:Reply-To:Message-ID;
	b=Zp0/ux4NNCZrh51uAltxE80TelOOYdhwpu8TxYAb/1wQBRCr+LHnPudqce9YR43jl
	 +fS/hTMHMoFUaRej3HGZYhMT4Zxh/8/yYGrifrvKxcvy7wui8uZRVxCSN1cubITEua
	 jaBmQPTJo6BX15A40/0Q5TPYzlzovvmtZ0ogesno=
Authentication-Results: sas1-f3a441df9f84.qloud-c.yandex.net; dkim=pass header.i=@zhukoff.net
Received: by sas1-e20a8b944cac.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id ii0myB3Wn7-EHAOndBU;
	Wed, 08 Sep 2021 10:14:17 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
User-agent: mu4e 1.4.15; emacs 27.2
From: "Pavel Zhukov" <pavel@zhukoff.net>
To: Openembedded-core@lists.openembedded.org
Subject: [PATCH] weston: wrapper for weston modules argument
Reply-To: pavel@zhukoff.net
Date: Wed, 08 Sep 2021 09:14:23 +0200
Message-ID: <87k0jrzghc.fsf@gentoo.zhukoff.net>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed


Due to custom option parser implementation weston accepts only one
argument of a given type. As the result if multiple modules add
multiple --modules agruments only last will be used. This fix
introduces wrapper around modules in terms of weston-init to 
prepare
proper modules argument for weston and adds systemd-notify module 
into
weston-init module to support Type=notify in systemd service file.

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 .../recipes-graphics/wayland/weston-init/weston-start | 11 
 +++++++++++
 .../wayland/weston/systemd-notify.weston-start        |  9 
 +++++++++
 meta/recipes-graphics/wayland/weston_9.0.0.bb         |  5 +++++
 3 files changed, 25 insertions(+)
 create mode 100644 
 meta/recipes-graphics/wayland/weston/systemd-notify.weston-start

diff --git 
a/meta/recipes-graphics/wayland/weston-init/weston-start 
b/meta/recipes-graphics/wayland/weston-init/weston-start
index 0b93dc964a..0f1bc4c29d 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -21,6 +21,14 @@ add_weston_argument() {
 # Add openvt extra argument
 add_openvt_argument() {
 	openvt_args="$openvt_args $1"
+
+}
+## Add module to --modules argument
+add_weston_module() {
+	if [[ "x${weston_modules}" == "x" ]]; then
+		weston_modules="--modules "
+	fi;
+	weston_modules+="${1},"
 }
 
 if [ -n "$WAYLAND_DISPLAY" ]; then
@@ -68,6 +76,9 @@ if [ -d "$modules_dir" ]; then
 
 		# process module
 		. $m
+		if [[ x"{$weston_modules}" != "x" ]]; then
+			add_weston_argument "${weston_modules}"
+		fi;
 	done
 fi
 
diff --git 
a/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start 
b/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
new file mode 100644
index 0000000000..a97e7b38d9
--- /dev/null
+++ 
b/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
@@ -0,0 +1,9 @@
+#!/bin/sh
+  
+# SPDX-FileCopyrightText: Huawei Inc.
+# SPDX-License-Identifier: Apache-2.0
+
+
+if [[ -x "/usr/lib/weston/systemd-notify.so" ]]; then
+        add_weston_module "systemd-notify.so"
+fi
diff --git a/meta/recipes-graphics/wayland/weston_9.0.0.bb 
b/meta/recipes-graphics/wayland/weston_9.0.0.bb
index 1f1d62ea7c..59ab217a3b 100644
--- a/meta/recipes-graphics/wayland/weston_9.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_9.0.0.bb
@@ -9,6 +9,7 @@ SRC_URI = 
"https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
            file://xwayland.weston-start \
+           file://systemd-notify.weston-start \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch 
            \
            file://0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch 
            \
            file://0001-meson.build-fix-incorrect-header.patch \
@@ -111,6 +112,10 @@ do_install:append() {
 		install -Dm 644 ${WORKDIR}/xwayland.weston-start 
 ${D}${datadir}/weston-start/xwayland
 	fi
 
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 
'yes', 'no', d)}" = "yes" ]; then
+		install -Dm 644 
${WORKDIR}/systemd-notify.weston-start 
${D}${datadir}/weston-start/systemd-notify
+	fi
+
 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'launch', 
 'yes', 'no', d)}" = "yes" ]; then
 		chmod u+s ${D}${bindir}/weston-launch
 	fi
-- 
2.31.1

