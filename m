Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A17EC61DB8
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 16:00:53 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.37143.1749225650355648265
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 09:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tOzDhTbl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso1893293b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 09:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749225649; x=1749830449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u001KQ1YdKCY/tq1d7eKDdqj7bNKhKPZPUczUCf4RyQ=;
        b=tOzDhTblgtKjRbeStBVWjgtvysv6jqXdWse/D9WmlaDZHgroIboJ07GnnvkuAfDYXw
         bI3Q396EGAIeJIi468lGu03YrThwQUN+2FR3/Kb1xDKnyqheZeOOeAr8CMJlupZgi+32
         3TwRfqoxGbbvGkCZj5n7VC3uOfL9Uxk8ekrCo/zULp+rL2r+H+eOPCzmB5SIftUsc788
         mR5G7yA002fhOLODYmQvBc9GZmuTz91hBM+Fdlrz0kpQlf3NJ8T1gPQhftIK+EdF8jP2
         q7MfOJ5asYm/f1353LPsBGw0xUyt/O/X0nrhQu7dLWXUCV8AY9A9Q/F0mWw+LrxZNTBT
         uWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749225649; x=1749830449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u001KQ1YdKCY/tq1d7eKDdqj7bNKhKPZPUczUCf4RyQ=;
        b=gWGkNciO5kvo1bdsCZT/OwriyPHZfUTi3Ye3ynLTSNnkG7WHJq1UDHvm6VYUWhrJI4
         OVreFTv7S7KZUZXx/BHPHNHpghVXd1gg9+y2olrm3VOrqT8Pr4Zc8J4HF//LbkX21cRJ
         3mLUvaz8KUiFXzL0dorHxouNU+8Sj+aFiIzU55Wzve67fkgYpk5TKtT9/UdBBHpTo0/u
         zOTgw2yWEd4yb7hw3+96GPFnpEAzA7rEG8YgBPZOp/jdvWLPF/uXwW5S35f6O/oI3rMC
         d0ShGh62KQ1eJeYUxDhbzgjkQ/t0KCfz6IueU/GIhVxcSmTiJG4qC2wsYlg84m3gyx41
         CgPQ==
X-Gm-Message-State: AOJu0YzJCnbtZ/8nZdaketStIdUnaVMslcysqLgRDOpdKl+Resg1x0Hb
	eqDdzmP/xKQ5QXM9wIaBXfaUVAz+XYCSjVgluFXjZW3PEkff7keCFc1jKQkJKpw1ESyA0SuZx2R
	HdKBO
X-Gm-Gg: ASbGncsGWUW6I1wy+CyP1xAjRZQpl57em/JT262/eIjybd5dmAH91G8/T0naQEY+uF1
	6E8F+sU3NozpQSPd3r9e78SBe5RHhIOZ63pU9WnzYrZ7+FJM4/jw6VtDmClz08piobXmzyEg1wl
	ErjhkZLUr8KWvdpmzbt2T4eRZSZx21hPM0CO37RoqbdcHebVm3WNmDH/3FObt46whZuUqEVSOdY
	mfPLJZZVCh1+ijDgWPEsDyy0y1YaFUG9oHLfK8MljfY/hR5K4Amf9S9+Ng9kHxBeE/7f6/zQdtC
	eilHmaObTJuBY+ql1VCp/U4ekPnt6UZjaK40r9erWfWjYwTQTcwseA==
X-Google-Smtp-Source: AGHT+IHkrDxUPZC6zwWpm/3TUV3nt9fKu/t8b/owOYc4TmXY+UPs4ZZk/AGT/xAjho4yP+e5UOKauw==
X-Received: by 2002:a05:6a20:7345:b0:201:8a13:f392 with SMTP id adf61e73a8af0-21ee2564cb1mr5502028637.20.1749225647949;
        Fri, 06 Jun 2025 09:00:47 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:742a:4153:2a1f:f028])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b083a9bsm1436489b3a.77.2025.06.06.09.00.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 09:00:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/12] systemd: upgrade 255.18 -> 255.21
Date: Fri,  6 Jun 2025 09:00:05 -0700
Message-ID: <29e623b2ad00555788412fa520fbb9ffec794cbb.1749225418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749225417.git.steve@sakoman.com>
References: <cover.1749225417.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 16:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218174

From: Guðni Már Gilbert <gudni.m.g@gmail.com>

The update includes 79 commits. Full list of changes can be found on
Github [1]

All patches were refreshed with devtool.

[1] https://github.com/systemd/systemd-stable/compare/v255.18...v255.21

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-native_255.18.bb => systemd-boot-native_255.21.bb} |  0
 .../{systemd-boot_255.18.bb => systemd-boot_255.21.bb} |  0
 meta/recipes-core/systemd/systemd.inc                  |  2 +-
 .../0001-missing_type.h-add-comparison_fn_t.patch      |  2 +-
 ...d-fallback-parse_printf_format-implementation.patch |  2 +-
 ...Don-t-install-dependency-links-at-install-tim.patch |  2 +-
 ...rc-basic-missing.h-check-for-missing-strndupa.patch | 10 +++++-----
 ...ail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |  2 +-
 .../0005-add-missing-FTW_-macros-for-musl.patch        |  2 +-
 .../0006-Use-uintmax_t-for-handling-rlim_t.patch       |  2 +-
 ...-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  2 +-
 ...glibc-compatible-basename-for-non-glibc-syste.patch |  2 +-
 .../0008-implment-systemd-sysv-install-for-OE.patch    |  2 +-
 ...disable-buffering-when-writing-to-oom_score_a.patch |  2 +-
 ...uish-XSI-compliant-strerror_r-from-GNU-specif.patch |  2 +-
 ...-avoid-redefinition-of-prctl_mm_map-structure.patch |  2 +-
 .../0012-do-not-disable-buffer-in-writing-files.patch  |  8 ++++----
 .../systemd/systemd/0013-Handle-__cpu_mask-usage.patch |  2 +-
 .../systemd/systemd/0014-Handle-missing-gshadow.patch  |  2 +-
 ...ng_syscall.h-Define-MIPS-ABI-defines-for-musl.patch |  2 +-
 .../0016-pass-correct-parameters-to-getdents64.patch   |  2 +-
 .../systemd/systemd/0017-Adjust-for-musl-headers.patch |  2 +-
 ...s-error-strerror-is-assumed-to-be-GNU-specifi.patch |  2 +-
 ...19-errno-util-Make-STRERROR-portable-for-musl.patch |  2 +-
 ...d-event-Make-malloc_trim-conditional-on-glibc.patch |  2 +-
 .../0021-shared-Do-not-use-malloc_info-on-musl.patch   |  2 +-
 .../0022-avoid-missing-LOCK_EX-declaration.patch       |  4 ++--
 .../systemd/{systemd_255.18.bb => systemd_v255.21.bb}  |  0
 28 files changed, 33 insertions(+), 33 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_255.18.bb => systemd-boot-native_255.21.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_255.18.bb => systemd-boot_255.21.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_255.18.bb => systemd_v255.21.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_255.18.bb b/meta/recipes-core/systemd/systemd-boot-native_255.21.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_255.18.bb
rename to meta/recipes-core/systemd/systemd-boot-native_255.21.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_255.18.bb b/meta/recipes-core/systemd/systemd-boot_255.21.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_255.18.bb
rename to meta/recipes-core/systemd/systemd-boot_255.21.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 8e134d8c86..28392b6b09 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "20415d357fb0e253df7444019a47674fac4ed1d6"
+SRCREV = "70500d37992a01d3275b1c414c3ed161d6f91f9e"
 SRCBRANCH = "v255-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd/0001-missing_type.h-add-comparison_fn_t.patch b/meta/recipes-core/systemd/systemd/0001-missing_type.h-add-comparison_fn_t.patch
index d2ffdd8de4..22f0468460 100644
--- a/meta/recipes-core/systemd/systemd/0001-missing_type.h-add-comparison_fn_t.patch
+++ b/meta/recipes-core/systemd/systemd/0001-missing_type.h-add-comparison_fn_t.patch
@@ -1,4 +1,4 @@
-From 7bbb54406dd77c358eab9df08b100ee85e176052 Mon Sep 17 00:00:00 2001
+From b270af4c086d254758fdcd1d294b15a555a4b3ea Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:55:12 +0800
 Subject: [PATCH] missing_type.h: add comparison_fn_t
diff --git a/meta/recipes-core/systemd/systemd/0002-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0002-add-fallback-parse_printf_format-implementation.patch
index df9e978e55..6cce960299 100644
--- a/meta/recipes-core/systemd/systemd/0002-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0002-add-fallback-parse_printf_format-implementation.patch
@@ -1,4 +1,4 @@
-From d0b08484a6c3113b6209d8f8e1dc1186a6427b99 Mon Sep 17 00:00:00 2001
+From 0660aea3d7c8058d73c9f7b2971f4daf35dd7a32 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sat, 22 May 2021 20:26:24 +0200
 Subject: [PATCH] add fallback parse_printf_format implementation
diff --git a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index 784f0898c0..4472dda2e8 100644
--- a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -1,4 +1,4 @@
-From 7e4fae68909ce4932e073dd060e22581edc39ad2 Mon Sep 17 00:00:00 2001
+From edc39fe19419120f70341cd50d4d097a514ac9cb Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 21 Feb 2019 16:23:24 +0800
 Subject: [PATCH] binfmt: Don't install dependency links at install time for
diff --git a/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-check-for-missing-strndupa.patch
index e46b4386aa..715a0c7ec8 100644
--- a/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -1,4 +1,4 @@
-From ca0b48676132744b78d99ee3ec2d33f11bb73c28 Mon Sep 17 00:00:00 2001
+From c728a728cd54c372162f5447aa94921efb0c35f0 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:18:21 +0800
 Subject: [PATCH] src/basic/missing.h: check for missing strndupa
@@ -280,7 +280,7 @@ index b3baf03afc..7404784a01 100644
  
  BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", CGroupTasksMax, cgroup_tasks_max_resolve);
 diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
-index 2d05ba7e1d..61a7de0037 100644
+index 71b07a6ec1..174a94e8a0 100644
 --- a/src/core/dbus-execute.c
 +++ b/src/core/dbus-execute.c
 @@ -42,6 +42,7 @@
@@ -352,7 +352,7 @@ index 7e0c98cb7d..978a7f5874 100644
  #define DEFAULT_MAX_USE_LOWER (uint64_t) (1ULL*1024ULL*1024ULL)           /* 1 MiB */
  #define DEFAULT_MAX_USE_UPPER (uint64_t) (4ULL*1024ULL*1024ULL*1024ULL)   /* 4 GiB */
 diff --git a/src/fstab-generator/fstab-generator.c b/src/fstab-generator/fstab-generator.c
-index 016f3baa7f..b1def81313 100644
+index e7caf510ba..79b252cad7 100644
 --- a/src/fstab-generator/fstab-generator.c
 +++ b/src/fstab-generator/fstab-generator.c
 @@ -37,6 +37,7 @@
@@ -424,7 +424,7 @@ index 5ade8e99aa..7553cf319d 100644
  #define SNDBUF_SIZE (8*1024*1024)
  
 diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-bus.c
-index 8befc97460..6ee4d4f595 100644
+index b32cd6c6a0..cc484454e0 100644
 --- a/src/libsystemd/sd-bus/sd-bus.c
 +++ b/src/libsystemd/sd-bus/sd-bus.c
 @@ -46,6 +46,7 @@
@@ -616,7 +616,7 @@ index 0a31be382f..92d629e7e0 100644
  /* up to three lines (each up to 100 characters) or 300 characters, whichever is less */
  #define PRINT_LINE_THRESHOLD 3
 diff --git a/src/shared/pager.c b/src/shared/pager.c
-index 19deefab56..6b6d0af1a0 100644
+index 41dd7bffdc..9ca45d8b91 100644
 --- a/src/shared/pager.c
 +++ b/src/shared/pager.c
 @@ -25,6 +25,7 @@
diff --git a/meta/recipes-core/systemd/systemd/0004-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd/0004-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
index 43ba526792..19eaf9170d 100644
--- a/meta/recipes-core/systemd/systemd/0004-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
+++ b/meta/recipes-core/systemd/systemd/0004-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
@@ -1,4 +1,4 @@
-From 3ea9cc03431c93c86cf0ca63ad04219af221a2d0 Mon Sep 17 00:00:00 2001
+From 674232187bf337c31a6528b4d241eafeb27ac85e Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:56:21 +0800
 Subject: [PATCH] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not defined
diff --git a/meta/recipes-core/systemd/systemd/0005-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0005-add-missing-FTW_-macros-for-musl.patch
index c25ccde9e2..dbd94d473d 100644
--- a/meta/recipes-core/systemd/systemd/0005-add-missing-FTW_-macros-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0005-add-missing-FTW_-macros-for-musl.patch
@@ -1,4 +1,4 @@
-From 885a6880ad1b687e3fbf1b9f35e218bee1fcc835 Mon Sep 17 00:00:00 2001
+From cdaafa37983753d309d2b37f8262e71f95798e52 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:00:06 +0800
 Subject: [PATCH] add missing FTW_ macros for musl
diff --git a/meta/recipes-core/systemd/systemd/0006-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0006-Use-uintmax_t-for-handling-rlim_t.patch
index 13c155745a..09ffbcb70a 100644
--- a/meta/recipes-core/systemd/systemd/0006-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0006-Use-uintmax_t-for-handling-rlim_t.patch
@@ -1,4 +1,4 @@
-From 646c3ced29922065eed64ac9b23af8276e989608 Mon Sep 17 00:00:00 2001
+From 8c33fe6338c448dca8533b9d3f9933e2794bda61 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:12:41 +0800
 Subject: [PATCH] Use uintmax_t for handling rlim_t
diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0007-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
index 55405c5d0b..563f033b0d 100644
--- a/meta/recipes-core/systemd/systemd/0007-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
+++ b/meta/recipes-core/systemd/systemd/0007-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
@@ -1,4 +1,4 @@
-From f772369a2519b378c09bb89bd48c3743a62404e3 Mon Sep 17 00:00:00 2001
+From 68ab3364c0fe1073bba3adf02add7108de80a17c Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 10 Oct 2017 14:33:30 -0700
 Subject: [PATCH] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
diff --git a/meta/recipes-core/systemd/systemd/0008-Define-glibc-compatible-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd/0008-Define-glibc-compatible-basename-for-non-glibc-syste.patch
index 6005b621ee..cc9f7771be 100644
--- a/meta/recipes-core/systemd/systemd/0008-Define-glibc-compatible-basename-for-non-glibc-syste.patch
+++ b/meta/recipes-core/systemd/systemd/0008-Define-glibc-compatible-basename-for-non-glibc-syste.patch
@@ -1,4 +1,4 @@
-From 45b1226ddbd981798e0448da41ddc4901e246b45 Mon Sep 17 00:00:00 2001
+From 6dd1aa50da27c07530a434218b5a7a384d0c6747 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 May 2018 08:36:44 -0700
 Subject: [PATCH] Define glibc compatible basename() for non-glibc systems
diff --git a/meta/recipes-core/systemd/systemd/0008-implment-systemd-sysv-install-for-OE.patch b/meta/recipes-core/systemd/systemd/0008-implment-systemd-sysv-install-for-OE.patch
index d43eaeff7a..21faa10a95 100644
--- a/meta/recipes-core/systemd/systemd/0008-implment-systemd-sysv-install-for-OE.patch
+++ b/meta/recipes-core/systemd/systemd/0008-implment-systemd-sysv-install-for-OE.patch
@@ -1,4 +1,4 @@
-From abca5814cb0b5b98a1e7af829cc166e76c524f1a Mon Sep 17 00:00:00 2001
+From 8da2b10dcbf423f791db79b7dfcc6cfaf8e26f8b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 5 Sep 2015 06:31:47 +0000
 Subject: [PATCH] implment systemd-sysv-install for OE
diff --git a/meta/recipes-core/systemd/systemd/0009-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0009-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
index 3e557b764f..66aa8551ac 100644
--- a/meta/recipes-core/systemd/systemd/0009-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0009-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
@@ -1,4 +1,4 @@
-From 8d61cecff3ba0687ad2c10aacb7d2aee7cb3fa79 Mon Sep 17 00:00:00 2001
+From ed33f139195794477ac854214022034db306f42d Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jul 2018 15:00:44 +0800
 Subject: [PATCH] Do not disable buffering when writing to oom_score_adj
diff --git a/meta/recipes-core/systemd/systemd/0010-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd/0010-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
index d4b67d15f4..66fab46128 100644
--- a/meta/recipes-core/systemd/systemd/0010-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
+++ b/meta/recipes-core/systemd/systemd/0010-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
@@ -1,4 +1,4 @@
-From 2180b639665bd314905ef058dee9a5e4a534333e Mon Sep 17 00:00:00 2001
+From ef261a0122ff5a4340897c9afe1fae04d14eb0dd Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 10 Jul 2018 15:40:17 +0800
 Subject: [PATCH] distinguish XSI-compliant strerror_r from GNU-specifi
diff --git a/meta/recipes-core/systemd/systemd/0011-avoid-redefinition-of-prctl_mm_map-structure.patch b/meta/recipes-core/systemd/systemd/0011-avoid-redefinition-of-prctl_mm_map-structure.patch
index ad8888895f..1ad9a302ff 100644
--- a/meta/recipes-core/systemd/systemd/0011-avoid-redefinition-of-prctl_mm_map-structure.patch
+++ b/meta/recipes-core/systemd/systemd/0011-avoid-redefinition-of-prctl_mm_map-structure.patch
@@ -1,4 +1,4 @@
-From 3b1639c7052d9d574dd05d268364e7919b6f2580 Mon Sep 17 00:00:00 2001
+From 8b76e1f027d73e26cfc8e13bd49f43197dbb9004 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:44:54 +0800
 Subject: [PATCH] avoid redefinition of prctl_mm_map structure
diff --git a/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-writing-files.patch
index f0eafd6fea..3ff247debb 100644
--- a/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-writing-files.patch
@@ -1,4 +1,4 @@
-From c1a375d93edbfaf3f64bec88c75cfcf436d4ba05 Mon Sep 17 00:00:00 2001
+From 9686b8c52bd9e532ebe687dd31352d884873e0a4 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Fri, 1 Mar 2019 15:22:15 +0800
 Subject: [PATCH] do not disable buffer in writing files
@@ -188,10 +188,10 @@ index d21f3f79ff..258607cc7e 100644
                          log_warning_errno(r, "Failed to flush binfmt_misc rules, ignoring: %m");
                  else
 diff --git a/src/core/cgroup.c b/src/core/cgroup.c
-index 61539afdbf..77e2b35daf 100644
+index d398655b0a..9558f38a72 100644
 --- a/src/core/cgroup.c
 +++ b/src/core/cgroup.c
-@@ -4581,7 +4581,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAction action) {
+@@ -4589,7 +4589,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAction action) {
                          u->freezer_state = FREEZER_THAWING;
          }
  
@@ -201,7 +201,7 @@ index 61539afdbf..77e2b35daf 100644
                  return r;
  
 diff --git a/src/core/main.c b/src/core/main.c
-index 8373a156cb..33e866942c 100644
+index 364dc895d1..d28ec42030 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
 @@ -1683,7 +1683,7 @@ static void initialize_core_pattern(bool skip_setup) {
diff --git a/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usage.patch b/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usage.patch
index 5427671553..a92d4db101 100644
--- a/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usage.patch
+++ b/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usage.patch
@@ -1,4 +1,4 @@
-From b10a273f5e26536068a90f961c2a7a6c6528083b Mon Sep 17 00:00:00 2001
+From 385fbcc3cec50b995299e25f913d9683ddf51174 Mon Sep 17 00:00:00 2001
 From: Scott Murray <scott.murray@konsulko.com>
 Date: Fri, 13 Sep 2019 19:26:27 -0400
 Subject: [PATCH] Handle __cpu_mask usage
diff --git a/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch b/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch
index 679b42ff95..f84f289c2f 100644
--- a/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch
@@ -1,4 +1,4 @@
-From c55dd0f9e1ea05749d0a54082daa69729ee946af Mon Sep 17 00:00:00 2001
+From bc62e5e507cc3f10fde7d35d16059a06a78757b6 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Tue, 10 Mar 2020 11:05:20 +0000
 Subject: [PATCH] Handle missing gshadow
diff --git a/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
index 2bd683785d..c1297f27dd 100644
--- a/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
@@ -1,4 +1,4 @@
-From 4733cb758285ec7f63e834894aa8f09d9bc77ad5 Mon Sep 17 00:00:00 2001
+From 79f2f3e90229f4812d93c6965cb67385642dfcc4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 12 Apr 2021 23:44:53 -0700
 Subject: [PATCH] missing_syscall.h: Define MIPS ABI defines for musl
diff --git a/meta/recipes-core/systemd/systemd/0016-pass-correct-parameters-to-getdents64.patch b/meta/recipes-core/systemd/systemd/0016-pass-correct-parameters-to-getdents64.patch
index 3e359d976a..d932d7cc76 100644
--- a/meta/recipes-core/systemd/systemd/0016-pass-correct-parameters-to-getdents64.patch
+++ b/meta/recipes-core/systemd/systemd/0016-pass-correct-parameters-to-getdents64.patch
@@ -1,4 +1,4 @@
-From 1118d270cf2cd7c6cb99eb40ab42c3d07b20476c Mon Sep 17 00:00:00 2001
+From a8e07d87adfeb1c72c6eaf5402db465a78e08ee6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Jan 2022 15:15:11 -0800
 Subject: [PATCH] pass correct parameters to getdents64
diff --git a/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-headers.patch b/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-headers.patch
index 6ae6cdfe54..6a2dcc355d 100644
--- a/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-headers.patch
+++ b/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-headers.patch
@@ -1,4 +1,4 @@
-From ab78d7938e732125012f8276e357e8f6d4a51476 Mon Sep 17 00:00:00 2001
+From 5da745dc6f60f6fac65371a60eee7cecaf575eae Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Jan 2022 22:19:37 -0800
 Subject: [PATCH] Adjust for musl headers
diff --git a/meta/recipes-core/systemd/systemd/0018-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch b/meta/recipes-core/systemd/systemd/0018-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
index 5d74d08201..89ef33c156 100644
--- a/meta/recipes-core/systemd/systemd/0018-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
+++ b/meta/recipes-core/systemd/systemd/0018-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
@@ -1,4 +1,4 @@
-From 20cf3569dff21f5c4e46855c3956606fa0141710 Mon Sep 17 00:00:00 2001
+From 1c5c9714a2a9bc651687bf2c583019c52ed93ac4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 8 Nov 2022 13:31:34 -0800
 Subject: [PATCH] test-bus-error: strerror() is assumed to be GNU specific
diff --git a/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-portable-for-musl.patch b/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-portable-for-musl.patch
index a20e21ee08..7911add5ea 100644
--- a/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-portable-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-portable-for-musl.patch
@@ -1,4 +1,4 @@
-From 5e3e71f93adf5bdbfd470bcd93320dab314dc3ef Mon Sep 17 00:00:00 2001
+From 43f56ac05ff4b9c7774b6f580612f2a7896a4885 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 23 Jan 2023 23:39:46 -0800
 Subject: [PATCH] errno-util: Make STRERROR portable for musl
diff --git a/meta/recipes-core/systemd/systemd/0020-sd-event-Make-malloc_trim-conditional-on-glibc.patch b/meta/recipes-core/systemd/systemd/0020-sd-event-Make-malloc_trim-conditional-on-glibc.patch
index bdcff34f2c..be0a0da013 100644
--- a/meta/recipes-core/systemd/systemd/0020-sd-event-Make-malloc_trim-conditional-on-glibc.patch
+++ b/meta/recipes-core/systemd/systemd/0020-sd-event-Make-malloc_trim-conditional-on-glibc.patch
@@ -1,4 +1,4 @@
-From 18201d3350b443c79cc85274f3944bf64de33da0 Mon Sep 17 00:00:00 2001
+From cda1cc94bd81c8ff9135255895a414fb938e2c79 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 2 Aug 2023 12:06:27 -0700
 Subject: [PATCH] sd-event: Make malloc_trim() conditional on glibc
diff --git a/meta/recipes-core/systemd/systemd/0021-shared-Do-not-use-malloc_info-on-musl.patch b/meta/recipes-core/systemd/systemd/0021-shared-Do-not-use-malloc_info-on-musl.patch
index 451511be16..9aa08e59cd 100644
--- a/meta/recipes-core/systemd/systemd/0021-shared-Do-not-use-malloc_info-on-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0021-shared-Do-not-use-malloc_info-on-musl.patch
@@ -1,4 +1,4 @@
-From 96c3d0d3a2359dd248685c2ede876d66c3faa3f9 Mon Sep 17 00:00:00 2001
+From 2913e608d6e91c8037d698534f72970b4c365d8f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 2 Aug 2023 12:20:40 -0700
 Subject: [PATCH] shared: Do not use malloc_info on musl
diff --git a/meta/recipes-core/systemd/systemd/0022-avoid-missing-LOCK_EX-declaration.patch b/meta/recipes-core/systemd/systemd/0022-avoid-missing-LOCK_EX-declaration.patch
index cd22adf0e5..e0a342355f 100644
--- a/meta/recipes-core/systemd/systemd/0022-avoid-missing-LOCK_EX-declaration.patch
+++ b/meta/recipes-core/systemd/systemd/0022-avoid-missing-LOCK_EX-declaration.patch
@@ -1,4 +1,4 @@
-From f3bc7816d9cca9963a2737857763ee76e300a232 Mon Sep 17 00:00:00 2001
+From 9d151b5bb3105fb21d55a301def3d97b5a314580 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 2 Jan 2024 11:03:27 +0800
 Subject: [PATCH] avoid missing LOCK_EX declaration
@@ -15,7 +15,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  2 files changed, 2 insertions(+)
 
 diff --git a/src/core/exec-invoke.c b/src/core/exec-invoke.c
-index 22bc8d10c1..9bced8f420 100644
+index 9d27280ed0..569311422d 100644
 --- a/src/core/exec-invoke.c
 +++ b/src/core/exec-invoke.c
 @@ -5,6 +5,7 @@
diff --git a/meta/recipes-core/systemd/systemd_255.18.bb b/meta/recipes-core/systemd/systemd_v255.21.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_255.18.bb
rename to meta/recipes-core/systemd/systemd_v255.21.bb
-- 
2.43.0


