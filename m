Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QpMxV-0004WJ-5F for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 18:09:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75G4mGT013659
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 17:04:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13123-06 for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2011 17:04:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75G4fER013653
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 17:04:41 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <2c351319afd13acfca1283104172729925cfb696.1312469790.git.nitin.a.kamble@intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<2c351319afd13acfca1283104172729925cfb696.1312469790.git.nitin.a.kamble@intel.com>
Date: Fri, 05 Aug 2011 17:04:18 +0100
Message-ID: <1312560258.14274.125.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 09/10] x86 tune inc files: add x32 abi tune parameters
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Aug 2011 16:09:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-04 at 08:01 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/conf/machine/include/ia32/arch-ia32.inc |   23 ++++++++++++++++++++---
>  meta/conf/machine/include/tune-core2.inc     |    4 ++++
>  meta/conf/machine/include/tune-x86_64.inc    |    2 +-
>  3 files changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc b/meta/conf/machine/include/ia32/arch-ia32.inc
> index 2709440..fb527da 100644
> --- a/meta/conf/machine/include/ia32/arch-ia32.inc
> +++ b/meta/conf/machine/include/ia32/arch-ia32.inc
> @@ -6,17 +6,29 @@ DEFAULTTUNE ?= "x86"
>  TARGET_FPU ?= ""
>  X86ARCH32 ?= "i586"
>  X86ARCH64 ?= "x86_64"
> +X86ARCHX32 ?= "x86_64"
>  
>  # ELF32 ABI
>  TUNEVALID[m32] = "IA32 ELF32 standard ABI"
> -TUNECONFLICTS[m32] = "m64"
> +TUNECONFLICTS[m32] = "m64 mx32"
>  TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m32", "${X86ARCH32}", "" ,d)}"
> +ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "m32", "32", "" ,d)}"

Please drop the above line. There is no need to change that.

>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32", "", d)}"
>  
> +# x32 ABI
> +TUNEVALID[mx32] = "IA32e (x86_64) ELF32 standard ABI"
> +TUNECONFLICTS[mx32] = "m64 m32"
> +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", "${X86ARCHX32}", "" ,d)}"
> +ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", "x32", "" ,d)}"
> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-mx32", "", d)}"
> +TUNE_LDARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-m elf32_x86_64", "", d)}"
> +TUNE_ASARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}"
> +

These are fine.

>  # ELF64 ABI
>  TUNEVALID[m64] = "IA32e (x86_64) ELF64 standard ABI"
> -TUNECONFLICT[m64] = "m32"
> +TUNECONFLICT[m64] = "m32 mx32"
>  TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m64", "${X86ARCH64}", "" ,d)}"
> +ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "m64", "64", "" ,d)}"

Again, please drop the above line.

>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
>  
>  TUNE_PKGARCH ?= "${@bb.utils.contains("TUNE_FEATURES", "m32", "x86", "x86_64", d)}"
> @@ -30,4 +42,9 @@ PACKAGE_EXTRA_ARCHS_tune-x86 = "x86"
>  AVAILTUNES += "x86-64"
>  TUNE_FEATURES_tune-x86-64 ?= "m64"
>  BASE_LIB_tune-x86-64 ?= "lib64"
> -PACKAGE_EXTRA_ARCHS_tune-x86-64 = "x86_64"
> +PACKAGE_EXTRA_ARCHS_tune-x86-64 = "x86-64"

That is likely wrong, please drop this piece.

> +
> +AVAILTUNES += "x86-64-x32"
> +TUNE_FEATURES_tune-x86-64-x32 ?= "mx32"
> +BASE_LIB_tune-x86-64-x32 ?= "lib"
> +PACKAGE_EXTRA_ARCHS_tune-x86-64-x32 = "x86-64-x32"

And this is wrong too.

You really want:

TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}"
PACKAGE_EXTRA_ARCHS_tune-x86-64-x32 = "x86_64-x32"

> diff --git a/meta/conf/machine/include/tune-core2.inc b/meta/conf/machine/include/tune-core2.inc
> index 25c2226..8a4de3e 100644
> --- a/meta/conf/machine/include/tune-core2.inc
> +++ b/meta/conf/machine/include/tune-core2.inc
> @@ -18,3 +18,7 @@ TUNE_FEATURES_tune-core2-64 ?= "${TUNE_FEATURES_tune-x86-64} core2"
>  BASE_LIB_tune-core2-64 ?= "lib64"
>  PACKAGE_EXTRA_ARCHS_tune-core2-64 = "${PACKAGE_EXTRA_ARCHS_tune-x86-64} core2-64"
>  
> +AVAILTUNES += "core2-x32"
> +TUNE_FEATURES_tune-core2-x32 ?= "${TUNE_FEATURES_tune-x86-64-x32} core2"
> +BASE_LIB_tune-core2-x32 ?= "lib"
> +PACKAGE_EXTRA_ARCHS_tune-core2-x32 = "${PACKAGE_EXTRA_ARCHS_tune-x86-64-x32} core2-x32"

PACKAGE_EXTRA_ARCHS_tune-core2-x32 = "${PACKAGE_EXTRA_ARCHS_tune-x86-64-x32} core2-64-x32"

Cheers,

Richard






