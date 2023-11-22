Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FB5C61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 02:31:54 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.10890.1700620306629771919
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 18:31:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uPnpRQoR;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5aa7172bafdso4129759a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 18:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700620305; x=1701225105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2SdTaIEahh+tg5kZOOjhkSV3iviikCRcAUdJuqnfV8=;
        b=uPnpRQoRAV7YKajnbtIiDEDEuKmeNzZUE04y0aXstYMeqo4qya59rGSoqEa5ItSBxm
         wnyOI9p+UjzBqvgg7MpFwOxnlPP/+cDXH+Az9u1uQc0p9s53xVEiNb56iZbIoU9+hgKI
         1Qn1BksDKiM9iCFibl30LLTMyJwxfymQILmkW+jGczQHFLX448p2HE+BxEafxZCJO1Y/
         pMeXBoxtxbGqrXD9kILnKxmLEHONSUshRBlG5dKXEZU5lVIi+VDJIfGq8WrCurR6F8p0
         4VrSGTY0SX/5+q2boHHnGCn2FXPpdJ0FkYmyritR1LRKiHZY/T5UrAEQmbvanprbFIfo
         TbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700620305; x=1701225105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2SdTaIEahh+tg5kZOOjhkSV3iviikCRcAUdJuqnfV8=;
        b=NhiG9X+iudas/etK94PinZwdOYhV3XboSnQ0A6r3dWvUqORIqx1HFxbLrJiq6oiwS/
         tYJs1eqhm1eWKFGjKNe5WtinJXc3Y+RmSrQFPgA3gj0osvwqWNFd5Z3FTJKgKAMQg0gk
         FEc9Y3eJOLPeldcpNkAc4U/Ou7bpxSNYTt7BugrBNbEm/8Ll8KHRumTbYgOm24vuFS4m
         lYjXShdMwPhudD111+FWOE2AdX/J+KJsqVepcz/1hHTtDWYSigrmusQ0DnNvLXU63pHA
         5MuVFr4yaQ80XhKlgk1EnEyWG7c7tlKmjSWlkn1MBE2uu4jfBEholCSKz4yRZAPUPw85
         5Mkg==
X-Gm-Message-State: AOJu0YxKqtZTfbSApT1dbSNCnqBjZV8Gle54vqEVr0DY3S9buQhXfR2R
	dDeTte4GWOxESOELVzQdwnmKn8yDOcpRcxFLI0f58w==
X-Google-Smtp-Source: AGHT+IGFxwpQacjlWNBeE2I5mGxo2rUlX1iIlpFFfJva8X5A5eKK5lu88cQlXlMs83oKnqF84QlfKA==
X-Received: by 2002:a05:6a20:5507:b0:187:f7d3:fe4 with SMTP id ko7-20020a056a20550700b00187f7d30fe4mr851265pzb.11.1700620305477;
        Tue, 21 Nov 2023 18:31:45 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d11-20020a056a00198b00b006cb9a43ae4esm4384182pfl.215.2023.11.21.18.31.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 18:31:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/16] libxcrypt: fixed some build error for nativesdk with mingw
Date: Tue, 21 Nov 2023 16:31:13 -1000
Message-Id: <ca4866d14f725ae6c99c6651a69333d9453713a2.1700620126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700620126.git.steve@sakoman.com>
References: <cover.1700620126.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 02:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191015

From: Wenlin Kang <wenlin.kang@windriver.com>

Steps to reproduce
  1) add layer meta-mingw
  2) add line in local.conf
     SDKMACHINE = "x86_64-mingw32"
  3) bitbake nativesdk-libxcrypt

Fixed:
1. .symver error
  | {standard input}: Assembler messages:
  | {standard input}:4: Error: unknown pseudo-op: `.symver'

2. pedantic error
  | ../git/lib/crypt.c:316:24: error: ISO C does not allow extra ';' outside of a function [-Werror=pedantic]
  |   316 | SYMVER_crypt_gensalt_rn;
  |       |

3. conversion error
  | ../git/lib/util-get-random-bytes.c: In function '_crypt_get_random_bytes':
  | ../git/lib/util-get-random-bytes.c:140:42: error: conversion from 'size_t' {aka 'long long unsigned int'} to 'unsigned int' may change value [-Werror=conversion]
  |   140 |           ssize_t nread = read (fd, buf, buflen);

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-Fix-for-compilation-on-Windows.patch | 37 +++++++++++++++
 ...dom-bytes.c-fixed-conversion-error-w.patch | 47 +++++++++++++++++++
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  4 ++
 3 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-core/libxcrypt/files/0001-Fix-for-compilation-on-Windows.patch
 create mode 100644 meta/recipes-core/libxcrypt/files/0001-lib-util-get-random-bytes.c-fixed-conversion-error-w.patch

diff --git a/meta/recipes-core/libxcrypt/files/0001-Fix-for-compilation-on-Windows.patch b/meta/recipes-core/libxcrypt/files/0001-Fix-for-compilation-on-Windows.patch
new file mode 100644
index 0000000000..5760ee09cc
--- /dev/null
+++ b/meta/recipes-core/libxcrypt/files/0001-Fix-for-compilation-on-Windows.patch
@@ -0,0 +1,37 @@
+From a507b628a5a5d4e4f1cf0f0a9a72967470ee7624 Mon Sep 17 00:00:00 2001
+From: Brecht Sanders <brecht@sanders.org>
+Date: Fri, 3 Feb 2023 08:44:49 +0100
+Subject: [PATCH] Fix for compilation on Windows
+
+This fix allows the library to build on Windows (at least with MinGW-w64).
+
+`.symver` is only supported for ELF format but Windows uses COFF/PE.
+
+Workaround dummy define of `symver_set()`
+
+Upstream-Status: Backport [https://github.com/besser82/libxcrypt/commit/a507b628a5a5d4e4f1cf0f0a9a72967470ee7624]
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ lib/crypt-port.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lib/crypt-port.h b/lib/crypt-port.h
+index f06ca24..a707939 100644
+--- a/lib/crypt-port.h
++++ b/lib/crypt-port.h
+@@ -201,6 +201,11 @@ extern size_t strcpy_or_abort (void *dst, size_t d_size, const void *src);
+   __asm__(".globl _" extstr);                           \
+   __asm__(".set _" extstr ", _" #intname)
+ 
++#elif defined _WIN32
++
++/* .symver is only supported for ELF format, Windows uses COFF/PE */
++# define symver_set(extstr, intname, version, mode)
++
+ #elif defined __GNUC__ && __GNUC__ >= 3
+ 
+ # define _strong_alias(name, aliasname) \
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/libxcrypt/files/0001-lib-util-get-random-bytes.c-fixed-conversion-error-w.patch b/meta/recipes-core/libxcrypt/files/0001-lib-util-get-random-bytes.c-fixed-conversion-error-w.patch
new file mode 100644
index 0000000000..3846f76674
--- /dev/null
+++ b/meta/recipes-core/libxcrypt/files/0001-lib-util-get-random-bytes.c-fixed-conversion-error-w.patch
@@ -0,0 +1,47 @@
+From ff99091eb8a6b9e6edc567f6d2552183fbaacec3 Mon Sep 17 00:00:00 2001
+From: Wenlin Kang <wenlin.kang@windriver.com>
+Date: Mon, 6 Nov 2023 14:43:28 +0800
+Subject: [PATCH] lib/util-get-random-bytes.c: fixed conversion error with
+ mingw
+
+With x86_64-w64-mingw32-gcc. get below error:
+| ../git/lib/util-get-random-bytes.c: In function '_crypt_get_random_bytes':
+| ../git/lib/util-get-random-bytes.c:140:42: error: conversion from 'size_t' {aka 'long long unsigned int'} to 'unsigned int' may change value [-Werror=conversion]
+|   140 |           ssize_t nread = read (fd, buf, buflen);
+|       |                                          ^~~~~~
+
+In util-get-random-bytes.c, has get_random_bytes(void *buf, size_t buflen),
+but in mingw-w64-mingw-w64/mingw-w64-headers/crt/io.h, read() has "unsigned int"
+read(int _FileHandle,void *_DstBuf,unsigned int _MaxCharCount), and has:
+ #ifdef _WIN64
+   __MINGW_EXTENSION typedef unsigned __int64 size_t;
+ #else
+   typedef unsigned int size_t;
+ #endif /* _WIN64 */
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ lib/util-get-random-bytes.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/util-get-random-bytes.c b/lib/util-get-random-bytes.c
+index 79816db..68cd378 100644
+--- a/lib/util-get-random-bytes.c
++++ b/lib/util-get-random-bytes.c
+@@ -137,7 +137,11 @@ get_random_bytes(void *buf, size_t buflen)
+         dev_urandom_doesnt_work = true;
+       else
+         {
++#ifdef _WIN64
++          ssize_t nread = read (fd, buf, (unsigned int)buflen);
++#else
+           ssize_t nread = read (fd, buf, buflen);
++#endif
+           if (nread < 0 || (size_t)nread < buflen)
+             dev_urandom_doesnt_work = true;
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 342cbd0d06..2b3cd31c2a 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -16,6 +16,8 @@ SRCBRANCH ?= "master"
 SRC_URI += "file://fix_cflags_handling.patch \
     file://0001-Make-BuildCommon.pm-compatible-with-latest-perl.patch \
     file://0002-Remove-smartmatch-usage-from-gen-crypt-h.patch \
+    file://0001-Fix-for-compilation-on-Windows.patch \
+    file://0001-lib-util-get-random-bytes.c-fixed-conversion-error-w.patch \
 "
 
 PROVIDES = "virtual/crypt"
@@ -29,4 +31,6 @@ CPPFLAGS:append:class-nativesdk = " -Wno-error"
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"
 
+CFLAGS:append:class-nativesdk = " -Wno-pedantic"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


