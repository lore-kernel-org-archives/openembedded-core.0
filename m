Return-Path: <Li.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0320673E11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 06:49:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7P6nwpO013499
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 23:49:58 -0700 (PDT)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Mon, 24 Aug 2015 23:49:56 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Aug 2015 14:49:34 +0800
Message-ID: <1440485374-7319-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [PATCH] valgrind: enable rt_sigpending syscall on ppc64 linux
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
X-List-Received-Date: Tue, 25 Aug 2015 06:50:02 -0000
Content-Type: text/plain

When running one application under Valgrind on ppc64 arch, we got a
missing syscall error. Get upstream patch from valgrind website to
enable rt_sigpending syscall on ppc64 linux.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...able-rt_sigpending-syscall-on-ppc64-linux.patch |   35 ++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb  |    1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-valgrind-Enable-rt_sigpending-syscall-on-ppc64-linux.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-Enable-rt_sigpending-syscall-on-ppc64-linux.patch b/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-Enable-rt_sigpending-syscall-on-ppc64-linux.patch
new file mode 100644
index 0000000..56bb5f5
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-Enable-rt_sigpending-syscall-on-ppc64-linux.patch
@@ -0,0 +1,35 @@
+From 1a8006f56342dae9f7100a3c33d80873676e0404 Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Mon, 24 Aug 2015 03:55:18 -0400
+Subject: [PATCH] valgrind: Enable rt_sigpending syscall on ppc64 linux
+
+New Revision: 15133
+Enable rt_sigpending syscall on ppc64 linux.
+Patch from Thomas Huth <thuth@redhat.com>
+
+Get the patch from valgrind upstream:
+http://valgrind.10908.n7.nabble.com/Valgrind-r15133-in-trunk-NEWS-coregrind-m-syswrap-syswrap-ppc64-linux-c-td54589.html
+
+Upstream-Status: backport
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ coregrind/m_syswrap/syswrap-ppc64-linux.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/coregrind/m_syswrap/syswrap-ppc64-linux.c b/coregrind/m_syswrap/syswrap-ppc64-linux.c
+index 5946ee1..8aaa1d7 100644
+--- a/coregrind/m_syswrap/syswrap-ppc64-linux.c
++++ b/coregrind/m_syswrap/syswrap-ppc64-linux.c
+@@ -887,7 +887,7 @@ static SyscallTableEntry syscall_table[] = {
+    LINXY(__NR_rt_sigaction,      sys_rt_sigaction),       // 173
+    LINXY(__NR_rt_sigprocmask,    sys_rt_sigprocmask),     // 174
+ 
+-// _____(__NR_rt_sigpending,     sys_rt_sigpending),      // 175
++   LINXY(__NR_rt_sigpending,     sys_rt_sigpending),      // 175
+    LINXY(__NR_rt_sigtimedwait,   sys_rt_sigtimedwait),    // 176
+    LINXY(__NR_rt_sigqueueinfo,   sys_rt_sigqueueinfo),    // 177
+    LINX_(__NR_rt_sigsuspend,     sys_rt_sigsuspend),      // 178
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
index 537d7c8..86ba979 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://add-ptest.patch \
            file://pass-maltivec-only-if-it-supported.patch \
            file://run-ptest \
+           file://0001-valgrind-Enable-rt_sigpending-syscall-on-ppc64-linux.patch \
           "
 
 SRC_URI[md5sum] = "60ddae962bc79e7c95cfc4667245707f"
-- 
1.7.9.5


