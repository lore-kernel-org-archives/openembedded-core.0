Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D2BC433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:40 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.8705.1637163339361710881
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o5wUmm0d;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id y196so2609511wmc.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rl9o4RvnSXN71Ug3YjfPZPiS4ZBcrlbCuiKBsfe0Rw0=;
        b=o5wUmm0dF3Y4qA+40mK4vRB7WMr5lN+HQBzRO66mdTJRVAqRu1GC9j+yWVvtKj6kDo
         N165+fADKLhnSrrYyR8ShMZahsNSSEj7sqe2nBPGbudektjIvSBjhbl+tTBUrt2tgL+w
         hr6ASQrdgtsAVbCLqU1q/alHUL35vtzo5SmUW/Jgikxub1d0yQ3QAsoax/Qy/cSzgovh
         NnXT6eYOLgYM6MLT32uJNkXvzvRMY1d5apdiLuM1xc0YdlqO18ywzYINe/lEq0GfAxdT
         ZC/izpPV/YfOvu+2MJreQL2+Bm8IFMVd8lAKsLzX/xDvQbVcUEV038n37Oq0D8fwMGE2
         k5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rl9o4RvnSXN71Ug3YjfPZPiS4ZBcrlbCuiKBsfe0Rw0=;
        b=zqbutJOn68h9yxUVzCyAsrYATQ1PM4F4hg9UU+4cXOVaiMTu5IufsSB1iFvovj+Jml
         +aMVQ0u/no2Y7PYM1iBsS2P/Jx2Aaj76oHKpgpNcLR/61vSjMXizpcIS2xMZs6Wxv8oN
         kHFCqu5U13+T8DIQIBYCs1khcVlm2cPp1DT63TQixWYRI2sNGXO3Ylk39mtc7euOnh7G
         AxZafBN7jL3cH5TiLexwfVpeSMUhO0WVD3ynod85V/494Xui2gzmNeKdGBFFI5XrGvd0
         4DZlZTCxoMwx7ckPjnmWwSoNUCoYiMfltbji/f47SZXJJgOvVVJSHzShTgONun9xZVBK
         CC+g==
X-Gm-Message-State: AOAM533O7pZQEp6FFRt1QKro+b2nWT7ZmVAueEfwgLTVBQ/nQ2de1gfL
	26HAzDtnlwCPaqXmAoKKBs5DoFTQXCE=
X-Google-Smtp-Source: 
 ABdhPJwUaMditkNj3eKC+aGtBlRgzNilQArKb//66YxF2sUqwe14I3L0fx78RN2uHllM3OFxbakZRw==
X-Received: by 2002:a1c:5409:: with SMTP id i9mr642979wmb.146.1637163337781;
        Wed, 17 Nov 2021 07:35:37 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/36] systemd: upgrade 249.5 -> 249.6
Date: Wed, 17 Nov 2021 16:35:06 +0100
Message-Id: <20211117153525.257146-17-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158412

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...md-boot_249.5.bb => systemd-boot_249.6.bb} |  0
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 ...l_dependency-to-get-include-director.patch | 46 -------------------
 ...002-don-t-use-glibc-specific-qsort_r.patch |  2 +-
 ...dd-__compare_fn_t-and-comparison_fn_.patch |  2 +-
 ...k-parse_printf_format-implementation.patch |  4 +-
 ...missing.h-check-for-missing-strndupa.patch | 10 ++--
 .../0006-Include-netinet-if_ether.h.patch     |  6 +--
 ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |  2 +-
 ...008-add-missing-FTW_-macros-for-musl.patch |  3 +-
 ..._register_atfork-for-non-glibc-build.patch |  4 +-
 ...10-Use-uintmax_t-for-handling-rlim_t.patch |  6 +--
 ...sable-tests-for-missing-typedefs-in-.patch |  2 +-
 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  2 +-
 ...patible-basename-for-non-glibc-syste.patch |  2 +-
 ...uffering-when-writing-to-oom_score_a.patch |  4 +-
 ...compliant-strerror_r-from-GNU-specif.patch |  2 +-
 ...S_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch |  2 +-
 ...ype.h-add-__compar_d_fn_t-definition.patch |  2 +-
 ...definition-of-prctl_mm_map-structure.patch |  2 +-
 .../systemd/0019-Handle-missing-LOCK_EX.patch |  2 +-
 ...ible-pointer-type-struct-sockaddr_un.patch |  2 +-
 .../0021-test-json.c-define-M_PIl.patch       |  2 +-
 ...-not-disable-buffer-in-writing-files.patch |  2 +-
 .../0025-Handle-__cpu_mask-usage.patch        |  2 +-
 .../systemd/0026-Handle-missing-gshadow.patch |  2 +-
 ...l.h-Define-MIPS-ABI-defines-for-musl.patch |  2 +-
 .../{systemd_249.5.bb => systemd_249.6.bb}    |  1 -
 28 files changed, 37 insertions(+), 83 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_249.5.bb => systemd-boot_249.6.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-meson-use-partial_dependency-to-get-include-director.patch
 rename meta/recipes-core/systemd/{systemd_249.5.bb => systemd_249.6.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd-boot_249.5.bb b/meta/recipes-core/systemd/systemd-boot_249.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_249.5.bb
rename to meta/recipes-core/systemd/systemd-boot_249.6.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 4e4cdd2e2f..f3ce32efc2 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "00b0393e65252bf631670604f58b844780b08c50"
+SRCREV = "deda69dad784f9c4367533555ff4d7bf6308c0ff"
 SRCBRANCH = "v249-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
 "
diff --git a/meta/recipes-core/systemd/systemd/0001-meson-use-partial_dependency-to-get-include-director.patch b/meta/recipes-core/systemd/systemd/0001-meson-use-partial_dependency-to-get-include-director.patch
deleted file mode 100644
index 51ee5d8623..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-meson-use-partial_dependency-to-get-include-director.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 260e871fda979f040c94d2011545e8122bed68ca Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 18 Oct 2021 10:13:07 +0200
-Subject: [PATCH] meson: use partial_dependency() to get include directory
-
-Getting the variable directly from pkg-config is prone to host
-contamination when building in sysroots as the
-compiler starts looking for the headers on the host in addition to
-the sysroot.
-
-Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/21027]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- meson.build | 9 ++++-----
- 1 file changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index df53c6156d..38fb37dd75 100644
---- a/meson.build
-+++ b/meson.build
-@@ -2618,18 +2618,17 @@ endif
- 
- if conf.get('ENABLE_LOCALED') == 1
-         if conf.get('HAVE_XKBCOMMON') == 1
--                # logind will load libxkbcommon.so dynamically on its own
--                deps = [libdl]
--                extra_includes = [libxkbcommon.get_pkgconfig_variable('includedir')]
-+                # logind will load libxkbcommon.so dynamically on its own, but we still
-+                # need to specify where the headers are
-+                deps = [libdl, libxkbcommon.partial_dependency(compile_args: true)]
-         else
-                 deps = []
--                extra_includes = []
-         endif
- 
-         executable(
-                 'systemd-localed',
-                 systemd_localed_sources,
--                include_directories : includes + extra_includes,
-+                include_directories : includes,
-                 link_with : [libshared],
-                 dependencies : deps,
-                 install_rpath : rootlibexecdir,
--- 
-2.20.1
-
diff --git a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
index f233ee6621..47ac24ab04 100644
--- a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
+++ b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
@@ -1,4 +1,4 @@
-From 30bd749c6777701496124272b59e1283252c3267 Mon Sep 17 00:00:00 2001
+From 10e00305eef277310e9cbb219080b53ea6ea9c6f Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:41:41 +0800
 Subject: [PATCH] don't use glibc-specific qsort_r
diff --git a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
index a51ab0ab2e..26f05fd50a 100644
--- a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
+++ b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
@@ -1,4 +1,4 @@
-From 4dba0a3b1372ce34d8b6e150a108123a1b2b0b96 Mon Sep 17 00:00:00 2001
+From 8a64ec1087c161be3985f16e7f37e1beed6623f6 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:55:12 +0800
 Subject: [PATCH] missing_type.h: add __compare_fn_t and comparison_fn_t
diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
index 3c07f6005f..51cfc355c0 100644
--- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
@@ -1,4 +1,4 @@
-From 842d231165f0d564c51d93650820e4fa7f097c3e Mon Sep 17 00:00:00 2001
+From b5e4f966f95ddb793316fe9d494a8a4c56247e23 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sat, 22 May 2021 20:26:24 +0200
 Subject: [PATCH] add fallback parse_printf_format implementation
@@ -23,7 +23,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  create mode 100644 src/basic/parse-printf-format.h
 
 diff --git a/meson.build b/meson.build
-index b5a51b6d0d..11cf56efee 100644
+index 5bdfd9753d..3421da3a4d 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -656,6 +656,7 @@ endif
diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index 1b9e194667..32b5090d8f 100644
--- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -1,4 +1,4 @@
-From 95c61768e1f8d76a7bd28355429fc4b7b428ad61 Mon Sep 17 00:00:00 2001
+From 0dfa2bcd34e10b354177a988c8be433de782f1c7 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:18:21 +0800
 Subject: [PATCH] src/basic/missing.h: check for missing strndupa
@@ -73,7 +73,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  51 files changed, 62 insertions(+)
 
 diff --git a/meson.build b/meson.build
-index 11cf56efee..5bd6602e03 100644
+index 3421da3a4d..ddef6fba91 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -480,6 +480,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
@@ -297,7 +297,7 @@ index ca9b399d8c..b864480a8c 100644
  int bus_property_get_triggered_unit(
                  sd_bus *bus,
 diff --git a/src/core/execute.c b/src/core/execute.c
-index 2a337b55a2..2a64675c5f 100644
+index 2f2de4d9cf..515b2fe748 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
 @@ -98,6 +98,7 @@
@@ -321,7 +321,7 @@ index a56f12f47f..6b8729ef67 100644
  #if HAVE_KMOD
  #include "module-util.h"
 diff --git a/src/core/service.c b/src/core/service.c
-index 701c145565..4ddc20ed7e 100644
+index 7b90822f68..4af076eeba 100644
 --- a/src/core/service.c
 +++ b/src/core/service.c
 @@ -41,6 +41,7 @@
@@ -669,7 +669,7 @@ index 65c40de4c8..4ef9a0c6c8 100644
  _printf_(2,3)
  static void path_prepend(char **path, const char *fmt, ...) {
 diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
-index b28089be71..a7e2232299 100644
+index 9854270b27..71b5fab1e7 100644
 --- a/src/udev/udev-event.c
 +++ b/src/udev/udev-event.c
 @@ -34,6 +34,7 @@
diff --git a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
index 951bebc901..21d42e38ba 100644
--- a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
+++ b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
@@ -1,4 +1,4 @@
-From f95192d87a46a2191cf4ebd47c64e04b138d7fac Mon Sep 17 00:00:00 2001
+From a434f2b4815a48d4cf007482ef64c288c73e120f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 26 Oct 2017 22:10:42 -0700
 Subject: [PATCH] Include netinet/if_ether.h
@@ -103,7 +103,7 @@ index 5ad396a57e..1dc007fe13 100644
 -#endif /* _UAPI_LINUX_IN6_H */
 +#endif /* _LINUX_IN6_H */
 diff --git a/src/libsystemd-network/sd-dhcp6-client.c b/src/libsystemd-network/sd-dhcp6-client.c
-index f99c12620b..4966d62656 100644
+index efbf7d7df3..86906332b6 100644
 --- a/src/libsystemd-network/sd-dhcp6-client.c
 +++ b/src/libsystemd-network/sd-dhcp6-client.c
 @@ -5,7 +5,6 @@
@@ -300,7 +300,7 @@ index 850b4f449e..6f85d41328 100644
  #include <netinet/in.h>
  #include <linux/netdevice.h>
 diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
-index 791fd64c39..a2825c920d 100644
+index eeba31c45d..0a2b0ed42b 100644
 --- a/src/network/networkd-route.c
 +++ b/src/network/networkd-route.c
 @@ -1,5 +1,6 @@
diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
index 46d0c7acef..7edd5452e7 100644
--- a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
+++ b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
@@ -1,4 +1,4 @@
-From 9c0d0b61ffa4019b299e4c47f376ae823879dbf3 Mon Sep 17 00:00:00 2001
+From d566c9afe3a397b3323612641f49e12934c29b6a Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:56:21 +0800
 Subject: [PATCH] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not defined
diff --git a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
index 9540f967bb..ecca9682ce 100644
--- a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
@@ -1,4 +1,4 @@
-From 45b78e3dc3edead4fc9883dd5a9877f473367bf7 Mon Sep 17 00:00:00 2001
+From 0c49f309d60aa3751add1b8261bc69840e269c50 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:00:06 +0800
 Subject: [PATCH] add missing FTW_ macros for musl
@@ -10,6 +10,7 @@ This is to avoid build failures like below for musl.
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/basic/missing_type.h | 20 ++++++++++++++++++++
  src/shared/mount-setup.c |  1 +
diff --git a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
index 35d24b334d..8dfb56fc03 100644
--- a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
+++ b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
@@ -1,4 +1,4 @@
-From 943b4258b870c65caaa56fe4dad0d9c7281fdb1d Mon Sep 17 00:00:00 2001
+From 2d9f6863b676185d43775503cd9b41c74996c543 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:03:47 +0800
 Subject: [PATCH] fix missing of __register_atfork for non-glibc builds
@@ -12,7 +12,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 7 insertions(+)
 
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index 14259ea8df..18681838ef 100644
+index 461bbfe9a5..2d06f9f60a 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
 @@ -18,6 +18,9 @@
diff --git a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
index a0d8402288..e5e54ce12b 100644
--- a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
@@ -1,4 +1,4 @@
-From cceb2bba69b371868e89d435c5406b67cdd84d57 Mon Sep 17 00:00:00 2001
+From 7a333b5d0fdf99fc9667ed79dca2b8610b353ea3 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:12:41 +0800
 Subject: [PATCH] Use uintmax_t for handling rlim_t
@@ -87,10 +87,10 @@ index 23d108d5df..3e6fb438d7 100644
          return 1;
  }
 diff --git a/src/core/execute.c b/src/core/execute.c
-index 2a64675c5f..dca1e0e3b6 100644
+index 515b2fe748..7693f2d9a0 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -5391,9 +5391,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
+@@ -5395,9 +5395,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
          for (unsigned i = 0; i < RLIM_NLIMITS; i++)
                  if (c->rlimit[i]) {
                          fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
diff --git a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
index 1aee0fd7c5..ac82d4b1ef 100644
--- a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
+++ b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
@@ -1,4 +1,4 @@
-From c1ee5661fa24bf540a4880a9d528da8752be033b Mon Sep 17 00:00:00 2001
+From c79b81aea40f3b9edfa208f1350c9c6e4405ee82 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 28 Feb 2018 21:25:22 -0800
 Subject: [PATCH] test-sizeof.c: Disable tests for missing typedefs in musl
diff --git a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
index fefa6cbaaa..89f2730d6e 100644
--- a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
+++ b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
@@ -1,4 +1,4 @@
-From ca9b1277fb4eb89bc2ca92440a280e318e882b66 Mon Sep 17 00:00:00 2001
+From ff17c6edd025250802b41d645d915fe89667e775 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 10 Oct 2017 14:33:30 -0700
 Subject: [PATCH] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
diff --git a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
index f9f3af1505..fffb89b079 100644
--- a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
+++ b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
@@ -1,4 +1,4 @@
-From 792f4718ebd5a156729be89a5b47e52dc4b62975 Mon Sep 17 00:00:00 2001
+From f8d43bdb082b042f292b57b1b9434eed90160726 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 May 2018 08:36:44 -0700
 Subject: [PATCH] Define glibc compatible basename() for non-glibc systems
diff --git a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
index fb901e6653..ea2bbe8a9f 100644
--- a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
@@ -1,4 +1,4 @@
-From 101f5ceea7e575622c4f07d2972aeb4d6b082e4b Mon Sep 17 00:00:00 2001
+From a3c31153614dfdb033cffa51ef27593cbc422e5b Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jul 2018 15:00:44 +0800
 Subject: [PATCH] Do not disable buffering when writing to oom_score_adj
@@ -25,7 +25,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index 18681838ef..0fa71ccce0 100644
+index 2d06f9f60a..f86bd0b7dc 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
 @@ -1606,7 +1606,7 @@ int set_oom_score_adjust(int value) {
diff --git a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
index ece115df8e..fd1725221b 100644
--- a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
+++ b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
@@ -1,4 +1,4 @@
-From 01ac079433b999a4747acf7be6a3b5fa182c3faf Mon Sep 17 00:00:00 2001
+From 08c8d08e7d235b1ba1fa74a6731fabf9023f7fd0 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 10 Jul 2018 15:40:17 +0800
 Subject: [PATCH] distinguish XSI-compliant strerror_r from GNU-specifi
diff --git a/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch b/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
index 62a6c23e44..de23065814 100644
--- a/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
+++ b/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
@@ -1,4 +1,4 @@
-From df2470912f3197aa441b6751feace1454c7d1f84 Mon Sep 17 00:00:00 2001
+From 8bf36de4e197add998c6fceeaf22215c5007b6a4 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:18:00 +0800
 Subject: [PATCH] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
diff --git a/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch b/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
index b6b1dc35b2..d5fb3fbf19 100644
--- a/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
+++ b/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
@@ -1,4 +1,4 @@
-From e27ecb188503159a3f11bb1179ba1892cd080843 Mon Sep 17 00:00:00 2001
+From 3c4ae0a4dbec70379e8bc9838ebadbca02f889ab Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:27:54 +0800
 Subject: [PATCH] missing_type.h: add __compar_d_fn_t definition
diff --git a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch b/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
index fea347242a..0143533973 100644
--- a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
+++ b/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
@@ -1,4 +1,4 @@
-From 748c4cf040856857f24f4aeef6d996bd58573bd3 Mon Sep 17 00:00:00 2001
+From 39de54d812b37865bb4f3ab77c0b9312078c93aa Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:44:54 +0800
 Subject: [PATCH] avoid redefinition of prctl_mm_map structure
diff --git a/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch b/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
index 9a84d9c04a..818babc386 100644
--- a/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
+++ b/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
@@ -1,4 +1,4 @@
-From 647447e220e7e47e214c8258c7d4fbdb0da058aa Mon Sep 17 00:00:00 2001
+From 34d593d75e0be636d7a1775b038a0d8ff636bbcb Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Fri, 7 Aug 2020 15:19:27 +0000
 Subject: [PATCH] Handle missing LOCK_EX
diff --git a/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch b/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
index 5d3e8d4e84..74529428bc 100644
--- a/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
+++ b/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
@@ -1,4 +1,4 @@
-From 85cf3d58ff1a9696f0754feffae7d81b8d1d9a43 Mon Sep 17 00:00:00 2001
+From ddf7d7b0c458c9c11d3952c2850159f413e70592 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Fri, 7 Aug 2020 15:20:17 +0000
 Subject: [PATCH] Fix incompatible pointer type struct sockaddr_un *
diff --git a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
index c0286244dd..70305641f7 100644
--- a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
+++ b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
@@ -1,4 +1,4 @@
-From 9770c5873836e702c2a58cf3b439198415c82c28 Mon Sep 17 00:00:00 2001
+From 776df19769907397f2376f2665e83baac098d396 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 16:53:06 +0800
 Subject: [PATCH] test-json.c: define M_PIl
diff --git a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
index 9028e147bf..d9e3a2ad98 100644
--- a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
@@ -1,4 +1,4 @@
-From 26da484391e20b36eb65c98872d1145261028c7a Mon Sep 17 00:00:00 2001
+From ee566f88b7de42c4c086230859d5c035d687fa9b Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Fri, 1 Mar 2019 15:22:15 +0800
 Subject: [PATCH] do not disable buffer in writing files
diff --git a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch b/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
index 152a36229c..2aa9a59554 100644
--- a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
+++ b/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
@@ -1,4 +1,4 @@
-From 5fa412dcebe89fd9f6f6003163f17e0dc719df34 Mon Sep 17 00:00:00 2001
+From 1ab39b2d8c173ee231e673829eeeb113ccba2cef Mon Sep 17 00:00:00 2001
 From: Scott Murray <scott.murray@konsulko.com>
 Date: Fri, 13 Sep 2019 19:26:27 -0400
 Subject: [PATCH] Handle __cpu_mask usage
diff --git a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
index 95df83c94b..9e5a91c268 100644
--- a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
+++ b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
@@ -1,4 +1,4 @@
-From 4835f3ca2e277abd93e2d4a74ecfd7401f32862b Mon Sep 17 00:00:00 2001
+From d8ff6ef555c942388a3166a4e288da700368af31 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Tue, 10 Mar 2020 11:05:20 +0000
 Subject: [PATCH] Handle missing gshadow
diff --git a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
index 167f724add..414c255d67 100644
--- a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
@@ -1,4 +1,4 @@
-From e90f18da3d2aef07ddd7d312ca8b34ff0324208e Mon Sep 17 00:00:00 2001
+From 51b1dd6db0239a1d3cf62aac84685fd02bba69e6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 12 Apr 2021 23:44:53 -0700
 Subject: [PATCH] missing_syscall.h: Define MIPS ABI defines for musl
diff --git a/meta/recipes-core/systemd/systemd_249.5.bb b/meta/recipes-core/systemd/systemd_249.6.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_249.5.bb
rename to meta/recipes-core/systemd/systemd_249.6.bb
index 8bdc0ca028..242a53d22a 100644
--- a/meta/recipes-core/systemd/systemd_249.5.bb
+++ b/meta/recipes-core/systemd/systemd_249.6.bb
@@ -25,7 +25,6 @@ SRC_URI += "file://touchscreen.rules \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
            file://0001-test-parse-argument-Include-signal.h.patch \
-           file://0001-meson-use-partial_dependency-to-get-include-director.patch \
            "
 
 # patches needed by musl
-- 
2.20.1


