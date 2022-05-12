Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D59AC433EF
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 19:28:59 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.1715.1652383738684992285
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 May 2022 12:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LY4hqx0k;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so8752818pju.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 12 May 2022 12:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gDpej21lh8WjydkNdSQ/pZONn32rBSzFWRMlABdnJ8c=;
        b=LY4hqx0k6z1voKi0tKI/SaA4t2wYZElS0O46jfwUPlLiM0nE78OWtSku3Q8h6wZ572
         pxINsq6z/aqsRqc7uxanFZMkHdBSzkeGLBDljKDEuszgNR31w+ti57iA//OuqsNdNs92
         JpEqlYW8Dh8+5j1fFxXkggKasPh5Z068I2AUNN6e7c/7X3ua2ri8+zE/nwh5V70KepIZ
         hgGjwJU4GmOPwGM13zkGIJsfwrw3uaHJ0CroNUN9uEkz2DsjOA/tjMW+x+vsiSLs3bZr
         oZhUkXYRb8Nuc5Im7zCMSAxD7t74+0FhiZAMqcBJmV3Xp2LrH0DjNebORGPU+6dHd0zl
         Z58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gDpej21lh8WjydkNdSQ/pZONn32rBSzFWRMlABdnJ8c=;
        b=6TxFh4teqgWmcSqu95ZB/c5St3Xlc5W0SicwX1feIyOukMCLEPzn+JHdsd4guxj93o
         JMKU2oMVg4tKiSZY1KzElYqEXrb1eTR5xTlS8rcjFHswLU7Jif7m4MpGqyR8Gsds/a0K
         eOe/NPiApTr9/egTGPP6wVKfMixrhZv9lswCUJ/l0mrepTEqYXTLM8UB0PMBmXzWE7UP
         LsXolh1W6Kqkt7nrATK9/4mD6zCVphonzO2q7iP24VQm7YZ5L20A4fln7uGeArNO6lx8
         B+hbPItT9suy+JJDdk0hOi7+NhRhcOODOtoIB/efzEH4a6bKTc07TOc9daxg+nMddUrE
         gN/Q==
X-Gm-Message-State: AOAM533TQSp/fybySiKRX/Gz4k+zUcH3Wwsh333jNGfyCgqNNK1OVotc
	0ERp1QIwRXITkB/65Jziqk0PdRDrZkD++A==
X-Google-Smtp-Source: 
 ABdhPJys1eZqP7m90p4P9UOZlLvth6GJ0p6Bc0mtdKRQGD3DTEvx66byfnjqxCQ4TjNgVBugYObz3Q==
X-Received: by 2002:a17:902:b413:b0:15e:e6a8:b3e with SMTP id
 x19-20020a170902b41300b0015ee6a80b3emr1363135plr.24.1652383737364;
        Thu, 12 May 2022 12:28:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 p12-20020aa79e8c000000b0050dc76281desm170963pfq.184.2022.05.12.12.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 12:28:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gdb: Upgrade to 12.1
Date: Thu, 12 May 2022 12:28:54 -0700
Message-Id: <20220512192854.1538701-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 May 2022 19:28:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165541

Release Announcement [1] and Notes [2]

[1] https://lists.gnu.org/archive/html/info-gnu/2022-05/msg00000.html
[2] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob_plain;f=gdb/NEWS;hb=gdb-12.1-release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc        |  2 +-
 ...canadian_11.2.bb => gdb-cross-canadian_12.1.bb} |  0
 .../gdb/{gdb-cross_11.2.bb => gdb-cross_12.1.bb}   |  0
 meta/recipes-devtools/gdb/gdb.inc                  | 14 +++++++-------
 ...0001-make-man-install-relative-to-DESTDIR.patch | 10 +++++-----
 ...s-linux-nat-Define-_ABIO32-if-not-defined.patch |  8 ++++----
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 11 +++++------
 ...-libreadline.a-when-using-disable-static.patch} | 14 +++++++-------
 ...gidefs.h.patch => 0005-use-asm-sgidefs.h.patch} |  8 ++++----
 ...AGS.patch => 0006-Change-order-of-CFLAGS.patch} | 10 +++++-----
 ...> 0007-resolve-restrict-keyword-conflict.patch} |  6 +++---
 ...tch => 0008-Fix-invalid-sigprocmask-call.patch} |  8 ++++----
 ....patch => 0009-gdbserver-ctrl-c-handling.patch} | 10 +++++-----
 .../gdb/{gdb_11.2.bb => gdb_12.1.bb}               |  0
 14 files changed, 50 insertions(+), 51 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_11.2.bb => gdb-cross-canadian_12.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_11.2.bb => gdb-cross_12.1.bb} (100%)
 rename meta/recipes-devtools/gdb/gdb/{0005-Dont-disable-libreadline.a-when-using-disable-static.patch => 0004-Dont-disable-libreadline.a-when-using-disable-static.patch} (80%)
 rename meta/recipes-devtools/gdb/gdb/{0006-use-asm-sgidefs.h.patch => 0005-use-asm-sgidefs.h.patch} (84%)
 rename meta/recipes-devtools/gdb/gdb/{0007-Change-order-of-CFLAGS.patch => 0006-Change-order-of-CFLAGS.patch} (80%)
 rename meta/recipes-devtools/gdb/gdb/{0008-resolve-restrict-keyword-conflict.patch => 0007-resolve-restrict-keyword-conflict.patch} (93%)
 rename meta/recipes-devtools/gdb/gdb/{0009-Fix-invalid-sigprocmask-call.patch => 0008-Fix-invalid-sigprocmask-call.patch} (90%)
 rename meta/recipes-devtools/gdb/gdb/{0010-gdbserver-ctrl-c-handling.patch => 0009-gdbserver-ctrl-c-handling.patch} (82%)
 rename meta/recipes-devtools/gdb/{gdb_11.2.bb => gdb_12.1.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 9660f2804a7..1179ba172ff 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -19,7 +19,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "12.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.38%"
-GDBVERSION ?= "11.%"
+GDBVERSION ?= "12.%"
 GLIBCVERSION ?= "2.35"
 LINUXLIBCVERSION ?= "5.16%"
 QEMUVERSION ?= "7.0%"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_11.2.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_12.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_11.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_12.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_11.2.bb b/meta/recipes-devtools/gdb/gdb-cross_12.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_11.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross_12.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 649ee287276..3b569fd40e7 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -8,11 +8,11 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0001-make-man-install-relative-to-DESTDIR.patch \
            file://0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch \
            file://0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch \
-           file://0005-Dont-disable-libreadline.a-when-using-disable-static.patch \
-           file://0006-use-asm-sgidefs.h.patch \
-           file://0007-Change-order-of-CFLAGS.patch \
-           file://0008-resolve-restrict-keyword-conflict.patch \
-           file://0009-Fix-invalid-sigprocmask-call.patch \
-           file://0010-gdbserver-ctrl-c-handling.patch \
+           file://0004-Dont-disable-libreadline.a-when-using-disable-static.patch \
+           file://0005-use-asm-sgidefs.h.patch \
+           file://0006-Change-order-of-CFLAGS.patch \
+           file://0007-resolve-restrict-keyword-conflict.patch \
+           file://0008-Fix-invalid-sigprocmask-call.patch \
+           file://0009-gdbserver-ctrl-c-handling.patch \
            "
-SRC_URI[sha256sum] = "1497c36a71881b8671a9a84a0ee40faab788ca30d7ba19d8463c3cc787152e32"
+SRC_URI[sha256sum] = "0e1793bf8f2b54d53f46dea84ccfd446f48f81b297b28c4f7fc017b818d69fed"
diff --git a/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch b/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
index 824b96f6afe..16d6cf196fd 100644
--- a/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
+++ b/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
@@ -1,7 +1,7 @@
-From a6d3df9d84463ec500d9d01558ab8a17e824e9e5 Mon Sep 17 00:00:00 2001
+From 8eca28eddcda4ce8a345ca031f43ff1ed6f37089 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 02:27:55 +0000
-Subject: [PATCH 01/10] make man install relative to DESTDIR
+Subject: [PATCH 1/9] make man install relative to DESTDIR
 
 Upstream-Status: Pending
 
@@ -11,10 +11,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sim/common/Make-common.in b/sim/common/Make-common.in
-index 8c2cacea1e5..4a52eef2203 100644
+index 74e5dad3049..9e95c224ba4 100644
 --- a/sim/common/Make-common.in
 +++ b/sim/common/Make-common.in
-@@ -63,7 +63,7 @@ tooldir = $(libdir)/$(target_alias)
+@@ -70,7 +70,7 @@ tooldir = $(libdir)/$(target_alias)
  datadir = @datadir@
  datarootdir = @datarootdir@
  mandir = @mandir@
@@ -24,5 +24,5 @@ index 8c2cacea1e5..4a52eef2203 100644
  includedir = @includedir@
  
 -- 
-2.33.1
+2.36.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch b/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
index 591c9bfa3f9..8d263de8963 100644
--- a/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
+++ b/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
@@ -1,7 +1,7 @@
-From 7f1f25eaaace289bc33c5aaa1c5fe9e04e719651 Mon Sep 17 00:00:00 2001
+From 37d3afd2eaa95c89ad7cb5d0079b017752e4d0ea Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 23 Mar 2016 06:30:09 +0000
-Subject: [PATCH 02/10] mips-linux-nat: Define _ABIO32 if not defined
+Subject: [PATCH 2/9] mips-linux-nat: Define _ABIO32 if not defined
 
 This helps building gdb on mips64 on musl, since
 musl does not provide sgidefs.h this define is
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index b21c7cb2ea6..6614b4de31e 100644
+index 20e12b6889e..6adc61235aa 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -41,6 +41,10 @@
@@ -31,5 +31,5 @@ index b21c7cb2ea6..6614b4de31e 100644
  class mips_linux_nat_target final : public linux_nat_trad_target
  {
 -- 
-2.33.1
+2.36.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
index 09ea533b00d..7e09404bb05 100644
--- a/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
+++ b/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -1,8 +1,7 @@
-From 0cb233ec3951582fa1a051a16bfd644ef4969df5 Mon Sep 17 00:00:00 2001
+From e689eec672ee8c53b3adb2ade2b5deb9b7cd99d4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 18:32:14 -0700
-Subject: [PATCH 03/10] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC
- systems
+Subject: [PATCH 3/9] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
 
 Upstream-Status: Pending
 
@@ -13,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 12 insertions(+)
 
 diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
-index e712a9a5713..76bbcca0928 100644
+index 1094f6b0be3..d8588a646c2 100644
 --- a/gdb/nat/ppc-linux.h
 +++ b/gdb/nat/ppc-linux.h
 @@ -18,7 +18,13 @@
@@ -31,7 +30,7 @@ index e712a9a5713..76bbcca0928 100644
  
  /* This sometimes isn't defined.  */
 diff --git a/gdbserver/linux-ppc-low.cc b/gdbserver/linux-ppc-low.cc
-index db9a88219ea..151e4183bb1 100644
+index 08824887003..69afbae5359 100644
 --- a/gdbserver/linux-ppc-low.cc
 +++ b/gdbserver/linux-ppc-low.cc
 @@ -23,7 +23,13 @@
@@ -49,5 +48,5 @@ index db9a88219ea..151e4183bb1 100644
  #include "arch/ppc-linux-common.h"
  #include "arch/ppc-linux-tdesc.h"
 -- 
-2.33.1
+2.36.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-when-using-disable-static.patch b/meta/recipes-devtools/gdb/gdb/0004-Dont-disable-libreadline.a-when-using-disable-static.patch
similarity index 80%
rename from meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-when-using-disable-static.patch
rename to meta/recipes-devtools/gdb/gdb/0004-Dont-disable-libreadline.a-when-using-disable-static.patch
index 02ea30f9bf8..a1e85e91b33 100644
--- a/meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-when-using-disable-static.patch
+++ b/meta/recipes-devtools/gdb/gdb/0004-Dont-disable-libreadline.a-when-using-disable-static.patch
@@ -1,7 +1,7 @@
-From e2efd044c479895767f1b929f5a54fa0c689f318 Mon Sep 17 00:00:00 2001
+From 15ee6a626242efb8f367be49c13e00d0b72317f0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:25:03 -0700
-Subject: [PATCH 05/10] Dont disable libreadline.a when using --disable-static
+Subject: [PATCH 4/9] Dont disable libreadline.a when using --disable-static
 
 If gdb is configured with --disable-static then this is dutifully passed to
 readline which then disables libreadline.a, which causes a problem when gdb
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.def b/Makefile.def
-index 5a460f1dbbc..77a702ac6d6 100644
+index acdcd625ed6..78fc31e1199 100644
 --- a/Makefile.def
 +++ b/Makefile.def
-@@ -105,7 +105,8 @@ host_modules= { module= libiconv;
+@@ -120,7 +120,8 @@ host_modules= { module= libiconv;
  		missing= install-html;
  		missing= install-info; };
  host_modules= { module= m4; };
@@ -33,10 +33,10 @@ index 5a460f1dbbc..77a702ac6d6 100644
  host_modules= { module= sim; };
  host_modules= { module= texinfo; no_install= true; };
 diff --git a/Makefile.in b/Makefile.in
-index 9b3a5d75735..98cbe844fca 100644
+index 3aacd2daac9..aa58adada4a 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -25607,7 +25607,7 @@ configure-readline:
+@@ -32791,7 +32791,7 @@ configure-readline:
  	  $$s/$$module_srcdir/configure \
  	  --srcdir=$${topdir}/$$module_srcdir \
  	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
@@ -46,5 +46,5 @@ index 9b3a5d75735..98cbe844fca 100644
  @endif readline
  
 -- 
-2.33.1
+2.36.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch b/meta/recipes-devtools/gdb/gdb/0005-use-asm-sgidefs.h.patch
similarity index 84%
rename from meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch
rename to meta/recipes-devtools/gdb/gdb/0005-use-asm-sgidefs.h.patch
index ef271c45e29..242099b9b1e 100644
--- a/meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch
+++ b/meta/recipes-devtools/gdb/gdb/0005-use-asm-sgidefs.h.patch
@@ -1,7 +1,7 @@
-From 5077518c11e8d75e9bf65cdf9ca21c59564e1037 Mon Sep 17 00:00:00 2001
+From 25a75aaf29791f4302f0e4452f7ebaf735d4f083 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <amccurdy@gmail.com>
 Date: Sat, 30 Apr 2016 15:29:06 -0700
-Subject: [PATCH 06/10] use <asm/sgidefs.h>
+Subject: [PATCH 5/9] use <asm/sgidefs.h>
 
 Build fix for MIPS with musl libc
 
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index 6614b4de31e..237eb6eb975 100644
+index 6adc61235aa..afb40066744 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -31,7 +31,7 @@
@@ -32,5 +32,5 @@ index 6614b4de31e..237eb6eb975 100644
  #include <asm/ptrace.h>
  #include "inf-ptrace.h"
 -- 
-2.33.1
+2.36.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0007-Change-order-of-CFLAGS.patch b/meta/recipes-devtools/gdb/gdb/0006-Change-order-of-CFLAGS.patch
similarity index 80%
rename from meta/recipes-devtools/gdb/gdb/0007-Change-order-of-CFLAGS.patch
rename to meta/recipes-devtools/gdb/gdb/0006-Change-order-of-CFLAGS.patch
index 40d12579c0e..58c9b1d0a78 100644
--- a/meta/recipes-devtools/gdb/gdb/0007-Change-order-of-CFLAGS.patch
+++ b/meta/recipes-devtools/gdb/gdb/0006-Change-order-of-CFLAGS.patch
@@ -1,7 +1,7 @@
-From 80080e6c8425ac51498f49c2063b960a08f9a27d Mon Sep 17 00:00:00 2001
+From c0e7c34134aa1f9644075c596a2338a50d3d923e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:35:39 -0700
-Subject: [PATCH 07/10] Change order of CFLAGS
+Subject: [PATCH 6/9] Change order of CFLAGS
 
 Lets us override Werror if need be
 
@@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdbserver/Makefile.in b/gdbserver/Makefile.in
-index 12e9b2777ae..ad44fbc3309 100644
+index 47648b8d962..5599779de57 100644
 --- a/gdbserver/Makefile.in
 +++ b/gdbserver/Makefile.in
-@@ -172,7 +172,7 @@ WIN32APILIBS = @WIN32APILIBS@
+@@ -156,7 +156,7 @@ WIN32APILIBS = @WIN32APILIBS@
  INTERNAL_CFLAGS_BASE = ${GLOBAL_CFLAGS} \
  	${PROFILE_CFLAGS} ${INCLUDE_CFLAGS} ${CPPFLAGS} $(PTHREAD_CFLAGS)
  INTERNAL_WARN_CFLAGS = ${INTERNAL_CFLAGS_BASE} $(WARN_CFLAGS)
@@ -26,5 +26,5 @@ index 12e9b2777ae..ad44fbc3309 100644
  # LDFLAGS is specifically reserved for setting from the command line
  # when running make.
 -- 
-2.33.1
+2.36.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0008-resolve-restrict-keyword-conflict.patch b/meta/recipes-devtools/gdb/gdb/0007-resolve-restrict-keyword-conflict.patch
similarity index 93%
rename from meta/recipes-devtools/gdb/gdb/0008-resolve-restrict-keyword-conflict.patch
rename to meta/recipes-devtools/gdb/gdb/0007-resolve-restrict-keyword-conflict.patch
index 9095f905828..bbd1f0b27f1 100644
--- a/meta/recipes-devtools/gdb/gdb/0008-resolve-restrict-keyword-conflict.patch
+++ b/meta/recipes-devtools/gdb/gdb/0007-resolve-restrict-keyword-conflict.patch
@@ -1,7 +1,7 @@
-From 4ee7e8afb9ff259e889ac938c673fda9ddc5e15a Mon Sep 17 00:00:00 2001
+From 44fa1ecfbd8a5fe0cfea12a175fa041686842a0c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 10 May 2016 08:47:05 -0700
-Subject: [PATCH 08/10] resolve restrict keyword conflict
+Subject: [PATCH 7/9] resolve restrict keyword conflict
 
 GCC detects that we call 'restrict' as param name in function
 signatures and complains since both params are called 'restrict'
@@ -44,5 +44,5 @@ index 90a67d18426..664641a1fe8 100644
  _GL_CXXALIASWARN (gettimeofday);
  # if defined __cplusplus && defined GNULIB_NAMESPACE
 -- 
-2.33.1
+2.36.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0009-Fix-invalid-sigprocmask-call.patch b/meta/recipes-devtools/gdb/gdb/0008-Fix-invalid-sigprocmask-call.patch
similarity index 90%
rename from meta/recipes-devtools/gdb/gdb/0009-Fix-invalid-sigprocmask-call.patch
rename to meta/recipes-devtools/gdb/gdb/0008-Fix-invalid-sigprocmask-call.patch
index 5b9d1cfaf93..ed1310ced28 100644
--- a/meta/recipes-devtools/gdb/gdb/0009-Fix-invalid-sigprocmask-call.patch
+++ b/meta/recipes-devtools/gdb/gdb/0008-Fix-invalid-sigprocmask-call.patch
@@ -1,7 +1,7 @@
-From 5740876d92ddb67b039d5fbcd1b71e6c58823c08 Mon Sep 17 00:00:00 2001
+From 5bdd15553daef7370ca3c1f12d8f14247fdd4907 Mon Sep 17 00:00:00 2001
 From: Yousong Zhou <yszhou4tech@gmail.com>
 Date: Fri, 24 Mar 2017 10:36:03 +0800
-Subject: [PATCH 09/10] Fix invalid sigprocmask call
+Subject: [PATCH 8/9] Fix invalid sigprocmask call
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -32,7 +32,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdbsupport/signals-state-save-restore.cc b/gdbsupport/signals-state-save-restore.cc
-index 95c156e5036..f4aa512d105 100644
+index 92e799d3551..a4a0234272a 100644
 --- a/gdbsupport/signals-state-save-restore.cc
 +++ b/gdbsupport/signals-state-save-restore.cc
 @@ -38,7 +38,7 @@ save_original_signals_state (bool quiet)
@@ -45,5 +45,5 @@ index 95c156e5036..f4aa512d105 100644
      perror_with_name (("sigprocmask"));
  
 -- 
-2.33.1
+2.36.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0010-gdbserver-ctrl-c-handling.patch b/meta/recipes-devtools/gdb/gdb/0009-gdbserver-ctrl-c-handling.patch
similarity index 82%
rename from meta/recipes-devtools/gdb/gdb/0010-gdbserver-ctrl-c-handling.patch
rename to meta/recipes-devtools/gdb/gdb/0009-gdbserver-ctrl-c-handling.patch
index cb4744e5dda..f53d3bd1e54 100644
--- a/meta/recipes-devtools/gdb/gdb/0010-gdbserver-ctrl-c-handling.patch
+++ b/meta/recipes-devtools/gdb/gdb/0009-gdbserver-ctrl-c-handling.patch
@@ -1,7 +1,7 @@
-From d611a68f05c0c86af27bf6beae189a90a946e2e3 Mon Sep 17 00:00:00 2001
+From bc3b1f6aacf2d8fe66b022fbfcf28cd82c76e52f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 29 Nov 2018 18:00:23 -0800
-Subject: [PATCH 10/10] gdbserver ctrl-c handling
+Subject: [PATCH 9/9] gdbserver ctrl-c handling
 
 This problem was created by the upstream commit 78708b7c8c
 After applying the commit, it will send SIGINT to the process
@@ -23,10 +23,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdbserver/linux-low.cc b/gdbserver/linux-low.cc
-index 5c6191d941c..7f7acf6700d 100644
+index 7726a4a0c36..f750e074a03 100644
 --- a/gdbserver/linux-low.cc
 +++ b/gdbserver/linux-low.cc
-@@ -5733,7 +5733,7 @@ linux_process_target::request_interrupt ()
+@@ -5496,7 +5496,7 @@ linux_process_target::request_interrupt ()
  {
    /* Send a SIGINT to the process group.  This acts just like the user
       typed a ^C on the controlling terminal.  */
@@ -36,5 +36,5 @@ index 5c6191d941c..7f7acf6700d 100644
  
  bool
 -- 
-2.33.1
+2.36.1
 
diff --git a/meta/recipes-devtools/gdb/gdb_11.2.bb b/meta/recipes-devtools/gdb/gdb_12.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_11.2.bb
rename to meta/recipes-devtools/gdb/gdb_12.1.bb
-- 
2.36.1


