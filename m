Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 193207883C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 20:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DB20720B35;
	Wed, 10 Jan 2018 20:14:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id lUUhbo1Gm-ZO; Wed, 10 Jan 2018 20:14:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BCAE020481;
	Wed, 10 Jan 2018 20:14:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8136E16325E; Wed, 10 Jan 2018 15:14:18 -0500 (EST)
Date: Wed, 10 Jan 2018 15:14:18 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20180110201418.GI9657@denix.org>
References: <1515569943-89393-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1515569943-89393-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [RFC][PATCH] gcc: add flex-native explicit dependency
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
X-List-Received-Date: Wed, 10 Jan 2018 20:14:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Oh, this is against rocko, which should be fine for RFC, but I'll rebase for 
master soon...


On Wed, Jan 10, 2018 at 02:39:03AM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> It seems flex is required to build gcc:
> 
> | .../work-shared/gcc-7.2.0-r0/gcc-7.2.0/missing: line 81: flex: command not found
> | WARNING: 'flex' is missing on your system.
> |          You should only need it if you modified a '.l' file.
> |          You may want to install the Fast Lexical Analyzer package:
> |          <http://flex.sourceforge.net/>
> | Makefile:2799: recipe for target 'gengtype-lex.c' failed
> | make[1]: [gengtype-lex.c] Error 127 (ignored)
> 
> Normally this is handled indirectly throught binutils-cross dependency
> pulling in flex-native implicitly. For deterministic builds, this should
> be specified explicitly.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> RFC: Not sure if versioned .inc is the best place to spefice DEPENDS on flex-native
> 
>  meta/recipes-devtools/gcc/gcc-6.3.inc | 2 +-
>  meta/recipes-devtools/gcc/gcc-7.2.inc | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-6.3.inc b/meta/recipes-devtools/gcc/gcc-6.3.inc
> index e569e02..39aca13 100644
> --- a/meta/recipes-devtools/gcc/gcc-6.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-6.3.inc
> @@ -10,7 +10,7 @@ BINV = "6.3.0"
>  
>  FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-6.3:${FILE_DIRNAME}/gcc-6.3/backport:"
>  
> -DEPENDS =+ "mpfr gmp libmpc zlib"
> +DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
>  NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
>  
>  LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> diff --git a/meta/recipes-devtools/gcc/gcc-7.2.inc b/meta/recipes-devtools/gcc/gcc-7.2.inc
> index 1d40cba..d1fb6de 100644
> --- a/meta/recipes-devtools/gcc/gcc-7.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-7.2.inc
> @@ -10,7 +10,7 @@ BINV = "7.2.0"
>  
>  FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-7.2:${FILE_DIRNAME}/gcc-7.2/backport:"
>  
> -DEPENDS =+ "mpfr gmp libmpc zlib"
> +DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
>  NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
>  
>  LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

