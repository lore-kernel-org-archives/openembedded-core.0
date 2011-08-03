Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QoepU-00033s-EK for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 19:02:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p73GvdCP027764
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 17:57:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27440-07 for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2011 17:57:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p73GvTbv027756
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 17:57:30 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1312349327-27463-1-git-send-email-galak@kernel.crashing.org>
References: <1312349327-27463-1-git-send-email-galak@kernel.crashing.org>
Date: Wed, 03 Aug 2011 17:57:11 +0100
Message-ID: <1312390631.2344.709.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v2] tune/arch-powerpc: Use fpu-soft to set PPCPKGSFX_FPU
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
X-List-Received-Date: Wed, 03 Aug 2011 17:02:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-03 at 00:28 -0500, Kumar Gala wrote:
> Its more likely that we explicitly set soft-floating point support for a
> given target than hard.  So use 'fpu-soft' in TUNE_FEATURES rather than
> 'fpu-hard' to determine setting 'nf' (no-float) in PPCPKGSFX_FPU.
>
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---
> * Removed setting of 'fpu-hard' from the tune files that it set
> 
>  meta/conf/machine/include/powerpc/arch-powerpc.inc |    2 +-
>  meta/conf/machine/include/tune-ppc603e.inc         |    2 +-
>  meta/conf/machine/include/tune-ppce500mc.inc       |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> index da1a1d6..c073f18 100644
> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> @@ -18,7 +18,7 @@ TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}
>  
>  ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc-efd', 'ppc-efs']]}"
>  
> -PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" , "", "-nf", d)}"
> +PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "-nf", "", d)}"
>  
>  PPCPKGARCH = "${TUNE_ARCH}${PPCPKGSFX_FPU}"
>  TUNE_PKGARCH ?= "${PPCPKGARCH}"
> diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc

I've remembered the issue here. Further up in that file we have:

TUNEVALID[fpu-hard] = "Use hardware FPU."
TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "-mhard-float", "", d)}"

TUNEVALID[fpu-soft] = "Use software FPU."
TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "-msoft-float", "", d)}"

further up in the file and there are optionally other "float" models
which some processors seemed to need to use. This meant you had to
specify which fpu option you wanted explicitly.

I'm open to better ways of handling this.




