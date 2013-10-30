Return-Path: <Yang.Shi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CE826AE37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 03:49:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9U3o0RT018039
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 20:50:00 -0700 (PDT)
Received: from [147.11.116.58] (147.11.116.58) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 29 Oct 2013 20:50:00 -0700
Message-ID: <527081E7.8000302@windriver.com>
Date: Tue, 29 Oct 2013 20:49:59 -0700
From: Yang Shi <yang.shi@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0.1
MIME-Version: 1.0
To: <wenzong.fan@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1382773654.git.wenzong.fan@windriver.com>
	<3d0ba878ee62121d08a757a6149fff24091ce717.1382773654.git.wenzong.fan@windriver.com>
In-Reply-To: <3d0ba878ee62121d08a757a6149fff24091ce717.1382773654.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH 1/1] perf: flag __SANE_USERSPACE_TYPES__ to include int-ll64.h for mips64
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
X-List-Received-Date: Wed, 30 Oct 2013 03:49:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/2013 12:53 AM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> As the same reason to powerpc64, mips64 also need the flag.
>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>   meta/recipes-kernel/perf/perf.bb |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index d27e535..903ffa6 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -92,8 +92,9 @@ EXTRA_OEMAKE += "\
>   # PPC64 uses long long for u64 in the kernel, but powerpc's asm/types.h
>   # prevents 64-bit userland from seeing this definition, instead defaulting
>   # to u64 == long in userspace. Define __SANE_USERSPACE_TYPES__ to get
> -# int-ll64.h included.
> +# int-ll64.h included. And MIPS64 has the same issue.
>   EXTRA_OEMAKE_append_powerpc64 = ' CFLAGS=-D__SANE_USERSPACE_TYPES__'
> +EXTRA_OEMAKE_append_mips64 = ' CFLAGS=-D__SANE_USERSPACE_TYPES__'

As the PPC64 counterpart, this override perf CFLAGS incorrectly.

Please check the below comparison.

With this commit:

-D__SANE_USERSPACE_TYPES__ -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 
-D_GNU_SOURCE -Iutil/include -Iarch/mips/include 
-I/home/yshi/windriver/workspace/qemumips64/bitbake_build/tmp/work/qemumips64-wrs-linux/perf/1.0-r8/perf-1.0/arch/mips/include/generated/uapi 
-I/home/yshi/windriver/workspace/qemumips64/bitbake_build/tmp/sysroots/qemumips64/usr/src/kernel/arch/mips/include/uapi 
-I/home/yshi/windriver/workspace/qemumips64/bitbake_build/tmp/sysroots/qemumips64/usr/src/kernel/arch/mips/include 
-I/home/yshi/windriver/workspace/qemumips64/bitbake_build/tmp/work/qemumips64-wrs-linux/perf/1.0-r8/perf-1.0/include/generated/uapi 
-I/home/yshi/windriver/workspace/qemumips64/bitbake_build/tmp/sysroots/qemumips64/usr/src/kernel/include/uapi 
-I/home/yshi/windriver/workspace/qemumips64/bitbake_build/tmp/sysroots/qemumips64/usr/src/kernel/include 
-I/home/yshi/windriver/workspace/qemumips64/bitbake_build/tmp/work/qemumips64-wrs-linux/perf/1.0-r8/perf-1.0/util 
-Iutil -I. -I../lib/traceevent/ -I../lib/ -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE 
-I/home/yshi/windriver/workspace/qemumips64/bitbake_build/tmp/work/qemumips64-wrs-linux/perf/1.0-r8/perf-1.0/ 
-DLIBELF_SUPPORT -DLIBELF_MMAP -DSLANG_SUPPORT -idirafter 
=/usr/include/slang -DHAVE_ON_EXIT -DBACKTRACE_SUPPORT : 
/usr/bin:/usr/lib64/perf/perf-core:share/perf-core/templates:/usr


Right perf CFLAGS without this commit:

-fno-omit-frame-pointer -ggdb3 -funwind-tables -Wall -Wextra -std=gnu99 
-Werror -O6 -Wbad-function-cast -Wdeclaration-after-statement 
-Wformat-security -Wformat-y2k -Winit-self -Wmissing-declarations 
-Wmissing-prototypes -Wnested-externs -Wno-system-headers 
-Wold-style-definition -Wpacked -Wredundant-decls -Wshadow 
-Wstrict-aliasing=3 -Wstrict-prototypes -Wswitch-default -Wswitch-enum 
-Wundef -Wwrite-strings -Wformat -fstack-protector-all -Wstack-protector 
-Wvolatile-register-var -D_FORTIFY_SOURCE=2 -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -Iutil/include -Iarch/mips/include 
-I/home/yshi/windriver/workspace/qemumips64/bitbake_build/tmp/work/qemumips64-wrs-linux/perf/1.0-r8/perf-1.0/arch/mips/include/generated/uapi 
-I/home/yshi/windriver/workspace/qemumips64/bitbake_build/tmp/sysroots/qemumips64/usr/src/kernel/arch/mips/include/uapi 
-I/home/yshi/windriver/workspace/qemumips64/bitbake_build/tmp/sysroots/qemumips64/usr/src/kernel/arch/mips/include 
-I/home/yshi/windriver/workspace/qemumips64/bitbake_build/tmp/work/qemumips64-wrs-linux/perf/1.0-r8/perf-1.0/include/generated/uapi 
-I/home/yshi/windriver/workspace/qemumips64/bitbake_build/tmp/sysroots/qemumips64/usr/src/kernel/include/uapi 
-I/home/yshi/windriver/workspace/qemumips64/bitbake_build/tmp/sysroots/qemumips64/usr/src/kernel/include 
-I/home/yshi/windriver/workspace/qemumips64/bitbake_build/tmp/work/qemumips64-wrs-linux/perf/1.0-r8/perf-1.0/util 
-Iutil -I. -I../lib/traceevent/ -I../lib/ -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE 
-I/home/yshi/windriver/workspace/qemumips64/bitbake_build/tmp/work/qemumips64-wrs-linux/perf/1.0-r8/perf-1.0/ 
-DLIBELF_SUPPORT -DLIBELF_MMAP -DSLANG_SUPPORT -idirafter 
=/usr/include/slang -DHAVE_ON_EXIT -DBACKTRACE_SUPPORT : 
/usr/bin:/usr/lib64/perf/perf-core:share/perf-core/templates:/usr

