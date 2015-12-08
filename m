Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id C3974605BB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 08:12:40 +0000 (UTC)
Received: by qgeb1 with SMTP id b1so10086581qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 00:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=hMG9vBlhyP/+fz0B02mutYOCsl6t3KSdkbbrF5MGylw=;
	b=gO2zSQa4HBVt8PCsJ+aeUmQV4pk1yqH9C12X4ZZSKT5kI1O3jbj2UZqDn5aN1lY3iG
	NWOYEKZ3swErUwVtJRUYB13omczVf7kA0lwAtsbLF1Ualdjtk2lvd+KPKZtvrTTTQbIl
	Ju+vGsT8Ofdcc7vjHIUjMLrWgo1iw42JgiSufQBCtftgTJJdVs9QsTEBwZRAV4B139HU
	NQvCAVjZEu9Y5qnqpgaKxPBQJQywNoqOuW1xT6mhGQY0rRDdE5avObojxx3eaNEGFUOG
	EJF41YaSydgTRjoi8hCOO7kajot9zRuJ3T6KmGnjfAKGzSa9Yf4yQ/mnbL2U/zRYpskh
	M2RA==
X-Received: by 10.140.94.243 with SMTP id g106mr2770352qge.57.1449562361051;
	Tue, 08 Dec 2015 00:12:41 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	v66sm1023174qkv.32.2015.12.08.00.12.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Dec 2015 00:12:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 08:12:23 +0000
Message-Id: <c39d1e3f36ab0e87c4a9e270516910ecc76424f2.1449562195.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <bb86e885996a2878e8d8d8e128f9b9b724ed0227.1449562195.git.raj.khem@gmail.com>
References: <bb86e885996a2878e8d8d8e128f9b9b724ed0227.1449562195.git.raj.khem@gmail.com>
In-Reply-To: <cover.1449562195.git.raj.khem@gmail.com>
References: <cover.1449562195.git.raj.khem@gmail.com>
Subject: [PATCH 03/13] gdb: Fix build with musl
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
X-List-Received-Date: Tue, 08 Dec 2015 08:12:40 -0000

This is a patch that has been submitted upstream as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb.inc                  |  1 +
 ...0001-Use-exported-definitions-of-SIGRTMIN.patch | 54 ++++++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0001-Use-exported-definitions-of-SIGRTMIN.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 88c0213..2162cad 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -5,6 +5,7 @@ inherit gettext
 SRC_URI += "file://0002-Change-order-of-CFLAGS.patch \
             file://0003-Add-support-for-Renesas-SH-sh4-architecture.patch \
             file://fix-detection-of-64-bit-PPC-inferior-in-gdbserver.patch \
+            file://0001-Use-exported-definitions-of-SIGRTMIN.patch \
            "
 #LDFLAGS_append = " -s"
 #export CFLAGS_append=" -L${STAGING_LIBDIR}"
diff --git a/meta/recipes-devtools/gdb/gdb/0001-Use-exported-definitions-of-SIGRTMIN.patch b/meta/recipes-devtools/gdb/gdb/0001-Use-exported-definitions-of-SIGRTMIN.patch
new file mode 100644
index 0000000..5f0c096
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0001-Use-exported-definitions-of-SIGRTMIN.patch
@@ -0,0 +1,54 @@
+From 2f97e89e9e4e5797d0d973e1d05c1f44c46b4912 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 5 Jun 2015 20:21:38 -0700
+Subject: [PATCH] Use exorted definitions of SIGRTMIN
+
+Define W_STOPCODE if not defined already
+
+__SIGRTMIN is internal to glibc and other libcs e.g. musl
+may not provide them
+
+Fixes
+https://sourceware.org/bugzilla/show_bug.cgi?id=13012
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ gdb/linux-nat.c     | 4 ++--
+ gdb/nat/linux-nat.h | 4 ++++
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/gdb/linux-nat.c b/gdb/linux-nat.c
+index 396c30c..50320ee 100644
+--- a/gdb/linux-nat.c
++++ b/gdb/linux-nat.c
+@@ -4856,10 +4856,10 @@ lin_thread_get_thread_signals (sigset_t *set)
+      fortunately they don't change!  */
+ 
+   if (restart == 0)
+-    restart = __SIGRTMIN;
++    restart = SIGRTMIN;
+ 
+   if (cancel == 0)
+-    cancel = __SIGRTMIN + 1;
++    cancel = SIGRTMIN + 1;
+ 
+   sigaddset (set, restart);
+   sigaddset (set, cancel);
+diff --git a/gdb/nat/linux-nat.h b/gdb/nat/linux-nat.h
+index 83a6d91..efbe0fd 100644
+--- a/gdb/nat/linux-nat.h
++++ b/gdb/nat/linux-nat.h
+@@ -25,4 +25,8 @@
+    instead SIGTRAP with bit 7 set.  */
+ #define SYSCALL_SIGTRAP (SIGTRAP | 0x80)
+ 
++#ifndef W_STOPCODE
++#define W_STOPCODE(sig) ((sig) << 8 | 0x7f)
++#endif
++
+ #endif /* LINUX_NAT_H */
+-- 
+2.1.4
+
-- 
2.6.3


