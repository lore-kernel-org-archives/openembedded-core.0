Return-Path: <youngseok1.jeong@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25149CA0EE4
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 04:27:28 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web11.8440.1755589395351660266
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 00:43:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: youngseok1.jeong@lge.com)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.51 with ESMTP; 19 Aug 2025 16:43:12 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: youngseok1.jeong@lge.com
Received: from unknown (HELO ys-server..) (10.177.121.106)
	by 156.147.1.126 with ESMTP; 19 Aug 2025 16:43:12 +0900
X-Original-SENDERIP: 10.177.121.106
X-Original-MAILFROM: youngseok1.jeong@lge.com
From: youngseok1.jeong@lge.com
To: openembedded-core@lists.openembedded.org
Cc: Youngseok Jeong <youngseok1.jeong@lge.com>
Subject: [kirkstone][PATCH] libubootenv: backport patch to fix unknown type name 'size_t'
Date: Tue, 19 Aug 2025 21:27:23 -0700
Message-ID: <20250819074310.473119-1-youngseok1.jeong@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Old-Date: Tue, 19 Aug 2025 16:43:10 +0900
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 04:27:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222076
Message-ID: <20250820042723.xNaqWcvMloOO1mJMN-gUOuUVmXSwUeU7gsTDvs75t44@z>

From: Youngseok Jeong <youngseok1.jeong@lge.com>

Fixes:
../recipe-sysroot/usr/include/libuboot.h:29:2: error: unknown type name 'size_t'
size_t          envsize;
^

This error can be avoided by using CXXFLAGS:append = " -include cstddef"
but this way would be needed in all recipes that use libuboot.h.
Therefore, Backport the patch to include <cstddef>.

Signed-off-by: Youngseok Jeong <youngseok1.jeong@lge.com>
---
 ...-Include-cstddef-in-the-header-for-C.patch | 27 +++++++++++++++++++
 meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb  |  6 ++++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-Include-cstddef-in-the-header-for-C.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-Include-cstddef-in-the-header-for-C.patch b/meta/recipes-bsp/u-boot/files/0001-Include-cstddef-in-the-header-for-C.patch
new file mode 100644
index 0000000000..9a006e2cfd
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-Include-cstddef-in-the-header-for-C.patch
@@ -0,0 +1,27 @@
+From 10c9a571f1c0472799f72b1924b039aab231e95f Mon Sep 17 00:00:00 2001
+From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
+Date: Thu, 16 Dec 2021 16:19:50 +0100
+Subject: [PATCH] Include cstddef in the header for C++
+
+So C++ compiler always has access to the definition of size_t.
+
+Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
+Signed-off-by: Youngseok Jeong <youngseok1.jeong@lge.com>
+Upstream-Status: Backport [v0.3.3 https://github.com/sbabic/libubootenv/pull/19/commits/764226a7de2ea79b182d92829922489537c766fa]
+---
+ src/libuboot.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/libuboot.h b/src/libuboot.h
+index 88f0558..1f305f4 100644
+--- a/src/libuboot.h
++++ b/src/libuboot.h
+@@ -6,6 +6,8 @@
+  */
+ 
+ #ifdef __cplusplus
++#include <cstddef>
++
+ extern "C" {
+ #endif
+ 
diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
index e8f58941cf..7ff57ae157 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
@@ -10,7 +10,11 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 
-SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https;branch=master"
+SRC_URI = " \
+    git://github.com/sbabic/libubootenv;protocol=https;branch=master \
+    file://0001-Include-cstddef-in-the-header-for-C.patch \
+"
+
 SRCREV = "ba7564f5006d09bec51058cf4f5ac90d4dc18b3c"
 
 S = "${WORKDIR}/git"

