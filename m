Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B8BC3ABA9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 17:53:14 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.1363.1746035592117768478
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 10:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DJOV5qfZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736a72220edso223070b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 10:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746035591; x=1746640391; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wNJjyCA5pFp323GJpKlbTEFSquh1yWpo8mEBewCkUw=;
        b=DJOV5qfZhYDIg6GDZIgQ72TMxmFn9bHxCmMjfTV++VYwmIzIXENU+eATApsWfY4UQ6
         yfVTNEMc41Eeur0waN5f+KiQyS3K8bQCxPReJuVsr4MAkyID8jza6MDUT6SH2D+8jkbN
         t6QjH86zVud5m+dqeI/FSO2BhSPfdoiq2SR6gXUsflDzKHyI1lw4XXxBrBgtJPRujiqg
         bgTE3+lTrojAfXBzbBk/5Dn2iKboLaO/M0QBFNwd8rG5CbPid7FfvXg2aad3jjWjfu58
         3qAfleJbvjA84k0AldybtGxUB5w48yJMN3tNm8JC00nH6KKRjzDOxBh58JLrr3Q/t5+Y
         pTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035591; x=1746640391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wNJjyCA5pFp323GJpKlbTEFSquh1yWpo8mEBewCkUw=;
        b=Ct47nZ7cPzNxTW1daZCu4FdcsRerUExvzJRu3tJlgf4F0Gs9aE+xkG7610qLPNVhut
         i6OdOYZXuZVKE8OJek3G9nNABw3XVqTTNZX1XSaEIQu2jlTGqXDGU1+2NowrHt1yP+A/
         tKzl8VvmYJX4odb2SdXVwmnFiWVmz2+VdN9jIg1ZlCmvLGPJ5kdFH9vyTn+1TetkYKm1
         3Ek7zBsdoC6TYExehhOJW/6+vHHfHpICJsnsQf0UT2/ywpyTo/9kCoFyyNyZ33VTeMHv
         2EJu4Zt3Cke64bj5Phmp6XpAuCSivcw0yAXXl/f8nfpQCMzdDipRAWh6COjYkx4Jqkfm
         ozsg==
X-Gm-Message-State: AOJu0YyIrxsvMRiGW1+SQM4TUXymmusIknGw9U4P4PLSOhUBiH22IGeO
	WxRU7tH5Sw9A3EQ9vpm4InvbadZwiJ3mSAUsFFBHdRli9gvdKnBdNmI+V3Ti
X-Gm-Gg: ASbGncvfGndJUr1JiGF/B6ewC11lsGwLRs9Nk4+yJ6JS7vv4TVD7Xh/LwfCIFfKgBb8
	QBcTYa7xnTL2J3y5r8GbaCwwL8fwSeuweauuCL9lkNcAxmLkquv92LpGe7NCHiWEwlCnhC0HR9I
	sLHlV4u+kvld9kQXx5nICU6+lHmR4tvWkF3EvJtkyyU8YebOA/ZOmoIOIWtqdKeiRtOpNdoOGoC
	YXUx5QGJa7eWF99e/R3K1RF72oiiznrPpXO3+2QfPzCjfYdZ9QdGREIMWbcaxOmqXKprjITcdKt
	2bi+CvVERwwnFdszMIjK1HcvhUMGI0Ls
X-Google-Smtp-Source: AGHT+IEXPc2nFsdcI9kDtdxtqLCtOzH2187QLmzeIrXVg6wrOAFz4L2nvcvdBbJXyq5bMwvHVlONZw==
X-Received: by 2002:a05:6a00:804:b0:73c:c11:b42e with SMTP id d2e1a72fcca58-74038ab9dd8mr6266388b3a.20.1746035591126;
        Wed, 30 Apr 2025 10:53:11 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b8ae])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740398fa3e4sm2024086b3a.19.2025.04.30.10.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 10:53:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] gdb: Upgrade to 16.3
Date: Wed, 30 Apr 2025 10:53:05 -0700
Message-ID: <20250430175305.540369-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430175305.540369-1-raj.khem@gmail.com>
References: <20250430175305.540369-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 17:53:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215757

Add couple of readline patches to fix build with internal readline

Other Changes

* PR symtab/32309 ([gdb/symtab, fission] gdb/dwarf2/read.h:289:
internal-error: version: Assertion `m_dwarf_version != 0' failed)

 * PR corefiles/32441 (gdb segfaults when generating a core file if
target_fileio_read_alloc fails)

 * PR tui/32623 (TUI console window doesn't update while inferior is running)

 * PR corefiles/32634 ([gdb/corefiles] segfault in
gdb.arch/i386-biarch-core.exp)

 * PR backtrace/32757 ("Assertion `stashed' failed" when inline frame #0 is
duplicated)

 * PR tdep/32770 ([gdb/tdep, i386] FAIL: gdb.reverse/recvmsg-reverse.exp:
continue to breakpoint: marker2)

 * PR gdb/32775 ([AArch64] gdbserver crashes on SVE/SME-enabled systems)

 * PR record/32784 ([gdb/record, aarch64] Stack smashing detected in
aarch64_record_asimd_load_store)

 * PR tui/32797 (Escape sequences to only reset foreground or background color
to default fail)

 * PR gdb/32828 (gstack regression: missing file names and line numbers)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ian_16.2.bb => gdb-cross-canadian_16.3.bb} |   0
 .../{gdb-cross_16.2.bb => gdb-cross_16.3.bb}  |   0
 meta/recipes-devtools/gdb/gdb.inc             |   4 +-
 ...ux-nat-Define-_ABIO32-if-not-defined.patch |   2 +-
 ...e-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |   6 +-
 ...readline.a-when-using-disable-static.patch |   2 +-
 .../gdb/gdb/0004-use-asm-sgidefs.h.patch      |   2 +-
 .../gdb/gdb/0005-Change-order-of-CFLAGS.patch |   4 +-
 .../0006-Fix-invalid-sigprocmask-call.patch   |   2 +-
 ...sing-_Alignof-when-using-C11-or-newe.patch |   2 +-
 ...ages-that-are-not-compatible-with-C2.patch |  29 ++++
 .../gdb/0009-Readline-8.3-alpha-release.patch | 164 ++++++++++++++++++
 .../gdb/{gdb_16.2.bb => gdb_16.3.bb}          |   0
 13 files changed, 206 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_16.2.bb => gdb-cross-canadian_16.3.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_16.2.bb => gdb-cross_16.3.bb} (100%)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0008-Add-fix-for-packages-that-are-not-compatible-with-C2.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch
 rename meta/recipes-devtools/gdb/{gdb_16.2.bb => gdb_16.3.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_16.2.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_16.3.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_16.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_16.3.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_16.2.bb b/meta/recipes-devtools/gdb/gdb-cross_16.3.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_16.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross_16.3.bb
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 1ac29b45f68..a36f78fe672 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -12,5 +12,7 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0005-Change-order-of-CFLAGS.patch \
            file://0006-Fix-invalid-sigprocmask-call.patch \
            file://0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
+           file://0008-Add-fix-for-packages-that-are-not-compatible-with-C2.patch \
+           file://0009-Readline-8.3-alpha-release.patch \
            "
-SRC_URI[sha256sum] = "4002cb7f23f45c37c790536a13a720942ce4be0402d929c9085e92f10d480119"
+SRC_URI[sha256sum] = "bcfcd095528a987917acf9fff3f1672181694926cc18d609c99d0042c00224c5"
diff --git a/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch b/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
index 5e313a08b21..7a3064a14bb 100644
--- a/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
+++ b/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
@@ -1,4 +1,4 @@
-From 31c6c42479e750aff3130e76bae2646c418cb548 Mon Sep 17 00:00:00 2001
+From 8448967d9cfb09eb11fd3573a72a35ae94a89ba1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 23 Mar 2016 06:30:09 +0000
 Subject: [PATCH] mips-linux-nat: Define _ABIO32 if not defined
diff --git a/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
index 69d4d51af08..56cbacf3848 100644
--- a/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
+++ b/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -1,4 +1,4 @@
-From 8f350f9b7b3934bd492cad35e1b6e44d142313a4 Mon Sep 17 00:00:00 2001
+From ec49e6283bc6a4a99596410db9509bee6cd941ce Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 18:32:14 -0700
 Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 12 insertions(+)
 
 diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
-index b51e2278f4b..f1bc07df0e9 100644
+index 3efc1b9a9bf..635d07486de 100644
 --- a/gdb/nat/ppc-linux.h
 +++ b/gdb/nat/ppc-linux.h
 @@ -18,7 +18,13 @@
@@ -30,7 +30,7 @@ index b51e2278f4b..f1bc07df0e9 100644
  
  /* This sometimes isn't defined.  */
 diff --git a/gdbserver/linux-ppc-low.cc b/gdbserver/linux-ppc-low.cc
-index bd3ac143660..1c8c0b3a98e 100644
+index 3ce978f4c7c..38534297cdf 100644
 --- a/gdbserver/linux-ppc-low.cc
 +++ b/gdbserver/linux-ppc-low.cc
 @@ -22,7 +22,13 @@
diff --git a/meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-when-using-disable-static.patch b/meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-when-using-disable-static.patch
index 0f7f3878662..024cf34427c 100644
--- a/meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-when-using-disable-static.patch
+++ b/meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-when-using-disable-static.patch
@@ -1,4 +1,4 @@
-From c4102e4fd74804b053c437352ef92c64c8b1fdbf Mon Sep 17 00:00:00 2001
+From 2fa91dec5f0ec5663861ca53bde8951e48557bb3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:25:03 -0700
 Subject: [PATCH] Dont disable libreadline.a when using --disable-static
diff --git a/meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch b/meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch
index 6dee5037daf..556f371fee0 100644
--- a/meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch
+++ b/meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch
@@ -1,4 +1,4 @@
-From 91e294b399c8e3de2cbdd495309f31b6a218516d Mon Sep 17 00:00:00 2001
+From 6d37100388d45185a6e88ea7099a698c2c76b084 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <amccurdy@gmail.com>
 Date: Sat, 30 Apr 2016 15:29:06 -0700
 Subject: [PATCH] use <asm/sgidefs.h>
diff --git a/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch b/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch
index 6d5d3a7e4f9..809cd232aaa 100644
--- a/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch
+++ b/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch
@@ -1,4 +1,4 @@
-From c151a90c6df7a8b31fe0a6c4d6d28aaff55ac25f Mon Sep 17 00:00:00 2001
+From e7cab417080f3454ea984e19384d9f1bf9e48fba Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:35:39 -0700
 Subject: [PATCH] Change order of CFLAGS
@@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/gdbserver/Makefile.in b/gdbserver/Makefile.in
-index 6148ccf9121..3ad15573923 100644
+index 365dcf23650..fc16218334f 100644
 --- a/gdbserver/Makefile.in
 +++ b/gdbserver/Makefile.in
 @@ -174,6 +174,7 @@ INTERNAL_CFLAGS = \
diff --git a/meta/recipes-devtools/gdb/gdb/0006-Fix-invalid-sigprocmask-call.patch b/meta/recipes-devtools/gdb/gdb/0006-Fix-invalid-sigprocmask-call.patch
index a256b8fc682..7c9129b9f57 100644
--- a/meta/recipes-devtools/gdb/gdb/0006-Fix-invalid-sigprocmask-call.patch
+++ b/meta/recipes-devtools/gdb/gdb/0006-Fix-invalid-sigprocmask-call.patch
@@ -1,4 +1,4 @@
-From f63dddf6b986642eeeefa27176d59780e1681ddd Mon Sep 17 00:00:00 2001
+From 13e61d515b74389e61fa52ca43656f9d1c294683 Mon Sep 17 00:00:00 2001
 From: Yousong Zhou <yszhou4tech@gmail.com>
 Date: Fri, 24 Mar 2017 10:36:03 +0800
 Subject: [PATCH] Fix invalid sigprocmask call
diff --git a/meta/recipes-devtools/gdb/gdb/0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch b/meta/recipes-devtools/gdb/gdb/0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
index dcc01e414cc..d8816e3bef2 100644
--- a/meta/recipes-devtools/gdb/gdb/0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
+++ b/meta/recipes-devtools/gdb/gdb/0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
@@ -1,4 +1,4 @@
-From f1b4a90ea61771840fcf4889f616b156b5157843 Mon Sep 17 00:00:00 2001
+From 3d3d91ac1db8ee7f624d225734cb5b57b752e00b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 15 Jan 2023 00:16:25 -0800
 Subject: [PATCH] Define alignof using _Alignof when using C11 or newer
diff --git a/meta/recipes-devtools/gdb/gdb/0008-Add-fix-for-packages-that-are-not-compatible-with-C2.patch b/meta/recipes-devtools/gdb/gdb/0008-Add-fix-for-packages-that-are-not-compatible-with-C2.patch
new file mode 100644
index 00000000000..661eb261c2e
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0008-Add-fix-for-packages-that-are-not-compatible-with-C2.patch
@@ -0,0 +1,29 @@
+From f71cfa9db1a196f0fadb2090ac04ce3164e171d3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 16 Mar 2025 12:48:46 -0700
+Subject: [PATCH] Add fix for packages that are not compatible with C23
+
+Fixes builds with GCC-15
+Sourced from Fedora: https://src.fedoraproject.org/rpms/readline/c/c47eb813afb942128253213ad5b8221770557e48?branch=rawhide
+
+Help getting packages like bluez5 building
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-readline/2025-03/msg00001.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ readline/readline/rlstdc.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/readline/readline/rlstdc.h b/readline/readline/rlstdc.h
+index 2aaa30babfb..a7a0ef30428 100644
+--- a/readline/readline/rlstdc.h
++++ b/readline/readline/rlstdc.h
+@@ -44,7 +44,7 @@
+ 
+ /* Moved from config.h.in because readline.h:rl_message depends on these
+    defines. */
+-#if defined (__STDC__) && defined (HAVE_STDARG_H)
++#if defined (__STDC__)
+ #  define PREFER_STDARG
+ #  define USE_VARARGS
+ #else
diff --git a/meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch b/meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch
new file mode 100644
index 00000000000..206b4baaf05
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch
@@ -0,0 +1,164 @@
+From 8807681557d9f30aac819186369ee62f4f8d1d96 Mon Sep 17 00:00:00 2001
+From: Chet Ramey <chet.ramey@case.edu>
+Date: Mon, 22 Apr 2024 10:41:37 -0400
+Subject: [PATCH] Readline-8.3-alpha release
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/readline.git/commit/tcap.h?h=readline-8.3-testing&id=69e5c5e4c9778bf86c3d1c6b058ddece70854de8]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ...ap-Add-function-parameter-prototypes.patch | 37 ++++++++++
+ ...d=cef614441f99b7b6e444ba601d8465a6e88f5a98 | 67 +++++++++++++++++++
+ readline/readline/tcap.h                      | 14 ++--
+ 3 files changed, 111 insertions(+), 7 deletions(-)
+ create mode 100644 readline/readline/0001-tcap-Add-function-parameter-prototypes.patch
+ create mode 100644 readline/readline/index.html?id=cef614441f99b7b6e444ba601d8465a6e88f5a98
+
+diff --git a/readline/readline/0001-tcap-Add-function-parameter-prototypes.patch b/readline/readline/0001-tcap-Add-function-parameter-prototypes.patch
+new file mode 100644
+index 00000000000..f28e31fd0e0
+--- /dev/null
++++ b/readline/readline/0001-tcap-Add-function-parameter-prototypes.patch
+@@ -0,0 +1,37 @@
++From 0c16af6ebf0bf81138c973e5e6a7c4ebf71f2489 Mon Sep 17 00:00:00 2001
++From: Khem Raj <raj.khem@gmail.com>
++Date: Wed, 30 Apr 2025 10:41:12 -0700
++Subject: [PATCH] tcap: Add function parameter prototypes
++
++GCC-15 with C23 dilect defaults expects full function signature
++
++Signed-off-by: Khem Raj <raj.khem@gmail.com>
++---
++ readline/readline/tcap.h | 14 ++++++--------
++ 1 file changed, 6 insertions(+), 8 deletions(-)
++
++diff --git a/readline/readline/tcap.h b/readline/readline/tcap.h
++index 859e6ee..2b22ff7 100644
++--- a/readline/readline/tcap.h
+++++ b/readline/readline/tcap.h
++@@ -46,14 +46,12 @@ extern char *UP, *BC;
++ 
++ extern short ospeed;
++ 
++-extern int tgetent ();
++-extern int tgetflag ();
++-extern int tgetnum ();
++-extern char *tgetstr ();
++-
++-extern int tputs ();
++-
++-extern char *tgoto ();
+++extern int tgetent(char*, const char*);
+++extern int tgetflag(const char*);
+++extern int tgetnum(const char*);
+++extern char *tgetstr(const char*, char**);
+++extern char *tgoto(const char*, int, int);
+++extern int tputs(const char*, int, int (*)(int));
++ 
++ #endif /* HAVE_TERMCAP_H */
++ 
+diff --git a/readline/readline/index.html?id=cef614441f99b7b6e444ba601d8465a6e88f5a98 b/readline/readline/index.html?id=cef614441f99b7b6e444ba601d8465a6e88f5a98
+new file mode 100644
+index 00000000000..02e665b143b
+--- /dev/null
++++ b/readline/readline/index.html?id=cef614441f99b7b6e444ba601d8465a6e88f5a98
+@@ -0,0 +1,67 @@
++From cef614441f99b7b6e444ba601d8465a6e88f5a98 Mon Sep 17 00:00:00 2001
++From: Chet Ramey <chet.ramey@case.edu>
++Date: Sun, 14 Jan 2024 15:19:37 -0500
++Subject: Readline-8.2 patch 8: add missing function prototypes
++
++---
++ bind.c     | 4 +---
++ patchlevel | 2 +-
++ rltty.c    | 3 +--
++ text.c     | 3 +--
++ 4 files changed, 4 insertions(+), 8 deletions(-)
++
++diff --git a/bind.c b/bind.c
++index 971116a..2596006 100644
++--- a/bind.c
+++++ b/bind.c
++@@ -1167,9 +1167,7 @@ _rl_init_file_error (va_alist)
++ /* **************************************************************** */
++ 
++ static int
++-parse_comparison_op (s, indp)
++-     const char *s;
++-     int *indp;
+++parse_comparison_op (const char *s, int *indp)
++ {
++   int i, peekc, op;
++ 
++diff --git a/patchlevel b/patchlevel
++index e340b58..6c10f12 100644
++--- a/patchlevel
+++++ b/patchlevel
++@@ -1,3 +1,3 @@
++ # Do not edit -- exists only for use by patch
++ 
++-7
+++8
++diff --git a/rltty.c b/rltty.c
++index 882a3d4..a4863ac 100644
++--- a/rltty.c
+++++ b/rltty.c
++@@ -80,8 +80,7 @@ static int ksrflow;
++ /* Dummy call to force a backgrounded readline to stop before it tries
++    to get the tty settings. */
++ static void
++-set_winsize (tty)
++-     int tty;
+++set_winsize (int tty)
++ {
++ #if defined (TIOCGWINSZ)
++   struct winsize w;
++diff --git a/text.c b/text.c
++index 91c3f33..30fdaa1 100644
++--- a/text.c
+++++ b/text.c
++@@ -1764,8 +1764,7 @@ _rl_char_search (int count, int fdir, int bdir)
++ 
++ #if defined (READLINE_CALLBACKS)
++ static int
++-_rl_char_search_callback (data)
++-     _rl_callback_generic_arg *data;
+++_rl_char_search_callback (_rl_callback_generic_arg *data)
++ {
++   _rl_callback_func = 0;
++   _rl_want_redisplay = 1;
++-- 
++cgit v1.1
++
+diff --git a/readline/readline/tcap.h b/readline/readline/tcap.h
+index 859e6eed5aa..467ea60e903 100644
+--- a/readline/readline/tcap.h
++++ b/readline/readline/tcap.h
+@@ -1,6 +1,6 @@
+ /* tcap.h -- termcap library functions and variables. */
+ 
+-/* Copyright (C) 1996-2015 Free Software Foundation, Inc.
++/* Copyright (C) 1996-2015,2023 Free Software Foundation, Inc.
+ 
+    This file is part of the GNU Readline Library (Readline), a library
+    for reading lines of text with interactive input and history editing.      
+@@ -46,14 +46,14 @@ extern char *UP, *BC;
+ 
+ extern short ospeed;
+ 
+-extern int tgetent ();
+-extern int tgetflag ();
+-extern int tgetnum ();
+-extern char *tgetstr ();
++extern int tgetent (char *, const char *);
++extern int tgetflag (const char *);
++extern int tgetnum (const char *);
++extern char *tgetstr (const char *, char **);
+ 
+-extern int tputs ();
++extern int tputs (const char *, int, int (*)(int));
+ 
+-extern char *tgoto ();
++extern char *tgoto (const char *, int, int);
+ 
+ #endif /* HAVE_TERMCAP_H */
+ 
diff --git a/meta/recipes-devtools/gdb/gdb_16.2.bb b/meta/recipes-devtools/gdb/gdb_16.3.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_16.2.bb
rename to meta/recipes-devtools/gdb/gdb_16.3.bb

