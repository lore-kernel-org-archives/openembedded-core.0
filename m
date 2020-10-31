Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web11.6389.1604121663514359123
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 22:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MSyVVUFI;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id 1so4035922ple.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 22:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DDeLouEqozw4bkdAQFWx8pSw+IBD7WWvRuEiyHONbP0=;
        b=MSyVVUFItTq/VlqPQK0knYQHT/9sQ1XnVlxvxXeMj7vcGgtJnLVdKC5axmhVTcT5UM
         I3AH9vjNLHWSsq4pP4Ry/5STurMhoNyFUFjtWiadAiQJ5HB7X94Hrar5H8pjGNATBy1q
         gJiyYzcjuafkdDnBb1m+eU1pALmkD3vrbycYBC+sY7RgOvyRt863H1LZrRvRU1zJCkFc
         7/eiF0xmtCbNVucTrLvYa6tfsBsNXeUY6T+YsRio10yGiBewu8DEN3zEhapSPLjVzuun
         H2ostQ/kAm0aWXq0ZqjoszsPLu9Ez4vqYNwUdfAoaXq+lntdcR6+ynilCmoJb+UWhDMd
         t2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DDeLouEqozw4bkdAQFWx8pSw+IBD7WWvRuEiyHONbP0=;
        b=uFEZXg3UyaaCeZ2fOL0d8SCpCTe0Bo35qhKlY3p3i5ikqYy81XL6dcLFSQAoQSMZ/W
         76Ieai+9OYZdPmqBr7Dn3HulTOu1G9Ti5uK1Nn6bB1+p2DJ7DvjfZOh/oTdQIr7/1sRS
         Z6TaNTrSdBFtgyznzjqGqY5lBkHwneb0jcAFFUA04qy/XsgpnUHZ7PtiB03O/fcuYq2K
         EzhdKk/o//MpvQF5Q2nCVVkJAWaWeUVx+QmLwUqhx0k7wMth3GWKH1UjYUCfkIz6zv3P
         bgspWh1UiTPOS93U2r+/cEXPeySEoyy9rkx/sTVwqvNr84xkre+24Lh4Sn/6pEvVoFjS
         PJIA==
X-Gm-Message-State: AOAM530Q6E9hxLc6EXuvv2jgIDaIubZXBFyS4VUwuyw+tcMufKKGIx5L
	5YT0gs7GkLolDyQQL/8Rr3PObFwyfFTmkg==
X-Google-Smtp-Source: ABdhPJxU1Kt6PJ8FFLz1Oo8wCfxknpO238rUs2CFsQCjc58eJ1Jl3Hh6uNsypVcPBiBybwct5/1wDw==
X-Received: by 2002:a17:90b:1058:: with SMTP id gq24mr6723919pjb.29.1604121661880;
        Fri, 30 Oct 2020 22:21:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4874])
        by smtp.gmail.com with ESMTPSA id n5sm6830642pgm.82.2020.10.30.22.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 22:21:01 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH V2] gdb: Update to 10.x release
Date: Fri, 30 Oct 2020 22:20:58 -0700
Message-Id: <20201031052058.2190822-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

here is full announcement [1]

Do not add --disable-static, without adding --enable-shared
because certain libraries e.g. libctf expects the default
to be static which is only disabled if --enable-shared is specified

Do not limit make subdirs, this is only needed when building in a
unified tree, here builds are happening from a release tarball so it is
redundant

[1] https://www.gnu.org/software/gdb/download/ANNOUNCEMENT

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix libctf detection issue for linking gdb

 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../gdb/{gdb-9.2.inc => gdb-10.1.inc}         |  3 +-
 meta/recipes-devtools/gdb/gdb-common.inc      |  4 +-
 ...dian_9.2.bb => gdb-cross-canadian_10.1.bb} |  0
 .../{gdb-cross_9.2.bb => gdb-cross_10.1.bb}   |  0
 ...make-man-install-relative-to-DESTDIR.patch |  9 ++-
 ...ux-nat-Define-_ABIO32-if-not-defined.patch |  9 ++-
 ...e-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 50 ++++++++--------
 ...port-for-Renesas-SH-sh4-architecture.patch | 58 ++++++++++---------
 ...readline.a-when-using-disable-static.patch | 13 +++--
 .../gdb/gdb/0006-use-asm-sgidefs.h.patch      |  9 ++-
 ...-Use-exorted-definitions-of-SIGRTMIN.patch | 13 +++--
 .../gdb/gdb/0008-Change-order-of-CFLAGS.patch | 19 +++---
 ...09-resolve-restrict-keyword-conflict.patch |  9 ++-
 .../0010-Fix-invalid-sigprocmask-call.patch   | 17 +++---
 .../gdb/0011-gdbserver-ctrl-c-handling.patch  | 33 ++++++-----
 .../gdb/{gdb_9.2.bb => gdb_10.1.bb}           |  0
 17 files changed, 139 insertions(+), 109 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-9.2.inc => gdb-10.1.inc} (88%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_9.2.bb => gdb-cross-canadian_10.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_9.2.bb => gdb-cross_10.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_9.2.bb => gdb_10.1.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 50e8a20f35..75796a73fb 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -19,7 +19,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "10.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.35%"
-GDBVERSION ?= "9.%"
+GDBVERSION ?= "10.%"
 GLIBCVERSION ?= "2.32"
 LINUXLIBCVERSION ?= "5.8%"
 QEMUVERSION ?= "5.1%"
diff --git a/meta/recipes-devtools/gdb/gdb-9.2.inc b/meta/recipes-devtools/gdb/gdb-10.1.inc
similarity index 88%
rename from meta/recipes-devtools/gdb/gdb-9.2.inc
rename to meta/recipes-devtools/gdb/gdb-10.1.inc
index 017b61ef62..4b8de2b4e6 100644
--- a/meta/recipes-devtools/gdb/gdb-9.2.inc
+++ b/meta/recipes-devtools/gdb/gdb-10.1.inc
@@ -17,5 +17,4 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0010-Fix-invalid-sigprocmask-call.patch \
            file://0011-gdbserver-ctrl-c-handling.patch \
            "
-SRC_URI[md5sum] = "db95524e554870209ab7d9f8fd8dc557"
-SRC_URI[sha256sum] = "360cd7ae79b776988e89d8f9a01c985d0b1fa21c767a4295e5f88cb49175c555"
+SRC_URI[sha256sum] = "f82f1eceeec14a3afa2de8d9b0d3c91d5a3820e23e0a01bbb70ef9f0276b62c0"
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 08f615addf..46a793595d 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -15,8 +15,6 @@ UPSTREAM_CHECK_GITTAGREGEX = "gdb\-(?P<pver>.+)\-release"
 
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
-EXTRA_OEMAKE = "'SUBDIRS=intl mmalloc libiberty opcodes bfd sim gdb etc utils'"
-
 EXPAT = "--with-expat --with-libexpat-prefix=${STAGING_DIR_HOST}"
 
 EXTRA_OECONF = "--disable-gdbtk --disable-x --disable-werror \
@@ -40,6 +38,8 @@ PACKAGECONFIG[tui] = "--enable-tui,--disable-tui"
 
 GDBPROPREFIX = "--program-prefix=''"
 
+DISABLE_STATIC = ""
+
 do_configure () {
 	# override this function to avoid the autoconf/automake/aclocal/autoheader
 	# calls for now
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_9.2.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_10.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_9.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_10.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_9.2.bb b/meta/recipes-devtools/gdb/gdb-cross_10.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_9.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross_10.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch b/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
index 82287ea13a..84d178332d 100644
--- a/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
+++ b/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
@@ -1,7 +1,7 @@
-From 036f8e1d387f65e52cb021dbb1bd28e8b75cf017 Mon Sep 17 00:00:00 2001
+From e5126c7167e26f865990dc5f86344602603aa8c6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 02:27:55 +0000
-Subject: [PATCH] make man install relative to DESTDIR
+Subject: [PATCH 01/11] make man install relative to DESTDIR
 
 Upstream-Status: Pending
 
@@ -11,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sim/common/Makefile.in b/sim/common/Makefile.in
-index c6de14122c..c4b1214946 100644
+index f713fcaa35b..7c553709d3f 100644
 --- a/sim/common/Makefile.in
 +++ b/sim/common/Makefile.in
 @@ -35,7 +35,7 @@ tooldir = $(libdir)/$(target_alias)
@@ -23,3 +23,6 @@ index c6de14122c..c4b1214946 100644
  infodir = @infodir@
  includedir = @includedir@
  
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch b/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
index 6067caf63d..f830993d5e 100644
--- a/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
+++ b/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
@@ -1,7 +1,7 @@
-From 6bff2862f9597f324a9385eb2f828e838e51a8a1 Mon Sep 17 00:00:00 2001
+From 0680242c9a3a0149a23e63034ecb4404de2293dd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 23 Mar 2016 06:30:09 +0000
-Subject: [PATCH] mips-linux-nat: Define _ABIO32 if not defined
+Subject: [PATCH 02/11] mips-linux-nat: Define _ABIO32 if not defined
 
 This helps building gdb on mips64 on musl, since
 musl does not provide sgidefs.h this define is
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index 104c972f24..7f575b3363 100644
+index 38ff461a35b..4337795bac8 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -41,6 +41,10 @@
@@ -30,3 +30,6 @@ index 104c972f24..7f575b3363 100644
  
  class mips_linux_nat_target final : public linux_nat_trad_target
  {
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
index c4bab7bb1a..cbe1779db7 100644
--- a/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
+++ b/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -1,36 +1,19 @@
-From d5817bcf2f7313699bfa85b41220d862db327664 Mon Sep 17 00:00:00 2001
+From afbb66c244b1ae0aaaa90d88d3cd484f741c614f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 18:32:14 -0700
-Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
+Subject: [PATCH 03/11] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC
+ systems
 
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- gdb/gdbserver/linux-ppc-low.c | 6 ++++++
- gdb/nat/ppc-linux.h           | 6 ++++++
+ gdb/nat/ppc-linux.h        | 6 ++++++
+ gdbserver/linux-ppc-low.cc | 6 ++++++
  2 files changed, 12 insertions(+)
 
-diff --git a/gdb/gdbserver/linux-ppc-low.c b/gdb/gdbserver/linux-ppc-low.c
-index 5d8d67bec2..ffcf65ab58 100644
---- a/gdb/gdbserver/linux-ppc-low.c
-+++ b/gdb/gdbserver/linux-ppc-low.c
-@@ -23,7 +23,13 @@
- #include "elf/common.h"
- #include <sys/uio.h>
- #include <elf.h>
-+#if !defined(__GLIBC__)
-+# define pt_regs uapi_pt_regs
-+#endif
- #include <asm/ptrace.h>
-+#if !defined(__GLIBC__)
-+# undef pt_regs
-+#endif
- 
- #include "arch/ppc-linux-common.h"
- #include "arch/ppc-linux-tdesc.h"
 diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
-index d937a65b69..1fd54b4a0e 100644
+index d937a65b69c..1fd54b4a0e0 100644
 --- a/gdb/nat/ppc-linux.h
 +++ b/gdb/nat/ppc-linux.h
 @@ -18,7 +18,13 @@
@@ -47,3 +30,24 @@ index d937a65b69..1fd54b4a0e 100644
  #include <asm/cputable.h>
  
  /* This sometimes isn't defined.  */
+diff --git a/gdbserver/linux-ppc-low.cc b/gdbserver/linux-ppc-low.cc
+index 337d555aee7..5d518f37268 100644
+--- a/gdbserver/linux-ppc-low.cc
++++ b/gdbserver/linux-ppc-low.cc
+@@ -23,7 +23,13 @@
+ #include "elf/common.h"
+ #include <sys/uio.h>
+ #include <elf.h>
++#if !defined(__GLIBC__)
++# define pt_regs uapi_pt_regs
++#endif
+ #include <asm/ptrace.h>
++#if !defined(__GLIBC__)
++# undef pt_regs
++#endif
+ 
+ #include "arch/ppc-linux-common.h"
+ #include "arch/ppc-linux-tdesc.h"
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/gdb/gdb/0004-Add-support-for-Renesas-SH-sh4-architecture.patch b/meta/recipes-devtools/gdb/gdb/0004-Add-support-for-Renesas-SH-sh4-architecture.patch
index fd165d4b81..561cfff943 100644
--- a/meta/recipes-devtools/gdb/gdb/0004-Add-support-for-Renesas-SH-sh4-architecture.patch
+++ b/meta/recipes-devtools/gdb/gdb/0004-Add-support-for-Renesas-SH-sh4-architecture.patch
@@ -1,7 +1,7 @@
-From 505f10a0ea1a8bba0584859d9a348bb779593ec2 Mon Sep 17 00:00:00 2001
+From 26e406962cf7298837b350b979afff0ac34ecb0b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 02:31:12 +0000
-Subject: [PATCH] Add support for Renesas SH (sh4) architecture.
+Subject: [PATCH 04/11] Add support for Renesas SH (sh4) architecture.
 
 gdb (7.4-1~cvs20111117.2) experimental; urgency=low
  .
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  gdb/Makefile.in                      |   2 +
  gdb/configure.host                   |   1 +
  gdb/sh-linux-tdep.c                  | 519 +++++++++++++++++++++++++++
- gdb/sh-tdep.c                        |  53 ++-
+ gdb/sh-tdep.c                        |  52 +--
  gdb/sh-tdep.h                        |  49 +++
  gdb/testsuite/gdb.asm/asm-source.exp |   5 +
  gdb/testsuite/gdb.asm/sh.inc         |   3 +-
@@ -24,13 +24,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  gdb/testsuite/gdb.base/annota3.c     |   4 +
  gdb/testsuite/gdb.base/sigall.c      |   3 +
  gdb/testsuite/gdb.base/signals.c     |   4 +
- 11 files changed, 617 insertions(+), 29 deletions(-)
+ 11 files changed, 617 insertions(+), 28 deletions(-)
 
 diff --git a/gdb/Makefile.in b/gdb/Makefile.in
-index c3e074b21f..42dd7af59c 100644
+index 4808357e651..a009004ab05 100644
 --- a/gdb/Makefile.in
 +++ b/gdb/Makefile.in
-@@ -2317,6 +2317,8 @@ ALLDEPFILES = \
+@@ -2273,6 +2273,8 @@ ALLDEPFILES = \
  	sh-nbsd-nat.c \
  	sh-nbsd-tdep.c \
  	sh-tdep.c \
@@ -40,7 +40,7 @@ index c3e074b21f..42dd7af59c 100644
  	solib-aix.c \
  	solib-svr4.c \
 diff --git a/gdb/configure.host b/gdb/configure.host
-index ce52823729..5b5173a71a 100644
+index ce528237291..5b5173a71aa 100644
 --- a/gdb/configure.host
 +++ b/gdb/configure.host
 @@ -148,6 +148,7 @@ riscv*-*-linux*)	gdb_host=linux ;;
@@ -52,7 +52,7 @@ index ce52823729..5b5173a71a 100644
  			gdb_host=nbsd ;;
  sh*-*-openbsd*)		gdb_host=nbsd ;;
 diff --git a/gdb/sh-linux-tdep.c b/gdb/sh-linux-tdep.c
-index 13c10eeeda..1d0d583a64 100644
+index 5d2f38f5801..06a45b74827 100644
 --- a/gdb/sh-linux-tdep.c
 +++ b/gdb/sh-linux-tdep.c
 @@ -18,14 +18,37 @@
@@ -600,7 +600,7 @@ index 13c10eeeda..1d0d583a64 100644
  
    /* GNU/Linux uses SVR4-style shared libraries.  */
 diff --git a/gdb/sh-tdep.c b/gdb/sh-tdep.c
-index e3aee0ac28..5958cf3688 100644
+index 7aadf9165ca..e173e215a2d 100644
 --- a/gdb/sh-tdep.c
 +++ b/gdb/sh-tdep.c
 @@ -21,6 +21,9 @@
@@ -637,16 +637,15 @@ index e3aee0ac28..5958cf3688 100644
  static int
  sh_is_renesas_calling_convention (struct type *func_type)
  {
-@@ -1050,7 +1036,7 @@ sh_treat_as_flt_p (struct type *type)
+@@ -1050,6 +1036,7 @@ sh_treat_as_flt_p (struct type *type)
      return 0;
    /* Otherwise if the type of that member is float, the whole type is
       treated as float.  */
--  if (TYPE_CODE (TYPE_FIELD_TYPE (type, 0)) == TYPE_CODE_FLT)
-+  if (TYPE_CODE (check_typedef (TYPE_FIELD_TYPE (type, 0))) == TYPE_CODE_FLT)
++  type = check_typedef (type);
+   if (type->field (0).type ()->code () == TYPE_CODE_FLT)
      return 1;
    /* Otherwise it's not treated as float.  */
-   return 0;
-@@ -1100,7 +1086,7 @@ sh_push_dummy_call_fpu (struct gdbarch *gdbarch,
+@@ -1100,7 +1087,7 @@ sh_push_dummy_call_fpu (struct gdbarch *gdbarch,
       in four registers available.  Loop thru args from first to last.  */
    for (argnum = 0; argnum < nargs; argnum++)
      {
@@ -655,7 +654,7 @@ index e3aee0ac28..5958cf3688 100644
        len = TYPE_LENGTH (type);
        val = sh_justify_value_in_reg (gdbarch, args[argnum], len);
  
-@@ -1835,7 +1821,7 @@ sh_dwarf2_frame_init_reg (struct gdbarch *gdbarch, int regnum,
+@@ -1835,7 +1822,7 @@ sh_dwarf2_frame_init_reg (struct gdbarch *gdbarch, int regnum,
      reg->how = DWARF2_FRAME_REG_UNDEFINED;
  }
  
@@ -664,7 +663,7 @@ index e3aee0ac28..5958cf3688 100644
  sh_alloc_frame_cache (void)
  {
    struct sh_frame_cache *cache;
-@@ -1862,7 +1848,7 @@ sh_alloc_frame_cache (void)
+@@ -1862,7 +1849,7 @@ sh_alloc_frame_cache (void)
    return cache;
  }
  
@@ -673,7 +672,7 @@ index e3aee0ac28..5958cf3688 100644
  sh_frame_cache (struct frame_info *this_frame, void **this_cache)
  {
    struct gdbarch *gdbarch = get_frame_arch (this_frame);
-@@ -1929,9 +1915,9 @@ sh_frame_cache (struct frame_info *this_frame, void **this_cache)
+@@ -1929,9 +1916,9 @@ sh_frame_cache (struct frame_info *this_frame, void **this_cache)
    return cache;
  }
  
@@ -686,7 +685,7 @@ index e3aee0ac28..5958cf3688 100644
  {
    struct gdbarch *gdbarch = get_frame_arch (this_frame);
    struct sh_frame_cache *cache = sh_frame_cache (this_frame, this_cache);
-@@ -1945,7 +1931,7 @@ sh_frame_prev_register (struct frame_info *this_frame,
+@@ -1945,7 +1932,7 @@ sh_frame_prev_register (struct frame_info *this_frame,
       the current frame.  Frob regnum so that we pull the value from
       the correct place.  */
    if (regnum == gdbarch_pc_regnum (gdbarch))
@@ -695,7 +694,7 @@ index e3aee0ac28..5958cf3688 100644
  
    if (regnum < SH_NUM_REGS && cache->saved_regs[regnum] != -1)
      return frame_unwind_got_memory (this_frame, regnum,
-@@ -2234,8 +2220,8 @@ sh_return_in_first_hidden_param_p (struct gdbarch *gdbarch,
+@@ -2234,8 +2221,8 @@ sh_return_in_first_hidden_param_p (struct gdbarch *gdbarch,
  static struct gdbarch *
  sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
  {
@@ -705,7 +704,7 @@ index e3aee0ac28..5958cf3688 100644
  
    /* If there is already a candidate, use it.  */
    arches = gdbarch_list_lookup_by_info (arches, &info);
-@@ -2247,6 +2233,18 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
+@@ -2247,6 +2234,18 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
    tdep = XCNEW (struct gdbarch_tdep);
    gdbarch = gdbarch_alloc (&info, tdep);
  
@@ -724,7 +723,7 @@ index e3aee0ac28..5958cf3688 100644
    set_gdbarch_short_bit (gdbarch, 2 * TARGET_CHAR_BIT);
    set_gdbarch_int_bit (gdbarch, 4 * TARGET_CHAR_BIT);
    set_gdbarch_long_bit (gdbarch, 4 * TARGET_CHAR_BIT);
-@@ -2398,10 +2396,11 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
+@@ -2398,10 +2397,11 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
        break;
      }
  
@@ -738,7 +737,7 @@ index e3aee0ac28..5958cf3688 100644
    frame_unwind_append_unwinder (gdbarch, &sh_frame_unwind);
  
 diff --git a/gdb/sh-tdep.h b/gdb/sh-tdep.h
-index 76e2e76e39..2710f63010 100644
+index 76e2e76e39b..2710f63010c 100644
 --- a/gdb/sh-tdep.h
 +++ b/gdb/sh-tdep.h
 @@ -21,6 +21,12 @@
@@ -821,7 +820,7 @@ index 76e2e76e39..2710f63010 100644
       where each general-purpose register is stored inside the associated
       core file section.  */
 diff --git a/gdb/testsuite/gdb.asm/asm-source.exp b/gdb/testsuite/gdb.asm/asm-source.exp
-index 4914498f98..6e25cbed18 100644
+index 4914498f98c..6e25cbed185 100644
 --- a/gdb/testsuite/gdb.asm/asm-source.exp
 +++ b/gdb/testsuite/gdb.asm/asm-source.exp
 @@ -116,6 +116,11 @@ switch -glob -- [istarget] {
@@ -837,7 +836,7 @@ index 4914498f98..6e25cbed18 100644
          set asm-arch sh
  	set debug-flags "-gdwarf-2"
 diff --git a/gdb/testsuite/gdb.asm/sh.inc b/gdb/testsuite/gdb.asm/sh.inc
-index a4a5fc545e..89efed7795 100644
+index a4a5fc545e4..89efed7795c 100644
 --- a/gdb/testsuite/gdb.asm/sh.inc
 +++ b/gdb/testsuite/gdb.asm/sh.inc
 @@ -40,9 +40,8 @@
@@ -852,7 +851,7 @@ index a4a5fc545e..89efed7795 100644
  	.align	1
  .Lafterconst\@:
 diff --git a/gdb/testsuite/gdb.base/annota1.c b/gdb/testsuite/gdb.base/annota1.c
-index 424e1b8327..0de2e7b633 100644
+index 424e1b83278..0de2e7b633a 100644
 --- a/gdb/testsuite/gdb.base/annota1.c
 +++ b/gdb/testsuite/gdb.base/annota1.c
 @@ -1,6 +1,9 @@
@@ -866,7 +865,7 @@ index 424e1b8327..0de2e7b633 100644
  void
  handle_USR1 (int sig)
 diff --git a/gdb/testsuite/gdb.base/annota3.c b/gdb/testsuite/gdb.base/annota3.c
-index 424e1b8327..952aaf218a 100644
+index 424e1b83278..952aaf218ab 100644
 --- a/gdb/testsuite/gdb.base/annota3.c
 +++ b/gdb/testsuite/gdb.base/annota3.c
 @@ -1,6 +1,10 @@
@@ -881,7 +880,7 @@ index 424e1b8327..952aaf218a 100644
  void
  handle_USR1 (int sig)
 diff --git a/gdb/testsuite/gdb.base/sigall.c b/gdb/testsuite/gdb.base/sigall.c
-index 81f3b08d6b..1574b2d6cb 100644
+index 81f3b08d6bc..1574b2d6cb8 100644
 --- a/gdb/testsuite/gdb.base/sigall.c
 +++ b/gdb/testsuite/gdb.base/sigall.c
 @@ -1,6 +1,9 @@
@@ -895,7 +894,7 @@ index 81f3b08d6b..1574b2d6cb 100644
  /* Signal handlers, we set breakpoints in them to make sure that the
     signals really get delivered.  */
 diff --git a/gdb/testsuite/gdb.base/signals.c b/gdb/testsuite/gdb.base/signals.c
-index 756606880f..1205a9bc9c 100644
+index 756606880fa..1205a9bc9c5 100644
 --- a/gdb/testsuite/gdb.base/signals.c
 +++ b/gdb/testsuite/gdb.base/signals.c
 @@ -3,6 +3,10 @@
@@ -909,3 +908,6 @@ index 756606880f..1205a9bc9c 100644
  
  static int count = 0;
  
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-when-using-disable-static.patch b/meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-when-using-disable-static.patch
index d0360da439..71eab1c2b1 100644
--- a/meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-when-using-disable-static.patch
+++ b/meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-when-using-disable-static.patch
@@ -1,7 +1,7 @@
-From d132f21d89157e980574da7d0c949f6dd17df8c3 Mon Sep 17 00:00:00 2001
+From ec566877c50bdae0013a38dd457004e1db725d86 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:25:03 -0700
-Subject: [PATCH] Dont disable libreadline.a when using --disable-static
+Subject: [PATCH 05/11] Dont disable libreadline.a when using --disable-static
 
 If gdb is configured with --disable-static then this is dutifully passed to
 readline which then disables libreadline.a, which causes a problem when gdb
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.def b/Makefile.def
-index 311feb9de3..24c0685d48 100644
+index 76d062bb671..e0a1e2b14b1 100644
 --- a/Makefile.def
 +++ b/Makefile.def
 @@ -105,7 +105,8 @@ host_modules= { module= libiconv;
@@ -33,10 +33,10 @@ index 311feb9de3..24c0685d48 100644
  host_modules= { module= sim; };
  host_modules= { module= texinfo; no_install= true; };
 diff --git a/Makefile.in b/Makefile.in
-index 1aabf6ede4..d957efde81 100644
+index 9dfd39fae13..eaf1dd0f229 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -25510,7 +25510,7 @@ configure-readline:
+@@ -25548,7 +25548,7 @@ configure-readline:
  	  $$s/$$module_srcdir/configure \
  	  --srcdir=$${topdir}/$$module_srcdir \
  	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
@@ -45,3 +45,6 @@ index 1aabf6ede4..d957efde81 100644
  	  || exit 1
  @endif readline
  
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch b/meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch
index d222d01083..a2932be6fb 100644
--- a/meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch
+++ b/meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch
@@ -1,7 +1,7 @@
-From 329e5bf29e934ba99622372a9660865864bb0298 Mon Sep 17 00:00:00 2001
+From 4b02e54b87d435e1715ce871bcce720561a7afb1 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <amccurdy@gmail.com>
 Date: Sat, 30 Apr 2016 15:29:06 -0700
-Subject: [PATCH] use <asm/sgidefs.h>
+Subject: [PATCH 06/11] use <asm/sgidefs.h>
 
 Build fix for MIPS with musl libc
 
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index 7f575b3363..dc93a64a93 100644
+index 4337795bac8..7c8e54cabe0 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -31,7 +31,7 @@
@@ -31,3 +31,6 @@ index 7f575b3363..dc93a64a93 100644
  #include "nat/gdb_ptrace.h"
  #include <asm/ptrace.h>
  #include "inf-ptrace.h"
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/gdb/gdb/0007-Use-exorted-definitions-of-SIGRTMIN.patch b/meta/recipes-devtools/gdb/gdb/0007-Use-exorted-definitions-of-SIGRTMIN.patch
index 09896611f0..8cbc50b75f 100644
--- a/meta/recipes-devtools/gdb/gdb/0007-Use-exorted-definitions-of-SIGRTMIN.patch
+++ b/meta/recipes-devtools/gdb/gdb/0007-Use-exorted-definitions-of-SIGRTMIN.patch
@@ -1,7 +1,7 @@
-From 782bb2ab9b104dad4bbaed1d9ac769ce7e5b9f4d Mon Sep 17 00:00:00 2001
+From 53f694ffa1ee9893b834758413c23947957f0fee Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:31:40 -0700
-Subject: [PATCH] Use exorted definitions of SIGRTMIN
+Subject: [PATCH 07/11] Use exorted definitions of SIGRTMIN
 
 Define W_STOPCODE if not defined already
 
@@ -20,10 +20,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/gdb/linux-nat.c b/gdb/linux-nat.c
-index 4484fa5c87..3bb0ee7a49 100644
+index b81014024c7..e0513d47122 100644
 --- a/gdb/linux-nat.c
 +++ b/gdb/linux-nat.c
-@@ -4588,6 +4588,6 @@ lin_thread_get_thread_signals (sigset_t *set)
+@@ -4428,6 +4428,6 @@ lin_thread_get_thread_signals (sigset_t *set)
    /* NPTL reserves the first two RT signals, but does not provide any
       way for the debugger to query the signal numbers - fortunately
       they don't change.  */
@@ -33,7 +33,7 @@ index 4484fa5c87..3bb0ee7a49 100644
 +  sigaddset (set, SIGRTMIN + 1);
  }
 diff --git a/gdb/nat/linux-nat.h b/gdb/nat/linux-nat.h
-index 44dcbb7758..975d7276f6 100644
+index 44dcbb7758d..975d7276f66 100644
 --- a/gdb/nat/linux-nat.h
 +++ b/gdb/nat/linux-nat.h
 @@ -91,4 +91,8 @@ extern void linux_stop_lwp (struct lwp_info *lwp);
@@ -45,3 +45,6 @@ index 44dcbb7758..975d7276f6 100644
 +#endif
 +
  #endif /* NAT_LINUX_NAT_H */
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/gdb/gdb/0008-Change-order-of-CFLAGS.patch b/meta/recipes-devtools/gdb/gdb/0008-Change-order-of-CFLAGS.patch
index 18168c6bae..4622752247 100644
--- a/meta/recipes-devtools/gdb/gdb/0008-Change-order-of-CFLAGS.patch
+++ b/meta/recipes-devtools/gdb/gdb/0008-Change-order-of-CFLAGS.patch
@@ -1,7 +1,7 @@
-From 40c9c174590ce6fdc873b453285249fe957f376d Mon Sep 17 00:00:00 2001
+From 07175ae348c9d07581e1db94762d5a2d577a75ad Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:35:39 -0700
-Subject: [PATCH] Change order of CFLAGS
+Subject: [PATCH 08/11] Change order of CFLAGS
 
 Lets us override Werror if need be
 
@@ -9,14 +9,14 @@ Upstream-Status: Inappropriate
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- gdb/gdbserver/Makefile.in | 2 +-
+ gdbserver/Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/gdb/gdbserver/Makefile.in b/gdb/gdbserver/Makefile.in
-index 16a9f2fd38..b9c8cd9c41 100644
---- a/gdb/gdbserver/Makefile.in
-+++ b/gdb/gdbserver/Makefile.in
-@@ -146,7 +146,7 @@ PTHREAD_LIBS = @PTHREAD_LIBS@
+diff --git a/gdbserver/Makefile.in b/gdbserver/Makefile.in
+index 2b1a77f2de7..cb5ddb12fd5 100644
+--- a/gdbserver/Makefile.in
++++ b/gdbserver/Makefile.in
+@@ -161,7 +161,7 @@ WIN32APILIBS = @WIN32APILIBS@
  INTERNAL_CFLAGS_BASE = ${CXXFLAGS} ${GLOBAL_CFLAGS} \
  	${PROFILE_CFLAGS} ${INCLUDE_CFLAGS} ${CPPFLAGS} $(PTHREAD_CFLAGS)
  INTERNAL_WARN_CFLAGS = ${INTERNAL_CFLAGS_BASE} $(WARN_CFLAGS)
@@ -25,3 +25,6 @@ index 16a9f2fd38..b9c8cd9c41 100644
  
  # LDFLAGS is specifically reserved for setting from the command line
  # when running make.
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/gdb/gdb/0009-resolve-restrict-keyword-conflict.patch b/meta/recipes-devtools/gdb/gdb/0009-resolve-restrict-keyword-conflict.patch
index 8f15c49d0e..698fdb0672 100644
--- a/meta/recipes-devtools/gdb/gdb/0009-resolve-restrict-keyword-conflict.patch
+++ b/meta/recipes-devtools/gdb/gdb/0009-resolve-restrict-keyword-conflict.patch
@@ -1,7 +1,7 @@
-From 5b69a98f6bb7363a1f79f29bac2b25b7df6d2fdd Mon Sep 17 00:00:00 2001
+From 73a3babe48c7948f71683d0862eddc1609fdaa3d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 10 May 2016 08:47:05 -0700
-Subject: [PATCH] resolve restrict keyword conflict
+Subject: [PATCH 09/11] resolve restrict keyword conflict
 
 GCC detects that we call 'restrict' as param name in function
 signatures and complains since both params are called 'restrict'
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/gnulib/import/sys_time.in.h b/gnulib/import/sys_time.in.h
-index d535a6a48b..7c34d5a1aa 100644
+index d30b26719b2..fd76af5e6d9 100644
 --- a/gnulib/import/sys_time.in.h
 +++ b/gnulib/import/sys_time.in.h
 @@ -93,20 +93,20 @@ struct timeval
@@ -43,3 +43,6 @@ index d535a6a48b..7c34d5a1aa 100644
  # endif
  _GL_CXXALIASWARN (gettimeofday);
  # if defined __cplusplus && defined GNULIB_NAMESPACE
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/gdb/gdb/0010-Fix-invalid-sigprocmask-call.patch b/meta/recipes-devtools/gdb/gdb/0010-Fix-invalid-sigprocmask-call.patch
index 5209c00275..7cf3eae753 100644
--- a/meta/recipes-devtools/gdb/gdb/0010-Fix-invalid-sigprocmask-call.patch
+++ b/meta/recipes-devtools/gdb/gdb/0010-Fix-invalid-sigprocmask-call.patch
@@ -1,7 +1,7 @@
-From bc1f01ff5e524f7777083024bce348a9b0017a7a Mon Sep 17 00:00:00 2001
+From c5c5372c6a319cac8b3f9f86304fcebcbb5ea06f Mon Sep 17 00:00:00 2001
 From: Yousong Zhou <yszhou4tech@gmail.com>
 Date: Fri, 24 Mar 2017 10:36:03 +0800
-Subject: [PATCH] Fix invalid sigprocmask call
+Subject: [PATCH 10/11] Fix invalid sigprocmask call
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -28,13 +28,13 @@ Upstream-Status: Pending [not author, cherry-picked from LEDE https://bugs.lede-
 Signed-off-by: André Draszik <adraszik@tycoint.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- gdb/gdbsupport/signals-state-save-restore.c | 2 +-
+ gdbsupport/signals-state-save-restore.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/gdb/gdbsupport/signals-state-save-restore.c b/gdb/gdbsupport/signals-state-save-restore.c
-index c292d498da..af9dcaeb08 100644
---- a/gdb/gdbsupport/signals-state-save-restore.c
-+++ b/gdb/gdbsupport/signals-state-save-restore.c
+diff --git a/gdbsupport/signals-state-save-restore.cc b/gdbsupport/signals-state-save-restore.cc
+index c292d498daf..af9dcaeb08e 100644
+--- a/gdbsupport/signals-state-save-restore.cc
++++ b/gdbsupport/signals-state-save-restore.cc
 @@ -38,7 +38,7 @@ save_original_signals_state (bool quiet)
    int i;
    int res;
@@ -44,3 +44,6 @@ index c292d498da..af9dcaeb08 100644
    if (res == -1)
      perror_with_name (("sigprocmask"));
  
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/gdb/gdb/0011-gdbserver-ctrl-c-handling.patch b/meta/recipes-devtools/gdb/gdb/0011-gdbserver-ctrl-c-handling.patch
index eedd94c4d4..0a596b522f 100644
--- a/meta/recipes-devtools/gdb/gdb/0011-gdbserver-ctrl-c-handling.patch
+++ b/meta/recipes-devtools/gdb/gdb/0011-gdbserver-ctrl-c-handling.patch
@@ -1,7 +1,7 @@
-From 3d6700d38153a0ec8e0800de703a5089a8cd3d2d Mon Sep 17 00:00:00 2001
+From 63df98fa78c8a6e12b40ebdc5c155838d2bf8b5f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 29 Nov 2018 18:00:23 -0800
-Subject: [PATCH] gdbserver ctrl-c handling
+Subject: [PATCH 11/11] gdbserver ctrl-c handling
 
 This problem was created by the upstream commit 78708b7c8c
 After applying the commit, it will send SIGINT to the process
@@ -19,21 +19,22 @@ Author: Josh Gao
 Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- gdb/gdbserver/linux-low.c | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
+ gdbserver/linux-low.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/gdb/gdbserver/linux-low.c b/gdb/gdbserver/linux-low.c
-index 4255795ea6..762f8bafb6 100644
---- a/gdb/gdbserver/linux-low.c
-+++ b/gdb/gdbserver/linux-low.c
-@@ -5904,9 +5904,7 @@ linux_look_up_symbols (void)
- static void
- linux_request_interrupt (void)
+diff --git a/gdbserver/linux-low.cc b/gdbserver/linux-low.cc
+index e45493339d2..aabc099b456 100644
+--- a/gdbserver/linux-low.cc
++++ b/gdbserver/linux-low.cc
+@@ -5714,7 +5714,7 @@ linux_process_target::request_interrupt ()
  {
--  /* Send a SIGINT to the process group.  This acts just like the user
--     typed a ^C on the controlling terminal.  */
--  kill (-signal_pid, SIGINT);
-+  kill (signal_pid, SIGINT);
+   /* Send a SIGINT to the process group.  This acts just like the user
+      typed a ^C on the controlling terminal.  */
+-  ::kill (-signal_pid, SIGINT);
++  ::kill (signal_pid, SIGINT);
  }
  
- /* Copy LEN bytes from inferior's auxiliary vector starting at OFFSET
+ bool
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/gdb/gdb_9.2.bb b/meta/recipes-devtools/gdb/gdb_10.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_9.2.bb
rename to meta/recipes-devtools/gdb/gdb_10.1.bb
-- 
2.29.2

