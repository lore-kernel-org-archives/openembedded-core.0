Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.7720.1614918144509118322
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: WlewXSyW7blqoeb6apHjDUsoCqb3lVr/bkxVQwMfadHaQ3EnAprfS3h6nQGvT/tjWFFzbymcVV
 AFeE20YlXb6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187670869"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187670869"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:06 -0800
IronPort-SDR: OrCrE1l9tlxHeQUkXEhErtj/GepE9KTCZvqvM/hMZp2170oRXLvHw06/Oar2JNrKL4jNM2ZpTx
 erXV3VVAzcPA==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128786"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:05 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 06/52] valgrind: Disable ptest nlcontrolc for x86-64
Date: Fri,  5 Mar 2021 12:20:42 +0800
Message-Id: <5b227c917fb85a4a7fc088ab5c90145d60e8f1d6.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yi Fan Yu <yifan.yu@windriver.com>

Test hangs after glibc 2.33 uprev.

Using gdb `p t[0]` to modify the timeout
argument no longer affects how long `select` wait.

https://bugs.kde.org/show_bug.cgi?id=432870
[YOCTO #14223]

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bb991a24952ebf02cf0092c194d2b3a54a8b2e5b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...Disable-nlcontrolc.vgtest-for-x86-64.patch | 36 +++++++++++++++++++
 .../valgrind/valgrind_3.16.1.bb               |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-gdbserver_tests-Disable-nlcontrolc.vgtest-for-x86-64.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-gdbserver_tests-Disable-nlcontrolc.vgtest-for-x86-64.patch b/meta/recipes-devtools/valgrind/valgrind/0001-gdbserver_tests-Disable-nlcontrolc.vgtest-for-x86-64.patch
new file mode 100644
index 0000000000..0bd8273cd8
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-gdbserver_tests-Disable-nlcontrolc.vgtest-for-x86-64.patch
@@ -0,0 +1,36 @@
+From d8c19e0bb9ca2fd48f223e1fdeffcafeb0aa1745 Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Wed, 17 Feb 2021 14:53:44 -0500
+Subject: [PATCH] gdbserver_tests: Disable nlcontrolc.vgtest for x86-64
+
+Test hangs after glibc 2.33 uprev
+
+Using gdb to modify the timeout argument no longer
+affects how long `select` wait.
+
+https://bugs.kde.org/show_bug.cgi?id=432870
+Upstream-Status: Pending
+Waiting for upstream to take action.
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ gdbserver_tests/nlcontrolc.vgtest | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gdbserver_tests/nlcontrolc.vgtest b/gdbserver_tests/nlcontrolc.vgtest
+index bb5308403..96d2b52bb 100644
+--- a/gdbserver_tests/nlcontrolc.vgtest
++++ b/gdbserver_tests/nlcontrolc.vgtest
+@@ -13,7 +13,8 @@ args: 1000000000 1000000000 1000000000 BSBSBSBS 1
+ vgopts: --tool=none --vgdb=yes --vgdb-error=0 --vgdb-prefix=./vgdb-prefix-nlcontrolc
+ stderr_filter: filter_stderr
+ # Bug 338633 nlcontrol hangs on arm64 currently.
+-prereq: test -e gdb -a -f vgdb.invoker && ! ../tests/arch_test arm64 && ! ../tests/os_test solaris
++# Bug 432870 nlcontrolc hangs on x86-64 starting with glibc 2.33
++prereq: test -e gdb -a -f vgdb.invoker && ! ../tests/arch_test arm64 && ! ../tests/os_test solaris && ! ../tests/arch_test amd64
+ progB: gdb
+ argsB: --quiet -l 60 --nx ./sleepers
+ stdinB: nlcontrolc.stdinB.gdb
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
index 25fa58249c..fc070dec78 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
@@ -44,6 +44,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-drd-Port-to-Fedora-33.patch \
            file://0001-drd-musl-fix.patch \
            file://0001-helgrind-Intercept-libc-functions.patch \
+           file://0001-gdbserver_tests-Disable-nlcontrolc.vgtest-for-x86-64.patch \
            "
 SRC_URI[md5sum] = "d1b153f1ab17cf1f311705e7a83ef589"
 SRC_URI[sha256sum] = "c91f3a2f7b02db0f3bc99479861656154d241d2fdb265614ba918cc6720a33ca"
-- 
2.29.2

