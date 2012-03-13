Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S7QHH-0000Y3-J1 for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 12:52:31 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2DBhnBT025884
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 11:43:49 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24411-04 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 11:43:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2DBhdrY025877
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 11:43:40 GMT
Message-ID: <1331639018.15192.36.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Mar 2012 11:43:38 +0000
In-Reply-To: <a1dc1d991303525abfc81d1b7ff29ecd87073ff1.1331589797.git.sgw@linux.intel.com>
References: <cover.1331589797.git.sgw@linux.intel.com>
	<a1dc1d991303525abfc81d1b7ff29ecd87073ff1.1331589797.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 11/23] arch-powerpc.inc: use default value of TUNE_PKGARCH
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
X-List-Received-Date: Tue, 13 Mar 2012 11:52:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-03-13 at 00:58 -0700, Saul Wold wrote:
> From: Matthew McClintock <msm@freescale.com>
> 
> We can use the default value for TUNE_PKGARCH, and now we just
> append "-nf" if TARGET_FPU is fpu-soft
> 
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  meta/conf/machine/include/powerpc/arch-powerpc.inc |    6 ++----
>  1 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> index c9b2829..9f588e8 100644
> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> @@ -18,10 +18,8 @@ TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}
>  
>  ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc-efd', 'ppc-efs']]}"
>  
> -PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" , "", "-nf", d)}"
> -
> -PPCPKGARCH = "${TUNE_ARCH}${PPCPKGSFX_FPU}"
> -TUNE_PKGARCH ?= "${PPCPKGARCH}"
> +PPCPKGSFX_FPU = "${@['', '-nf'][d.getVar('TARGET_FPU',d,1) in ['fpu-soft']]}"
> +TUNE_PKGARCH_append = "${PPCPKGSFX_FPU}"

This patch is unlikely to work:

d.getVar('TARGET_FPU',d,1)

(note the duplicate d)

Cheers,

Richard






