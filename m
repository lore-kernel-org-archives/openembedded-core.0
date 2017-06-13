Return-Path: <mac@mcrowe.com>
Received: from avasout05.plus.net (avasout05.plus.net [84.93.230.250])
	by mail.openembedded.org (Postfix) with ESMTP id 4B16777AB3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 09:09:26 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout05 with smtp
	id Y99S1v0040BmcFC0199TvZ; Tue, 13 Jun 2017 10:09:27 +0100
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.2 cv=Iav3YSia c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=LWSFodeU3zMA:10 a=-An2I_7KAAAA:8 a=D9tCBEehAAAA:8
	a=Q4-j1AaZAAAA:8 a=fJ-HYHWxux5eLquFiX4A:9 a=CjuIK1q_8ugA:10
	a=Sq34B_EcNBM9_nrAYB9S:22 a=Q0Uz2dhPmm7nD8Nyg-vj:22
	a=9H3Qd4_ONW2Ztcrla5EB:22
Received: from mac by deneb with local (Exim 4.84_2)
	(envelope-from <mac@mcrowe.com>) id 1dKhpG-0000hm-4D
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Jun 2017 10:09:26 +0100
Date: Tue, 13 Jun 2017 10:09:26 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170613090926.GA1963@mcrowe.com>
References: <20170516124000.21432-1-mac@mcrowe.com>
MIME-Version: 1.0
In-Reply-To: <20170516124000.21432-1-mac@mcrowe.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] gcc-cross-canadian: Use ${target_includedir} for compatibility with meta-micro
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
X-List-Received-Date: Tue, 13 Jun 2017 09:09:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tuesday 16 May 2017 at 13:40:00 +0100, Mike Crowe wrote:
> meta-micro puts headers in /include rather than /usr/include in the
> sysroot. ${target_includedir} means that the correct path will be used
> automatically.
> 
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> Acked-by: Phil Blundell <pb@pbcl.net>
> ---
>  meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> index ec1d281800..91a6fa6994 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -80,7 +80,7 @@ FILES_${PN} = "\
>      ${includedir}/c++/${BINV} \
>      ${prefix}/${TARGET_SYS}/bin/* \
>      ${prefix}/${TARGET_SYS}/lib/* \
> -    ${prefix}/${TARGET_SYS}/usr/include/* \
> +    ${prefix}/${TARGET_SYS}${target_includedir}/* \
>  "
>  INSANE_SKIP_${PN} += "dev-so"
>  
> @@ -153,7 +153,7 @@ ELFUTILS = "nativesdk-elfutils"
>  DEPENDS += "nativesdk-gmp nativesdk-mpfr nativesdk-libmpc ${ELFUTILS} nativesdk-zlib"
>  RDEPENDS_${PN} += "nativesdk-mpfr nativesdk-libmpc ${ELFUTILS}"
>  
> -SYSTEMHEADERS = "/usr/include"
> +SYSTEMHEADERS = "${target_includedir}/"
>  SYSTEMLIBS = "${target_base_libdir}/"
>  SYSTEMLIBS1 = "${target_libdir}/"
>  
> -- 
> 2.11.0

This patch ended up in https://patchwork.openembedded.org/patch/139908/ .
There don't appear to have been any objections. Is there any chance it
could go in?

Thanks.

Mike.

