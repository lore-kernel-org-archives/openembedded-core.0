Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QnoWh-0000m0-8m for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 11:11:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7196iFs005124
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 10:06:44 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04933-01 for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2011 10:06:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7196d0p005118
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 10:06:39 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <f2fee70727d940b61a8470d13c22a3313d9ee3ae.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
	<f2fee70727d940b61a8470d13c22a3313d9ee3ae.1312182844.git.sgw@linux.intel.com>
Date: Mon, 01 Aug 2011 10:06:27 +0100
Message-ID: <1312189587.2344.427.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 15/22] tune/powerpc: Cleanup setting of TUNE_PKGARCH
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
X-List-Received-Date: Mon, 01 Aug 2011 09:11:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 00:36 -0700, Saul Wold wrote:
> From: Mark Hatle <mark.hatle@windriver.com>
> 
> Based on Kumar Gala <galak@kernel.crashing.org>'s patch.
> 
> By default we use ppc, or ppc64.  Each tune either specifies their
> manual version or can use the PPC_PKGARCH to specify a new prefix
> if they support both float and no-float variants.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/conf/machine/include/powerpc/arch-powerpc.inc |    3 ++-
>  .../machine/include/powerpc/arch-powerpc64.inc     |    1 +
>  meta/conf/machine/include/tune-ppc603e.inc         |    4 ++--
>  meta/conf/machine/include/tune-ppce300c2.inc       |    5 +++--
>  meta/conf/machine/include/tune-ppce500.inc         |    5 +++--
>  meta/conf/machine/include/tune-ppce500mc.inc       |    5 +++--
>  meta/conf/machine/include/tune-ppce500v2.inc       |    5 +++--
>  7 files changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> index 013755d..2621932 100644
> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> @@ -8,6 +8,7 @@ DEFAULTTUNE ?= "powerpc"
>  TUNEVALID[m32] = "Power ELF32 standard ABI"
>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32", "", d)}"
>  TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m32", "powerpc", "", d)}"
> +PPC_PKGARCH = "ppc"
>  
>  TUNEVALID[fpu-hard] = "Use hardware FPU."
>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "-mhard-float", "", d)}"
> @@ -20,7 +21,7 @@ ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc-efd', 'ppc-e
>  
>  PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "-nf", "", d)}"
>  
> -TUNE_PKGARCH ?= "${TUNE_ARCH}${PPCPKGSFX_FPU}"
> +TUNE_PKGARCH ?= "${PPC_PKGARCH}${PPCPKGSFX_FPU}"
>  
>  # Basic tune definitions
>  AVAILTUNES += "powerpc powerpc-nf" 
> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> index a965d59..0a104a2 100644
> --- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> +++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> @@ -2,6 +2,7 @@ TUNEVALID[m64] = "Power ELF64 standard ABI"
>  TUNE_CONFLICTS[m64] = "m32 nf"
>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
>  TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], "powerpc64", "", d)}"
> +PPC_PKGARCH = "ppc64"
>  
>  AVAILTUNES += "powerpc64"
>  TUNE_FEATURES_tune-powerpc64 ?= "m64 fpu-hard"
> diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
> index 7c05394..2eec64b 100644
> --- a/meta/conf/machine/include/tune-ppc603e.inc
> +++ b/meta/conf/machine/include/tune-ppc603e.inc
> @@ -4,8 +4,8 @@ require conf/machine/include/powerpc/arch-powerpc.inc
>  
>  TUNEVALID[ppc603e] = "Enable ppc603e specific processor optimizations"
>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "-mcpu=603e", "", d)}"
> -TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "ppc603e", "", d)}"
> +PPC_PKGARCH_tune-ppc603e = "ppc603e"

I was going to ask how this is meant to work without overrides, then I
saw the later patch (which are queued in the wrong order). I suspect you
need to use syntax like:

PPC_PKGARCH ??= "${@d.getvar(bb.data.expand("PPC_PKGARCH_tune-${DEFAULTTUNE}"), True) or d.getvar("PPC_PKGARCH", True)}" 

above and then this will work without overrides.

Cheers,

Richard



