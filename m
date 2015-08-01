Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 656DA76669
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Aug 2015 09:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7196U9v018788; Sat, 1 Aug 2015 10:06:30 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6r1MEC-wwTgx; Sat,  1 Aug 2015 10:06:30 +0100 (BST)
Received: from ted (5751f4a1.skybroadband.com [87.81.244.161])
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7196OcJ018780
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 1 Aug 2015 10:06:26 +0100
Received: from richard by ted with local (Exim 4.84_RC1)
	(envelope-from <richard@dan.rpsys.net>)
	id 1ZLSkF-0000tk-Qj; Sat, 01 Aug 2015 10:06:19 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Aug 2015 10:06:12 +0100
Message-Id: <1438419973-3394-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1438419973-3394-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1438419973-3394-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/4] kexec-tools: 2.0.9 -> 2.0.10
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Aug 2015 09:06:32 -0000

Drop patch merged upstream and part of x32 patch merged upstream.
Refresh patches.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...urgatory-Disabling-GCC-s-stack-protection.patch | 64 ----------------------
 ...0002-powerpc-change-the-memory-size-limit.patch | 11 ++--
 .../kexec/kexec-tools/kexec-aarch64.patch          | 54 ++++++++++++------
 ...kexec-tools-Refine-kdump-device_tree-sort.patch | 12 ++--
 .../kexec/kexec-tools/kexec-x32.patch              | 63 +++++++--------------
 ...{kexec-tools_2.0.9.bb => kexec-tools_2.0.10.bb} |  5 +-
 6 files changed, 69 insertions(+), 140 deletions(-)
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-Disabling-GCC-s-stack-protection.patch
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.9.bb => kexec-tools_2.0.10.bb} (71%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-Disabling-GCC-s-stack-protection.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-Disabling-GCC-s-stack-protection.patch
deleted file mode 100644
index 74a8387..0000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-Disabling-GCC-s-stack-protection.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 8227f5a583ad4523059ba2531263e625ac01cd40 Mon Sep 17 00:00:00 2001
-From: Kevin Hao <kexin.hao@windriver.com>
-Date: Tue, 28 Apr 2015 20:25:12 +0800
-Subject: [PATCH] purgatory: Disabling GCC's stack protection
-
-If the GCC's stack protection is enabled by default, the purgatory will
-also be built with this option. But it makes no sense to enable this
-for the purgatory code, and would cause error when we are trying to
-relocate the purgatory codes because symbol like __stack_chk_fail is
-unresolved. Instead of disabling this for some archs specifically,
-disable it for all the archs.
-
-Upstream-Status: Pending
-
-Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- purgatory/Makefile            | 3 ++-
- purgatory/arch/ppc64/Makefile | 2 +-
- purgatory/arch/s390/Makefile  | 1 -
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/purgatory/Makefile b/purgatory/Makefile
-index 1945702..a25b262 100644
---- a/purgatory/Makefile
-+++ b/purgatory/Makefile
-@@ -47,7 +47,8 @@ purgatory/sha256.o: $(srcdir)/util_lib/sha256.c
- $(PURGATORY): CC=$(TARGET_CC)
- $(PURGATORY): CFLAGS+=$(PURGATORY_EXTRA_CFLAGS) \
- 		      $($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
--		      -Os -fno-builtin -ffreestanding
-+		      -Os -fno-builtin -ffreestanding \
-+		      -fno-stack-protector
- 
- $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
- 			-I$(srcdir)/purgatory/include \
-diff --git a/purgatory/arch/ppc64/Makefile b/purgatory/arch/ppc64/Makefile
-index 6c58fa2..8ca2719 100644
---- a/purgatory/arch/ppc64/Makefile
-+++ b/purgatory/arch/ppc64/Makefile
-@@ -9,7 +9,7 @@ ppc64_PURGATORY_SRCS += purgatory/arch/ppc64/console-ppc64.c
- ppc64_PURGATORY_SRCS += purgatory/arch/ppc64/crashdump_backup.c
- ppc64_PURGATORY_SRCS += purgatory/arch/ppc64/misc.S
- 
--ppc64_PURGATORY_EXTRA_CFLAGS += -m64 -msoft-float -fno-stack-protector	\
-+ppc64_PURGATORY_EXTRA_CFLAGS += -m64 -msoft-float \
- 				-fno-exceptions
- ppc64_PURGATORY_EXTRA_ASFLAGS += -m64
- ifeq ($(SUBARCH),BE)
-diff --git a/purgatory/arch/s390/Makefile b/purgatory/arch/s390/Makefile
-index 09749bd..c94cc3c 100644
---- a/purgatory/arch/s390/Makefile
-+++ b/purgatory/arch/s390/Makefile
-@@ -2,7 +2,6 @@
- # Purgatory s390
- #
- 
--s390_PURGATORY_EXTRA_CFLAGS += -fno-stack-protector
- s390_PURGATORY_SRCS += purgatory/arch/s390/console-s390.c
- s390_PURGATORY_SRCS += purgatory/arch/s390/setup-s390.S
- s390_PURGATORY_SRCS += purgatory/arch/s390/purgatory-s390.c
--- 
-1.9.1
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0002-powerpc-change-the-memory-size-limit.patch b/meta/recipes-kernel/kexec/kexec-tools/0002-powerpc-change-the-memory-size-limit.patch
index d6b6383..dc97d93 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0002-powerpc-change-the-memory-size-limit.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0002-powerpc-change-the-memory-size-limit.patch
@@ -20,10 +20,10 @@ Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
  kexec/arch/ppc/kexec-ppc.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/kexec/arch/ppc/kexec-ppc.h b/kexec/arch/ppc/kexec-ppc.h
-index 904cf48..a097ecd 100644
---- a/kexec/arch/ppc/kexec-ppc.h
-+++ b/kexec/arch/ppc/kexec-ppc.h
+Index: kexec-tools-2.0.10/kexec/arch/ppc/kexec-ppc.h
+===================================================================
+--- kexec-tools-2.0.10.orig/kexec/arch/ppc/kexec-ppc.h
++++ kexec-tools-2.0.10/kexec/arch/ppc/kexec-ppc.h
 @@ -42,7 +42,7 @@ void dol_ppc_usage(void);
   * During inital setup the kernel does not map the whole memory but a part of
   * it. On Book-E that is 64MiB, 601 24MiB or 256MiB (if possible).
@@ -33,6 +33,3 @@ index 904cf48..a097ecd 100644
  
  /* boot block version 17 as defined by the linux kernel */
  struct bootblock {
--- 
-1.9.1
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools/kexec-aarch64.patch b/meta/recipes-kernel/kexec/kexec-tools/kexec-aarch64.patch
index 92b5631..b03f582 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/kexec-aarch64.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/kexec-aarch64.patch
@@ -29,9 +29,11 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  purgatory/arch/arm64/Makefile           |    7 
  11 files changed, 675 insertions(+), 2 deletions(-)
 
---- a/configure.ac
-+++ b/configure.ac
-@@ -35,6 +35,9 @@ case $target_cpu in
+Index: kexec-tools-2.0.10/configure.ac
+===================================================================
+--- kexec-tools-2.0.10.orig/configure.ac
++++ kexec-tools-2.0.10/configure.ac
+@@ -36,6 +36,9 @@ case $target_cpu in
  		ARCH="ppc64"
  		SUBARCH="LE"
  		;;
@@ -41,8 +43,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  	arm* )
  		ARCH="arm"
  		;;
---- a/kexec/Makefile
-+++ b/kexec/Makefile
+Index: kexec-tools-2.0.10/kexec/Makefile
+===================================================================
+--- kexec-tools-2.0.10.orig/kexec/Makefile
++++ kexec-tools-2.0.10/kexec/Makefile
 @@ -71,6 +71,7 @@ KEXEC_SRCS			+= $($(ARCH)_FS2DT)
  
  include $(srcdir)/kexec/arch/alpha/Makefile
@@ -51,8 +55,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  include $(srcdir)/kexec/arch/i386/Makefile
  include $(srcdir)/kexec/arch/ia64/Makefile
  include $(srcdir)/kexec/arch/m68k/Makefile
+Index: kexec-tools-2.0.10/kexec/arch/arm64/Makefile
+===================================================================
 --- /dev/null
-+++ b/kexec/arch/arm64/Makefile
++++ kexec-tools-2.0.10/kexec/arch/arm64/Makefile
 @@ -0,0 +1,13 @@
 +
 +arm64_KEXEC_SRCS += \
@@ -67,8 +73,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
 +dist += $(arm64_KEXEC_SRCS) \
 +	kexec/arch/arm64/Makefile \
 +	kexec/arch/arm64/kexec-arm64.h
+Index: kexec-tools-2.0.10/kexec/arch/arm64/crashdump-arm64.c
+===================================================================
 --- /dev/null
-+++ b/kexec/arch/arm64/crashdump-arm64.c
++++ kexec-tools-2.0.10/kexec/arch/arm64/crashdump-arm64.c
 @@ -0,0 +1,305 @@
 +/*
 + * This program is free software; you can redistribute it and/or modify
@@ -375,8 +383,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
 +
 +#endif
 +
+Index: kexec-tools-2.0.10/kexec/arch/arm64/include/arch/options.h
+===================================================================
 --- /dev/null
-+++ b/kexec/arch/arm64/include/arch/options.h
++++ kexec-tools-2.0.10/kexec/arch/arm64/include/arch/options.h
 @@ -0,0 +1,26 @@
 +#ifndef KEXEC_ARCH_ARM64_OPTIONS_H
 +#define KEXEC_ARCH_ARM64_OPTIONS_H
@@ -404,8 +414,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
 +#define KEXEC_ALL_OPT_STR KEXEC_ARCH_OPT_STR
 +
 +#endif /* KEXEC_ARCH_ARM64_OPTIONS_H */
+Index: kexec-tools-2.0.10/kexec/arch/arm64/kexec-arm64.c
+===================================================================
 --- /dev/null
-+++ b/kexec/arch/arm64/kexec-arm64.c
++++ kexec-tools-2.0.10/kexec/arch/arm64/kexec-arm64.c
 @@ -0,0 +1,177 @@
 +/*
 + * ARM64 kexec support.
@@ -584,8 +596,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
 +	(void)value;
 +	fprintf(stderr, "%s:%d: do\n", __func__, __LINE__);
 +}
+Index: kexec-tools-2.0.10/kexec/arch/arm64/kexec-arm64.h
+===================================================================
 --- /dev/null
-+++ b/kexec/arch/arm64/kexec-arm64.h
++++ kexec-tools-2.0.10/kexec/arch/arm64/kexec-arm64.h
 @@ -0,0 +1,20 @@
 +/*
 + * ARM64 kexec support.
@@ -608,8 +622,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
 +
 +#endif
 \ No newline at end of file
+Index: kexec-tools-2.0.10/kexec/arch/arm64/kexec-elf-arm64.c
+===================================================================
 --- /dev/null
-+++ b/kexec/arch/arm64/kexec-elf-arm64.c
++++ kexec-tools-2.0.10/kexec/arch/arm64/kexec-elf-arm64.c
 @@ -0,0 +1,114 @@
 +/*
 + * ARM64 kexec support.
@@ -725,8 +741,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
 +	fprintf(stderr, "%s:%d: ->\n", __func__, __LINE__);
 +	fprintf(stderr, "%s:%d: <-\n", __func__, __LINE__);
 +}
---- a/kexec/kexec-syscall.h
-+++ b/kexec/kexec-syscall.h
+Index: kexec-tools-2.0.10/kexec/kexec-syscall.h
+===================================================================
+--- kexec-tools-2.0.10.orig/kexec/kexec-syscall.h
++++ kexec-tools-2.0.10/kexec/kexec-syscall.h
 @@ -39,8 +39,8 @@
  #ifdef __s390__
  #define __NR_kexec_load		277
@@ -756,8 +774,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
 +#endif
  
  #endif /* KEXEC_SYSCALL_H */
---- a/kexec/kexec.c
-+++ b/kexec/kexec.c
+Index: kexec-tools-2.0.10/kexec/kexec.c
+===================================================================
+--- kexec-tools-2.0.10.orig/kexec/kexec.c
++++ kexec-tools-2.0.10/kexec/kexec.c
 @@ -664,6 +664,8 @@ static int my_load(const char *type, int
  	memset(&info, 0, sizeof(info));
  	info.kexec_flags = kexec_flags;
@@ -767,8 +787,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  	result = 0;
  	if (argc - fileind <= 0) {
  		fprintf(stderr, "No kernel specified\n");
+Index: kexec-tools-2.0.10/purgatory/arch/arm64/Makefile
+===================================================================
 --- /dev/null
-+++ b/purgatory/arch/arm64/Makefile
++++ kexec-tools-2.0.10/purgatory/arch/arm64/Makefile
 @@ -0,0 +1,7 @@
 +#
 +# Purgatory arm64
diff --git a/meta/recipes-kernel/kexec/kexec-tools/kexec-tools-Refine-kdump-device_tree-sort.patch b/meta/recipes-kernel/kexec/kexec-tools/kexec-tools-Refine-kdump-device_tree-sort.patch
index 8bb4fc4..e198eb6 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/kexec-tools-Refine-kdump-device_tree-sort.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/kexec-tools-Refine-kdump-device_tree-sort.patch
@@ -15,11 +15,11 @@ Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
  kexec/fs2dt.c          |   13 ++++++++++---
  2 files changed, 20 insertions(+), 6 deletions(-)
 
-diff --git a/kexec/arch/ppc/fs2dt.c b/kexec/arch/ppc/fs2dt.c
-index 4121c7d..cc04b04 100644
---- a/kexec/arch/ppc/fs2dt.c
-+++ b/kexec/arch/ppc/fs2dt.c
-@@ -296,6 +296,9 @@ static int comparefunc(const void *dentry1, const void *dentry2)
+Index: kexec-tools-2.0.10/kexec/arch/ppc/fs2dt.c
+===================================================================
+--- kexec-tools-2.0.10.orig/kexec/arch/ppc/fs2dt.c
++++ kexec-tools-2.0.10/kexec/arch/ppc/fs2dt.c
+@@ -296,6 +296,9 @@ static int comparefunc(const void *dentr
  {
  	char *str1 = (*(struct dirent **)dentry1)->d_name;
  	char *str2 = (*(struct dirent **)dentry2)->d_name;
@@ -29,7 +29,7 @@ index 4121c7d..cc04b04 100644
  
  	/*
  	 * strcmp scans from left to right and fails to idetify for some
-@@ -303,9 +306,13 @@ static int comparefunc(const void *dentry1, const void *dentry2)
+@@ -303,9 +306,13 @@ static int comparefunc(const void *dentr
  	 * Therefore, we get the wrong sorted order like memory@10000000 and
  	 * memory@f000000.
  	 */
diff --git a/meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch b/meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch
index 0bd3264..26d18eb 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch
@@ -21,11 +21,11 @@ Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
  purgatory/arch/x86_64/Makefile           | 4 +++-
  4 files changed, 20 insertions(+), 1 deletion(-)
 
-diff --git a/configure.ac b/configure.ac
-index c410e90..1ecadd5 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -52,6 +52,15 @@ case $target_cpu in
+Index: kexec-tools-2.0.10/configure.ac
+===================================================================
+--- kexec-tools-2.0.10.orig/configure.ac
++++ kexec-tools-2.0.10/configure.ac
+@@ -56,6 +56,15 @@ case $target_cpu in
  		;;
  	ia64|x86_64|alpha|m68k )
  		ARCH="$target_cpu"
@@ -41,11 +41,11 @@ index c410e90..1ecadd5 100644
  		;;
  	* )
  		AC_MSG_ERROR([unsupported architecture $target_cpu])
-diff --git a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-index c795037..06db7f0 100644
---- a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-+++ b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-@@ -8,7 +8,11 @@ int machine_verify_elf_rel(struct mem_ehdr *ehdr)
+Index: kexec-tools-2.0.10/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
+===================================================================
+--- kexec-tools-2.0.10.orig/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
++++ kexec-tools-2.0.10/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
+@@ -8,7 +8,11 @@ int machine_verify_elf_rel(struct mem_eh
  	if (ehdr->ei_data != ELFDATA2LSB) {
  		return 0;
  	}
@@ -57,10 +57,10 @@ index c795037..06db7f0 100644
  		return 0;
  	}
  	if (ehdr->e_machine != EM_X86_64) {
-diff --git a/kexec/kexec-syscall.h b/kexec/kexec-syscall.h
-index ce2e20b..cab5535 100644
---- a/kexec/kexec-syscall.h
-+++ b/kexec/kexec-syscall.h
+Index: kexec-tools-2.0.10/kexec/kexec-syscall.h
+===================================================================
+--- kexec-tools-2.0.10.orig/kexec/kexec-syscall.h
++++ kexec-tools-2.0.10/kexec/kexec-syscall.h
 @@ -31,8 +31,12 @@
  #define __NR_kexec_load		268
  #endif
@@ -74,11 +74,11 @@ index ce2e20b..cab5535 100644
  #ifdef __s390x__
  #define __NR_kexec_load		277
  #endif
-diff --git a/purgatory/arch/x86_64/Makefile b/purgatory/arch/x86_64/Makefile
-index 7300937..4af11e4 100644
---- a/purgatory/arch/x86_64/Makefile
-+++ b/purgatory/arch/x86_64/Makefile
-@@ -23,4 +23,6 @@ x86_64_PURGATORY_SRCS += purgatory/arch/i386/console-x86.c
+Index: kexec-tools-2.0.10/purgatory/arch/x86_64/Makefile
+===================================================================
+--- kexec-tools-2.0.10.orig/purgatory/arch/x86_64/Makefile
++++ kexec-tools-2.0.10/purgatory/arch/x86_64/Makefile
+@@ -23,4 +23,6 @@ x86_64_PURGATORY_SRCS += purgatory/arch/
  x86_64_PURGATORY_SRCS += purgatory/arch/i386/vga.c
  x86_64_PURGATORY_SRCS += purgatory/arch/i386/pic.c
  
@@ -86,28 +86,3 @@ index 7300937..4af11e4 100644
 +ifeq ($(SUBARCH),64)
 +        x86_64_PURGATORY_EXTRA_CFLAGS = -mcmodel=large
 +endif
--- 
-1.8.4.5
-
-diff --git a/configure.ac b/configure.ac
-index 1ecadd5..e0b5f78 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -8,6 +8,7 @@ AC_INIT(kexec-tools, 2.0.10.git)
- AC_CONFIG_AUX_DIR(./config)
- AC_CONFIG_HEADERS([include/config.h])
- AC_LANG(C)
-+AC_PROG_CC
- 
- AC_DEFINE_UNQUOTED(PACKAGE_DATE, "`date '+%d %B %Y'`",
- 		[Define to the release date of this package])
-@@ -106,9 +107,6 @@ AC_ARG_WITH([booke],
- 
- dnl ---Programs
- dnl To specify a different compiler, just 'export CC=/path/to/compiler'
--
--AC_PROG_CC
--
- if test "${build}" != "${host}" ; then
- 	AC_CHECK_PROGS(BUILD_CC, [${build_alias}-gcc ${build}-gcc gcc])
- else
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.9.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.10.bb
similarity index 71%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.9.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.10.bb
index 6164ff5..dd7bba7 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.9.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.10.bb
@@ -5,12 +5,11 @@ EXTRA_OECONF = " --with-zlib=yes"
 SRC_URI += "file://kexec-tools-Refine-kdump-device_tree-sort.patch \
             file://kexec-aarch64.patch \
             file://kexec-x32.patch \
-            file://0001-purgatory-Disabling-GCC-s-stack-protection.patch \
             file://0002-powerpc-change-the-memory-size-limit.patch \
          "
 
-SRC_URI[md5sum] = "4ecb7ab7ad9eb6ce413899bdb07a8426"
-SRC_URI[sha256sum] = "c2c6d204fe0911ebd304c40100163237feca4c5a854a2cca382ee36916a573d8"
+SRC_URI[md5sum] = "6cb4d22bcec71b6e070aa8e9d990a5e6"
+SRC_URI[sha256sum] = "c31bb83deef9547a28e8cfc1f0916e70f8e6b92a6bd2ef7077e12e3338239af3"
 
 PACKAGES =+ "kexec kdump vmcore-dmesg"
 
-- 
2.1.0


