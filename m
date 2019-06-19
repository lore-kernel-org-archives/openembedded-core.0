Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 57D3E7E71D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 12:00:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5JC0EP5022762
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 05:00:25 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 19 Jun 2019 05:00:02 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Jun 2019 07:59:58 -0400
Message-ID: <20190619115958.100567-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH] rng-tools: 6.6 -> 6.7
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
X-List-Received-Date: Wed, 19 Jun 2019 12:00:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

Upgrade rng-tools from 6.6 to latest commit 9fc873c which 26 commits
beyond release 6.7:

$ git describe 9fc873c5af0e39263
v6.7-26-g9fc873c

Because it includes some critical fixes such as configure fails and
'Import yocto fixes for 6.6'.

* remove local patches that all are merged by upstream
* backport patch to fix rngd fails to stop issue
* add PACKAGECONFIG libp11

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...the-libc-is-lacking-argp-use-libargp.patch |  60 ---------
 .../0001-configure.ac-fix-typo.patch          |  27 -----
 ...nt-to-control-the-libargp-dependency.patch |  95 ---------------
 .../rng-tools/fix-rngd-fail-to-stop.patch     |  25 ++++
 .../rng-tools-5-fix-textrels-on-PIC-x86.patch | 114 ------------------
 .../rng-tools/rng-tools/underquote.patch      |  46 -------
 .../{rng-tools_6.6.bb => rng-tools_6.7.bb}    |   9 +-
 7 files changed, 28 insertions(+), 348 deletions(-)
 delete mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-If-the-libc-is-lacking-argp-use-libargp.patch
 delete mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-configure.ac-fix-typo.patch
 delete mode 100644 meta/recipes-support/rng-tools/rng-tools/0002-Add-argument-to-control-the-libargp-dependency.patch
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/fix-rngd-fail-to-stop.patch
 delete mode 100644 meta/recipes-support/rng-tools/rng-tools/rng-tools-5-fix-textrels-on-PIC-x86.patch
 delete mode 100644 meta/recipes-support/rng-tools/rng-tools/underquote.patch
 rename meta/recipes-support/rng-tools/{rng-tools_6.6.bb => rng-tools_6.7.bb} (84%)

diff --git a/meta/recipes-support/rng-tools/rng-tools/0001-If-the-libc-is-lacking-argp-use-libargp.patch b/meta/recipes-support/rng-tools/rng-tools/0001-If-the-libc-is-lacking-argp-use-libargp.patch
deleted file mode 100644
index 06d1d94369..0000000000
--- a/meta/recipes-support/rng-tools/rng-tools/0001-If-the-libc-is-lacking-argp-use-libargp.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 06ba71887f667d45dd231a782a2751f36e8fe025 Mon Sep 17 00:00:00 2001
-From: Christopher Larson <chris_larson@mentor.com>
-Date: Mon, 15 Feb 2016 15:59:58 -0700
-Subject: [PATCH 1/4] If the libc is lacking argp, use libargp
-
-Patch pulled from Gentoo:
-
-    On glibc systems, argp is provided by libc.  However, on
-    uclibc and other systems which lack argp in their C library,
-    argp might be provided by a stand alone library, libargp.
-    This patch adds tests to the build system to find who provides
-    argp.
-
-    X-Gentoo-Bug: 292191
-    X-Gentoo-Bug-URL: https://bugs.gentoo.org/show_bug.cgi?id=292191
-    Reported-by: Ed Wildgoose <gentoo@wildgooses.com>
-    Signed-off-by: Anthony G. Basile <blueness@gentoo.org>
-
-Upstream-Status: Pending
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
----
- configure.ac | 22 ++++++++++++++++++++++
- 1 file changed, 22 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 4e799dc..c4a5dd8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -135,6 +135,28 @@ AS_IF(
- 	]
- )
- 
-+dnl First check if we have argp available from libc
-+AC_LINK_IFELSE(
-+	[AC_LANG_PROGRAM(
-+		[#include <argp.h>],
-+		[int argc=1; char *argv[]={"test"}; argp_parse(0,argc,argv,0,0,0); return 0;]
-+		)],
-+	[libc_has_argp="true"],
-+	[libc_has_argp="false"]
-+)
-+
-+dnl If libc doesn't provide argp, then test for libargp
-+if test "$libc_has_argp" = "false" ; then
-+	AC_MSG_WARN("libc does not have argp")
-+	AC_CHECK_LIB([argp], [argp_parse], [have_argp="true"], [have_argp="false"])
-+
-+	if test "$have_argp" = "false"; then
-+		AC_MSG_ERROR("no libargp found")
-+	else
-+		LIBS+=" -largp"
-+	fi
-+fi
-+
- dnl -----------------
- dnl Configure options
- dnl -----------------
--- 
-2.7.4
-
diff --git a/meta/recipes-support/rng-tools/rng-tools/0001-configure.ac-fix-typo.patch b/meta/recipes-support/rng-tools/rng-tools/0001-configure.ac-fix-typo.patch
deleted file mode 100644
index d4d28a01c4..0000000000
--- a/meta/recipes-support/rng-tools/rng-tools/0001-configure.ac-fix-typo.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 99b0efebd765803203686d89bc4f995bcb103e78 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Sat, 10 Nov 2018 09:53:19 +0800
-Subject: [PATCH] configure.ac: fix typo
-
-Upstream-Status: Submitted [https://github.com/nhorman/rng-tools.git]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4e799dc..0251928 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -62,7 +62,7 @@ AS_IF([test $target_cpu = powerpc64le], [AC_DEFINE([HAVE_DARN],1,[Enable DARN])]
- AM_CONDITIONAL([JITTER], [false])
- 
- AC_ARG_ENABLE(jitterentropy,
--	AS_HELP_STRING([--disable-jitterntropy | --enable-jitterentropy=<path>],
-+	AS_HELP_STRING([--disable-jitterentropy | --enable-jitterentropy=<path>],
- 	[Disable jitterentropy source, or specify its location]),
- 	[if [ test -d $enable_jitterentropy ]; then
- 		export LDFLAGS+=-L$enable_jitterentropy;
--- 
-2.7.4
-
diff --git a/meta/recipes-support/rng-tools/rng-tools/0002-Add-argument-to-control-the-libargp-dependency.patch b/meta/recipes-support/rng-tools/rng-tools/0002-Add-argument-to-control-the-libargp-dependency.patch
deleted file mode 100644
index be60fe97f6..0000000000
--- a/meta/recipes-support/rng-tools/rng-tools/0002-Add-argument-to-control-the-libargp-dependency.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From 711e2f76890e3c5b08f64859d9fd913ddbec7d50 Mon Sep 17 00:00:00 2001
-From: Christopher Larson <chris_larson@mentor.com>
-Date: Mon, 22 Oct 2018 15:26:47 +0800
-Subject: [PATCH 2/4] Add argument to control the libargp dependency
-
-This ensures that the builds are always deterministic. If the argument isn't
-passed, the default behavior is to use libargp if the libc doesn't have argp.
-
-Upstream-Status: Pending
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-
-Rebase to 6.6
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- configure.ac | 55 ++++++++++++++++++++++++++++++++++++-------------------
- 1 file changed, 36 insertions(+), 19 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index c4a5dd8..dd1c30f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -40,6 +40,13 @@ AC_ARG_WITH([nistbeacon],
- 	[with_nistbeacon=check]
- )
- 
-+AC_ARG_WITH([libargp],
-+	AS_HELP_STRING([--without-libargp],
-+		[Disable libargp support. Systems whose libc lacks argp can use libargp instead. (Default: check if libc lacks argp)]),
-+	[with_libargp=$withval],
-+	[with_libargp=check]
-+)
-+
- dnl Make sure anyone changing configure.ac/Makefile.am has a clue
- AM_MAINTAINER_MODE
- AM_PROG_AS
-@@ -135,27 +142,37 @@ AS_IF(
- 	]
- )
- 
--dnl First check if we have argp available from libc
--AC_LINK_IFELSE(
--	[AC_LANG_PROGRAM(
--		[#include <argp.h>],
--		[int argc=1; char *argv[]={"test"}; argp_parse(0,argc,argv,0,0,0); return 0;]
--		)],
--	[libc_has_argp="true"],
--	[libc_has_argp="false"]
-+dnl Determine if we need libargp: either user requested, or libc has no argp
-+AS_IF(
-+	[test "x$with_libargp" != "xyes"],
-+	[
-+		AC_LINK_IFELSE(
-+			[AC_LANG_PROGRAM(
-+				[#include <argp.h>],
-+				[int argc=1; char *argv[]={"test"}; argp_parse(0,argc,argv,0,0,0); return 0;]
-+				)],
-+			[need_libargp=no],
-+			[need_libargp=yes
-+			 if test "x$with_libargp" = "xno"; then
-+				AC_MSG_FAILURE([libargp disabled and libc does not have argp])
-+			 fi]
-+		)
-+	],
-+	[need_libargp=yes],
- )
- 
--dnl If libc doesn't provide argp, then test for libargp
--if test "$libc_has_argp" = "false" ; then
--	AC_MSG_WARN("libc does not have argp")
--	AC_CHECK_LIB([argp], [argp_parse], [have_argp="true"], [have_argp="false"])
--
--	if test "$have_argp" = "false"; then
--		AC_MSG_ERROR("no libargp found")
--	else
--		LIBS+=" -largp"
--	fi
--fi
-+dnl Check for libargp
-+AS_IF(
-+	[test "x$need_libargp" = "xyes"],
-+	[
-+		AC_CHECK_LIB(
-+			[argp],
-+			[argp_parse],
-+			[LIBS="$LIBS -largp"],
-+			[AC_MSG_FAILURE([libargp not found])]
-+		)
-+	]
-+)
- 
- dnl -----------------
- dnl Configure options
--- 
-2.7.4
-
diff --git a/meta/recipes-support/rng-tools/rng-tools/fix-rngd-fail-to-stop.patch b/meta/recipes-support/rng-tools/rng-tools/fix-rngd-fail-to-stop.patch
new file mode 100644
index 0000000000..58cf3f9d59
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/fix-rngd-fail-to-stop.patch
@@ -0,0 +1,25 @@
+It fails to stop rngd. It just shows warnings when stop rngd such as by:
+
+$ systemctl stop rngd.service
+
+but stalls shutdown untill daemon rngd is killed.
+
+Backport patch to fix the issue.
+
+Upstream-Status: Backport [https://bugzilla.redhat.com/show_bug.cgi?id=1690364#c8]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/rngd_jitter.c b/rngd_jitter.c
+index 54070ae..7a69bf9 100644
+--- a/rngd_jitter.c
++++ b/rngd_jitter.c
+@@ -280,7 +280,7 @@ static void *thread_entropy_task(void *data)
+ 
+ 		/* Write to pipe */
+ 		written = 0;
+-		while(written != me->buf_sz) {
++		while(me->active && written != me->buf_sz) {
+ 			message(LOG_DAEMON|LOG_DEBUG, "Writing to pipe\n");
+ 			ret = write(me->pipe_fd, &tmpbuf[written], me->buf_sz - written);
+ 			message(LOG_DAEMON|LOG_DEBUG, "DONE Writing to pipe with return %ld\n", ret);
diff --git a/meta/recipes-support/rng-tools/rng-tools/rng-tools-5-fix-textrels-on-PIC-x86.patch b/meta/recipes-support/rng-tools/rng-tools/rng-tools-5-fix-textrels-on-PIC-x86.patch
deleted file mode 100644
index 614adab27f..0000000000
--- a/meta/recipes-support/rng-tools/rng-tools/rng-tools-5-fix-textrels-on-PIC-x86.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From d8b1bb8edd99b2898720b4f10d292a67d532db48 Mon Sep 17 00:00:00 2001
-From: "Francisco Blas Izquierdo Riera (klondike)" <klondike@gentoo.org>
-Date: Mon, 22 Oct 2018 15:29:36 +0800
-Subject: [PATCH 4/4] Fix assemby textrels on rdrand_asm.S on PIC x86
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This patch updates the fixes in the assembly in rdrand_asm.S in
-sys-apps/rng-tools-5 so it won't generate textrels on PIC systems.
-The main fixes are in the use of leal in SETPTR for such systems, the rest is
-the usual PIC support stuff.
-
-This should fix Gentoo bug #469962 and help fix #518210
-
-This patch is released under the GPLv2 or a higher version license as is the
-original file as long as the author and the tester are credited.
-
-Gentoo-bug-url: https://bugs.gentoo.org/show_bug.cgi?id=469962
-Gentoo-bug-url: https://bugs.gentoo.org/show_bug.cgi?id=518210
-Signed-off-by: Francisco Blas Izquierdo Riera (klondike) <klondike@gentoo.org>
-Reported-by: cilly <cilly@cilly.mine.nu>
-Reported-by: Manuel Rüger <mrueg@gentoo.org>
-Tested-by: Anthony Basile <blueness@gentoo.org>
-
-Upstream-Status: Pending
----
- rdrand_asm.S | 27 +++++++++++++++++++++++++++
- 1 file changed, 27 insertions(+)
-
-diff --git a/rdrand_asm.S b/rdrand_asm.S
-index b5d260a..7811cf2 100644
---- a/rdrand_asm.S
-+++ b/rdrand_asm.S
-@@ -2,6 +2,7 @@
-  * Copyright (c) 2011-2014, Intel Corporation
-  * Authors: Fenghua Yu <fenghua.yu@intel.com>,
-  *          H. Peter Anvin <hpa@linux.intel.com>
-+ * PIC code by: Francisco Blas Izquierdo Riera (klondike) <klondike@gentoo.org>
-  *
-  * This program is free software; you can redistribute it and/or modify it
-  * under the terms and conditions of the GNU General Public License,
-@@ -172,7 +173,19 @@ ENTRY(x86_rdseed_or_rdrand_bytes)
- 	jmp	4b
- ENDPROC(x86_rdseed_or_rdrand_bytes)
- 
-+#if defined(__PIC__)
-+#define INIT_PIC() \
-+	pushl	%ebx ; \
-+	call    __x86.get_pc_thunk.bx ; \
-+	addl    $_GLOBAL_OFFSET_TABLE_, %ebx
-+#define END_PIC() \
-+	popl	%ebx
-+#define SETPTR(var,ptr) leal (var)@GOTOFF(%ebx),ptr
-+#else
-+#define INIT_PIC()
-+#define END_PIC()
- #define SETPTR(var,ptr)	movl $(var),ptr
-+#endif
- #define PTR0	%eax
- #define PTR1	%edx
- #define PTR2	%ecx
-@@ -188,6 +201,7 @@ ENTRY(x86_aes_mangle)
- 	movl	8(%ebp), %eax
- 	movl	12(%ebp), %edx
- 	push	%esi
-+	INIT_PIC()
- #endif
- 	movl	$512, CTR3	/* Number of rounds */
- 	
-@@ -278,6 +292,7 @@ offset = offset + 16
- 	movdqa	%xmm7, (7*16)(PTR1)
- 
- #ifdef __i386__
-+	END_PIC()
- 	pop	%esi
- 	pop	%ebp
- #endif
-@@ -292,6 +307,7 @@ ENTRY(x86_aes_expand_key)
- 	push	%ebp
- 	mov	%esp, %ebp
- 	movl	8(%ebp), %eax
-+	INIT_PIC()
- #endif
- 
- 	SETPTR(aes_round_keys, PTR1)
-@@ -321,6 +337,7 @@ ENTRY(x86_aes_expand_key)
- 	call	1f
- 
- #ifdef __i386__
-+	END_PIC()
- 	pop	%ebp
- #endif
- 	ret
-@@ -341,6 +358,16 @@ ENTRY(x86_aes_expand_key)
- 
- ENDPROC(x86_aes_expand_key)
- 
-+#if defined(__i386__) && defined(__PIC__)
-+	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
-+	.globl	__x86.get_pc_thunk.bx
-+	.hidden	__x86.get_pc_thunk.bx
-+	.type	__x86.get_pc_thunk.bx, @function
-+__x86.get_pc_thunk.bx:
-+	movl	(%esp), %ebx
-+	ret
-+#endif
-+
- 	.bss
- 	.balign 64
- aes_round_keys:
--- 
-2.7.4
-
diff --git a/meta/recipes-support/rng-tools/rng-tools/underquote.patch b/meta/recipes-support/rng-tools/rng-tools/underquote.patch
deleted file mode 100644
index aa4bbcb346..0000000000
--- a/meta/recipes-support/rng-tools/rng-tools/underquote.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 03fe7efa1bc04a83fb9b6787998e7baa7ee90646 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Mon, 22 Oct 2018 15:27:41 +0800
-Subject: [PATCH 3/4] Fix underquoted m4 entry. This causes a failure if gcrypt
- isn't present:
-
-| configure: libgcrypt support disabled
-| ../rng-tools-5/configure: line 4345: ac_fn_c_try_link: command not found
-| configure: error: in `/media/build1/poky/build/tmp/work/i586-poky-linux/rng-tools/5-r0/build':
-
-RP
-2016/2/16
-
-Upstream-Status: Pending
-
-Rebase to 6.6
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index dd1c30f..88d2be3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -124,7 +124,7 @@ AS_IF(
- 	[test "x$with_libgcrypt" != "xno"],
- 	[
- 		AC_CHECK_HEADER([gcrypt.h],
--			AC_CHECK_LIB(
-+			[AC_CHECK_LIB(
- 				[gcrypt],
- 				[gcry_check_version], ,
- 				[
-@@ -133,7 +133,7 @@ AS_IF(
- 						AC_MSG_NOTICE([libgcrypt support disabled])
- 					fi
- 				]
--			),
-+			)],
- 			[if test "x$with_libgcrypt" != "xcheck"; then
- 				AC_MSG_FAILURE([libgcrypt headers not found]); else
- 				AC_MSG_NOTICE([libgcrypt support disabled])
--- 
-2.7.4
-
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.6.bb b/meta/recipes-support/rng-tools/rng-tools_6.7.bb
similarity index 84%
rename from meta/recipes-support/rng-tools/rng-tools_6.6.bb
rename to meta/recipes-support/rng-tools/rng-tools_6.7.bb
index b0afa4b0eb..aeb558b2b7 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.6.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.7.bb
@@ -10,16 +10,12 @@ DEPENDS = "sysfsutils"
 
 SRC_URI = "\
     git://github.com/nhorman/rng-tools.git \
-    file://0001-If-the-libc-is-lacking-argp-use-libargp.patch \
-    file://0002-Add-argument-to-control-the-libargp-dependency.patch \
-    file://underquote.patch \
-    file://rng-tools-5-fix-textrels-on-PIC-x86.patch \
-    file://0001-configure.ac-fix-typo.patch \
+    file://fix-rngd-fail-to-stop.patch \
     file://init \
     file://default \
     file://rngd.service \
 "
-SRCREV = "4ebc21d6f387bb7b4b3f6badc429e27b21c0a6ee"
+SRCREV = "9fc873c5af0e392632e6b736938b811f7ca97251"
 
 S = "${WORKDIR}/git"
 
@@ -31,6 +27,7 @@ PACKAGECONFIG_libc-musl = "libargp libjitterentropy"
 PACKAGECONFIG[libargp] = "--with-libargp,--without-libargp,argp-standalone,"
 PACKAGECONFIG[libgcrypt] = "--with-libgcrypt,--without-libgcrypt,libgcrypt,"
 PACKAGECONFIG[libjitterentropy] = "--enable-jitterentropy,--disable-jitterentropy,libjitterentropy"
+PACKAGECONFIG[libp11] = "--with-pkcs11,--without-pkcs11,libp11 openssl"
 PACKAGECONFIG[nistbeacon] = "--with-nistbeacon,--without-nistbeacon,curl libxml2 openssl"
 
 INITSCRIPT_NAME = "rng-tools"
-- 
2.20.0


