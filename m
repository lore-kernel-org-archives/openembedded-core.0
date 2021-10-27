Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79AAEC433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:17:30 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.13168.1635347816645315769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456839"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456839"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:29 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537617215"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:28 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 23/36] m4: Do not use SIGSTKSZ
Date: Wed, 27 Oct 2021 23:16:31 +0800
Message-Id: 
 <4d350d458fa4ec75bf6f40da9c3a7c43403f3dbd.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635347406.git.anuj.mittal@intel.com>
References: <cover.1635347406.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:17:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157539

From: Khem Raj <raj.khem@gmail.com>

Fixes
../../m4-1.4.18/lib/c-stack.c:55:26: error: missing binary operator before token "("
   55 | #elif HAVE_LIBSIGSEGV && SIGSTKSZ < 16384
      |                          ^~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 44ca8edd622782733d507e20a3d5ee9e44eb8be4)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/m4/m4-1.4.18.inc        |  1 +
 .../m4/0001-c-stack-stop-using-SIGSTKSZ.patch | 84 +++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-devtools/m4/m4/0001-c-stack-stop-using-SIGSTKSZ.patch

diff --git a/meta/recipes-devtools/m4/m4-1.4.18.inc b/meta/recipes-devtools/m4/m4-1.4.18.inc
index a9b63c1bf6..6475b02f8b 100644
--- a/meta/recipes-devtools/m4/m4-1.4.18.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.18.inc
@@ -9,6 +9,7 @@ inherit autotools texinfo ptest
 SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
            file://ac_config_links.patch \
            file://m4-1.4.18-glibc-change-work-around.patch \
+           file://0001-c-stack-stop-using-SIGSTKSZ.patch \
            "
 SRC_URI_append_class-target = " file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
                                 file://run-ptest \
diff --git a/meta/recipes-devtools/m4/m4/0001-c-stack-stop-using-SIGSTKSZ.patch b/meta/recipes-devtools/m4/m4/0001-c-stack-stop-using-SIGSTKSZ.patch
new file mode 100644
index 0000000000..883b8a2075
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4/0001-c-stack-stop-using-SIGSTKSZ.patch
@@ -0,0 +1,84 @@
+From 69238f15129f35eb4756ad8e2004e0d7907cb175 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 30 Apr 2021 17:40:36 -0700
+Subject: [PATCH] c-stack: stop using SIGSTKSZ
+
+This patch is required with glibc 2.34+
+based on gnulib [1]
+
+[1] https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=f9e2b20a12a230efa30f1d479563ae07d276a94b
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/c-stack.c | 22 +++++++++++++---------
+ 1 file changed, 13 insertions(+), 9 deletions(-)
+
+diff --git a/lib/c-stack.c b/lib/c-stack.c
+index 5353c08..863f764 100644
+--- a/lib/c-stack.c
++++ b/lib/c-stack.c
+@@ -51,13 +51,14 @@
+ typedef struct sigaltstack stack_t;
+ #endif
+ #ifndef SIGSTKSZ
+-# define SIGSTKSZ 16384
+-#elif HAVE_LIBSIGSEGV && SIGSTKSZ < 16384
++#define get_sigstksz()  (16384)
++#elif HAVE_LIBSIGSEGV
+ /* libsigsegv 2.6 through 2.8 have a bug where some architectures use
+    more than the Linux default of an 8k alternate stack when deciding
+    if a fault was caused by stack overflow.  */
+-# undef SIGSTKSZ
+-# define SIGSTKSZ 16384
++#define get_sigstksz() ((SIGSTKSZ) < 16384 ? 16384 : (SIGSTKSZ))
++#else
++#define get_sigstksz() ((SIGSTKSZ))
+ #endif
+ 
+ #include <stdlib.h>
+@@ -131,7 +132,8 @@ die (int signo)
+ /* Storage for the alternate signal stack.  */
+ static union
+ {
+-  char buffer[SIGSTKSZ];
++  /* allocate buffer with size from get_sigstksz() */
++  char *buffer;
+ 
+   /* These other members are for proper alignment.  There's no
+      standard way to guarantee stack alignment, but this seems enough
+@@ -203,10 +205,11 @@ c_stack_action (void (*action) (int))
+   program_error_message = _("program error");
+   stack_overflow_message = _("stack overflow");
+ 
++  alternate_signal_stack.buffer = malloc(get_sigstksz());
+   /* Always install the overflow handler.  */
+   if (stackoverflow_install_handler (overflow_handler,
+                                      alternate_signal_stack.buffer,
+-                                     sizeof alternate_signal_stack.buffer))
++                                     get_sigstksz()))
+     {
+       errno = ENOTSUP;
+       return -1;
+@@ -279,14 +282,15 @@ c_stack_action (void (*action) (int))
+   stack_t st;
+   struct sigaction act;
+   st.ss_flags = 0;
++  alternate_signal_stack.buffer = malloc(get_sigstksz());
+ # if SIGALTSTACK_SS_REVERSED
+   /* Irix mistakenly treats ss_sp as the upper bound, rather than
+      lower bound, of the alternate stack.  */
+-  st.ss_sp = alternate_signal_stack.buffer + SIGSTKSZ - sizeof (void *);
+-  st.ss_size = sizeof alternate_signal_stack.buffer - sizeof (void *);
++  st.ss_sp = alternate_signal_stack.buffer + get_sigstksz() - sizeof (void *);
++  st.ss_size = get_sigstksz() - sizeof (void *);
+ # else
+   st.ss_sp = alternate_signal_stack.buffer;
+-  st.ss_size = sizeof alternate_signal_stack.buffer;
++  st.ss_size = get_sigstksz();
+ # endif
+   r = sigaltstack (&st, NULL);
+   if (r != 0)
+-- 
+2.31.1
+
-- 
2.31.1


