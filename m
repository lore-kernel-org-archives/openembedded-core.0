Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28ADCA0EFF
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:49 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.6616.1756330242818383411
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XvNpWPQE;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-32326e5f058so283033a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330242; x=1756935042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbOxWQWK7LNrCSA9NVFraDQ8i5xLyxN/MnEUJ12I134=;
        b=XvNpWPQE8gOnwxfT8X8RFsCAUdCmMWppct5cSu22Fs+hBjVg1myWtXUt1CfFJNPHwu
         2L3e9M1Ke6NXamYjZJ3hSwg/YQQr89jmjblBol41t6amNf4QIJJM8PHMDcgsAfR32RWV
         FZ30u1Mn3gmvxOn3DKE5RWJnGbWI4KbiVjqCmAYU8ylwXphVvFaTX8+7NmkXid3wDDf4
         Tn/XYHLjdQghSQsMG8apJcAicgPzqycpkQkUG4YzqiNui7Itns01VPFpfYGEJPUVqO95
         +18W5k9NL4HffLmw4EUj1FETlavRfABGgY+EvXla6GSzW1XRIZmwOvHTLLcou13fliqo
         roHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330242; x=1756935042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbOxWQWK7LNrCSA9NVFraDQ8i5xLyxN/MnEUJ12I134=;
        b=Ky1FgGeHeIFCBUtwKj4YFFiMAFCxMl2zaJJa6XmjVBUgDoeQW+KsUGfSCmiFOozilI
         yJpzVO+XzdQTEnry3mU3eik3d4iO5iMZy+NHfnGXCABptl4oS5hZaQYce4tSu8KcCVWi
         HwzNA1NI89SnFaWOrwUOk9vX8PH6qaE0etOKdpz7tHTmh7h1Ysv0hO0RJK1jgo8dEn/M
         VBhpkteTjl3DAjtx/aXsffDl/fRYLOSHEw0UAmCHVuncJ7+OCFVq889tIQRh6jrRMrNK
         zlZRyxnniX2xdPFX1LHc3bL1cabzDBMzWhA4dJal8BzVrO9GuxJXcUEoGmTQqiVIdTVN
         4aHQ==
X-Gm-Message-State: AOJu0Yyx6GtEc/MwrX3PPDIScBrYFRQnYIYNvUfmAxTE+wzK/xus5bzi
	+uqeuwvjj+rC8EJIqHfyw/91VVFN5NeFcLsqqQ0TFm2iOlZa0W53MubHyMNQelimoYGEODvRWyg
	i1AHC
X-Gm-Gg: ASbGnctjjXtpY6p0pcNHaK2IhD8QK6FMZjmY+eTNXQSqbZf1xT0kbPxHqwipyhmmr7n
	nCPKNLfAA+yukOzg00dh7POU/5GPUL237hNCNY9E6lh4qaDfL+9vLKhMpxpOs6crhUz1m++qHOo
	XdK/Bv+xjUrQb04Q5o8N8oRPM1AE5/aEM9IsGRAe7HOfpEGRlCyTdYcva73/l0Gci/K0DlHyazi
	RJ7pndXKt9x7hT2dR6ii5b131rP6cIJfB9O3422rjDmuR1B5JAIuOqdzTyNE59e7rUjfgnq/lGV
	+TUubYiuhCQNxXELf1lBqgks35o79n941P+LChp+t2sd24ablFwnJQA/mYdasZrBpMrTlQ/s4j+
	uXgTvEX9u54jebQ==
X-Google-Smtp-Source: AGHT+IHFvsUrtse5U7s0fGxLYYz/SG8K2t8dxLBkL1ICW4kgHrB0C8gZqReqFGyw5deJWA3U1JGYkw==
X-Received: by 2002:a17:90b:1f8b:b0:312:f0d0:bc4 with SMTP id 98e67ed59e1d1-32515e12aedmr24451762a91.5.1756330241943;
        Wed, 27 Aug 2025 14:30:41 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 28/33] dbus-glib: fix build with gcc-15
Date: Wed, 27 Aug 2025 14:29:35 -0700
Message-ID: <6c546567adc84667fc76d777b02fc78e9c472f51.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222536

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../dbus-glib/fix-build-with-gcc-15.patch     | 37 +++++++++++++++++++
 meta/recipes-core/dbus/dbus-glib_0.112.bb     |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus-glib/fix-build-with-gcc-15.patch

diff --git a/meta/recipes-core/dbus/dbus-glib/fix-build-with-gcc-15.patch b/meta/recipes-core/dbus/dbus-glib/fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..bf3fcd5b86
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-glib/fix-build-with-gcc-15.patch
@@ -0,0 +1,37 @@
+From 8c32bc9fa67513f46199bc31498dc1fecbb611bb Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Thu, 13 Mar 2025 14:19:28 +0000
+Subject: [PATCH] dbus-gvalue: Avoid using the reserved word 'bool'
+
+This is reserved in C23 for the equivalent of `<stdbool.h>`.
+
+Bug-Debian: https://bugs.debian.org/1096507
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+Upstream-Status: Backport [https://gitlab.freedesktop.org/dbus/dbus-glib/-/commit/8c32bc9fa67513f46199bc31498dc1fecbb611bb]
+igned-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ dbus/dbus-gvalue.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/dbus/dbus-gvalue.c b/dbus/dbus-gvalue.c
+index 534e90a..788e360 100644
+--- a/dbus/dbus-gvalue.c
++++ b/dbus/dbus-gvalue.c
+@@ -545,11 +545,11 @@ demarshal_basic (DBusGValueMarshalCtx      *context,
+     {
+     case DBUS_TYPE_BOOLEAN:
+       {
+-	dbus_bool_t bool;
++	dbus_bool_t b;
+         if (!G_VALUE_HOLDS (value, G_TYPE_BOOLEAN))
+           goto invalid_type;
+-	dbus_message_iter_get_basic (iter, &bool);
+-	g_value_set_boolean (value, bool);
++	dbus_message_iter_get_basic (iter, &b);
++	g_value_set_boolean (value, b);
+ 	return TRUE;
+       }
+     case DBUS_TYPE_BYTE:
+-- 
+GitLab
+
diff --git a/meta/recipes-core/dbus/dbus-glib_0.112.bb b/meta/recipes-core/dbus/dbus-glib_0.112.bb
index 4acf435694..7312897dd3 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.112.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.112.bb
@@ -13,6 +13,7 @@ DEPENDS:class-native = "glib-2.0-native dbus-native"
 SRC_URI = "https://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${PV}.tar.gz \
            file://no-examples.patch \
            file://test-install-makefile.patch \
+           file://fix-build-with-gcc-15.patch \
 "
 SRC_URI[md5sum] = "021e6c8a288df02c227e4aafbf7e7527"
 SRC_URI[sha256sum] = "7d550dccdfcd286e33895501829ed971eeb65c614e73aadb4a08aeef719b143a"
-- 
2.43.0


