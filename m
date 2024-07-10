Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C72C38150
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 05:49:57 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.7495.1720590588115977478
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 22:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KWQmn52l;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7035c367c4cso3037869a34.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 22:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720590587; x=1721195387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DoMReLx2b7aL5pdfYxI3REFJvFc08SvAAqWpG+/Zdec=;
        b=KWQmn52lv/jytqUrBXN/fJDj1LfbnU40T3ZeAQMio9+7WyAGi+3NwvLa8a1yWXFCqy
         q5fnlx9VadMr/XBqmOi3lfBkVhOjUElI7Yju7rcOziIhiXKrrEIN0t1cRYgTGfrzXaa8
         vSxmhl+vcmknzZFVbYyPDHzRbz+P3Xn3FrzlLsl7Ncw9GdBqS8VCiqGpXBmAVKST4DSi
         rpBvOzB6aF4scTHtNSRh1vM9NIVkKOvQi3RpymiPt6A6ArSVkhDB5OZspSb0+9dpAcrH
         L4bkC9SmeSuMsd26YEozVjSCNVCidu8zypbU2Jy3QDwjGwkKgh8n8F02WaSTGOhq/kCn
         9EvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720590587; x=1721195387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DoMReLx2b7aL5pdfYxI3REFJvFc08SvAAqWpG+/Zdec=;
        b=oMSgHHWUqO4RtkTb/jmdcgxksNxbRSAB9wIDfPw7eVcPT0Hk7Dfw/qT5dfc2cRwBzs
         SOgScqxrW2+pPwMtLlebTjiJZGHpi2CiS2yV4igCVARGaZOUxv3ZUObVBa4SJNY7wym6
         jHHkIns4Eh2SWaTtVtQ0Fx7m590Vv45NH8KHVuhvr89hs0BuuuavOVdsHNUNGsqBdfVT
         rB98UG9YWtefSP20UIJlspvDQ2P4qayrFbAR9YuMdxj98KJlmcdoZAoOQt2yAAniAhsU
         58dgIHTaef89vdVMzmDct8zaDLrD1jyC8dqLvieT9t24dQEnVLWYCXGEdgamqLz/Dy2w
         1+8g==
X-Gm-Message-State: AOJu0YythUd9ELr9H6U+qbre9L0jHTKDW7WIxJKDvTsN8OBpZlxegMIq
	vBYYBRLA56SM4EB3SiWvF+yu862etPQ4X6/FBTCiGJ+vgy5VTR1BuY2ZLg==
X-Google-Smtp-Source: AGHT+IHHzwsB+yxUJgW7y6+AIWQl16ROIYg9Ay8wb3lAqOpPZgq4ZTufXPgVc0vSqs99oZK9oMqlHQ==
X-Received: by 2002:a9d:69d9:0:b0:703:64ad:83e7 with SMTP id 46e09a7af769-70375b4db7bmr5159196a34.30.1720590586776;
        Tue, 09 Jul 2024 22:49:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c49a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b438c5094sm2841066b3a.78.2024.07.09.22.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 22:49:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gdb: Upgrade to 15.1 release
Date: Tue,  9 Jul 2024 22:49:44 -0700
Message-ID: <20240710054944.317748-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 05:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201689

Improved python support and needs c++17 std in compiler to build

Detailed Release Notee [1]

[1] https://sourceware.org/pipermail/gdb-announce/2024/000140.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...ian_14.2.bb => gdb-cross-canadian_15.1.bb} |  0
 .../{gdb-cross_14.2.bb => gdb-cross_15.1.bb}  |  0
 meta/recipes-devtools/gdb/gdb.inc             |  6 +++---
 ...ux-nat-Define-_ABIO32-if-not-defined.patch |  6 +++---
 ...e-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |  8 +++----
 ...readline.a-when-using-disable-static.patch | 10 ++++-----
 .../gdb/gdb/0004-use-asm-sgidefs.h.patch      |  6 +++---
 .../gdb/gdb/0005-Change-order-of-CFLAGS.patch | 21 +++++++++----------
 ...> 0006-Fix-invalid-sigprocmask-call.patch} |  6 +++---
 ...ing-_Alignof-when-using-C11-or-newe.patch} |  6 +++---
 .../gdb/{gdb_14.2.bb => gdb_15.1.bb}          |  0
 12 files changed, 35 insertions(+), 36 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_14.2.bb => gdb-cross-canadian_15.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_14.2.bb => gdb-cross_15.1.bb} (100%)
 rename meta/recipes-devtools/gdb/gdb/{0007-Fix-invalid-sigprocmask-call.patch => 0006-Fix-invalid-sigprocmask-call.patch} (90%)
 rename meta/recipes-devtools/gdb/gdb/{0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch => 0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch} (90%)
 rename meta/recipes-devtools/gdb/{gdb_14.2.bb => gdb_15.1.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 4fb6e47b7f5..c77ce9aa52a 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -19,7 +19,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "14.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.42%"
-GDBVERSION ?= "14.%"
+GDBVERSION ?= "15.%"
 GLIBCVERSION ?= "2.39%"
 LINUXLIBCVERSION ?= "6.9%"
 QEMUVERSION ?= "9.0%"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_14.2.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_15.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_14.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_15.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_14.2.bb b/meta/recipes-devtools/gdb/gdb-cross_15.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_14.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross_15.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index c2fbcb2ac6b..6fdf11d3944 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -10,7 +10,7 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0003-Dont-disable-libreadline.a-when-using-disable-static.patch \
            file://0004-use-asm-sgidefs.h.patch \
            file://0005-Change-order-of-CFLAGS.patch \
-           file://0007-Fix-invalid-sigprocmask-call.patch \
-           file://0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
+           file://0006-Fix-invalid-sigprocmask-call.patch \
+           file://0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            "
-SRC_URI[sha256sum] = "2d4dd8061d8ded12b6c63f55e45344881e8226105f4d2a9b234040efa5ce7772"
+SRC_URI[sha256sum] = "38254eacd4572134bca9c5a5aa4d4ca564cbbd30c369d881f733fb6b903354f2"
diff --git a/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch b/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
index 86f6e2642d9..5e313a08b21 100644
--- a/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
+++ b/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
@@ -1,4 +1,4 @@
-From ff77aebf533758f0b6f7d22b272d32e08ed06e45 Mon Sep 17 00:00:00 2001
+From 31c6c42479e750aff3130e76bae2646c418cb548 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 23 Mar 2016 06:30:09 +0000
 Subject: [PATCH] mips-linux-nat: Define _ABIO32 if not defined
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index 8a7cc95f2a4..bfd1c72cba6 100644
+index 3d072ea935c..ca38caeacc2 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
-@@ -41,6 +41,10 @@
+@@ -40,6 +40,10 @@
  #ifndef PTRACE_GET_THREAD_AREA
  #define PTRACE_GET_THREAD_AREA 25
  #endif
diff --git a/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
index 897cfd0df9b..56602b41162 100644
--- a/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
+++ b/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -1,4 +1,4 @@
-From 78748dc55b1ceafe9a64beb9628f1d51b215482f Mon Sep 17 00:00:00 2001
+From 8f350f9b7b3934bd492cad35e1b6e44d142313a4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 18:32:14 -0700
 Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 12 insertions(+)
 
 diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
-index c84f9146bbd..8c8580c95e1 100644
+index b51e2278f4b..f1bc07df0e9 100644
 --- a/gdb/nat/ppc-linux.h
 +++ b/gdb/nat/ppc-linux.h
 @@ -18,7 +18,13 @@
@@ -30,10 +30,10 @@ index c84f9146bbd..8c8580c95e1 100644
  
  /* This sometimes isn't defined.  */
 diff --git a/gdbserver/linux-ppc-low.cc b/gdbserver/linux-ppc-low.cc
-index 86fbc8f5d96..8a1a39bc750 100644
+index bd3ac143660..1c8c0b3a98e 100644
 --- a/gdbserver/linux-ppc-low.cc
 +++ b/gdbserver/linux-ppc-low.cc
-@@ -23,7 +23,13 @@
+@@ -22,7 +22,13 @@
  #include "elf/common.h"
  #include <sys/uio.h>
  #include <elf.h>
diff --git a/meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-when-using-disable-static.patch b/meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-when-using-disable-static.patch
index e41be8209ee..0f7f3878662 100644
--- a/meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-when-using-disable-static.patch
+++ b/meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-when-using-disable-static.patch
@@ -1,4 +1,4 @@
-From 683650564cd231bbf09c7cbc35543b77ca0b10d0 Mon Sep 17 00:00:00 2001
+From c4102e4fd74804b053c437352ef92c64c8b1fdbf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:25:03 -0700
 Subject: [PATCH] Dont disable libreadline.a when using --disable-static
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.def b/Makefile.def
-index 870150183b9..eb3788da0d2 100644
+index 4896c5c692c..17e3256be7d 100644
 --- a/Makefile.def
 +++ b/Makefile.def
-@@ -119,7 +119,8 @@ host_modules= { module= libiconv;
+@@ -134,7 +134,8 @@ host_modules= { module= libiconv;
  		missing= install-html;
  		missing= install-info; };
  host_modules= { module= m4; };
@@ -33,10 +33,10 @@ index 870150183b9..eb3788da0d2 100644
  host_modules= { module= sim; };
  host_modules= { module= texinfo; no_install= true; };
 diff --git a/Makefile.in b/Makefile.in
-index c97130a2338..a83f98e4778 100644
+index f12c251f9c8..17ea24e8012 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -31691,7 +31691,7 @@ configure-readline:
+@@ -31593,7 +31593,7 @@ configure-readline:
  	  $$s/$$module_srcdir/configure \
  	  --srcdir=$${topdir}/$$module_srcdir \
  	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
diff --git a/meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch b/meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch
index 413610d71f5..6dee5037daf 100644
--- a/meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch
+++ b/meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch
@@ -1,4 +1,4 @@
-From 04eba78ea6bd167b7eeef3af668c8f49888dc688 Mon Sep 17 00:00:00 2001
+From 91e294b399c8e3de2cbdd495309f31b6a218516d Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <amccurdy@gmail.com>
 Date: Sat, 30 Apr 2016 15:29:06 -0700
 Subject: [PATCH] use <asm/sgidefs.h>
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index bfd1c72cba6..13dc9cdb703 100644
+index ca38caeacc2..2f044ca508a 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
-@@ -31,7 +31,7 @@
+@@ -30,7 +30,7 @@
  #include "gdb_proc_service.h"
  #include "gregset.h"
  
diff --git a/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch b/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch
index 7631e750488..6d5d3a7e4f9 100644
--- a/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch
+++ b/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch
@@ -1,4 +1,4 @@
-From e7041e9346aa0c3aee0b76315559e3ab2ef8977e Mon Sep 17 00:00:00 2001
+From c151a90c6df7a8b31fe0a6c4d6d28aaff55ac25f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:35:39 -0700
 Subject: [PATCH] Change order of CFLAGS
@@ -9,19 +9,18 @@ Upstream-Status: Inappropriate
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- gdbserver/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ gdbserver/Makefile.in | 1 +
+ 1 file changed, 1 insertion(+)
 
 diff --git a/gdbserver/Makefile.in b/gdbserver/Makefile.in
-index b597515d428..9e615e2842d 100644
+index 6148ccf9121..3ad15573923 100644
 --- a/gdbserver/Makefile.in
 +++ b/gdbserver/Makefile.in
-@@ -156,7 +156,7 @@ WIN32APILIBS = @WIN32APILIBS@
- INTERNAL_CFLAGS_BASE = ${GLOBAL_CFLAGS} \
- 	${PROFILE_CFLAGS} ${INCLUDE_CFLAGS} ${CPPFLAGS} $(PTHREAD_CFLAGS)
- INTERNAL_WARN_CFLAGS = ${INTERNAL_CFLAGS_BASE} $(WARN_CFLAGS)
--INTERNAL_CFLAGS = ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) -DGDBSERVER
-+INTERNAL_CFLAGS = ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) ${COMPILER_CFLAGS} -DGDBSERVER
+@@ -174,6 +174,7 @@ INTERNAL_CFLAGS = \
+ 	$(PTHREAD_CFLAGS) \
+ 	$(WARN_CFLAGS) \
+ 	$(WERROR_CFLAGS) \
++	${COMPILER_CFLAGS} \
+ 	-DGDBSERVER
  
  # LDFLAGS is specifically reserved for setting from the command line
- # when running make.
diff --git a/meta/recipes-devtools/gdb/gdb/0007-Fix-invalid-sigprocmask-call.patch b/meta/recipes-devtools/gdb/gdb/0006-Fix-invalid-sigprocmask-call.patch
similarity index 90%
rename from meta/recipes-devtools/gdb/gdb/0007-Fix-invalid-sigprocmask-call.patch
rename to meta/recipes-devtools/gdb/gdb/0006-Fix-invalid-sigprocmask-call.patch
index 26e3ad9098c..a256b8fc682 100644
--- a/meta/recipes-devtools/gdb/gdb/0007-Fix-invalid-sigprocmask-call.patch
+++ b/meta/recipes-devtools/gdb/gdb/0006-Fix-invalid-sigprocmask-call.patch
@@ -1,4 +1,4 @@
-From ebeb6125acf6b4e4a8a4eaa59e2830b9ca02d683 Mon Sep 17 00:00:00 2001
+From f63dddf6b986642eeeefa27176d59780e1681ddd Mon Sep 17 00:00:00 2001
 From: Yousong Zhou <yszhou4tech@gmail.com>
 Date: Fri, 24 Mar 2017 10:36:03 +0800
 Subject: [PATCH] Fix invalid sigprocmask call
@@ -32,10 +32,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdbsupport/signals-state-save-restore.cc b/gdbsupport/signals-state-save-restore.cc
-index 3ec7a259c9c..0702eca7725 100644
+index 60724f95c87..8b493271aa6 100644
 --- a/gdbsupport/signals-state-save-restore.cc
 +++ b/gdbsupport/signals-state-save-restore.cc
-@@ -38,7 +38,7 @@ save_original_signals_state (bool quiet)
+@@ -37,7 +37,7 @@ save_original_signals_state (bool quiet)
    int i;
    int res;
  
diff --git a/meta/recipes-devtools/gdb/gdb/0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch b/meta/recipes-devtools/gdb/gdb/0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
similarity index 90%
rename from meta/recipes-devtools/gdb/gdb/0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
rename to meta/recipes-devtools/gdb/gdb/0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
index 819f1c9f17f..dcc01e414cc 100644
--- a/meta/recipes-devtools/gdb/gdb/0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
+++ b/meta/recipes-devtools/gdb/gdb/0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
@@ -1,4 +1,4 @@
-From cb7c8df338184d2d2f31ee1fd238653e3162da44 Mon Sep 17 00:00:00 2001
+From f1b4a90ea61771840fcf4889f616b156b5157843 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 15 Jan 2023 00:16:25 -0800
 Subject: [PATCH] Define alignof using _Alignof when using C11 or newer
@@ -25,10 +25,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 10 insertions(+)
 
 diff --git a/libiberty/sha1.c b/libiberty/sha1.c
-index 6c71e3ebb41..a2caf947d31 100644
+index 49e8e0b6c2b..72de5cc8ad6 100644
 --- a/libiberty/sha1.c
 +++ b/libiberty/sha1.c
-@@ -229,7 +229,17 @@ sha1_process_bytes (const void *buffer, size_t len, struct sha1_ctx *ctx)
+@@ -234,7 +234,17 @@ sha1_process_bytes (const void *buffer, size_t len, struct sha1_ctx *ctx)
    if (len >= 64)
      {
  #if !_STRING_ARCH_unaligned
diff --git a/meta/recipes-devtools/gdb/gdb_14.2.bb b/meta/recipes-devtools/gdb/gdb_15.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_14.2.bb
rename to meta/recipes-devtools/gdb/gdb_15.1.bb

