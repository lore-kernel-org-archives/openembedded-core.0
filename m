Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.3191.1588661898167067506
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 23:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: UIicZlV3Oo1nHkR+08PkncXAnWhDlq4HrKZR7iLxHlva+3z596Xoo5eNjseOSOvwCpXIgFM2jG
 Q+cJJfiFL1nQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 23:58:17 -0700
IronPort-SDR: AbV8ctPsNKlHYntpzDRYJ/bGceir/xS9P6yqN5XLNJp7U6HfbJnkZT28mHpNj7Vh38rMiCbnwG
 F8zytEUCGDyQ==
X-IronPort-AV: E=Sophos;i="5.73,354,1583222400"; 
   d="scan'208";a="284144784"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.72.16])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 23:58:15 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 05/18] glibc: CVE-2020-1751
Date: Tue,  5 May 2020 14:56:40 +0800
Message-Id: <807d416cb8b01de4dbb96236653bb47447018ad0.1588661196.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1588661196.git.anuj.mittal@intel.com>
References: <cover.1588661196.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhixiong Chi <zhixiong.chi@windriver.com>

Backport the CVE patch from upstream:
git://sourceware.org/git/glibc.git
commit d93769405996dfc11d216ddbe415946617b5a494

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../glibc/glibc/CVE-2020-1751.patch           | 70 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.30.bb         |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-1751.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-1751.patch b/meta/recipes-core/glibc/glibc/CVE-2020-1751.patch
new file mode 100644
index 0000000000..0ed92d50e9
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2020-1751.patch
@@ -0,0 +1,70 @@
+From d93769405996dfc11d216ddbe415946617b5a494 Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@suse.de>
+Date: Mon, 20 Jan 2020 17:01:50 +0100
+Subject: [PATCH] Fix array overflow in backtrace on PowerPC (bug 25423)
+
+When unwinding through a signal frame the backtrace function on PowerPC
+didn't check array bounds when storing the frame address.  Fixes commit
+d400dcac5e ("PowerPC: fix backtrace to handle signal trampolines").
+
+CVE: CVE-2020-1751
+Upstream-Status: Backport [git://sourceware.org/git/glibc.git]
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ debug/tst-backtrace5.c                | 12 ++++++++++++
+ sysdeps/powerpc/powerpc32/backtrace.c |  2 ++
+ sysdeps/powerpc/powerpc64/backtrace.c |  2 ++
+ 3 files changed, 16 insertions(+)
+
+diff --git a/debug/tst-backtrace5.c b/debug/tst-backtrace5.c
+index e7ce410845..b2f46160e7 100644
+--- a/debug/tst-backtrace5.c
++++ b/debug/tst-backtrace5.c
+@@ -89,6 +89,18 @@ handle_signal (int signum)
+       }
+   /* Symbol names are not available for static functions, so we do not
+      check do_test.  */
++
++  /* Check that backtrace does not return more than what fits in the array
++     (bug 25423).  */
++  for (int j = 0; j < NUM_FUNCTIONS; j++)
++    {
++      n = backtrace (addresses, j);
++      if (n > j)
++	{
++	  FAIL ();
++	  return;
++	}
++    }
+ }
+ 
+ NO_INLINE int
+diff --git a/sysdeps/powerpc/powerpc32/backtrace.c b/sysdeps/powerpc/powerpc32/backtrace.c
+index 7c2d4726f8..d1456c8ae4 100644
+--- a/sysdeps/powerpc/powerpc32/backtrace.c
++++ b/sysdeps/powerpc/powerpc32/backtrace.c
+@@ -114,6 +114,8 @@ __backtrace (void **array, int size)
+         }
+       if (gregset)
+ 	{
++	  if (count + 1 == size)
++	    break;
+ 	  array[++count] = (void*)((*gregset)[PT_NIP]);
+ 	  current = (void*)((*gregset)[PT_R1]);
+ 	}
+diff --git a/sysdeps/powerpc/powerpc64/backtrace.c b/sysdeps/powerpc/powerpc64/backtrace.c
+index 65c260ab76..8a53a1088f 100644
+--- a/sysdeps/powerpc/powerpc64/backtrace.c
++++ b/sysdeps/powerpc/powerpc64/backtrace.c
+@@ -87,6 +87,8 @@ __backtrace (void **array, int size)
+       if (is_sigtramp_address (current->return_address))
+         {
+ 	  struct signal_frame_64 *sigframe = (struct signal_frame_64*) current;
++	  if (count + 1 == size)
++	    break;
+           array[++count] = (void*) sigframe->uc.uc_mcontext.gp_regs[PT_NIP];
+ 	  current = (void*) sigframe->uc.uc_mcontext.gp_regs[PT_R1];
+ 	}
+-- 
+2.23.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.30.bb b/meta/recipes-core/glibc/glibc_2.30.bb
index c9e44a396d..84a6538ea1 100644
--- a/meta/recipes-core/glibc/glibc_2.30.bb
+++ b/meta/recipes-core/glibc/glibc_2.30.bb
@@ -43,6 +43,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
            file://CVE-2019-19126.patch \
            file://CVE-2020-10029.patch \
+           file://CVE-2020-1751.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.25.4

