Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD36C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:31 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.11585.1634657670567788252
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bqVGTo0w;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 y74-20020a1c7d4d000000b00322f53b9bbfso3341189wmc.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sW1p21irTypkZefl9YEVS1Pn2+1QllR0UDq37FlQaqI=;
        b=bqVGTo0wDoTC4Xzvgtb+kGjL85rMPqiaxfmYUQGAMK261bFlAW+fQFAXqtdgVxluM2
         I8WjYLElJWVDsrug+g337f6vJ3eQGaWVkZ6eisfNWPb9NQ8xtJO+5yK+dCXbTH2OOCFQ
         OS8g23LYOwxufsKAR4q/wiLK6sHv8bdSWzZzdrzGIB3SgjiSDaUPWaH1TGkzJzWXMJCI
         FdicQlNB2o4K4YFzknABsMwlpC/9f6hy5qrZ5tGUhS5I0SORTTNJVi6FDZZmOVbxtdS1
         fl2Q+BdQyCK82nmKW7TZdiIdu4UPJBg0nFBWw1amW/S+XKy+Ky2QSNivkhcKdwgMbYcf
         3XuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sW1p21irTypkZefl9YEVS1Pn2+1QllR0UDq37FlQaqI=;
        b=S16fJ5nTav0U9lHErUNQnQOvX6QenalCQYjGIp85BR7lq8OxFhSxBjehkEhm1nm8zJ
         vrc+Azu0gcTeBlpk0MHmMg705J//f0c9/SV1jfb3bhWJXGSK+GW7sY26oJCn4F2b9ung
         bTnkNJgmO0/TjfVdhOdtKw0Ztfqw5tbehqiGlJAP6uZLBWQzM0PwYGIo8zF1MIXfRE7H
         lSlwAdYqxLwhWFG68/wkFibEWYWfUANpbTnS/YcjkpfT2YGgxk9pchkC2evVRinq0UNJ
         NjlfimWtszW9RGkINWFTIt7beEDXLYhE4XfneDhdF7xdr3aex3uwLL+5pSb1QAAuQuv5
         HNUQ==
X-Gm-Message-State: AOAM533EqlpgAxfA+8T1lJpN6Dflb2voPyEV3Iql/QbpscznGp1gAalk
	/751X81UfM58YhYS/7/vSBxK0EY6Jfk=
X-Google-Smtp-Source: 
 ABdhPJylNeM8lTxgVvkcgKmVf2U52OLWFTEV/vVhqDV/ahonjctPECvhO+olYvcO7HP+Dj+V2y9GOw==
X-Received: by 2002:a5d:59a9:: with SMTP id p9mr46399331wrr.386.1634657668981;
        Tue, 19 Oct 2021 08:34:28 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/65] systemd: update 249.4 -> 249.5
Date: Tue, 19 Oct 2021 17:33:22 +0200
Message-Id: <20211019153419.3319802-8-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157127

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...md-boot_249.4.bb => systemd-boot_249.5.bb} |  0
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 ...l_dependency-to-get-include-director.patch | 46 +++++++++++++++++++
 ...002-don-t-use-glibc-specific-qsort_r.patch |  2 +-
 ...dd-__compare_fn_t-and-comparison_fn_.patch |  2 +-
 ...k-parse_printf_format-implementation.patch |  8 ++--
 ...missing.h-check-for-missing-strndupa.patch | 16 +++----
 .../0006-Include-netinet-if_ether.h.patch     |  6 +--
 ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |  2 +-
 ...008-add-missing-FTW_-macros-for-musl.patch |  2 +-
 ..._register_atfork-for-non-glibc-build.patch |  2 +-
 ...10-Use-uintmax_t-for-handling-rlim_t.patch |  2 +-
 ...sable-tests-for-missing-typedefs-in-.patch |  2 +-
 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  2 +-
 ...patible-basename-for-non-glibc-syste.patch |  2 +-
 ...uffering-when-writing-to-oom_score_a.patch |  2 +-
 ...compliant-strerror_r-from-GNU-specif.patch |  2 +-
 ...S_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch |  2 +-
 ...ype.h-add-__compar_d_fn_t-definition.patch |  2 +-
 ...definition-of-prctl_mm_map-structure.patch |  2 +-
 .../systemd/0019-Handle-missing-LOCK_EX.patch |  2 +-
 ...ible-pointer-type-struct-sockaddr_un.patch |  8 ++--
 .../0021-test-json.c-define-M_PIl.patch       |  2 +-
 ...-not-disable-buffer-in-writing-files.patch |  6 +--
 .../0025-Handle-__cpu_mask-usage.patch        |  2 +-
 .../systemd/0026-Handle-missing-gshadow.patch |  2 +-
 ...l.h-Define-MIPS-ABI-defines-for-musl.patch |  2 +-
 .../{systemd_249.4.bb => systemd_249.5.bb}    |  1 +
 28 files changed, 89 insertions(+), 42 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_249.4.bb => systemd-boot_249.5.bb} (100%)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-use-partial_dependency-to-get-include-director.patch
 rename meta/recipes-core/systemd/{systemd_249.4.bb => systemd_249.5.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd-boot_249.4.bb b/meta/recipes-core/systemd/systemd-boot_249.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_249.4.bb
rename to meta/recipes-core/systemd/systemd-boot_249.5.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index bc098adcb3..53ffe8d293 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "4d8fd88b9641fce81272f60f556543f713175403"
+SRCREV = "00b0393e65252bf631670604f58b844780b08c50"
 SRCBRANCH = "v249-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH} \
 "
diff --git a/meta/recipes-core/systemd/systemd/0001-meson-use-partial_dependency-to-get-include-director.patch b/meta/recipes-core/systemd/systemd/0001-meson-use-partial_dependency-to-get-include-director.patch
new file mode 100644
index 0000000000..51ee5d8623
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-meson-use-partial_dependency-to-get-include-director.patch
@@ -0,0 +1,46 @@
+From 260e871fda979f040c94d2011545e8122bed68ca Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 18 Oct 2021 10:13:07 +0200
+Subject: [PATCH] meson: use partial_dependency() to get include directory
+
+Getting the variable directly from pkg-config is prone to host
+contamination when building in sysroots as the
+compiler starts looking for the headers on the host in addition to
+the sysroot.
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/21027]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ meson.build | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index df53c6156d..38fb37dd75 100644
+--- a/meson.build
++++ b/meson.build
+@@ -2618,18 +2618,17 @@ endif
+ 
+ if conf.get('ENABLE_LOCALED') == 1
+         if conf.get('HAVE_XKBCOMMON') == 1
+-                # logind will load libxkbcommon.so dynamically on its own
+-                deps = [libdl]
+-                extra_includes = [libxkbcommon.get_pkgconfig_variable('includedir')]
++                # logind will load libxkbcommon.so dynamically on its own, but we still
++                # need to specify where the headers are
++                deps = [libdl, libxkbcommon.partial_dependency(compile_args: true)]
+         else
+                 deps = []
+-                extra_includes = []
+         endif
+ 
+         executable(
+                 'systemd-localed',
+                 systemd_localed_sources,
+-                include_directories : includes + extra_includes,
++                include_directories : includes,
+                 link_with : [libshared],
+                 dependencies : deps,
+                 install_rpath : rootlibexecdir,
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
index bd2312c3b3..f233ee6621 100644
--- a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
+++ b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
@@ -1,4 +1,4 @@
-From 0be164b79315998e719971db86ed79128ffb4a0b Mon Sep 17 00:00:00 2001
+From 30bd749c6777701496124272b59e1283252c3267 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:41:41 +0800
 Subject: [PATCH] don't use glibc-specific qsort_r
diff --git a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
index 7b14316134..a51ab0ab2e 100644
--- a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
+++ b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
@@ -1,4 +1,4 @@
-From dfcae6aacf2790bdceac3f25fcabf7c6daee176c Mon Sep 17 00:00:00 2001
+From 4dba0a3b1372ce34d8b6e150a108123a1b2b0b96 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:55:12 +0800
 Subject: [PATCH] missing_type.h: add __compare_fn_t and comparison_fn_t
diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
index d83fe903b8..3c07f6005f 100644
--- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
@@ -1,4 +1,4 @@
-From fcac5d47366085b29460590d36efafa87ccfe3b2 Mon Sep 17 00:00:00 2001
+From 842d231165f0d564c51d93650820e4fa7f097c3e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sat, 22 May 2021 20:26:24 +0200
 Subject: [PATCH] add fallback parse_printf_format implementation
@@ -23,7 +23,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  create mode 100644 src/basic/parse-printf-format.h
 
 diff --git a/meson.build b/meson.build
-index 738879eb21..1aa20b8246 100644
+index b5a51b6d0d..11cf56efee 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -656,6 +656,7 @@ endif
@@ -35,10 +35,10 @@ index 738879eb21..1aa20b8246 100644
                    'valgrind/memcheck.h',
                    'valgrind/valgrind.h',
 diff --git a/src/basic/meson.build b/src/basic/meson.build
-index 9b016ce5e8..a9ce21b02e 100644
+index 452b965db3..4e64d883dc 100644
 --- a/src/basic/meson.build
 +++ b/src/basic/meson.build
-@@ -322,6 +322,11 @@ endforeach
+@@ -321,6 +321,11 @@ endforeach
  
  basic_sources += generated_gperf_headers
  
diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index 1541d0b53c..1b9e194667 100644
--- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -1,4 +1,4 @@
-From 5b90aba2eb7340085d657493bf8ec1a9f0e25108 Mon Sep 17 00:00:00 2001
+From 95c61768e1f8d76a7bd28355429fc4b7b428ad61 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:18:21 +0800
 Subject: [PATCH] src/basic/missing.h: check for missing strndupa
@@ -73,7 +73,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  51 files changed, 62 insertions(+)
 
 diff --git a/meson.build b/meson.build
-index 1aa20b8246..aafee71eb4 100644
+index 11cf56efee..5bd6602e03 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -480,6 +480,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
@@ -109,7 +109,7 @@ index 1ff6160dc8..c9efd862a2 100644
  static int cg_enumerate_items(const char *controller, const char *path, FILE **_f, const char *item) {
          _cleanup_free_ char *fs = NULL;
 diff --git a/src/basic/env-util.c b/src/basic/env-util.c
-index 81b1e3f10e..8fedcfd1cd 100644
+index 1ca445dab4..1f5a212d4e 100644
 --- a/src/basic/env-util.c
 +++ b/src/basic/env-util.c
 @@ -18,6 +18,7 @@
@@ -165,7 +165,7 @@ index f91f8f7a08..fb31596216 100644
  int mkdir_safe_internal(
                  const char *path,
 diff --git a/src/basic/mountpoint-util.c b/src/basic/mountpoint-util.c
-index 8c836a1b74..2eb7e5a634 100644
+index e7a5a99551..3cc157f248 100644
 --- a/src/basic/mountpoint-util.c
 +++ b/src/basic/mountpoint-util.c
 @@ -11,6 +11,7 @@
@@ -273,7 +273,7 @@ index 84c3caf3a5..0fa84eaa38 100644
  BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", TasksMax, tasks_max_resolve);
  
 diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
-index 50daef6702..1cc6d91e64 100644
+index 902e074bd2..ac15b944e6 100644
 --- a/src/core/dbus-execute.c
 +++ b/src/core/dbus-execute.c
 @@ -42,6 +42,7 @@
@@ -321,7 +321,7 @@ index a56f12f47f..6b8729ef67 100644
  #if HAVE_KMOD
  #include "module-util.h"
 diff --git a/src/core/service.c b/src/core/service.c
-index cb0a528f0d..740d305710 100644
+index 701c145565..4ddc20ed7e 100644
 --- a/src/core/service.c
 +++ b/src/core/service.c
 @@ -41,6 +41,7 @@
@@ -357,7 +357,7 @@ index ae1d43756a..24de98c9f3 100644
  #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem"
  #define CERT_FILE     CERTIFICATE_ROOT "/certs/journal-remote.pem"
 diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
-index c8fb726d42..858a425d12 100644
+index 3eac97510d..db6913bc7a 100644
 --- a/src/journal/journalctl.c
 +++ b/src/journal/journalctl.c
 @@ -72,6 +72,7 @@
@@ -429,7 +429,7 @@ index 13c08fe295..9aae83486e 100644
  #define MAX_SIZE (2*1024*1024)
  
 diff --git a/src/libsystemd/sd-journal/sd-journal.c b/src/libsystemd/sd-journal/sd-journal.c
-index 5728c537bc..94885b0bf6 100644
+index b3240177cb..7e3ae2d24f 100644
 --- a/src/libsystemd/sd-journal/sd-journal.c
 +++ b/src/libsystemd/sd-journal/sd-journal.c
 @@ -40,6 +40,7 @@
diff --git a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
index 4ce168b6ef..951bebc901 100644
--- a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
+++ b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
@@ -1,4 +1,4 @@
-From 8983334730df280a4e4dcb08e586b453bc1d53bd Mon Sep 17 00:00:00 2001
+From f95192d87a46a2191cf4ebd47c64e04b138d7fac Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 26 Oct 2017 22:10:42 -0700
 Subject: [PATCH] Include netinet/if_ether.h
@@ -274,7 +274,7 @@ index 2b72b618fc..d0d4cfb384 100644
  #include "sd-dhcp6-client.h"
  
 diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
-index d58b700050..bba1ca1cab 100644
+index 20675f2306..2884511ff3 100644
 --- a/src/network/networkd-link.c
 +++ b/src/network/networkd-link.c
 @@ -1,9 +1,9 @@
@@ -300,7 +300,7 @@ index 850b4f449e..6f85d41328 100644
  #include <netinet/in.h>
  #include <linux/netdevice.h>
 diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
-index b7852f6eec..72514f6a0d 100644
+index 791fd64c39..a2825c920d 100644
 --- a/src/network/networkd-route.c
 +++ b/src/network/networkd-route.c
 @@ -1,5 +1,6 @@
diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
index 8b56f52989..46d0c7acef 100644
--- a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
+++ b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
@@ -1,4 +1,4 @@
-From ea800e99dba3a6013269853540b5d491c7c18d36 Mon Sep 17 00:00:00 2001
+From 9c0d0b61ffa4019b299e4c47f376ae823879dbf3 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:56:21 +0800
 Subject: [PATCH] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not defined
diff --git a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
index 95c3000aa1..1793c3d624 100644
--- a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
@@ -1,4 +1,4 @@
-From c25f3f1324a5961348f8df9c1d0441804604a0ff Mon Sep 17 00:00:00 2001
+From 45b78e3dc3edead4fc9883dd5a9877f473367bf7 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:00:06 +0800
 Subject: [PATCH] add missing FTW_ macros for musl
diff --git a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
index 24cd0897f9..35d24b334d 100644
--- a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
+++ b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
@@ -1,4 +1,4 @@
-From c6cd600f859960c6e22a7e1c8b3d9ba92021e63a Mon Sep 17 00:00:00 2001
+From 943b4258b870c65caaa56fe4dad0d9c7281fdb1d Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:03:47 +0800
 Subject: [PATCH] fix missing of __register_atfork for non-glibc builds
diff --git a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
index fec5f18e1a..a0d8402288 100644
--- a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
@@ -1,4 +1,4 @@
-From a47f363edf31142724b8c8773eee9bbdcacbb389 Mon Sep 17 00:00:00 2001
+From cceb2bba69b371868e89d435c5406b67cdd84d57 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:12:41 +0800
 Subject: [PATCH] Use uintmax_t for handling rlim_t
diff --git a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
index 08ac2fdbdb..1aee0fd7c5 100644
--- a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
+++ b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
@@ -1,4 +1,4 @@
-From 1089bdf56990586e734ecabd53d088011ff58b90 Mon Sep 17 00:00:00 2001
+From c1ee5661fa24bf540a4880a9d528da8752be033b Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 28 Feb 2018 21:25:22 -0800
 Subject: [PATCH] test-sizeof.c: Disable tests for missing typedefs in musl
diff --git a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
index a821dfc453..fefa6cbaaa 100644
--- a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
+++ b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
@@ -1,4 +1,4 @@
-From d95ba8d9a880258d1fc74b19aa8dc13141699efb Mon Sep 17 00:00:00 2001
+From ca9b1277fb4eb89bc2ca92440a280e318e882b66 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 10 Oct 2017 14:33:30 -0700
 Subject: [PATCH] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
diff --git a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
index 95c1f422ba..f9f3af1505 100644
--- a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
+++ b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
@@ -1,4 +1,4 @@
-From c03f527bb1973993a3b446b006f5bad71be30786 Mon Sep 17 00:00:00 2001
+From 792f4718ebd5a156729be89a5b47e52dc4b62975 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 May 2018 08:36:44 -0700
 Subject: [PATCH] Define glibc compatible basename() for non-glibc systems
diff --git a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
index b9ad3da5cd..fb901e6653 100644
--- a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
@@ -1,4 +1,4 @@
-From 87387970dfbf07c728a7d11f2ea422bc84de80e8 Mon Sep 17 00:00:00 2001
+From 101f5ceea7e575622c4f07d2972aeb4d6b082e4b Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jul 2018 15:00:44 +0800
 Subject: [PATCH] Do not disable buffering when writing to oom_score_adj
diff --git a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
index aad7c25c78..ece115df8e 100644
--- a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
+++ b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
@@ -1,4 +1,4 @@
-From fb1b946c610a0d4fa464c5cb2c4a0daee1e51cea Mon Sep 17 00:00:00 2001
+From 01ac079433b999a4747acf7be6a3b5fa182c3faf Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 10 Jul 2018 15:40:17 +0800
 Subject: [PATCH] distinguish XSI-compliant strerror_r from GNU-specifi
diff --git a/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch b/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
index c1e6787ee9..62a6c23e44 100644
--- a/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
+++ b/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
@@ -1,4 +1,4 @@
-From a24336f917e1b66160f148722554600ff85ac1b8 Mon Sep 17 00:00:00 2001
+From df2470912f3197aa441b6751feace1454c7d1f84 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:18:00 +0800
 Subject: [PATCH] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
diff --git a/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch b/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
index 95f2086f7b..b6b1dc35b2 100644
--- a/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
+++ b/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
@@ -1,4 +1,4 @@
-From e0acbce4195c99d876e71a4cc20167681822f177 Mon Sep 17 00:00:00 2001
+From e27ecb188503159a3f11bb1179ba1892cd080843 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:27:54 +0800
 Subject: [PATCH] missing_type.h: add __compar_d_fn_t definition
diff --git a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch b/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
index 898f6d5c6a..fea347242a 100644
--- a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
+++ b/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
@@ -1,4 +1,4 @@
-From 7a0435a185e931061a2ee6147347db8966233df4 Mon Sep 17 00:00:00 2001
+From 748c4cf040856857f24f4aeef6d996bd58573bd3 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:44:54 +0800
 Subject: [PATCH] avoid redefinition of prctl_mm_map structure
diff --git a/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch b/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
index 60b36b23b9..9a84d9c04a 100644
--- a/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
+++ b/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
@@ -1,4 +1,4 @@
-From 0c566970ea4fac0e3e597cfce0479c7b3502cff7 Mon Sep 17 00:00:00 2001
+From 647447e220e7e47e214c8258c7d4fbdb0da058aa Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Fri, 7 Aug 2020 15:19:27 +0000
 Subject: [PATCH] Handle missing LOCK_EX
diff --git a/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch b/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
index ac8e7f691f..5d3e8d4e84 100644
--- a/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
+++ b/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
@@ -1,4 +1,4 @@
-From e063abdbe73d38302533c02ce5b82116b909b888 Mon Sep 17 00:00:00 2001
+From 85cf3d58ff1a9696f0754feffae7d81b8d1d9a43 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Fri, 7 Aug 2020 15:20:17 +0000
 Subject: [PATCH] Fix incompatible pointer type struct sockaddr_un *
@@ -24,15 +24,15 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 04685fecba..90b12bb5bd 100644
+index 575b9da447..ff08ed23cc 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
 @@ -5354,7 +5354,7 @@ static int cant_be_in_netns(void) {
          if (fd < 0)
                  return log_error_errno(errno, "Failed to allocate udev control socket: %m");
  
--        if (connect(fd, &sa.un, SOCKADDR_UN_LEN(sa.un)) < 0) {
-+        if (connect(fd, (struct sockaddr *)&sa.un, SOCKADDR_UN_LEN(sa.un)) < 0) {
+-        if (connect(fd, &sa.sa, SOCKADDR_UN_LEN(sa.un)) < 0) {
++        if (connect(fd, (struct sockaddr *)&sa.sa, SOCKADDR_UN_LEN(sa.un)) < 0) {
  
                  if (errno == ENOENT || ERRNO_IS_DISCONNECT(errno))
                          return log_error_errno(SYNTHETIC_ERRNO(EOPNOTSUPP),
diff --git a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
index b965cd63b5..c0286244dd 100644
--- a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
+++ b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
@@ -1,4 +1,4 @@
-From 82f509e29039966e942d1e8eb6283d0828d68b8a Mon Sep 17 00:00:00 2001
+From 9770c5873836e702c2a58cf3b439198415c82c28 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 16:53:06 +0800
 Subject: [PATCH] test-json.c: define M_PIl
diff --git a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
index e0f31e8ad8..9028e147bf 100644
--- a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
@@ -1,4 +1,4 @@
-From 1f2b7e65dc96d01c84d0f33a7edb776988b28f4f Mon Sep 17 00:00:00 2001
+From 26da484391e20b36eb65c98872d1145261028c7a Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Fri, 1 Mar 2019 15:22:15 +0800
 Subject: [PATCH] do not disable buffer in writing files
@@ -165,7 +165,7 @@ index 29530bb691..3ecf6a45a2 100644
                  STRV_FOREACH(f, files) {
                          k = apply_file(*f, true);
 diff --git a/src/core/main.c b/src/core/main.c
-index b32a19a1d8..4e1238853e 100644
+index c64c73883e..1ac185e946 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
 @@ -1402,7 +1402,7 @@ static int bump_unix_max_dgram_qlen(void) {
@@ -252,7 +252,7 @@ index cb01b25bc6..e92051268b 100644
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
 diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 90b12bb5bd..6a1dafa094 100644
+index ff08ed23cc..e7c4a874a9 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
 @@ -2751,7 +2751,7 @@ static int reset_audit_loginuid(void) {
diff --git a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch b/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
index a986de7fd2..152a36229c 100644
--- a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
+++ b/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
@@ -1,4 +1,4 @@
-From 6f72861193824c5d170ec252857bca040a72c7ab Mon Sep 17 00:00:00 2001
+From 5fa412dcebe89fd9f6f6003163f17e0dc719df34 Mon Sep 17 00:00:00 2001
 From: Scott Murray <scott.murray@konsulko.com>
 Date: Fri, 13 Sep 2019 19:26:27 -0400
 Subject: [PATCH] Handle __cpu_mask usage
diff --git a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
index 347ec4182d..95df83c94b 100644
--- a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
+++ b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
@@ -1,4 +1,4 @@
-From 7fd5621608c312313a3be09f934a713176f739a8 Mon Sep 17 00:00:00 2001
+From 4835f3ca2e277abd93e2d4a74ecfd7401f32862b Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Tue, 10 Mar 2020 11:05:20 +0000
 Subject: [PATCH] Handle missing gshadow
diff --git a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
index 9349844db2..167f724add 100644
--- a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
@@ -1,4 +1,4 @@
-From 6690522f5096ec68f4a508242e4432e8b1ef07cc Mon Sep 17 00:00:00 2001
+From e90f18da3d2aef07ddd7d312ca8b34ff0324208e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 12 Apr 2021 23:44:53 -0700
 Subject: [PATCH] missing_syscall.h: Define MIPS ABI defines for musl
diff --git a/meta/recipes-core/systemd/systemd_249.4.bb b/meta/recipes-core/systemd/systemd_249.5.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_249.4.bb
rename to meta/recipes-core/systemd/systemd_249.5.bb
index f8c85dabf0..70f8813895 100644
--- a/meta/recipes-core/systemd/systemd_249.4.bb
+++ b/meta/recipes-core/systemd/systemd_249.5.bb
@@ -25,6 +25,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
            file://0001-test-parse-argument-Include-signal.h.patch \
+           file://0001-meson-use-partial_dependency-to-get-include-director.patch \
            "
 
 # patches needed by musl
-- 
2.20.1


