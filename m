Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0925EC41513
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 15:12:26 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.22267.1716304344820586171
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 08:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KtWGFw0F;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6f43ee95078so1654711b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 08:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716304344; x=1716909144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CB82LKV8fZe5wOdh0wge7rgb75YS2HNJosRNfBcImsY=;
        b=KtWGFw0F2cOLdSXKasIoHAMYe4LefYXPv99w852ffIW2CedoNZ3CL8KXSfzIvzQGjQ
         ge1vGCG+uN+tVaMQVxoYK53UoYF7Se+KWZYgzI9Ee512ml06FCcl/sqhBFYoyd5Brwv1
         KbCFh6g3Y2lfvEfkmit0LloLsTtRS1cpvTZl47fGDjyfcLoD8T1ExInDF0wFP860wGjz
         46Xtks7nkBOFnKFBV30jEk3gkN3/Z7apgCbCg9wJpb1HYH/XsWBT5UUozB4vb3Ar673S
         9+3sH0S1HsnFIi28gIRAQOu2B2M+09zec/BzaFoSd5XN3jutCzBxt0WFO/v/QkHZkBhs
         yisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716304344; x=1716909144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CB82LKV8fZe5wOdh0wge7rgb75YS2HNJosRNfBcImsY=;
        b=TKBeN6K/Z7IR5ENEmXw7z0aLq4KI/qi46v5wg/hYrpnN2zbKRpahhWbm0QiD0srFZN
         HQQxOYWy9BqXZ1CgxFwDrmQLbM3XKmBTSDbvbyLZ+ycINdM6LNj1n4hPsdZb5NFvwF8M
         p6Kq/vU84cQPU142i/bRXeIhztA/B0fRamzUXw8qaKwiqC4g8lf0GkQugWoIH3sbDbI/
         7jvCuaZO5bUFwkwzU+M+eCj4tsIjWaQEnSaH0MvsZHqzdNLRcE20VMD6GOsBk+kUWxm2
         tDiotkfTrPw61+HTS/lTzfDq6ryT0J6+RXC0L+miUXVsUxKLtE7YzExqoWjDcgWZlolh
         7TFQ==
X-Gm-Message-State: AOJu0YwLCWRgKj6QJFrUGM8pzZiAs+qF2sGoHRfwToeo3Bx17F0toSTw
	2Hno+t0y/GQnXXhg0UNf/xzM1bov89AbfEdfDz/IH2xKL/zGKtOfQmF9YXOHUyQ=
X-Google-Smtp-Source: AGHT+IGW+sKgSBlfViSV1tJptzjOaPu1XVfenSaOnAIqeENgdfgNS4K5Eyxtc9tLreD1EGWh7wkmUw==
X-Received: by 2002:a17:902:e743:b0:1f2:ffcc:8a0b with SMTP id d9443c01a7336-1f2ffcc8cccmr68122645ad.24.1716304343902;
        Tue, 21 May 2024 08:12:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2aa01dasm21441031b3a.92.2024.05.21.08.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 08:12:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] systemd-bootchart: Fix build on musl
Date: Tue, 21 May 2024 08:12:19 -0700
Message-ID: <20240521151219.3169986-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521151219.3169986-1-raj.khem@gmail.com>
References: <20240521151219.3169986-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 15:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199647

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-Define-portable-basename-function.patch | 59 +++++++++++++++++++
 .../systemd-bootchart_235.bb                  |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-Define-portable-basename-function.patch

diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-Define-portable-basename-function.patch b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-Define-portable-basename-function.patch
new file mode 100644
index 00000000000..dc4c44c6af3
--- /dev/null
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-Define-portable-basename-function.patch
@@ -0,0 +1,59 @@
+From 4b19c32791fb8a8663b3335f8a3675a2bbabe688 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 20 May 2024 18:40:36 -0700
+Subject: [PATCH] Define portable basename function
+
+Newer version of musl have removed prototype for basename in string.h [1]
+which now makes it fail to compile with GCC14+ compiler therefore
+define local basename utility function.
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd-bootchart/pull/53]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/conf-files.c | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/src/conf-files.c b/src/conf-files.c
+index 5dd2d7d..b932bb2 100644
+--- a/src/conf-files.c
++++ b/src/conf-files.c
+@@ -35,6 +35,16 @@
+ #include "strv.h"
+ #include "util.h"
+ 
++/***
++ * basename is implemented differently across different C libraries. This
++ * implementation matches the one provided by the GNU libc, and does not
++ * modify its input parameter.
++***/
++static const char *sbc_basename(const char *path) {
++        const char *base = strrchr(path, '/');
++        return base ? base + 1 : path;
++}
++
+ static int files_add(Hashmap *h, const char *root, const char *path, const char *suffix) {
+         _cleanup_closedir_ DIR *dir = NULL;
+         const char *dirpath;
+@@ -63,7 +73,7 @@ static int files_add(Hashmap *h, const char *root, const char *path, const char
+                 if (!p)
+                         return -ENOMEM;
+ 
+-                r = hashmap_put(h, basename(p), p);
++                r = hashmap_put(h, sbc_basename(p), p);
+                 if (r == -EEXIST) {
+                         log_debug("Skipping overridden file: %s.", p);
+                         free(p);
+@@ -84,7 +94,7 @@ static int base_cmp(const void *a, const void *b) {
+ 
+         s1 = *(char * const *)a;
+         s2 = *(char * const *)b;
+-        return strcmp(basename(s1), basename(s2));
++        return strcmp(sbc_basename(s1), sbc_basename(s2));
+ }
+ 
+ static int conf_files_list_strv_internal(char ***strv, const char *suffix, const char *root, char **dirs) {
+-- 
+2.45.1
+
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb
index 25544029d5c..3c3c84ff4a4 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb
@@ -17,6 +17,7 @@ SRC_URI:append:libc-musl = " \
     file://0001-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch \
     file://0002-musl-does-not-provide-printf-h.patch \
     file://0003-musl-does-not-provide-canonicalize_file_name.patch \
+    file://0001-Define-portable-basename-function.patch \
     "
 
 
-- 
2.45.1


