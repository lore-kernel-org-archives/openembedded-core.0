Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4F61778EFF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 13:47:23 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n1-v6so6218933wrt.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2018 06:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=eKOUWyUOxtEvGJrTEjSdCagp1Lx8whiaht9dr/35m3Y=;
	b=Fj1x+wQJJ54AfxchFXYOTd9SGjQhx5qw9yZHizZENh0SasD3PSqd+xi2kqneup2lTK
	vbiQHaunw2fmDHkKPt0qqnoA8YX4muCTPL+s5YqLBsXr46vRltEoMNq2wpL3w+R6s49+
	TJewZlppphE9gyDzSPUR38X7dL5P+/fX5foYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=eKOUWyUOxtEvGJrTEjSdCagp1Lx8whiaht9dr/35m3Y=;
	b=JqV6d+Uqjy+e9ysbq/X+dDWzoiWEcQyYB2D4QMSUfSNTC/9S0MsHw6Z7c6TfLqV4e/
	imaCf7xteawtkYuRz4Xe51yRzkP3xxxtg2QqC74stsnwjWsdQ+ZF9OZzmIsEaBhi+9T1
	m0QZLcva/tYXyPUPxsGllwe89knjPjH/VrekFgC51LXNFua55oz31jK7wTi7xtds5VpI
	ATImkZd80NsQdfUG/vnZ1KZaMi4xJgSoj6LHXK/IuUo962hZ1P/in/JxDNk9stDBdgbr
	2Mi6xNWnhrxpf5U5WNKL0XtIBo2vTyxBW3+kvid8rjWx8qJTJcxryqo2/8KuH8DTJB3V
	bMLQ==
X-Gm-Message-State: ABuFfohbR0MiapMqAXs/D3dkaiHwubEFUjKm8DI3DzHPVdm03POhjHq2
	qTIOrmANOEfcf41AuBmgr27oygYwqBE=
X-Google-Smtp-Source: ACcGV63c2dTZODREreng18xGSa9xETP0lM+DdRJKuz2zeRET2pPXJtKrsZubBcXi/Dt/T1PfXRdZIw==
X-Received: by 2002:a5d:434c:: with SMTP id
	u12-v6mr1445889wrr.189.1538574443462; 
	Wed, 03 Oct 2018 06:47:23 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v192-v6sm1658624wmf.40.2018.10.03.06.47.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 06:47:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2018 14:47:20 +0100
Message-Id: <20181003134720.20328-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] glibc: Fix glibc reproducibility issues
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
X-List-Received-Date: Wed, 03 Oct 2018 13:47:23 -0000

Currently for non-IA platforms, glibc is not reproducible as host system
paths are being injected into target binaries. These spread through
all target binaries on the system which link to the libc.

Add a patch which injects .file directives into the assembly pieces
and works around this issue until a better solution can be found.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...0034-inject-file-assembly-directives.patch | 259 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.28.bb         |   1 +
 2 files changed, 260 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0034-inject-file-assembly-directives.patch

diff --git a/meta/recipes-core/glibc/glibc/0034-inject-file-assembly-directives.patch b/meta/recipes-core/glibc/glibc/0034-inject-file-assembly-directives.patch
new file mode 100644
index 00000000000..3f9f8cf189d
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0034-inject-file-assembly-directives.patch
@@ -0,0 +1,259 @@
+Currently, non-IA builds are not reproducibile since build paths are 
+being injected into the debug symbols. These are coming from the use of
+.S assembler files during the glibc build. No STT_FILE section is added
+during the assembly but when linking, ld decides to add one to aid 
+debugging and ensure references between the different object files its
+linking remain clear.
+
+We can avoid this by injecting a file header into the assembler files
+ahead of time, choosing a filename which does not contain build system
+paths.
+
+This is a bit of a workaround/hack but does significantly reduce the
+build system references in target binaries for the non-IA architectures
+which use .S files.
+
+RP
+2018/10/3
+
+Upstream-Status: Pending
+
+diff --git a/csu/abi-note.S b/csu/abi-note.S
+index 5d0ca7803d..8ce41581b1 100644
+--- a/csu/abi-note.S
++++ b/csu/abi-note.S
+@@ -56,6 +56,8 @@ offset	length	contents
+ #include <config.h>
+ #include <abi-tag.h>		/* OS-specific ABI tag value */
+ 
++	.file "abi-note.S"
++
+ /* The linker (GNU ld 2.8 and later) recognizes an allocated section whose
+    name begins with `.note' and creates a PT_NOTE program header entry
+    pointing at it. */
+diff --git a/sysdeps/aarch64/crti.S b/sysdeps/aarch64/crti.S
+index 2b213758b2..736f33e314 100644
+--- a/sysdeps/aarch64/crti.S
++++ b/sysdeps/aarch64/crti.S
+@@ -50,6 +50,8 @@
+ # define PREINIT_FUNCTION_WEAK 1
+ #endif
+ 
++    .file "crti.S"
++
+ #if PREINIT_FUNCTION_WEAK
+ 	weak_extern (PREINIT_FUNCTION)
+ #else
+diff --git a/sysdeps/aarch64/crtn.S b/sysdeps/aarch64/crtn.S
+index d72300af80..cb249bf3ca 100644
+--- a/sysdeps/aarch64/crtn.S
++++ b/sysdeps/aarch64/crtn.S
+@@ -37,6 +37,8 @@
+ /* crtn.S puts function epilogues in the .init and .fini sections
+    corresponding to the prologues in crti.S. */
+ 
++	.file "crtn.S"
++
+ 	.section .init,"ax",%progbits
+ 	ldp	x29, x30, [sp], 16
+ 	RET
+diff --git a/sysdeps/aarch64/start.S b/sysdeps/aarch64/start.S
+index bad000f555..5957c028cd 100644
+--- a/sysdeps/aarch64/start.S
++++ b/sysdeps/aarch64/start.S
+@@ -18,6 +18,8 @@
+ 
+ #include <sysdep.h>
+ 
++	.file "start.S"
++
+ /* This is the canonical entry point, usually the first thing in the text
+    segment.
+ 
+diff --git a/sysdeps/unix/sysv/linux/aarch64/__read_tp.S b/sysdeps/unix/sysv/linux/aarch64/__read_tp.S
+index 92fc0191a5..715bfcb9e4 100644
+--- a/sysdeps/unix/sysv/linux/aarch64/__read_tp.S
++++ b/sysdeps/unix/sysv/linux/aarch64/__read_tp.S
+@@ -18,6 +18,8 @@
+ 
+ #include <sysdep.h>
+ 
++	.file "__read_tp.S"
++
+ 	.hidden __read_tp
+ ENTRY (__read_tp)
+ 	mrs	x0, tpidr_el0
+diff --git a/sysdeps/aarch64/dl-tlsdesc.S b/sysdeps/aarch64/dl-tlsdesc.S
+index 43a62ef307..42f85cdde9 100644
+--- a/sysdeps/aarch64/dl-tlsdesc.S
++++ b/sysdeps/aarch64/dl-tlsdesc.S
+@@ -22,6 +22,8 @@
+ #include <tls.h>
+ #include "tlsdesc.h"
+ 
++	.file "dl-tlsdesc.S"
++
+ #define NSAVEDQREGPAIRS	16
+ #define SAVE_Q_REGISTERS				\
+ 	stp	q0, q1,	[sp, #-32*NSAVEDQREGPAIRS]!;	\
+diff --git a/sysdeps/aarch64/dl-trampoline.S b/sysdeps/aarch64/dl-trampoline.S
+index a86d0722d4..92edab1d01 100644
+--- a/sysdeps/aarch64/dl-trampoline.S
++++ b/sysdeps/aarch64/dl-trampoline.S
+@@ -21,6 +21,8 @@
+ 
+ #include "dl-link.h"
+ 
++	.file "dl-trampoline.S"
++
+ #define ip0 x16
+ #define ip0l PTR_REG (16)
+ #define ip1 x17
+diff --git a/sysdeps/arm/abi-note.S b/sysdeps/arm/abi-note.S
+index 07bd4c4619..7213b16f27 100644
+--- a/sysdeps/arm/abi-note.S
++++ b/sysdeps/arm/abi-note.S
+@@ -1,3 +1,5 @@
++	.file "abi-note.S"
++
+ /* Tag_ABI_align8_preserved: This code preserves 8-byte
+    alignment in any callee.  */
+ 	.eabi_attribute 25, 1
+diff --git a/sysdeps/arm/crti.S b/sysdeps/arm/crti.S
+index a1424d0333..bca1dab256 100644
+--- a/sysdeps/arm/crti.S
++++ b/sysdeps/arm/crti.S
+@@ -57,6 +57,8 @@
+ 	.hidden PREINIT_FUNCTION
+ #endif
+ 
++    .file "crti.S"
++
+ #if PREINIT_FUNCTION_WEAK
+ 	.p2align 2
+ 	.type call_weak_fn, %function
+diff --git a/sysdeps/arm/crtn.S b/sysdeps/arm/crtn.S
+index 26027693ce..65a0502826 100644
+--- a/sysdeps/arm/crtn.S
++++ b/sysdeps/arm/crtn.S
+@@ -37,6 +37,8 @@
+ #define NO_THUMB
+ #include <sysdep.h>
+ 
++    .file "crtn.S"
++
+ /* crtn.S puts function epilogues in the .init and .fini sections
+    corresponding to the prologues in crti.S. */
+ 
+diff --git a/sysdeps/arm/dl-tlsdesc.S b/sysdeps/arm/dl-tlsdesc.S
+index 056e17d52d..a98c68dfb9 100644
+--- a/sysdeps/arm/dl-tlsdesc.S
++++ b/sysdeps/arm/dl-tlsdesc.S
+@@ -21,6 +21,8 @@
+ #include <tls.h>
+ #include "tlsdesc.h"
+ 
++	.file "dl-tlsdesc.S"
++
+ 	.text
+ 	@ emit debug information with cfi
+ 	@ use arm-specific pseudos for unwinding itself
+diff --git a/sysdeps/arm/dl-trampoline.S b/sysdeps/arm/dl-trampoline.S
+index c731b01286..4b37b25344 100644
+--- a/sysdeps/arm/dl-trampoline.S
++++ b/sysdeps/arm/dl-trampoline.S
+@@ -21,6 +21,8 @@
+ #include <sysdep.h>
+ #include <libc-symbols.h>
+ 
++	.file "dl-trampoline.S"
++
+ 	.text
+ 	.globl _dl_runtime_resolve
+ 	.type _dl_runtime_resolve, #function
+diff --git a/sysdeps/arm/start.S b/sysdeps/arm/start.S
+index adef090717..d22e4128e0 100644
+--- a/sysdeps/arm/start.S
++++ b/sysdeps/arm/start.S
+@@ -57,6 +57,8 @@
+ 					NULL
+ */
+ 
++	.file "start.S"
++
+ /* Tag_ABI_align8_preserved: This code preserves 8-byte
+    alignment in any callee.  */
+ 	.eabi_attribute 25, 1
+diff --git a/sysdeps/unix/sysv/linux/arm/aeabi_read_tp.S b/sysdeps/unix/sysv/linux/arm/aeabi_read_tp.S
+index 871702317a..20a942dbac 100644
+--- a/sysdeps/unix/sysv/linux/arm/aeabi_read_tp.S
++++ b/sysdeps/unix/sysv/linux/arm/aeabi_read_tp.S
+@@ -39,6 +39,8 @@
+    a normal function call) in a high page of memory; tail call to the
+    helper.  */
+ 
++	.file "aeabi_read_tp.S"
++
+ 	.hidden __aeabi_read_tp
+ ENTRY (__aeabi_read_tp)
+ #ifdef ARCH_HAS_HARD_TP
+diff --git a/sysdeps/mips/start.S b/sysdeps/mips/start.S
+index a4c4ef0fae..d00fff31a8 100644
+--- a/sysdeps/mips/start.S
++++ b/sysdeps/mips/start.S
+@@ -38,6 +38,8 @@
+ #include <sgidefs.h>
+ #include <sys/asm.h>
+ 
++	.file "start.S"
++
+ #ifndef ENTRY_POINT
+ #error ENTRY_POINT needs to be defined for start.S on MIPS/ELF.
+ #endif
+diff --git a/sysdeps/unix/sysv/linux/powerpc/dl-brk.S b/sysdeps/unix/sysv/linux/powerpc/dl-brk.S
+index eeb96544e3..da182b28f8 100644
+--- a/sysdeps/unix/sysv/linux/powerpc/dl-brk.S
++++ b/sysdeps/unix/sysv/linux/powerpc/dl-brk.S
+@@ -1 +1,3 @@
++	.file "dl-brk.S"
++
+ #include <brk.S>
+diff --git a/sysdeps/powerpc/powerpc32/start.S b/sysdeps/powerpc/powerpc32/start.S
+index 5c10a22f8a..2b52627f27 100644
+--- a/sysdeps/powerpc/powerpc32/start.S
++++ b/sysdeps/powerpc/powerpc32/start.S
+@@ -35,6 +35,8 @@
+ 
+ #include <sysdep.h>
+ 
++	.file "start.S"
++
+ /* We do not want .eh_frame info for crt1.o since crt1.o is linked
+    before crtbegin.o, the file defining __EH_FRAME_BEGIN__.  */
+ #undef cfi_startproc
+diff --git a/sysdeps/powerpc/powerpc64/start.S b/sysdeps/powerpc/powerpc64/start.S
+index bd7189310c..2e22b8472d 100644
+--- a/sysdeps/powerpc/powerpc64/start.S
++++ b/sysdeps/powerpc/powerpc64/start.S
+@@ -35,6 +35,8 @@
+ 
+ #include <sysdep.h>
+ 
++	.file "start.S"
++
+ /* We do not want .eh_frame info for crt1.o since crt1.o is linked
+    before crtbegin.o, the file defining __EH_FRAME_BEGIN__.  */
+ #undef cfi_startproc
+diff --git a/sysdeps/powerpc/powerpc32/dl-start.S b/sysdeps/powerpc/powerpc32/dl-start.S
+index 244d87fb6d..14d3e2ce14 100644
+--- a/sysdeps/powerpc/powerpc32/dl-start.S
++++ b/sysdeps/powerpc/powerpc32/dl-start.S
+@@ -18,6 +18,8 @@
+ 
+ #include <sysdep.h>
+ 
++	.file "dl-start.S"
++
+ /* Initial entry point code for the dynamic linker.
+    The C function `_dl_start' is the real entry point;
+    its return value is the user program's entry point.	*/
diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glibc/glibc_2.28.bb
index bd8b51e1d66..d0729392547 100644
--- a/meta/recipes-core/glibc/glibc_2.28.bb
+++ b/meta/recipes-core/glibc/glibc_2.28.bb
@@ -48,6 +48,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors-w.patch \
            file://0032-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch \
            file://0033-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
+           file://0034-inject-file-assembly-directives.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.17.1


