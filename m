Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3C2C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 14:39:05 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.32823.1654526345060074496
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=WsB1g7Tx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 k5-20020a17090a404500b001e8875e6242so1969103pjg.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zjxsh8ECpL4XqWfu0dR3V7Cyds/HOyEO+p5e2M39nw4=;
        b=WsB1g7Txb37lzuojzPT2CGuGGqjD90fKiGiq1CkM1s3z8vxzOkmz/tyftDK7QIjebN
         RsBru+BLVJnutpn0CeejazsdpBpJh3m1iuB72QzcQON3BP9gnauaCb4mhreryaWODQlW
         L/OL61T2012NxUIrM8IQAufPiQVyTvTKRnMjeCNS3iPRt0o4rZq+CQKYfzrFWPJs7asN
         clHhfyu/w1sr16KdmhFb4YboEKX8lAcy2tXtalqUVkMhvsAotYzPg8ZoAIzYjIHFjvSy
         KoGI4b0/ZlAzIvbEUeuYCs4qPanI1lmm5JkjvZnDlL4NWolkHb8Xqh28YI1jjANlLnDS
         8x8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zjxsh8ECpL4XqWfu0dR3V7Cyds/HOyEO+p5e2M39nw4=;
        b=NSOcYCiXBA+GfFe+1HPz0twaHxchl7rR5FTxc8Q+Gfx1oEMZ6BFurc2ID4Ytory/UK
         nVaGkiczCs8sktlxtloB1XwA3nmzHOnYKX4wQX/MqmS9U8yGkZm1AWVGWovbibDn1ltj
         LdhG8yiRO2Q9wp+CAiQLlawO/xgd4/Qyu5iz2GK9/MA4IA+Hzqt3Vn6sD6seNHi91jXv
         mRTW35A4G4yrHNXEqkOxlUZGQu6/YckWRH9CbN4bB+A7YcgddpNUu3+EpOG4cpf7d+c9
         dFcrsksCrMIyi2/AjWHNOYrinTm2R0X7oNKxFu4DQMIYLIjTxKZQu50c5Q2uKpnv/qAj
         7gVQ==
X-Gm-Message-State: AOAM530o28mOYzDZoMl2W2T17mH/+xKO2Nvm+OuYn1xIEqcIo8BupUlA
	GpaBxqxSzRbfx3EsatDykd2ZGU2TIJEV4e6K
X-Google-Smtp-Source: 
 ABdhPJxVX17AmBqKsehsnZ8yzsopYYUfXilXpB7edkl5Utw7WT4KK64EYv77tfTHMFe++J/y3wOt9w==
X-Received: by 2002:a17:90a:d01:b0:1e0:2e32:8650 with SMTP id
 t1-20020a17090a0d0100b001e02e328650mr26556566pja.156.1654526344005;
        Mon, 06 Jun 2022 07:39:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a5-20020a1709027d8500b0015ea3a491a1sm10544112plm.191.2022.06.06.07.39.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 07:39:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/13] systemd: Remove __compare_fn_t type in
 musl-specific patch
Date: Mon,  6 Jun 2022 04:38:24 -1000
Message-Id: 
 <2b09a567117be0c048ac9a1c27cfae8cc1418b66.1654526060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654526060.git.steve@sakoman.com>
References: <cover.1654526060.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 14:39:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166639

From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>

Since systemd v250, commit d8f16737005e ("sort-util: avoid using
glibc's internal __compar_d_fn_t type"), __compare_fn_t type is no
longer used. This patch removes that type in the musl-specific patch.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 89c8a3f96dfeb444213fd6c523e1495c49065ccc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-missing_type.h-add-comparison_fn_t.patch} | 44 ++++++-------------
 ...missing.h-check-for-missing-strndupa.patch | 14 +++---
 meta/recipes-core/systemd/systemd_250.5.bb    |  2 +-
 3 files changed, 22 insertions(+), 38 deletions(-)
 rename meta/recipes-core/systemd/systemd/{0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch => 0003-missing_type.h-add-comparison_fn_t.patch} (61%)

diff --git a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-comparison_fn_t.patch
similarity index 61%
rename from meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
rename to meta/recipes-core/systemd/systemd/0003-missing_type.h-add-comparison_fn_t.patch
index dfe4164900..c28c8381e8 100644
--- a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
+++ b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-comparison_fn_t.patch
@@ -1,13 +1,9 @@
-From a4f51ef07375466f79cb148ff1178ed11f808f0a Mon Sep 17 00:00:00 2001
+From 5513b918d02900a3a78fd0e0300a118b163edfef Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:55:12 +0800
-Subject: [PATCH] missing_type.h: add __compare_fn_t and comparison_fn_t
+Subject: [PATCH] missing_type.h: add comparison_fn_t
 
-Make it work with musl where comparison_fn_t and __compare_fn_t
-is not provided.
-
-Revisit this when upgrading to 251+ systemd since systemd does not need
-__compare_fn_t anymore
+Make it work with musl where comparison_fn_t and is not provided.
 
 Upstream-Status: Inappropriate [musl specific]
 
@@ -16,19 +12,19 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [Rebased for v242]
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-
+[Rebased for v250, Drop __compare_fn_t]
+Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
 ---
- src/basic/missing_type.h            | 9 +++++++++
+ src/basic/missing_type.h            | 4 ++++
  src/basic/sort-util.h               | 1 +
- src/core/kmod-setup.c               | 1 +
  src/libsystemd/sd-journal/catalog.c | 1 +
- 4 files changed, 12 insertions(+)
+ 3 files changed, 6 insertions(+)
 
 diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
-index f6233090a9..aeaf6ad5ec 100644
+index f6233090a9..6c0456349d 100644
 --- a/src/basic/missing_type.h
 +++ b/src/basic/missing_type.h
-@@ -10,3 +10,12 @@
+@@ -10,3 +10,7 @@
  #if !HAVE_CHAR16_T
  #define char16_t uint16_t
  #endif
@@ -36,13 +32,8 @@ index f6233090a9..aeaf6ad5ec 100644
 +#ifndef __GLIBC__
 +typedef int (*comparison_fn_t)(const void *, const void *);
 +#endif
-+
-+#ifndef __COMPAR_FN_T
-+#define __COMPAR_FN_T
-+typedef int (*__compar_fn_t)(const void *, const void *);
-+#endif
 diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
-index cb448df109..fd738a65ab 100644
+index 02a6784d99..0b33c83d59 100644
 --- a/src/basic/sort-util.h
 +++ b/src/basic/sort-util.h
 @@ -4,6 +4,7 @@
@@ -53,18 +44,6 @@ index cb448df109..fd738a65ab 100644
  
  /* This is the same as glibc's internal __compar_d_fn_t type. glibc exports a public comparison_fn_t, for the
   * external type __compar_fn_t, but doesn't do anything similar for __compar_d_fn_t. Let's hence do that
-diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
-index d054668b8e..d3bf55acbe 100644
---- a/src/core/kmod-setup.c
-+++ b/src/core/kmod-setup.c
-@@ -10,6 +10,7 @@
- #include "macro.h"
- #include "recurse-dir.h"
- #include "string-util.h"
-+#include "missing_type.h"
- 
- #if HAVE_KMOD
- #include "module-util.h"
 diff --git a/src/libsystemd/sd-journal/catalog.c b/src/libsystemd/sd-journal/catalog.c
 index 8fc87b131a..36a6efdbd8 100644
 --- a/src/libsystemd/sd-journal/catalog.c
@@ -77,3 +56,6 @@ index 8fc87b131a..36a6efdbd8 100644
  
  const char * const catalog_file_dirs[] = {
          "/usr/local/lib/systemd/catalog/",
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index 4b1fac06b5..680930ca3c 100644
--- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -1,4 +1,4 @@
-From 55d48dd81e57add5b2d4b5a7d697c575a0f37ef5 Mon Sep 17 00:00:00 2001
+From 106b7bd7186c9d6c1dcd72bd4ca6457d3fa72d0b Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:18:21 +0800
 Subject: [PATCH] src/basic/missing.h: check for missing strndupa
@@ -17,7 +17,6 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 [rebased for systemd 244]
 [Rebased for v247]
 Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
-
 ---
  meson.build                                |  1 +
  src/backlight/backlight.c                  |  1 +
@@ -74,7 +73,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  52 files changed, 63 insertions(+)
 
 diff --git a/meson.build b/meson.build
-index ae53345260..8c8a6c9bdf 100644
+index cb9936ee8b..7ab201c6d9 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -507,6 +507,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
@@ -310,13 +309,13 @@ index 0b20d386d3..fccfb9268c 100644
  #define IDLE_TIMEOUT_USEC (5*USEC_PER_SEC)
  #define IDLE_TIMEOUT2_USEC (1*USEC_PER_SEC)
 diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
-index d3bf55acbe..63dd807b8a 100644
+index d054668b8e..9b4caa7651 100644
 --- a/src/core/kmod-setup.c
 +++ b/src/core/kmod-setup.c
-@@ -11,6 +11,7 @@
+@@ -10,6 +10,7 @@
+ #include "macro.h"
  #include "recurse-dir.h"
  #include "string-util.h"
- #include "missing_type.h"
 +#include "missing_stdlib.h"
  
  #if HAVE_KMOD
@@ -705,3 +704,6 @@ index 1a384d6b38..0089833e3f 100644
  
  #define RULES_DIRS (const char* const*) CONF_PATHS_STRV("udev/rules.d")
  
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index aca140d4d4..6d6b3f2ded 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -31,7 +31,7 @@ SRC_URI += "file://touchscreen.rules \
 SRC_URI:append:libc-musl = " ${SRC_URI_MUSL}"
 SRC_URI_MUSL = "\
                file://0002-don-t-use-glibc-specific-qsort_r.patch \
-               file://0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch \
+               file://0003-missing_type.h-add-comparison_fn_t.patch \
                file://0004-add-fallback-parse_printf_format-implementation.patch \
                file://0005-src-basic-missing.h-check-for-missing-strndupa.patch \
                file://0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch \
-- 
2.25.1


