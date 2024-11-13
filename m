Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7A7D597C8
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 03:16:28 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.3464.1731467787452616515
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 19:16:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=byEdVI7r;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71e592d7f6eso4786148b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 19:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731467787; x=1732072587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOAVAmxYGiB0v+7YW9kjw9iDZgvWW+GdAxvW7kXxnKw=;
        b=byEdVI7rtiGMr/u/B0eduij3pm0GN/PU6z0gdmWxQnZWikLJ8kaqrDRsKkHU6KxB8A
         ZD1Bes3JAepZwek36Z/h9/m5mE4vmXMsSl7XDpggZ6ooDjYl5W7BZv2SeNnutzGrOzo6
         KXnBzQ/ZvCrhlgirUiBWXWAxg496vMVt9YU4cNjHby/pT9MY6USG6LneBJS77thNnHAI
         QmmyvkBSkBsK1o2SMNG8GWOLqd0X+vLUKmFDTZ/MBqM0ycULiWxNShcMdsg7aaKsvMkJ
         Xwnhqjy612Ao9rGwExPD7vetFyNx9UM4QgRp+tONFvKIju26X3VjhCCN5Yqo2EVEmq9i
         ZhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731467787; x=1732072587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOAVAmxYGiB0v+7YW9kjw9iDZgvWW+GdAxvW7kXxnKw=;
        b=hsf5CV8Dsf+aP8gvFY89QRbDVVF9th9Rnrr2pWhVJG8iQPiVlRB0S4Fivaqmse5hCf
         6eekuCzFtD99FCq12xrxjkSUI3bSh4KwJuLirNe7VGGVzQriOZTrvQcE8fnSPCzZ6faw
         4HxpYzRnCsyBX7oV3RQigMum/ic2Y8mYLB7fZ8DYf/4w2cE+/RxnSjiDvo0iGwizSOqa
         VzmkYJmsGbFdoi6LF0JmzHuwsWqDjYLC11hMv08tJKmDUTJbePasM5xE99ZTaJdA2rEV
         /PqsNLtS4H2aj4ns/r6yblypY9z4iEPGMZDFr9YThj0EQN3ristMLxeNFBcAkQp+hJWT
         5W8g==
X-Gm-Message-State: AOJu0YxPsnH0p8q7UqD0rLQFj4w1rnDUARPG5cZVUJJZVu7y3agA1Cv0
	dZZiAJt3alcVlWUuh65Y43A9QBlyEK/AvmPZKkejxck6UBkIPflvikjNQaeCfmnrcThPsDZhvVk
	Q
X-Google-Smtp-Source: AGHT+IH+XpEKRAs25ML27sLMyRZsXt5M9X9iT4Kdt48y/4PzOGLyGQ5o9HqVlwKvrwsEeWbrbsjOMg==
X-Received: by 2002:a05:6a20:840f:b0:1d9:18b7:496 with SMTP id adf61e73a8af0-1dc22b7551cmr24768501637.45.1731467786650;
        Tue, 12 Nov 2024 19:16:26 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f64616csm9660213a12.64.2024.11.12.19.16.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 19:16:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/19] glib-2.0: patch regression of CVE-2023-32665
Date: Tue, 12 Nov 2024 19:15:58 -0800
Message-Id: <2400e143477cc93d4698df921bd89ef4b8b4692b.1731467662.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731467662.git.steve@sakoman.com>
References: <cover.1731467662.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 03:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207078

From: Peter Marko <peter.marko@siemens.com>

Official CVE-2023-32665 patch introduced a regression for big-endian
architectures.
This code was backported in CVE-2023-32665-0003.patch

Reported in [1] and fixed by [2] where this patch is picked from.

[1] https://gitlab.gnome.org/GNOME/glib/-/issues/2839
[2] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3136

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...aliser-Convert-endianness-of-offsets.patch | 68 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gvariant-serialiser-Convert-endianness-of-offsets.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gvariant-serialiser-Convert-endianness-of-offsets.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gvariant-serialiser-Convert-endianness-of-offsets.patch
new file mode 100644
index 0000000000..86cce768ed
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-gvariant-serialiser-Convert-endianness-of-offsets.patch
@@ -0,0 +1,68 @@
+From dc16dffed0480d0c8cdd6a05ede68263fc8723a9 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Thu, 15 Dec 2022 12:51:37 +0000
+Subject: [PATCH] gvariant-serialiser: Convert endianness of offsets
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The array of offsets is little-endian, even on big-endian architectures
+like s390x.
+
+Fixes: ade71fb5 "gvariant: Don’t allow child elements to overlap with each other"
+Resolves: https://gitlab.gnome.org/GNOME/glib/-/issues/2839
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/dc16dffed0480d0c8cdd6a05ede68263fc8723a9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gvariant-serialiser.c | 19 +++++++++++--------
+ 1 file changed, 11 insertions(+), 8 deletions(-)
+
+diff --git a/glib/gvariant-serialiser.c b/glib/gvariant-serialiser.c
+index 25c85b30b..e9b0eab2b 100644
+--- a/glib/gvariant-serialiser.c
++++ b/glib/gvariant-serialiser.c
+@@ -712,17 +712,19 @@ gvs_variable_sized_array_n_children (GVariantSerialised value)
+ /* Find the index of the first out-of-order element in @data, assuming that
+  * @data is an array of elements of given @type, starting at index @start and
+  * containing a further @len-@start elements. */
+-#define DEFINE_FIND_UNORDERED(type) \
++#define DEFINE_FIND_UNORDERED(type, le_to_native) \
+   static gsize \
+   find_unordered_##type (const guint8 *data, gsize start, gsize len) \
+   { \
+     gsize off; \
+-    type current, previous; \
++    type current_le, previous_le, current, previous; \
+     \
+-    memcpy (&previous, data + start * sizeof (current), sizeof (current)); \
++    memcpy (&previous_le, data + start * sizeof (current), sizeof (current)); \
++    previous = le_to_native (previous_le); \
+     for (off = (start + 1) * sizeof (current); off < len * sizeof (current); off += sizeof (current)) \
+       { \
+-        memcpy (&current, data + off, sizeof (current)); \
++        memcpy (&current_le, data + off, sizeof (current)); \
++        current = le_to_native (current_le); \
+         if (current < previous) \
+           break; \
+         previous = current; \
+@@ -730,10 +732,11 @@ gvs_variable_sized_array_n_children (GVariantSerialised value)
+     return off / sizeof (current) - 1; \
+   }
+ 
+-DEFINE_FIND_UNORDERED (guint8);
+-DEFINE_FIND_UNORDERED (guint16);
+-DEFINE_FIND_UNORDERED (guint32);
+-DEFINE_FIND_UNORDERED (guint64);
++#define NO_CONVERSION(x) (x)
++DEFINE_FIND_UNORDERED (guint8, NO_CONVERSION);
++DEFINE_FIND_UNORDERED (guint16, GUINT16_FROM_LE);
++DEFINE_FIND_UNORDERED (guint32, GUINT32_FROM_LE);
++DEFINE_FIND_UNORDERED (guint64, GUINT64_FROM_LE);
+ 
+ static GVariantSerialised
+ gvs_variable_sized_array_get_child (GVariantSerialised value,
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index 35b51a3ec9..239099d568 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -49,6 +49,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2024-34397_16.patch \
            file://CVE-2024-34397_17.patch \
            file://CVE-2024-34397_18.patch \
+           file://0001-gvariant-serialiser-Convert-endianness-of-offsets.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-- 
2.34.1


