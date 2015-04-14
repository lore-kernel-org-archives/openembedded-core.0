Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 81FAB73D3C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 09:09:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3E994Sg009791
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 02:09:05 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 14 Apr 2015 02:09:09 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Apr 2015 02:09:01 -0700
Message-ID: <c06b0df9021a5b8e65aa2da6274d572a9a31fcba.1429002519.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429002519.git.liezhi.yang@windriver.com>
References: <cover.1429002519.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] strace: fix build for aarch64
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
X-List-Received-Date: Tue, 14 Apr 2015 09:09:05 -0000
Content-Type: text/plain

Fixed:
sigreturn.c: In function 'sys_sigreturn':
sigreturn.c:27:7: error: 'aarch64_sp_ptr' undeclared (first use in this function)
     (*aarch64_sp_ptr + SIZEOF_STRUCT_SIGINFO +
sigreturn.c:30:7: error: 'arm_sp_ptr' undeclared (first use in this function)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../strace/sigreturn.c-fix-build-for-aarch64.patch |   34 ++++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.10.bb        |    1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/sigreturn.c-fix-build-for-aarch64.patch

diff --git a/meta/recipes-devtools/strace/strace/sigreturn.c-fix-build-for-aarch64.patch b/meta/recipes-devtools/strace/strace/sigreturn.c-fix-build-for-aarch64.patch
new file mode 100644
index 0000000..ac2621b
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/sigreturn.c-fix-build-for-aarch64.patch
@@ -0,0 +1,34 @@
+From 1ef2d93924581ec8412ee9c163fbc92d039c1222 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 14 Apr 2015 03:15:04 +0000
+Subject: [PATCH] sigreturn.c: fix build for aarch64
+
+Fixed:
+sigreturn.c: In function 'sys_sigreturn':
+sigreturn.c:27:7: error: 'aarch64_sp_ptr' undeclared (first use in this function)
+     (*aarch64_sp_ptr + SIZEOF_STRUCT_SIGINFO +
+sigreturn.c:30:7: error: 'arm_sp_ptr' undeclared (first use in this function)
+
+Upstream-Status: Backport [scratch from strace: a3c483545a7fb3a075f885a01a3c58b2f84db8fa]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ sigreturn.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/sigreturn.c b/sigreturn.c
+index 648bd0a..45c4675 100644
+--- a/sigreturn.c
++++ b/sigreturn.c
+@@ -12,6 +12,8 @@
+ #elif NSIG < 32
+ # error NSIG < 32
+ #endif
++extern uint64_t *const aarch64_sp_ptr;
++extern uint32_t *const arm_sp_ptr;
+ 
+ int
+ sys_sigreturn(struct tcb *tcp)
+-- 
+2.0.1
+
diff --git a/meta/recipes-devtools/strace/strace_4.10.bb b/meta/recipes-devtools/strace/strace_4.10.bb
index 416c387..489e1f4 100644
--- a/meta/recipes-devtools/strace/strace_4.10.bb
+++ b/meta/recipes-devtools/strace/strace_4.10.bb
@@ -9,6 +9,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://strace-add-configure-options.patch \
            file://Makefile-ptest.patch \
            file://run-ptest \
+           file://sigreturn.c-fix-build-for-aarch64.patch \
           "
 
 SRC_URI[md5sum] = "107a5be455493861189e9b57a3a51912"
-- 
1.7.9.5


