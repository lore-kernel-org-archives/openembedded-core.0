Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194C2C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 03:04:20 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.11907.1702004654311769016
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 19:04:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bP8b8Uri;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d06d4d685aso12388885ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 19:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702004653; x=1702609453; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nNWwL5Jpvt1NqXZA6qDHCMRh8qNn5DD3n7b+kOG1WVg=;
        b=bP8b8UriQQEsroUNDofmtWSfN5PtL4UtXGj/8CYr/20ruC4N1sV9AAgmyeQjGNwPuX
         fUIIyTVYnFyBAfhhxAx95wRnLG/yXhaPzvMB/zrky6ZKhuHSVw0oi+KUYfH58foPYG+o
         L+nDqXDUAgORfci8Ddj9jAlpe2kqQfqj81fiQIsUM7REoPzbQK6lMdwNij2+H9sZ46Cx
         7/Rpo1HL4svPFexzgQIEptSze4u1jYxHL/kq6ve0HFlk7GTtNVtMjWdtiiFNK1eGJBxq
         KXSzuwYxVf59yHVlyFgBFIftv+LCGNvsXRc08gAO+tkppc9dW1a0oFlE9MXHagHm6RPV
         5OHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702004653; x=1702609453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nNWwL5Jpvt1NqXZA6qDHCMRh8qNn5DD3n7b+kOG1WVg=;
        b=tOEiBTfo2c2/W2v0nohpPsBjC3BiHFIvWpkZmFUN+ustTAYRF3WnQPzdS7ImMSXco6
         Ps0aww6fgTj0yFWQhoerQsKBhiCKOju/b8GZbphitkzbrCgufCIPQJKT+/uxM9ML6Lln
         l0gAqt1OLrNnY/DHedHO2OQTNyEgTiPN0szUrdxTslj0onElCevGoUv8qPiztdUNa8rt
         tnd3dnI4xotH8501b2awPTx0kdHOdwr2YlUCGHePZlLmtuonuUfMplW4KY5WSirtzexU
         3aHqzligGzXuygDjEHPsSxq0YPnwVt7Os0/Is6f29KcY/K3ntQqLm3u3j9GxC0J+GHZB
         nyzA==
X-Gm-Message-State: AOJu0YyPL+AW/TdmWH5qX03ZyT04gYsXSQwVBqQ64RU2uXu0mADVmfWz
	jtFH7iwtWLpP1Ovb1NnqqHy7C0gafk4=
X-Google-Smtp-Source: AGHT+IFOaA1AmQTZH0Ozot0nY5L6jXl6tV2iML2KHlBLo31UiykQLMSYTWCjgz9NCnR+lNe8f3Klew==
X-Received: by 2002:a17:902:c411:b0:1d0:6ffd:f1f8 with SMTP id k17-20020a170902c41100b001d06ffdf1f8mr4047240plk.78.1702004653139;
        Thu, 07 Dec 2023 19:04:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:3d00::ef0f])
        by smtp.gmail.com with ESMTPSA id b24-20020a170902b61800b001cfc68aca48sm534910pls.135.2023.12.07.19.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 19:04:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gdb: Update to gdb 14.1 release
Date: Thu,  7 Dec 2023 19:04:10 -0800
Message-ID: <20231208030410.745794-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 03:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192009

* Drop add-missing-ldflags.patch, its already applied to gdb 14
* Add dependency on mpfr for cross/cross-canadian/target recipe
* Remove gcc-only complier restriction, clang can compile it just fine
* Notable changes are here [1] [2]

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=blob_plain;f=gdb/NEWS;hb=refs/heads/gdb-14-branch
[2] https://www.sourceware.org/gdb/download/ANNOUNCEMENT

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 meta/recipes-devtools/gdb/gdb-common.inc      |  2 +-
 .../gdb/gdb-cross-canadian.inc                |  2 +-
 ...ian_13.2.bb => gdb-cross-canadian_14.1.bb} |  0
 meta/recipes-devtools/gdb/gdb-cross.inc       |  2 +-
 .../{gdb-cross_13.2.bb => gdb-cross_14.1.bb}  |  0
 meta/recipes-devtools/gdb/gdb.inc             |  5 +-
 ...ux-nat-Define-_ABIO32-if-not-defined.patch |  4 +-
 ...e-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |  4 +-
 ...readline.a-when-using-disable-static.patch | 10 ++--
 .../gdb/gdb/0004-use-asm-sgidefs.h.patch      |  4 +-
 .../gdb/gdb/0005-Change-order-of-CFLAGS.patch |  4 +-
 ...06-resolve-restrict-keyword-conflict.patch |  2 +-
 .../0007-Fix-invalid-sigprocmask-call.patch   |  2 +-
 ...sing-_Alignof-when-using-C11-or-newe.patch |  4 +-
 .../gdb/gdb/add-missing-ldflags.patch         | 47 -------------------
 .../gdb/{gdb_13.2.bb => gdb_14.1.bb}          |  0
 17 files changed, 22 insertions(+), 72 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_13.2.bb => gdb-cross-canadian_14.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_13.2.bb => gdb-cross_14.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/add-missing-ldflags.patch
 rename meta/recipes-devtools/gdb/{gdb_13.2.bb => gdb_14.1.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 707402e6eb9..66c274aa806 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -19,7 +19,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "13.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.41%"
-GDBVERSION ?= "13.%"
+GDBVERSION ?= "14.%"
 GLIBCVERSION ?= "2.38%"
 LINUXLIBCVERSION ?= "6.5%"
 QEMUVERSION ?= "8.1%"
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 48dbb914636..ea1fc27a61b 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -2,7 +2,7 @@ SUMMARY = "GNU debugger"
 HOMEPAGE = "http://www.gnu.org/software/gdb/"
 DESCRIPTION = "GDB, the GNU Project debugger, allows you to see what is going on inside another program while it executes -- or what another program was doing at the moment it crashed."
 SECTION = "devel"
-DEPENDS = "expat gmp zlib ncurses virtual/libiconv ${LTTNGUST} bison-native"
+DEPENDS = "expat gmp mpfr zlib ncurses virtual/libiconv ${LTTNGUST} bison-native"
 
 LTTNGUST = "lttng-ust"
 LTTNGUST:arc = ""
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 81dc572be0d..058ffbc9c55 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -6,7 +6,7 @@ SUMMARY = "GNU debugger (cross-canadian gdb for ${TARGET_ARCH} target)"
 PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "gdb"
 
-DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext nativesdk-gmp \
+DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext nativesdk-gmp nativesdk-mpfr \
            virtual/${HOST_PREFIX}gcc virtual/${HOST_PREFIX}binutils virtual/nativesdk-libc"
 
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_13.2.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_14.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_13.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_14.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtools/gdb/gdb-cross.inc
index 9f9675c1b32..399f4bba97a 100644
--- a/meta/recipes-devtools/gdb/gdb-cross.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross.inc
@@ -1,6 +1,6 @@
 require gdb-common.inc
 
-DEPENDS = "expat-native gmp-native ncurses-native flex-native bison-native"
+DEPENDS = "expat-native gmp-native mpfr-native ncurses-native flex-native bison-native"
 
 inherit python3native pkgconfig
 
diff --git a/meta/recipes-devtools/gdb/gdb-cross_13.2.bb b/meta/recipes-devtools/gdb/gdb-cross_14.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_13.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross_14.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index e986b1a1f91..eb480f3c658 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -13,8 +13,5 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0006-resolve-restrict-keyword-conflict.patch \
            file://0007-Fix-invalid-sigprocmask-call.patch \
            file://0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
-           file://add-missing-ldflags.patch \
            "
-SRC_URI[sha256sum] = "fd5bebb7be1833abdb6e023c2f498a354498281df9d05523d8915babeb893f0a"
-
-TOOLCHAIN = "gcc"
+SRC_URI[sha256sum] = "d66df51276143451fcbff464cc8723d68f1e9df45a6a2d5635a54e71643edb80"
diff --git a/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch b/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
index 55bdbf644c1..86f6e2642d9 100644
--- a/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
+++ b/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
@@ -1,4 +1,4 @@
-From 73b71f0b85dd6c8181f2f11a427400d4870fabcc Mon Sep 17 00:00:00 2001
+From ff77aebf533758f0b6f7d22b272d32e08ed06e45 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 23 Mar 2016 06:30:09 +0000
 Subject: [PATCH] mips-linux-nat: Define _ABIO32 if not defined
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index 972b5db8e76..5e68538a3ba 100644
+index 8a7cc95f2a4..bfd1c72cba6 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -41,6 +41,10 @@
diff --git a/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
index 01e466f29ba..897cfd0df9b 100644
--- a/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
+++ b/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -1,4 +1,4 @@
-From e258cfb37d7c61b4a97e4ca8f1178485a3f91940 Mon Sep 17 00:00:00 2001
+From 78748dc55b1ceafe9a64beb9628f1d51b215482f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 18:32:14 -0700
 Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
@@ -30,7 +30,7 @@ index c84f9146bbd..8c8580c95e1 100644
  
  /* This sometimes isn't defined.  */
 diff --git a/gdbserver/linux-ppc-low.cc b/gdbserver/linux-ppc-low.cc
-index fdf74727e39..f64afd09b7a 100644
+index 86fbc8f5d96..8a1a39bc750 100644
 --- a/gdbserver/linux-ppc-low.cc
 +++ b/gdbserver/linux-ppc-low.cc
 @@ -23,7 +23,13 @@
diff --git a/meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-when-using-disable-static.patch b/meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-when-using-disable-static.patch
index 5562461c754..e41be8209ee 100644
--- a/meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-when-using-disable-static.patch
+++ b/meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-when-using-disable-static.patch
@@ -1,4 +1,4 @@
-From 431a88f4370a23b297998641e1e10ebfd74478d9 Mon Sep 17 00:00:00 2001
+From 683650564cd231bbf09c7cbc35543b77ca0b10d0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:25:03 -0700
 Subject: [PATCH] Dont disable libreadline.a when using --disable-static
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.def b/Makefile.def
-index f974565d8ca..039b5a3c209 100644
+index 870150183b9..eb3788da0d2 100644
 --- a/Makefile.def
 +++ b/Makefile.def
-@@ -120,7 +120,8 @@ host_modules= { module= libiconv;
+@@ -119,7 +119,8 @@ host_modules= { module= libiconv;
  		missing= install-html;
  		missing= install-info; };
  host_modules= { module= m4; };
@@ -33,10 +33,10 @@ index f974565d8ca..039b5a3c209 100644
  host_modules= { module= sim; };
  host_modules= { module= texinfo; no_install= true; };
 diff --git a/Makefile.in b/Makefile.in
-index a425b54e094..dfaf585a7c1 100644
+index c97130a2338..a83f98e4778 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -32816,7 +32816,7 @@ configure-readline:
+@@ -31691,7 +31691,7 @@ configure-readline:
  	  $$s/$$module_srcdir/configure \
  	  --srcdir=$${topdir}/$$module_srcdir \
  	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
diff --git a/meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch b/meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch
index d34c75ca613..413610d71f5 100644
--- a/meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch
+++ b/meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch
@@ -1,4 +1,4 @@
-From 693e01865c28c0a48e60173389ef467f46244c21 Mon Sep 17 00:00:00 2001
+From 04eba78ea6bd167b7eeef3af668c8f49888dc688 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <amccurdy@gmail.com>
 Date: Sat, 30 Apr 2016 15:29:06 -0700
 Subject: [PATCH] use <asm/sgidefs.h>
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index 5e68538a3ba..5b1c209abd8 100644
+index bfd1c72cba6..13dc9cdb703 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -31,7 +31,7 @@
diff --git a/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch b/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch
index 3aaab8a8f14..7631e750488 100644
--- a/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch
+++ b/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch
@@ -1,4 +1,4 @@
-From 9e72a19355375e589032809dd2ec051b75d4db07 Mon Sep 17 00:00:00 2001
+From e7041e9346aa0c3aee0b76315559e3ab2ef8977e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:35:39 -0700
 Subject: [PATCH] Change order of CFLAGS
@@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdbserver/Makefile.in b/gdbserver/Makefile.in
-index 040f0b6faa0..256ce6a3f6a 100644
+index b597515d428..9e615e2842d 100644
 --- a/gdbserver/Makefile.in
 +++ b/gdbserver/Makefile.in
 @@ -156,7 +156,7 @@ WIN32APILIBS = @WIN32APILIBS@
diff --git a/meta/recipes-devtools/gdb/gdb/0006-resolve-restrict-keyword-conflict.patch b/meta/recipes-devtools/gdb/gdb/0006-resolve-restrict-keyword-conflict.patch
index fe39c16877e..45388c5ac5a 100644
--- a/meta/recipes-devtools/gdb/gdb/0006-resolve-restrict-keyword-conflict.patch
+++ b/meta/recipes-devtools/gdb/gdb/0006-resolve-restrict-keyword-conflict.patch
@@ -1,4 +1,4 @@
-From 0ce96011d76ffa377349d0193dd0bf8f1bf641e0 Mon Sep 17 00:00:00 2001
+From 477f1b2049c7f940b8e8fda4ac396cfe322b269f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 10 May 2016 08:47:05 -0700
 Subject: [PATCH] resolve restrict keyword conflict
diff --git a/meta/recipes-devtools/gdb/gdb/0007-Fix-invalid-sigprocmask-call.patch b/meta/recipes-devtools/gdb/gdb/0007-Fix-invalid-sigprocmask-call.patch
index b095e924340..26e3ad9098c 100644
--- a/meta/recipes-devtools/gdb/gdb/0007-Fix-invalid-sigprocmask-call.patch
+++ b/meta/recipes-devtools/gdb/gdb/0007-Fix-invalid-sigprocmask-call.patch
@@ -1,4 +1,4 @@
-From 696891f6c5a1c6acab95dffd8c1d3a986ca71a18 Mon Sep 17 00:00:00 2001
+From ebeb6125acf6b4e4a8a4eaa59e2830b9ca02d683 Mon Sep 17 00:00:00 2001
 From: Yousong Zhou <yszhou4tech@gmail.com>
 Date: Fri, 24 Mar 2017 10:36:03 +0800
 Subject: [PATCH] Fix invalid sigprocmask call
diff --git a/meta/recipes-devtools/gdb/gdb/0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch b/meta/recipes-devtools/gdb/gdb/0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
index 566b9106487..819f1c9f17f 100644
--- a/meta/recipes-devtools/gdb/gdb/0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
+++ b/meta/recipes-devtools/gdb/gdb/0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
@@ -1,4 +1,4 @@
-From e649db1664af981cc87f966aef6c5365ae234547 Mon Sep 17 00:00:00 2001
+From cb7c8df338184d2d2f31ee1fd238653e3162da44 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 15 Jan 2023 00:16:25 -0800
 Subject: [PATCH] Define alignof using _Alignof when using C11 or newer
@@ -25,7 +25,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 10 insertions(+)
 
 diff --git a/libiberty/sha1.c b/libiberty/sha1.c
-index 504f06d3b9b..790ada82443 100644
+index 6c71e3ebb41..a2caf947d31 100644
 --- a/libiberty/sha1.c
 +++ b/libiberty/sha1.c
 @@ -229,7 +229,17 @@ sha1_process_bytes (const void *buffer, size_t len, struct sha1_ctx *ctx)
diff --git a/meta/recipes-devtools/gdb/gdb/add-missing-ldflags.patch b/meta/recipes-devtools/gdb/gdb/add-missing-ldflags.patch
deleted file mode 100644
index f05ebf19d01..00000000000
--- a/meta/recipes-devtools/gdb/gdb/add-missing-ldflags.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-When running the configure check "checking for ELF support in BFD", LDFLAGS
-were not being passed in to libtool. In OE/YP, we need these flags when using
-uninative due to the games we play with the dynamic loader.
-
-If a version of libzstd was built against a newer glibc, it would need
-newer pthread symbols which it wouldn't find with the system linker. At
-runtime this isn't an issue as it would be switched to use uninative but we
-pass flags in LDFLAGS to allow this.
-
-The comments say LDFLAGS are used but it was dropped in this commit:
-
-https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=5218fa9e8937b007d554f1e01c2e4ecdb9b7e271
-
-and probably needs to be put back upstream.
-
-The bug is rare to reproduce as it depends on the host libzstd was built
-against.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=5fc6b6d44cd63651c2902cbfc5b9734a55aaa617]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: gdb-13.1/gdb/acinclude.m4
-===================================================================
---- gdb-13.1.orig/gdb/acinclude.m4
-+++ gdb-13.1/gdb/acinclude.m4
-@@ -234,7 +234,7 @@ AC_DEFUN([GDB_AC_CHECK_BFD], [
-   # points somewhere with bfd, with -I/foo/lib and -L/foo/lib.  We
-   # always want our bfd.
-   CFLAGS="-I${srcdir}/../include -I../bfd -I${srcdir}/../bfd $CFLAGS"
--  LDFLAGS="-L../bfd -L../libiberty"
-+  LDFLAGS="-L../bfd -L../libiberty $LDFLAGS"
-   intl=`echo $LIBINTL | sed 's,${top_builddir}/,,g'`
-   LIBS="-lbfd -liberty $intl $LIBS"
-   CC="./libtool --quiet --mode=link $CC"
-Index: gdb-13.1/gdb/configure
-===================================================================
---- gdb-13.1.orig/gdb/configure
-+++ gdb-13.1/gdb/configure
-@@ -28561,7 +28561,7 @@ WIN32LIBS="$WIN32LIBS $WIN32APILIBS"
-   # points somewhere with bfd, with -I/foo/lib and -L/foo/lib.  We
-   # always want our bfd.
-   CFLAGS="-I${srcdir}/../include -I../bfd -I${srcdir}/../bfd $CFLAGS"
--  LDFLAGS="-L../bfd -L../libiberty"
-+  LDFLAGS="-L../bfd -L../libiberty $LDFLAGS"
-   intl=`echo $LIBINTL | sed 's,${top_builddir}/,,g'`
-   LIBS="-lbfd -liberty $intl $LIBS"
-   CC="./libtool --quiet --mode=link $CC"
diff --git a/meta/recipes-devtools/gdb/gdb_13.2.bb b/meta/recipes-devtools/gdb/gdb_14.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_13.2.bb
rename to meta/recipes-devtools/gdb/gdb_14.1.bb
-- 
2.43.0


