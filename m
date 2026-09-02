Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BADC7C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 18:10:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2065.1788372597626021914
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 11:09:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ydfKnXWb;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E4F364E414D1
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 18:09:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B30D76053C
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 18:09:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D2DF11C7932C;
	Wed,  2 Sep 2026 20:09:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788372595; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hrV8g7l1G1aljW6UO1y5GYRiVvRWsUHYJyassMdFXYo=;
	b=ydfKnXWbXGFpGiSTfbFroOq4c1OryYb4sRp+ThHDcowFF+0tSLJm0MQZWmKi95N2zO5Ql7
	ZI76hRRnksijBdT75B/WDlAgJsGBT8S4xcYfr8TEy+luWvK+mvG/ZN1+pvuMoE1FmymDrJ
	y7rBXj771DmJqDFQwFvmVxLe4t+xXMtHqWusbWaTiXaHooQogTksjQ8vD4Nj6HKuP91Oh1
	hfPxafIWOqls9Wilkf25vk58p+M/hM/CXLYQQiQUxtAiE6pp6dBQSfukwU9mUYRgFvta7o
	JqITptJ/V2fqfBt88fu3mBLvBGKjEy9i6f+wBLu8YE0LQz1FDPqTesEvlqxR2Q==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 02 Sep 2026 20:09:44 +0200
Subject: [PATCH v2 3/4] libfaketime: Fix builds on 32 bits platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-mathieu-reproducible-faketime-v2-3-9496dff5bde3@bootlin.com>
References: <20260902-mathieu-reproducible-faketime-v2-0-9496dff5bde3@bootlin.com>
In-Reply-To: <20260902-mathieu-reproducible-faketime-v2-0-9496dff5bde3@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788372584; l=3134;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=RvE4a07oX5l1K/wFl21ejv2TGwDPL4v9MbZ5kdUGcj8=;
 b=Do+vRU6ZUEWiOxBnRCB9MkOXtVB1yeYzfMBHOtCyEO4Geb8m+0pER0DOlxuBFFJj6wPTalDPO
 6BX2jrMNPqBBafmNy5sKdFdUkfh+QWIzHjQETzNOD+LNYOr4TmCg5oQ
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 18:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244988

Fix build when using -D_TIME_BITS=64 CFLAGS on 32 bits platforms,
avoiding function redefinitions.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 ....c-do-not-declare-__time64-when-D_TIME_BI.patch | 46 ++++++++++++++++++++++
 .../libfaketime/libfaketime_0.9.13.bb              |  4 +-
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libfaketime/libfaketime/0001-libfaketime.c-do-not-declare-__time64-when-D_TIME_BI.patch b/meta/recipes-support/libfaketime/libfaketime/0001-libfaketime.c-do-not-declare-__time64-when-D_TIME_BI.patch
new file mode 100644
index 000000000000..580e46b40ee5
--- /dev/null
+++ b/meta/recipes-support/libfaketime/libfaketime/0001-libfaketime.c-do-not-declare-__time64-when-D_TIME_BI.patch
@@ -0,0 +1,46 @@
+From 6288d9367a17afef395ca898844ccbf4c0b58ef7 Mon Sep 17 00:00:00 2001
+From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
+Date: Wed, 2 Sep 2026 13:07:05 +0200
+Subject: [PATCH] libfaketime.c: do not declare __time64 when -D_TIME_BITS=64
+ is used
+
+When _TIME_BITS macro is set to 64, __clock_gettime64(),
+__gettimeofday64() and __time64 will be defined in the glibc. There is
+no need to define these here.
+
+Upstream-Status: Submitted [https://github.com/wolfcw/libfaketime/pull/553]
+Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
+---
+ src/libfaketime.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/libfaketime.c b/src/libfaketime.c
+index e6748832fecb..7f3c65bf2bc9 100644
+--- a/src/libfaketime.c
++++ b/src/libfaketime.c
+@@ -1802,11 +1802,13 @@ int __lxstat (int ver, const char *path, struct stat *buf)
+ #endif
+ 
+ #ifdef __GLIBC__
++#if (_TIME_BITS != 64)
+ int stat64 (const char *path, struct stat64 *buf)
+ {
+   STAT64_HANDLER(stat64, buf, path, buf);
+ }
+ #endif
++#endif
+ 
+ /* Contributed by Philipp Hachtmann in version 0.6 */
+ #ifndef __ANDROID__
+@@ -3375,7 +3377,7 @@ int clock_gettime(clockid_t clk_id, struct timespec *tp)
+ 
+ #ifdef __GLIBC__
+ /* This is used by glibc 32-bit architectures only. */
+-#ifndef FAKETIME_TIME64_BUILD
++#if (_TIME_BITS != 64)
+ int __clock_gettime64(clockid_t clk_id, struct __timespec64 *tp64)
+ {
+   struct timespec tp;
+-- 
+2.47.3
+
diff --git a/meta/recipes-support/libfaketime/libfaketime_0.9.13.bb b/meta/recipes-support/libfaketime/libfaketime_0.9.13.bb
index e10d5aa457b4..640f0224b446 100644
--- a/meta/recipes-support/libfaketime/libfaketime_0.9.13.bb
+++ b/meta/recipes-support/libfaketime/libfaketime_0.9.13.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRCREV = "86b37fde2fed7336ea2d0c17928e3015a55d9b4a"
 
-SRC_URI = "git://github.com/wolfcw/libfaketime.git;branch=master;tag=v${PV};protocol=https"
+SRC_URI = "git://github.com/wolfcw/libfaketime.git;branch=master;tag=v${PV};protocol=https \
+           file://0001-libfaketime.c-do-not-declare-__time64-when-D_TIME_BI.patch \
+"
 
 CFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
 

-- 
2.47.3


