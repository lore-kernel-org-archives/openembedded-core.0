Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E622170016
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 00:24:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6E0OMdO010487
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 17:24:23 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 13 Jul 2017 17:24:22 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Jul 2017 17:24:21 -0700
Message-ID: <1499991861-19044-2-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1499991861-19044-1-git-send-email-jslater@windriver.com>
References: <1499991861-19044-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] valgrind: allow version 3.12 to build under gcc7
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
X-List-Received-Date: Fri, 14 Jul 2017 00:24:22 -0000
Content-Type: text/plain

Building for powerpc64 fails because of erroneous assertions
that register r2 is clobbered.  This has probably been fixed
in version 3.13.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../valgrind/valgrind/wait-for-3.13.patch          | 40 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |  3 ++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/wait-for-3.13.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/wait-for-3.13.patch b/meta/recipes-devtools/valgrind/valgrind/wait-for-3.13.patch
new file mode 100644
index 0000000..efab1d3
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/wait-for-3.13.patch
@@ -0,0 +1,40 @@
+valgrind: allow compilation under gcc7 for powerpc64
+
+Remove a few admonitions that r2 is not preserved by function or system calls
+since they are not true.  -m32 ppc code does not care, but -m64 code does.
+
+Upstream-Status: not-applicable [ version 3.13 has similar changes, but this is NOT a backport ]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+--- a/coregrind/m_debuglog.c
++++ b/coregrind/m_debuglog.c
+@@ -215,7 +215,7 @@ static UInt local_sys_write_stderr ( con
+       :
+       : "b" (block)
+       : "cc","memory","cr0","ctr",
+-        "r0","r2","r3","r4","r5","r6","r7","r8","r9","r10","r11","r12"
++        "r0","r3","r4","r5","r6","r7","r8","r9","r10","r11","r12"
+    );
+    if (block[0] < 0)
+       block[0] = -1;
+@@ -231,7 +231,7 @@ static UInt local_sys_getpid ( void )
+       : "=&r" (__res)
+       : "i" (__NR_getpid)
+       : "cc","memory","cr0","ctr",
+-        "r0","r2","r4","r5","r6","r7","r8","r9","r10","r11","r12"
++        "r0","r4","r5","r6","r7","r8","r9","r10","r11","r12"
+    );
+    return (UInt)__res;
+ }
+--- a/include/valgrind.h
++++ b/include/valgrind.h
+@@ -2708,7 +2708,7 @@ typedef
+ #define __CALLER_SAVED_REGS                                       \
+    "lr", "ctr", "xer",                                            \
+    "cr0", "cr1", "cr2", "cr3", "cr4", "cr5", "cr6", "cr7",        \
+-   "r0", "r2", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10",   \
++   "r0", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10",   \
+    "r11", "r12", "r13"
+ 
+ /* Macros to save and align the stack before making a function
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
index 00135d8..8b0bc35 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://0004-pth_atfork1.c-Define-error-API-for-musl.patch \
            file://0005-tc20_verifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch \
            file://0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch \
+           file://wait-for-3.13.patch \
            "
 SRC_URI_append_libc-musl = "\
            file://0001-fix-build-for-musl-targets.patch \
@@ -40,6 +41,8 @@ SRC_URI[sha256sum] = "67ca4395b2527247780f36148b084f5743a68ab0c850cb43e4a5b4b012
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
 
+#COMPATIBLE_HOST_powerpc64 = 'null'
+
 # valgrind supports armv7 and above
 COMPATIBLE_HOST_armv4 = 'null'
 COMPATIBLE_HOST_armv5 = 'null'
-- 
2.7.4


