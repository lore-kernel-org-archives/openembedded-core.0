Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B62AC60088
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 03:19:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t613Jfxr029389
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 20:19:42 -0700 (PDT)
Received: from [128.224.162.176] (128.224.162.176) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 30 Jun 2015 20:19:42 -0700
Message-ID: <55935C4B.6010306@windriver.com>
Date: Wed, 1 Jul 2015 11:19:39 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Yuanjie Huang <Yuanjie.Huang@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <1430207172-6926-1-git-send-email-Yuanjie.Huang@windriver.com>
In-Reply-To: <1430207172-6926-1-git-send-email-Yuanjie.Huang@windriver.com>
Subject: Re: [PATCH 1/1] ldconfig-native: Add 64-bit flag for ELF64 entries
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
X-List-Received-Date: Wed, 01 Jul 2015 03:19:47 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Yuanjie,

Could you resend your patch with "Upstream-status:xxx"?

Please send the V2 patch directly w/o attachment.

Thanks
Wenzong

On 04/28/2015 03:46 PM, Yuanjie Huang wrote:
> From: Yuanjie Huang <yuanjie.huang@windriver.com>
>
> ldconfig-native was grepped from an old version of glibc, and its output
> lacks neccessary 64bit flag in entries.
> Due to this defect, ctypes.util.find_library() python function fails to
> detect any library due to the old file format that ldconfig-native
> creates. This fix sets architecture-dependent 64bit flags for 64-bit ELF.
>
> Since the host's elf.h may not have definition for new AArch64 machine
> type, a work-around is added to correctly flag 64-bit ARM libraries.
>
> Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> ---
>   .../add-64-bit-flag-for-ELF64-entries.patch        | 103 +++++++++++++++++++++
>   meta/recipes-core/glibc/ldconfig-native_2.12.1.bb  |   1 +
>   2 files changed, 104 insertions(+)
>   create mode 100644 meta/recipes-core/glibc/ldconfig-native-2.12.1/add-64-bit-flag-for-ELF64-entries.patch
>
> diff --git a/meta/recipes-core/glibc/ldconfig-native-2.12.1/add-64-bit-flag-for-ELF64-entries.patch b/meta/recipes-core/glibc/ldconfig-native-2.12.1/add-64-bit-flag-for-ELF64-entries.patch
> new file mode 100644
> index 0000000..d42f7a1
> --- /dev/null
> +++ b/meta/recipes-core/glibc/ldconfig-native-2.12.1/add-64-bit-flag-for-ELF64-entries.patch
> @@ -0,0 +1,103 @@
> +From 9d62544090b08849218cd1fc52a36cdd5d90363e Mon Sep 17 00:00:00 2001
> +From: Yuanjie Huang <yuanjie.huang@windriver.com>
> +Date: Fri, 24 Apr 2015 03:29:31 +0000
> +Subject: [PATCH] Add 64-bit flag for ELF64 entries.
> +
> +ldconfig-native was grepped from an old version of glibc, and its output
> +lacks neccessary 64bit flag in entries.
> +Due to this defect, ctypes.util.find_library() python function fails to
> +detect any library due to the old file format that ldconfig-native
> +creates. This fix sets architecture-dependent 64bit flags for 64-bit ELF.
> +
> +Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> +---
> + cache.c      |  4 ++++
> + ldconfig.h   |  4 ++++
> + readelflib.c | 34 ++++++++++++++++++++++++++++++++++
> + 3 files changed, 42 insertions(+)
> +
> +diff --git a/cache.c b/cache.c
> +index a904d44..c4f5411 100644
> +--- a/cache.c
> ++++ b/cache.c
> +@@ -121,6 +121,10 @@ print_entry (const char *lib, int flag, unsigned int osversion,
> +       break;
> +     case FLAG_MIPS64_LIBN64:
> +       fputs (",64bit", stdout);
> ++      break;
> ++    case FLAG_AARCH64_LIB64:
> ++      fputs (",AArch64", stdout);
> ++      break;
> +     case 0:
> +       break;
> +     default:
> +diff --git a/ldconfig.h b/ldconfig.h
> +index fadd5ec..6a8a750 100644
> +--- a/ldconfig.h
> ++++ b/ldconfig.h
> +@@ -34,6 +34,10 @@
> + #define FLAG_POWERPC_LIB64	0x0500
> + #define FLAG_MIPS64_LIBN32	0x0600
> + #define FLAG_MIPS64_LIBN64	0x0700
> ++#define FLAG_X8664_LIBX32		0x0800
> ++#define FLAG_ARM_LIBHF			0x0900
> ++#define FLAG_AARCH64_LIB64		0x0a00
> ++#define FLAG_ARM_LIBSF			0x0b00
> +
> + /* Name of auxiliary cache.  */
> + #define _PATH_LDCONFIG_AUX_CACHE "/var/cache/ldconfig/aux-cache"
> +diff --git a/readelflib.c b/readelflib.c
> +index 0bf0de3..6e87afc 100644
> +--- a/readelflib.c
> ++++ b/readelflib.c
> +@@ -28,6 +28,11 @@
> +
> + #include "endian_extra.h"
> +
> ++/* Work-around for old host that does not have AArch64 defined in elf.h. */
> ++#ifndef EM_AARCH64
> ++#define EM_AARCH64	183		/* ARM AARCH64 */
> ++#endif
> ++
> + #undef check_ptr
> + #define check_ptr(ptr)						\
> + do								\
> +@@ -290,6 +295,35 @@ process_elf_file64 (const char *file_name, const char *lib, int *flag,
> +      libc5/libc6.  */
> +   *flag = FLAG_ELF;
> +
> ++  /* Set flags according to information in ELF header to align with target
> ++     ldconfig */
> ++  switch (elf_header->e_machine)
> ++    {
> ++    case EM_IA_64:
> ++      *flag |= FLAG_IA64_LIB64;
> ++      break;
> ++    case EM_X86_64:
> ++      *flag |= FLAG_X8664_LIB64;
> ++      break;
> ++    case EM_S390:
> ++      *flag |= FLAG_S390_LIB64;
> ++      break;
> ++    case EM_PPC64:
> ++      *flag |= FLAG_POWERPC_LIB64;
> ++      break;
> ++    case EM_MIPS:
> ++    case EM_MIPS_RS3_LE:
> ++      *flag |= FLAG_MIPS64_LIBN64;
> ++      break;
> ++    case EM_AARCH64:
> ++      *flag |= FLAG_AARCH64_LIB64;
> ++      break;
> ++    default:
> ++      error(0, 0, "%s is a 64-bit ELF for unknown machine %lx\n",
> ++            file_name, (long)elf_header->e_machine);
> ++      break;
> ++    }
> ++
> +   loadaddr = -1;
> +   dynamic_addr = 0;
> +   dynamic_size = 0;
> +--
> +1.8.5.2.233.g932f7e4
> +
> diff --git a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
> index 7c34635..8a2ea90 100644
> --- a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
> +++ b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
> @@ -12,6 +12,7 @@ SRC_URI = "file://ldconfig-native-2.12.1.tar.bz2 \
>              file://flag_fix.patch \
>              file://endianess-header.patch \
>              file://ldconfig-default-to-all-multilib-dirs.patch \
> +           file://add-64-bit-flag-for-ELF64-entries.patch \
>   "
>
>   PR = "r2"
>

