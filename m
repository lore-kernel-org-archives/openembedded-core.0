Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A328EC282C9
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 17:40:21 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.17125.1740678017815822737
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 09:40:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IV/1fbRz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2234e5347e2so25793095ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 09:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740678017; x=1741282817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXXayFkkYgv+6HPyJl+I/yQwv/aTRrJYpuAIlvj/BQs=;
        b=IV/1fbRzRbYUnbUyZbjTjhEiCAFRhRrjA0ySKnxZG3fyB5CZizJX0gGI2pT/NgVHWO
         v0OdaAI3sMSFnY579sy9DEYyuYJluvG4KcMcaIXISUZ+vIWC5k1J5FnuICSp0N0q5xzU
         NHGJIAd27yLDfaFLINYZ7pOSg8Ts+1FzBDDQIxnaEAjG5Nh+BNl+RCXcPlWikLBrlo3x
         fg+9kfO3YmBXDy6oafdRfYEHGfJU//1bZSaSNgBNZJ5uEyZ6nqv2edUzbqI/XXZ+S3rO
         He0RjCqodklvtV/vYxi9HHiUAROqwMqWeISgidcWzsnQQidl6crtDcJuchyAA2wfpN9y
         KWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740678017; x=1741282817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXXayFkkYgv+6HPyJl+I/yQwv/aTRrJYpuAIlvj/BQs=;
        b=PRCyJZCFXA1USS6IO/MCBVG18CX4g55zk43eGLt+uqbWEaJFeKBEgm6+NRJYh3dnUO
         xw9DBEldBMyhd33JkmJ81ix4IWYLSbB00bgl/GzJN9CK1Bf5QaDVxurazSpZQoiZqllu
         5aaU4+laesGDgx73rzSlWaXSyPHRhPweJ/3wtBeHx+ZD/Ewb0Kxdj3vxcpN9LXrXh2Xj
         +cglpobx5brAWo/s16OIfR7v+bDigABHcPutsqjTR6tccZtJZ86AKduNZ1l7T2WzfYBH
         fVyAIuvhpRTK7Cs1UcWzoJzqlVZ53b6RgQ6gKwixTZRUNLA1N3stRNR7yonU1mreDm5c
         BqfA==
X-Gm-Message-State: AOJu0YzLvoRiU//L/N7kYwtIDHXsjgA9avpG6lRKYniEzyyvoVdsyF6G
	20fzaNVDfJySYswWiuC5PLnPuVQyh9rX0s3CGRC6IyX9lYkHsF81lzQq8jWGIQpdNoYBtX8JI/W
	B
X-Gm-Gg: ASbGncsTRVirtVTvsngZzH1YlO1kjr5B5pDV7PLLBKzRb2Yfe5ZMONHH/ma+wo8C1Eo
	MXeIaRkMIkEvMq8AlbUXH54nnR6e+XnUMg3b1xuoDW/STSnJJWei7EVhvRa7yMZXlBM2jdmFLEG
	G6onNPsdK4Au7zTz5yT+3O0dGvqeF2jp/xZzFQEzfwngHO+3aguD44FiYHUlGVPLK5TfhV9XoIf
	n3vMfpr1TgzARTPyy4bxRx0h69U1M7fbXnjr1+ecanJEGrhy4JDDGmuMfs268z4SlwugpyYfec1
	86Zm9g99Y3EuqZ3qig==
X-Google-Smtp-Source: AGHT+IGWHAuy5skC1QCtBk3Xk+hVwWqsvDILBJFER0HGG49PTVX4gIiIlGnlpmCuLAj+wM5JMx7ILQ==
X-Received: by 2002:a05:6a00:1a8f:b0:730:76a1:3935 with SMTP id d2e1a72fcca58-734ac37b211mr446929b3a.6.1740678016185;
        Thu, 27 Feb 2025 09:40:16 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:1dd4:58fa:4fa2:f901])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a00249c3sm1914727b3a.85.2025.02.27.09.40.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:40:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/15] systemd: upgrade 250.5 -> 250.14
Date: Thu, 27 Feb 2025 09:39:45 -0800
Message-ID: <371d030a665e3c963a586ab02d10f1f36b225435.1740677838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740677838.git.steve@sakoman.com>
References: <cover.1740677838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 17:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212032

From: Narpat Mali <narpat.falna@gmail.com>

Latest stable branch update which includes 396 commits and the full
list of changes can be found at:
https://github.com/systemd/systemd-stable/compare/v250.5...v250.14

All the patches were refreshed with devtool.

Backported this upstreamed patch to resolve the compile error while
building systemd with qemumips machine.
- 0001-core-fix-build-when-seccomp-is-off.patch

These 2 below patches were modified to resolve the merge conflicts
introduced by systemd v250.14 version:
1. 0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
- This patch was just adjusted based on the systemd v250.14 version.

2. 0001-pass-correct-parameters-to-getdents64.patch
- For this patch, there was a commit reverted as part of the v250.8 tag:
https://github.com/systemd/systemd-stable/commit/51089e007f2f45fc15e37e7a9dcf3045416e1239

These below 6 patches were dropped as systemd v250.14 already has
the changes:
- 0001-shared-json-allow-json_variant_dump-to-return-an-err.patch
- CVE-2022-3821.patch
- CVE-2022-4415-1.patch
- CVE-2022-4415-2.patch
- CVE-2022-45873.patch
- CVE-2023-7008.patch

Signed-off-by: Narpat Mali <narpat.falna@gmail.com>
Signed-off-by: Randy Macleod <randy.macleod@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...d-boot_250.5.bb => systemd-boot_250.14.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   2 +-
 .../0001-Adjust-for-musl-headers.patch        |  20 +-
 ...sysctl.d-binfmt.d-modules-load.d-to-.patch |  18 +-
 ...1-core-fix-build-when-seccomp-is-off.patch |  41 ++
 ...ass-correct-parameters-to-getdents64.patch |  49 ++-
 ...w-json_variant_dump-to-return-an-err.patch |  60 ---
 .../0002-Add-sys-stat.h-for-S_IFDIR.patch     |   6 +-
 ...3-missing_type.h-add-comparison_fn_t.patch |   6 +-
 ...k-parse_printf_format-implementation.patch |   6 +-
 ...missing.h-check-for-missing-strndupa.patch |  62 ++-
 ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |   8 +-
 ...008-add-missing-FTW_-macros-for-musl.patch |   4 +-
 ..._register_atfork-for-non-glibc-build.patch |   6 +-
 ...10-Use-uintmax_t-for-handling-rlim_t.patch |   6 +-
 ...sable-tests-for-missing-typedefs-in-.patch |   2 +-
 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |   4 +-
 ...patible-basename-for-non-glibc-syste.patch |   2 +-
 ...uffering-when-writing-to-oom_score_a.patch |   6 +-
 ...compliant-strerror_r-from-GNU-specif.patch |   2 +-
 ...definition-of-prctl_mm_map-structure.patch |   2 +-
 .../0021-test-json.c-define-M_PIl.patch       |   4 +-
 ...-not-disable-buffer-in-writing-files.patch |  38 +-
 .../0025-Handle-__cpu_mask-usage.patch        |   2 +-
 .../systemd/0026-Handle-missing-gshadow.patch |   4 +-
 ...l.h-Define-MIPS-ABI-defines-for-musl.patch |   4 +-
 .../systemd/systemd/CVE-2022-3821.patch       |  45 --
 .../systemd/systemd/CVE-2022-4415-1.patch     | 109 -----
 .../systemd/systemd/CVE-2022-4415-2.patch     | 391 ------------------
 .../systemd/systemd/CVE-2022-45873.patch      | 124 ------
 .../systemd/systemd/CVE-2023-7008.patch       |  40 --
 .../{systemd_250.5.bb => systemd_250.14.bb}   |   7 +-
 32 files changed, 187 insertions(+), 893 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_250.5.bb => systemd-boot_250.14.bb} (100%)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-core-fix-build-when-seccomp-is-off.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-shared-json-allow-json_variant_dump-to-return-an-err.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-3821.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-4415-1.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-4415-2.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-45873.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/CVE-2023-7008.patch
 rename meta/recipes-core/systemd/{systemd_250.5.bb => systemd_250.14.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd-boot_250.5.bb b/meta/recipes-core/systemd/systemd-boot_250.14.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_250.5.bb
rename to meta/recipes-core/systemd/systemd-boot_250.14.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 309105290f..86ae4793c3 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "4a31fa2fb040005b73253da75cf84949b8485175"
+SRCREV = "4ada1290584745ab6643eece9e1756a8c0e079ca"
 SRCBRANCH = "v250-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patch b/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patch
index c42c66786f..c3cc3ea790 100644
--- a/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patch
+++ b/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patch
@@ -1,4 +1,4 @@
-From 9a1841402ce3ef21a10a7314a07a615f8196d406 Mon Sep 17 00:00:00 2001
+From 10ec14bf4a75891a99defa37f5e9452ac6fe12b3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Jan 2022 22:19:37 -0800
 Subject: [PATCH] Adjust for musl headers
@@ -174,7 +174,7 @@ index d15766cd7b..60728b4f94 100644
  #include "conf-parser.h"
  #include "ipvlan.h"
 diff --git a/src/network/netdev/macsec.c b/src/network/netdev/macsec.c
-index f1a566a9ca..1f37927a83 100644
+index df0d924443..6400032f96 100644
 --- a/src/network/netdev/macsec.c
 +++ b/src/network/netdev/macsec.c
 @@ -1,7 +1,7 @@
@@ -200,7 +200,7 @@ index c41be6e78f..ee2660c5bf 100644
  #include "conf-parser.h"
  #include "macvlan.h"
 diff --git a/src/network/netdev/netdev.c b/src/network/netdev/netdev.c
-index 8e7fe11c18..701ab2bd69 100644
+index b46b9ecc90..e6e58c5f0f 100644
 --- a/src/network/netdev/netdev.c
 +++ b/src/network/netdev/netdev.c
 @@ -2,7 +2,7 @@
@@ -275,7 +275,7 @@ index c946e81fc0..d1a6be73f9 100644
  
  #include "netlink-util.h"
 diff --git a/src/network/netdev/vlan.c b/src/network/netdev/vlan.c
-index af3e77963e..efa4b0a164 100644
+index 58c2da32dd..f4a5fd7343 100644
 --- a/src/network/netdev/vlan.c
 +++ b/src/network/netdev/vlan.c
 @@ -2,7 +2,7 @@
@@ -327,7 +327,7 @@ index 30b0855598..a065158801 100644
  #include "conf-parser.h"
  #include "alloc-util.h"
 diff --git a/src/network/netdev/wireguard.c b/src/network/netdev/wireguard.c
-index 88f668753a..5fc753384b 100644
+index 6c251b3a2e..000e3d01a9 100644
 --- a/src/network/netdev/wireguard.c
 +++ b/src/network/netdev/wireguard.c
 @@ -6,7 +6,7 @@
@@ -373,7 +373,7 @@ index 10025a97ae..a0239ea83a 100644
  #define STATIC_BRIDGE_MDB_ENTRIES_PER_NETWORK_MAX 1024U
  
 diff --git a/src/network/networkd-dhcp-common.c b/src/network/networkd-dhcp-common.c
-index 7996960bd1..e870b9ba26 100644
+index 4f13eada05..7e3ea2108b 100644
 --- a/src/network/networkd-dhcp-common.c
 +++ b/src/network/networkd-dhcp-common.c
 @@ -1,7 +1,8 @@
@@ -421,7 +421,7 @@ index 9acfd17d49..3108289602 100644
  
  #include "sd-dhcp-server.h"
 diff --git a/src/network/networkd-dhcp4.c b/src/network/networkd-dhcp4.c
-index cb9c428ae9..a35d58f3f1 100644
+index f97e8033b8..21026ac0bf 100644
 --- a/src/network/networkd-dhcp4.c
 +++ b/src/network/networkd-dhcp4.c
 @@ -3,7 +3,7 @@
@@ -434,7 +434,7 @@ index cb9c428ae9..a35d58f3f1 100644
  #include "alloc-util.h"
  #include "dhcp-client-internal.h"
 diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
-index b62a154828..75949e6094 100644
+index 090da53a1e..8b402a5b04 100644
 --- a/src/network/networkd-link.c
 +++ b/src/network/networkd-link.c
 @@ -3,7 +3,7 @@
@@ -447,7 +447,7 @@ index b62a154828..75949e6094 100644
  #include <linux/netdevice.h>
  #include <sys/socket.h>
 diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
-index ee7a535075..ce6ed64133 100644
+index f3b6f38967..5793fd93f8 100644
 --- a/src/network/networkd-route.c
 +++ b/src/network/networkd-route.c
 @@ -1,9 +1,5 @@
@@ -472,7 +472,7 @@ index ee7a535075..ce6ed64133 100644
          _cleanup_(route_freep) Route *route = NULL;
  
 diff --git a/src/network/networkd-setlink.c b/src/network/networkd-setlink.c
-index e00cc1e589..e392c7e1a2 100644
+index 1ab58a5bd2..72860cc542 100644
 --- a/src/network/networkd-setlink.c
 +++ b/src/network/networkd-setlink.c
 @@ -2,7 +2,7 @@
diff --git a/meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch b/meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
index 31efc4cc4b..9303f42daf 100644
--- a/meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
+++ b/meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
@@ -1,4 +1,4 @@
-From beb0219b71510bc63aed81d2a970a04349d6c616 Mon Sep 17 00:00:00 2001
+From e06212833237dd639a843b5f9733f8a49f3a9119 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 29 Sep 2020 18:01:41 -0700
 Subject: [PATCH] Move sysusers.d/sysctl.d/binfmt.d/modules-load.d to /usr
@@ -7,21 +7,26 @@ These directories are moved to /lib since systemd v246, commit
 4a56315a990b ("path: use ROOTPREFIX properly"), but in oe-core/yocto,
 the old /usr/lib is still being used.
 
+Modified to resolve the merge conflict introduced by systemd v250.14
+version.
+
 Upstream-Status: Inappropriate (OE-specific)
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
+Signed-off-by: Narpat Mali <narpat.falna@gmail.com>
+
 ---
  src/core/systemd.pc.in           | 8 ++++----
  src/libsystemd/sd-path/sd-path.c | 8 ++++----
  2 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/src/core/systemd.pc.in b/src/core/systemd.pc.in
-index fc0f8c34fa..65996bbed8 100644
+index 693433b34b..8368a3ff02 100644
 --- a/src/core/systemd.pc.in
 +++ b/src/core/systemd.pc.in
-@@ -65,16 +65,16 @@ systemdshutdowndir=${systemd_shutdown_dir}
- tmpfiles_dir=${prefix}/lib/tmpfiles.d
- tmpfilesdir=${tmpfiles_dir}
+@@ -67,16 +67,16 @@ tmpfilesdir=${tmpfiles_dir}
+
+ user_tmpfiles_dir=${prefix}/share/user-tmpfiles.d
  
 -sysusers_dir=${rootprefix}/lib/sysusers.d
 +sysusers_dir=${prefix}/lib/sysusers.d
@@ -68,6 +73,3 @@ index ff1e0d5f8e..19a001f47e 100644
                  return 0;
  
          case SD_PATH_CATALOG:
--- 
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0001-core-fix-build-when-seccomp-is-off.patch b/meta/recipes-core/systemd/systemd/0001-core-fix-build-when-seccomp-is-off.patch
new file mode 100644
index 0000000000..63100ce6da
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-core-fix-build-when-seccomp-is-off.patch
@@ -0,0 +1,41 @@
+From 10c567204edcd2926ce4f762d7015d5894756d52 Mon Sep 17 00:00:00 2001
+From: Jonas Gorski <jonas.gorski@bisdn.de>
+Date: Thu, 12 Sep 2024 15:46:29 +0200
+Subject: [PATCH] core: fix build when seccomp is off
+
+Something went wrong when 6aa2c55522d7cac62ecfd5d5687a86a84f158d18 was
+cherry-picked for v250-stable, causing it to fail to build when seccomp
+is disabled.
+
+Fix this by changing the code to how it looks like in other versions of
+the backported commit, slightly adapted to the file's style in v250.
+
+Fixes the following build error:
+
+| ../git/src/core/main.c: In function 'parse_config_file':
+| ../git/src/core/main.c:721:101: error: lvalue required as unary '&' operand
+|   721 |                 { "Manager", "SystemCallArchitectures",      config_parse_syscall_archs,         0, &DISABLED_CONFIGURATION                },
+|       |                                                                                                     ^
+
+Fixes: 8e8c7d51140b ("pid1: generate compat warning for SystemCallArchitectures= if seccomp is off")
+
+Upstream-Status: Backport [https://github.com/systemd/systemd-stable/commit/b19b7c67e9cb74c44c43a0daf6172f9d32f134ec]
+Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
+Signed-off-by: Narpat Mali <narpat.falna@gmail.com>
+---
+ src/core/main.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/core/main.c b/src/core/main.c
+index 19686fa475..5914be6a83 100644
+--- a/src/core/main.c
++++ b/src/core/main.c
+@@ -718,7 +718,7 @@ static int parse_config_file(void) {
+ #if HAVE_SECCOMP
+                 { "Manager", "SystemCallArchitectures",      config_parse_syscall_archs,         0, &arg_syscall_archs                     },
+ #else
+-                { "Manager", "SystemCallArchitectures",      config_parse_syscall_archs,         0, &DISABLED_CONFIGURATION                },
++                { "Manager", "SystemCallArchitectures",      config_parse_warn_compat,           DISABLED_CONFIGURATION, NULL              },
+ #endif
+                 { "Manager", "TimerSlackNSec",               config_parse_nsec,                  0, &arg_timer_slack_nsec                  },
+                 { "Manager", "DefaultTimerAccuracySec",      config_parse_sec,                   0, &arg_default_timer_accuracy_usec       },
diff --git a/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch b/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
index 9ebff9825a..b64d6b30a7 100644
--- a/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
+++ b/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
@@ -1,4 +1,4 @@
-From dab02796780f00d689cc1c7a0ba81abe7c5f28d0 Mon Sep 17 00:00:00 2001
+From 2252b9a6c598f8ed4efe95d2a149f68db7fb9cc4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Jan 2022 15:15:11 -0800
 Subject: [PATCH] pass correct parameters to getdents64
@@ -12,14 +12,33 @@ Fixes
         n = getdents64(fd, &buffer, sizeof(buffer));
                            ^~~~~~~
 
+Modified to resolve the merge conflict introduced by systemd v250.14 version.
+
 Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
+Signed-off-by: Narpat Mali <narpat.falna@gmail.com>
+
 ---
+ src/basic/dirent-util.h | 6 ++++++
  src/basic/recurse-dir.c | 2 +-
- src/basic/stat-util.c   | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ src/basic/stat-util.c   | 8 ++++++--
+ 3 files changed, 13 insertions(+), 3 deletions(-)
 
+diff --git a/src/basic/dirent-util.h b/src/basic/dirent-util.h
+index 04bc53003f..5fde9043a3 100644
+--- a/src/basic/dirent-util.h
++++ b/src/basic/dirent-util.h
+@@ -51,3 +51,9 @@ assert_cc(sizeof_field(struct dirent, d_name) == sizeof_field(struct dirent64, d
+         for (void *_end = (uint8_t*) ({ (de) = (buf); }) + (sz);        \
+              (uint8_t*) (de) < (uint8_t*) _end;                         \
+              (de) = (struct dirent*) ((uint8_t*) (de) + (de)->d_reclen))
++
++#define DEFINE_DIRENT_BUFFER(name, sz)                                  \
++        union {                                                         \
++                struct dirent de;                                       \
++                uint8_t data[(sz) * DIRENT_SIZE_MAX];                   \
++        } name
 diff --git a/src/basic/recurse-dir.c b/src/basic/recurse-dir.c
 index efa1797b7b..03ff10ebe9 100644
 --- a/src/basic/recurse-dir.c
@@ -34,18 +53,28 @@ index efa1797b7b..03ff10ebe9 100644
                          return -errno;
                  if (n == 0)
 diff --git a/src/basic/stat-util.c b/src/basic/stat-util.c
-index c2269844f8..7cd6c7fa42 100644
+index db22f06d0f..cb76726c37 100644
 --- a/src/basic/stat-util.c
 +++ b/src/basic/stat-util.c
-@@ -99,7 +99,7 @@ int dir_is_empty_at(int dir_fd, const char *path) {
+@@ -66,6 +66,10 @@ int is_device_node(const char *path) {
+ int dir_is_empty_at(int dir_fd, const char *path) {
+         _cleanup_close_ int fd = -1;
+         _cleanup_closedir_ DIR *d = NULL;
++        /* Allocate space for at least 3 full dirents, since every dir has at least two entries ("."  +
++         * ".."), and only once we have seen if there's a third we know whether the dir is empty or not. */
++        DEFINE_DIRENT_BUFFER(buffer, 3);
++        ssize_t n;
+
+         if (path) {
+                 assert(dir_fd >= 0 || dir_fd == AT_FDCWD);
+@@ -85,8 +89,8 @@ int dir_is_empty_at(int dir_fd, const char *path) {
                          return fd;
          }
  
--        n = getdents64(fd, &buffer, sizeof(buffer));
+-        d = take_fdopendir(&fd);
+-        if (!d)
 +        n = getdents64(fd, (struct dirent *)&buffer, sizeof(buffer));
-         if (n < 0)
++        if (n < 0)
                  return -errno;
  
--- 
-2.34.1
-
+         FOREACH_DIRENT(de, d, return -errno)
diff --git a/meta/recipes-core/systemd/systemd/0001-shared-json-allow-json_variant_dump-to-return-an-err.patch b/meta/recipes-core/systemd/systemd/0001-shared-json-allow-json_variant_dump-to-return-an-err.patch
deleted file mode 100644
index b23b735507..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-shared-json-allow-json_variant_dump-to-return-an-err.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 25492154b42f68a48752a7f61eaf1fb61e454e52 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
-Date: Tue, 18 Oct 2022 18:09:06 +0200
-Subject: [PATCH] shared/json: allow json_variant_dump() to return an error
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/7922ead507e0d83e4ec72a8cbd2b67194766e58c]
-
-Needed to fix CVE-2022-45873.patch backported from systemd/main,
-otherwise it fails to build with:
-
-| ../git/src/shared/elf-util.c: In function 'parse_elf_object':
-| ../git/src/shared/elf-util.c:792:27: error: void value not ignored as it ought to be
-|   792 |                         r = json_variant_dump(package_metadata, JSON_FORMAT_FLUSH, json_out, NULL);
-|       |                           ^
-
-Signed-off-by: Martin Jansa <martin2.jansa@lgepartner.com>
----
- src/shared/json.c | 7 ++++---
- src/shared/json.h | 2 +-
- 2 files changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/src/shared/json.c b/src/shared/json.c
-index dff95eda26..81c05efe22 100644
---- a/src/shared/json.c
-+++ b/src/shared/json.c
-@@ -1792,9 +1792,9 @@ int json_variant_format(JsonVariant *v, JsonFormatFlags flags, char **ret) {
-         return (int) sz - 1;
- }
- 
--void json_variant_dump(JsonVariant *v, JsonFormatFlags flags, FILE *f, const char *prefix) {
-+int json_variant_dump(JsonVariant *v, JsonFormatFlags flags, FILE *f, const char *prefix) {
-         if (!v)
--                return;
-+                return 0;
- 
-         if (!f)
-                 f = stdout;
-@@ -1820,7 +1820,8 @@ void json_variant_dump(JsonVariant *v, JsonFormatFlags flags, FILE *f, const cha
-                 fputc('\n', f); /* In case of SSE add a second newline */
- 
-         if (flags & JSON_FORMAT_FLUSH)
--                fflush(f);
-+                return fflush_and_check(f);
-+        return 0;
- }
- 
- int json_variant_filter(JsonVariant **v, char **to_remove) {
-diff --git a/src/shared/json.h b/src/shared/json.h
-index 8760354b66..c712700763 100644
---- a/src/shared/json.h
-+++ b/src/shared/json.h
-@@ -187,7 +187,7 @@ typedef enum JsonFormatFlags {
- } JsonFormatFlags;
- 
- int json_variant_format(JsonVariant *v, JsonFormatFlags flags, char **ret);
--void json_variant_dump(JsonVariant *v, JsonFormatFlags flags, FILE *f, const char *prefix);
-+int json_variant_dump(JsonVariant *v, JsonFormatFlags flags, FILE *f, const char *prefix);
- 
- int json_variant_filter(JsonVariant **v, char **to_remove);
- 
diff --git a/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch b/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
index 8cf0546450..5ed907412f 100644
--- a/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
+++ b/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
@@ -1,4 +1,4 @@
-From 4b731a5e2547b5292f9a774b849e14c0cf7b3955 Mon Sep 17 00:00:00 2001
+From 2e7d75e9a045f7580c60436dbee44301393a66c3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Jan 2022 15:17:37 -0800
 Subject: [PATCH] Add sys/stat.h for S_IFDIR
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/src/shared/mkdir-label.c b/src/shared/mkdir-label.c
-index d36a6466d7..63b764cd83 100644
+index 5b1ac5d1e0..fa5802b894 100644
 --- a/src/shared/mkdir-label.c
 +++ b/src/shared/mkdir-label.c
-@@ -4,6 +4,7 @@
+@@ -6,6 +6,7 @@
  #include "selinux-util.h"
  #include "smack-util.h"
  #include "user-util.h"
diff --git a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-comparison_fn_t.patch b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-comparison_fn_t.patch
index c28c8381e8..e1fedd71b8 100644
--- a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-comparison_fn_t.patch
+++ b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-comparison_fn_t.patch
@@ -1,4 +1,4 @@
-From 5513b918d02900a3a78fd0e0300a118b163edfef Mon Sep 17 00:00:00 2001
+From a134b05d2cbc0d05a5ad7d9ebbb4ba57d424752c Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:55:12 +0800
 Subject: [PATCH] missing_type.h: add comparison_fn_t
@@ -14,6 +14,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 [Rebased for v250, Drop __compare_fn_t]
 Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
+
 ---
  src/basic/missing_type.h            | 4 ++++
  src/basic/sort-util.h               | 1 +
@@ -56,6 +57,3 @@ index 8fc87b131a..36a6efdbd8 100644
  
  const char * const catalog_file_dirs[] = {
          "/usr/local/lib/systemd/catalog/",
--- 
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
index 1bd538b0c0..c233560e52 100644
--- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
@@ -1,4 +1,4 @@
-From 3d9910dcda697b1e361bba49c99050ee0d116742 Mon Sep 17 00:00:00 2001
+From e53661c4dc9b15397a87077169fe729934ce5e13 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sat, 22 May 2021 20:26:24 +0200
 Subject: [PATCH] add fallback parse_printf_format implementation
@@ -23,10 +23,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  create mode 100644 src/basic/parse-printf-format.h
 
 diff --git a/meson.build b/meson.build
-index cb9936ee8b..ae53345260 100644
+index 01c4b4dc70..29129a83e2 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -686,6 +686,7 @@ endif
+@@ -705,6 +705,7 @@ endif
  foreach header : ['crypt.h',
                    'linux/memfd.h',
                    'linux/vm_sockets.h',
diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index 680930ca3c..786f8304ac 100644
--- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -1,4 +1,4 @@
-From 106b7bd7186c9d6c1dcd72bd4ca6457d3fa72d0b Mon Sep 17 00:00:00 2001
+From 38c8e75938a439dd8f961a9ea4084deca0c46269 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:18:21 +0800
 Subject: [PATCH] src/basic/missing.h: check for missing strndupa
@@ -17,6 +17,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 [rebased for systemd 244]
 [Rebased for v247]
 Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
+
 ---
  meson.build                                |  1 +
  src/backlight/backlight.c                  |  1 +
@@ -73,10 +74,10 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  52 files changed, 63 insertions(+)
 
 diff --git a/meson.build b/meson.build
-index cb9936ee8b..7ab201c6d9 100644
+index 29129a83e2..3fec6aac3e 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -507,6 +507,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
+@@ -526,6 +526,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
  endforeach
  
  foreach ident : [
@@ -97,7 +98,7 @@ index 5a3095cbba..22cfa4d526 100644
  static int help(void) {
          _cleanup_free_ char *link = NULL;
 diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index a626ecf2e2..f7dc6c8421 100644
+index e65ad678ab..d3bed80620 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
 @@ -37,6 +37,7 @@
@@ -121,7 +122,7 @@ index 885967e7f3..d0b7dc845e 100644
  /* We follow bash for the character set. Different shells have different rules. */
  #define VALID_BASH_ENV_NAME_CHARS               \
 diff --git a/src/basic/log.c b/src/basic/log.c
-index 12071e2ebd..15254c7bbc 100644
+index 10de8bd7c0..4f0e7eaad3 100644
 --- a/src/basic/log.c
 +++ b/src/basic/log.c
 @@ -36,6 +36,7 @@
@@ -153,7 +154,7 @@ index 8c76f93eb2..9068bfb4f0 100644
 +  })
 +#endif
 diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
-index 51a0d74e87..03569f71f8 100644
+index 27144dd45a..0395c124da 100644
 --- a/src/basic/mkdir.c
 +++ b/src/basic/mkdir.c
 @@ -15,6 +15,7 @@
@@ -237,7 +238,7 @@ index 65f96abb06..e485a0196b 100644
  int procfs_get_pid_max(uint64_t *ret) {
          _cleanup_free_ char *value = NULL;
 diff --git a/src/basic/time-util.c b/src/basic/time-util.c
-index b659d6905d..020112be24 100644
+index 89dc593d44..ffbaffd451 100644
 --- a/src/basic/time-util.c
 +++ b/src/basic/time-util.c
 @@ -26,6 +26,7 @@
@@ -273,7 +274,7 @@ index f0d8759e85..b4c1053e64 100644
  
  BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", TasksMax, tasks_max_resolve);
 diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
-index 5c499e5d06..e7ab1bb9a5 100644
+index db1698393c..77cc8bb507 100644
 --- a/src/core/dbus-execute.c
 +++ b/src/core/dbus-execute.c
 @@ -44,6 +44,7 @@
@@ -297,10 +298,10 @@ index 32a2ec0ff9..36be2511e4 100644
  int bus_property_get_triggered_unit(
                  sd_bus *bus,
 diff --git a/src/core/execute.c b/src/core/execute.c
-index 0b20d386d3..fccfb9268c 100644
+index da0cd2dcbe..d2a7bf7e7b 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -102,6 +102,7 @@
+@@ -103,6 +103,7 @@
  #include "unit-serialize.h"
  #include "user-util.h"
  #include "utmp-wtmp.h"
@@ -321,7 +322,7 @@ index d054668b8e..9b4caa7651 100644
  #if HAVE_KMOD
  #include "module-util.h"
 diff --git a/src/core/service.c b/src/core/service.c
-index 87f0d34c8c..ccda3feb29 100644
+index e02c2e38ad..2a64a14647 100644
 --- a/src/core/service.c
 +++ b/src/core/service.c
 @@ -42,6 +42,7 @@
@@ -369,7 +370,7 @@ index 3e3646e45f..6a8fc60f6d 100644
  #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem"
  #define CERT_FILE     CERTIFICATE_ROOT "/certs/journal-remote.pem"
 diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
-index 3c4a7c0a7a..6a792404f2 100644
+index d4a751c575..b175b11a8f 100644
 --- a/src/journal/journalctl.c
 +++ b/src/journal/journalctl.c
 @@ -73,6 +73,7 @@
@@ -381,7 +382,7 @@ index 3c4a7c0a7a..6a792404f2 100644
  #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
  #define PROCESS_INOTIFY_INTERVAL 1024   /* Every 1,024 messages processed */
 diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bus/bus-message.c
-index 96529b422b..ddb5e9c698 100644
+index ca0b290ed2..3fa703eb61 100644
 --- a/src/libsystemd/sd-bus/bus-message.c
 +++ b/src/libsystemd/sd-bus/bus-message.c
 @@ -20,6 +20,7 @@
@@ -393,11 +394,11 @@ index 96529b422b..ddb5e9c698 100644
  static int message_append_basic(sd_bus_message *m, char type, const void *p, const void **stored);
  
 diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
-index 28d8336718..5d3ce88a53 100644
+index 5c6c6c5c5f..00499d53d1 100644
 --- a/src/libsystemd/sd-bus/bus-objects.c
 +++ b/src/libsystemd/sd-bus/bus-objects.c
-@@ -12,6 +12,7 @@
- #include "set.h"
+@@ -11,6 +11,7 @@
+ #include "missing_capability.h"
  #include "string-util.h"
  #include "strv.h"
 +#include "missing_stdlib.h"
@@ -405,7 +406,7 @@ index 28d8336718..5d3ce88a53 100644
  static int node_vtable_get_userdata(
                  sd_bus *bus,
 diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src/libsystemd/sd-bus/bus-socket.c
-index 14951ccb33..b7f86ca501 100644
+index af67fc70eb..f80afa8327 100644
 --- a/src/libsystemd/sd-bus/bus-socket.c
 +++ b/src/libsystemd/sd-bus/bus-socket.c
 @@ -28,6 +28,7 @@
@@ -417,7 +418,7 @@ index 14951ccb33..b7f86ca501 100644
  #define SNDBUF_SIZE (8*1024*1024)
  
 diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-bus.c
-index 9e1d29cc1d..8c3165f0ce 100644
+index 8f12be6d56..01945df0c4 100644
 --- a/src/libsystemd/sd-bus/sd-bus.c
 +++ b/src/libsystemd/sd-bus/sd-bus.c
 @@ -43,6 +43,7 @@
@@ -441,7 +442,7 @@ index 317653bedc..d028216c48 100644
  #define MAX_SIZE (2*1024*1024)
  
 diff --git a/src/libsystemd/sd-journal/sd-journal.c b/src/libsystemd/sd-journal/sd-journal.c
-index 7a6cc4aca3..b7f7cd65c5 100644
+index de9deb2e6d..6f4e1856d5 100644
 --- a/src/libsystemd/sd-journal/sd-journal.c
 +++ b/src/libsystemd/sd-journal/sd-journal.c
 @@ -41,6 +41,7 @@
@@ -450,10 +451,10 @@ index 7a6cc4aca3..b7f7cd65c5 100644
  #include "syslog-util.h"
 +#include "missing_stdlib.h"
  
- #define JOURNAL_FILES_MAX 7168
+ #define JOURNAL_FILES_RECHECK_USEC (2 * USEC_PER_SEC)
  
 diff --git a/src/locale/keymap-util.c b/src/locale/keymap-util.c
-index 10d2ed7aec..4fbe3f6b4a 100644
+index eaa1c6f0d2..7014c1e227 100644
 --- a/src/locale/keymap-util.c
 +++ b/src/locale/keymap-util.c
 @@ -24,6 +24,7 @@
@@ -489,7 +490,7 @@ index 063ad08d80..f9823a433b 100644
  /*
    # .network
 diff --git a/src/nspawn/nspawn-settings.c b/src/nspawn/nspawn-settings.c
-index 1f58bf3ed4..8457a3b0e3 100644
+index c4be8f5d4e..04ab34f165 100644
 --- a/src/nspawn/nspawn-settings.c
 +++ b/src/nspawn/nspawn-settings.c
 @@ -17,6 +17,7 @@
@@ -513,7 +514,7 @@ index c64e79bdff..eda26b0b9a 100644
  static void setup_logging_once(void) {
          static pthread_once_t once = PTHREAD_ONCE_INIT;
 diff --git a/src/portable/portable.c b/src/portable/portable.c
-index 0e6461ba93..54148d5924 100644
+index 3f73151bfe..452cadb764 100644
 --- a/src/portable/portable.c
 +++ b/src/portable/portable.c
 @@ -39,6 +39,7 @@
@@ -525,7 +526,7 @@ index 0e6461ba93..54148d5924 100644
  /* Markers used in the first line of our 20-portable.conf unit file drop-in to determine, that a) the unit file was
   * dropped there by the portable service logic and b) for which image it was dropped there. */
 diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c
-index 5b3ceeff36..d36d1d57ae 100644
+index 5ec4b63568..5a6a32f691 100644
 --- a/src/resolve/resolvectl.c
 +++ b/src/resolve/resolvectl.c
 @@ -43,6 +43,7 @@
@@ -561,7 +562,7 @@ index 87c0334fec..402ab3493b 100644
  struct CGroupInfo {
          char *cgroup_path;
 diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-util.c
-index dcce530c99..faf5a5bda0 100644
+index ef134bcee4..48a5c3bec6 100644
 --- a/src/shared/bus-unit-util.c
 +++ b/src/shared/bus-unit-util.c
 @@ -49,6 +49,7 @@
@@ -585,7 +586,7 @@ index 4a2b7684bc..ee6d687c58 100644
  static int name_owner_change_callback(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
          sd_event *e = userdata;
 diff --git a/src/shared/dns-domain.c b/src/shared/dns-domain.c
-index f54b187a1b..299758c7e4 100644
+index 5e0d921487..f9a39b60d9 100644
 --- a/src/shared/dns-domain.c
 +++ b/src/shared/dns-domain.c
 @@ -17,6 +17,7 @@
@@ -609,7 +610,7 @@ index c6caf9330a..ebe33bd44a 100644
  enum {
          IMPORTER_STATE_LINE = 0,    /* waiting to read, or reading line */
 diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c
-index cf83eb6bca..e672a003a3 100644
+index e2315e6eb1..65533b412c 100644
 --- a/src/shared/logs-show.c
 +++ b/src/shared/logs-show.c
 @@ -42,6 +42,7 @@
@@ -669,7 +670,7 @@ index cc9a7cb838..a679614a47 100644
  
  TEST(hexchar) {
 diff --git a/src/udev/udev-builtin-path_id.c b/src/udev/udev-builtin-path_id.c
-index ae92e45205..1e6f3205cb 100644
+index 1084eb2d81..db07b84124 100644
 --- a/src/udev/udev-builtin-path_id.c
 +++ b/src/udev/udev-builtin-path_id.c
 @@ -22,6 +22,7 @@
@@ -693,7 +694,7 @@ index a60e4f294c..571c43765b 100644
  typedef struct Spawn {
          sd_device *device;
 diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index 1a384d6b38..0089833e3f 100644
+index cf461e1e68..9d6431d865 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
 @@ -34,6 +34,7 @@
@@ -704,6 +705,3 @@ index 1a384d6b38..0089833e3f 100644
  
  #define RULES_DIRS (const char* const*) CONF_PATHS_STRV("udev/rules.d")
  
--- 
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
index b84fbaa67e..f3285b7a31 100644
--- a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
+++ b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
@@ -1,4 +1,4 @@
-From 74c664bcd6b9a5fcf3466310c07f608d12456f7f Mon Sep 17 00:00:00 2001
+From 5de6ab5196cfd629f4a15f8d0d34f69b1e425715 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:56:21 +0800
 Subject: [PATCH] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not defined
@@ -115,7 +115,7 @@ index ec8b74f48f..d99a6095df 100644
  
          (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
 diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
-index fcab51c208..fdef1807ae 100644
+index 07ef3af0a0..8293661aa7 100644
 --- a/src/tmpfiles/tmpfiles.c
 +++ b/src/tmpfiles/tmpfiles.c
 @@ -67,6 +67,12 @@
@@ -131,7 +131,7 @@ index fcab51c208..fdef1807ae 100644
  /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
   * them in the file system. This is intended to be used to create
   * properly owned directories beneath /tmp, /var/tmp, /run, which are
-@@ -1961,7 +1967,9 @@ finish:
+@@ -1958,7 +1964,9 @@ finish:
  
  static int glob_item(Item *i, action_t action) {
          _cleanup_globfree_ glob_t g = {
@@ -141,7 +141,7 @@ index fcab51c208..fdef1807ae 100644
          };
          int r = 0, k;
          char **fn;
-@@ -1981,7 +1989,9 @@ static int glob_item(Item *i, action_t action) {
+@@ -1978,7 +1986,9 @@ static int glob_item(Item *i, action_t action) {
  
  static int glob_item_recursively(Item *i, fdaction_t action) {
          _cleanup_globfree_ glob_t g = {
diff --git a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
index 0c0d3d0b62..718dc659c9 100644
--- a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
@@ -1,4 +1,4 @@
-From a0450f7909348e7ff1d58adc0aee4119a0519c1f Mon Sep 17 00:00:00 2001
+From 427534fec8c205a9a97b20a4075dd84e1faca611 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:00:06 +0800
 Subject: [PATCH] add missing FTW_ macros for musl
@@ -49,7 +49,7 @@ index 6c0456349d..5140892e22 100644
 +#define FTW_SKIP_SIBLINGS 3
 +#endif
 diff --git a/src/shared/mount-setup.c b/src/shared/mount-setup.c
-index 7917968497..cc3d5baaab 100644
+index 7ba579ef63..2d62b1978f 100644
 --- a/src/shared/mount-setup.c
 +++ b/src/shared/mount-setup.c
 @@ -32,6 +32,7 @@
diff --git a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
index e7b7269f95..ea2b7f0aa3 100644
--- a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
+++ b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
@@ -1,4 +1,4 @@
-From 3ca0920429f7eaf8c59f9ac8afd30a43b83d95ed Mon Sep 17 00:00:00 2001
+From fefd1b6ae9dd75133f86c373ce17d4f15ef05e2d Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:03:47 +0800
 Subject: [PATCH] fix missing of __register_atfork for non-glibc builds
@@ -15,7 +15,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 7 insertions(+)
 
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index c971852158..df6e85b1fc 100644
+index 5e27097cbb..db252b8dfe 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
 @@ -18,6 +18,9 @@
@@ -28,7 +28,7 @@ index c971852158..df6e85b1fc 100644
  
  #include "alloc-util.h"
  #include "architecture.h"
-@@ -1161,11 +1164,15 @@ void reset_cached_pid(void) {
+@@ -1165,11 +1168,15 @@ void reset_cached_pid(void) {
          cached_pid = CACHED_PID_UNSET;
  }
  
diff --git a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
index 3a47d09e8a..a8e45030ba 100644
--- a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
@@ -1,4 +1,4 @@
-From 48a791aae7a47a2a08e9e60c18054071a43b8cda Mon Sep 17 00:00:00 2001
+From 4bf0a67c097c53129c772aab6123740d07b66823 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:12:41 +0800
 Subject: [PATCH] Use uintmax_t for handling rlim_t
@@ -87,10 +87,10 @@ index 33dfde9d6c..e018fd81fd 100644
          return 1;
  }
 diff --git a/src/core/execute.c b/src/core/execute.c
-index fccfb9268c..90f00e10a5 100644
+index d2a7bf7e7b..0cc806b929 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -5633,9 +5633,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
+@@ -5671,9 +5671,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
          for (unsigned i = 0; i < RLIM_NLIMITS; i++)
                  if (c->rlimit[i]) {
                          fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
diff --git a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
index 7e4587cc23..a91ecea6be 100644
--- a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
+++ b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
@@ -1,4 +1,4 @@
-From e8025c8eefdf1be4bba34c48f3430838f3859c52 Mon Sep 17 00:00:00 2001
+From 755d647dc2e0842b89c29211af839c4e61faf006 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 28 Feb 2018 21:25:22 -0800
 Subject: [PATCH] test-sizeof.c: Disable tests for missing typedefs in musl
diff --git a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
index 6eecd3197c..68ad2a32d9 100644
--- a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
+++ b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
@@ -1,4 +1,4 @@
-From 46fdc959257d60d9b32953cae0152ae118f8564b Mon Sep 17 00:00:00 2001
+From 5667af9b7ee73ee5a003221aaca5337c306469c7 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 10 Oct 2017 14:33:30 -0700
 Subject: [PATCH] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
@@ -65,7 +65,7 @@ index 0bbb3f6298..3dc494dbfb 100644
  int touch_file(const char *path, bool parents, usec_t stamp, uid_t uid, gid_t gid, mode_t mode);
  int touch(const char *path);
 diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
-index 5f5328c8cf..d396bc99fe 100644
+index 2847bcb0fb..fc534435d3 100644
 --- a/src/shared/base-filesystem.c
 +++ b/src/shared/base-filesystem.c
 @@ -117,7 +117,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
diff --git a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
index 7b22d6214f..76642f90f6 100644
--- a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
+++ b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
@@ -1,4 +1,4 @@
-From d0bdce977b7acc5e45e82cf84256c4bedc0e74c4 Mon Sep 17 00:00:00 2001
+From 1a1ae5dfb989af0e5f6294e26e0c12f49705860b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 May 2018 08:36:44 -0700
 Subject: [PATCH] Define glibc compatible basename() for non-glibc systems
diff --git a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
index 015347cb6a..60ff964e7d 100644
--- a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
@@ -1,4 +1,4 @@
-From e480d28305907c3874f4e58b722b8aa43c3ac7a2 Mon Sep 17 00:00:00 2001
+From 61158232373ec55693e8fa4513b8fcdfb875ecda Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jul 2018 15:00:44 +0800
 Subject: [PATCH] Do not disable buffering when writing to oom_score_adj
@@ -25,10 +25,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index df6e85b1fc..635dbb5d26 100644
+index db252b8dfe..66bdc74b3f 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
-@@ -1489,7 +1489,7 @@ int set_oom_score_adjust(int value) {
+@@ -1493,7 +1493,7 @@ int set_oom_score_adjust(int value) {
          xsprintf(t, "%i", value);
  
          return write_string_file("/proc/self/oom_score_adj", t,
diff --git a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
index c563982607..2312dcde68 100644
--- a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
+++ b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
@@ -1,4 +1,4 @@
-From 0542d27ebbb250c09bdcfcf9f2ea3d27426fe522 Mon Sep 17 00:00:00 2001
+From 3a3c61daffa79ce7b70b6b851110ce13c652d731 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 10 Jul 2018 15:40:17 +0800
 Subject: [PATCH] distinguish XSI-compliant strerror_r from GNU-specifi
diff --git a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch b/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
index 1fcba7af08..943e2b2889 100644
--- a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
+++ b/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
@@ -1,4 +1,4 @@
-From e1d0210b47906dd121f936f3181092835df6a95c Mon Sep 17 00:00:00 2001
+From b90e69cab3da08fa890e8d276be4d02e39cd83aa Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:44:54 +0800
 Subject: [PATCH] avoid redefinition of prctl_mm_map structure
diff --git a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
index 82a01f732e..776fcdd6ca 100644
--- a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
+++ b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
@@ -1,4 +1,4 @@
-From e10a73de254b570bbc29b26423dbb86b4265bb05 Mon Sep 17 00:00:00 2001
+From 4f39aa56e738d99ac04e73ba75713db7e05f7252 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 16:53:06 +0800
 Subject: [PATCH] test-json.c: define M_PIl
@@ -19,7 +19,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/src/test/test-json.c b/src/test/test-json.c
-index b385edc269..5e5830238c 100644
+index 2aecbe3557..f7112dc374 100644
 --- a/src/test/test-json.c
 +++ b/src/test/test-json.c
 @@ -14,6 +14,10 @@
diff --git a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
index 4dd6ff6e2e..8e1b8f25fa 100644
--- a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
@@ -1,4 +1,4 @@
-From 414e2f97008a1f3c26a260a6dc4d51a8c1fa6900 Mon Sep 17 00:00:00 2001
+From e79028fbfcc3036df8c2de9d199e4d89cbfff017 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Fri, 1 Mar 2019 15:22:15 +0800
 Subject: [PATCH] do not disable buffer in writing files
@@ -44,10 +44,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  21 files changed, 39 insertions(+), 40 deletions(-)
 
 diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index f7dc6c8421..5f7a27c2c4 100644
+index d3bed80620..9af2339353 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
-@@ -390,7 +390,7 @@ int cg_kill_kernel_sigkill(const char *controller, const char *path) {
+@@ -399,7 +399,7 @@ int cg_kill_kernel_sigkill(const char *controller, const char *path) {
          if (r < 0)
                  return r;
  
@@ -56,7 +56,7 @@ index f7dc6c8421..5f7a27c2c4 100644
          if (r < 0)
                  return r;
  
-@@ -803,7 +803,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -812,7 +812,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
  
          sc = strstrip(contents);
          if (isempty(sc)) {
@@ -65,7 +65,7 @@ index f7dc6c8421..5f7a27c2c4 100644
                  if (r < 0)
                          return r;
          } else if (!path_equal(sc, agent))
-@@ -821,7 +821,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -830,7 +830,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
  
          sc = strstrip(contents);
          if (streq(sc, "0")) {
@@ -74,7 +74,7 @@ index f7dc6c8421..5f7a27c2c4 100644
                  if (r < 0)
                          return r;
  
-@@ -848,7 +848,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -857,7 +857,7 @@ int cg_uninstall_release_agent(const char *controller) {
          if (r < 0)
                  return r;
  
@@ -83,7 +83,7 @@ index f7dc6c8421..5f7a27c2c4 100644
          if (r < 0)
                  return r;
  
-@@ -858,7 +858,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -867,7 +867,7 @@ int cg_uninstall_release_agent(const char *controller) {
          if (r < 0)
                  return r;
  
@@ -92,7 +92,7 @@ index f7dc6c8421..5f7a27c2c4 100644
          if (r < 0)
                  return r;
  
-@@ -1704,7 +1704,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
+@@ -1713,7 +1713,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
          if (r < 0)
                  return r;
  
@@ -198,7 +198,7 @@ index 18231c2618..6c598d55c8 100644
                          log_warning_errno(r, "Failed to flush binfmt_misc rules, ignoring: %m");
                  else
 diff --git a/src/core/cgroup.c b/src/core/cgroup.c
-index f58de95a49..7a97ab6f99 100644
+index 79681c65be..a346e5d35c 100644
 --- a/src/core/cgroup.c
 +++ b/src/core/cgroup.c
 @@ -4140,7 +4140,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAction action) {
@@ -211,10 +211,10 @@ index f58de95a49..7a97ab6f99 100644
                  return r;
  
 diff --git a/src/core/main.c b/src/core/main.c
-index 57aedb9b93..7ef36d22f5 100644
+index 5914be6a83..a4706203f1 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
-@@ -1466,7 +1466,7 @@ static int bump_unix_max_dgram_qlen(void) {
+@@ -1468,7 +1468,7 @@ static int bump_unix_max_dgram_qlen(void) {
          if (v >= DEFAULT_UNIX_MAX_DGRAM_QLEN)
                  return 0;
  
@@ -223,7 +223,7 @@ index 57aedb9b93..7ef36d22f5 100644
                                 "%lu", DEFAULT_UNIX_MAX_DGRAM_QLEN);
          if (r < 0)
                  return log_full_errno(IN_SET(r, -EROFS, -EPERM, -EACCES) ? LOG_DEBUG : LOG_WARNING, r,
-@@ -1737,7 +1737,7 @@ static void initialize_core_pattern(bool skip_setup) {
+@@ -1739,7 +1739,7 @@ static void initialize_core_pattern(bool skip_setup) {
          if (getpid_cached() != 1)
                  return;
  
@@ -285,10 +285,10 @@ index 9fdc74b775..9858a2b415 100644
                  log_warning_errno(r, "Failed to drop caches, ignoring: %m");
          else
 diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
-index b163a0fb6b..fd6c5301d6 100644
+index 718a92549d..104222bb16 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
-@@ -2108,7 +2108,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
+@@ -2111,7 +2111,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
          if (!value)
                  return -ENOMEM;
  
@@ -311,10 +311,10 @@ index d472e80c03..c7780c7fc6 100644
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
 diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index fb6af295b5..0d83f1e4d2 100644
+index 573419d7f3..97a81ff8f8 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -2759,7 +2759,7 @@ static int reset_audit_loginuid(void) {
+@@ -2768,7 +2768,7 @@ static int reset_audit_loginuid(void) {
          if (streq(p, "4294967295"))
                  return 0;
  
@@ -323,7 +323,7 @@ index fb6af295b5..0d83f1e4d2 100644
          if (r < 0) {
                  log_error_errno(r,
                                  "Failed to reset audit login UID. This probably means that your kernel is too\n"
-@@ -4175,7 +4175,7 @@ static int setup_uid_map(
+@@ -4184,7 +4184,7 @@ static int setup_uid_map(
                  return log_oom();
  
          xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
@@ -332,7 +332,7 @@ index fb6af295b5..0d83f1e4d2 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to write UID map: %m");
  
-@@ -4185,7 +4185,7 @@ static int setup_uid_map(
+@@ -4194,7 +4194,7 @@ static int setup_uid_map(
                  return log_oom();
  
          xsprintf(uid_map, "/proc/" PID_FMT "/gid_map", pid);
@@ -441,7 +441,7 @@ index 7064f3a905..8f2a7d9da2 100644
                          return 0;
                  log_debug_errno(k, "Failed to write '%s' to /sys/power/state: %m", *state);
 diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index 0089833e3f..0a6a3abbb4 100644
+index 9d6431d865..c162b6dbfe 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
 @@ -2181,7 +2181,6 @@ static int udev_rule_apply_token_to_event(
diff --git a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch b/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
index 6981d70af0..33cbb66703 100644
--- a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
+++ b/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
@@ -1,4 +1,4 @@
-From 8871f78c559f37169c0cfaf20b0af1dbec0399af Mon Sep 17 00:00:00 2001
+From 7a270f66384e95635ac512429b4cd51f817e3494 Mon Sep 17 00:00:00 2001
 From: Scott Murray <scott.murray@konsulko.com>
 Date: Fri, 13 Sep 2019 19:26:27 -0400
 Subject: [PATCH] Handle __cpu_mask usage
diff --git a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
index 2c56838644..c6982af910 100644
--- a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
+++ b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
@@ -1,4 +1,4 @@
-From ec519727bb1ceda6e7787ccf86237a6aad07137c Mon Sep 17 00:00:00 2001
+From cac47a8efdf76eec005275162fbf28300dffc13c Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Tue, 10 Mar 2020 11:05:20 +0000
 Subject: [PATCH] Handle missing gshadow
@@ -139,7 +139,7 @@ index 22ab04d6ee..4e52e7a911 100644
  #include <shadow.h>
  
 diff --git a/src/shared/userdb.c b/src/shared/userdb.c
-index 0eddd382e6..d506b8e263 100644
+index ec0c835cad..5e4b1028c6 100644
 --- a/src/shared/userdb.c
 +++ b/src/shared/userdb.c
 @@ -1046,13 +1046,15 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
diff --git a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
index 6c97a272e2..0845569c91 100644
--- a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
@@ -1,4 +1,4 @@
-From 754a16eeb255c06dbdd4655632276573f0f075ec Mon Sep 17 00:00:00 2001
+From bf6d00a780db808de6a5dfc28e24906f699fd60e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 12 Apr 2021 23:44:53 -0700
 Subject: [PATCH] missing_syscall.h: Define MIPS ABI defines for musl
@@ -34,7 +34,7 @@ index 793d111c55..9665848b88 100644
  #include "missing_keyctl.h"
  #include "missing_stat.h"
 diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
-index d396bc99fe..7e9c0c3412 100644
+index fc534435d3..5929ca1fce 100644
 --- a/src/shared/base-filesystem.c
 +++ b/src/shared/base-filesystem.c
 @@ -19,6 +19,7 @@
diff --git a/meta/recipes-core/systemd/systemd/CVE-2022-3821.patch b/meta/recipes-core/systemd/systemd/CVE-2022-3821.patch
deleted file mode 100644
index eb8b0cba12..0000000000
--- a/meta/recipes-core/systemd/systemd/CVE-2022-3821.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From bff52d96598956163d73b7c7bdec7b0ad5b3c2d4 Mon Sep 17 00:00:00 2001
-From: Hitendra Prajapati <hprajapati@mvista.com>
-Date: Tue, 15 Nov 2022 16:52:03 +0530
-Subject: [PATCH] CVE-2022-3821
-
-Upstream-Status: Backport [https://github.com/systemd/systemd-stable/commit/72d4c15a946d20143cd4c6783c802124bc894dc7]
-CVE: CVE-2022-3821
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- src/basic/time-util.c     | 2 +-
- src/test/test-time-util.c | 5 +++++
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/src/basic/time-util.c b/src/basic/time-util.c
-index b659d6905d..89dc593d44 100644
---- a/src/basic/time-util.c
-+++ b/src/basic/time-util.c
-@@ -588,7 +588,7 @@ char *format_timespan(char *buf, size_t l, usec_t t, usec_t accuracy) {
-                         t = b;
-                 }
- 
--                n = MIN((size_t) k, l);
-+                n = MIN((size_t) k, l-1);
- 
-                 l -= n;
-                 p += n;
-diff --git a/src/test/test-time-util.c b/src/test/test-time-util.c
-index 4d0131827e..8db6b25279 100644
---- a/src/test/test-time-util.c
-+++ b/src/test/test-time-util.c
-@@ -238,6 +238,11 @@ TEST(format_timespan) {
-         test_format_timespan_accuracy(1);
-         test_format_timespan_accuracy(USEC_PER_MSEC);
-         test_format_timespan_accuracy(USEC_PER_SEC);
-+
-+        /* See issue #23928. */
-+        _cleanup_free_ char *buf;
-+        assert_se(buf = new(char, 5));
-+        assert_se(buf == format_timespan(buf, 5, 100005, 1000));
- }
- 
- TEST(verify_timezone) {
--- 
-2.25.1
-
diff --git a/meta/recipes-core/systemd/systemd/CVE-2022-4415-1.patch b/meta/recipes-core/systemd/systemd/CVE-2022-4415-1.patch
deleted file mode 100644
index 5cf0fe284e..0000000000
--- a/meta/recipes-core/systemd/systemd/CVE-2022-4415-1.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 45d323fc889a55fae400a5b08a56273d5724ef4a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
-Date: Tue, 29 Nov 2022 09:00:16 +0100
-Subject: [PATCH 1/2] coredump: adjust whitespace
-
-(cherry picked from commit 510a146634f3e095b34e2a26023b1b1f99dcb8c0)
-(cherry picked from commit cc2eb7a9b5fd6d9dd8ea35fb045ce6e5e16e1187)
-(cherry picked from commit cb044d734c44cd3c05a6e438b5b995b2a9cfa73c)
-
-Preparation to avoid conflicts when applying CVE CVE-2022-4415
-Upstream-Status: Backport [https://github.com/systemd/systemd-stable/commit/45d323fc889a55fae400a5b08a56273d5724ef4a]
-
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/coredump/coredump.c | 56 ++++++++++++++++++++---------------------
- 1 file changed, 28 insertions(+), 28 deletions(-)
-
-diff --git a/src/coredump/coredump.c b/src/coredump/coredump.c
-index eaea63f682..8295b03ac7 100644
---- a/src/coredump/coredump.c
-+++ b/src/coredump/coredump.c
-@@ -103,16 +103,16 @@ enum {
- };
- 
- static const char * const meta_field_names[_META_MAX] = {
--        [META_ARGV_PID]          = "COREDUMP_PID=",
--        [META_ARGV_UID]          = "COREDUMP_UID=",
--        [META_ARGV_GID]          = "COREDUMP_GID=",
--        [META_ARGV_SIGNAL]       = "COREDUMP_SIGNAL=",
--        [META_ARGV_TIMESTAMP]    = "COREDUMP_TIMESTAMP=",
--        [META_ARGV_RLIMIT]       = "COREDUMP_RLIMIT=",
--        [META_ARGV_HOSTNAME]     = "COREDUMP_HOSTNAME=",
--        [META_COMM]              = "COREDUMP_COMM=",
--        [META_EXE]               = "COREDUMP_EXE=",
--        [META_UNIT]              = "COREDUMP_UNIT=",
-+        [META_ARGV_PID]       = "COREDUMP_PID=",
-+        [META_ARGV_UID]       = "COREDUMP_UID=",
-+        [META_ARGV_GID]       = "COREDUMP_GID=",
-+        [META_ARGV_SIGNAL]    = "COREDUMP_SIGNAL=",
-+        [META_ARGV_TIMESTAMP] = "COREDUMP_TIMESTAMP=",
-+        [META_ARGV_RLIMIT]    = "COREDUMP_RLIMIT=",
-+        [META_ARGV_HOSTNAME]  = "COREDUMP_HOSTNAME=",
-+        [META_COMM]           = "COREDUMP_COMM=",
-+        [META_EXE]            = "COREDUMP_EXE=",
-+        [META_UNIT]           = "COREDUMP_UNIT=",
- };
- 
- typedef struct Context {
-@@ -131,9 +131,9 @@ typedef enum CoredumpStorage {
- } CoredumpStorage;
- 
- static const char* const coredump_storage_table[_COREDUMP_STORAGE_MAX] = {
--        [COREDUMP_STORAGE_NONE] = "none",
-+        [COREDUMP_STORAGE_NONE]     = "none",
-         [COREDUMP_STORAGE_EXTERNAL] = "external",
--        [COREDUMP_STORAGE_JOURNAL] = "journal",
-+        [COREDUMP_STORAGE_JOURNAL]  = "journal",
- };
- 
- DEFINE_PRIVATE_STRING_TABLE_LOOKUP(coredump_storage, CoredumpStorage);
-@@ -149,13 +149,13 @@ static uint64_t arg_max_use = UINT64_MAX;
- 
- static int parse_config(void) {
-         static const ConfigTableItem items[] = {
--                { "Coredump", "Storage",          config_parse_coredump_storage,           0, &arg_storage           },
--                { "Coredump", "Compress",         config_parse_bool,                       0, &arg_compress          },
--                { "Coredump", "ProcessSizeMax",   config_parse_iec_uint64,                 0, &arg_process_size_max  },
--                { "Coredump", "ExternalSizeMax",  config_parse_iec_uint64_infinity,        0, &arg_external_size_max },
--                { "Coredump", "JournalSizeMax",   config_parse_iec_size,                   0, &arg_journal_size_max  },
--                { "Coredump", "KeepFree",         config_parse_iec_uint64,                 0, &arg_keep_free         },
--                { "Coredump", "MaxUse",           config_parse_iec_uint64,                 0, &arg_max_use           },
-+                { "Coredump", "Storage",          config_parse_coredump_storage,     0, &arg_storage           },
-+                { "Coredump", "Compress",         config_parse_bool,                 0, &arg_compress          },
-+                { "Coredump", "ProcessSizeMax",   config_parse_iec_uint64,           0, &arg_process_size_max  },
-+                { "Coredump", "ExternalSizeMax",  config_parse_iec_uint64_infinity,  0, &arg_external_size_max },
-+                { "Coredump", "JournalSizeMax",   config_parse_iec_size,             0, &arg_journal_size_max  },
-+                { "Coredump", "KeepFree",         config_parse_iec_uint64,           0, &arg_keep_free         },
-+                { "Coredump", "MaxUse",           config_parse_iec_uint64,           0, &arg_max_use           },
-                 {}
-         };
- 
-@@ -201,15 +201,15 @@ static int fix_acl(int fd, uid_t uid) {
- static int fix_xattr(int fd, const Context *context) {
- 
-         static const char * const xattrs[_META_MAX] = {
--                [META_ARGV_PID]          = "user.coredump.pid",
--                [META_ARGV_UID]          = "user.coredump.uid",
--                [META_ARGV_GID]          = "user.coredump.gid",
--                [META_ARGV_SIGNAL]       = "user.coredump.signal",
--                [META_ARGV_TIMESTAMP]    = "user.coredump.timestamp",
--                [META_ARGV_RLIMIT]       = "user.coredump.rlimit",
--                [META_ARGV_HOSTNAME]     = "user.coredump.hostname",
--                [META_COMM]              = "user.coredump.comm",
--                [META_EXE]               = "user.coredump.exe",
-+                [META_ARGV_PID]       = "user.coredump.pid",
-+                [META_ARGV_UID]       = "user.coredump.uid",
-+                [META_ARGV_GID]       = "user.coredump.gid",
-+                [META_ARGV_SIGNAL]    = "user.coredump.signal",
-+                [META_ARGV_TIMESTAMP] = "user.coredump.timestamp",
-+                [META_ARGV_RLIMIT]    = "user.coredump.rlimit",
-+                [META_ARGV_HOSTNAME]  = "user.coredump.hostname",
-+                [META_COMM]           = "user.coredump.comm",
-+                [META_EXE]            = "user.coredump.exe",
-         };
- 
-         int r = 0;
--- 
-2.30.2
-
diff --git a/meta/recipes-core/systemd/systemd/CVE-2022-4415-2.patch b/meta/recipes-core/systemd/systemd/CVE-2022-4415-2.patch
deleted file mode 100644
index 8389ee8cd6..0000000000
--- a/meta/recipes-core/systemd/systemd/CVE-2022-4415-2.patch
+++ /dev/null
@@ -1,391 +0,0 @@
-From 1d5e0e9910500f3c3584485f77bfc35e601036e3 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
-Date: Mon, 28 Nov 2022 12:12:55 +0100
-Subject: [PATCH 2/2] coredump: do not allow user to access coredumps with
- changed uid/gid/capabilities
-
-When the user starts a program which elevates its permissions via setuid,
-setgid, or capabilities set on the file, it may access additional information
-which would then be visible in the coredump. We shouldn't make the the coredump
-visible to the user in such cases.
-
-Reported-by: Matthias Gerstner <mgerstner@suse.de>
-
-This reads the /proc/<pid>/auxv file and attaches it to the process metadata as
-PROC_AUXV. Before the coredump is submitted, it is parsed and if either
-at_secure was set (which the kernel will do for processes that are setuid,
-setgid, or setcap), or if the effective uid/gid don't match uid/gid, the file
-is not made accessible to the user. If we can't access this data, we assume the
-file should not be made accessible either. In principle we could also access
-the auxv data from a note in the core file, but that is much more complex and
-it seems better to use the stand-alone file that is provided by the kernel.
-
-Attaching auxv is both convient for this patch (because this way it's passed
-between the stages along with other fields), but I think it makes sense to save
-it in general.
-
-We use the information early in the core file to figure out if the program was
-32-bit or 64-bit and its endianness. This way we don't need heuristics to guess
-whether the format of the auxv structure. This test might reject some cases on
-fringe architecutes. But the impact would be limited: we just won't grant the
-user permissions to view the coredump file. If people report that we're missing
-some cases, we can always enhance this to support more architectures.
-
-I tested auxv parsing on amd64, 32-bit program on amd64, arm64, arm32, and
-ppc64el, but not the whole coredump handling.
-
-(cherry picked from commit 3e4d0f6cf99f8677edd6a237382a65bfe758de03)
-(cherry picked from commit 9b75a3d0502d6741c8ecb7175794345f8eb3827c)
-(cherry picked from commit efca5283dc791a07171f80eef84e14fdb58fad57)
-
-CVE: CVE-2022-4415
-Upstream-Status: Backport [https://github.com/systemd/systemd-stable/commit/1d5e0e9910500f3c3584485f77bfc35e601036e3]
-
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/basic/io-util.h     |   9 ++
- src/coredump/coredump.c | 196 +++++++++++++++++++++++++++++++++++++---
- 2 files changed, 192 insertions(+), 13 deletions(-)
-
-diff --git a/src/basic/io-util.h b/src/basic/io-util.h
-index 39728e06bc..3afb134266 100644
---- a/src/basic/io-util.h
-+++ b/src/basic/io-util.h
-@@ -91,7 +91,16 @@ struct iovec_wrapper *iovw_new(void);
- struct iovec_wrapper *iovw_free(struct iovec_wrapper *iovw);
- struct iovec_wrapper *iovw_free_free(struct iovec_wrapper *iovw);
- void iovw_free_contents(struct iovec_wrapper *iovw, bool free_vectors);
-+
- int iovw_put(struct iovec_wrapper *iovw, void *data, size_t len);
-+static inline int iovw_consume(struct iovec_wrapper *iovw, void *data, size_t len) {
-+        /* Move data into iovw or free on error */
-+        int r = iovw_put(iovw, data, len);
-+        if (r < 0)
-+                free(data);
-+        return r;
-+}
-+
- int iovw_put_string_field(struct iovec_wrapper *iovw, const char *field, const char *value);
- int iovw_put_string_field_free(struct iovec_wrapper *iovw, const char *field, char *value);
- void iovw_rebase(struct iovec_wrapper *iovw, char *old, char *new);
-diff --git a/src/coredump/coredump.c b/src/coredump/coredump.c
-index 8295b03ac7..79280ab986 100644
---- a/src/coredump/coredump.c
-+++ b/src/coredump/coredump.c
-@@ -4,6 +4,7 @@
- #include <stdio.h>
- #include <sys/prctl.h>
- #include <sys/statvfs.h>
-+#include <sys/auxv.h>
- #include <sys/xattr.h>
- #include <unistd.h>
- 
-@@ -99,6 +100,7 @@ enum {
- 
-         META_EXE = _META_MANDATORY_MAX,
-         META_UNIT,
-+        META_PROC_AUXV,
-         _META_MAX
- };
- 
-@@ -113,10 +115,12 @@ static const char * const meta_field_names[_META_MAX] = {
-         [META_COMM]           = "COREDUMP_COMM=",
-         [META_EXE]            = "COREDUMP_EXE=",
-         [META_UNIT]           = "COREDUMP_UNIT=",
-+        [META_PROC_AUXV]      = "COREDUMP_PROC_AUXV=",
- };
- 
- typedef struct Context {
-         const char *meta[_META_MAX];
-+        size_t meta_size[_META_MAX];
-         pid_t pid;
-         bool is_pid1;
-         bool is_journald;
-@@ -178,13 +182,16 @@ static uint64_t storage_size_max(void) {
-         return 0;
- }
- 
--static int fix_acl(int fd, uid_t uid) {
-+static int fix_acl(int fd, uid_t uid, bool allow_user) {
-+        assert(fd >= 0);
-+        assert(uid_is_valid(uid));
- 
- #if HAVE_ACL
-         int r;
- 
--        assert(fd >= 0);
--        assert(uid_is_valid(uid));
-+        /* We don't allow users to read coredumps if the uid or capabilities were changed. */
-+        if (!allow_user)
-+                return 0;
- 
-         if (uid_is_system(uid) || uid_is_dynamic(uid) || uid == UID_NOBODY)
-                 return 0;
-@@ -244,7 +251,8 @@ static int fix_permissions(
-                 const char *filename,
-                 const char *target,
-                 const Context *context,
--                uid_t uid) {
-+                uid_t uid,
-+                bool allow_user) {
- 
-         int r;
- 
-@@ -254,7 +262,7 @@ static int fix_permissions(
- 
-         /* Ignore errors on these */
-         (void) fchmod(fd, 0640);
--        (void) fix_acl(fd, uid);
-+        (void) fix_acl(fd, uid, allow_user);
-         (void) fix_xattr(fd, context);
- 
-         r = fsync_full(fd);
-@@ -324,6 +332,153 @@ static int make_filename(const Context *context, char **ret) {
-         return 0;
- }
- 
-+static int parse_auxv64(
-+                const uint64_t *auxv,
-+                size_t size_bytes,
-+                int *at_secure,
-+                uid_t *uid,
-+                uid_t *euid,
-+                gid_t *gid,
-+                gid_t *egid) {
-+
-+        assert(auxv || size_bytes == 0);
-+
-+        if (size_bytes % (2 * sizeof(uint64_t)) != 0)
-+                return log_warning_errno(SYNTHETIC_ERRNO(EIO), "Incomplete auxv structure (%zu bytes).", size_bytes);
-+
-+        size_t words = size_bytes / sizeof(uint64_t);
-+
-+        /* Note that we set output variables even on error. */
-+
-+        for (size_t i = 0; i + 1 < words; i += 2)
-+                switch (auxv[i]) {
-+                case AT_SECURE:
-+                        *at_secure = auxv[i + 1] != 0;
-+                        break;
-+                case AT_UID:
-+                        *uid = auxv[i + 1];
-+                        break;
-+                case AT_EUID:
-+                        *euid = auxv[i + 1];
-+                        break;
-+                case AT_GID:
-+                        *gid = auxv[i + 1];
-+                        break;
-+                case AT_EGID:
-+                        *egid = auxv[i + 1];
-+                        break;
-+                case AT_NULL:
-+                        if (auxv[i + 1] != 0)
-+                                goto error;
-+                        return 0;
-+                }
-+ error:
-+        return log_warning_errno(SYNTHETIC_ERRNO(ENODATA),
-+                                 "AT_NULL terminator not found, cannot parse auxv structure.");
-+}
-+
-+static int parse_auxv32(
-+                const uint32_t *auxv,
-+                size_t size_bytes,
-+                int *at_secure,
-+                uid_t *uid,
-+                uid_t *euid,
-+                gid_t *gid,
-+                gid_t *egid) {
-+
-+        assert(auxv || size_bytes == 0);
-+
-+        size_t words = size_bytes / sizeof(uint32_t);
-+
-+        if (size_bytes % (2 * sizeof(uint32_t)) != 0)
-+                return log_warning_errno(SYNTHETIC_ERRNO(EIO), "Incomplete auxv structure (%zu bytes).", size_bytes);
-+
-+        /* Note that we set output variables even on error. */
-+
-+        for (size_t i = 0; i + 1 < words; i += 2)
-+                switch (auxv[i]) {
-+                case AT_SECURE:
-+                        *at_secure = auxv[i + 1] != 0;
-+                        break;
-+                case AT_UID:
-+                        *uid = auxv[i + 1];
-+                        break;
-+                case AT_EUID:
-+                        *euid = auxv[i + 1];
-+                        break;
-+                case AT_GID:
-+                        *gid = auxv[i + 1];
-+                        break;
-+                case AT_EGID:
-+                        *egid = auxv[i + 1];
-+                        break;
-+                case AT_NULL:
-+                        if (auxv[i + 1] != 0)
-+                                goto error;
-+                        return 0;
-+                }
-+ error:
-+        return log_warning_errno(SYNTHETIC_ERRNO(ENODATA),
-+                                 "AT_NULL terminator not found, cannot parse auxv structure.");
-+}
-+
-+static int grant_user_access(int core_fd, const Context *context) {
-+        int at_secure = -1;
-+        uid_t uid = UID_INVALID, euid = UID_INVALID;
-+        uid_t gid = GID_INVALID, egid = GID_INVALID;
-+        int r;
-+
-+        assert(core_fd >= 0);
-+        assert(context);
-+
-+        if (!context->meta[META_PROC_AUXV])
-+                return log_warning_errno(SYNTHETIC_ERRNO(ENODATA), "No auxv data, not adjusting permissions.");
-+
-+        uint8_t elf[EI_NIDENT];
-+        errno = 0;
-+        if (pread(core_fd, &elf, sizeof(elf), 0) != sizeof(elf))
-+                return log_warning_errno(errno_or_else(EIO),
-+                                         "Failed to pread from coredump fd: %s", errno != 0 ? strerror_safe(errno) : "Unexpected EOF");
-+
-+        if (elf[EI_MAG0] != ELFMAG0 ||
-+            elf[EI_MAG1] != ELFMAG1 ||
-+            elf[EI_MAG2] != ELFMAG2 ||
-+            elf[EI_MAG3] != ELFMAG3 ||
-+            elf[EI_VERSION] != EV_CURRENT)
-+                return log_info_errno(SYNTHETIC_ERRNO(EUCLEAN),
-+                                      "Core file does not have ELF header, not adjusting permissions.");
-+        if (!IN_SET(elf[EI_CLASS], ELFCLASS32, ELFCLASS64) ||
-+            !IN_SET(elf[EI_DATA], ELFDATA2LSB, ELFDATA2MSB))
-+                return log_info_errno(SYNTHETIC_ERRNO(EUCLEAN),
-+                                      "Core file has strange ELF class, not adjusting permissions.");
-+
-+        if ((elf[EI_DATA] == ELFDATA2LSB) != (__BYTE_ORDER == __LITTLE_ENDIAN))
-+                return log_info_errno(SYNTHETIC_ERRNO(EUCLEAN),
-+                                      "Core file has non-native endianness, not adjusting permissions.");
-+
-+        if (elf[EI_CLASS] == ELFCLASS64)
-+                r = parse_auxv64((const uint64_t*) context->meta[META_PROC_AUXV],
-+                                 context->meta_size[META_PROC_AUXV],
-+                                 &at_secure, &uid, &euid, &gid, &egid);
-+        else
-+                r = parse_auxv32((const uint32_t*) context->meta[META_PROC_AUXV],
-+                                 context->meta_size[META_PROC_AUXV],
-+                                 &at_secure, &uid, &euid, &gid, &egid);
-+        if (r < 0)
-+                return r;
-+
-+        /* We allow access if we got all the data and at_secure is not set and
-+         * the uid/gid matches euid/egid. */
-+        bool ret =
-+                at_secure == 0 &&
-+                uid != UID_INVALID && euid != UID_INVALID && uid == euid &&
-+                gid != GID_INVALID && egid != GID_INVALID && gid == egid;
-+        log_debug("Will %s access (uid="UID_FMT " euid="UID_FMT " gid="GID_FMT " egid="GID_FMT " at_secure=%s)",
-+                  ret ? "permit" : "restrict",
-+                  uid, euid, gid, egid, yes_no(at_secure));
-+        return ret;
-+}
-+
- static int save_external_coredump(
-                 const Context *context,
-                 int input_fd,
-@@ -446,6 +601,8 @@ static int save_external_coredump(
-                                 context->meta[META_ARGV_PID], context->meta[META_COMM]);
-         truncated = r == 1;
- 
-+        bool allow_user = grant_user_access(fd, context) > 0;
-+
- #if HAVE_COMPRESSION
-         if (arg_compress) {
-                 _cleanup_(unlink_and_freep) char *tmp_compressed = NULL;
-@@ -483,7 +640,7 @@ static int save_external_coredump(
-                         uncompressed_size += partial_uncompressed_size;
-                 }
- 
--                r = fix_permissions(fd_compressed, tmp_compressed, fn_compressed, context, uid);
-+                r = fix_permissions(fd_compressed, tmp_compressed, fn_compressed, context, uid, allow_user);
-                 if (r < 0)
-                         return r;
- 
-@@ -510,7 +667,7 @@ static int save_external_coredump(
-                            "SIZE_LIMIT=%zu", max_size,
-                            "MESSAGE_ID=" SD_MESSAGE_TRUNCATED_CORE_STR);
- 
--        r = fix_permissions(fd, tmp, fn, context, uid);
-+        r = fix_permissions(fd, tmp, fn, context, uid, allow_user);
-         if (r < 0)
-                 return log_error_errno(r, "Failed to fix permissions and finalize coredump %s into %s: %m", coredump_tmpfile_name(tmp), fn);
- 
-@@ -758,7 +915,7 @@ static int change_uid_gid(const Context *context) {
- }
- 
- static int submit_coredump(
--                Context *context,
-+                const Context *context,
-                 struct iovec_wrapper *iovw,
-                 int input_fd) {
- 
-@@ -919,16 +1076,15 @@ static int save_context(Context *context, const struct iovec_wrapper *iovw) {
-                 struct iovec *iovec = iovw->iovec + n;
- 
-                 for (size_t i = 0; i < ELEMENTSOF(meta_field_names); i++) {
--                        char *p;
--
-                         /* Note that these strings are NUL terminated, because we made sure that a
-                          * trailing NUL byte is in the buffer, though not included in the iov_len
-                          * count (see process_socket() and gather_pid_metadata_*()) */
-                         assert(((char*) iovec->iov_base)[iovec->iov_len] == 0);
- 
--                        p = startswith(iovec->iov_base, meta_field_names[i]);
-+                        const char *p = startswith(iovec->iov_base, meta_field_names[i]);
-                         if (p) {
-                                 context->meta[i] = p;
-+                                context->meta_size[i] = iovec->iov_len - strlen(meta_field_names[i]);
-                                 count++;
-                                 break;
-                         }
-@@ -1170,6 +1326,7 @@ static int gather_pid_metadata(struct iovec_wrapper *iovw, Context *context) {
-         uid_t owner_uid;
-         pid_t pid;
-         char *t;
-+        size_t size;
-         const char *p;
-         int r;
- 
-@@ -1234,13 +1391,26 @@ static int gather_pid_metadata(struct iovec_wrapper *iovw, Context *context) {
-                 (void) iovw_put_string_field_free(iovw, "COREDUMP_PROC_LIMITS=", t);
- 
-         p = procfs_file_alloca(pid, "cgroup");
--        if (read_full_virtual_file(p, &t, NULL) >=0)
-+        if (read_full_virtual_file(p, &t, NULL) >= 0)
-                 (void) iovw_put_string_field_free(iovw, "COREDUMP_PROC_CGROUP=", t);
- 
-         p = procfs_file_alloca(pid, "mountinfo");
--        if (read_full_virtual_file(p, &t, NULL) >=0)
-+        if (read_full_virtual_file(p, &t, NULL) >= 0)
-                 (void) iovw_put_string_field_free(iovw, "COREDUMP_PROC_MOUNTINFO=", t);
- 
-+        /* We attach /proc/auxv here. ELF coredumps also contain a note for this (NT_AUXV), see elf(5). */
-+        p = procfs_file_alloca(pid, "auxv");
-+        if (read_full_virtual_file(p, &t, &size) >= 0) {
-+                char *buf = malloc(strlen("COREDUMP_PROC_AUXV=") + size + 1);
-+                if (buf) {
-+                        /* Add a dummy terminator to make save_context() happy. */
-+                        *((uint8_t*) mempcpy(stpcpy(buf, "COREDUMP_PROC_AUXV="), t, size)) = '\0';
-+                        (void) iovw_consume(iovw, buf, size + strlen("COREDUMP_PROC_AUXV="));
-+                }
-+
-+                free(t);
-+        }
-+
-         if (get_process_cwd(pid, &t) >= 0)
-                 (void) iovw_put_string_field_free(iovw, "COREDUMP_CWD=", t);
- 
--- 
-2.30.2
-
diff --git a/meta/recipes-core/systemd/systemd/CVE-2022-45873.patch b/meta/recipes-core/systemd/systemd/CVE-2022-45873.patch
deleted file mode 100644
index 94bd22ca43..0000000000
--- a/meta/recipes-core/systemd/systemd/CVE-2022-45873.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-From 076b807be472630692c5348c60d0c2b7b28ad437 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
-Date: Tue, 18 Oct 2022 18:23:53 +0200
-Subject: [PATCH] coredump: avoid deadlock when passing processed backtrace
- data
-
-We would deadlock when passing the data back from the forked-off process that
-was doing backtrace generation back to the coredump parent. This is because we
-fork the child and wait for it to exit. The child tries to write too much data
-to the output pipe, and and after the first 64k blocks on the parent because
-the pipe is full. The bug surfaced in Fedora because of a combination of four
-factors:
-- 87707784c70dc9894ec613df0a6e75e732a362a3 was backported to v251.5, which
-  allowed coredump processing to be successful.
-- 1a0281a3ebf4f8c16d40aa9e63103f16cd23bb2a was NOT backported, so the output
-  was very verbose.
-- Fedora has the ELF package metadata available, so a lot of output can be
-  generated. Most other distros just don't have the information.
-- gnome-calendar crashes and has a bazillion modules and 69596 bytes of output
-  are generated for it.
-
-Fixes https://bugzilla.redhat.com/show_bug.cgi?id=2135778.
-
-The code is changed to try to write data opportunistically. If we get partial
-information, that is still logged. In is generally better to log partial
-backtrace information than nothing at all.
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/076b807be472630692c5348c60d0c2b7b28ad437]
-CVE: CVE-2022-45873
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- src/shared/elf-util.c | 37 +++++++++++++++++++++++++++++++------
- 1 file changed, 31 insertions(+), 6 deletions(-)
-
-diff --git a/src/shared/elf-util.c b/src/shared/elf-util.c
-index 6d9fcfbbf2..bd27507346 100644
---- a/src/shared/elf-util.c
-+++ b/src/shared/elf-util.c
-@@ -30,6 +30,9 @@
- #define THREADS_MAX 64
- #define ELF_PACKAGE_METADATA_ID 0xcafe1a7e
- 
-+/* The amount of data we're willing to write to each of the output pipes. */
-+#define COREDUMP_PIPE_MAX (1024*1024U)
-+
- static void *dw_dl = NULL;
- static void *elf_dl = NULL;
- 
-@@ -700,13 +703,13 @@ int parse_elf_object(int fd, const char *executable, bool fork_disable_dump, cha
-                 return r;
- 
-         if (ret) {
--                r = RET_NERRNO(pipe2(return_pipe, O_CLOEXEC));
-+                r = RET_NERRNO(pipe2(return_pipe, O_CLOEXEC|O_NONBLOCK));
-                 if (r < 0)
-                         return r;
-         }
- 
-         if (ret_package_metadata) {
--                r = RET_NERRNO(pipe2(json_pipe, O_CLOEXEC));
-+                r = RET_NERRNO(pipe2(json_pipe, O_CLOEXEC|O_NONBLOCK));
-                 if (r < 0)
-                         return r;
-         }
-@@ -750,8 +753,24 @@ int parse_elf_object(int fd, const char *executable, bool fork_disable_dump, cha
-                         goto child_fail;
- 
-                 if (buf) {
--                        r = loop_write(return_pipe[1], buf, strlen(buf), false);
--                        if (r < 0)
-+                        size_t len = strlen(buf);
-+
-+                        if (len > COREDUMP_PIPE_MAX) {
-+                                /* This is iffy. A backtrace can be a few hundred kilobytes, but too much is
-+                                 * too much. Let's log a warning and ignore the rest. */
-+                                log_warning("Generated backtrace is %zu bytes (more than the limit of %u bytes), backtrace will be truncated.",
-+                                            len, COREDUMP_PIPE_MAX);
-+                                len = COREDUMP_PIPE_MAX;
-+                        }
-+
-+                        /* Bump the space for the returned string.
-+                         * Failure is ignored, because partial output is still useful. */
-+                        (void) fcntl(return_pipe[1], F_SETPIPE_SZ, len);
-+
-+                        r = loop_write(return_pipe[1], buf, len, false);
-+                        if (r == -EAGAIN)
-+                                log_warning("Write failed, backtrace will be truncated.");
-+                        else if (r < 0)
-                                 goto child_fail;
- 
-                         return_pipe[1] = safe_close(return_pipe[1]);
-@@ -760,13 +779,19 @@ int parse_elf_object(int fd, const char *executable, bool fork_disable_dump, cha
-                 if (package_metadata) {
-                         _cleanup_fclose_ FILE *json_out = NULL;
- 
-+                        /* Bump the space for the returned string. We don't know how much space we'll need in
-+                         * advance, so we'll just try to write as much as possible and maybe fail later. */
-+                        (void) fcntl(json_pipe[1], F_SETPIPE_SZ, COREDUMP_PIPE_MAX);
-+
-                         json_out = take_fdopen(&json_pipe[1], "w");
-                         if (!json_out) {
-                                 r = -errno;
-                                 goto child_fail;
-                         }
- 
--                        json_variant_dump(package_metadata, JSON_FORMAT_FLUSH, json_out, NULL);
-+                        r = json_variant_dump(package_metadata, JSON_FORMAT_FLUSH, json_out, NULL);
-+                        if (r < 0)
-+                                log_warning_errno(r, "Failed to write JSON package metadata, ignoring: %m");
-                 }
- 
-                 _exit(EXIT_SUCCESS);
-@@ -801,7 +826,7 @@ int parse_elf_object(int fd, const char *executable, bool fork_disable_dump, cha
- 
-                 r = json_parse_file(json_in, NULL, 0, &package_metadata, NULL, NULL);
-                 if (r < 0 && r != -EINVAL) /* EINVAL: json was empty, so we got nothing, but that's ok */
--                        return r;
-+                        log_warning_errno(r, "Failed to read or parse json metadata, ignoring: %m");
-         }
- 
-         if (ret)
--- 
-2.25.1
-
diff --git a/meta/recipes-core/systemd/systemd/CVE-2023-7008.patch b/meta/recipes-core/systemd/systemd/CVE-2023-7008.patch
deleted file mode 100644
index e2296abc49..0000000000
--- a/meta/recipes-core/systemd/systemd/CVE-2023-7008.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 3b4cc1437b51fcc0b08da8cc3f5d1175eed25eb1 Mon Sep 17 00:00:00 2001
-From: Michal Sekletar <msekleta@redhat.com>
-Date: Wed, 20 Dec 2023 16:44:14 +0100
-Subject: [PATCH] resolved: actually check authenticated flag of SOA
- transaction
-
-Fixes #25676
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/3b4cc1437b51fcc0b08da8cc3f5d1175eed25eb1]
-CVE: CVE-2023-7008
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- src/resolve/resolved-dns-transaction.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/resolve/resolved-dns-transaction.c b/src/resolve/resolved-dns-transaction.c
-index f937f9f7b5..7deb598400 100644
---- a/src/resolve/resolved-dns-transaction.c
-+++ b/src/resolve/resolved-dns-transaction.c
-@@ -2761,7 +2761,7 @@ static int dns_transaction_requires_rrsig(DnsTransaction *t, DnsResourceRecord *
-                         if (r == 0)
-                                 continue;
- 
--                        return FLAGS_SET(t->answer_query_flags, SD_RESOLVED_AUTHENTICATED);
-+                        return FLAGS_SET(dt->answer_query_flags, SD_RESOLVED_AUTHENTICATED);
-                 }
- 
-                 return true;
-@@ -2788,7 +2788,7 @@ static int dns_transaction_requires_rrsig(DnsTransaction *t, DnsResourceRecord *
-                         /* We found the transaction that was supposed to find the SOA RR for us. It was
-                          * successful, but found no RR for us. This means we are not at a zone cut. In this
-                          * case, we require authentication if the SOA lookup was authenticated too. */
--                        return FLAGS_SET(t->answer_query_flags, SD_RESOLVED_AUTHENTICATED);
-+                        return FLAGS_SET(dt->answer_query_flags, SD_RESOLVED_AUTHENTICATED);
-                 }
- 
-                 return true;
--- 
-2.25.1
-
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.14.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_250.5.bb
rename to meta/recipes-core/systemd/systemd_250.14.bb
index 4d520c85f3..ef0476fad9 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.14.bb
@@ -25,15 +25,10 @@ SRC_URI += "file://touchscreen.rules \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
            file://0001-resolve-Use-sockaddr-pointer-type-for-bind.patch \
-           file://CVE-2022-3821.patch \
-           file://CVE-2022-45873.patch \
-           file://0001-shared-json-allow-json_variant_dump-to-return-an-err.patch \
-           file://CVE-2022-4415-1.patch \
-           file://CVE-2022-4415-2.patch \
            file://0001-network-remove-only-managed-configs-on-reconfigure-o.patch \
            file://0001-nspawn-make-sure-host-root-can-write-to-the-uidmappe.patch \
-           file://CVE-2023-7008.patch \
            file://fix-vlan-qos-mapping.patch \
+           file://0001-core-fix-build-when-seccomp-is-off.patch \
            "
 
 # patches needed by musl
-- 
2.43.0


