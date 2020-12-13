Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.12480.1607819646114829152
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Dec 2020 16:34:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=be5Acijv;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id z12so4254663pjn.1
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Dec 2020 16:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KpG/ZbaDz5zt8In8mf/zubZK5U/+xVlVdfv3PnOP+qA=;
        b=be5Acijvo1EOG/ejux+Z97F5SDdxso7Z2mEcJRN3DgtwfDl59kv4CaVLkLmjl0lWGG
         2KJEB0+Tzp0AJXlGoWK9MLIi1Q+mR9LZsQ+MDBxC3IBAThXoxbMVoUafZBSmiTuFAFlB
         12Jn4EfdiyAINypeo6RtfLL3YLdruF/MrAhhCY4G+RolVS10xGFTPA1reM/MM3yMXOPQ
         UKeXEgF70MJfeNajMFFF7LgM0JS3ufSlcsJWckMF5VsFR0A9OgQ2n024yBIcEg44+rMY
         Z3uxNPs4I5a0PZjccIiubOfZ+c0pm+PSIQJNebr9HAVmHx78ihdvm/39pPPmDkAiDtGI
         h8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KpG/ZbaDz5zt8In8mf/zubZK5U/+xVlVdfv3PnOP+qA=;
        b=rijCDRjHrDceRglSwjZclyu7z12bBQnv/Nd6CIUOwP6pEFkqRGQ8iZbE1kBtnui8P0
         PkPAvUydIbV+nt9JbAIlTovSUaEO5g1KVhCLzviNtgskH9CZg3i4n8tPBDCW7DuvkiAu
         Ox0Wxue3jswk6FnkzyrfEbK7Fx2py1QhGzpDD2vAbKTuGaZiZQA7c4Ye8PA/UVwbaZq+
         8zjHJFYQZ4uWlDYdxLf1TSVZiDZcMMIM9orRUPMmXZZPXYMZwRILb7M0duA2aI0nCfgX
         3QGhyHQZaHCUmgbCGQIypKTz5IQ0hrZh2aGYfE6XJWPGt98mk4YLmRLjcoeP+ouPzJBZ
         ZK+A==
X-Gm-Message-State: AOAM530EWc54DctPeJKW7oJOwa4s9mF1K9xNfvy+jQBcN4YkHZnCiBus
	ojoe1VwgBmOKHsD4ItAllllLpOC9eMCbSQ==
X-Google-Smtp-Source: ABdhPJzwxWSUJuohJotlYx4UWSLI/6Fm6KO9giLIDSQTPXB6ULAeZI+D7SDenbmOgPcMO4xpWaunGw==
X-Received: by 2002:a17:90b:4b0a:: with SMTP id lx10mr18987144pjb.205.1607819644950;
        Sat, 12 Dec 2020 16:34:04 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5bf5])
        by smtp.gmail.com with ESMTPSA id r185sm15632714pfc.53.2020.12.12.16.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Dec 2020 16:34:04 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/2] musl: Update to latest master
Date: Sat, 12 Dec 2020 16:34:01 -0800
Message-Id: <20201213003402.3469450-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh patches to apply to this update

Brings in following fixes

* 1e4204d5 use libc-internal malloc for newlocale/freelocale
* 36246b34 drop use of pthread_once in newlocale
* 37fcc13c lift locale lock out of internal __get_locale
* c53e9b23 fix misleading comment in strstr
* b67d56c7 drop use of pthread_once for aio thread stack size init
* 90ff0169 fix omission of non-stub pthread_mutexattr_getprotocol
* 56f0631d riscv64: fix inconsistent ucontext_t struct tag
* 50c7935c fix failure to preserve r6 in s390x asm; per ABI it is call-saved
* 738c4e94 s390x: derive float_t from compiler or default to float
* 821083ac implement reallocarray
* 29ff7599 implement realpath directly instead of using procfs readlink
* 5d464f52 fix mallocng regression in malloc_usable_size with null argument
* d046ec92 configure: do not use obsolescent form of test -a|o
* c5d118eb fix segfault in lutimes when tv argument is NULL
* 67f77462 netinet/in.h: add IP_RECVERR_4884 from linux v5.9
* d078f836 sys/fanotify.h: add new FAN_* macros from linux v5.9
* 3ba370fe bits/syscall.h: add __NR_close_range from linux v5.9
* badc5bb2 add missing personality values
* 6e989248 arm fabs and sqrt: support single-precision-only fpu variants
* c8c3e341 fix typo in INSTALL
* e2fa720b work around linux bug in readlink syscall with zero buffer size
* c17cda6d parse v3 or future-unknown zoneinfo file versions as v2+
* 585a0a78 explicitly prefer 64-bit/v2 zoneinfo tables
* debbddf7 fix regression in pthread_exit
* 3ab2a4e0 rewrite wcsnrtombs to fix buffer overflow and other bugs
* 233bb697 protect destruction of process-shared mutexes against robust list races
* d26e0774 pthread_exit: don't __vm_wait under thread list lock
* 167390f0 lift child restrictions after multi-threaded fork
* 34952fe5 convert malloc use under libc-internal locks to use internal allocator
* 8d37958d give libc access to its own malloc even if public malloc is interposed
* c1e5d243 drop use of getdelim/stdio in dynamic linker
* cbecda0b dlerror: don't gratuitously hold freebuf_queue lock while freeing
* 4ffa7068 fix vector types in aarch64 register file structures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Refresh patches

 .../musl/0001-crt-Add-.file-directive.patch   | 59 -------------------
 ...ir-and-libdir-as-default-pathes-to-l.patch |  8 +--
 meta/recipes-core/musl/musl_git.bb            |  2 +-
 3 files changed, 5 insertions(+), 64 deletions(-)

diff --git a/meta/recipes-core/musl/musl/0001-crt-Add-.file-directive.patch b/meta/recipes-core/musl/musl/0001-crt-Add-.file-directive.patch
index d2bd587e39..35c8b65740 100644
--- a/meta/recipes-core/musl/musl/0001-crt-Add-.file-directive.patch
+++ b/meta/recipes-core/musl/musl/0001-crt-Add-.file-directive.patch
@@ -43,8 +43,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  crt/x86_64/crtn.s     | 1 +
  28 files changed, 28 insertions(+)
 
-diff --git a/crt/aarch64/crti.s b/crt/aarch64/crti.s
-index 775df0ac..0f7c23a9 100644
 --- a/crt/aarch64/crti.s
 +++ b/crt/aarch64/crti.s
 @@ -1,3 +1,4 @@
@@ -52,8 +50,6 @@ index 775df0ac..0f7c23a9 100644
  .section .init
  .global _init
  .type _init,%function
-diff --git a/crt/aarch64/crtn.s b/crt/aarch64/crtn.s
-index 73cab692..d62fc129 100644
 --- a/crt/aarch64/crtn.s
 +++ b/crt/aarch64/crtn.s
 @@ -1,3 +1,4 @@
@@ -61,8 +57,6 @@ index 73cab692..d62fc129 100644
  .section .init
  	ldp x29,x30,[sp],#16
  	ret
-diff --git a/crt/arm/crti.s b/crt/arm/crti.s
-index 18dc1e41..8df72979 100644
 --- a/crt/arm/crti.s
 +++ b/crt/arm/crti.s
 @@ -1,3 +1,4 @@
@@ -70,8 +64,6 @@ index 18dc1e41..8df72979 100644
  .syntax unified
  
  .section .init
-diff --git a/crt/arm/crtn.s b/crt/arm/crtn.s
-index dc020f92..7451355b 100644
 --- a/crt/arm/crtn.s
 +++ b/crt/arm/crtn.s
 @@ -1,3 +1,4 @@
@@ -79,8 +71,6 @@ index dc020f92..7451355b 100644
  .syntax unified
  
  .section .init
-diff --git a/crt/i386/crti.s b/crt/i386/crti.s
-index d2682a20..2823fc3b 100644
 --- a/crt/i386/crti.s
 +++ b/crt/i386/crti.s
 @@ -1,3 +1,4 @@
@@ -88,8 +78,6 @@ index d2682a20..2823fc3b 100644
  .section .init
  .global _init
  _init:
-diff --git a/crt/i386/crtn.s b/crt/i386/crtn.s
-index f3b61e01..04fb1646 100644
 --- a/crt/i386/crtn.s
 +++ b/crt/i386/crtn.s
 @@ -1,3 +1,4 @@
@@ -97,8 +85,6 @@ index f3b61e01..04fb1646 100644
  .section .init
  	add $12,%esp
  	ret
-diff --git a/crt/microblaze/crti.s b/crt/microblaze/crti.s
-index ed1c2fa4..29ee4733 100644
 --- a/crt/microblaze/crti.s
 +++ b/crt/microblaze/crti.s
 @@ -1,3 +1,4 @@
@@ -106,8 +92,6 @@ index ed1c2fa4..29ee4733 100644
  .section .init
  .global _init
  .align 2
-diff --git a/crt/microblaze/crtn.s b/crt/microblaze/crtn.s
-index 1e02c984..c2083749 100644
 --- a/crt/microblaze/crtn.s
 +++ b/crt/microblaze/crtn.s
 @@ -1,3 +1,4 @@
@@ -115,8 +99,6 @@ index 1e02c984..c2083749 100644
  .section .init
  	lwi r15, r1, 0
  	rtsd r15, 8
-diff --git a/crt/mips/crti.s b/crt/mips/crti.s
-index 39dee380..0211764e 100644
 --- a/crt/mips/crti.s
 +++ b/crt/mips/crti.s
 @@ -1,3 +1,4 @@
@@ -124,8 +106,6 @@ index 39dee380..0211764e 100644
  .set noreorder
  
  .section .init
-diff --git a/crt/mips/crtn.s b/crt/mips/crtn.s
-index 506a04b7..606490cf 100644
 --- a/crt/mips/crtn.s
 +++ b/crt/mips/crtn.s
 @@ -1,3 +1,4 @@
@@ -133,8 +113,6 @@ index 506a04b7..606490cf 100644
  .set noreorder
  
  .section .init
-diff --git a/crt/mips64/crti.s b/crt/mips64/crti.s
-index c962dd09..f2c19cdd 100644
 --- a/crt/mips64/crti.s
 +++ b/crt/mips64/crti.s
 @@ -1,3 +1,4 @@
@@ -142,8 +120,6 @@ index c962dd09..f2c19cdd 100644
  .set noreorder
  
  .section .init
-diff --git a/crt/mips64/crtn.s b/crt/mips64/crtn.s
-index f3930b24..68903ffa 100644
 --- a/crt/mips64/crtn.s
 +++ b/crt/mips64/crtn.s
 @@ -1,3 +1,4 @@
@@ -151,8 +127,6 @@ index f3930b24..68903ffa 100644
  .set noreorder
  
  .section .init
-diff --git a/crt/mipsn32/crti.s b/crt/mipsn32/crti.s
-index 14fa28d9..a35387d3 100644
 --- a/crt/mipsn32/crti.s
 +++ b/crt/mipsn32/crti.s
 @@ -1,3 +1,4 @@
@@ -160,8 +134,6 @@ index 14fa28d9..a35387d3 100644
  .set	noreorder
  .section	.init
  .global	_init
-diff --git a/crt/mipsn32/crtn.s b/crt/mipsn32/crtn.s
-index dccd7e89..bdb6e561 100644
 --- a/crt/mipsn32/crtn.s
 +++ b/crt/mipsn32/crtn.s
 @@ -1,3 +1,4 @@
@@ -169,8 +141,6 @@ index dccd7e89..bdb6e561 100644
  .set	noreorder
  .section	.init
  	ld	$gp, 16($sp)
-diff --git a/crt/or1k/crti.s b/crt/or1k/crti.s
-index 7e741459..919369ca 100644
 --- a/crt/or1k/crti.s
 +++ b/crt/or1k/crti.s
 @@ -1,3 +1,4 @@
@@ -178,8 +148,6 @@ index 7e741459..919369ca 100644
  .section .init
  .global _init
  _init:
-diff --git a/crt/or1k/crtn.s b/crt/or1k/crtn.s
-index 4185a027..d670b327 100644
 --- a/crt/or1k/crtn.s
 +++ b/crt/or1k/crtn.s
 @@ -1,3 +1,4 @@
@@ -187,8 +155,6 @@ index 4185a027..d670b327 100644
  .section .init
  	l.lwz	r9,0(r1)
  	l.jr	r9
-diff --git a/crt/powerpc/crti.s b/crt/powerpc/crti.s
-index 60461ca4..b748ca48 100644
 --- a/crt/powerpc/crti.s
 +++ b/crt/powerpc/crti.s
 @@ -1,3 +1,4 @@
@@ -196,8 +162,6 @@ index 60461ca4..b748ca48 100644
  .section .init
  .align 2
  .global _init
-diff --git a/crt/powerpc/crtn.s b/crt/powerpc/crtn.s
-index 2d14a6f0..d989e36f 100644
 --- a/crt/powerpc/crtn.s
 +++ b/crt/powerpc/crtn.s
 @@ -1,3 +1,4 @@
@@ -205,8 +169,6 @@ index 2d14a6f0..d989e36f 100644
  .section .init
  .align 2
  	lwz 0,36(1)
-diff --git a/crt/powerpc64/crti.s b/crt/powerpc64/crti.s
-index 9f712f0e..d3323a67 100644
 --- a/crt/powerpc64/crti.s
 +++ b/crt/powerpc64/crti.s
 @@ -1,3 +1,4 @@
@@ -214,8 +176,6 @@ index 9f712f0e..d3323a67 100644
  .section .init
  .align 2
  .global _init
-diff --git a/crt/powerpc64/crtn.s b/crt/powerpc64/crtn.s
-index a7a9f4a0..5e71ae66 100644
 --- a/crt/powerpc64/crtn.s
 +++ b/crt/powerpc64/crtn.s
 @@ -1,3 +1,4 @@
@@ -223,8 +183,6 @@ index a7a9f4a0..5e71ae66 100644
  .section .init
  .align 2
  	addi 1, 1, 32
-diff --git a/crt/s390x/crti.s b/crt/s390x/crti.s
-index f453205b..3da3c5e1 100644
 --- a/crt/s390x/crti.s
 +++ b/crt/s390x/crti.s
 @@ -1,3 +1,4 @@
@@ -232,8 +190,6 @@ index f453205b..3da3c5e1 100644
  .section .init
  .align 2
  .global _init
-diff --git a/crt/s390x/crtn.s b/crt/s390x/crtn.s
-index 06066dc9..bfd55caf 100644
 --- a/crt/s390x/crtn.s
 +++ b/crt/s390x/crtn.s
 @@ -1,3 +1,4 @@
@@ -241,8 +197,6 @@ index 06066dc9..bfd55caf 100644
  .section .init
  .align 2
  	lmg  %r14, %r15, 272(%r15)
-diff --git a/crt/sh/crti.s b/crt/sh/crti.s
-index d99bfd5c..77d61c51 100644
 --- a/crt/sh/crti.s
 +++ b/crt/sh/crti.s
 @@ -1,3 +1,4 @@
@@ -250,8 +204,6 @@ index d99bfd5c..77d61c51 100644
  .section .init
  .global  _init
  .type    _init, @function
-diff --git a/crt/sh/crtn.s b/crt/sh/crtn.s
-index 958ce951..29deb5be 100644
 --- a/crt/sh/crtn.s
 +++ b/crt/sh/crtn.s
 @@ -1,3 +1,4 @@
@@ -259,8 +211,6 @@ index 958ce951..29deb5be 100644
  .section .init
  	lds.l @r15+, pr
  	mov.l @r15+, r14
-diff --git a/crt/x32/crti.s b/crt/x32/crti.s
-index 4788968b..8668b7c7 100644
 --- a/crt/x32/crti.s
 +++ b/crt/x32/crti.s
 @@ -1,3 +1,4 @@
@@ -268,8 +218,6 @@ index 4788968b..8668b7c7 100644
  .section .init
  .global _init
  _init:
-diff --git a/crt/x32/crtn.s b/crt/x32/crtn.s
-index 29198b77..ef73d295 100644
 --- a/crt/x32/crtn.s
 +++ b/crt/x32/crtn.s
 @@ -1,3 +1,4 @@
@@ -277,8 +225,6 @@ index 29198b77..ef73d295 100644
  .section .init
  	pop %rax
  	ret
-diff --git a/crt/x86_64/crti.s b/crt/x86_64/crti.s
-index 4788968b..8668b7c7 100644
 --- a/crt/x86_64/crti.s
 +++ b/crt/x86_64/crti.s
 @@ -1,3 +1,4 @@
@@ -286,8 +232,6 @@ index 4788968b..8668b7c7 100644
  .section .init
  .global _init
  _init:
-diff --git a/crt/x86_64/crtn.s b/crt/x86_64/crtn.s
-index 29198b77..ef73d295 100644
 --- a/crt/x86_64/crtn.s
 +++ b/crt/x86_64/crtn.s
 @@ -1,3 +1,4 @@
@@ -295,6 +239,3 @@ index 29198b77..ef73d295 100644
  .section .init
  	pop %rax
  	ret
--- 
-2.29.1
-
diff --git a/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch b/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch
index f57aae5f3c..0aeb5eb5c2 100644
--- a/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch
+++ b/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch
@@ -34,16 +34,16 @@ Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
  LDFLAGS_ALL = $(LDFLAGS_AUTO) $(LDFLAGS)
 --- a/ldso/dynlink.c
 +++ b/ldso/dynlink.c
-@@ -24,6 +24,8 @@
- #include "libc.h"
- #include "dynlink.h"
+@@ -29,6 +29,8 @@
+ #define realloc __libc_realloc
+ #define free __libc_free
  
 +#define SYS_PATH_DFLT SYSLIBDIR ":" LIBDIR
 +
  static void error(const char *, ...);
  
  #define MAXP2(a,b) (-(-(a)&-(b)))
-@@ -1071,7 +1073,7 @@ static struct dso *load_library(const ch
+@@ -1094,7 +1096,7 @@ static struct dso *load_library(const ch
  					sys_path = "";
  				}
  			}
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 23c2072ea3..d4e75f9185 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "d91a6cf6e369a79587c5665fce9635e5634ca201"
+SRCREV = "1e4204d522670a1d8b8ab85f1cfefa960547e8af"
 
 BASEVER = "1.2.1"
 
-- 
2.29.2

