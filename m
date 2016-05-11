Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 02F3273218
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:22 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id i5so4047824pag.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=8i+rfuUa6GQmOpDWsxci4kB3NmQL1INUD/if0yKXmRE=;
	b=DKFWgtykWH5SSfcDPiXOuaI8uVgAmhajP/bOWFGdr4l4x834cHKjm8VAMWydh0nczg
	rDMibI/sN0gQxYj+J8EHwBKwj02eXiDRV85cYu0Hv+b1lnTaZY4TRv4AJIMRzw+kCqUN
	AmrczbLWDydC629HiGDmAzVtsT2j7qxTHT/duuot1VCtpbTBLw0rP+vcpoKiL6N89OVT
	bpfJybxApX0vyppZKv2tvaxgsbMJDbU8TLeP7p1/DAl+OarwF6enBIrUS+x39If6U/4W
	oAhKti7+Fj3GpHluIiTWUzug9fae8F9XbgBN6fQFd6/jEhxg5x3kRf6hvEl904TsF2h9
	aOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=8i+rfuUa6GQmOpDWsxci4kB3NmQL1INUD/if0yKXmRE=;
	b=e0n4Pf6OweBMwzv4fNquccDZLbh/gEsp9NV9qFbLAjvYI6ATkmUimvSVxNZ1VxtGBL
	Bns+U8bXzBgQOuiq1WkOprqLWFH9PulKbbjYsTZuU0gLINqhqM1Lrpd0wZUzoycc82Xn
	29mGX88hXuG69pZuYQ2mDBd0SE2lU13I5PTQTOANsQrnUKwB2AfmTk+gMzCSLzCp1rGZ
	si9RPmj0LzTQ0GOkWGRIUsX4SfhCaiOTwzQphlNtzAoy7eJCYXTIQfX6r+D7C5J0q4BX
	BOi6cK8rk6Jvkn+fIyfMeZM81ME0U7S9WxIjMKA2U+wqIgCniOAvcbYKckmo4Ft/wpco
	1ZLw==
X-Gm-Message-State: AOPr4FVaCDGyh6XyT7x5GzMiBlTcJiSvOoU9u/KsebjtFNTEcB6V0lq8XCqFLx2MBQpqUQ==
X-Received: by 10.66.177.75 with SMTP id co11mr6817664pac.85.1462988182899;
	Wed, 11 May 2016 10:36:22 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:34 -0700
Message-Id: <696b95236aee7a0d927838ede57ac33d57c3eeec.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 31/42] gdb,strace: Fix builds on ppc/musl
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
X-List-Received-Date: Wed, 11 May 2016 17:36:22 -0000

ptrace namespace is polluted in glibc for ppc
which is highlighted with musl, these fixes
tries to undo it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb.inc                  | 16 ++++---
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 52 ++++++++++++++++++++++
 ...hen-using-non-glibc-libc-implementation-o.patch | 36 +++++++++++++++
 meta/recipes-devtools/strace/strace_4.11.bb        |  3 +-
 4 files changed, 99 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
 create mode 100644 meta/recipes-devtools/strace/strace/0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index d9c864d..5a2067e 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -2,13 +2,15 @@ require gdb-common.inc
 
 inherit gettext
 
-SRC_URI += "file://0002-Change-order-of-CFLAGS.patch \
-            file://0003-Add-support-for-Renesas-SH-sh4-architecture.patch \
-            file://0001-Use-exported-definitions-of-SIGRTMIN.patch \
-            file://0001-include-sys-types.h-for-mode_t.patch \
-            file://0001-use-asm-sgidefs.h.patch \
-            file://force-readline-static.patch \
-            file://0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch \
+SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.gz \
+           file://0002-Change-order-of-CFLAGS.patch \
+           file://0003-Add-support-for-Renesas-SH-sh4-architecture.patch \
+           file://0001-Use-exported-definitions-of-SIGRTMIN.patch \
+           file://0001-include-sys-types.h-for-mode_t.patch \
+           file://0001-use-asm-sgidefs.h.patch \
+           file://force-readline-static.patch \
+           file://0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch \
+           file://0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch \
            "
 #LDFLAGS_append = " -s"
 #export CFLAGS_append=" -L${STAGING_LIBDIR}"
diff --git a/meta/recipes-devtools/gdb/gdb/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/meta/recipes-devtools/gdb/gdb/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
new file mode 100644
index 0000000..342f1ce
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -0,0 +1,52 @@
+From 33a2cdb731298b73277507f01b9a21cd340c5b5c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Apr 2016 16:46:03 +0000
+Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gdb/gdbserver/linux-ppc-low.c | 6 ++++++
+ gdb/nat/ppc-linux.h           | 6 ++++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/gdb/gdbserver/linux-ppc-low.c b/gdb/gdbserver/linux-ppc-low.c
+index 188fac0..f71d5ab 100644
+--- a/gdb/gdbserver/linux-ppc-low.c
++++ b/gdb/gdbserver/linux-ppc-low.c
+@@ -21,7 +21,13 @@
+ #include "linux-low.h"
+ 
+ #include <elf.h>
++#if !defined(__GLIBC__)
++# define pt_regs uapi_pt_regs
++#endif
+ #include <asm/ptrace.h>
++#if !defined(__GLIBC__)
++# undef pt_regs
++#endif
+ 
+ #include "nat/ppc-linux.h"
+ 
+diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
+index 0ff2223..c978daa 100644
+--- a/gdb/nat/ppc-linux.h
++++ b/gdb/nat/ppc-linux.h
+@@ -18,7 +18,13 @@
+ #ifndef PPC_LINUX_H
+ #define PPC_LINUX_H 1
+ 
++#if !defined(__GLIBC__)
++# define pt_regs uapi_pt_regs
++#endif
+ #include <asm/ptrace.h>
++#if !defined(__GLIBC__)
++# undef pt_regs
++#endif
+ #include <asm/cputable.h>
+ 
+ /* This sometimes isn't defined.  */
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/strace/strace/0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch b/meta/recipes-devtools/strace/strace/0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch
new file mode 100644
index 0000000..7f59210
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch
@@ -0,0 +1,36 @@
+From 1f0c22b79045cfcdc976643f383c1d09589d3087 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Apr 2016 16:23:56 +0000
+Subject: [PATCH] Fix build when using non-glibc libc implementation on ppc
+
+glibc includes the kernel header into its own header for macros
+musl does not
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ptrace.h | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/ptrace.h b/ptrace.h
+index d8af976..4978a69 100644
+--- a/ptrace.h
++++ b/ptrace.h
+@@ -52,7 +52,13 @@ extern long ptrace(int, int, char *, long);
+ # define ptrace_peeksiginfo_args XXX_ptrace_peeksiginfo_args
+ #endif
+ 
+-#include <linux/ptrace.h>
++#if defined(POWERPC) && !defined(__GLIBC__)
++#define pt_regs uapi_pt_regs
++#endif
++# include <linux/ptrace.h>
++#if defined(POWERPC) && !defined(__GLIBC__)
++# undef pt_regs
++#endif
+ 
+ #ifdef HAVE_STRUCT_IA64_FPREG
+ # undef ia64_fpreg
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/strace/strace_4.11.bb b/meta/recipes-devtools/strace/strace_4.11.bb
index a787df2..7e349ef 100644
--- a/meta/recipes-devtools/strace/strace_4.11.bb
+++ b/meta/recipes-devtools/strace/strace_4.11.bb
@@ -16,7 +16,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://0001-Move-gcc-compat-macros-to-gcc_compat.h.patch \
            file://0001-tests-introduce-libtests.patch \
            file://run-ptest \
-          "
+           file://0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch \
+           "
 
 SRC_URI[md5sum] = "a15d2555a7febb56d00c6e1a51c655dc"
 SRC_URI[sha256sum] = "e86a5f6cd8f941f67f3e4b28f4e60f3d9185c951cf266404533210a2e5cd8152"
-- 
2.8.2


