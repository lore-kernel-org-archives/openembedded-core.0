Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web08.3933.1631747749606685057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 16:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="220565595"
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; 
   d="scan'208";a="220565595"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2021 16:16:07 -0700
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; 
   d="scan'208";a="433597396"
Received: from chgan-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.238.104])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2021 16:16:06 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 14/17] systemtap: Fix headers issue with x86 and 5.13 headers
Date: Thu, 16 Sep 2021 07:15:38 +0800
Message-Id: <3934d33861ebf18e3208b09b892b39b16e350157.1631747352.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631747352.git.anuj.mittal@intel.com>
References: <cover.1631747352.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

On some x86 platforms there were header issues causing pt_regs compile
failures for our stap tests, e.g. on genericx86-64 but not qemux86-64.

Backport a patch from upstream which fixes the issue.

[YOCTO #14491]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a4ad6c88b683b7310ef46d89b1add80b0f41bf2d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...8b9eda402e4e96c4e3ce01e7ff95d3e10470.patch | 26 +++++++++++++++++++
 .../systemtap/systemtap_git.inc               |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/ef5a8b9eda402e4e96c4e3ce01e7ff95d3e10470.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/ef5a8b9eda402e4e96c4e3ce01e7ff95d3e10470.patch b/meta/recipes-kernel/systemtap/systemtap/ef5a8b9eda402e4e96c4e3ce01e7ff95d3e10470.patch
new file mode 100644
index 0000000000..4d044de7ee
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/ef5a8b9eda402e4e96c4e3ce01e7ff95d3e10470.patch
@@ -0,0 +1,26 @@
+From ef5a8b9eda402e4e96c4e3ce01e7ff95d3e10470 Mon Sep 17 00:00:00 2001
+From: Du Zhe <duzhe0211+sourceware@gmail.com>
+Date: Tue, 13 Jul 2021 19:11:55 -0400
+Subject: [PATCH] runtime: fix unintended compile error with
+ autoconf-x86-uniregs.c
+
+Adding a #include <linux/sched.h> restores this test on the gentoo
+linux-5.10.47-gentoo kernel.
+
+Upstream-Status: Backport
+---
+ runtime/linux/autoconf-x86-uniregs.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/runtime/linux/autoconf-x86-uniregs.c b/runtime/linux/autoconf-x86-uniregs.c
+index 25729c220..232c18670 100644
+--- a/runtime/linux/autoconf-x86-uniregs.c
++++ b/runtime/linux/autoconf-x86-uniregs.c
+@@ -1,3 +1,4 @@
++#include <linux/sched.h>
+ #include <asm/ptrace.h>
+ 
+ #if defined (__i386__) || defined (__x86_64__)
+-- 
+2.27.0
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 016b423847..73fba981b7 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -8,6 +8,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
            file://0001-transport-protect-include-and-callsite-with-same-con.patch \
+           file://ef5a8b9eda402e4e96c4e3ce01e7ff95d3e10470.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips).*-linux'
-- 
2.31.1

