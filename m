Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7073EC433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 21:24:34 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.2714.1642713873174562322
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 13:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gsLYNu1U;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id l16so7296105pjl.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 13:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xz+g9goWKXy42HOrsJG7hGSc8pwVo9cRgZlzoAbUtZA=;
        b=gsLYNu1Ujw7pB9kuoZvuXglhud3HDFdPFlo4FF4yMBkVTlHkTlSUpKt63MncMf+VBr
         2sVfMjluZllj8BuqxogvVyA0Xy9O+e4SdmDzr3AO57u58+xXdW45C6pEycZRnHKMv7G4
         8xD0lo5yZowTHYv/MOaTFTFhVxS6SEchnbeFyERpOxK8tfjOIE0m24SIDH6rTdGrtcSW
         TWSl8NlGbfybt5L7ajJfB3OHFe7gR969bMBX9lkdb384A6lwUny3p0yLrh2igIxcgJMs
         nE7DRQ3XAta+mIQ/PKvNknwBvVt7SfEJ8wt2mupN9OSkzrhtqd64k+GWH9dI3ON4k5ma
         15Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xz+g9goWKXy42HOrsJG7hGSc8pwVo9cRgZlzoAbUtZA=;
        b=p9yAQ9N5oT2Pq69eiB/PysMYVvNRcsISpSKbPjg26N8X0S27mCfAlyvGUlm9rZAf6f
         vFJKiUzqPauUt+AYFtMD3TD+mxE9SqzCbprkMBpM798BLp8g1Ka7Y2buXgn8iNJWGhrU
         DN80ikaxNEngwXY5BKU+gcPVcbeUUTFYXD/32x8dJ25HCcNDB8NXcpCgJ/O32shHJfrG
         CZqpeqvS2xDBB14sz/aRb1g9MvaEBoCKS6i7/qML2tCBB0AaLc2lV8/3ovNdNunLGOD3
         T7jSRhmJNVqZQDqY+lLnX6aKKvy601ZHez4aEOCtkHuPWpUf3B8dBwtUusl0U0xtZU/U
         Sx7A==
X-Gm-Message-State: AOAM533y2yTY2ig4MC1ZP6tWO+SkzosqVbtzh8cWmwXwxRvQV+vkSMW/
	xao1PbiMiFyWNnQ/beRk5E7PYP/EHNIcJs+tMsc=
X-Google-Smtp-Source: 
 ABdhPJy9N/SHG+RRbSUKBQZt7bzHEfdKzAepyn5czezqJrmNkjxBEEWwTp8uCjfvhzZv34pI/v7apg==
X-Received: by 2002:a17:90a:c7d1:: with SMTP id
 gf17mr12854804pjb.19.1642713872160;
        Thu, 20 Jan 2022 13:24:32 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 o5sm4029115pfk.172.2022.01.20.13.24.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 13:24:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/11] Revert "weston: Use systemd notify,"
Date: Thu, 20 Jan 2022 11:23:50 -1000
Message-Id: 
 <dabd41819563ec63fc5bd5fd0f4af64230e58130.1642693490.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642693490.git.steve@sakoman.com>
References: <cover.1642693490.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 21:24:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160801

From: Marek Vasut <marex@denx.de>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../wayland/weston-init/weston-start                 | 12 ------------
 .../wayland/weston-init/weston@.service              |  6 ------
 .../wayland/weston/systemd-notify.weston-start       |  9 ---------
 .../wayland/weston/xwayland.weston-start             |  3 ++-
 meta/recipes-graphics/wayland/weston_8.0.0.bb        |  6 ------
 5 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/systemd-notify.weston-start

diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
index 97471df80d..ccc7093425 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -23,15 +23,6 @@ add_openvt_argument() {
 	openvt_args="$openvt_args $1"
 }
 
-## Add module to --modules argument
-add_weston_module() {
-	if [ -z "${weston_modules}" ]; then
-		weston_modules="--modules "
-	fi;
-	weston_modules="${weston_modules}${1},"
-}
-
-
 if [ -n "$WAYLAND_DISPLAY" ]; then
 	echo "ERROR: A Wayland compositor is already running, nested Weston instance is not supported yet."
 	exit 1
@@ -74,9 +65,6 @@ if [ -d "$modules_dir" ]; then
 		# process module
 		. $m
 	done
-	if [ -n "${weston_modules}" ]; then
-		add_weston_argument "${weston_modules} "
-	fi;
 fi
 
 if test -z "$XDG_RUNTIME_DIR"; then
diff --git a/meta/recipes-graphics/wayland/weston-init/weston@.service b/meta/recipes-graphics/wayland/weston-init/weston@.service
index 70c706d75c..39e193014a 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston@.service
+++ b/meta/recipes-graphics/wayland/weston-init/weston@.service
@@ -1,7 +1,3 @@
-# SPDX-FileCopyrightText: Huawei Inc.
-#
-# SPDX-License-Identifier: Apache-2.0
-
 [Unit]
 Description=Weston Wayland Compositor
 RequiresMountsFor=/run
@@ -9,8 +5,6 @@ Conflicts=plymouth-quit.service
 After=systemd-user-sessions.service plymouth-quit-wait.service
 
 [Service]
-Type=notify
-NotifyAccess=all
 User=%i
 PAMName=login
 EnvironmentFile=-/etc/default/weston
diff --git a/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start b/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
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
diff --git a/meta/recipes-graphics/wayland/weston/xwayland.weston-start b/meta/recipes-graphics/wayland/weston/xwayland.weston-start
index 22984f50a4..b483c97cf1 100644
--- a/meta/recipes-graphics/wayland/weston/xwayland.weston-start
+++ b/meta/recipes-graphics/wayland/weston/xwayland.weston-start
@@ -2,5 +2,6 @@
 
 if type Xwayland  >/dev/null 2>/dev/null; then
 	mkdir -p /tmp/.X11-unix
-	add_weston_module "xwayland.so"
+
+	add_weston_argument "--modules=xwayland.so"
 fi
diff --git a/meta/recipes-graphics/wayland/weston_8.0.0.bb b/meta/recipes-graphics/wayland/weston_8.0.0.bb
index e647fbc686..5e4e2032c9 100644
--- a/meta/recipes-graphics/wayland/weston_8.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_8.0.0.bb
@@ -5,11 +5,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
                     file://libweston/compositor.c;endline=27;md5=6c53bbbd99273f4f7c4affa855c33c0a"
 
-
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
-           file://systemd-notify.weston-start \
            file://xwayland.weston-start \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
            file://0002-desktop-shell-Remove-no-op-de-activation-of-the-xdg-.patch \
@@ -106,10 +104,6 @@ do_install_append() {
 		install -Dm 644 ${WORKDIR}/xwayland.weston-start ${D}${datadir}/weston-start/xwayland
 	fi
 
-	if [ "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'yes', 'no', d)}" = "yes" ]; then
-	        install -Dm 644 ${WORKDIR}/systemd-notify.weston-start ${D}${datadir}/weston-start/systemd-notify
-	fi
-
 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'launch', 'yes', 'no', d)}" = "yes" ]; then
 		chmod u+s ${D}${bindir}/weston-launch
 	fi
-- 
2.25.1


