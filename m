Return-Path: <juro.bystricky@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EF93E78601
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 23:18:04 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Sep 2017 16:18:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,395,1500966000"; d="scan'208";a="149361971"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga005.jf.intel.com with ESMTP; 14 Sep 2017 16:18:04 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Sep 2017 16:18:08 -0700
Message-Id: <1505431088-87267-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505431088-87267-1-git-send-email-juro.bystricky@intel.com>
References: <1505431088-87267-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 1/1] gcc-6.3.inc: Use ucontext_t not struct ucontext.
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
X-List-Received-Date: Thu, 14 Sep 2017 23:18:05 -0000

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
---
 meta/recipes-devtools/gcc/gcc-6.3.inc              |   1 +
 .../gcc/gcc-6.3/0055-unwind_h-glibc26.patch        | 139 +++++++++++++++++++++
 2 files changed, 140 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/0055-unwind_h-glibc26.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.3.inc b/meta/recipes-devtools/gcc/gcc-6.3.inc
index 86b3e9f..ec6d8cd 100644
--- a/meta/recipes-devtools/gcc/gcc-6.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.3.inc
@@ -74,6 +74,7 @@ SRC_URI = "\
            file://0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
            file://0048-sync-gcc-stddef.h-with-musl.patch \
            file://0054_all_nopie-all-flags.patch \
+           file://0055-unwind_h-glibc26.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0055-unwind_h-glibc26.patch b/meta/recipes-devtools/gcc/gcc-6.3/0055-unwind_h-glibc26.patch
new file mode 100644
index 0000000..c266cfe
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
2.7.4


