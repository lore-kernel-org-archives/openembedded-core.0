Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631CBC25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 14:59:27 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.743.1716476365374376114
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 07:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WT8jqQDK;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6f44dd41a5cso2645244b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 07:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716476364; x=1717081164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CB82LKV8fZe5wOdh0wge7rgb75YS2HNJosRNfBcImsY=;
        b=WT8jqQDK3kCgg5APV+r9pDYGuQhJpmqS6Ac0FjLkllaVxwMjERzK6d0r+xr5cM9nGv
         7l7UlugWPhw8e9A3W29F4gyrhhVuCObNyYPRTOVQIjVUVBFVJtp0ObijwmI0zcpKE6k+
         OcG5IiHA8ulZs2+0i51/PsisILcBSFBHmanccijzVzXUADskRrxmi/DyFUj6f1XE+RL8
         EVicqDKheIygbvWjUBL4x5Rzgh6SIIK1TPAB0+0P7wBAURRCiU59XEDGGmM4RrW12P2n
         RYDDPObuEYEPJO/XPiYoCjYzstkGbPmhcwNKKJk/6l9vSyTszVihnYMLPmbp9xz5z4ym
         NxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716476364; x=1717081164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CB82LKV8fZe5wOdh0wge7rgb75YS2HNJosRNfBcImsY=;
        b=wqlZNBrcDFrx/iYQnXrgPYvN5D0qptX/T5RzouJWFnOzic+BgIC5u+jAcjHiOTJQcD
         gWo8msd5cOQd8C6mw7d5/H6TN10oXNg/0cG6uYorn0imaPeX0Db8Nsd2krzsGibEIfD3
         fZk32a7U7PSPwwUwiERL93k1/EB7GDRYK6FpTnvzzbmtad2UO+KENpYQrnOxAM0bZ7OL
         Jcj4aoq5suQ5kVOFJZeRyPA4ey7K3amFsO429ga7uDdVVBVd8ctxZ68NIJkgJQaOYxFY
         sMwPE+Hi2u17num3A0NAd08AvFTLASO8hdzYXTz4GpFurKk3u6mAPrrRoCosuw+IdAZT
         AbrA==
X-Gm-Message-State: AOJu0YxneOanO8KSKN07xsNIXHWuvnmFbnovlK5kSDc9d1CHoanjjCnN
	ooB/2Ta2cjXv8gaDFH+fsNHUaLpkpRF01k6t0+w+ohPVUrDRrxxSjMAth/WNZHg=
X-Google-Smtp-Source: AGHT+IFuEsBJQLrYxGgKetAzfpnnvAMLtRRitqayMBVSzx41lWakJreZphnI1wQbNFORQeGkOxScqg==
X-Received: by 2002:a05:6a00:3c8b:b0:6ec:f1ae:f579 with SMTP id d2e1a72fcca58-6f6d616d87fmr6117728b3a.19.1716476364418;
        Thu, 23 May 2024 07:59:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2aa017dsm24850591b3a.96.2024.05.23.07.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 07:59:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] systemd-bootchart: Fix build on musl
Date: Thu, 23 May 2024 07:59:18 -0700
Message-ID: <20240523145918.3026627-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240523145918.3026627-1-raj.khem@gmail.com>
References: <20240523145918.3026627-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 14:59:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199807

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


