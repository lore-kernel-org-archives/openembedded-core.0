Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.7804.1618980242546375866
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 21:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13L4hwYk027600
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Apr 2021 21:43:59 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 20 Apr 2021 21:43:58 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Tue, 20 Apr 2021 21:43:58 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] weston: fix build failure due to race condition
Date: Tue, 20 Apr 2021 21:43:58 -0700
Message-ID: <20210421044358.36482-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The wayland.c actually include 'xdg-shell-client-protocol.h' instead of
the server one, so fix it. Otherwise, it's possible to get build failure
due to race condition.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...001-meson.build-fix-incorrect-header.patch | 32 +++++++++++++++++++
 meta/recipes-graphics/wayland/weston_9.0.0.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-meson.build-fix-incorrect-header.patch

diff --git a/meta/recipes-graphics/wayland/weston/0001-meson.build-fix-incorrect-header.patch b/meta/recipes-graphics/wayland/weston/0001-meson.build-fix-incorrect-header.patch
new file mode 100644
index 0000000000..06e0f7baec
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0001-meson.build-fix-incorrect-header.patch
@@ -0,0 +1,32 @@
+From a2ba4714a6872e547621d29d9ddcb0f374b88cf6 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 20 Apr 2021 20:42:18 -0700
+Subject: [PATCH] meson.build: fix incorrect header
+
+The wayland.c actually include 'xdg-shell-client-protocol.h' instead of
+the server one, so fix it. Otherwise, it's possible to get build failure
+due to race condition.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ libweston/backend-wayland/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libweston/backend-wayland/meson.build b/libweston/backend-wayland/meson.build
+index 7e82513..29270b5 100644
+--- a/libweston/backend-wayland/meson.build
++++ b/libweston/backend-wayland/meson.build
+@@ -10,7 +10,7 @@ srcs_wlwl = [
+ 	fullscreen_shell_unstable_v1_protocol_c,
+ 	presentation_time_protocol_c,
+ 	presentation_time_server_protocol_h,
+-	xdg_shell_server_protocol_h,
++	xdg_shell_client_protocol_h,
+ 	xdg_shell_protocol_c,
+ ]
+ 
+-- 
+2.30.2
+
diff --git a/meta/recipes-graphics/wayland/weston_9.0.0.bb b/meta/recipes-graphics/wayland/weston_9.0.0.bb
index 50fbfa613b..bcbac06d58 100644
--- a/meta/recipes-graphics/wayland/weston_9.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_9.0.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://xwayland.weston-start \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
            file://0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch \
+           file://0001-meson.build-fix-incorrect-header.patch \
 "
 
 SRC_URI_append_libc-musl = " file://dont-use-plane-add-prop.patch "
-- 
2.30.2

