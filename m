Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.1075.1611991202298218748
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 23:20:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jHH8Shl7;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id a20so6956019pjs.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 23:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5DnA601N06nxloKklw1S1JJjAodASbj20vdfZu1u+uw=;
        b=jHH8Shl74/BS72teN6F9QnEL+6M3TOi6D4LvlnlBXJ+ZyJXzD7VnN0HEMIlW3EgMtm
         fLZlZMuipgWDmLDpSj+tILPXR2XlRdd0j8O/tUZWNy7zNpHawG5NBBbaa9ultZAZKW2U
         E26dyVnDwD2kPDV07j6Orl3SNbKRWW4P/60E4DrfWml6VMbsM+vdADLGwXc3pOVK/Xp0
         GjZ0/5NYYdcTDnux5vyKeqSL0AtYdSeezIMa3cchMquKwR2SZ+WrypVF6eydT/C7INUz
         f58zhdIS5DTuAASL+G1gjZDa0oc1DheaQfe2giTMcmR8CCfZgzj/PDZZkACnQA71HZHb
         nKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5DnA601N06nxloKklw1S1JJjAodASbj20vdfZu1u+uw=;
        b=LvCnw2P7VS1yOxclG+wI7Os3i67eQcm8CbRusFXa9l8o7qi5a3p4++yIj7S+vEdpm0
         /BAZui7GuS600y2pJkRhGxPS9zv+C0++JJ606KAYh56/bpxMNxz4S0j7nHJtlNTAM5uk
         2i4Erv46YMQvPhp8j/9TnSRTf70DT/FwKHr/56oSrGSf3mblnvQwVOmb5ZbkDFz0e0KB
         skAh0u2ygUrxS8WTYKvgLyiFKwowgfq2vwabSr4k62lZMDQTqeDV6JFWW7Rnul/PGq6q
         85bOGdNHuockyTdFRUjNpu+cX1twLrjZM8uETFhjpOC/8kt29SU/IW+PER6Z9Y+9vtCg
         yVVA==
X-Gm-Message-State: AOAM532MZ2jMdu0KEDRMSieiwIgscLARzkHOfXv0fdiHEOjaXS8BMW8Z
	H/Fvx/JLjhYCCGJUdbHXrnqh0ABBeaDdXA==
X-Google-Smtp-Source: ABdhPJwTtNEfXvZrOMxDcWW9sOROxcLz1ryaPWZIxZSHzofFeAJYhAzSNot3fdhjpZTJs3L5//s5cQ==
X-Received: by 2002:a17:90a:5d02:: with SMTP id s2mr7758779pji.149.1611991201496;
        Fri, 29 Jan 2021 23:20:01 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9296])
        by smtp.gmail.com with ESMTPSA id m18sm10797221pfd.206.2021.01.29.23.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 23:20:01 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/5] glibc: Drop adding .file directive in asm files
Date: Fri, 29 Jan 2021 23:19:53 -0800
Message-Id: <20210130071954.2695419-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210130071954.2695419-1-raj.khem@gmail.com>
References: <20210130071954.2695419-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

it was a workaround for binutils issue which is fixed in 2.36 with

https://sourceware.org/bugzilla/show_bug.cgi?id=26822

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0026-inject-file-assembly-directives.patch | 244 ------------------
 meta/recipes-core/glibc/glibc_2.32.bb         |   1 -
 2 files changed, 245 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0026-inject-file-assembly-directives.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-inject-file-assembly-directives.patch b/meta/recipes-core/glibc/glibc/0026-inject-file-assembly-directives.patch
deleted file mode 100644
index 5137fedb7b..0000000000
--- a/meta/recipes-core/glibc/glibc/0026-inject-file-assembly-directives.patch
+++ /dev/null
@@ -1,244 +0,0 @@
-From cf043d56638883157dbfaa8c6a8e2f63a6f66280 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 29 Nov 2018 17:29:35 -0800
-Subject: [PATCH 26/29] inject file assembly directives
-
-Currently, non-IA builds are not reproducibile since build paths are
-being injected into the debug symbols. These are coming from the use of
-.S assembler files during the glibc build. No STT_FILE section is added
-during the assembly but when linking, ld decides to add one to aid
-debugging and ensure references between the different object files its
-linking remain clear.
-
-We can avoid this by injecting a file header into the assembler files
-ahead of time, choosing a filename which does not contain build system
-paths.
-
-This is a bit of a workaround/hack but does significantly reduce the
-build system references in target binaries for the non-IA architectures
-which use .S files.
-
-RP
-2018/10/3
-
-fixed in binutils 2.36 [1]
-
-[1] https://sourceware.org/bugzilla/show_bug.cgi?id=26822
-
-Upstream-Status: OE-Specific [ Drop when upgrading binutils 2.36+ ]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- csu/abi-note.c                                | 2 ++
- sysdeps/aarch64/crti.S                        | 2 ++
- sysdeps/aarch64/crtn.S                        | 1 +
- sysdeps/aarch64/dl-tlsdesc.S                  | 2 ++
- sysdeps/aarch64/dl-trampoline.S               | 2 ++
- sysdeps/aarch64/start.S                       | 2 ++
- sysdeps/arm/crti.S                            | 2 ++
- sysdeps/arm/crtn.S                            | 2 ++
- sysdeps/arm/dl-tlsdesc.S                      | 2 ++
- sysdeps/arm/dl-trampoline.S                   | 2 ++
- sysdeps/arm/start.S                           | 2 ++
- sysdeps/mips/start.S                          | 2 ++
- sysdeps/powerpc/powerpc32/dl-start.S          | 2 ++
- sysdeps/powerpc/powerpc32/start.S             | 2 ++
- sysdeps/powerpc/powerpc64/start.S             | 2 ++
- sysdeps/unix/sysv/linux/aarch64/__read_tp.S   | 2 ++
- sysdeps/unix/sysv/linux/arm/aeabi_read_tp.S   | 2 ++
- sysdeps/unix/sysv/linux/arm/libc-do-syscall.S | 2 ++
- sysdeps/unix/sysv/linux/powerpc/dl-brk.S      | 2 ++
- 19 files changed, 37 insertions(+)
-
---- a/sysdeps/aarch64/crti.S
-+++ b/sysdeps/aarch64/crti.S
-@@ -50,6 +50,8 @@
- # define PREINIT_FUNCTION_WEAK 1
- #endif
- 
-+    .file "crti.S"
-+
- #if PREINIT_FUNCTION_WEAK
- 	weak_extern (PREINIT_FUNCTION)
- #else
---- a/sysdeps/aarch64/crtn.S
-+++ b/sysdeps/aarch64/crtn.S
-@@ -38,6 +38,7 @@
-    corresponding to the prologues in crti.S. */
- 
- #include <sysdep.h>
-+	.file "crtn.S"
- 
- 	.section .init,"ax",%progbits
- 	ldp	x29, x30, [sp], 16
---- a/sysdeps/aarch64/dl-tlsdesc.S
-+++ b/sysdeps/aarch64/dl-tlsdesc.S
-@@ -22,6 +22,8 @@
- #include <tls.h>
- #include "tlsdesc.h"
- 
-+	.file "dl-tlsdesc.S"
-+
- #define NSAVEDQREGPAIRS	16
- #define SAVE_Q_REGISTERS				\
- 	stp	q0, q1,	[sp, #-32*NSAVEDQREGPAIRS]!;	\
---- a/sysdeps/aarch64/dl-trampoline.S
-+++ b/sysdeps/aarch64/dl-trampoline.S
-@@ -21,6 +21,8 @@
- 
- #include "dl-link.h"
- 
-+	.file "dl-trampoline.S"
-+
- #define ip0 x16
- #define ip0l PTR_REG (16)
- #define ip1 x17
---- a/sysdeps/aarch64/start.S
-+++ b/sysdeps/aarch64/start.S
-@@ -18,6 +18,8 @@
- 
- #include <sysdep.h>
- 
-+	.file "start.S"
-+
- /* This is the canonical entry point, usually the first thing in the text
-    segment.
- 
---- a/sysdeps/arm/crti.S
-+++ b/sysdeps/arm/crti.S
-@@ -57,6 +57,8 @@
- 	.hidden PREINIT_FUNCTION
- #endif
- 
-+    .file "crti.S"
-+
- #if PREINIT_FUNCTION_WEAK
- 	.p2align 2
- 	.type call_weak_fn, %function
---- a/sysdeps/arm/crtn.S
-+++ b/sysdeps/arm/crtn.S
-@@ -37,6 +37,8 @@
- #define NO_THUMB
- #include <sysdep.h>
- 
-+    .file "crtn.S"
-+
- /* crtn.S puts function epilogues in the .init and .fini sections
-    corresponding to the prologues in crti.S. */
- 
---- a/sysdeps/arm/dl-tlsdesc.S
-+++ b/sysdeps/arm/dl-tlsdesc.S
-@@ -21,6 +21,8 @@
- #include <tls.h>
- #include "tlsdesc.h"
- 
-+	.file "dl-tlsdesc.S"
-+
- 	.text
- 	@ emit debug information with cfi
- 	@ use arm-specific pseudos for unwinding itself
---- a/sysdeps/arm/dl-trampoline.S
-+++ b/sysdeps/arm/dl-trampoline.S
-@@ -21,6 +21,8 @@
- #include <sysdep.h>
- #include <libc-symbols.h>
- 
-+	.file "dl-trampoline.S"
-+
- 	.text
- 	.globl _dl_runtime_resolve
- 	.type _dl_runtime_resolve, #function
---- a/sysdeps/arm/start.S
-+++ b/sysdeps/arm/start.S
-@@ -57,6 +57,8 @@
- 					NULL
- */
- 
-+	.file "start.S"
-+
- /* Tag_ABI_align8_preserved: This code preserves 8-byte
-    alignment in any callee.  */
- 	.eabi_attribute 25, 1
---- a/sysdeps/mips/start.S
-+++ b/sysdeps/mips/start.S
-@@ -38,6 +38,8 @@
- #include <sgidefs.h>
- #include <sys/asm.h>
- 
-+	.file "start.S"
-+
- #ifndef ENTRY_POINT
- #error ENTRY_POINT needs to be defined for start.S on MIPS/ELF.
- #endif
---- a/sysdeps/powerpc/powerpc32/dl-start.S
-+++ b/sysdeps/powerpc/powerpc32/dl-start.S
-@@ -18,6 +18,8 @@
- 
- #include <sysdep.h>
- 
-+	.file "dl-start.S"
-+
- /* Initial entry point code for the dynamic linker.
-    The C function `_dl_start' is the real entry point;
-    its return value is the user program's entry point.	*/
---- a/sysdeps/powerpc/powerpc32/start.S
-+++ b/sysdeps/powerpc/powerpc32/start.S
-@@ -35,6 +35,8 @@
- 
- #include <sysdep.h>
- 
-+	.file "start.S"
-+
- /* We do not want .eh_frame info for crt1.o since crt1.o is linked
-    before crtbegin.o, the file defining __EH_FRAME_BEGIN__.  */
- #undef cfi_startproc
---- a/sysdeps/powerpc/powerpc64/start.S
-+++ b/sysdeps/powerpc/powerpc64/start.S
-@@ -35,6 +35,8 @@
- 
- #include <sysdep.h>
- 
-+	.file "start.S"
-+
- /* We do not want .eh_frame info for crt1.o since crt1.o is linked
-    before crtbegin.o, the file defining __EH_FRAME_BEGIN__.  */
- #undef cfi_startproc
---- a/sysdeps/unix/sysv/linux/aarch64/__read_tp.S
-+++ b/sysdeps/unix/sysv/linux/aarch64/__read_tp.S
-@@ -18,6 +18,8 @@
- 
- #include <sysdep.h>
- 
-+	.file "__read_tp.S"
-+
- 	.hidden __read_tp
- ENTRY (__read_tp)
- 	mrs	x0, tpidr_el0
---- a/sysdeps/unix/sysv/linux/arm/aeabi_read_tp.S
-+++ b/sysdeps/unix/sysv/linux/arm/aeabi_read_tp.S
-@@ -39,6 +39,8 @@
-    a normal function call) in a high page of memory; tail call to the
-    helper.  */
- 
-+	.file "aeabi_read_tp.S"
-+
- 	.hidden __aeabi_read_tp
- ENTRY (__aeabi_read_tp)
- #ifdef ARCH_HAS_HARD_TP
---- a/sysdeps/unix/sysv/linux/arm/libc-do-syscall.S
-+++ b/sysdeps/unix/sysv/linux/arm/libc-do-syscall.S
-@@ -27,6 +27,8 @@
-    ARM unwind tables for register to register moves, the actual opcodes
-    are not defined.  */
- 
-+      .file "libc-do-syscall.S"
-+
- #if defined(__thumb__)
- 	.thumb
- 	.syntax unified
---- a/sysdeps/unix/sysv/linux/powerpc/dl-brk.S
-+++ b/sysdeps/unix/sysv/linux/powerpc/dl-brk.S
-@@ -1 +1,3 @@
-+	.file "dl-brk.S"
-+
- #include <brk.S>
diff --git a/meta/recipes-core/glibc/glibc_2.32.bb b/meta/recipes-core/glibc/glibc_2.32.bb
index edf196c428..2d9c707a0b 100644
--- a/meta/recipes-core/glibc/glibc_2.32.bb
+++ b/meta/recipes-core/glibc/glibc_2.32.bb
@@ -38,7 +38,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
            file://0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
            file://0025-intl-Emit-no-lines-in-bison-generated-files.patch \
-           file://0026-inject-file-assembly-directives.patch \
            file://0027-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
            file://0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
            file://0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
-- 
2.30.0

