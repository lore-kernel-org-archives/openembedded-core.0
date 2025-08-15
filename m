Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A516FCA0EEB
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 16:45:16 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.16348.1755276311948673006
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 09:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wur9612N;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2445806e03cso22851885ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 09:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755276311; x=1755881111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jI50m1BKZJ4m3KEIEye9dblXWJ/oF4p6wUacctuPAx4=;
        b=wur9612NGql+hWvQrz5qag4xsN53gxkjPSqe9AFWulRx5s/thF7vpGRxZXIQZO7Qwe
         nB4yfRGAgDQ0PD+YMlMFrIIEFn6GSoPHKLwyqkFtcyb3Q58Sna49ejhCgU2KeIpi7Moi
         BqyaDFF4roQu7eqMk/z0u8Dy0Ch/khV6+mKqDHSYIJEC5mLD5ZB32z7r/AzcMSRGjbGg
         KFuXmhTAl2TWNQqzQN/xZQZiA/4XBWODeypnNDJodA7RenOe2Y9AgWd2kPHJPs/hZpFy
         kETim0+R3NPdPrIrJHXhTjOOwUHsYBeJEeMXm3WaYNdOlWzYoMd5ygpqABxYXzHC7CNI
         0Xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755276311; x=1755881111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jI50m1BKZJ4m3KEIEye9dblXWJ/oF4p6wUacctuPAx4=;
        b=tjD+Nuj9bLVG4fH461/fj+gPPWdVwvWB/XPZVsa6fjw0sT/6k3E9ft2udFDNculFHV
         DF5WSzmFXKI5t/MgKck2jxMs+sdCa+OuXwlB+eP1+BKDLW1gKOH521PAS+IRTntfVzQ7
         ebQ/pYu5Nfk8nST9uNLzbhwDMj/MfPt0m5jeHbLDJp8YU1BeskWsZjbWydahV8H74t5i
         nOs6zMDXWz8vX8g/KNJYKo3zdrhokFmzpWs2ZGhXODZ+tiNk6gTLc0yLtVM9qFLQBKrx
         v7+/aTbKwrbG5piNdRVpN8nKVnHAyobfXs8DVNJRg2EsYfDMdO5BMzL4bvFu1GrFmA94
         PNtg==
X-Gm-Message-State: AOJu0YzmgyNK7U7Yn1RaTmoBFLbUNUPiUVjJWhdSBrWE26g596az03W0
	n0D5ppBIyfcAujpzrzKWPS/zxm8SisNXtqXGENIByk4bFB3pUtMPWhwvzTBGwyjmq214gIUoHIx
	lu/xN
X-Gm-Gg: ASbGnctH1v6L1UX+XKt+BcZGhXDzjoepQY6cOSYZzW5k6/awe5LgW5/1M0XSv52qnAq
	7OEo36dcKV9FYiV7uRyUD0gEsP2fyaB05+Rydg8MN384cWFXj0IS5X4vm5yloWR4IoO9mbGmGnZ
	EzwZ/zwQFyXi6xIowIQzA8ellkxx+N6LmZzDXDvwI0dSbPIrLtNnAS7IE2yc7svaq34oFNJUnPH
	cIotvypV6fE35YRTkmO4XLdG07PbjwY8xHAr21VsDsVeu53KI/fXSqv781zYbfOFlQhQ5kC9THc
	yoD4bUZSfWM0ynlcHtxDoFbPKcnSngvaeNxaIQtZ/MpIqr3jyeeaT607iARy0LJJw42Yjy2oj1/
	kYwJfSyqpOmAsTw==
X-Google-Smtp-Source: AGHT+IEOQgt8b6939eRVUAoctF58m5eFrApKtyROUy6ciYyMJAxWpHYOdjrUVbMxTy/CECBeaQeX/w==
X-Received: by 2002:a17:903:1af0:b0:243:ba7:66ed with SMTP id d9443c01a7336-2446d8f30fbmr39904415ad.31.1755276311144;
        Fri, 15 Aug 2025 09:45:11 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3ec5:7840:3390:1caa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c9ab2asm1554476a91.30.2025.08.15.09.45.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 09:45:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/9] gstreamer1.0-plugins-base: fix CVE-2025-47808
Date: Fri, 15 Aug 2025 09:44:55 -0700
Message-ID: <2611a16cad53d2bf0cda2946678e7d31e3ffa007.1755276097.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755276097.git.steve@sakoman.com>
References: <cover.1755276097.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 16:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221984

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/6b19f117518a765a25c99d1c4b09f2838a8ed0c9

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2025-47808.patch                      | 36 +++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.22.12.bb      |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47808.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47808.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47808.patch
new file mode 100644
index 0000000000..5b9fefc321
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47808.patch
@@ -0,0 +1,36 @@
+From 6b19f117518a765a25c99d1c4b09f2838a8ed0c9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 8 May 2025 09:04:52 +0300
+Subject: [PATCH] tmplayer: Don't append NULL + 1 to the string buffer when
+ parsing lines without text
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4417
+Fixes CVE-2025-47808
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9132>
+
+CVE: CVE-2025-47808
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/6b19f117518a765a25c99d1c4b09f2838a8ed0c9]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ gst/subparse/tmplayerparse.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/gst/subparse/tmplayerparse.c b/gst/subparse/tmplayerparse.c
+index 807e332..a9225d3 100644
+--- a/gst/subparse/tmplayerparse.c
++++ b/gst/subparse/tmplayerparse.c
+@@ -125,7 +125,9 @@ tmplayer_parse_line (ParserState * state, const gchar * line, guint line_num)
+        * durations from the start times anyway, so as long as the parser just
+        * forwards state->start_time by duration after it pushes the line we
+        * are about to return it will all be good. */
+-      g_string_append (state->buf, text_start + 1);
++      if (text_start) {
++        g_string_append (state->buf, text_start + 1);
++      }
+     } else if (line_num > 0) {
+       GST_WARNING ("end of subtitle unit but no valid start time?!");
+     }
+-- 
+2.50.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
index 05cb956815..44ecdc0b55 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0010-id3v2-Don-t-try-parsing-extended-header-if-not-enoug.patch \
            file://0011-discoverer-Don-t-print-channel-layout-for-more-than-.patch \
            file://0012-subparse-Check-for-NULL-return-of-strchr-when-parsin.patch \
+           file://CVE-2025-47808.patch \
            "
 SRC_URI[sha256sum] = "73cfadc3a6ffe77ed974cfd6fb391c605e4531f48db21dd6b9f42b8cb69bd8c1"
 
-- 
2.43.0


