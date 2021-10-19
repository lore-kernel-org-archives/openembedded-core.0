Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59694C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:54:25 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.15513.1634673264044913648
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=NHJyCHsM;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id y1so14450457plk.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IgHJIicjP1g4q1FWB1M9loQaJdQ8Zkp+GNGUtrXQH7M=;
        b=NHJyCHsMnQTK08fuPOWBz9pGIFIiJv2DI5NGmC/Y4g2oDL1OltPsxG+suYQwQm5LiA
         JvCKj/pPhydzESMe9QZt3wxF/uhN1LiNSDQg/3m1baDcpd47RkbThp+Ofn3T3vnqOoVg
         tZIL7OkzgUdvIKcvRyxQlZ59IHnJCgUQAjzl0mjuPOXrX5X1Q6Cb6IWbbBQkG6vSM0uO
         pHGB5kaPY9bsLH7qsrsR8LS5snXazxAfNh7P59Qs1VgfCGY0MvZ0lB/4bmDgSvxOIL6f
         4+2B0h1ksMoU9ZlfzK9FrXj9TGh5Nu420cpGGcNjOltEjfPel4zHGv8l/uNsCtBgx5wn
         3zqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IgHJIicjP1g4q1FWB1M9loQaJdQ8Zkp+GNGUtrXQH7M=;
        b=Z8uY9ulZ+gQFHpLXQSZZMggBXpWvBSRKbyDFGEc0baOG/2EHiZeJLANfzrpQMmZTdl
         e1+uSpp99SUdKn8aGlRRY99e618p6qL58pmDUcXDeXRNm6QeonN6k3rb/NVP1S0m1zh/
         x0hAp9274sVSevNQVrsCHxMYpYNNiiTMsZ1dvsAPna1T9mCcKaDh4KuvFsJXVaUkUyDO
         U6jSPGnag3wJCyTS8BySX8oAhPswzZnrqzM4XnTw+lc7nWG7F77wLvkxluwekQIP9Mug
         HvxwUMyILg/yKW2gLLlbEcIOoJnc81NeEKSncA9ciEBt10HNVkO3dje3wfFI1CmEf8Is
         HDcQ==
X-Gm-Message-State: AOAM531sX11DCcmgXvp2VXVD9RHFooAShCHjAg+e6z3FiBj9/6Z2UGg1
	AVPE/LBGmKOZDzv0lrUim3KHojrsa+7ZvfCTv7M=
X-Google-Smtp-Source: 
 ABdhPJwrUznzM7faCk/Xbf/TsZH8UNDUQYFPnCvynC67lIDDOVc6oTZ/+42deN7K8dkrpPkNdnL0KQ==
X-Received: by 2002:a17:90b:a18:: with SMTP id
 gg24mr2203498pjb.18.1634673263082;
        Tue, 19 Oct 2021 12:54:23 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.54.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:54:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/38] weston: Use systemd notify,
Date: Tue, 19 Oct 2021 09:53:18 -1000
Message-Id: 
 <4efdcc10906945765aa28324ce1badc59cda2976.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:54:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157212

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../wayland/weston-init/weston-start                 | 12 ++++++++++++
 .../wayland/weston-init/weston@.service              |  6 ++++++
 .../wayland/weston/systemd-notify.weston-start       |  9 +++++++++
 .../wayland/weston/xwayland.weston-start             |  3 +--
 meta/recipes-graphics/wayland/weston_8.0.0.bb        |  6 ++++++
 5 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston/systemd-notify.weston-start

diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
index ccc7093425..97471df80d 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -23,6 +23,15 @@ add_openvt_argument() {
 	openvt_args="$openvt_args $1"
 }
 
+## Add module to --modules argument
+add_weston_module() {
+	if [ -z "${weston_modules}" ]; then
+		weston_modules="--modules "
+	fi;
+	weston_modules="${weston_modules}${1},"
+}
+
+
 if [ -n "$WAYLAND_DISPLAY" ]; then
 	echo "ERROR: A Wayland compositor is already running, nested Weston instance is not supported yet."
 	exit 1
@@ -65,6 +74,9 @@ if [ -d "$modules_dir" ]; then
 		# process module
 		. $m
 	done
+	if [ -n "${weston_modules}" ]; then
+		add_weston_argument "${weston_modules} "
+	fi;
 fi
 
 if test -z "$XDG_RUNTIME_DIR"; then
diff --git a/meta/recipes-graphics/wayland/weston-init/weston@.service b/meta/recipes-graphics/wayland/weston-init/weston@.service
index 39e193014a..70c706d75c 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston@.service
+++ b/meta/recipes-graphics/wayland/weston-init/weston@.service
@@ -1,3 +1,7 @@
+# SPDX-FileCopyrightText: Huawei Inc.
+#
+# SPDX-License-Identifier: Apache-2.0
+
 [Unit]
 Description=Weston Wayland Compositor
 RequiresMountsFor=/run
@@ -5,6 +9,8 @@ Conflicts=plymouth-quit.service
 After=systemd-user-sessions.service plymouth-quit-wait.service
 
 [Service]
+Type=notify
+NotifyAccess=all
 User=%i
 PAMName=login
 EnvironmentFile=-/etc/default/weston
diff --git a/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start b/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
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
diff --git a/meta/recipes-graphics/wayland/weston/xwayland.weston-start b/meta/recipes-graphics/wayland/weston/xwayland.weston-start
index b483c97cf1..22984f50a4 100644
--- a/meta/recipes-graphics/wayland/weston/xwayland.weston-start
+++ b/meta/recipes-graphics/wayland/weston/xwayland.weston-start
@@ -2,6 +2,5 @@
 
 if type Xwayland  >/dev/null 2>/dev/null; then
 	mkdir -p /tmp/.X11-unix
-
-	add_weston_argument "--modules=xwayland.so"
+	add_weston_module "xwayland.so"
 fi
diff --git a/meta/recipes-graphics/wayland/weston_8.0.0.bb b/meta/recipes-graphics/wayland/weston_8.0.0.bb
index 0b383f25f3..2b120d7404 100644
--- a/meta/recipes-graphics/wayland/weston_8.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_8.0.0.bb
@@ -5,9 +5,11 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
                     file://libweston/compositor.c;endline=27;md5=6c53bbbd99273f4f7c4affa855c33c0a"
 
+
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
+           file://systemd-notify.weston-start \
            file://xwayland.weston-start \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
 "
@@ -101,6 +103,10 @@ do_install_append() {
 		install -Dm 644 ${WORKDIR}/xwayland.weston-start ${D}${datadir}/weston-start/xwayland
 	fi
 
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'yes', 'no', d)}" = "yes" ]; then
+	        install -Dm 644 ${WORKDIR}/systemd-notify.weston-start ${D}${datadir}/weston-start/systemd-notify
+	fi
+
 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'launch', 'yes', 'no', d)}" = "yes" ]; then
 		chmod u+s ${D}${bindir}/weston-launch
 	fi
-- 
2.25.1


