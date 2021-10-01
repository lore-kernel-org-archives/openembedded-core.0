Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CEB4C433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 04:54:33 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.3862.1633064072032450545
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 21:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n/YpU6IF;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id bb10so5542052plb.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 21:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CU8No6/uk00ufEp83eMF10XsKctxbHknzPe7VXvNQz4=;
        b=n/YpU6IFJA+hV2UVZx3oQxuWiD6ipas1tO9JiwSQzsGY2wNpj53fOpTEOM3d1vidoj
         DKlJsDMVVprlBRqaMHvRauIuzYhpF1pszZscsXsn87Br81It+L7SFieqZ/QDgmQHcevI
         ML15lByWE4S4o5aLOKvMP/YG3aUsR9eciT6s6QjAjbD/b1dMqtuQBD6+SWCai8J9q591
         6Kf5lrKzaVWhCH9wv0E6HQrOkNhqenODiFUhRWsWVDEtMjxpIhiOI3nj50yLInXpmpZJ
         d2BI3Ozz//HLOrd294S/wZfDytY9TxWBqucK8FOZAGCH4xzS/V8QtlegNutR+aE8WxcZ
         uKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CU8No6/uk00ufEp83eMF10XsKctxbHknzPe7VXvNQz4=;
        b=LyR86XP5cqy1B1R2yaCu5JGB0OY6edd/rXAVK+EsS6Rv1PE751bkPwZCBD5Dd4lbQY
         Ze2YFAvjAENPCqwYZn2/RgSXmT1EyVhvbb1gHAAheFanr6pO7GbzBYH5T5FpUhVpllv6
         eKGOHWpeunP2JJshB+ZILOM1+c7sTOAzUKhaSx12U2klq5IdPsrMN6r4dzeQCPKgJBxw
         6FO3XCYK2qwW6rFr+EZD7fK3DJX52/158bNwgeyAXQ8nV7xaYH9R7rtQN3WzmQ5yaAu9
         THlsFfN/KA8djxcoQCPHZhn7Pva1TVwXIfVDuwwB/MAcAmdHuDEV3/Nq9/E5TsiO+fPu
         zpxA==
X-Gm-Message-State: AOAM5304Qwq3Qo3Kngp0koaKmBeYgzssoZ2WDuPb7GsbTsEey5DAouw2
	1SGJ2q2CieanUq0rrhc4D3G5CZuiDdLK0Q==
X-Google-Smtp-Source: 
 ABdhPJymvexA5UnDqtsTno9cci9fievETCx0ClIv75QM9Vowrm83vBxDbTWm4w5gABNL+y4Sz0MBPg==
X-Received: by 2002:a17:90a:6289:: with SMTP id
 d9mr17606366pjj.110.1633064070663;
        Thu, 30 Sep 2021 21:54:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id
 z8sm4590389pgc.53.2021.09.30.21.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 21:54:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] libseccomp: Upgrade to 2.5.2 and beyond
Date: Thu, 30 Sep 2021 21:54:27 -0700
Message-Id: <20211001045427.4024117-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Oct 2021 04:54:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156511

Forward port the rv32 port

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Regerate syscalls.csv with latest 5.15-rc3 kernel
    Fix RV64 regression

 ...rch-Add-riscv32-architecture-support.patch | 162 +++++++++---------
 .../0002-man-Add-RISCV64-to-arch-list.patch   |  28 +++
 ...he-syscall-defs-for-Linux-v5.15.0-r.patch} |  60 +++----
 .../0004-syscalls-Add-quotactl_path.patch     |  40 +++++
 ...ibseccomp_2.5.1.bb => libseccomp_2.5.2.bb} |   6 +-
 5 files changed, 172 insertions(+), 124 deletions(-)
 create mode 100644 meta/recipes-support/libseccomp/files/0002-man-Add-RISCV64-to-arch-list.patch
 rename meta/recipes-support/libseccomp/files/{0002-Regenerate-syscall-cvs-file-from-5.13-rc5-kernel.patch => 0003-syscalls-update-the-syscall-defs-for-Linux-v5.15.0-r.patch} (98%)
 create mode 100644 meta/recipes-support/libseccomp/files/0004-syscalls-Add-quotactl_path.patch
 rename meta/recipes-support/libseccomp/{libseccomp_2.5.1.bb => libseccomp_2.5.2.bb} (87%)

diff --git a/meta/recipes-support/libseccomp/files/0001-arch-Add-riscv32-architecture-support.patch b/meta/recipes-support/libseccomp/files/0001-arch-Add-riscv32-architecture-support.patch
index 62bd61fb56..2fd22b1aa2 100644
--- a/meta/recipes-support/libseccomp/files/0001-arch-Add-riscv32-architecture-support.patch
+++ b/meta/recipes-support/libseccomp/files/0001-arch-Add-riscv32-architecture-support.patch
@@ -1,18 +1,18 @@
-From 6d127a0463ea2d7bb5021562678324e28e0407e5 Mon Sep 17 00:00:00 2001
+From e99b00a78acaf80236cba8b3fabaebdb3ef1987b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 8 Jun 2021 19:45:34 -0700
-Subject: [PATCH 1/2] arch: Add riscv32 architecture support
+Subject: [PATCH 1/4] arch: Add riscv32 architecture support
 
 Support for rv32 was upstreamed into 5.4+ kernel
-
 Upstream-Status: Submitted [https://github.com/seccomp/libseccomp/pull/327]
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  CREDITS                            |  1 +
  README.md                          |  1 +
  doc/man/man1/scmp_sys_resolver.1   |  2 +-
  doc/man/man3/seccomp_arch_add.3    |  1 +
- include/seccomp-syscalls.h         | 31 ++++++++++++++++++
+ include/seccomp-syscalls.h         | 32 +++++++++++++++++++
  include/seccomp.h.in               |  9 ++++++
  src/Makefile.am                    |  1 +
  src/arch-riscv32.c                 | 31 ++++++++++++++++++
@@ -24,7 +24,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/python/libseccomp.pxd          |  1 +
  src/python/seccomp.pyx             |  2 ++
  src/syscalls.c                     |  1 +
- src/syscalls.csv                   |  2 +-
  src/syscalls.h                     |  2 ++
  src/system.c                       |  1 +
  tests/15-basic-resolver.c          |  1 +
@@ -40,12 +39,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  tools/scmp_bpf_sim.c               |  2 ++
  tools/util.c                       |  6 +++-
  tools/util.h                       |  7 ++++
- 32 files changed, 208 insertions(+), 7 deletions(-)
+ 31 files changed, 208 insertions(+), 6 deletions(-)
  create mode 100644 src/arch-riscv32.c
  create mode 100644 src/arch-riscv32.h
 
 diff --git a/CREDITS b/CREDITS
-index d6bbc2a..ad2f7e0 100644
+index b685712..c1ffdb3 100644
 --- a/CREDITS
 +++ b/CREDITS
 @@ -33,6 +33,7 @@ John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
@@ -55,9 +54,9 @@ index d6bbc2a..ad2f7e0 100644
 +Khem Raj <raj.khem@gmail.com>
  Kyle R. Conway <kyle.r.conway@gmail.com>
  Kenta Tada <Kenta.Tada@sony.com>
- Luca Bruno <lucab@debian.org>
+ Kir Kolyshkin <kolyshkin@gmail.com>
 diff --git a/README.md b/README.md
-index ba02186..2cd718f 100644
+index 579f226..8199a71 100644
 --- a/README.md
 +++ b/README.md
 @@ -54,6 +54,7 @@ The libseccomp library currently supports the architectures listed below:
@@ -67,7 +66,7 @@ index ba02186..2cd718f 100644
 +* 32-bit RISC-V (riscv32)
  * 32-bit SuperH big endian (sheb)
  * 32-bit SuperH (sh)
-
+ 
 diff --git a/doc/man/man1/scmp_sys_resolver.1 b/doc/man/man1/scmp_sys_resolver.1
 index 267187b..fc68d18 100644
 --- a/doc/man/man1/scmp_sys_resolver.1
@@ -94,93 +93,94 @@ index 7baa21e..8966b3a 100644
  .sp
  .BI "uint32_t seccomp_arch_resolve_name(const char *" arch_name ");"
 diff --git a/include/seccomp-syscalls.h b/include/seccomp-syscalls.h
-index c694db1..c6ea5ca 100644
+index 476f953..4ff814c 100644
 --- a/include/seccomp-syscalls.h
 +++ b/include/seccomp-syscalls.h
-@@ -275,6 +275,13 @@
- #define __PNR_ppoll				-10241
+@@ -276,6 +276,14 @@
  #define __PNR_renameat				-10242
  #define __PNR_riscv_flush_icache		-10243
-+#define __PNR_fstat				-10244
-+#define __PNR_futex				-10245
-+#define __PNR_nanosleep				-10246
-+#define __PNR_lseek				-10247
-+#define __PNR_clock_gettime			-10248
-+#define __PNR_clock_nanosleep			-10249
-+#define __PNR_gettimeofday			-10250
-
+ #define __PNR_memfd_secret			-10244
++#define __PNR_fstat				-10245
++#define __PNR_futex				-10246
++#define __PNR_nanosleep				-10247
++#define __PNR_lseek				-10248
++#define __PNR_clock_gettime			-10249
++#define __PNR_clock_nanosleep			-10250
++#define __PNR_gettimeofday			-10251
++#define __PNR_fcntl				-10252
+ 
  /*
   * libseccomp syscall definitions
-@@ -442,7 +449,11 @@
+@@ -443,7 +451,11 @@
  #define __SNR_clock_getres_time64	__PNR_clock_getres_time64
  #endif
-
+ 
 +#ifdef __NR_clock_gettime
  #define __SNR_clock_gettime		__NR_clock_gettime
 +#else
 +#define __SNR_clock_gettime		__PNR_clock_gettime
 +#endif
-
+ 
  #ifdef __NR_clock_gettime64
  #define __SNR_clock_gettime64		__NR_clock_gettime64
-@@ -450,7 +461,11 @@
+@@ -451,7 +463,11 @@
  #define __SNR_clock_gettime64		__PNR_clock_gettime64
  #endif
-
+ 
 +#ifdef __NR_clock_nanosleep
  #define __SNR_clock_nanosleep		__NR_clock_nanosleep
 +#else
 +#define __SNR_clock_nanosleep		__PNR_clock_nanosleep
 +#endif
-
+ 
  #ifdef __NR_clock_nanosleep_time64
  #define __SNR_clock_nanosleep_time64	__NR_clock_nanosleep_time64
-@@ -710,7 +725,11 @@
+@@ -713,7 +729,11 @@
  #define __SNR_ftruncate64		__PNR_ftruncate64
  #endif
-
+ 
 +#ifdef __NR_futex
  #define __SNR_futex			__NR_futex
 +#else
 +#define __SNR_futex			__PNR_futex
 +#endif
-
+ 
  #ifdef __NR_futex_time64
  #define __SNR_futex_time64		__NR_futex_time64
-@@ -896,7 +915,11 @@
-
+@@ -899,7 +919,11 @@
+ 
  #define __SNR_gettid			__NR_gettid
-
+ 
 +#ifdef __NR_gettimeofday
  #define __SNR_gettimeofday		__NR_gettimeofday
 +#else
 +#define __SNR_gettimeofday		__PNR_gettimeofday
 +#endif
-
+ 
  #ifdef __NR_getuid
  #define __SNR_getuid			__NR_getuid
-@@ -1046,7 +1069,11 @@
-
+@@ -1049,7 +1073,11 @@
+ 
  #define __SNR_lremovexattr		__NR_lremovexattr
-
+ 
 +#ifdef __NR_lseek
  #define __SNR_lseek			__NR_lseek
 +#else
 +#define __SNR_lseek			__PNR_lseek
 +#endif
-
+ 
  #define __SNR_lsetxattr			__NR_lsetxattr
-
-@@ -1218,7 +1245,11 @@
-
+ 
+@@ -1227,7 +1255,11 @@
+ 
  #define __SNR_name_to_handle_at			__NR_name_to_handle_at
-
+ 
 +#ifdef __NR_nanosleep
  #define __SNR_nanosleep			__NR_nanosleep
 +#else
 +#define __SNR_nanosleep			__PNR_nanosleep
 +#endif
-
+ 
  #ifdef __NR_newfstatat
  #define __SNR_newfstatat		__NR_newfstatat
 diff --git a/include/seccomp.h.in b/include/seccomp.h.in
@@ -201,14 +201,14 @@ index 333a89c..2e911db 100644
 +
  #define SCMP_ARCH_RISCV64	AUDIT_ARCH_RISCV64
 +#define SCMP_ARCH_RISCV32	AUDIT_ARCH_RISCV32
-
+ 
  /**
   * The SuperH architecture tokens
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 7b59810..7961925 100644
+index 04e7ba5..a30bbc0 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -44,6 +44,7 @@ SOURCES_ALL = \
+@@ -40,6 +40,7 @@ SOURCES_ALL = \
  	arch-ppc.h arch-ppc.c \
  	arch-ppc64.h arch-ppc64.c \
  	arch-riscv64.h arch-riscv64.c \
@@ -218,7 +218,7 @@ index 7b59810..7961925 100644
  	arch-sh.h arch-sh.c \
 diff --git a/src/arch-riscv32.c b/src/arch-riscv32.c
 new file mode 100644
-index 0000000..53b3126
+index 0000000..10418f4
 --- /dev/null
 +++ b/src/arch-riscv32.c
 @@ -0,0 +1,31 @@
@@ -248,8 +248,8 @@ index 0000000..53b3126
 +	.token_bpf = AUDIT_ARCH_RISCV32,
 +	.size = ARCH_SIZE_32,
 +	.endian = ARCH_ENDIAN_LITTLE,
-+	.syscall_resolve_name = riscv32_syscall_resolve_name,
-+	.syscall_resolve_num = riscv32_syscall_resolve_num,
++	.syscall_resolve_name_raw = riscv32_syscall_resolve_name,
++	.syscall_resolve_num_raw = riscv32_syscall_resolve_num,
 +	.syscall_rewrite = NULL,
 +	.rule_add = NULL,
 +};
@@ -310,7 +310,7 @@ index 68bebef..85c7f3d 100755
 @@ -519,6 +519,49 @@ function dump_lib_riscv64() {
  	dump_lib_arch riscv64 | mangle_lib_syscall riscv64
  }
-
+ 
 +#
 +# Dump the riscv32 system syscall table
 +#
@@ -385,9 +385,9 @@ index 68bebef..85c7f3d 100755
 +	abi_list+=" riscv32 riscv64"
  	abi_list+=" s390 s390x"
  	abi_list+=" sh"
-
+ 
 diff --git a/src/arch.c b/src/arch.c
-index 6ab922f..acf80af 100644
+index 921e455..07935a9 100644
 --- a/src/arch.c
 +++ b/src/arch.c
 @@ -43,6 +43,7 @@
@@ -453,10 +453,10 @@ index 0629bf1..000d503 100644
          SCMP_ARCH_S390X
 +        SCMP_ARCH_RISCV32
          SCMP_ARCH_RISCV64
-
+ 
      cdef enum scmp_filter_attr:
 diff --git a/src/python/seccomp.pyx b/src/python/seccomp.pyx
-index 1a9eb24..c94ad1d 100644
+index 2eeabc1..2895d78 100644
 --- a/src/python/seccomp.pyx
 +++ b/src/python/seccomp.pyx
 @@ -214,6 +214,7 @@ cdef class Arch:
@@ -466,36 +466,29 @@ index 1a9eb24..c94ad1d 100644
 +    RISCV32 - 32-bit RISC-V
      RISCV64 - 64-bit RISC-V
      """
-
+ 
 @@ -238,6 +239,7 @@ cdef class Arch:
      PPC64LE = libseccomp.SCMP_ARCH_PPC64LE
      S390 = libseccomp.SCMP_ARCH_S390
      S390X = libseccomp.SCMP_ARCH_S390X
 +    RISCV32 = libseccomp.SCMP_ARCH_RISCV32
      RISCV64 = libseccomp.SCMP_ARCH_RISCV64
-
+ 
      def __cinit__(self, arch=libseccomp.SCMP_ARCH_NATIVE):
 diff --git a/src/syscalls.c b/src/syscalls.c
-index ddb84fa..34e08d9 100644
+index faddff0..15952ce 100644
 --- a/src/syscalls.c
 +++ b/src/syscalls.c
-@@ -55,3 +55,4 @@ ARCH_DEF(sh)
+@@ -59,6 +59,7 @@ ARCH_DEF(sh)
  ARCH_DEF(x32)
  ARCH_DEF(x86)
  ARCH_DEF(riscv64)
 +ARCH_DEF(riscv32)
-diff --git a/src/syscalls.csv b/src/syscalls.csv
-index fbd1058..0ee6c15 100644
---- a/src/syscalls.csv
-+++ b/src/syscalls.csv
-@@ -1,4 +1,4 @@
--#syscall (v5.12.0-rc7 2021-04-17),x86,x86_64,x32,arm,aarch64,mips,mips64,mips64n32,parisc,parisc64,ppc,ppc64,riscv64,s390,s390x,sh
-+#syscall (v5.12.0-rc7 2021-04-17),x86,x86_64,x32,arm,aarch64,mips,mips64,mips64n32,parisc,parisc64,ppc,ppc64,riscv32,riscv64,s390,s390x,sh
- accept,PNR,43,43,285,202,168,42,42,35,35,330,330,202,PNR,PNR,344
- accept4,364,288,288,366,242,334,293,297,320,320,344,344,242,364,364,358
- access,33,21,21,33,PNR,33,20,20,33,33,33,33,PNR,33,33,33
+ 
+ /**
+  * Resolve a syscall name to a number
 diff --git a/src/syscalls.h b/src/syscalls.h
-index 4f959af..49887ba 100644
+index 58a788c..c6b5db5 100644
 --- a/src/syscalls.h
 +++ b/src/syscalls.h
 @@ -28,6 +28,7 @@
@@ -503,7 +496,7 @@ index 4f959af..49887ba 100644
  #include "arch-x86.h"
  #include "arch-riscv64.h"
 +#include "arch-riscv32.h"
-
+ 
  /* NOTE: changes to the arch_syscall_table layout may require changes to the
   *       generate_syscalls_perf.sh and arch-syscall-validate scripts */
 @@ -49,6 +50,7 @@ struct arch_syscall_table {
@@ -527,7 +520,7 @@ index ae445bf..063e6be 100644
  		break;
  	default:
 diff --git a/tests/15-basic-resolver.c b/tests/15-basic-resolver.c
-index 2679270..57092f3 100644
+index c759dd1..fd94dbf 100644
 --- a/tests/15-basic-resolver.c
 +++ b/tests/15-basic-resolver.c
 @@ -45,6 +45,7 @@ unsigned int arch_list[] = {
@@ -536,8 +529,8 @@ index 2679270..57092f3 100644
  	SCMP_ARCH_PARISC64,
 +	SCMP_ARCH_RISCV32,
  	SCMP_ARCH_RISCV64,
+ 	SCMP_ARCH_SH,
  	-1
- };
 diff --git a/tests/16-sim-arch_basic.c b/tests/16-sim-arch_basic.c
 index 4fcbb5c..662e081 100644
 --- a/tests/16-sim-arch_basic.c
@@ -587,7 +580,7 @@ index 08f030c..ec73224 100644
 +	rc = seccomp_arch_add(ctx, seccomp_arch_resolve_name("riscv32"));
  	if (rc != 0)
  		goto out;
-
+ 
 diff --git a/tests/23-sim-arch_all_le_basic.py b/tests/23-sim-arch_all_le_basic.py
 index 12bb243..1eebc20 100755
 --- a/tests/23-sim-arch_all_le_basic.py
@@ -622,10 +615,10 @@ index 77a5b89..2e860bf 100755
               "ppc64le",
 +             "riscv32",
               "riscv64"]
-
+ 
  def test_arch(arch, init):
 diff --git a/tests/regression b/tests/regression
-index 53dab75..2869629 100755
+index d28b848..057ff67 100755
 --- a/tests/regression
 +++ b/tests/regression
 @@ -26,7 +26,7 @@ GLBL_ARCH_LE_SUPPORT=" \
@@ -644,9 +637,9 @@ index 53dab75..2869629 100755
 +	riscv32 \
  	s390 \
  	sheb sh"
-
-@@ -785,7 +786,7 @@ function run_test_live() {
-
+ 
+@@ -801,7 +802,7 @@ function run_test_live() {
+ 
  	# setup the arch specific return values
  	case "$arch" in
 -	x86|x86_64|x32|arm|aarch64|parisc|parisc64|ppc|ppc64|ppc64le|ppc|s390|s390x|riscv64|sh|sheb)
@@ -669,10 +662,10 @@ index b6bd2bb..7789970 100644
  			printf("unknown\n");
  		}
 diff --git a/tools/scmp_bpf_disasm.c b/tools/scmp_bpf_disasm.c
-index b95cdeb..49a89c7 100644
+index b682de7..4f759fc 100644
 --- a/tools/scmp_bpf_disasm.c
 +++ b/tools/scmp_bpf_disasm.c
-@@ -510,6 +510,8 @@ int main(int argc, char *argv[])
+@@ -508,6 +508,8 @@ int main(int argc, char *argv[])
  				arch = AUDIT_ARCH_S390X;
  			else if (strcmp(optarg, "riscv64") == 0)
  				arch = AUDIT_ARCH_RISCV64;
@@ -719,7 +712,7 @@ index 6c2ca33..4d16e38 100644
 @@ -79,6 +79,13 @@
  #define AUDIT_ARCH_RISCV64	(EM_RISCV|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
  #endif /* AUDIT_ARCH_RISCV64 */
-
+ 
 +#ifndef AUDIT_ARCH_RISCV32
 +#ifndef EM_RISCV
 +#define EM_RISCV		243
@@ -728,7 +721,8 @@ index 6c2ca33..4d16e38 100644
 +#endif /* AUDIT_ARCH_RISCV32 */
 +
  extern uint32_t arch;
-
+ 
  uint16_t ttoh16(uint32_t arch, uint16_t val);
---
-2.32.0
+-- 
+2.33.0
+
diff --git a/meta/recipes-support/libseccomp/files/0002-man-Add-RISCV64-to-arch-list.patch b/meta/recipes-support/libseccomp/files/0002-man-Add-RISCV64-to-arch-list.patch
new file mode 100644
index 0000000000..511d4576fc
--- /dev/null
+++ b/meta/recipes-support/libseccomp/files/0002-man-Add-RISCV64-to-arch-list.patch
@@ -0,0 +1,28 @@
+From e016ce3949caf34ee0f8fc6d976c52eb2fb019ce Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 28 Jul 2021 11:03:24 -0700
+Subject: [PATCH 2/4] man: Add RISCV64 to arch list
+
+Upstream-Status: Submitted [https://github.com/seccomp/libseccomp/pull/327]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ doc/man/man1/scmp_sys_resolver.1 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/doc/man/man1/scmp_sys_resolver.1 b/doc/man/man1/scmp_sys_resolver.1
+index fc68d18..74d8a8a 100644
+--- a/doc/man/man1/scmp_sys_resolver.1
++++ b/doc/man/man1/scmp_sys_resolver.1
+@@ -36,7 +36,7 @@ The architecture to use for resolving the system call.  Valid
+ .I ARCH
+ values are "x86", "x86_64", "x32", "arm", "aarch64", "mips", "mipsel", "mips64",
+ "mipsel64", "mips64n32", "mipsel64n32", "parisc", "parisc64", "ppc", "ppc64",
+-"ppc64le", "riscv32", "s390", "s390x", "sheb" and "sh".
++"ppc64le", "riscv64", "riscv32", "s390", "s390x", "sheb" and "sh".
+ .TP
+ .B \-t
+ If necessary, translate the system call name to the proper system call number,
+-- 
+2.33.0
+
diff --git a/meta/recipes-support/libseccomp/files/0002-Regenerate-syscall-cvs-file-from-5.13-rc5-kernel.patch b/meta/recipes-support/libseccomp/files/0003-syscalls-update-the-syscall-defs-for-Linux-v5.15.0-r.patch
similarity index 98%
rename from meta/recipes-support/libseccomp/files/0002-Regenerate-syscall-cvs-file-from-5.13-rc5-kernel.patch
rename to meta/recipes-support/libseccomp/files/0003-syscalls-update-the-syscall-defs-for-Linux-v5.15.0-r.patch
index 7ca861a7b2..150d9bd3a7 100644
--- a/meta/recipes-support/libseccomp/files/0002-Regenerate-syscall-cvs-file-from-5.13-rc5-kernel.patch
+++ b/meta/recipes-support/libseccomp/files/0003-syscalls-update-the-syscall-defs-for-Linux-v5.15.0-r.patch
@@ -1,46 +1,22 @@
-From ee4aba3f59b4bf52a74cb3917e64c704250de8ef Mon Sep 17 00:00:00 2001
+From 54d8136679f4a1238397f7b7a8b3e8cf4626f018 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 8 Jun 2021 20:42:19 -0700
-Subject: [PATCH 2/2] Regenerate syscall cvs file from 5.13-rc5 kernel
+Date: Thu, 30 Sep 2021 21:35:15 -0700
+Subject: [PATCH 3/4] syscalls: update the syscall defs for Linux v5.15.0-rc3
 
+Include RISCV32 arch as well
 Upstream-Status: Submitted [https://github.com/seccomp/libseccomp/pull/327]
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- include/seccomp-syscalls.h |   7 +
- src/syscalls.csv           | 952 +++++++++++++++++++------------------
- 2 files changed, 485 insertions(+), 474 deletions(-)
-
-diff --git a/include/seccomp-syscalls.h b/include/seccomp-syscalls.h
-index c6ea5ca..b7651bf 100644
---- a/include/seccomp-syscalls.h
-+++ b/include/seccomp-syscalls.h
-@@ -282,6 +282,7 @@
- #define __PNR_clock_gettime			-10248
- #define __PNR_clock_nanosleep			-10249
- #define __PNR_gettimeofday			-10250
-+#define __PNR_quotactl_path			-10251
+ src/syscalls.csv | 959 ++++++++++++++++++++++++-----------------------
+ 1 file changed, 480 insertions(+), 479 deletions(-)
 
- /*
-  * libseccomp syscall definitions
-@@ -1547,6 +1548,12 @@
- #define __SNR_riscv_flush_icache	__PNR_riscv_flush_icache
- #endif
-
-+#ifdef __NR_quotactl_path
-+#define __SNR_quotactl_path       __NR_quotactl_path
-+#else
-+#define __SNR_quotactl_path       __PNR_quotactl_path
-+#endif
-+
- #ifdef __NR_rmdir
- #define __SNR_rmdir			__NR_rmdir
- #else
 diff --git a/src/syscalls.csv b/src/syscalls.csv
-index 0ee6c15..eec8d21 100644
+index 5bd0c9f..37ddb3d 100644
 --- a/src/syscalls.csv
 +++ b/src/syscalls.csv
-@@ -1,474 +1,478 @@
--#syscall (v5.12.0-rc7 2021-04-17),x86,x86_64,x32,arm,aarch64,mips,mips64,mips64n32,parisc,parisc64,ppc,ppc64,riscv32,riscv64,s390,s390x,sh
+@@ -1,479 +1,480 @@
+-#syscall (v5.14.0-rc7 2021-08-23),x86,x86_64,x32,arm,aarch64,mips,mips64,mips64n32,parisc,parisc64,ppc,ppc64,riscv64,s390,s390x,sh
 -accept,PNR,43,43,285,202,168,42,42,35,35,330,330,202,PNR,PNR,344
 -accept4,364,288,288,366,242,334,293,297,320,320,344,344,242,364,364,358
 -access,33,21,21,33,PNR,33,20,20,33,33,33,33,PNR,33,33,33
@@ -210,6 +186,9 @@ index 0ee6c15..eec8d21 100644
 -kexec_load,283,246,528,347,104,311,270,274,300,300,268,268,104,277,277,283
 -keyctl,288,250,250,311,219,282,241,245,266,266,271,271,219,280,280,287
 -kill,37,62,62,37,129,37,60,60,37,37,37,37,129,37,37,37
+-landlock_add_rule,445,445,445,445,445,445,445,445,445,445,445,445,445,445,445,445
+-landlock_create_ruleset,444,444,444,444,444,444,444,444,444,444,444,444,444,444,444,444
+-landlock_restrict_self,446,446,446,446,446,446,446,446,446,446,446,446,446,446,446,446
 -lchown,16,94,94,16,PNR,16,92,92,16,16,16,16,PNR,16,198,16
 -lchown32,198,PNR,PNR,198,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,198,PNR,198
 -lgetxattr,230,192,192,230,9,228,184,184,242,242,213,213,9,228,228,230
@@ -230,6 +209,7 @@ index 0ee6c15..eec8d21 100644
 -mbind,274,237,237,319,235,268,227,231,260,260,259,259,235,268,268,274
 -membarrier,375,324,324,389,283,358,318,322,343,343,365,365,283,356,356,378
 -memfd_create,356,319,319,385,279,354,314,318,340,340,360,360,279,350,350,374
+-memfd_secret,447,447,447,PNR,447,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR
 -migrate_pages,294,256,256,400,238,287,246,250,272,272,258,258,238,287,287,294
 -mincore,218,27,27,219,232,217,26,26,72,72,206,206,232,218,218,218
 -mkdir,39,83,83,39,PNR,39,81,81,39,39,39,39,PNR,39,39,39
@@ -319,6 +299,7 @@ index 0ee6c15..eec8d21 100644
 -pwritev2,379,328,547,393,287,362,322,326,348,348,381,381,287,377,377,382
 -query_module,167,178,PNR,PNR,PNR,187,171,171,PNR,PNR,166,166,PNR,167,167,PNR
 -quotactl,131,179,179,131,60,131,172,172,131,131,131,131,60,131,131,131
+-quotactl_fd,443,443,443,443,443,443,443,443,443,443,443,443,443,443,443,443
 -read,3,0,0,3,63,3,0,0,3,3,3,3,63,3,3,3
 -readahead,225,187,187,225,213,223,179,179,207,207,191,191,213,222,222,225
 -readdir,89,PNR,PNR,PNR,PNR,89,PNR,PNR,PNR,PNR,89,89,PNR,89,89,89
@@ -514,7 +495,7 @@ index 0ee6c15..eec8d21 100644
 -waitpid,7,PNR,PNR,PNR,PNR,7,PNR,PNR,7,7,7,7,PNR,PNR,PNR,7
 -write,4,1,1,4,64,4,1,1,4,4,4,4,64,4,4,4
 -writev,146,20,516,146,66,146,19,19,146,146,146,146,66,146,146,146
-+#syscall (v5.13.0-rc5 2021-06-09),x86,x86_64,x32,arm,aarch64,mips,mips64,mips64n32,parisc,parisc64,ppc,ppc64,riscv32,riscv64,s390,s390x,sh
++#syscall (v5.15.0-rc3 2021-10-01),x86,x86_64,x32,arm,aarch64,mips,mips64,mips64n32,parisc,parisc64,ppc,ppc64,riscv32,riscv64,s390,s390x,sh
 +accept,PNR,43,43,285,202,168,42,42,35,35,330,330,202,202,PNR,PNR,344
 +accept4,364,288,288,366,242,334,293,297,320,320,344,344,242,242,364,364,358
 +access,33,21,21,33,PNR,33,20,20,33,33,33,33,PNR,PNR,33,33,33
@@ -707,6 +688,7 @@ index 0ee6c15..eec8d21 100644
 +mbind,274,237,237,319,235,268,227,231,260,260,259,259,235,235,268,268,274
 +membarrier,375,324,324,389,283,358,318,322,343,343,365,365,283,283,356,356,378
 +memfd_create,356,319,319,385,279,354,314,318,340,340,360,360,279,279,350,350,374
++memfd_secret,447,447,447,PNR,447,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR
 +migrate_pages,294,256,256,400,238,287,246,250,272,272,258,258,238,238,287,287,294
 +mincore,218,27,27,219,232,217,26,26,72,72,206,206,232,232,218,218,218
 +mkdir,39,83,83,39,PNR,39,81,81,39,39,39,39,PNR,PNR,39,39,39
@@ -783,6 +765,7 @@ index 0ee6c15..eec8d21 100644
 +preadv2,378,327,546,392,286,361,321,325,347,347,380,380,286,286,376,376,381
 +prlimit64,340,302,302,369,261,338,297,302,321,321,325,325,261,261,334,334,339
 +process_madvise,440,440,440,440,440,440,440,440,440,440,440,440,440,440,440,440,440
++process_mrelease,448,448,448,448,448,448,448,448,448,448,448,448,448,448,448,448,448
 +process_vm_readv,347,310,539,376,270,345,304,309,330,330,351,351,270,270,340,340,365
 +process_vm_writev,348,311,540,377,271,346,305,310,331,331,352,352,271,271,341,341,366
 +prof,44,PNR,PNR,PNR,PNR,44,PNR,PNR,PNR,PNR,44,44,PNR,PNR,PNR,PNR,PNR
@@ -796,7 +779,7 @@ index 0ee6c15..eec8d21 100644
 +pwritev2,379,328,547,393,287,362,322,326,348,348,381,381,287,287,377,377,382
 +query_module,167,178,PNR,PNR,PNR,187,171,171,PNR,PNR,166,166,PNR,PNR,167,167,PNR
 +quotactl,131,179,179,131,60,131,172,172,131,131,131,131,60,60,131,131,131
-+quotactl_path,PNR,PNR,PNR,PNR,443,PNR,PNR,PNR,PNR,PNR,PNR,PNR,443,443,PNR,PNR,PNR
++quotactl_fd,443,443,443,443,443,443,443,443,443,443,443,443,443,443,443,443,443
 +read,3,0,0,3,63,3,0,0,3,3,3,3,63,63,3,3,3
 +readahead,225,187,187,225,213,223,179,179,207,207,191,191,213,213,222,222,225
 +readdir,89,PNR,PNR,PNR,PNR,89,PNR,PNR,PNR,PNR,89,89,PNR,PNR,89,89,89
@@ -992,5 +975,6 @@ index 0ee6c15..eec8d21 100644
 +waitpid,7,PNR,PNR,PNR,PNR,7,PNR,PNR,7,7,7,7,PNR,PNR,PNR,PNR,7
 +write,4,1,1,4,64,4,1,1,4,4,4,4,64,64,4,4,4
 +writev,146,20,516,146,66,146,19,19,146,146,146,146,66,66,146,146,146
---
-2.32.0
+-- 
+2.33.0
+
diff --git a/meta/recipes-support/libseccomp/files/0004-syscalls-Add-quotactl_path.patch b/meta/recipes-support/libseccomp/files/0004-syscalls-Add-quotactl_path.patch
new file mode 100644
index 0000000000..bedf74844e
--- /dev/null
+++ b/meta/recipes-support/libseccomp/files/0004-syscalls-Add-quotactl_path.patch
@@ -0,0 +1,40 @@
+From d59e03b5a82b3e0debc3a3c77270bd160f4309f9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Jun 2021 20:42:19 -0700
+Subject: [PATCH 4/4] syscalls: Add quotactl_path
+
+Upstream-Status: Submitted [https://github.com/seccomp/libseccomp/pull/327]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/seccomp-syscalls.h | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/include/seccomp-syscalls.h b/include/seccomp-syscalls.h
+index 4ff814c..dd347d3 100644
+--- a/include/seccomp-syscalls.h
++++ b/include/seccomp-syscalls.h
+@@ -284,6 +284,7 @@
+ #define __PNR_clock_nanosleep			-10250
+ #define __PNR_gettimeofday			-10251
+ #define __PNR_fcntl				-10252
++#define __PNR_quotactl_path			-10253
+ 
+ /*
+  * libseccomp syscall definitions
+@@ -1557,6 +1558,12 @@
+ #define __SNR_riscv_flush_icache	__PNR_riscv_flush_icache
+ #endif
+ 
++#ifdef __NR_quotactl_path
++#define __SNR_quotactl_path       __NR_quotactl_path
++#else
++#define __SNR_quotactl_path       __PNR_quotactl_path
++#endif
++
+ #ifdef __NR_rmdir
+ #define __SNR_rmdir			__NR_rmdir
+ #else
+-- 
+2.33.0
+
diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.2.bb
similarity index 87%
rename from meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
rename to meta/recipes-support/libseccomp/libseccomp_2.5.2.bb
index 74bface4a1..3ec6f135c5 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.5.2.bb
@@ -8,12 +8,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357c
 DEPENDS += "gperf-native"
 
 PV .= "+git${SRCPV}"
-SRCREV = "5822e50c2920ce597d038077dea4a0eedf193f86"
+SRCREV = "2457dec1a90101d720e89e8027376742e2f3c327"
 
 SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=main \
            file://0001-configure.ac-Bump-version-to-2.5.99.patch \
            file://0001-arch-Add-riscv32-architecture-support.patch \
-           file://0002-Regenerate-syscall-cvs-file-from-5.13-rc5-kernel.patch \
+           file://0002-man-Add-RISCV64-to-arch-list.patch \
+           file://0003-syscalls-update-the-syscall-defs-for-Linux-v5.15.0-r.patch \
+           file://0004-syscalls-Add-quotactl_path.patch \
            file://run-ptest \
            "
 
-- 
2.33.0


