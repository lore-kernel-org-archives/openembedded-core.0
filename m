Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7305C0218C
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 14:54:26 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.11276.1737816861536406053
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jan 2025 06:54:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aYL2BFPs;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436249df846so20116935e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Jan 2025 06:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737816860; x=1738421660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9gTNG6/OWM4SSI8exmLvx0OwPtNxcy5lKL/tYtCtTPA=;
        b=aYL2BFPsoZKMEaz64tzBmEO/bpMJ9i0KFOMFyMMlNHfssULknBb1tdhr7ANTXtTLW+
         UnPeDNTHPEKQXhZQ6dwXYHjgs7WVl/rVjFHL/7Z9lmG35bb3m5sVB3kwtcmn63h55T4r
         iHECDzeFMFd0PIZydy26Ke4ZjwUceaOwgM7fjVm7gJoaxCXlXn3tYG/cHN03BvUDGCkr
         4nfOwWdSZ/sB/71/D6gPsqu9hwD3fvfL57X30Lcdp/2TgtnEvgJH7IL7HQs4NbZiUkEL
         qGhtRZyWPKybwuuj9pUnREGcjV8XlQHduSKPXoUVd5Loffre72cFKUe3E2deQudu/1W6
         d+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737816860; x=1738421660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gTNG6/OWM4SSI8exmLvx0OwPtNxcy5lKL/tYtCtTPA=;
        b=rfqzraTfcTmE7VQ4gOxQ07Jq23T9MUyl6Pz4eupJ41+n4uOupwP/1RKd8WyVTHhb21
         GMRjd4gVzKYbi68gWRCkXcp/rqQ+nTM51xb7EvaoBiQ/IstAemsW3cxENwNEhxN/GAXS
         C8l+Pp0OZIF+JOns8l+hB4koKTkvcJiZS6jk7Yc3guMx/rJoL5a6Qmhv3U87x0YbOU1m
         MZAJBR3bn3nQFee27goDsbRWF8PK86s7yC3TMR/taFPIfK9015ZfAho2xfS1zuTXshIP
         0NFc5KKdGJmchmpfXzXS69jnKVYut0dgesG1YbNJWKThHrzk6fTkdboCNqPzXs34wryC
         sUGQ==
X-Gm-Message-State: AOJu0Yxdj6mQ7QeYxK3hjTIOhsqxv1tJMGScIe7VdYP5QIDqB0X1ZIEY
	zTYUrOjNSsz9AtY5bu3zCgIxmmNlXwub1BXuBL9vldXKcYzeQ2yA3MFOfw==
X-Gm-Gg: ASbGncvHZNuly1fRaduOJdxj43BopPu8G6ntG+2UaolqBwz3GvrGhIEYCv+55TF5s1Z
	Eeive4ukE6PXSziEW/bcE1E5pag/cSaJSheLggzfb9Y2xH5MrV2sk4UF3Ome9I+79FUnu9oe5Ms
	qOTAMg5k+onbz7UJyJVF5EfdXs+e63mFlPk8YJk262/2Ms7u7vkHTHm5zKUvY01GhtDpmWyKdsX
	wwJ/pTXlb6/v7GxPC/vNKqKvc4eksR1AVV05d1rQcO0977Z0KThTE0aMja64/bETt2+M5pxyN3i
	CxyrJcpgHQ6uTrTmOWAiizXNDIdFog==
X-Google-Smtp-Source: AGHT+IGSa0sFt+zbdTCrKuVchbxs5l4mn8pIOisuM4OldDj2lnV9IDpVlHgcgn9VMeNZTqIeRM/tog==
X-Received: by 2002:a05:600c:83c3:b0:434:f5c0:328d with SMTP id 5b1f17b1804b1-43891433ff6mr309373935e9.23.1737816859133;
        Sat, 25 Jan 2025 06:54:19 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd57517fsm61743755e9.38.2025.01.25.06.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 06:54:18 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [scarthgap][PATCH] systemd: upgrade 255.13 -> 255.17
Date: Sat, 25 Jan 2025 14:54:01 +0000
Message-ID: <20250125145401.2599294-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jan 2025 14:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210261

The update includes 156 commits. Full list of changes can be found on Github [1]

All patches were refreshed with devtool. One patch had to be manually
rebased to resolve a merge conflict introduced with 255.14 [2].

[1] https://github.com/systemd/systemd-stable/compare/v255.13...v255.17
[2] 0003-src-basic-missing.h-check-for-missing-strndupa.patch

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 ...55.13.bb => systemd-boot-native_255.17.bb} |  0
 ...-boot_255.13.bb => systemd-boot_255.17.bb} |  0
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 ...1-missing_type.h-add-comparison_fn_t.patch |  2 +-
 ...k-parse_printf_format-implementation.patch |  6 ++--
 ...tall-dependency-links-at-install-tim.patch |  2 +-
 ...missing.h-check-for-missing-strndupa.patch | 33 ++++++++++--------
 ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |  2 +-
 ...005-add-missing-FTW_-macros-for-musl.patch |  2 +-
 ...06-Use-uintmax_t-for-handling-rlim_t.patch |  6 ++--
 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  2 +-
 ...patible-basename-for-non-glibc-syste.patch |  2 +-
 ...implment-systemd-sysv-install-for-OE.patch |  2 +-
 ...uffering-when-writing-to-oom_score_a.patch |  4 +--
 ...compliant-strerror_r-from-GNU-specif.patch |  2 +-
 ...definition-of-prctl_mm_map-structure.patch |  2 +-
 ...-not-disable-buffer-in-writing-files.patch | 34 +++++++++----------
 .../0013-Handle-__cpu_mask-usage.patch        |  2 +-
 .../systemd/0014-Handle-missing-gshadow.patch |  2 +-
 ...l.h-Define-MIPS-ABI-defines-for-musl.patch |  2 +-
 ...ass-correct-parameters-to-getdents64.patch |  2 +-
 .../0017-Adjust-for-musl-headers.patch        |  6 ++--
 ...trerror-is-assumed-to-be-GNU-specifi.patch |  2 +-
 ...util-Make-STRERROR-portable-for-musl.patch |  2 +-
 ...ake-malloc_trim-conditional-on-glibc.patch |  4 +--
 ...hared-Do-not-use-malloc_info-on-musl.patch |  2 +-
 ...22-avoid-missing-LOCK_EX-declaration.patch |  4 +--
 .../{systemd_255.13.bb => systemd_255.17.bb}  |  0
 28 files changed, 68 insertions(+), 63 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_255.13.bb => systemd-boot-native_255.17.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_255.13.bb => systemd-boot_255.17.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_255.13.bb => systemd_255.17.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_255.13.bb b/meta/recipes-core/systemd/systemd-boot-native_255.17.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_255.13.bb
rename to meta/recipes-core/systemd/systemd-boot-native_255.17.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_255.13.bb b/meta/recipes-core/systemd/systemd-boot_255.17.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_255.13.bb
rename to meta/recipes-core/systemd/systemd-boot_255.17.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 88f24f99c2..c359d77e9d 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "565916c245b53b49f5917f5326d21246f46ae3db"
+SRCREV = "fb92304041cd203d2ca84cc28721dea5e1355c4e"
 SRCBRANCH = "v255-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd/0001-missing_type.h-add-comparison_fn_t.patch b/meta/recipes-core/systemd/systemd/0001-missing_type.h-add-comparison_fn_t.patch
index 78a4bf5868..9e9ccf51c8 100644
--- a/meta/recipes-core/systemd/systemd/0001-missing_type.h-add-comparison_fn_t.patch
+++ b/meta/recipes-core/systemd/systemd/0001-missing_type.h-add-comparison_fn_t.patch
@@ -1,4 +1,4 @@
-From af2784935b483bd0eb5705ef7072a5cea6fe9eef Mon Sep 17 00:00:00 2001
+From abbda6d89c0b850c0adeebc3e210d9b255072a40 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:55:12 +0800
 Subject: [PATCH] missing_type.h: add comparison_fn_t
diff --git a/meta/recipes-core/systemd/systemd/0002-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0002-add-fallback-parse_printf_format-implementation.patch
index e19f7dc688..c91f24b026 100644
--- a/meta/recipes-core/systemd/systemd/0002-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0002-add-fallback-parse_printf_format-implementation.patch
@@ -1,4 +1,4 @@
-From b9b4f9bbca46832ea152979d8c9459f29c2e83fa Mon Sep 17 00:00:00 2001
+From adaa70c17daedd8d81525d080fda8a1e22efe3a4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sat, 22 May 2021 20:26:24 +0200
 Subject: [PATCH] add fallback parse_printf_format implementation
@@ -22,10 +22,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  create mode 100644 src/basic/parse-printf-format.h
 
 diff --git a/meson.build b/meson.build
-index 2418d6e8f7..b544a69aaa 100644
+index d5109b0d00..ccde927cf3 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -731,6 +731,7 @@ endif
+@@ -732,6 +732,7 @@ endif
  foreach header : ['crypt.h',
                    'linux/memfd.h',
                    'linux/vm_sockets.h',
diff --git a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index aca30d5ffe..11e9be6059 100644
--- a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -1,4 +1,4 @@
-From 178b7b4adefdf1d80fa3a5eb54a49ef0fc12369f Mon Sep 17 00:00:00 2001
+From 95bf78fe7d7b7d41ff43e761bb78adfb4fdb9303 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 21 Feb 2019 16:23:24 +0800
 Subject: [PATCH] binfmt: Don't install dependency links at install time for
diff --git a/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-check-for-missing-strndupa.patch
index 802002a1c3..0b75896b00 100644
--- a/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -1,7 +1,10 @@
-From eca6019bbd793c8d8a99142677a548766a775153 Mon Sep 17 00:00:00 2001
+From 76f4749e3a583ad3c924bdff4a6bde967c674ed7 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:18:21 +0800
 Subject: [PATCH] src/basic/missing.h: check for missing strndupa
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 include missing.h  for definition of strndupa
 
@@ -20,6 +23,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
 [Rebased for v254]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [Rebased for v255.1]
+Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
+[Rebased for v255.14]
 ---
  meson.build                                |  1 +
  src/backlight/backlight.c                  |  1 +
@@ -75,7 +80,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  51 files changed, 62 insertions(+)
 
 diff --git a/meson.build b/meson.build
-index b544a69aaa..90b07aeb14 100644
+index 216a8cbc91..d5109b0d00 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -572,6 +572,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
@@ -99,7 +104,7 @@ index b2032adaa5..ee9201826d 100644
  #define PCI_CLASS_GRAPHICS_CARD 0x30000
  
 diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index 50224648d3..2eaa6e3307 100644
+index e978bd3eff..d08c903c3b 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
 @@ -38,6 +38,7 @@
@@ -239,7 +244,7 @@ index d7cfcd9105..6cb0ddf575 100644
  int procfs_get_pid_max(uint64_t *ret) {
          _cleanup_free_ char *value = NULL;
 diff --git a/src/basic/time-util.c b/src/basic/time-util.c
-index f9014dc560..1d7840a5b5 100644
+index 0c2d739977..5c150806a0 100644
 --- a/src/basic/time-util.c
 +++ b/src/basic/time-util.c
 @@ -27,6 +27,7 @@
@@ -263,7 +268,7 @@ index 12dfdf76fa..e66332519a 100644
  static char **arg_path = NULL;
  
 diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c
-index 88198010ee..74d61bfaaf 100644
+index b3baf03afc..7404784a01 100644
 --- a/src/core/dbus-cgroup.c
 +++ b/src/core/dbus-cgroup.c
 @@ -25,6 +25,7 @@
@@ -299,7 +304,7 @@ index 7bb026af48..a86128e40c 100644
  int bus_property_get_triggered_unit(
                  sd_bus *bus,
 diff --git a/src/core/execute.c b/src/core/execute.c
-index 4d597bf8a6..7d27f80834 100644
+index aa179fd57e..1ee9f4526b 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
 @@ -72,6 +72,7 @@
@@ -323,7 +328,7 @@ index b8e3f7aadd..8ce8ca68d8 100644
  #if HAVE_KMOD
  #include "module-util.h"
 diff --git a/src/core/service.c b/src/core/service.c
-index 5f4859e0d3..a920154f55 100644
+index d3ea8a9c3c..c3441f785c 100644
 --- a/src/core/service.c
 +++ b/src/core/service.c
 @@ -45,6 +45,7 @@
@@ -371,7 +376,7 @@ index 2d380bc7a7..d3f5612728 100644
  #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem"
  #define CERT_FILE     CERTIFICATE_ROOT "/certs/journal-remote.pem"
 diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
-index 87e2f28841..58275f41f1 100644
+index f52ed03dd0..3fa708a906 100644
 --- a/src/journal/journalctl.c
 +++ b/src/journal/journalctl.c
 @@ -77,6 +77,7 @@
@@ -443,7 +448,7 @@ index d988588de0..458df8df9a 100644
  #define MAX_SIZE (2*1024*1024)
  
 diff --git a/src/libsystemd/sd-journal/sd-journal.c b/src/libsystemd/sd-journal/sd-journal.c
-index 7a1dd2569f..d187baad47 100644
+index acabec699f..8115d3784a 100644
 --- a/src/libsystemd/sd-journal/sd-journal.c
 +++ b/src/libsystemd/sd-journal/sd-journal.c
 @@ -44,6 +44,7 @@
@@ -467,19 +472,19 @@ index bf45974ca5..2cb7e930c0 100644
  #include "parse-util.h"
  #include "path-util.h"
 diff --git a/src/network/generator/network-generator.c b/src/network/generator/network-generator.c
-index 48527a2c73..9777fe0561 100644
+index e5f78a3b99..4833de2009 100644
 --- a/src/network/generator/network-generator.c
 +++ b/src/network/generator/network-generator.c
-@@ -14,6 +14,7 @@
- #include "string-table.h"
+@@ -15,6 +15,7 @@
  #include "string-util.h"
  #include "strv.h"
+ #include "vlan-util.h"
 +#include "missing_stdlib.h"
  
  /*
    # .network
 diff --git a/src/nspawn/nspawn-settings.c b/src/nspawn/nspawn-settings.c
-index 161b1c1c70..ba1c459f78 100644
+index 2bb034eb22..c9837b8d79 100644
 --- a/src/nspawn/nspawn-settings.c
 +++ b/src/nspawn/nspawn-settings.c
 @@ -16,6 +16,7 @@
@@ -503,7 +508,7 @@ index c64e79bdff..eda26b0b9a 100644
  static void setup_logging_once(void) {
          static pthread_once_t once = PTHREAD_ONCE_INIT;
 diff --git a/src/portable/portable.c b/src/portable/portable.c
-index faeb97bd06..30768f728e 100644
+index 4aced8c391..6f426e0e51 100644
 --- a/src/portable/portable.c
 +++ b/src/portable/portable.c
 @@ -42,6 +42,7 @@
diff --git a/meta/recipes-core/systemd/systemd/0004-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd/0004-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
index ccfe8e6aa9..96872ac150 100644
--- a/meta/recipes-core/systemd/systemd/0004-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
+++ b/meta/recipes-core/systemd/systemd/0004-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
@@ -1,4 +1,4 @@
-From a15045a60893f29ce9720e62cafbc0b87908ad49 Mon Sep 17 00:00:00 2001
+From e9110b095a5728762b3bd3abdec2a99b4ce01b5e Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:56:21 +0800
 Subject: [PATCH] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not defined
diff --git a/meta/recipes-core/systemd/systemd/0005-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0005-add-missing-FTW_-macros-for-musl.patch
index a29aab8390..936183f238 100644
--- a/meta/recipes-core/systemd/systemd/0005-add-missing-FTW_-macros-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0005-add-missing-FTW_-macros-for-musl.patch
@@ -1,4 +1,4 @@
-From b2c98ef636ac7dfdf86e7a42aebc3142a5b167d2 Mon Sep 17 00:00:00 2001
+From 1eeac3e8ce96ad5da381555e93a57330cb8a5d48 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:00:06 +0800
 Subject: [PATCH] add missing FTW_ macros for musl
diff --git a/meta/recipes-core/systemd/systemd/0006-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0006-Use-uintmax_t-for-handling-rlim_t.patch
index 818b946886..34d62c9e32 100644
--- a/meta/recipes-core/systemd/systemd/0006-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0006-Use-uintmax_t-for-handling-rlim_t.patch
@@ -1,4 +1,4 @@
-From 3ea46787827fb6db631b240589d2f447b977f7d9 Mon Sep 17 00:00:00 2001
+From fd2bb25921040fc5faed3a4aae0bd9e03f8f4742 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:12:41 +0800
 Subject: [PATCH] Use uintmax_t for handling rlim_t
@@ -86,10 +86,10 @@ index c1f0b2b974..61c5412582 100644
          return 1;
  }
 diff --git a/src/core/execute.c b/src/core/execute.c
-index 7d27f80834..bde0f8137c 100644
+index 1ee9f4526b..cb29799afb 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -1042,9 +1042,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
+@@ -1043,9 +1043,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
          for (unsigned i = 0; i < RLIM_NLIMITS; i++)
                  if (c->rlimit[i]) {
                          fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0007-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
index ad7cf90f1d..7cc8002a90 100644
--- a/meta/recipes-core/systemd/systemd/0007-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
+++ b/meta/recipes-core/systemd/systemd/0007-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
@@ -1,4 +1,4 @@
-From 0e51be93aa8c647bf1761d684c722b92d3cfabc1 Mon Sep 17 00:00:00 2001
+From fde97394bf1a2faffa420afb098af61676033640 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 10 Oct 2017 14:33:30 -0700
 Subject: [PATCH] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
diff --git a/meta/recipes-core/systemd/systemd/0008-Define-glibc-compatible-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd/0008-Define-glibc-compatible-basename-for-non-glibc-syste.patch
index 4d6382810b..5579dc3dcc 100644
--- a/meta/recipes-core/systemd/systemd/0008-Define-glibc-compatible-basename-for-non-glibc-syste.patch
+++ b/meta/recipes-core/systemd/systemd/0008-Define-glibc-compatible-basename-for-non-glibc-syste.patch
@@ -1,4 +1,4 @@
-From 9f85e2db2b40313de555b3103aa485b9b84382fe Mon Sep 17 00:00:00 2001
+From e2e1fee9fd5635420408777524dd418ce10dddc8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 May 2018 08:36:44 -0700
 Subject: [PATCH] Define glibc compatible basename() for non-glibc systems
diff --git a/meta/recipes-core/systemd/systemd/0008-implment-systemd-sysv-install-for-OE.patch b/meta/recipes-core/systemd/systemd/0008-implment-systemd-sysv-install-for-OE.patch
index 0909185dcf..2151d51af2 100644
--- a/meta/recipes-core/systemd/systemd/0008-implment-systemd-sysv-install-for-OE.patch
+++ b/meta/recipes-core/systemd/systemd/0008-implment-systemd-sysv-install-for-OE.patch
@@ -1,4 +1,4 @@
-From c223945b20aadd1e3b1f3986e159cb3755aabf99 Mon Sep 17 00:00:00 2001
+From 2b40558d201b73962077d0cedef820dfe95395c7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 5 Sep 2015 06:31:47 +0000
 Subject: [PATCH] implment systemd-sysv-install for OE
diff --git a/meta/recipes-core/systemd/systemd/0009-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0009-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
index 55a033ecec..6586cbb72c 100644
--- a/meta/recipes-core/systemd/systemd/0009-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0009-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
@@ -1,4 +1,4 @@
-From 64b98f7ba1f5211bd19cd98c9d7e4d0f884cf65d Mon Sep 17 00:00:00 2001
+From b783adf25c5619931189b4474d389a808e7845d6 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jul 2018 15:00:44 +0800
 Subject: [PATCH] Do not disable buffering when writing to oom_score_adj
@@ -24,7 +24,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index 4492e7ded2..b61a2aba74 100644
+index 1447f65399..dcbc7ac973 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
 @@ -1716,7 +1716,7 @@ int set_oom_score_adjust(int value) {
diff --git a/meta/recipes-core/systemd/systemd/0010-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd/0010-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
index f3f3698e5a..79db096b34 100644
--- a/meta/recipes-core/systemd/systemd/0010-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
+++ b/meta/recipes-core/systemd/systemd/0010-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
@@ -1,4 +1,4 @@
-From bc75e47baaddbd629d9757a2539102649d9501fd Mon Sep 17 00:00:00 2001
+From ac820a745c905e0045ce5cc41da7eaa802078b1b Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 10 Jul 2018 15:40:17 +0800
 Subject: [PATCH] distinguish XSI-compliant strerror_r from GNU-specifi
diff --git a/meta/recipes-core/systemd/systemd/0011-avoid-redefinition-of-prctl_mm_map-structure.patch b/meta/recipes-core/systemd/systemd/0011-avoid-redefinition-of-prctl_mm_map-structure.patch
index a73c67efb1..67fd4921ba 100644
--- a/meta/recipes-core/systemd/systemd/0011-avoid-redefinition-of-prctl_mm_map-structure.patch
+++ b/meta/recipes-core/systemd/systemd/0011-avoid-redefinition-of-prctl_mm_map-structure.patch
@@ -1,4 +1,4 @@
-From e8a03df3275aef82a1bfd5c1ce60058c5e39eb09 Mon Sep 17 00:00:00 2001
+From 4a2472cae75720b3129260c8789a87af26ca443a Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:44:54 +0800
 Subject: [PATCH] avoid redefinition of prctl_mm_map structure
diff --git a/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-writing-files.patch
index c2defc7e1e..e735a00bb9 100644
--- a/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-writing-files.patch
@@ -1,4 +1,4 @@
-From f3630404d25dd91e87e7aac09d5dee9b92655082 Mon Sep 17 00:00:00 2001
+From 8072fee9fcb0e9a8c73de56f38468e7287ac4961 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Fri, 1 Mar 2019 15:22:15 +0800
 Subject: [PATCH] do not disable buffer in writing files
@@ -47,7 +47,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  22 files changed, 50 insertions(+), 51 deletions(-)
 
 diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index 2eaa6e3307..5c2876b5c9 100644
+index d08c903c3b..77ebe85dfd 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
 @@ -443,7 +443,7 @@ int cg_kill_kernel_sigkill(const char *path) {
@@ -59,7 +59,7 @@ index 2eaa6e3307..5c2876b5c9 100644
          if (r < 0)
                  return r;
  
-@@ -869,7 +869,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -873,7 +873,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
  
          sc = strstrip(contents);
          if (isempty(sc)) {
@@ -68,7 +68,7 @@ index 2eaa6e3307..5c2876b5c9 100644
                  if (r < 0)
                          return r;
          } else if (!path_equal(sc, agent))
-@@ -887,7 +887,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -891,7 +891,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
  
          sc = strstrip(contents);
          if (streq(sc, "0")) {
@@ -77,7 +77,7 @@ index 2eaa6e3307..5c2876b5c9 100644
                  if (r < 0)
                          return r;
  
-@@ -914,7 +914,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -918,7 +918,7 @@ int cg_uninstall_release_agent(const char *controller) {
          if (r < 0)
                  return r;
  
@@ -86,7 +86,7 @@ index 2eaa6e3307..5c2876b5c9 100644
          if (r < 0)
                  return r;
  
-@@ -924,7 +924,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -928,7 +928,7 @@ int cg_uninstall_release_agent(const char *controller) {
          if (r < 0)
                  return r;
  
@@ -95,7 +95,7 @@ index 2eaa6e3307..5c2876b5c9 100644
          if (r < 0)
                  return r;
  
-@@ -1840,7 +1840,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
+@@ -1844,7 +1844,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
          if (r < 0)
                  return r;
  
@@ -201,10 +201,10 @@ index 61539afdbf..77e2b35daf 100644
                  return r;
  
 diff --git a/src/core/main.c b/src/core/main.c
-index 1c0030a75f..7108a87d46 100644
+index 8373a156cb..33e866942c 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
-@@ -1678,7 +1678,7 @@ static void initialize_core_pattern(bool skip_setup) {
+@@ -1683,7 +1683,7 @@ static void initialize_core_pattern(bool skip_setup) {
          if (getpid_cached() != 1)
                  return;
  
@@ -253,7 +253,7 @@ index 500c310cfc..f9845ff9e7 100644
                  log_warning_errno(r, "Failed to drop caches, ignoring: %m");
          else
 diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
-index 01e66b4658..f3ea82ca1b 100644
+index 5f7491e8e2..b4a0af4073 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
 @@ -2516,7 +2516,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
@@ -279,10 +279,10 @@ index a5002437c6..b12e6cd9c9 100644
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
 diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index a229c70875..4ceb73e915 100644
+index 005a3d2be1..526d3c4311 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -2690,7 +2690,7 @@ static int reset_audit_loginuid(void) {
+@@ -2707,7 +2707,7 @@ static int reset_audit_loginuid(void) {
          if (streq(p, "4294967295"))
                  return 0;
  
@@ -291,7 +291,7 @@ index a229c70875..4ceb73e915 100644
          if (r < 0) {
                  log_error_errno(r,
                                  "Failed to reset audit login UID. This probably means that your kernel is too\n"
-@@ -4143,7 +4143,7 @@ static int setup_uid_map(
+@@ -4160,7 +4160,7 @@ static int setup_uid_map(
                  return log_oom();
  
          xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
@@ -300,7 +300,7 @@ index a229c70875..4ceb73e915 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to write UID map: %m");
  
-@@ -4153,7 +4153,7 @@ static int setup_uid_map(
+@@ -4170,7 +4170,7 @@ static int setup_uid_map(
                  return log_oom();
  
          xsprintf(uid_map, "/proc/" PID_FMT "/gid_map", pid);
@@ -367,10 +367,10 @@ index 805503f366..01a7ccb291 100644
                  log_debug_errno(r, "Failed to turn off coredumps, ignoring: %m");
  }
 diff --git a/src/shared/hibernate-util.c b/src/shared/hibernate-util.c
-index ea1b024ab6..bb82f37580 100644
+index 67862dcc61..9e9265c214 100644
 --- a/src/shared/hibernate-util.c
 +++ b/src/shared/hibernate-util.c
-@@ -501,7 +501,7 @@ int write_resume_config(dev_t devno, uint64_t offset, const char *device) {
+@@ -504,7 +504,7 @@ int write_resume_config(dev_t devno, uint64_t offset, const char *device) {
  
          /* We write the offset first since it's safer. Note that this file is only available in 4.17+, so
           * fail gracefully if it doesn't exist and we're only overwriting it with 0. */
@@ -379,7 +379,7 @@ index ea1b024ab6..bb82f37580 100644
          if (r == -ENOENT) {
                  if (offset != 0)
                          return log_error_errno(SYNTHETIC_ERRNO(EOPNOTSUPP),
-@@ -517,7 +517,7 @@ int write_resume_config(dev_t devno, uint64_t offset, const char *device) {
+@@ -520,7 +520,7 @@ int write_resume_config(dev_t devno, uint64_t offset, const char *device) {
                  log_debug("Wrote resume_offset=%s for device '%s' to /sys/power/resume_offset.",
                            offset_str, device);
  
diff --git a/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usage.patch b/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usage.patch
index 4982d6c7af..e995da81ff 100644
--- a/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usage.patch
+++ b/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usage.patch
@@ -1,4 +1,4 @@
-From db390dc6bfa0a7b27010e0dcd25f45f17a6e3954 Mon Sep 17 00:00:00 2001
+From 4b46cf08f269b69d5336bf3d8f617a288bd65ea8 Mon Sep 17 00:00:00 2001
 From: Scott Murray <scott.murray@konsulko.com>
 Date: Fri, 13 Sep 2019 19:26:27 -0400
 Subject: [PATCH] Handle __cpu_mask usage
diff --git a/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch b/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch
index ac74d1fab7..8cc9c1ba0c 100644
--- a/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch
@@ -1,4 +1,4 @@
-From 0019ddcc5c415df52504dd2b779b5acb19e4084d Mon Sep 17 00:00:00 2001
+From 76a0eea205c943a0e1fd0db7336cabb98d5c6c8c Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Tue, 10 Mar 2020 11:05:20 +0000
 Subject: [PATCH] Handle missing gshadow
diff --git a/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
index 551d9f8037..915a7bb0be 100644
--- a/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
@@ -1,4 +1,4 @@
-From eb4095a963a51a1b3de693f8cf0ac27304f30d24 Mon Sep 17 00:00:00 2001
+From bd309e23e3e5b7bff8cd4b6778396d921438295e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 12 Apr 2021 23:44:53 -0700
 Subject: [PATCH] missing_syscall.h: Define MIPS ABI defines for musl
diff --git a/meta/recipes-core/systemd/systemd/0016-pass-correct-parameters-to-getdents64.patch b/meta/recipes-core/systemd/systemd/0016-pass-correct-parameters-to-getdents64.patch
index 947833e92b..a9961b515d 100644
--- a/meta/recipes-core/systemd/systemd/0016-pass-correct-parameters-to-getdents64.patch
+++ b/meta/recipes-core/systemd/systemd/0016-pass-correct-parameters-to-getdents64.patch
@@ -1,4 +1,4 @@
-From c9c0cdbc37c2e0ac1917188b6f3a1ad54cbbd816 Mon Sep 17 00:00:00 2001
+From 81eb93545808124b3c1abbef2e5d71ad28a1a870 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Jan 2022 15:15:11 -0800
 Subject: [PATCH] pass correct parameters to getdents64
diff --git a/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-headers.patch b/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-headers.patch
index 922a390cc3..d8557bd3f3 100644
--- a/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-headers.patch
+++ b/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-headers.patch
@@ -1,4 +1,4 @@
-From 038809fb270d11909d502d76b56bb83784ff478d Mon Sep 17 00:00:00 2001
+From d09615e61bc779228c996f024ec48c7e21eb64c9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Jan 2022 22:19:37 -0800
 Subject: [PATCH] Adjust for musl headers
@@ -242,7 +242,7 @@ index ff372092e6..eef66811f4 100644
  #include "nlmon.h"
  
 diff --git a/src/network/netdev/tunnel.c b/src/network/netdev/tunnel.c
-index db84e7cf6e..93d5642962 100644
+index ab3b8fbb51..68f88b3ca3 100644
 --- a/src/network/netdev/tunnel.c
 +++ b/src/network/netdev/tunnel.c
 @@ -2,7 +2,7 @@
@@ -332,7 +332,7 @@ index b11fdbbd0d..a971a917f0 100644
  #include "conf-parser.h"
  #include "alloc-util.h"
 diff --git a/src/network/netdev/wireguard.c b/src/network/netdev/wireguard.c
-index 4c7d837c41..6df6dfb816 100644
+index 52fed20b57..e66bc34993 100644
 --- a/src/network/netdev/wireguard.c
 +++ b/src/network/netdev/wireguard.c
 @@ -6,7 +6,7 @@
diff --git a/meta/recipes-core/systemd/systemd/0018-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch b/meta/recipes-core/systemd/systemd/0018-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
index 9e21222b99..0fd55eb0ea 100644
--- a/meta/recipes-core/systemd/systemd/0018-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
+++ b/meta/recipes-core/systemd/systemd/0018-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
@@ -1,4 +1,4 @@
-From b771a2ed8d6e07b006710767b79475dece4d789c Mon Sep 17 00:00:00 2001
+From c0c90f4e2381091830203e1286115b0a30e059d3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 8 Nov 2022 13:31:34 -0800
 Subject: [PATCH] test-bus-error: strerror() is assumed to be GNU specific
diff --git a/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-portable-for-musl.patch b/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-portable-for-musl.patch
index a6f2fe1d0f..e0228d6ad8 100644
--- a/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-portable-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-portable-for-musl.patch
@@ -1,4 +1,4 @@
-From f70a8031ded3bcfe4c5f1cea4763ae257ca27be8 Mon Sep 17 00:00:00 2001
+From 6ad0fb9dcd6940a9a24e515b61d4b6245c3b1e98 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 23 Jan 2023 23:39:46 -0800
 Subject: [PATCH] errno-util: Make STRERROR portable for musl
diff --git a/meta/recipes-core/systemd/systemd/0020-sd-event-Make-malloc_trim-conditional-on-glibc.patch b/meta/recipes-core/systemd/systemd/0020-sd-event-Make-malloc_trim-conditional-on-glibc.patch
index cc123b4dee..45284e89e1 100644
--- a/meta/recipes-core/systemd/systemd/0020-sd-event-Make-malloc_trim-conditional-on-glibc.patch
+++ b/meta/recipes-core/systemd/systemd/0020-sd-event-Make-malloc_trim-conditional-on-glibc.patch
@@ -1,4 +1,4 @@
-From 9ae5377acfa895bfc1ea61aef4fbe754bc2f7f33 Mon Sep 17 00:00:00 2001
+From 70abcbd93b8854c4dd0ae88b82f394d325b2a365 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 2 Aug 2023 12:06:27 -0700
 Subject: [PATCH] sd-event: Make malloc_trim() conditional on glibc
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/src/libsystemd/sd-event/sd-event.c b/src/libsystemd/sd-event/sd-event.c
-index 25f3b1fc4f..9ea3c964b2 100644
+index b3541a1429..ba87265d9f 100644
 --- a/src/libsystemd/sd-event/sd-event.c
 +++ b/src/libsystemd/sd-event/sd-event.c
 @@ -1874,7 +1874,7 @@ _public_ int sd_event_add_exit(
diff --git a/meta/recipes-core/systemd/systemd/0021-shared-Do-not-use-malloc_info-on-musl.patch b/meta/recipes-core/systemd/systemd/0021-shared-Do-not-use-malloc_info-on-musl.patch
index 5e03284507..691bf89afd 100644
--- a/meta/recipes-core/systemd/systemd/0021-shared-Do-not-use-malloc_info-on-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0021-shared-Do-not-use-malloc_info-on-musl.patch
@@ -1,4 +1,4 @@
-From d814a5cae2ecbee079816e3fc7b34a59da356a3b Mon Sep 17 00:00:00 2001
+From c85009340b3a58686390ee70671334593e348a10 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 2 Aug 2023 12:20:40 -0700
 Subject: [PATCH] shared: Do not use malloc_info on musl
diff --git a/meta/recipes-core/systemd/systemd/0022-avoid-missing-LOCK_EX-declaration.patch b/meta/recipes-core/systemd/systemd/0022-avoid-missing-LOCK_EX-declaration.patch
index e4ed2002c4..6b3aa607b4 100644
--- a/meta/recipes-core/systemd/systemd/0022-avoid-missing-LOCK_EX-declaration.patch
+++ b/meta/recipes-core/systemd/systemd/0022-avoid-missing-LOCK_EX-declaration.patch
@@ -1,4 +1,4 @@
-From e355e927950e8978a417067f25f30bf311896c96 Mon Sep 17 00:00:00 2001
+From 45478696b3a3eb1fbcd6c5cd4899bb426230c2e1 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 2 Jan 2024 11:03:27 +0800
 Subject: [PATCH] avoid missing LOCK_EX declaration
@@ -15,7 +15,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  2 files changed, 2 insertions(+)
 
 diff --git a/src/core/exec-invoke.c b/src/core/exec-invoke.c
-index 308d332c15..b1c43bbc6a 100644
+index 22bc8d10c1..9bced8f420 100644
 --- a/src/core/exec-invoke.c
 +++ b/src/core/exec-invoke.c
 @@ -5,6 +5,7 @@
diff --git a/meta/recipes-core/systemd/systemd_255.13.bb b/meta/recipes-core/systemd/systemd_255.17.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_255.13.bb
rename to meta/recipes-core/systemd/systemd_255.17.bb
-- 
2.43.0


