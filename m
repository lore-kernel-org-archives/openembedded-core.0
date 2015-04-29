Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 01CD572A85
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 08:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3T8BBmp017085; Wed, 29 Apr 2015 09:11:11 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dKr_TenUVA12; Wed, 29 Apr 2015 09:11:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3T8AxAJ017079
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 29 Apr 2015 09:11:10 +0100
Message-ID: <1430295059.19130.3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Apr 2015 09:10:59 +0100
In-Reply-To: <c908ef675077815a75f8dbe800a9e9208d80737f.1430285475.git.raj.khem@gmail.com>
References: <9594a8c72803b604619bc23672e227ec29b239f6.1430285475.git.raj.khem@gmail.com>
	<c908ef675077815a75f8dbe800a9e9208d80737f.1430285475.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] glibc: ignore for musl/uclibc but only for target recipes
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
X-List-Received-Date: Wed, 29 Apr 2015 08:11:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-04-28 at 22:34 -0700, Khem Raj wrote:
> we still need nativesdk  or native recipes for libc to come
> from glibc, but only be ignored for target recipes types
> 
> Change-Id: Ibaf8114f2aef63f1eadf493b264e78cd928535a0
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc-collateral.inc | 3 +++
>  meta/recipes-core/glibc/glibc_2.21.bb        | 9 +++------
>  2 files changed, 6 insertions(+), 6 deletions(-)

I'm getting *really* frustrated with the continual changes to these
lines of code. Can we please figure out something that works, test it
and make sure that it is the right thing to do, then be done with it.

I'm not merging this for at least a couple of weeks so that we can see
if it is right or not. I'll revert the last set of changes if that helps
though.

Cheers,

Richard

> diff --git a/meta/recipes-core/glibc/glibc-collateral.inc b/meta/recipes-core/glibc/glibc-collateral.inc
> index f82db06..60655eb 100644
> --- a/meta/recipes-core/glibc/glibc-collateral.inc
> +++ b/meta/recipes-core/glibc/glibc-collateral.inc
> @@ -17,3 +17,6 @@ do_compile[noexec] = "1"
>  
>  do_install[depends] += "virtual/${MLPREFIX}libc:do_populate_sysroot"
>  
> +COMPATIBLE_HOST_libc-musl_class-target = "null"
> +COMPATIBLE_HOST_libc-uclibc_class-target = "null"
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
> index 58a9601..5295ddd 100644
> --- a/meta/recipes-core/glibc/glibc_2.21.bb
> +++ b/meta/recipes-core/glibc/glibc_2.21.bb
> @@ -64,14 +64,11 @@ TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
>  GLIBC_BROKEN_LOCALES = " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_ET gez_ER bn_BD te_IN es_CR.ISO-8859-1"
>  
>  #
> -# We will skip parsing glibc when system C library selection is not glibc
> +# We will skip parsing glibc when target system C library selection is not glibc
>  # this helps in easing out parsing for non-glibc system libraries
>  #
> -python __anonymous () {
> -    if d.getVar('TCLIBC', True) != "glibc":
> -        raise bb.parse.SkipPackage("incompatible with %s C library" %
> -                                   d.getVar('TCLIBC', True))
> -}
> +COMPATIBLE_HOST_libc-musl_class-target = "null"
> +COMPATIBLE_HOST_libc-uclibc_class-target = "null"
>  
>  EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
>                  --without-cvs --disable-profile \
> -- 
> 2.1.4
> 



