Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 15038754DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 05:12:03 +0000 (UTC)
Received: from [172.21.2.124] (unknown [87.54.42.112])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 326421C0915;
	Fri, 22 Jun 2018 07:12:03 +0200 (CEST)
To: Alistair Francis <alistair.francis@wdc.com>,
	openembedded-core@lists.openembedded.org
References: <20180621212648.1556-1-alistair.francis@wdc.com>
	<20180621212648.1556-2-alistair.francis@wdc.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <1f1ef3ab-20fb-4323-c9db-172f069768df@geanix.com>
Date: Fri, 22 Jun 2018 07:12:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180621212648.1556-2-alistair.francis@wdc.com>
Subject: Re: [PATCH v2 2/2] recipes-support/nspr: Add RISC-V support
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
X-List-Received-Date: Fri, 22 Jun 2018 05:12:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 2018-06-21 23:26, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   ...initions-for-the-RISC-V-architecture.patch | 150 ++++++++++++++++++
>   meta/recipes-support/nspr/nspr_4.19.bb        |   1 +
>   2 files changed, 151 insertions(+)
>   create mode 100644 meta/recipes-support/nspr/nspr/0003-Add-type-definitions-for-the-RISC-V-architecture.patch
> 
> diff --git a/meta/recipes-support/nspr/nspr/0003-Add-type-definitions-for-the-RISC-V-architecture.patch b/meta/recipes-support/nspr/nspr/0003-Add-type-definitions-for-the-RISC-V-architecture.patch
> new file mode 100644
> index 0000000000..aa32908d13
> --- /dev/null
> +++ b/meta/recipes-support/nspr/nspr/0003-Add-type-definitions-for-the-RISC-V-architecture.patch
> @@ -0,0 +1,150 @@
> +# HG changeset patch
> +# User Karsten Merker <merker@debian.org>
> +# Date 1523974333 -7200
> +# Node ID f47871e2aeb16b39d4f516690e25c81b04d6d05a
> +# Parent  776db96f834cb86e8863052201d55f60a2da91cb
> +Bug 1308584, Add type definitions for the RISC-V architecture, r=kaie
> +
> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> +[ Changes by AF:
> + - Rebase on other Yocto patches
> +]
> +Upstream-Status: Merged [ https://hg.mozilla.org/projects/nspr/rev/f47871e2aeb1 ]

I don't think "merged" is a proper upstream status. Should be "backport" 
instead:
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status

> +
> +diff --git a/pr/include/md/_linux.cfg b/pr/include/md/_linux.cfg
> +--- a/pr/include/md/_linux.cfg
> ++++ b/pr/include/md/_linux.cfg
> +@@ -1015,16 +1015,108 @@
> + #define PR_ALIGN_OF_FLOAT   4
> + #define PR_ALIGN_OF_DOUBLE  4
> + #define PR_ALIGN_OF_POINTER 4
> + #define PR_ALIGN_OF_WORD    4
> +
> + #define PR_BYTES_PER_WORD_LOG2   2
> + #define PR_BYTES_PER_DWORD_LOG2  3
> +
> ++#elif defined(__riscv) && (__riscv_xlen == 32)
> ++
> ++#undef  IS_BIG_ENDIAN
> ++#define IS_LITTLE_ENDIAN 1
> ++#undef  IS_64
> ++
> ++#define PR_BYTES_PER_BYTE   1
> ++#define PR_BYTES_PER_SHORT  2
> ++#define PR_BYTES_PER_INT    4
> ++#define PR_BYTES_PER_INT64  8
> ++#define PR_BYTES_PER_LONG   4
> ++#define PR_BYTES_PER_FLOAT  4
> ++#define PR_BYTES_PER_DOUBLE 8
> ++#define PR_BYTES_PER_WORD   4
> ++#define PR_BYTES_PER_DWORD  8
> ++
> ++#define PR_BITS_PER_BYTE    8
> ++#define PR_BITS_PER_SHORT   16
> ++#define PR_BITS_PER_INT     32
> ++#define PR_BITS_PER_INT64   64
> ++#define PR_BITS_PER_LONG    32
> ++#define PR_BITS_PER_FLOAT   32
> ++#define PR_BITS_PER_DOUBLE  64
> ++#define PR_BITS_PER_WORD    32
> ++
> ++#define PR_BITS_PER_BYTE_LOG2   3
> ++#define PR_BITS_PER_SHORT_LOG2  4
> ++#define PR_BITS_PER_INT_LOG2    5
> ++#define PR_BITS_PER_INT64_LOG2  6
> ++#define PR_BITS_PER_LONG_LOG2   5
> ++#define PR_BITS_PER_FLOAT_LOG2  5
> ++#define PR_BITS_PER_DOUBLE_LOG2 6
> ++#define PR_BITS_PER_WORD_LOG2   5
> ++
> ++#define PR_ALIGN_OF_SHORT   2
> ++#define PR_ALIGN_OF_INT     4
> ++#define PR_ALIGN_OF_LONG    4
> ++#define PR_ALIGN_OF_INT64   8
> ++#define PR_ALIGN_OF_FLOAT   4
> ++#define PR_ALIGN_OF_DOUBLE  8
> ++#define PR_ALIGN_OF_POINTER 4
> ++#define PR_ALIGN_OF_WORD    4
> ++
> ++#define PR_BYTES_PER_WORD_LOG2  2
> ++#define PR_BYTES_PER_DWORD_LOG2 3
> ++
> ++#elif defined(__riscv) && (__riscv_xlen == 64)
> ++
> ++#undef  IS_BIG_ENDIAN
> ++#define IS_LITTLE_ENDIAN 1
> ++#define IS_64
> ++
> ++#define PR_BYTES_PER_BYTE   1
> ++#define PR_BYTES_PER_SHORT  2
> ++#define PR_BYTES_PER_INT    4
> ++#define PR_BYTES_PER_INT64  8
> ++#define PR_BYTES_PER_LONG   8
> ++#define PR_BYTES_PER_FLOAT  4
> ++#define PR_BYTES_PER_DOUBLE 8
> ++#define PR_BYTES_PER_WORD   8
> ++#define PR_BYTES_PER_DWORD  8
> ++
> ++#define PR_BITS_PER_BYTE    8
> ++#define PR_BITS_PER_SHORT   16
> ++#define PR_BITS_PER_INT     32
> ++#define PR_BITS_PER_INT64   64
> ++#define PR_BITS_PER_LONG    64
> ++#define PR_BITS_PER_FLOAT   32
> ++#define PR_BITS_PER_DOUBLE  64
> ++#define PR_BITS_PER_WORD    64
> ++
> ++#define PR_BITS_PER_BYTE_LOG2   3
> ++#define PR_BITS_PER_SHORT_LOG2  4
> ++#define PR_BITS_PER_INT_LOG2    5
> ++#define PR_BITS_PER_INT64_LOG2  6
> ++#define PR_BITS_PER_LONG_LOG2   6
> ++#define PR_BITS_PER_FLOAT_LOG2  5
> ++#define PR_BITS_PER_DOUBLE_LOG2 6
> ++#define PR_BITS_PER_WORD_LOG2   6
> ++
> ++#define PR_ALIGN_OF_SHORT   2
> ++#define PR_ALIGN_OF_INT     4
> ++#define PR_ALIGN_OF_LONG    8
> ++#define PR_ALIGN_OF_INT64   8
> ++#define PR_ALIGN_OF_FLOAT   4
> ++#define PR_ALIGN_OF_DOUBLE  8
> ++#define PR_ALIGN_OF_POINTER 8
> ++#define PR_ALIGN_OF_WORD    8
> ++
> ++#define PR_BYTES_PER_WORD_LOG2  3
> ++#define PR_BYTES_PER_DWORD_LOG2 3
> ++
> + #else
> +
> + #error "Unknown CPU architecture"
> +
> + #endif
> +
> + #ifndef HAVE_LONG_LONG
> + #define	HAVE_LONG_LONG
> +diff --git a/pr/include/md/_linux.h b/pr/include/md/_linux.h
> +--- a/pr/include/md/_linux.h
> ++++ b/pr/include/md/_linux.h
> +@@ -54,16 +54,20 @@
> + #elif defined(__avr32__)
> + #define _PR_SI_ARCHITECTURE "avr32"
> + #elif defined(__m32r__)
> + #define _PR_SI_ARCHITECTURE "m32r"
> + #elif defined(__nios2__)
> + #define _PR_SI_ARCHITECTURE "nios2"
> + #elif defined(__or1k__)
> + #define _PR_SI_ARCHITECTURE "or1k"
> ++#elif defined(__riscv) && (__riscv_xlen == 32)
> ++#define _PR_SI_ARCHITECTURE "riscv32"
> ++#elif defined(__riscv) && (__riscv_xlen == 64)
> ++#define _PR_SI_ARCHITECTURE "riscv64"
> + #else
> + #error "Unknown CPU architecture"
> + #endif
> + #define PR_DLL_SUFFIX		".so"
> +
> + #define _PR_VMBASE              0x30000000
> + #define _PR_STACK_VMBASE	0x50000000
> + #define _MD_DEFAULT_STACK_SIZE	65536L
> +
> diff --git a/meta/recipes-support/nspr/nspr_4.19.bb b/meta/recipes-support/nspr/nspr_4.19.bb
> index de2c87131f..b43c78081d 100644
> --- a/meta/recipes-support/nspr/nspr_4.19.bb
> +++ b/meta/recipes-support/nspr/nspr_4.19.bb
> @@ -11,6 +11,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
>              file://remove-srcdir-from-configure-in.patch \
>              file://0002-Add-nios2-support.patch \
>              file://0001-md-Fix-build-with-musl.patch \
> +           file://0003-Add-type-definitions-for-the-RISC-V-architecture.patch \
>              file://nspr.pc.in \
>   "
>   
> 

-- 
Kind regards,
Martin Hundebøll
Embedded Linux Consultant

+45 61 65 54 61
martin@geanix.com

Geanix IVS
DK39600706

