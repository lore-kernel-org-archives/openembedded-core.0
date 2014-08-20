Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B013D65DD6;
	Wed, 20 Aug 2014 08:39:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7K8d0un004578
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Aug 2014 01:39:01 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 20 Aug 2014 01:39:00 -0700
Message-ID: <53F45EA1.6000900@windriver.com>
Date: Wed, 20 Aug 2014 16:38:57 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: <pab@pabigot.com>
References: <20140815172255.043D8505EB@opal.openembedded.org>
In-Reply-To: <20140815172255.043D8505EB@opal.openembedded.org>
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Peter A. Bigot : gcc: update compiler architecture to match gcc-runtime ( armv6, armv7a)
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
X-List-Received-Date: Wed, 20 Aug 2014 08:39:47 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Peter,

The commit caused building gcc-crosssdk-initial-x86_64 failed.
...
Unknown CPU given in --with-arch=armv7-a.
...

While crosssdk, TARGET_ARCH = "${SDK_ARCH}" (set in crosssdk.bbclass)
so the values of '--target=x86_64-wrlinuxsdk-linux --with-arch=armv7-a'
triggered the above failure.

How about override for the 'target/cross' and not for 'crosssdk' ?

//Hongxu

On 08/16/2014 01:22 AM, git@opal.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master-next
> Commit: 0ba6ab39f187ecd4261f08e768f365f461384a3a
> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=0ba6ab39f187ecd4261f08e768f365f461384a3a
>
> Author: Peter A. Bigot <pab@pabigot.com>
> Date:   Thu Aug 14 14:05:59 2014 -0500
>
> gcc: update compiler architecture to match gcc-runtime (armv6, armv7a)
>
> The gcc-runtime recipe builds the gcc libraries including libstdc++ with
> $TARGET_CC_ARCH flags, which include -march=FOO flags that affect
> whether atomic instructions are available.  This causes an ABI
> incompatibility when the compiler by default generates code for less
> capable architectures.  For example, gcc-runtime libraries on a
> Cortex-A8 are built with a different C++11/C++14 mutex implementation
> than is used code compiled outside OE and without architecture-specific
> flags.
>
> This commit fixes the problem specifically for ABI issues related to
> atomic instructions available in ARMV6 and subsequent architectures.
> Other ABI incompatibilities may remain in other architectures.
>
> See: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=62100
>
> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> ---
>
>   meta/recipes-devtools/gcc/gcc-configure-common.inc | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> index 71dce12..48fb799 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -64,6 +64,13 @@ EXTRA_OECONF_append_libc-uclibc = " --enable-__cxa_atexit"
>   EXTRA_OECONF_append_mips64 = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
>   EXTRA_OECONF_append_mips64el = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
>   
> +# ARMv6+ adds atomic instructions that affect the ABI in libraries built
> +# with TUNE_CCARGS in gcc-runtime.  Make the compiler default to a
> +# compatible architecture.  armv6 and armv7a cover the minimum tune
> +# features used in OE.
> +EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
> +EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
> +
>   EXTRA_OECONF_GCC_FLOAT ??= ""
>   CPPFLAGS = ""
>   
>


