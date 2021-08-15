Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.12595.1629043014207392295
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 08:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="276780155"
X-IronPort-AV: E=Sophos;i="5.84,322,1620716400"; 
   d="scan'208";a="276780155"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2021 08:56:53 -0700
X-IronPort-AV: E=Sophos;i="5.84,322,1620716400"; 
   d="scan'208";a="461820006"
Received: from fwang8-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.132.228])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2021 08:56:52 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 1/7] glibc: Fix CVE-2021-35942
Date: Sun, 15 Aug 2021 23:56:40 +0800
Message-Id: <79adec00a3b7efb44171ac15e221cac3d3d85f20.1629041998.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629041998.git.anuj.mittal@intel.com>
References: <cover.1629041998.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vinay Kumar <vinay.m.engg@gmail.com>

Source: https://sourceware.org/git/glibc.git
Tracking -- https://sourceware.org/bugzilla/show_bug.cgi?id=28011

Backported upstream commit 5adda61f62b77384718b4c0d8336ade8f2b4b35c to
glibc-2.33 source.

Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5adda61f62b77384718b4c0d8336ade8f2b4b35c]
Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../glibc/glibc/CVE-2021-35942.patch          | 44 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.33.bb         |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-35942.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch b/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
new file mode 100644
index 0000000000..5cae1bc91c
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
@@ -0,0 +1,44 @@
+From 5adda61f62b77384718b4c0d8336ade8f2b4b35c Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@linux-m68k.org>
+Date: Fri, 25 Jun 2021 15:02:47 +0200
+Subject: [PATCH] wordexp: handle overflow in positional parameter number (bug
+ 28011)
+
+Use strtoul instead of atoi so that overflow can be detected.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5adda61f62b77384718b4c0d8336ade8f2b4b35c]
+CVE: CVE-2021-35942
+Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
+---
+ posix/wordexp-test.c | 1 +
+ posix/wordexp.c      | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/posix/wordexp-test.c b/posix/wordexp-test.c
+index f93a546d7e..9df02dbbb3 100644
+--- a/posix/wordexp-test.c
++++ b/posix/wordexp-test.c
+@@ -183,6 +183,7 @@ struct test_case_struct
+     { 0, NULL, "$var", 0, 0, { NULL, }, IFS },
+     { 0, NULL, "\"\\n\"", 0, 1, { "\\n", }, IFS },
+     { 0, NULL, "", 0, 0, { NULL, }, IFS },
++    { 0, NULL, "${1234567890123456789012}", 0, 0, { NULL, }, IFS },
+ 
+     /* Flags not already covered (testit() has special handling for these) */
+     { 0, NULL, "one two", WRDE_DOOFFS, 2, { "one", "two", }, IFS },
+diff --git a/posix/wordexp.c b/posix/wordexp.c
+index bcbe96e48d..1f3b09f721 100644
+--- a/posix/wordexp.c
++++ b/posix/wordexp.c
+@@ -1399,7 +1399,7 @@ envsubst:
+   /* Is it a numeric parameter? */
+   else if (isdigit (env[0]))
+     {
+-      int n = atoi (env);
++      unsigned long n = strtoul (env, NULL, 10);
+ 
+       if (n >= __libc_argc)
+ 	/* Substitute NULL. */
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
index bb35c50c98..7f516d2bbe 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -63,6 +63,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0001-nptl-Remove-private-futex-optimization-BZ-27304.patch \
            file://CVE-2021-33574_1.patch \
            file://CVE-2021-33574_2.patch \
+           file://CVE-2021-35942.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.31.1

