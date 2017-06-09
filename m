Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 47F9378267
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 03:41:49 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id f127so6450556pgc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 20:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version:in-reply-to
	:references:content-transfer-encoding;
	bh=5FMFRxdl++jGGcOwPBfQz9/BZgHAFuIJj6IZUJZwVNc=;
	b=cyZikBT0mw1BH1Nwe8+DrmsSSJ+miKvQExsVXm7EPXGUqTsg2vAMwFQUFdkLNiDwOf
	Ifo05xNA/nyK00HJpwNLHBcgzhUwXKrXKk1NjneuZ9+qckYVi9t2jltM4c13Lz0b3gUj
	zGD8ETruoNBYavGcODghhGm/987roR1MpuEExGR2OwWA1jKr7fpblqicMeQ9NuehD6UG
	OUPiL0KZfk2AwLCYG2bjih5a0dnPK9dLNcYEJq27aBO2/gUDFQrmIKl0Z11a+IidYufq
	W72VVA55mHjZwgt98hIGd9FNJbr2r31ZRkKYXoJgpFx46zo6TV5TcK+eueWRdwfMCsGN
	gy/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=5FMFRxdl++jGGcOwPBfQz9/BZgHAFuIJj6IZUJZwVNc=;
	b=TMdWqGOulDCzfS5j4W+A4RqY3VrreMOIIY0qSp3lM1VpUaKHdSIFxCxoW45R8Ytb7n
	047+ztEGZYkA/UXPSXsumop27bE4wvkhcI+EvD3wCsjHMNjmdL00c+lIyOtQhVVJGQeO
	hJvtacE6jxgUJ81wFHEMAh4uRnDVxtT0naNzrU84XK7cWDndmp+IRrUYuaHR+R5nUyC1
	80SzY+uXWvZRLjxrbwUc/ptRVOwVN9594pBdCfNPmz31pzd0zcWTq2RTD3DkwCZHsyJv
	ZX2zAg+plQ2nmgMs0WtCkDokFzVqFUWrlKznbY+SmULkQxu+dfTdutQC+2uIDFLp8EZH
	7Csw==
X-Gm-Message-State: AODbwcD3jx71555sI6FZOk6LTLX5zPozKNYF1WMMdAowUUv6tDVxcuid
	2pyxo29mDH9sSxBG
X-Received: by 10.99.4.87 with SMTP id 84mr42182572pge.138.1496979710196;
	Thu, 08 Jun 2017 20:41:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id
	z64sm12587357pfd.20.2017.06.08.20.41.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jun 2017 20:41:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 20:41:35 -0700
Message-Id: <fa11b6f263bca441adf54708b56659d7a51124f5.1496979431.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
MIME-Version: 1.0
In-Reply-To: <cover.1496979431.git.raj.khem@gmail.com>
References: <cover.1496979431.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] rng-tools: Fix textrels on 32bit x86
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
X-List-Received-Date: Fri, 09 Jun 2017 03:41:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When testing core-image-sato with hardening flags, it fails with
SIGSEGV in libc.so during relocation time

This is due to relocations in .text [textrel]
build QA points it out clearly during qemux86 build as well

AssertionError: 2 != 0 : Log: /mnt/a/oe/build/tmp/work/qemux86-bec-linux-musl/core-image-sato/1.0-r0/dmesg_output.log
-----------------------
Central error: [   19.043597] rngd[525]: segfault at 80098bb7 ip b77b14fc sp bfe9b380 error 7 in libc.so[b774c000+97000]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../rng-tools-5-fix-textrels-on-PIC-x86.patch      | 104 +++++++++++++++++++++
 meta/recipes-support/rng-tools/rng-tools_5.bb      |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/rng-tools-5-fix-textrels-on-PIC-x86.patch

diff --git a/meta/recipes-support/rng-tools/rng-tools/rng-tools-5-fix-textrels-on-PIC-x86.patch b/meta/recipes-support/rng-tools/rng-tools/rng-tools-5-fix-textrels-on-PIC-x86.patch
new file mode 100644
index 0000000000..90c9d8c515
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/rng-tools-5-fix-textrels-on-PIC-x86.patch
@@ -0,0 +1,104 @@
+From: Francisco Blas Izquierdo Riera (klondike) <klondike@gentoo.org>
+Subject: [PATCH] Fix assemby textrels on rdrand_asm.S on PIC x86
+
+This patch updates the fixes in the assembly in rdrand_asm.S in
+sys-apps/rng-tools-5 so it won't generate textrels on PIC systems.
+The main fixes are in the use of leal in SETPTR for such systems, the rest is
+the usual PIC support stuff.
+
+This should fix Gentoo bug #469962 and help fix #518210
+
+This patch is released under the GPLv2 or a higher version license as is the
+original file as long as the author and the tester are credited.
+
+Gentoo-bug-url: https://bugs.gentoo.org/show_bug.cgi?id=469962
+Gentoo-bug-url: https://bugs.gentoo.org/show_bug.cgi?id=518210
+Upstream-status: Not sent yet
+Signed-off-by: Francisco Blas Izquierdo Riera (klondike) <klondike@gentoo.org>
+Reported-by: cilly <cilly@cilly.mine.nu>
+Reported-by: Manuel Rüger <mrueg@gentoo.org>
+Tested-by: Anthony Basile <blueness@gentoo.org>
+
+Upstream-Status: Pending
+
+Index: rng-tools-5/rdrand_asm.S
+===================================================================
+--- rng-tools-5.orig/rdrand_asm.S
++++ rng-tools-5/rdrand_asm.S
+@@ -2,6 +2,7 @@
+  * Copyright (c) 2011-2014, Intel Corporation
+  * Authors: Fenghua Yu <fenghua.yu@intel.com>,
+  *          H. Peter Anvin <hpa@linux.intel.com>
++ * PIC code by: Francisco Blas Izquierdo Riera (klondike) <klondike@gentoo.org>
+  *
+  * This program is free software; you can redistribute it and/or modify it
+  * under the terms and conditions of the GNU General Public License,
+@@ -174,7 +175,19 @@ ENTRY(x86_rdseed_or_rdrand_bytes)
+ 	jmp	4b
+ ENDPROC(x86_rdseed_or_rdrand_bytes)
+ 
++#if defined(__PIC__)
++#define INIT_PIC() \
++	pushl	%ebx ; \
++	call    __x86.get_pc_thunk.bx ; \
++	addl    $_GLOBAL_OFFSET_TABLE_, %ebx
++#define END_PIC() \
++	popl	%ebx
++#define SETPTR(var,ptr) leal (var)@GOTOFF(%ebx),ptr
++#else
++#define INIT_PIC()
++#define END_PIC()
+ #define SETPTR(var,ptr)	movl $(var),ptr
++#endif
+ #define PTR0	%eax
+ #define PTR1	%edx
+ #define PTR2	%ecx
+@@ -190,6 +203,7 @@ ENTRY(x86_aes_mangle)
+ 	movl	8(%ebp), %eax
+ 	movl	12(%ebp), %edx
+ 	push	%esi
++	INIT_PIC()
+ #endif
+ 	movl	$512, CTR3	/* Number of rounds */
+ 	
+@@ -280,6 +294,7 @@ offset = offset + 16
+ 	movdqa	%xmm7, (7*16)(PTR1)
+ 
+ #ifdef __i386__
++	END_PIC()
+ 	pop	%esi
+ 	pop	%ebp
+ #endif
+@@ -294,6 +309,7 @@ ENTRY(x86_aes_expand_key)
+ 	push	%ebp
+ 	mov	%esp, %ebp
+ 	movl	8(%ebp), %eax
++	INIT_PIC()
+ #endif
+ 
+ 	SETPTR(aes_round_keys, PTR1)
+@@ -323,6 +339,7 @@ ENTRY(x86_aes_expand_key)
+ 	call	1f
+ 
+ #ifdef __i386__
++	END_PIC()
+ 	pop	%ebp
+ #endif
+ 	ret
+@@ -343,6 +360,16 @@ ENTRY(x86_aes_expand_key)
+ 
+ ENDPROC(x86_aes_expand_key)
+ 
++#if defined(__i386__) && defined(__PIC__)
++	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
++	.globl	__x86.get_pc_thunk.bx
++	.hidden	__x86.get_pc_thunk.bx
++	.type	__x86.get_pc_thunk.bx, @function
++__x86.get_pc_thunk.bx:
++	movl	(%esp), %ebx
++	ret
++#endif
++
+ 	.bss
+ 	.balign 64
+ aes_round_keys:
diff --git a/meta/recipes-support/rng-tools/rng-tools_5.bb b/meta/recipes-support/rng-tools/rng-tools_5.bb
index 9329e8ad31..e2acaba91a 100644
--- a/meta/recipes-support/rng-tools/rng-tools_5.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_5.bb
@@ -7,6 +7,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gkernel/${BP}.tar.gz \
            file://0002-Add-argument-to-control-the-libargp-dependency.patch \
            file://underquote.patch \
            file://uclibc-libuargp-configure.patch \
+           file://rng-tools-5-fix-textrels-on-PIC-x86.patch \
            file://init \
            file://default"
 
-- 
2.13.1


