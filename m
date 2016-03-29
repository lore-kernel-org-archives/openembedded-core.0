Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id CF6A76E64A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 23:02:56 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id x64so12774128qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 16:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xBOkIjZ5Ul2YE1H8KuO/+8x+qyjSmSSpLMaz6lfRnCs=;
	b=VpuJQryO1/GPIboFU544Br081ZEslq6uyy+5ZJ36r+lq/787sk0sjinTIOQOPjAo+c
	NBxUzvc/efvB6yMY+T2FnbS7Ge3VJJN8CkVUNSvFfLIL5e2pP653wsS4P/LvseM/F0Va
	yYW++fEEtMgqZvWLXd1AvVNNxXlDBigKliZ8kftOINb9juhMgG+Se5Z8YCwfQlV88FdI
	mCOahMRcod23Qiv7mIefychNJk0w0DQdvrJzL9vJXGC7RY7gYjZ7C/U4YfwodfLb0DWi
	0LV+Dl0ucJlCmLWHqVqMPBtCMMGmygB2u78WbkH2l2UVnlOY7/dvzlMis1WfLzaeHxRE
	S4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xBOkIjZ5Ul2YE1H8KuO/+8x+qyjSmSSpLMaz6lfRnCs=;
	b=h8PLLA0cMCJ/bklLykgNETkvwslcYHmkiVLhrSmABp7YpOgpx+4SD9jPt3UXbUFu9x
	UZZmPwKMfTGKXAHE5GSWhgsZzZW2kL/t02mUyZE4sgYkCLNq66wfXSyOwAowVq4gDXeL
	+eJnkj/mvXv0DJRGcMkyt/+gnRr2FKkaPoPefSknF0Fh2hBrJsTsIhZ+uu5t/lCyh3FJ
	mEnoIENfcfKtE+JsB6IhCVuCsgZ921y5inN3G7NuaWyqvpKAJGN1oBgqWE/LFg1afuvp
	pXkrKjZl1CcWAOAZ6mgRCtoi+VuUXG4WKbGOGHKpvAxgA5jXKJavdY4UrvJZJeWRoH0I
	F+SA==
X-Gm-Message-State: AD7BkJKuMh0OjSH/UIX1zLZmN7X9uHYMFmodcLXhkIW2IL3Xv5ulYDJbK9MVhcIEKfLBpQ==
X-Received: by 10.55.25.229 with SMTP id 98mr6081368qkz.18.1459292577397;
	Tue, 29 Mar 2016 16:02:57 -0700 (PDT)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133])
	by smtp.gmail.com with ESMTPSA id b69sm501272qka.2.2016.03.29.16.02.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Mar 2016 16:02:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Mar 2016 23:02:51 +0000
Message-Id: <1459292571-13876-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] psmisc: Remove including sys/user.h and __WORDSIZE
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
X-List-Received-Date: Tue, 29 Mar 2016 23:02:58 -0000

We can replace __WORDSIZE with UINTPTR_MAX
sys/user.h is in conflict with asm/ptrace.h on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch | 49 ++++++++++++++++++++++
 meta/recipes-extended/psmisc/psmisc_22.21.bb       |  8 ++--
 2 files changed, 54 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch

diff --git a/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch b/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch
new file mode 100644
index 0000000..2e70d5e
--- /dev/null
+++ b/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch
@@ -0,0 +1,49 @@
+From 004de754e8b2c3cbfaf3aeba511a1c4149b23eb4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 24 Mar 2016 15:46:14 +0000
+Subject: [PATCH] Use UINTPTR_MAX instead of __WORDSIZE
+
+Do not include sys/user.h since it conflicts with
+pt_regs struct from kernel APIs in asm/ptrace.h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/peekfd.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/peekfd.c b/src/peekfd.c
+index cba2130..e2c39cd 100644
+--- a/src/peekfd.c
++++ b/src/peekfd.c
+@@ -30,8 +30,8 @@
+ #include <asm/ptrace.h>
+ #include <byteswap.h>
+ #include <endian.h>
+-#include <sys/user.h>
+ #include <stdlib.h>
++#include <stdint.h>
+ #include <getopt.h>
+ #include <ctype.h>
+ 
+@@ -228,11 +228,11 @@ int main(int argc, char **argv)
+ 		if (WIFSTOPPED(status)) {
+ #ifdef PPC
+ 			struct pt_regs regs;
+-			regs.gpr[0] = ptrace(PTRACE_PEEKUSER, pid, __WORDSIZE/8 * PT_R0, 0);
+-			regs.gpr[3] = ptrace(PTRACE_PEEKUSER, pid, __WORDSIZE/8 * PT_R3, 0);
+-			regs.gpr[4] = ptrace(PTRACE_PEEKUSER, pid, __WORDSIZE/8 * PT_R4, 0);
+-			regs.gpr[5] = ptrace(PTRACE_PEEKUSER, pid, __WORDSIZE/8 * PT_R5, 0);
+-			regs.orig_gpr3 = ptrace(PTRACE_PEEKUSER, pid, __WORDSIZE/8 * PT_ORIG_R3, 0);
++			regs.gpr[0] = ptrace(PTRACE_PEEKUSER, pid, UINTPTR_MAX/8 * PT_R0, 0);
++			regs.gpr[3] = ptrace(PTRACE_PEEKUSER, pid, UINTPTR_MAX/8 * PT_R3, 0);
++			regs.gpr[4] = ptrace(PTRACE_PEEKUSER, pid, UINTPTR_MAX/8 * PT_R4, 0);
++			regs.gpr[5] = ptrace(PTRACE_PEEKUSER, pid, UINTPTR_MAX/8 * PT_R5, 0);
++			regs.orig_gpr3 = ptrace(PTRACE_PEEKUSER, pid, UINTPTR_MAX/8 * PT_ORIG_R3, 0);
+ #elif defined(ARM)
+ 			struct pt_regs regs;
+ 			ptrace(PTRACE_GETREGS, pid, 0, &regs);
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-extended/psmisc/psmisc_22.21.bb b/meta/recipes-extended/psmisc/psmisc_22.21.bb
index 66aba9e..1c6473e 100644
--- a/meta/recipes-extended/psmisc/psmisc_22.21.bb
+++ b/meta/recipes-extended/psmisc/psmisc_22.21.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 SRC_URI[md5sum] = "935c0fd6eb208288262b385fa656f1bf"
 SRC_URI[sha256sum] = "97323cad619210845b696d7d722c383852b2acb5c49b5b0852c4f29c77a8145a"
 
-SRC_URI += "file://0001-Typo-in-fuser-makes-M-on-all-the-time.patch \
-            file://0002-Include-limits.h-for-PATH_MAX.patch \
-            "
+SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz \
+           file://0001-Typo-in-fuser-makes-M-on-all-the-time.patch \
+           file://0002-Include-limits.h-for-PATH_MAX.patch \
+           file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
+           "
-- 
1.9.1


