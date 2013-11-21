Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F12FA6D354
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 19:26:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rALJQ5iq024957
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 11:26:05 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 21 Nov 2013 11:26:04 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 13:26:01 -0600
Message-ID: <1385061961-4697-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1385061961-4697-1-git-send-email-mark.hatle@windriver.com>
References: <1385061961-4697-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH] syslinux: check for __i386__ and __x86_64__ instead of __SIZEOF_POINTER__
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
X-List-Received-Date: Thu, 21 Nov 2013 19:26:06 -0000
Content-Type: text/plain

From: Lei Liu <lei.liu2@windriver.com>

(Note: this patch is being sent for Yocto Project compliance, I don't
 believe it is generally applicable to oe-core as it's only needed on
 older host systems.)

GCC version 4.2 and earlier does not define __SIZEOF_POINTER__.
Check for __i386__ and __x86_64__ instead to make the code compile with
old compiler.

Signed-off-by: Lei Liu <lei.liu2@windriver.com>
Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../syslinux/files/gcc-compatibility.patch         | 491 +++++++++++++++++++++
 meta/recipes-devtools/syslinux/syslinux_6.01.bb    |   4 +-
 2 files changed, 494 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/syslinux/files/gcc-compatibility.patch

diff --git a/meta/recipes-devtools/syslinux/files/gcc-compatibility.patch b/meta/recipes-devtools/syslinux/files/gcc-compatibility.patch
new file mode 100644
index 0000000..b291e29
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/files/gcc-compatibility.patch
@@ -0,0 +1,491 @@
+Check for __i386__ and __x86_64__ instead of __SIZEOF_POINTER__
+
+Upstream-Status: Pending
+
+Signed-off-by: Lei Liu <lei.liu2@windriver.com>
+---
+ com32/include/bitsize/limits.h       |    4 ++--
+ com32/include/bitsize/stddef.h       |    4 ++--
+ com32/include/bitsize/stdint.h       |    4 ++--
+ com32/include/bitsize/stdintconst.h  |    4 ++--
+ com32/include/bitsize/stdintlimits.h |    4 ++--
+ com32/include/byteswap.h             |    4 ++--
+ com32/include/setjmp.h               |    4 ++--
+ com32/include/sys/bitops.h           |    4 ++--
+ com32/include/sys/cpu.h              |    4 ++--
+ com32/include/sys/module.h           |    4 ++--
+ com32/lib/libgcc/__muldi3.S          |    4 ++--
+ com32/lib/setjmp.S                   |    4 ++--
+ com32/lib/sys/farcall.c              |    4 ++--
+ com32/lib/sys/x86_init_fpu.c         |   12 ++++++------
+ com32/sysdump/cpuid.c                |    4 ++--
+ core/call16.c                        |    4 ++--
+ core/lzo/enter.ash                   |    4 ++--
+ core/lzo/leave.ash                   |    4 ++--
+ dos/stdlib.h                         |    4 ++--
+ efi/main.c                           |    6 +++---
+ efi/wrapper.c                        |    4 ++--
+ memdisk/memdisk.h                    |    2 +-
+ memdisk/setup.c                      |    4 ++--
+ memdisk/start32.S                    |    4 ++--
+ memdump/code16.h                     |    2 +-
+ 25 files changed, 53 insertions(+), 53 deletions(-)
+
+diff --git a/com32/include/bitsize/limits.h b/com32/include/bitsize/limits.h
+index 7129c4a..407c720 100644
+--- a/com32/include/bitsize/limits.h
++++ b/com32/include/bitsize/limits.h
+@@ -5,9 +5,9 @@
+ #ifndef _BITSIZE_LIMITS_H
+ #define _BITSIZE_LIMITS_H
+ 
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+ #include <bitsize32/limits.h>
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64__)
+ #include <bitsize64/limits.h>
+ #else
+ #error "Unable to build for to-be-defined architecture type"
+diff --git a/com32/include/bitsize/stddef.h b/com32/include/bitsize/stddef.h
+index 04418a0..bbf070b 100644
+--- a/com32/include/bitsize/stddef.h
++++ b/com32/include/bitsize/stddef.h
+@@ -5,9 +5,9 @@
+ #ifndef _BITSIZE_STDDEF_H
+ #define _BITSIZE_STDDEF_H
+ 
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+ #include <bitsize32/stddef.h>
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64__)
+ #include <bitsize64/stddef.h>
+ #else
+ #error "Unable to build for to-be-defined architecture type"
+diff --git a/com32/include/bitsize/stdint.h b/com32/include/bitsize/stdint.h
+index 7e7b235..500a53b 100644
+--- a/com32/include/bitsize/stdint.h
++++ b/com32/include/bitsize/stdint.h
+@@ -13,9 +13,9 @@ typedef unsigned char		uint8_t;
+ typedef unsigned short int	uint16_t;
+ typedef unsigned int		uint32_t;
+ 
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+ #include <bitsize32/stdint.h>
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64__)
+ #include <bitsize64/stdint.h>
+ #else
+ #error "Unable to build for to-be-defined architecture type"
+diff --git a/com32/include/bitsize/stdintconst.h b/com32/include/bitsize/stdintconst.h
+index b2f3141..7caf937 100644
+--- a/com32/include/bitsize/stdintconst.h
++++ b/com32/include/bitsize/stdintconst.h
+@@ -5,9 +5,9 @@
+ #ifndef _BITSIZE_STDINTCONST_H
+ #define _BITSIZE_STDINTCONST_H
+ 
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+ #include <bitsize32/stdintconst.h>
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64__)
+ #include <bitsize64/stdintconst.h>
+ #else
+ #error "Unable to build for to-be-defined architecture type"
+diff --git a/com32/include/bitsize/stdintlimits.h b/com32/include/bitsize/stdintlimits.h
+index c342c44..78f1e89 100644
+--- a/com32/include/bitsize/stdintlimits.h
++++ b/com32/include/bitsize/stdintlimits.h
+@@ -5,9 +5,9 @@
+ #ifndef _BITSIZE_STDINTLIMITS_H
+ #define _BITSIZE_STDINTLIMITS_H
+ 
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+ #include <bitsize32/stdintlimits.h>
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64__)
+ #include <bitsize64/stdintlimits.h>
+ #else
+ #error "Unable to build for to-be-defined architecture type"
+diff --git a/com32/include/byteswap.h b/com32/include/byteswap.h
+index d1a4d54..ddfa030 100644
+--- a/com32/include/byteswap.h
++++ b/com32/include/byteswap.h
+@@ -26,10 +26,10 @@ static inline __constfunc uint16_t __bswap_16(uint16_t v)
+ 
+ static inline __constfunc uint32_t __bswap_32(uint32_t v)
+ {
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+     asm("xchgb %h0,%b0 ; roll $16,%0 ; xchgb %h0,%b0"
+ 	: "+q" (v));
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64__)
+     asm("bswap	%0"
+ 	: "=r" (v)
+ 	: "0" (v));
+diff --git a/com32/include/setjmp.h b/com32/include/setjmp.h
+index e709095..c514378 100644
+--- a/com32/include/setjmp.h
++++ b/com32/include/setjmp.h
+@@ -9,9 +9,9 @@
+ #include <klibc/compiler.h>
+ #include <stddef.h>
+ 
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+ #include <klibc/i386/archsetjmp.h>
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64__)
+ #include <klibc/x86_64/archsetjmp.h>
+ #else
+ #error "unsupported architecture"
+diff --git a/com32/include/sys/bitops.h b/com32/include/sys/bitops.h
+index de30d93..95a7cf5 100644
+--- a/com32/include/sys/bitops.h
++++ b/com32/include/sys/bitops.h
+@@ -36,9 +36,9 @@
+ 
+ #include <klibc/compiler.h>
+ 
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+ #include <i386/bitops.h>
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64)
+ #include <x86_64/bitops.h>
+ #else
+ #error "Unable to build for to-be-defined architecture type"
+diff --git a/com32/include/sys/cpu.h b/com32/include/sys/cpu.h
+index 76c45da..edc97ec 100644
+--- a/com32/include/sys/cpu.h
++++ b/com32/include/sys/cpu.h
+@@ -5,9 +5,9 @@
+ #include <stdint.h>
+ #include <klibc/compiler.h>
+ 
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+ #include <i386/cpu.h>
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64__)
+ #include <x86_64/cpu.h>
+ #else 
+ #error "unsupported architecture"
+diff --git a/com32/include/sys/module.h b/com32/include/sys/module.h
+index c1d4253..39836b9 100644
+--- a/com32/include/sys/module.h
++++ b/com32/include/sys/module.h
+@@ -14,9 +14,9 @@
+ #include <stdbool.h>
+ #include <linux/list.h>
+ 
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+ #include <i386/module.h>
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64__)
+ #include <x86_64/module.h>
+ #else
+ #error "unsupported architecture"
+diff --git a/com32/lib/libgcc/__muldi3.S b/com32/lib/libgcc/__muldi3.S
+index 424787c..107f0b8 100644
+--- a/com32/lib/libgcc/__muldi3.S
++++ b/com32/lib/libgcc/__muldi3.S
+@@ -9,7 +9,7 @@
+ 	.globl __muldi3
+ 	.type __muldi3,@function
+ __muldi3:
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+ 	/* i386 */
+ 	push  %esi
+ #ifndef REGPARM
+@@ -33,7 +33,7 @@ __muldi3:
+ #endif
+ 	pop   %esi
+ 	ret
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64__)
+ 	/* x86_64 */
+ 	push  %rsi
+ #ifndef REGPARM
+diff --git a/com32/lib/setjmp.S b/com32/lib/setjmp.S
+index 2fb5c23..4abc685 100644
+--- a/com32/lib/setjmp.S
++++ b/com32/lib/setjmp.S
+@@ -62,9 +62,9 @@ longjmp:
+ 
+ 	.size longjmp,.-longjmp
+ */
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+ #include <i386/setjmp.S>
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64__)
+ #include <x86_64/setjmp.S>
+ #else
+ #error "Unable to build for to-be-defined architecture type"
+diff --git a/com32/lib/sys/farcall.c b/com32/lib/sys/farcall.c
+index 2749083..b5d6ad4 100644
+--- a/com32/lib/sys/farcall.c
++++ b/com32/lib/sys/farcall.c
+@@ -8,10 +8,10 @@ static inline uint32_t eflags(void)
+ {
+     //uint32_t v;
+ 
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+     uint32_t v;
+     asm volatile("pushfl ; popl %0" : "=rm" (v));
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64__)
+     uint64_t v;
+     asm volatile("pushfq ; pop %0" : "=rm" (v));
+ #else
+diff --git a/com32/lib/sys/x86_init_fpu.c b/com32/lib/sys/x86_init_fpu.c
+index cacb4ea..b7b8d94 100644
+--- a/com32/lib/sys/x86_init_fpu.c
++++ b/com32/lib/sys/x86_init_fpu.c
+@@ -4,9 +4,9 @@
+  * Test for an x86 FPU, and do any necessary setup.
+  */
+ 
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+ #include <i386/x86_init_fpu.c>
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64__)
+ #include <x86_64/x86_init_fpu.c>
+ #else
+ #error "Unable to build for to-be-defined architecture type"
+@@ -17,10 +17,10 @@
+ 
+ static inline uint64_t get_cr0(void)
+ {
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+     uint32_t v;
+ asm("movl %%cr0,%0":"=r"(v));
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64__)
+     uint64_t v;
+ asm("movq %%cr0,%0":"=r"(v));
+ #else
+@@ -31,9 +31,9 @@ asm("movq %%cr0,%0":"=r"(v));
+ 
+ static inline void set_cr0(uint32_t v)
+ {
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+     asm volatile ("movl %0,%%cr0"::"r" (v));
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64__)
+     asm volatile ("movq %0,%%cr0"::"r" ((uint64_t)v));
+ #else
+ #error "Unable to build for to-be-defined architecture type"
+diff --git a/com32/sysdump/cpuid.c b/com32/sysdump/cpuid.c
+index 846b540..67d0844 100644
+--- a/com32/sysdump/cpuid.c
++++ b/com32/sysdump/cpuid.c
+@@ -20,12 +20,12 @@ struct cpuid_info {
+ 
+ static void get_cpuid(uint32_t eax, uint32_t ecx, struct cpuid_data *data)
+ {
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+     asm("pushl %%ebx ; cpuid ; movl %%ebx,%1 ; popl %%ebx"
+ 	: "=a" (data->eax), "=r" (data->ebx),
+ 	  "=c" (data->ecx), "=d" (data->edx)
+ 	: "a" (eax), "c" (ecx));
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64__)
+         asm volatile("push %%rbx; cpuid; movl %%ebx, %1; pop %%rbx"
+             : "=a" (data->eax),
+               "=b" (data->ebx),
+diff --git a/core/call16.c b/core/call16.c
+index 471aef9..6cee2d5 100644
+--- a/core/call16.c
++++ b/core/call16.c
+@@ -26,10 +26,10 @@ static inline uint32_t eflags(void)
+ {
+     //uint32_t v;
+ 
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+     uint32_t v;
+     asm volatile("pushfl ; popl %0" : "=rm" (v));
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64__)
+     uint64_t v;
+     asm volatile("pushfq ; pop %0" : "=rm" (v));
+ #else
+diff --git a/core/lzo/enter.ash b/core/lzo/enter.ash
+index dc7782f..a2aefa5 100644
+--- a/core/lzo/enter.ash
++++ b/core/lzo/enter.ash
+@@ -45,14 +45,14 @@
+ //
+ ************************************************************************/
+ 
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+         pushl   %ebp
+         pushl   %edi
+         pushl   %esi
+         pushl   %ebx
+         pushl   %ecx
+         pushl   %edx
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64__)
+         push   %rbp
+         push   %rdi
+         push   %rsi
+diff --git a/core/lzo/leave.ash b/core/lzo/leave.ash
+index cc48ce6..0b9555a 100644
+--- a/core/lzo/leave.ash
++++ b/core/lzo/leave.ash
+@@ -65,14 +65,14 @@
+ 
+         negl    %eax
+         addl    $12,%esp
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+         popl    %edx
+         popl    %ecx
+         popl    %ebx
+         popl    %esi
+         popl    %edi
+         popl    %ebp
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64__)
+         pop    %rdx
+         pop    %rcx
+         pop    %rbx
+diff --git a/dos/stdlib.h b/dos/stdlib.h
+index d982670..9e6a80a 100644
+--- a/dos/stdlib.h
++++ b/dos/stdlib.h
+@@ -3,9 +3,9 @@
+ 
+ typedef int ssize_t;
+ /* size_t is defined elsewhere */
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+ typedef unsigned int size_t;
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64__)
+ typedef unsigned long size_t;
+ #else
+ #error "unsupported architecture"
+diff --git a/efi/main.c b/efi/main.c
+index 13b9403..adad340 100644
+--- a/efi/main.c
++++ b/efi/main.c
+@@ -417,7 +417,7 @@ struct boot_params {
+  * allocate_pool()/free_pool()
+  * memory_map()
+  */ 
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+ #define EFI_LOAD_SIG	"EL32"
+ static inline void kernel_jump(EFI_PHYSICAL_ADDRESS kernel_start,
+ 			       struct boot_params *boot_params)
+@@ -446,7 +446,7 @@ static inline void handover_jump(EFI_HANDLE image, struct boot_params *bp,
+ 		         "m" (image), "m" (kernel_start));
+ #endif
+ }
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64__)
+ #define EFI_LOAD_SIG	"EL64"
+ typedef void(*kernel_func)(void *, struct boot_params *);
+ typedef void(*handover_func)(void *, EFI_SYSTEM_TABLE *, struct boot_params *);
+@@ -906,7 +906,7 @@ int efi_boot_linux(void *kernel_buf, size_t kernel_size,
+ 	 * protocol.
+ 	 */
+ 	/* Allocate gdt consistent with the alignment for architecture */
+-	status = emalloc(gdt.limit, __SIZEOF_POINTER__ , (EFI_PHYSICAL_ADDRESS *)&gdt.base);
++	status = emalloc(gdt.limit, sizeof(void *), (EFI_PHYSICAL_ADDRESS *)&gdt.base);
+ 	if (status != EFI_SUCCESS) {
+ 		printf("Failed to allocate memory for GDT, bailing out\n");
+ 		goto free_map;
+diff --git a/efi/wrapper.c b/efi/wrapper.c
+index 04c895f..90dae22 100644
+--- a/efi/wrapper.c
++++ b/efi/wrapper.c
+@@ -24,10 +24,10 @@
+ 
+ #include "wrapper.h"
+ 
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+ typedef Elf32_Ehdr Elf_Ehdr;
+ typedef Elf32_Addr Elf_Addr;
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64__)
+ typedef Elf64_Ehdr Elf_Ehdr;
+ typedef Elf64_Addr Elf_Addr;
+ #else
+diff --git a/memdisk/memdisk.h b/memdisk/memdisk.h
+index 6da5aff..37fd798 100644
+--- a/memdisk/memdisk.h
++++ b/memdisk/memdisk.h
+@@ -25,7 +25,7 @@
+ #include <com32.h>
+ 
+ /* define it only for i386 */
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+ #define __cdecl __attribute__((cdecl,regparm(0)))
+ #endif
+ 
+diff --git a/memdisk/setup.c b/memdisk/setup.c
+index 72c6785..ee6a16a 100644
+--- a/memdisk/setup.c
++++ b/memdisk/setup.c
+@@ -671,9 +671,9 @@ static void relocate_rm_code(uint32_t newbase)
+     set_seg_base(gdt_base, 0x10, rm_args.rm_base);
+     set_seg_base(gdt_base, 0x18, rm_args.rm_base);
+ 
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+     asm volatile ("lgdtl %0"::"m" (*(char *)gdt_base));
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64__)
+     asm volatile ("lgdt %0"::"m" (*(char *)gdt_base));
+ #else
+ #error "unsupported architecture"
+diff --git a/memdisk/start32.S b/memdisk/start32.S
+index ecebe68..cef147b 100644
+--- a/memdisk/start32.S
++++ b/memdisk/start32.S
+@@ -62,9 +62,9 @@ _start:
+ 	addl	$8, %edi
+ 	loop	1b
+ 
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+ 	lidtl	idt_ptr
+-#elif __SIZEOF_POINTER__ == 8
++#elif defined (__x86_64__)
+ 	lidt	idt_ptr
+ #else
+ #error "unsupported architecture"
+diff --git a/memdump/code16.h b/memdump/code16.h
+index ebf5ff4..b60b680 100644
+--- a/memdump/code16.h
++++ b/memdump/code16.h
+@@ -1,5 +1,5 @@
+ /* Must be included first of all */
+-#if __SIZEOF_POINTER__ == 4
++#if defined (__i386__)
+ #ifdef __ASSEMBLY__
+ 	.code16
+ #else
+-- 
+1.7.4.1
+
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.01.bb b/meta/recipes-devtools/syslinux/syslinux_6.01.bb
index 1c240de..f9d21ea 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.01.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.01.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 # ldlinux.* stuff for now, so skip mtools-native
 DEPENDS = "nasm-native util-linux"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/6.xx/syslinux-${PV}.tar.bz2"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/6.xx/syslinux-${PV}.tar.bz2 \
+           file://gcc-compatibility.patch \
+          "
 
 SRC_URI[md5sum] = "6945ee89e29119d459baed4937bbc534"
 SRC_URI[sha256sum] = "83a04cf81e6a46b80ee5a321926eea095af3498b04317e3674b46c125c7a5b43"
-- 
1.8.1.2.545.g2f19ada


