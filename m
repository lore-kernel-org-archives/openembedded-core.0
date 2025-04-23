Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20550C369D8
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 13:21:07 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.8578.1745414457146295987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 06:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fRARilkj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so5657899b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 06:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745414456; x=1746019256; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/hcdFcJyWaR1FWWMUcKcg92Q7A+HKs85PvLp6/QSeg=;
        b=fRARilkj0oZYQY9JJI9If23yo0oZkcEtPtSMS9GHZLN+ZhsiR743fPlLrFuF/UyZzA
         idcLUdbxbigY+2bHdLWqwhBFZtBWbVIh0Jph9Cr8Ug+bA56l1uN2FKPCpxMrEqcwkyxK
         eLh860m9BeDrKcQl3w85+fv/qBrzpKLzmD3Ii/QrwWvpIg9AmaJ82BHZs6L7NujQcSFJ
         XEhyKxwZeNjY1+PUqb9MdFqlGPIRhzCUkt3JGnBQleF82gTViswxI6IHdBSD4+ZR7L5w
         b/YpD9hQKfBJ25E6fadQfQmJBtGCkVm64uVHSLnw48sPypMD5fiOYpq63mHbcTYBzjJE
         1kIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745414456; x=1746019256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/hcdFcJyWaR1FWWMUcKcg92Q7A+HKs85PvLp6/QSeg=;
        b=AXGRvpbZHxEL6awkP3pFTZrqeBwn0snnDQMO8lqXX0FbCjsHrx9cF4pWdBFf0Pob7o
         YqIfMZBtuSgAu7D4pciWICNwEZ/m77gQR/W1lTkckge2Ua21R7Z/gSa+FuzSLb7lkS+S
         YZJRHKppcA7eHRDwvTwP4PqRnPixs7TMna/nijIMMZUcIrcggnvub3fijU0JTc9oC1lV
         gIsAPb3cqoTckk1bnJ5XYqaVyUZPTPjHmL3ogVbqFS28vA+e72wK+gSJt7/PdpMjmnV2
         DoA2PAM6eaIn8JhWv6zw7x3ig3PqvIPy9vCGK2FcqbreoeWsxdtFPnakQ4gqygziD1HV
         j3dw==
X-Gm-Message-State: AOJu0YxqHl0mBkIpEl7j7OqQeurSNbUgy31j0kdJjSK+y6MTOW+kSX0/
	BwjjIejaAgmnC46tm6cT5pN9xKa9PKrSA5jAB3En4/05ILQle9rL3xVCUpjkatSf1DdFuE3dq0E
	n
X-Gm-Gg: ASbGncsjuRgnzkNZGScJMqzBN1GnjNm0+vkKPMhmlu5YBvXIuz+y6BFeEmB3avVcSSs
	cLOzXDkuTEVEmaxD2FYyHq3pDjEJSwmZBF7XFSBq5YQ3h5FjkEXqKysKj3ImOew1Q4idDpzLxik
	7WkuXduQ6rwjnceW+YW7X7q2IkzPnUVCRNPxY1w5vJTlrZ0G06YsmNt+EPjkIXo7KnVhuwRnOKv
	LNHDNJoALSZJwUaz9c2UKJ29a1XccQAr/Nb/ByNAXUs4ktxIqgsIPJ3BRwZdsva1fj3RCcl3fkb
	96feG0jj/hsYndT9UqAbwF5GNYfgPag=
X-Google-Smtp-Source: AGHT+IGACcprdXNYW9ciUgOMkQJHpF6/vpne0OORHHWINMfKiEXR64Sg13L1DUoXigK3vueMkQB7RQ==
X-Received: by 2002:a05:6a00:2182:b0:732:5611:cbb5 with SMTP id d2e1a72fcca58-73dc14cca88mr25674443b3a.11.1745414456117;
        Wed, 23 Apr 2025 06:20:56 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:371e:10cb:f3ce:33f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e510bsm10898037b3a.66.2025.04.23.06.20.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:20:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/14] systemd: upgrade 255.17 -> 255.18
Date: Wed, 23 Apr 2025 06:20:23 -0700
Message-ID: <121e1fb42c4c909115bc550585b2ebcb3a13e0a5.1745356684.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745356684.git.steve@sakoman.com>
References: <cover.1745356684.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 13:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215305

From: Guðni Már Gilbert <gudni.m.g@gmail.com>

The update includes 82 commits. Full list of changes can be found on Github [1]

All patches were refreshed with devtool.

[1] systemd/systemd-stable@v255.17...v255.18

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...oot-native_255.17.bb => systemd-boot-native_255.18.bb} | 0
 .../{systemd-boot_255.17.bb => systemd-boot_255.18.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                     | 2 +-
 .../systemd/0001-missing_type.h-add-comparison_fn_t.patch | 2 +-
 ...-add-fallback-parse_printf_format-implementation.patch | 4 ++--
 ...mt-Don-t-install-dependency-links-at-install-tim.patch | 2 +-
 ...3-src-basic-missing.h-check-for-missing-strndupa.patch | 6 +++---
 ...t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch | 4 ++--
 .../systemd/0005-add-missing-FTW_-macros-for-musl.patch   | 2 +-
 .../systemd/0006-Use-uintmax_t-for-handling-rlim_t.patch  | 2 +-
 ...don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch | 2 +-
 ...ne-glibc-compatible-basename-for-non-glibc-syste.patch | 2 +-
 .../0008-implment-systemd-sysv-install-for-OE.patch       | 2 +-
 ...ot-disable-buffering-when-writing-to-oom_score_a.patch | 4 ++--
 ...inguish-XSI-compliant-strerror_r-from-GNU-specif.patch | 2 +-
 ...011-avoid-redefinition-of-prctl_mm_map-structure.patch | 2 +-
 .../0012-do-not-disable-buffer-in-writing-files.patch     | 2 +-
 .../systemd/systemd/0013-Handle-__cpu_mask-usage.patch    | 2 +-
 .../systemd/systemd/0014-Handle-missing-gshadow.patch     | 8 ++++----
 ...ssing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch | 2 +-
 .../0016-pass-correct-parameters-to-getdents64.patch      | 4 ++--
 .../systemd/systemd/0017-Adjust-for-musl-headers.patch    | 2 +-
 ...-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch | 2 +-
 .../0019-errno-util-Make-STRERROR-portable-for-musl.patch | 2 +-
 ...0-sd-event-Make-malloc_trim-conditional-on-glibc.patch | 2 +-
 .../0021-shared-Do-not-use-malloc_info-on-musl.patch      | 2 +-
 .../systemd/0022-avoid-missing-LOCK_EX-declaration.patch  | 2 +-
 .../systemd/{systemd_255.17.bb => systemd_255.18.bb}      | 0
 28 files changed, 34 insertions(+), 34 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_255.17.bb => systemd-boot-native_255.18.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_255.17.bb => systemd-boot_255.18.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_255.17.bb => systemd_255.18.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_255.17.bb b/meta/recipes-core/systemd/systemd-boot-native_255.18.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_255.17.bb
rename to meta/recipes-core/systemd/systemd-boot-native_255.18.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_255.17.bb b/meta/recipes-core/systemd/systemd-boot_255.18.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_255.17.bb
rename to meta/recipes-core/systemd/systemd-boot_255.18.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index c359d77e9d..8e134d8c86 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "fb92304041cd203d2ca84cc28721dea5e1355c4e"
+SRCREV = "20415d357fb0e253df7444019a47674fac4ed1d6"
 SRCBRANCH = "v255-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd/0001-missing_type.h-add-comparison_fn_t.patch b/meta/recipes-core/systemd/systemd/0001-missing_type.h-add-comparison_fn_t.patch
index 9e9ccf51c8..d2ffdd8de4 100644
--- a/meta/recipes-core/systemd/systemd/0001-missing_type.h-add-comparison_fn_t.patch
+++ b/meta/recipes-core/systemd/systemd/0001-missing_type.h-add-comparison_fn_t.patch
@@ -1,4 +1,4 @@
-From abbda6d89c0b850c0adeebc3e210d9b255072a40 Mon Sep 17 00:00:00 2001
+From 7bbb54406dd77c358eab9df08b100ee85e176052 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:55:12 +0800
 Subject: [PATCH] missing_type.h: add comparison_fn_t
diff --git a/meta/recipes-core/systemd/systemd/0002-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0002-add-fallback-parse_printf_format-implementation.patch
index c91f24b026..df9e978e55 100644
--- a/meta/recipes-core/systemd/systemd/0002-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0002-add-fallback-parse_printf_format-implementation.patch
@@ -1,4 +1,4 @@
-From adaa70c17daedd8d81525d080fda8a1e22efe3a4 Mon Sep 17 00:00:00 2001
+From d0b08484a6c3113b6209d8f8e1dc1186a6427b99 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sat, 22 May 2021 20:26:24 +0200
 Subject: [PATCH] add fallback parse_printf_format implementation
@@ -22,7 +22,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  create mode 100644 src/basic/parse-printf-format.h
 
 diff --git a/meson.build b/meson.build
-index d5109b0d00..ccde927cf3 100644
+index 8c16c1c5c0..408d2ab80a 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -732,6 +732,7 @@ endif
diff --git a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index 11e9be6059..784f0898c0 100644
--- a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -1,4 +1,4 @@
-From 95bf78fe7d7b7d41ff43e761bb78adfb4fdb9303 Mon Sep 17 00:00:00 2001
+From 7e4fae68909ce4932e073dd060e22581edc39ad2 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 21 Feb 2019 16:23:24 +0800
 Subject: [PATCH] binfmt: Don't install dependency links at install time for
diff --git a/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-check-for-missing-strndupa.patch
index 0b75896b00..e46b4386aa 100644
--- a/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -1,4 +1,4 @@
-From 76f4749e3a583ad3c924bdff4a6bde967c674ed7 Mon Sep 17 00:00:00 2001
+From ca0b48676132744b78d99ee3ec2d33f11bb73c28 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:18:21 +0800
 Subject: [PATCH] src/basic/missing.h: check for missing strndupa
@@ -80,7 +80,7 @@ Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
  51 files changed, 62 insertions(+)
 
 diff --git a/meson.build b/meson.build
-index 216a8cbc91..d5109b0d00 100644
+index 408d2ab80a..2c00b7047f 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -572,6 +572,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
@@ -328,7 +328,7 @@ index b8e3f7aadd..8ce8ca68d8 100644
  #if HAVE_KMOD
  #include "module-util.h"
 diff --git a/src/core/service.c b/src/core/service.c
-index d3ea8a9c3c..c3441f785c 100644
+index d0353ae461..7f98f5ee45 100644
 --- a/src/core/service.c
 +++ b/src/core/service.c
 @@ -45,6 +45,7 @@
diff --git a/meta/recipes-core/systemd/systemd/0004-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd/0004-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
index 96872ac150..43ba526792 100644
--- a/meta/recipes-core/systemd/systemd/0004-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
+++ b/meta/recipes-core/systemd/systemd/0004-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
@@ -1,4 +1,4 @@
-From e9110b095a5728762b3bd3abdec2a99b4ce01b5e Mon Sep 17 00:00:00 2001
+From 3ea9cc03431c93c86cf0ca63ad04219af221a2d0 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:56:21 +0800
 Subject: [PATCH] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not defined
@@ -114,7 +114,7 @@ index 9b3e73cce0..3790ba3be5 100644
  
          (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
 diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
-index f4c8ebc27f..e07ad66c65 100644
+index d22fa3b3c7..3471f98add 100644
 --- a/src/tmpfiles/tmpfiles.c
 +++ b/src/tmpfiles/tmpfiles.c
 @@ -73,6 +73,12 @@
diff --git a/meta/recipes-core/systemd/systemd/0005-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0005-add-missing-FTW_-macros-for-musl.patch
index 936183f238..c25ccde9e2 100644
--- a/meta/recipes-core/systemd/systemd/0005-add-missing-FTW_-macros-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0005-add-missing-FTW_-macros-for-musl.patch
@@ -1,4 +1,4 @@
-From 1eeac3e8ce96ad5da381555e93a57330cb8a5d48 Mon Sep 17 00:00:00 2001
+From 885a6880ad1b687e3fbf1b9f35e218bee1fcc835 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:00:06 +0800
 Subject: [PATCH] add missing FTW_ macros for musl
diff --git a/meta/recipes-core/systemd/systemd/0006-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0006-Use-uintmax_t-for-handling-rlim_t.patch
index 34d62c9e32..13c155745a 100644
--- a/meta/recipes-core/systemd/systemd/0006-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0006-Use-uintmax_t-for-handling-rlim_t.patch
@@ -1,4 +1,4 @@
-From fd2bb25921040fc5faed3a4aae0bd9e03f8f4742 Mon Sep 17 00:00:00 2001
+From 646c3ced29922065eed64ac9b23af8276e989608 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:12:41 +0800
 Subject: [PATCH] Use uintmax_t for handling rlim_t
diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0007-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
index 7cc8002a90..55405c5d0b 100644
--- a/meta/recipes-core/systemd/systemd/0007-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
+++ b/meta/recipes-core/systemd/systemd/0007-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
@@ -1,4 +1,4 @@
-From fde97394bf1a2faffa420afb098af61676033640 Mon Sep 17 00:00:00 2001
+From f772369a2519b378c09bb89bd48c3743a62404e3 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 10 Oct 2017 14:33:30 -0700
 Subject: [PATCH] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
diff --git a/meta/recipes-core/systemd/systemd/0008-Define-glibc-compatible-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd/0008-Define-glibc-compatible-basename-for-non-glibc-syste.patch
index 5579dc3dcc..6005b621ee 100644
--- a/meta/recipes-core/systemd/systemd/0008-Define-glibc-compatible-basename-for-non-glibc-syste.patch
+++ b/meta/recipes-core/systemd/systemd/0008-Define-glibc-compatible-basename-for-non-glibc-syste.patch
@@ -1,4 +1,4 @@
-From e2e1fee9fd5635420408777524dd418ce10dddc8 Mon Sep 17 00:00:00 2001
+From 45b1226ddbd981798e0448da41ddc4901e246b45 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 May 2018 08:36:44 -0700
 Subject: [PATCH] Define glibc compatible basename() for non-glibc systems
diff --git a/meta/recipes-core/systemd/systemd/0008-implment-systemd-sysv-install-for-OE.patch b/meta/recipes-core/systemd/systemd/0008-implment-systemd-sysv-install-for-OE.patch
index 2151d51af2..d43eaeff7a 100644
--- a/meta/recipes-core/systemd/systemd/0008-implment-systemd-sysv-install-for-OE.patch
+++ b/meta/recipes-core/systemd/systemd/0008-implment-systemd-sysv-install-for-OE.patch
@@ -1,4 +1,4 @@
-From 2b40558d201b73962077d0cedef820dfe95395c7 Mon Sep 17 00:00:00 2001
+From abca5814cb0b5b98a1e7af829cc166e76c524f1a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 5 Sep 2015 06:31:47 +0000
 Subject: [PATCH] implment systemd-sysv-install for OE
diff --git a/meta/recipes-core/systemd/systemd/0009-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0009-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
index 6586cbb72c..3e557b764f 100644
--- a/meta/recipes-core/systemd/systemd/0009-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0009-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
@@ -1,4 +1,4 @@
-From b783adf25c5619931189b4474d389a808e7845d6 Mon Sep 17 00:00:00 2001
+From 8d61cecff3ba0687ad2c10aacb7d2aee7cb3fa79 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jul 2018 15:00:44 +0800
 Subject: [PATCH] Do not disable buffering when writing to oom_score_adj
@@ -24,7 +24,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index 1447f65399..dcbc7ac973 100644
+index bbce0ea985..d2f7c27cea 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
 @@ -1716,7 +1716,7 @@ int set_oom_score_adjust(int value) {
diff --git a/meta/recipes-core/systemd/systemd/0010-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd/0010-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
index 79db096b34..d4b67d15f4 100644
--- a/meta/recipes-core/systemd/systemd/0010-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
+++ b/meta/recipes-core/systemd/systemd/0010-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
@@ -1,4 +1,4 @@
-From ac820a745c905e0045ce5cc41da7eaa802078b1b Mon Sep 17 00:00:00 2001
+From 2180b639665bd314905ef058dee9a5e4a534333e Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 10 Jul 2018 15:40:17 +0800
 Subject: [PATCH] distinguish XSI-compliant strerror_r from GNU-specifi
diff --git a/meta/recipes-core/systemd/systemd/0011-avoid-redefinition-of-prctl_mm_map-structure.patch b/meta/recipes-core/systemd/systemd/0011-avoid-redefinition-of-prctl_mm_map-structure.patch
index 67fd4921ba..ad8888895f 100644
--- a/meta/recipes-core/systemd/systemd/0011-avoid-redefinition-of-prctl_mm_map-structure.patch
+++ b/meta/recipes-core/systemd/systemd/0011-avoid-redefinition-of-prctl_mm_map-structure.patch
@@ -1,4 +1,4 @@
-From 4a2472cae75720b3129260c8789a87af26ca443a Mon Sep 17 00:00:00 2001
+From 3b1639c7052d9d574dd05d268364e7919b6f2580 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:44:54 +0800
 Subject: [PATCH] avoid redefinition of prctl_mm_map structure
diff --git a/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-writing-files.patch
index e735a00bb9..f0eafd6fea 100644
--- a/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-writing-files.patch
@@ -1,4 +1,4 @@
-From 8072fee9fcb0e9a8c73de56f38468e7287ac4961 Mon Sep 17 00:00:00 2001
+From c1a375d93edbfaf3f64bec88c75cfcf436d4ba05 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Fri, 1 Mar 2019 15:22:15 +0800
 Subject: [PATCH] do not disable buffer in writing files
diff --git a/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usage.patch b/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usage.patch
index e995da81ff..5427671553 100644
--- a/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usage.patch
+++ b/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usage.patch
@@ -1,4 +1,4 @@
-From 4b46cf08f269b69d5336bf3d8f617a288bd65ea8 Mon Sep 17 00:00:00 2001
+From b10a273f5e26536068a90f961c2a7a6c6528083b Mon Sep 17 00:00:00 2001
 From: Scott Murray <scott.murray@konsulko.com>
 Date: Fri, 13 Sep 2019 19:26:27 -0400
 Subject: [PATCH] Handle __cpu_mask usage
diff --git a/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch b/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch
index 8cc9c1ba0c..679b42ff95 100644
--- a/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch
@@ -1,4 +1,4 @@
-From 76a0eea205c943a0e1fd0db7336cabb98d5c6c8c Mon Sep 17 00:00:00 2001
+From c55dd0f9e1ea05749d0a54082daa69729ee946af Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Tue, 10 Mar 2020 11:05:20 +0000
 Subject: [PATCH] Handle missing gshadow
@@ -138,10 +138,10 @@ index 22ab04d6ee..4e52e7a911 100644
  #include <shadow.h>
  
 diff --git a/src/shared/userdb.c b/src/shared/userdb.c
-index 98066bb81d..47dc4dd420 100644
+index 7469768233..556e6b84e6 100644
 --- a/src/shared/userdb.c
 +++ b/src/shared/userdb.c
-@@ -1038,13 +1038,15 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
+@@ -1039,13 +1039,15 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
                  if (gr) {
                          _cleanup_free_ char *buffer = NULL;
                          bool incomplete = false;
@@ -158,7 +158,7 @@ index 98066bb81d..47dc4dd420 100644
                          if (!FLAGS_SET(iterator->flags, USERDB_SUPPRESS_SHADOW)) {
                                  r = nss_sgrp_for_group(gr, &sgrp, &buffer);
                                  if (r < 0) {
-@@ -1057,6 +1059,9 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
+@@ -1058,6 +1060,9 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
                          }
  
                          r = nss_group_to_group_record(gr, r >= 0 ? &sgrp : NULL, ret);
diff --git a/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
index 915a7bb0be..2bd683785d 100644
--- a/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
@@ -1,4 +1,4 @@
-From bd309e23e3e5b7bff8cd4b6778396d921438295e Mon Sep 17 00:00:00 2001
+From 4733cb758285ec7f63e834894aa8f09d9bc77ad5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 12 Apr 2021 23:44:53 -0700
 Subject: [PATCH] missing_syscall.h: Define MIPS ABI defines for musl
diff --git a/meta/recipes-core/systemd/systemd/0016-pass-correct-parameters-to-getdents64.patch b/meta/recipes-core/systemd/systemd/0016-pass-correct-parameters-to-getdents64.patch
index a9961b515d..3e359d976a 100644
--- a/meta/recipes-core/systemd/systemd/0016-pass-correct-parameters-to-getdents64.patch
+++ b/meta/recipes-core/systemd/systemd/0016-pass-correct-parameters-to-getdents64.patch
@@ -1,4 +1,4 @@
-From 81eb93545808124b3c1abbef2e5d71ad28a1a870 Mon Sep 17 00:00:00 2001
+From 1118d270cf2cd7c6cb99eb40ab42c3d07b20476c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Jan 2022 15:15:11 -0800
 Subject: [PATCH] pass correct parameters to getdents64
@@ -20,7 +20,7 @@ Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/basic/recurse-dir.c b/src/basic/recurse-dir.c
-index 5e98b7a5d8..aef065047b 100644
+index d648862dbc..a1fea243e8 100644
 --- a/src/basic/recurse-dir.c
 +++ b/src/basic/recurse-dir.c
 @@ -55,7 +55,7 @@ int readdir_all(int dir_fd,
diff --git a/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-headers.patch b/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-headers.patch
index d8557bd3f3..6ae6cdfe54 100644
--- a/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-headers.patch
+++ b/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-headers.patch
@@ -1,4 +1,4 @@
-From d09615e61bc779228c996f024ec48c7e21eb64c9 Mon Sep 17 00:00:00 2001
+From ab78d7938e732125012f8276e357e8f6d4a51476 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Jan 2022 22:19:37 -0800
 Subject: [PATCH] Adjust for musl headers
diff --git a/meta/recipes-core/systemd/systemd/0018-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch b/meta/recipes-core/systemd/systemd/0018-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
index 0fd55eb0ea..5d74d08201 100644
--- a/meta/recipes-core/systemd/systemd/0018-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
+++ b/meta/recipes-core/systemd/systemd/0018-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
@@ -1,4 +1,4 @@
-From c0c90f4e2381091830203e1286115b0a30e059d3 Mon Sep 17 00:00:00 2001
+From 20cf3569dff21f5c4e46855c3956606fa0141710 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 8 Nov 2022 13:31:34 -0800
 Subject: [PATCH] test-bus-error: strerror() is assumed to be GNU specific
diff --git a/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-portable-for-musl.patch b/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-portable-for-musl.patch
index e0228d6ad8..a20e21ee08 100644
--- a/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-portable-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-portable-for-musl.patch
@@ -1,4 +1,4 @@
-From 6ad0fb9dcd6940a9a24e515b61d4b6245c3b1e98 Mon Sep 17 00:00:00 2001
+From 5e3e71f93adf5bdbfd470bcd93320dab314dc3ef Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 23 Jan 2023 23:39:46 -0800
 Subject: [PATCH] errno-util: Make STRERROR portable for musl
diff --git a/meta/recipes-core/systemd/systemd/0020-sd-event-Make-malloc_trim-conditional-on-glibc.patch b/meta/recipes-core/systemd/systemd/0020-sd-event-Make-malloc_trim-conditional-on-glibc.patch
index 45284e89e1..bdcff34f2c 100644
--- a/meta/recipes-core/systemd/systemd/0020-sd-event-Make-malloc_trim-conditional-on-glibc.patch
+++ b/meta/recipes-core/systemd/systemd/0020-sd-event-Make-malloc_trim-conditional-on-glibc.patch
@@ -1,4 +1,4 @@
-From 70abcbd93b8854c4dd0ae88b82f394d325b2a365 Mon Sep 17 00:00:00 2001
+From 18201d3350b443c79cc85274f3944bf64de33da0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 2 Aug 2023 12:06:27 -0700
 Subject: [PATCH] sd-event: Make malloc_trim() conditional on glibc
diff --git a/meta/recipes-core/systemd/systemd/0021-shared-Do-not-use-malloc_info-on-musl.patch b/meta/recipes-core/systemd/systemd/0021-shared-Do-not-use-malloc_info-on-musl.patch
index 691bf89afd..451511be16 100644
--- a/meta/recipes-core/systemd/systemd/0021-shared-Do-not-use-malloc_info-on-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0021-shared-Do-not-use-malloc_info-on-musl.patch
@@ -1,4 +1,4 @@
-From c85009340b3a58686390ee70671334593e348a10 Mon Sep 17 00:00:00 2001
+From 96c3d0d3a2359dd248685c2ede876d66c3faa3f9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 2 Aug 2023 12:20:40 -0700
 Subject: [PATCH] shared: Do not use malloc_info on musl
diff --git a/meta/recipes-core/systemd/systemd/0022-avoid-missing-LOCK_EX-declaration.patch b/meta/recipes-core/systemd/systemd/0022-avoid-missing-LOCK_EX-declaration.patch
index 6b3aa607b4..cd22adf0e5 100644
--- a/meta/recipes-core/systemd/systemd/0022-avoid-missing-LOCK_EX-declaration.patch
+++ b/meta/recipes-core/systemd/systemd/0022-avoid-missing-LOCK_EX-declaration.patch
@@ -1,4 +1,4 @@
-From 45478696b3a3eb1fbcd6c5cd4899bb426230c2e1 Mon Sep 17 00:00:00 2001
+From f3bc7816d9cca9963a2737857763ee76e300a232 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 2 Jan 2024 11:03:27 +0800
 Subject: [PATCH] avoid missing LOCK_EX declaration
diff --git a/meta/recipes-core/systemd/systemd_255.17.bb b/meta/recipes-core/systemd/systemd_255.18.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_255.17.bb
rename to meta/recipes-core/systemd/systemd_255.18.bb
-- 
2.43.0


