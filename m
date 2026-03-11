Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F242B1125839
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 14:13:45 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22031.1773238418685393590
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 07:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E4mb7OL4;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: aehs29@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c7382731edfso4934854a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 07:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773238418; x=1773843218; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uhmsrvXTuzPXNTL+JZpG03/OsbfXKiPj5jk4BTEv0uE=;
        b=E4mb7OL4EJ8H0ebFZpWfmKLpEezVwBvNTx+Cw3K/k7QQCkD4fl9Se2fANiaHEgfnWX
         LsFrQtu2VDw6ZXDCVCc/YoZ+XVN2bijarR1edzBS50v8K4YSRZgATUMtvMzpWauxyyUy
         JORDb4yKv8hqqmmeU/pNehCCFA9CMbStds1hIiq6T9lDEQ0IoS0kd41fxfp3PfZiUCZm
         QjrAmzH2u+UY8l+YhVM43KCHpyI/zb17+XkpXB18Z2nRg3xcynk/8NDWYsKmSAHM3M7N
         iGOvNmtJf0h8cLkDSaQfUWrKENua8aWoKX46TnKJVAyrmfRKdbkLayicBwzpNWz9OsbC
         vxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773238418; x=1773843218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhmsrvXTuzPXNTL+JZpG03/OsbfXKiPj5jk4BTEv0uE=;
        b=ZUA3EeeKs/vs46yguht0tAZMudbfdhqp5fxTgbDb1vrnHKRjotwANybusfFknH13Zr
         d4iiRQqhKScP5Bb2JFdGI74JDnscPkz8qjNFmj8vaiNag/Qp33+r+T7WvSy83g7UVOH9
         4Uo9lP4u4eq8fRxV+dZaa9jaQLuESpwUQUkwIi9LxcQWJN4eJ3SfJIUxqM3/0akJICxx
         Wo/LZWNTgSokHcMVLd+vUOw8/a+4qrh3USH5WDrodoGXrekx0Fhwb2gVpnE4A+zXPTo6
         mJjJxzPNLGfFC3COZqSVpjm19KVMjFwS7H0vtlt/L1tb4g+uiT4ZjXabJG1JsO8uy7s6
         7HLQ==
X-Gm-Message-State: AOJu0YyltpXQ+JI9YsE/b2LxCfta3BY3NkfwqD8D+ZuR8i8jAvfU7y10
	yEC6gSh9T7PHoNiexk8XKUPnxTXlYc45GOjHVY7bHKDYcvrvjPduB7N1fbY9lNvW
X-Gm-Gg: ATEYQzzF9QxAAygkrIO89eZ7RnCddMVk8JATjlhVd1mbu0cClS1an51lF69YU6SALJT
	ZXJZ7AbTDxTl6KX89HAVou0yT0gu7av6p1QRmnWWSpctf/cVwFX+X1lWG6TZHu4uyvD52z3LMrb
	LW6Bdrh81k/lXBYx5tJT3+7n7Vf14+h8iMDADoUxbSXP3GUNDlfCSIkDXAPijHtJmq1Lt7frAEr
	H8lneY+kT/soI/BDYNbaySdr9/jPUP1RgMS3LWnNaICH4iWg6ewUqbltCjIQMHNYD+2KoqKccjf
	weZFj4mJn5DDSCHq0/TRIMozKYqKGC2+x/F7pByaesa606AbJ9ABXIjLpaVfWAmbrL3vGgWqEc3
	F0JZ8G326eKQyuBirgCV/lVr93N0Tc0a8YXrn8+ZBZgO07RBN8t25Nva7ZTmhnSRzU0HVhKajKV
	0I+Fhfv8Ds8KTkdHRZ1TFSsc8Sle0=
X-Received: by 2002:a17:902:dac2:b0:2a0:e5cd:80a1 with SMTP id d9443c01a7336-2aeae8ab718mr29812555ad.41.1773238417758;
        Wed, 11 Mar 2026 07:13:37 -0700 (PDT)
Received: from DL-ARCH01 ([192.63.190.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae36128dsm28753305ad.78.2026.03.11.07.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:13:37 -0700 (PDT)
From: Alejandro Hernandez Samaniego <aehs29@gmail.com>
X-Google-Original-From: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
Subject: [PATCH 3/3] picolibc: Update 1.8.6 -> 1.8.11
Date: Wed, 11 Mar 2026 08:13:28 -0600
Message-ID: <20260311141329.306642-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 14:13:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232891

Rebased:
- avoid_polluting_cross_directories.patch

Licensing files COPYING.NEWLIB and COPYING.GPL2 were removed upstream,
checksum for COPYING needs update since files included may change with
every release.

Tested to work on qemuarm,aarch64,riscv32 and riscv64 variants
https://dev.azure.com/ahcbb6/baremetal-qemu/_build/results?buildId=21709&view=results

Signed-off-by: Alejandro Hernandez <alhe@linux.microsoft.com>
---
 meta/recipes-core/picolibc/picolibc.inc       |  8 ++--
 .../avoid_polluting_cross_directories.patch   | 43 +++++++++++++------
 2 files changed, 34 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-core/picolibc/picolibc.inc b/meta/recipes-core/picolibc/picolibc.inc
index 68c32894a7..ffbc90b660 100644
--- a/meta/recipes-core/picolibc/picolibc.inc
+++ b/meta/recipes-core/picolibc/picolibc.inc
@@ -7,14 +7,12 @@ SECTION = "libs"
 # are GPLv2 and GeneratePicolibcCrossFile.sh is AGPL3 but not part of the artifacts.
 LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = " \
-		file://COPYING.GPL2;md5=59530bdf33659b29e73d4adb9f9f6552 \
-		file://COPYING.NEWLIB;md5=08ae03456feb75b81cfdb359e0f1ef85 \
-		file://COPYING.picolibc;md5=e50fa9458a40929689861ed472d46bc7 \
+		file://COPYING.picolibc;md5=e44132dded508048efb22b15ccd40d7d \
 		"
 
-BASEVER = "1.8.6"
+BASEVER = "1.8.11"
 PV = "${BASEVER}+git"
 SRC_URI = "git://github.com/picolibc/picolibc.git;protocol=https;branch=main"
-SRCREV = "764ef4e401a8f4c6a86ab723533841f072885a5b"
+SRCREV = "f7edb0869e64b9d687f46961adeef7154921fe92"
 
 B = "${WORKDIR}/build"
diff --git a/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories.patch b/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories.patch
index da6460c95c..54f17a1b62 100644
--- a/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories.patch
+++ b/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories.patch
@@ -1,3 +1,8 @@
+From dda13d0d8d2de700e29582120f8202920c5cf35e Mon Sep 17 00:00:00 2001
+From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
+Date: Tue, 18 Jun 2024 12:12:26 -0600
+Subject: [PATCH] tclibc-picolibc: Adds a new TCLIBC variant to build with
+
 Upstream-Status: Pending
 
 Picolibc uses its own specs file: picolibc.specs to facilitate compilation, this
@@ -21,14 +26,16 @@ then the paths used by the compiler will be relative to the path passed by the
 --sysroot= cmdline argument, setting back the behavior that we intended in the
 first place.
 
-
 Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
+---
+ meson.build | 31 +++++++++++++++++++++++++------
+ 1 file changed, 25 insertions(+), 6 deletions(-)
 
-Index: git/meson.build
-===================================================================
---- git.orig/meson.build
-+++ git/meson.build
-@@ -622,12 +622,13 @@ else
+diff --git a/meson.build b/meson.build
+index 3323741c2..0df0768df 100644
+--- a/meson.build
++++ b/meson.build
+@@ -622,12 +622,13 @@ crt0_expr = '%{-crt0=*:crt0-%*%O; :crt0%O}'
  #
  picolibc_prefix_format = '-picolibc-prefix=*:@0@'
  picolibc_buildtype_format = '-picolibc-buildtype=*:@0@'
@@ -43,7 +50,7 @@ Index: git/meson.build
  
  #
  # Build the -isystem value
-@@ -639,10 +640,13 @@ isystem_prefix = picolibc_prefix_format.
+@@ -639,10 +640,13 @@ isystem_prefix = picolibc_prefix_format.format(prefix_include_dir)
  buildtype_include_dir = specs_prefix_format.format(get_option('includedir') / '%*')
  isystem_buildtype = picolibc_buildtype_format.format(buildtype_include_dir)
  
@@ -56,9 +63,21 @@ Index: git/meson.build
 -specs_isystem = '-isystem ' + specs_option_format.format(isystem_prefix, isystem_buildtype, isystem_gen)
 +specs_isystem = '-isystem ' + specs_option_format.format(isystem_prefix, isystem_buildtype, isystem_sysroot, isystem_gen)
  
+ gcc_dumpmachine = run_command(cc.cmd_array() + ['-dumpmachine'], check : true).stdout().split('\n')[0]
+ 
+@@ -651,7 +655,10 @@ cxxconfig_isystem_prefix = isystem_prefix / cxxconfig_path_postfix
+ cxxconfig_isystem_buildtype = isystem_buildtype / cxxconfig_path_postfix
+ cxxconfig_isystem_gen = isystem_gen / cxxconfig_path_postfix
+ 
+-specs_isystem = specs_isystem + ' -isystem ' + specs_option_format.format(cxxconfig_isystem_prefix, cxxconfig_isystem_buildtype, cxxconfig_isystem_gen)
++sysroot_cxx_dir = '%*'
++cxx_sysroot = sysroot_format.format(sysroot_cxx_dir)
++
++specs_isystem = specs_isystem + ' -isystem ' + specs_option_format.format(cxxconfig_isystem_prefix, cxxconfig_isystem_buildtype, cxx_sysroot, cxxconfig_isystem_gen)
+ 
  #
  # Build the non-multilib -L value
-@@ -654,10 +658,13 @@ lib_prefix = picolibc_prefix_format.form
+@@ -663,10 +670,13 @@ lib_prefix = picolibc_prefix_format.format(prefix_lib_dir)
  buildtype_lib_dir = specs_prefix_format.format(get_option('libdir') / '%*')
  lib_buildtype = picolibc_buildtype_format.format(buildtype_lib_dir)
  
@@ -73,7 +92,7 @@ Index: git/meson.build
  
  #
  # Build the non-multilib *startfile options
-@@ -669,6 +676,9 @@ crt0_prefix = picolibc_prefix_format.for
+@@ -678,6 +688,9 @@ crt0_prefix = picolibc_prefix_format.format(prefix_crt0_path)
  buildtype_crt0_path = specs_prefix_format.format(get_option('libdir') / '%*' / crt0_expr)
  crt0_buildtype = picolibc_buildtype_format.format(buildtype_crt0_path)
  
@@ -83,7 +102,7 @@ Index: git/meson.build
  gen_crt0_path = specs_prefix_format.format(get_option('libdir') / crt0_expr)
  crt0_gen = gen_format.format(gen_crt0_path)
  
-@@ -686,10 +696,13 @@ if enable_multilib
+@@ -695,10 +708,13 @@ if enable_multilib
    buildtype_multilib_dir = specs_prefix_format.format(get_option('libdir') / '%*/%M')
    multilib_buildtype = picolibc_buildtype_format.format(buildtype_multilib_dir)
  
@@ -98,7 +117,7 @@ Index: git/meson.build
  
    #
    # Prepend the multilib -L option to the non-multilib option
-@@ -705,6 +718,9 @@ if enable_multilib
+@@ -714,6 +730,9 @@ if enable_multilib
    buildtype_multilib_crt0_path = specs_prefix_format.format(get_option('libdir') / '%*/%M' / crt0_expr)
    crt0_buildtype = picolibc_buildtype_format.format(buildtype_multilib_crt0_path)
  
@@ -108,7 +127,7 @@ Index: git/meson.build
    gen_multilib_crt0_path = specs_prefix_format.format(get_option('libdir') / '%M' / crt0_expr)
    crt0_gen = gen_format.format(gen_multilib_crt0_path)
  endif
-@@ -714,7 +730,7 @@ endif
+@@ -723,7 +742,7 @@ endif
  # above. As there's only one value, it's either the
  # multilib path or the non-multilib path
  #
-- 
2.53.0


