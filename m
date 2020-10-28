Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web08.3859.1603919176667808990
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X9F02M/7;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id o18so969180edq.4
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nwnk7JgcBhyKyA033X7dWoYV0AHvApreSIM7emsFxrw=;
        b=X9F02M/7dkIDz5gUfRWL7Hx832o3o85j28q9Dbr40+c6r726xw5uTHKeDGFMP2NW1B
         d9fODNZv7bGzAIxYR/98Zq2vmZV7IRTpkIY7Oy9q1WPxkDU1U+eXKji1AWa3IsS2GlaK
         ybNOAQ4csWAj9EY7A9IjlFsl4sv7SKVQ5YpkzS9LunfwWp7rBidWCZYaj5EvmXKgKZCB
         Ef5F2Avn1DCrZ5JOvL8eR+Wb+Nk60Jbl9nqM3V54bk3xUKar2CsaFOlKd9flo0wuG18W
         y2ZNZtnT2HSAamtIECSsO0+u4Gfbr7Tv+nFbLoHo+0gULvAzR3zqblSWkLo1zAUGXl9A
         fUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nwnk7JgcBhyKyA033X7dWoYV0AHvApreSIM7emsFxrw=;
        b=WKO/oljyUuQ+8q5nT0LkPQzDLSXKDueXpN9Qpzw9MRQ44JleRGKOxPoDfP8d7rGfJU
         PP37mYjbXOgexBGcKZcUP11VITWoAEbcVTJegdcahzrXEqvXczLaE97+6iJT4sH4B9a5
         fpsQoT1W8cF7ysMo+SB3fOnQLxzr9EtPo/fAneLO7xhrgRtBkYqh6rX4N4n/kHEudJ8p
         15KYNrtX9ah5RK5X1Ojx74z3llLYBRFXvaPKG+nIoF8RGy6x4ZxYI/MdTEsExIQWwgZN
         Kta0R0kcz/qVxK0V9AZJteOT35o/WIJUK8ph9Euhk3ymHS251oaisATTS9sNDsW8TrRI
         ODdg==
X-Gm-Message-State: AOAM530o3zn327VCU0UZs7j0E5OYNCVjQJKv9oQ071ZpZefDWmnhmrEX
	KXnK2PGl07K+q15xeNTvy95RzTxUOJqTYg==
X-Google-Smtp-Source: ABdhPJzLeJ7u6BhcURK4bI4B/oByNeh7rhMHHq0a7w77efZLqtfVqnyygbDHruuA+H739nxOPsVpNA==
X-Received: by 2002:aa7:db82:: with SMTP id u2mr864894edt.262.1603919174974;
        Wed, 28 Oct 2020 14:06:14 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:14 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/33] file: enable all built-in compression checkers
Date: Wed, 28 Oct 2020 22:05:35 +0100
Message-Id: <20201028210558.21070-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows re-enabling parallel file classification in rpm
in particular, as otherwise libmagic calls out to external
executables, which isn't implemented in a thread-safe way.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/file/file_5.39.bb       |  5 ++--
 ....c-correct-header-define-for-xz-lzma.patch | 27 +++++++++++++++++++
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/file/files/0001-src-compress.c-correct-header-define-for-xz-lzma.patch

diff --git a/meta/recipes-devtools/file/file_5.39.bb b/meta/recipes-devtools/file/file_5.39.bb
index 0dcc90548a..abaa8149a3 100644
--- a/meta/recipes-devtools/file/file_5.39.bb
+++ b/meta/recipes-devtools/file/file_5.39.bb
@@ -11,14 +11,15 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=0251eaec1188b20d9a72c502ecfdd
 DEPENDS = "file-replacement-native"
 DEPENDS_class-native = "bzip2-replacement-native"
 
-SRC_URI = "git://github.com/file/file.git"
+SRC_URI = "git://github.com/file/file.git \
+           file://0001-src-compress.c-correct-header-define-for-xz-lzma.patch"
 
 SRCREV = "87731415de945660b00f02207d8e9d986ef9b82e"
 S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
 
-PACKAGECONFIG ??= "zlib"
+PACKAGECONFIG ??= "bz2 lzma zlib"
 PACKAGECONFIG[bz2] = "--enable-bzlib, --disable-bzlib, bzip2"
 PACKAGECONFIG[lzma] = "--enable-xzlib, --disable-xzlib, xz"
 PACKAGECONFIG[zlib] = "--enable-zlib, --disable-zlib, zlib"
diff --git a/meta/recipes-devtools/file/files/0001-src-compress.c-correct-header-define-for-xz-lzma.patch b/meta/recipes-devtools/file/files/0001-src-compress.c-correct-header-define-for-xz-lzma.patch
new file mode 100644
index 0000000000..f8ba2f6153
--- /dev/null
+++ b/meta/recipes-devtools/file/files/0001-src-compress.c-correct-header-define-for-xz-lzma.patch
@@ -0,0 +1,27 @@
+From ffb6ebdb42590cb9f7d3f5177b7b820a9edc4c81 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Sun, 18 Oct 2020 23:40:42 +0200
+Subject: [PATCH] src/compress.c: correct header define for xz/lzma
+
+Upstream-Status: Submitted [https://github.com/file/file/pull/98]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/compress.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/compress.c b/src/compress.c
+index 67f21583..9670b72c 100644
+--- a/src/compress.c
++++ b/src/compress.c
+@@ -71,7 +71,7 @@ typedef void (*sig_t)(int);
+ #include <bzlib.h>
+ #endif
+ 
+-#if defined(HAVE_XZLIB_H) && defined(XZLIBSUPPORT)
++#if defined(HAVE_LZMA_H) && defined(XZLIBSUPPORT)
+ #define BUILTIN_XZLIB
+ #include <lzma.h>
+ #endif
+-- 
+2.28.0
+
-- 
2.29.0

