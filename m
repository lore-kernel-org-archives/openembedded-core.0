Received: from ocean.emcraft.com ([213.221.7.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <yanok@emcraft.com>) id 1RERU1-0000xZ-HE
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 22:02:25 +0200
Received: from localhost ([127.0.0.1] helo=[IPv6:::1])
	by ocean.emcraft.com with esmtp (Exim 4.76)
	(envelope-from <yanok@emcraft.com>) id 1REQzu-000623-Jv
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 23:31:19 +0400
Message-ID: <4E973C99.4080402@emcraft.com>
Date: Thu, 13 Oct 2011 23:31:37 +0400
From: Ilya Yanok <yanok@emcraft.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Icedove/3.1.13
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1315409916-2298-1-git-send-email-yanok@emcraft.com>
In-Reply-To: <1315409916-2298-1-git-send-email-yanok@emcraft.com>
Subject: Re: [PATCH] arch-powerpc: set PACKAGE_EXTRA_ARCHS
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
X-List-Received-Date: Thu, 13 Oct 2011 20:02:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi guys,

any comments on this patch?

Regards, Ilya.

On 07.09.2011 19:38, Ilya Yanok wrote:
> Set PACKAGE_EXTRA_ARCHS for the generic tunes ("powerpc" and
> "powerpc-nf") thus allowing to use them instead of tuning to the
> specific CPU.
> 
> Signed-off-by: Ilya Yanok <yanok@emcraft.com>
> ---
>  meta/conf/machine/include/powerpc/arch-powerpc.inc |    6 ++++--
>  meta/conf/machine/include/tune-ppc603e.inc         |    2 +-
>  meta/conf/machine/include/tune-ppce300c2.inc       |    2 +-
>  meta/conf/machine/include/tune-ppce500mc.inc       |    2 +-
>  4 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> index da1a1d6..8347f86 100644
> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> @@ -25,9 +25,11 @@ TUNE_PKGARCH ?= "${PPCPKGARCH}"
>  
>  # Basic tune definitions
>  AVAILTUNES += "powerpc powerpc-nf" 
> -TUNE_FEATURES_tune-powerpc ?= "m32 fpu-hard"
> -BASE_LIB_tune-powerpc = "lib"
>  TUNE_FEATURES_tune-powerpc-nf ?= "m32 fpu-soft"
>  BASE_LIB_tune-powerpc-nf = "lib"
> +PACKAGE_EXTRA_ARCHS_tune-powerpc-nf = "powerpc-nf"
> +TUNE_FEATURES_tune-powerpc ?= "m32 fpu-hard"
> +BASE_LIB_tune-powerpc = "lib"
> +PACKAGE_EXTRA_ARCHS_tune-powerpc = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} powerpc"
>  
>  
> diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
> index c743dde..663f220 100644
> --- a/meta/conf/machine/include/tune-ppc603e.inc
> +++ b/meta/conf/machine/include/tune-ppc603e.inc
> @@ -8,7 +8,7 @@ TUNE_PKGARCH = "${@bb.utils.contains('TUNE_FEATURES', 'ppc603e', 'ppc603e', '${P
>  
>  AVAILTUNES = "ppc603e"
>  TUNE_FEATURES_tune-ppc603e = "m32 fpu-hard ppc603e"
> -PACKAGE_EXTRA_ARCHS_tune-ppc603e = "powerpc ppc603e"
> +PACKAGE_EXTRA_ARCHS_tune-ppc603e = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc603e"
>  
>  # glibc configure options to get 603e specific library (for sqrt)
>  GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "-with-cpu=603e", "", d)}"
> diff --git a/meta/conf/machine/include/tune-ppce300c2.inc b/meta/conf/machine/include/tune-ppce300c2.inc
> index 5eea4a6..bdca1aa 100644
> --- a/meta/conf/machine/include/tune-ppce300c2.inc
> +++ b/meta/conf/machine/include/tune-ppce300c2.inc
> @@ -8,4 +8,4 @@ TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2", "ppce300c2",
>  
>  AVAILTUNES += "ppce300c2"
>  TUNE_FEATURES_tune-ppce300c2 = "m32 fpu-soft ppce300c2"
> -PACKAGE_EXTRA_ARCHS_tune-ppce300c2 = "powerpc-nf ppce300c2"
> +PACKAGE_EXTRA_ARCHS_tune-ppce300c2 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppce300c2"
> diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
> index 33820ef..950c46d 100644
> --- a/meta/conf/machine/include/tune-ppce500mc.inc
> +++ b/meta/conf/machine/include/tune-ppce500mc.inc
> @@ -8,7 +8,7 @@ TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "ppce500mc",
>  
>  AVAILTUNES = "ppce500mc"
>  TUNE_FEATURES_tune-ppce500mc = "m32 fpu-hard ppce500mc"
> -PACKAGE_EXTRA_ARCHS_tune-ppce500mc = "powerpc ppce500mc"
> +PACKAGE_EXTRA_ARCHS_tune-ppce500mc = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce500mc"
>  
>  # glibc configure options to get e500mc specific library (for sqrt)
>  GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "-with-cpu=e500mc", "", d)}"



