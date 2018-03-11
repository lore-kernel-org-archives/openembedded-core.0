Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 66BE9788DA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:42:42 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id m12so12286627wrm.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 16:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DfDfpw+A7I0t1EvX9x9iJhlfZBr9ryLRhRdivqUr7PU=;
	b=iia4/mYgp9fi/+sV8TyMGtOrmH4xtt72spwfzl45QtlMP/hxFbmhRIxKX0dfwtpwrU
	JDscKaC825jWQvS6V/IyYFrm8EbNSvJr3q52OPfummAeNgpu5juxvOA2y8CaOqZVjxGx
	bLyQJcI27cgB9QVtNYa/fVJnFV+ZwON/kZ0bxKZXdomHrr5psRwIN+AGOlKnXLnkZjDE
	YHoO3SQO1GzkvpP5wLZneZmcg9Mvg1F1QiJDMHgWjR5PoaxgBFjiws7ebhsMLoisZcxq
	M3yvB6MxXlC2h7wlQq/MF5uFobuz5FpA9feHhvW5qB4kpM4bwdolTbPQLgA1UiLyZhI7
	ExPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DfDfpw+A7I0t1EvX9x9iJhlfZBr9ryLRhRdivqUr7PU=;
	b=MBKkXsrV/X2ucgcpUouNXh66VzbjUHQ68HIy4mVbl7NB0wsvxnUhpvmQlKlcP3VABp
	gJeuy07yif6lHUmySx53UYdqVKoCsbnKH8iYiPKYLV+GAr7QyijpFD40uQa2na/axRR5
	4XImROmUK0udlbHsRuNELAIUS9HC0Hiudkl7vPkZ6ex7CD7CK2tIfNMIwVrCj9pRqV7X
	CUiiLGjWeh41UQqE1D/I5W+jdLkm0EsPnokQaMW/34mIvNb0/1HpRsqQDbYwS0X6mO4v
	U4m/xKGVi+Q1kytLsGCOKY7Km7TzSasDO0K4SwmiVAXIffuCnN6YfIPgtOU2/GmnZIPF
	PXNw==
X-Gm-Message-State: AElRT7Fht76slP4xaxtcINcezs/9eJaxQgmmsfc/zj4qdXO8tx6ojcWC
	9fKotE+htxU68+oDvx7AeJs=
X-Google-Smtp-Source: AG47ELthgjk3LeXQ61aYHhvjvHhuN28uC+zaa8YjiMAbkJnAX5IymBTMPD9psCnQrVUdybUl0zkjYg==
X-Received: by 10.223.186.18 with SMTP id o18mr2771890wrg.158.1520728963177;
	Sat, 10 Mar 2018 16:42:43 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id k1sm5786157wmi.1.2018.03.10.16.42.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Mar 2018 16:42:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 00:42:20 +0000
Message-Id: <063f5558ef2040b6d2c34caa553ed09733fc6470.1520728802.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1520728802.git.Martin.Jansa@gmail.com>
References: <cover.1520728802.git.Martin.Jansa@gmail.com>
Subject: [morty][PATCH 08/16] gcc-6.3.inc: Use ucontext_t not struct ucontext.
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
X-List-Received-Date: Sun, 11 Mar 2018 00:42:42 -0000

From: Juro Bystricky <juro.bystricky@intel.com>

Use ucontext_t not struct ucontext in linux-unwind.h files.

Current glibc no longer gives the ucontext_t type the tag struct
ucontext, to conform with POSIX namespace rules.  This requires
various linux-unwind.h files in libgcc, that were previously using
struct ucontext, to be fixed to use ucontext_t instead.  This is
similar to the removal of the struct siginfo tag from siginfo_t some
years ago.

Backport of patches by Joseph Myers, taken from
https://gcc.gnu.org/viewcvs/gcc?limit_changes=0&view=revision&revision=249957

[YOCTO #12083]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit ec1c18d866c137b1fa523d0fcc29f65a28f59f44)
---
 meta/recipes-devtools/gcc/gcc-6.3.inc              |   1 +
 .../gcc/gcc-6.3/0055-unwind_h-glibc26.patch        | 139 +++++++++++++++++++++
 2 files changed, 140 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/0055-unwind_h-glibc26.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.3.inc b/meta/recipes-devtools/gcc/gcc-6.3.inc
index 71d0affb89..d74f12c466 100644
--- a/meta/recipes-devtools/gcc/gcc-6.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.3.inc
@@ -80,6 +80,7 @@ SRC_URI = "\
            file://0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
            file://0048-sync-gcc-stddef.h-with-musl.patch \
            file://0054_all_nopie-all-flags.patch \
+           file://0055-unwind_h-glibc26.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0055-unwind_h-glibc26.patch b/meta/recipes-devtools/gcc/gcc-6.3/0055-unwind_h-glibc26.patch
new file mode 100644
index 0000000000..c266cfe21f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.3/0055-unwind_h-glibc26.patch
@@ -0,0 +1,139 @@
+Backport and edit of patches from:
+https://gcc.gnu.org/viewcvs/gcc?limit_changes=0&view=revision&revision=249957
+by jsm28 (Joseph Myers)
+
+Current glibc no longer gives the ucontext_t type the tag struct
+ucontext, to conform with POSIX namespace rules.  This requires
+various linux-unwind.h files in libgcc, that were previously using
+struct ucontext, to be fixed to use ucontext_t instead.  This is
+similar to the removal of the struct siginfo tag from siginfo_t some
+years ago.
+
+This patch changes those files to use ucontext_t instead.  As the
+standard name that should be unconditionally safe, so this is not
+restricted to architectures supported by glibc, or conditioned on the
+glibc version.
+
+Upstream-Status: Backport
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+--- branches/gcc-6-branch/libgcc/config/aarch64/linux-unwind.h	2017/07/04 10:22:56	249956
+--- b/libgcc/config/aarch64/linux-unwind.h	2017/07/04 10:23:57	249957
+@@ -52,7 +52,7 @@
+   struct rt_sigframe
+   {
+     siginfo_t info;
+-    struct ucontext uc;
++    ucontext_t uc;
+   };
+ 
+   struct rt_sigframe *rt_;
+--- branches/gcc-6-branch/libgcc/config/alpha/linux-unwind.h	2017/07/04 10:22:56	249956
+--- b/libgcc/config/alpha/linux-unwind.h	2017/07/04 10:23:57	249957
+@@ -51,7 +51,7 @@
+     {
+       struct rt_sigframe {
+ 	siginfo_t info;
+-	struct ucontext uc;
++	ucontext_t uc;
+       } *rt_ = context->cfa;
+       sc = &rt_->uc.uc_mcontext;
+     }
+--- branches/gcc-6-branch/libgcc/config/bfin/linux-unwind.h	2017/07/04 10:22:56	249956
+--- b/libgcc/config/bfin/linux-unwind.h	2017/07/04 10:23:57	249957
+@@ -52,7 +52,7 @@
+ 	void *puc;
+ 	char retcode[8];
+ 	siginfo_t info;
+-	struct ucontext uc;
++	ucontext_t uc;
+       } *rt_ = context->cfa;
+ 
+       /* The void * cast is necessary to avoid an aliasing warning.
+--- branches/gcc-6-branch/libgcc/config/i386/linux-unwind.h	2017/07/04 10:22:56	249956
+--- b/libgcc/config/i386/linux-unwind.h	2017/07/04 10:23:57	249957
+@@ -58,7 +58,7 @@
+   if (*(unsigned char *)(pc+0) == 0x48
+       && *(unsigned long long *)(pc+1) == RT_SIGRETURN_SYSCALL)
+     {
+-      struct ucontext *uc_ = context->cfa;
++      ucontext_t *uc_ = context->cfa;
+       /* The void * cast is necessary to avoid an aliasing warning.
+          The aliasing warning is correct, but should not be a problem
+          because it does not alias anything.  */
+@@ -138,7 +138,7 @@
+ 	siginfo_t *pinfo;
+ 	void *puc;
+ 	siginfo_t info;
+-	struct ucontext uc;
++	ucontext_t uc;
+       } *rt_ = context->cfa;
+       /* The void * cast is necessary to avoid an aliasing warning.
+          The aliasing warning is correct, but should not be a problem
+--- branches/gcc-6-branch/libgcc/config/m68k/linux-unwind.h	2017/07/04 10:22:56	249956
+--- b/libgcc/config/m68k/linux-unwind.h	2017/07/04 10:23:57	249957
+@@ -33,7 +33,7 @@
+ /* <sys/ucontext.h> is unfortunately broken right now.  */
+ struct uw_ucontext {
+ 	unsigned long	  uc_flags;
+-	struct ucontext  *uc_link;
++	ucontext_t	 *uc_link;
+ 	stack_t		  uc_stack;
+ 	mcontext_t	  uc_mcontext;
+ 	unsigned long	  uc_filler[80];
+--- branches/gcc-6-branch/libgcc/config/nios2/linux-unwind.h	2017/07/04 10:22:56	249956
+--- b/libgcc/config/nios2/linux-unwind.h	2017/07/04 10:23:57	249957
+@@ -38,7 +38,7 @@
+ 
+ struct nios2_ucontext {
+   unsigned long uc_flags;
+-  struct ucontext *uc_link;
++  ucontext_t *uc_link;
+   stack_t uc_stack;
+   struct nios2_mcontext uc_mcontext;
+   sigset_t uc_sigmask;	/* mask last for extensibility */
+--- branches/gcc-6-branch/libgcc/config/pa/linux-unwind.h	2017/07/04 10:22:56	249956
+--- b/libgcc/config/pa/linux-unwind.h	2017/07/04 10:23:57	249957
+@@ -80,7 +80,7 @@
+   struct sigcontext *sc;
+   struct rt_sigframe {
+     siginfo_t info;
+-    struct ucontext uc;
++    ucontext_t uc;
+   } *frame;
+ 
+   /* rt_sigreturn trampoline:
+--- branches/gcc-6-branch/libgcc/config/sh/linux-unwind.h	2017/07/04 10:22:56	249956
+--- b/libgcc/config/sh/linux-unwind.h	2017/07/04 10:23:57	249957
+@@ -180,7 +180,7 @@
+     {
+       struct rt_sigframe {
+ 	siginfo_t info;
+-	struct ucontext uc;
++	ucontext_t uc;
+       } *rt_ = context->cfa;
+       /* The void * cast is necessary to avoid an aliasing warning.
+          The aliasing warning is correct, but should not be a problem
+--- branches/gcc-6-branch/libgcc/config/tilepro/linux-unwind.h	2017/07/04 10:22:56	249956
+--- b/libgcc/config/tilepro/linux-unwind.h	2017/07/04 10:23:57	249957
+@@ -61,7 +61,7 @@
+   struct rt_sigframe {
+     unsigned char save_area[C_ABI_SAVE_AREA_SIZE];
+     siginfo_t info;
+-    struct ucontext uc;
++    ucontext_t uc;
+   } *rt_;
+ 
+   /* Return if this is not a signal handler.  */
+--- branches/gcc-6-branch/libgcc/config/xtensa/linux-unwind.h	2017/07/04 10:22:56	249956
+--- b/libgcc/config/xtensa/linux-unwind.h	2017/07/04 10:23:57	249957
+@@ -67,7 +67,7 @@
+ 
+   struct rt_sigframe {
+     siginfo_t info;
+-    struct ucontext uc;
++    ucontext_t uc;
+   } *rt_;
+ 
+   /* movi a2, __NR_rt_sigreturn; syscall */
-- 
2.15.1


