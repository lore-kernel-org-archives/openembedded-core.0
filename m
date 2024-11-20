Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B6DD743C3
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 19:02:56 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.23070.1732129375305933125
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 11:02:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nXVgeF35;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-431ac30d379so233865e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 11:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732129373; x=1732734173; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KFmnYpiCBi7HbWE5DSST2T9csirZZ+6YD7ERcZsm6Kw=;
        b=nXVgeF35R/1YkYz6vaKQ8Iovp8GJZu9K/BURfED8d9/VDuQ82+G5855al1m54G3suF
         H1EWp0SYOvBg1STdcogAGkpVXLpRVijwpN/ZHJt2ucqTP4jH/40bmwBwJB+sZkDJwAhG
         53u1t3R656qdYqtAMZSTpnhSYGmLIt54Z1AMaz792nGLRWRrGKI8Lbr2Mly0VgPjisy6
         2bhbtm8cxaBtYy49EBeWAMh6sYeWAdkd1NgQIwlCSBycJytW7eNgt0kvA3padOq1501W
         ksvDIDY1f4zxwqUbGtlLx/kYxxMlUt74F8K20aP6CE9p5d6vqi5zHC1hk27tV3Lga/op
         eycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732129373; x=1732734173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFmnYpiCBi7HbWE5DSST2T9csirZZ+6YD7ERcZsm6Kw=;
        b=SlWcW6meKTQ9oCBjtb7YSI6utxZK/91WZRZ9d8v/q91FEitRlCOf50FIV8uiozM3pV
         zHXMxbDH2zz2FQcd9U2JYIlcCbOsUFahrUF6+dQ25Y+R/qnMRZ/39y0EIKUDrvQZArUE
         nILblzH8oWW1fqnAGWmul16GNgjg5l3+KPPljAFO/2nXPcFvxQP8VhOya+Ni2motL4Zj
         zFMWLgQG1nxwPdNFcUGLX+Ez7XxoTkHIU/GohdoZdlu5UnDuMiKzZV3Um1p/oDBlb20C
         YWv5terwEShQ9DeFRZApW5ZO9RGQQWLck3bcZq4U4c0+cRFzEhFU1JCzDSxNYGBDTfVH
         qMAg==
X-Gm-Message-State: AOJu0YwlD4cXq2gZNRiYlTaKlG09Hp8FIwA1hzqv42XIAj/VkNviJUFp
	Z9qf50twODgxilGZtA4O6vr9ICMQ3JbUK6+AfaMxVA2ubrjWFJ5rNaQwaQ==
X-Gm-Gg: ASbGncvabbfMg/LE7cPRTOuH0bmOBrr0xuBX1sdA9g7P35jUmhQxp1E57aNwoO4bvfy
	VAqJc6xWWUnOfcq2X3thVtQgKl56EQpqzaolYbAFZS4w45DYQso7GlzmtImd3ceuCgwa3+tzyWH
	9bfsB4Ex2UdVxRB9st9GT8pgPxPB/VaMsrUCtBVEuEOMGM2WCGMPk8MvBkXuy4+DejjTS6wPP5f
	QK65hXUOPmedPlfhJyCvpsFQeztPzm68oEdpmJf6RXJj4Lt8cG3LMCUixYj97KNkVoJInqX6ns=
X-Google-Smtp-Source: AGHT+IEHOW3SqGTkUq8gW2yFaTCiO2Hl/B6Dxap7UgxwYfXAIEaV021jpXO4d1tpgg4cdL7o2Smc7Q==
X-Received: by 2002:a05:600c:4586:b0:42e:d4a2:ce67 with SMTP id 5b1f17b1804b1-433489d47fcmr39450905e9.17.1732129372807;
        Wed, 20 Nov 2024 11:02:52 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43366cbcd17sm23509175e9.1.2024.11.20.11.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 11:02:52 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] glib-2.0: upgrade 2.82.1 -> 2.82.2
Date: Wed, 20 Nov 2024 19:02:40 +0000
Message-ID: <20241120190240.50414-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 19:02:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207477

https://gitlab.gnome.org/GNOME/glib/-/releases/2.82.2

Upgrade was performed using devtool

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 ...01-Do-not-write-bindir-into-pkg-config-files.patch |  8 ++++----
 .../files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch  |  2 +-
 ...-Install-gio-querymodules-as-libexec_PROGRAM.patch |  6 +++---
 ...he-warning-about-deprecated-paths-in-schemas.patch |  4 ++--
 ...s-resources.c-comment-out-a-build-host-only-.patch |  2 +-
 ...0001-meson-Run-atomics-test-on-clang-as-well.patch |  6 +++---
 ...ild-do-not-enable-pidfd-features-on-native-g.patch |  6 +++---
 ...-not-hardcode-python-path-into-various-tools.patch |  8 ++++----
 .../glib-2.0/files/gdatetime-test-fail-0001.patch     |  9 +++------
 .../glib-2.0/files/gdatetime-test-fail-0002.patch     |  9 +++------
 .../glib-2.0/files/gdatetime-test-fail-0003.patch     | 11 ++++-------
 .../glib-2.0/files/relocate-modules.patch             |  8 ++++----
 meta/recipes-core/glib-2.0/files/skip-timeout.patch   |  2 +-
 ...0-initial_2.82.1.bb => glib-2.0-initial_2.82.2.bb} |  0
 .../{glib-2.0_2.82.1.bb => glib-2.0_2.82.2.bb}        |  0
 meta/recipes-core/glib-2.0/glib.inc                   |  2 +-
 16 files changed, 37 insertions(+), 46 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.82.1.bb => glib-2.0-initial_2.82.2.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.82.1.bb => glib-2.0_2.82.2.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
index ae140b9930..4ef03f3157 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From bcf62c2e776b9716880ac65e5d553d75d5fddc2e Mon Sep 17 00:00:00 2001
+From 7e00964de0ae27f868726413e46f27145807a50d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config files
@@ -15,10 +15,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 13 insertions(+), 11 deletions(-)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index 77cba7b..25d709e 100644
+index 76d67cd..0584ff5 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -883,17 +883,18 @@ libgio_dep = declare_dependency(link_with : libgio,
+@@ -885,17 +885,18 @@ libgio_dep = declare_dependency(link_with : libgio,
  pkg.generate(libgio,
    requires : ['glib-2.0', 'gobject-2.0'],
    variables : [
@@ -46,7 +46,7 @@ index 77cba7b..25d709e 100644
    version : glib_version,
    install_dir : glib_pkgconfigreldir,
 diff --git a/glib/meson.build b/glib/meson.build
-index d2efeba..5f5841d 100644
+index 9f1515b..a40e4f5 100644
 --- a/glib/meson.build
 +++ b/glib/meson.build
 @@ -447,9 +447,10 @@ pkg.generate(libglib,
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index 6da9399569..c1d55d87b6 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From 1d88f52c42a0ed469cb5976f5788b4ba25bb14f9 Mon Sep 17 00:00:00 2001
+From 979d3ddf77abfd00c1e2108cde4aef2d015257b0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 8423f63cbb..9599156eaf 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 75f9eaf2ef760ffb198b0b97a9054f435c79cde9 Mon Sep 17 00:00:00 2001
+From 54f9e7fcbd6345846c379a47c20245259a83d42a Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
@@ -13,10 +13,10 @@ Upstream-Status: Inappropriate [OE specific]
  1 file changed, 1 insertion(+)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index 59c2b0f..77cba7b 100644
+index 1c9a369..76d67cd 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -1007,6 +1007,7 @@ gio_querymodules = executable('gio-querymodules', 'gio-querymodules.c', 'giomodu
+@@ -1009,6 +1009,7 @@ gio_querymodules = executable('gio-querymodules', 'gio-querymodules.c', 'giomodu
    c_args : gio_c_args,
    # intl.lib is not compatible with SAFESEH
    link_args : noseh_link_args,
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index bd7ed77642..e4c193cfbb 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From 22dcd727203d59a025c8be4280b4654a7054322f Mon Sep 17 00:00:00 2001
+From 1300572dfc8e488a3edaed8cb1f22fcf2303e452 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 13 deletions(-)
 
 diff --git a/gio/glib-compile-schemas.c b/gio/glib-compile-schemas.c
-index 04ef404..e791ce2 100644
+index 54b980b..be05894 100644
 --- a/gio/glib-compile-schemas.c
 +++ b/gio/glib-compile-schemas.c
 @@ -1232,19 +1232,6 @@ parse_state_start_schema (ParseState  *state,
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index 8b4304462e..bf3fb93bea 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 3f054111f991a9dd224b6201dafad7e2c28cb78d Mon Sep 17 00:00:00 2001
+From ec777a7f17c28e72f7b0bdcec385656533c50cca Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index ea1ab568d1..9b26ea8e84 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From de3eabf9295816b4b4eb7428dee504fd505e723d Mon Sep 17 00:00:00 2001
+From 8b8953adcd0071c39a78e6d2fd437ad0e149591d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index b995ebc..a907736 100644
+index 5beb14d..963815f 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -2021,7 +2021,7 @@ atomicdefine = '''
+@@ -2050,7 +2050,7 @@ atomicdefine = '''
  # We know that we can always use real ("lock free") atomic operations with MSVC
  if cc.get_id() == 'msvc' or cc.get_id() == 'clang-cl' or cc.links(atomictest, name : 'atomic ops')
    have_atomic_lock_free = true
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index 82a7a5ad23..80f26b738a 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From 546aa941d2fd42f69b3e2bd6625d65c145a5e265 Mon Sep 17 00:00:00 2001
+From 51d592900e8acdec4f043ceeb23e32d27dded8eb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index a907736..53cffb5 100644
+index 963815f..4d4a9f3 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -1019,7 +1019,8 @@ if cc.links('''#include <sys/syscall.h>
+@@ -1048,7 +1048,8 @@ if cc.links('''#include <sys/syscall.h>
                   waitid (P_PIDFD, 0, &child_info, WEXITED | WNOHANG);
                   return 0;
                 }''', name : 'pidfd_open(2) system call')
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
index 4609f1fb2b..8184c9636c 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From 20f64ba4b48e46cf238dc638dc3305036358122b Mon Sep 17 00:00:00 2001
+From cc02206c156cb99c441e56a51639cd5ca64efae9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
@@ -12,7 +12,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/gio/gdbus-2.0/codegen/gdbus-codegen.in b/gio/gdbus-2.0/codegen/gdbus-codegen.in
-index 67d3675..4e92a7a 100755
+index 877505e..49a1e8c 100755
 --- a/gio/gdbus-2.0/codegen/gdbus-codegen.in
 +++ b/gio/gdbus-2.0/codegen/gdbus-codegen.in
 @@ -1,4 +1,4 @@
@@ -22,7 +22,7 @@ index 67d3675..4e92a7a 100755
  # GDBus - GLib D-Bus Library
  #
 diff --git a/gobject/glib-genmarshal.in b/gobject/glib-genmarshal.in
-index aa5af43..56e8e2e 100755
+index 0578b74..56e8e2e 100755
 --- a/gobject/glib-genmarshal.in
 +++ b/gobject/glib-genmarshal.in
 @@ -1,4 +1,4 @@
@@ -32,7 +32,7 @@ index aa5af43..56e8e2e 100755
  # pylint: disable=too-many-lines, missing-docstring, invalid-name
  
 diff --git a/gobject/glib-mkenums.in b/gobject/glib-mkenums.in
-index e10b910..4b619f8 100755
+index 7e794e9..4b619f8 100755
 --- a/gobject/glib-mkenums.in
 +++ b/gobject/glib-mkenums.in
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0001.patch b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0001.patch
index e78d96c3ce..2ee9a40d3d 100644
--- a/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0001.patch
+++ b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0001.patch
@@ -1,7 +1,7 @@
-From 729d1cbcd599e848bee07c72a276ccc02a06ddc0 Mon Sep 17 00:00:00 2001
+From fc893fe975126ca7d5fcf76b66b5c0ccbd4128d5 Mon Sep 17 00:00:00 2001
 From: "Rebecca N. Palmer" <rebecca_palmer@zoho.com>
 Date: Fri, 11 Oct 2024 09:38:52 +0100
-Subject: [PATCH 1/3] gdatetime test: Do not assume PST8PDT was always exactly
+Subject: [PATCH] gdatetime test: Do not assume PST8PDT was always exactly
  -8/-7
 
 In newer tzdata, it is an alias for America/Los_Angeles, which has a
@@ -24,7 +24,7 @@ Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
  1 file changed, 16 insertions(+), 6 deletions(-)
 
 diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
-index d46f653ac..2eefc4106 100644
+index d46f653..2eefc41 100644
 --- a/glib/tests/gdatetime.c
 +++ b/glib/tests/gdatetime.c
 @@ -2930,6 +2930,7 @@ test_posix_parse (void)
@@ -67,6 +67,3 @@ index d46f653ac..2eefc4106 100644
    g_time_zone_unref (tz);
  
    tz = g_time_zone_new_identifier ("PST8PDT6:32:15");
--- 
-2.34.1
-
diff --git a/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0002.patch b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0002.patch
index d97bec12d6..a03d05f0bf 100644
--- a/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0002.patch
+++ b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0002.patch
@@ -1,7 +1,7 @@
-From 2702d7ff73649c05297105bab8977e2a9d28fa0b Mon Sep 17 00:00:00 2001
+From 1110f463fe084ba2675e044be2e045f7c0224a7f Mon Sep 17 00:00:00 2001
 From: Simon McVittie <smcv@debian.org>
 Date: Fri, 18 Oct 2024 11:03:19 +0100
-Subject: [PATCH 2/3] gdatetime test: Try to make PST8PDT test more obviously
+Subject: [PATCH] gdatetime test: Try to make PST8PDT test more obviously
  correct
 
 Instead of using timestamp 0 as a magic number (in this case interpreted
@@ -23,7 +23,7 @@ Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
  1 file changed, 7 insertions(+), 8 deletions(-)
 
 diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
-index 2eefc4106..728b87343 100644
+index 2eefc41..728b873 100644
 --- a/glib/tests/gdatetime.c
 +++ b/glib/tests/gdatetime.c
 @@ -2954,19 +2954,16 @@ test_posix_parse (void)
@@ -60,6 +60,3 @@ index 2eefc4106..728b87343 100644
  
    tz = g_time_zone_new_identifier ("PST8PDT6:32:15");
  #ifdef G_OS_WIN32
--- 
-2.34.1
-
diff --git a/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0003.patch b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0003.patch
index dfeec97810..2ef5fbb993 100644
--- a/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0003.patch
+++ b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0003.patch
@@ -1,8 +1,8 @@
-From df251923fb2c80cc7acfe99aaf8c98d7d7cbd29f Mon Sep 17 00:00:00 2001
+From 5652c74a14b31b730d26de74ca9dcae1df5c1883 Mon Sep 17 00:00:00 2001
 From: Simon McVittie <smcv@debian.org>
 Date: Fri, 18 Oct 2024 11:23:42 +0100
-Subject: [PATCH 3/3] gdatetime test: Fall back if legacy System V PST8PDT is
- not available
+Subject: [PATCH] gdatetime test: Fall back if legacy System V PST8PDT is not
+ available
 
 On recent versions of Debian, PST8PDT is part of the tzdata-legacy
 package, which is not always installed and might disappear in future.
@@ -19,7 +19,7 @@ Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
  1 file changed, 17 insertions(+), 2 deletions(-)
 
 diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
-index 728b87343..9e1acd097 100644
+index 728b873..9e1acd0 100644
 --- a/glib/tests/gdatetime.c
 +++ b/glib/tests/gdatetime.c
 @@ -2931,6 +2931,7 @@ test_posix_parse (void)
@@ -58,6 +58,3 @@ index 728b87343..9e1acd097 100644
    /* a date in winter = non-DST */
    gdt1 = g_date_time_new (tz, 2024, 1, 1, 0, 0, 0);
    i1 = g_time_zone_find_interval (tz, G_TIME_TYPE_STANDARD, g_date_time_to_unix (gdt1));
--- 
-2.34.1
-
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
index a00703cef8..f4bee2f02e 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 41470a56d9ae12912e3f2f9cfb0c126b4f91cd53 Mon Sep 17 00:00:00 2001
+From afe2c1e5854102c0e75f9e70a6569c9f2b6360d8 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -18,10 +18,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 7 deletions(-)
 
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index 1e14955..3c09bb5 100644
+index aa6272f..26aebf7 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
-@@ -1259,11 +1259,6 @@ get_gio_module_dir (void)
+@@ -1263,11 +1263,6 @@ get_gio_module_dir (void)
        g_free (install_dir);
  #else
        module_dir = g_strdup (GIO_MODULE_DIR);
@@ -33,7 +33,7 @@ index 1e14955..3c09bb5 100644
  #include <dlfcn.h>
        {
          g_autofree gchar *path = NULL;
-@@ -1282,8 +1277,6 @@ get_gio_module_dir (void)
+@@ -1286,8 +1281,6 @@ get_gio_module_dir (void)
                }
            }
        }
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
index 5ede64fd59..e5f09a4e2d 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From 18d6798ba0e4e15d63a63485b729b6ef1b6a4457 Mon Sep 17 00:00:00 2001
+From 7cd21568601b78720f92955f1e794ca4f11c225d Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.2.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.2.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.82.2.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.82.2.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index f7631cee83..666d3ef8ef 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -235,7 +235,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "478634440bf52ee4ec4428d558787398c0be6b043c521beb308334b3db4489a6"
+SRC_URI[sha256sum] = "ab45f5a323048b1659ee0fbda5cecd94b099ab3e4b9abf26ae06aeb3e781fd63"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.43.0


