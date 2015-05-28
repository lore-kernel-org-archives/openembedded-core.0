Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id E77527568F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 04:58:36 +0000 (UTC)
Received: by igbjd9 with SMTP id jd9so15542030igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 21:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=XAVH5N24k9cn+8ZoUDZ1G9fTCHMCIy4VgCBaeVWL0uo=;
	b=mEw/F+A+M7bvl0umnoC1p4eDxEPg2Xeuc6Cfz13MpgR5g/+lz2OkEUXYLlnEcWd6vI
	nOCEDKBOUR6zWXgkQq60W4jJCuxvSmEHYWjmG0wNkUjTEXqD3+e9YHHbFMHlLWKHBLu9
	ErZwJe4XklpRq2pmZPdDA0fa1kuA6Uo6Fidll5J/IrVaJ8m17kx9VG+232ehqvq13X38
	4kO/EOFekDuHfovRj+HV8GpWxb5mFxUne7udFYXdAAEmoI9gU5OU92mJpBLjLU28caw2
	oLmbFOUNU8EVjqT/hCZd9+3XjOcZgZbixFRW6RZKON3PKIxh6jz/9Tq7KMuzHA9tXVFF
	ubeA==
X-Received: by 10.50.23.105 with SMTP id l9mr42218232igf.13.1432789117895;
	Wed, 27 May 2015 21:58:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.112.34 with HTTP; Wed, 27 May 2015 21:58:07 -0700 (PDT)
In-Reply-To: <12b5a95ff9ea8e6f3ff82fa8a5426d195be128e3.1432324432.git.raj.khem@gmail.com>
References: <cover.1432324432.git.raj.khem@gmail.com>
	<29648ea4a7ec6d1d02cca78e9268e1629ee20fe9.1432324432.git.raj.khem@gmail.com>
	<12b5a95ff9ea8e6f3ff82fa8a5426d195be128e3.1432324432.git.raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 May 2015 21:58:07 -0700
Message-ID: <CAMKF1sqKB3vAuEqYNtzjVO3PDL_wsSQyk-XR_QubPXud5dJ+Wg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] glibc: ignore for musl/uclibc but only for target recipes
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
X-List-Received-Date: Thu, 28 May 2015 04:58:37 -0000
Content-Type: text/plain; charset=UTF-8

 any issues with this patch, why was it dropped from last pull request ?

On Fri, May 22, 2015 at 12:56 PM, Khem Raj <raj.khem@gmail.com> wrote:
> we still need nativesdk  or native recipes for libc to come
> from glibc, but only be ignored for target recipes types
>
> Change-Id: Ibaf8114f2aef63f1eadf493b264e78cd928535a0
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc-collateral.inc | 3 +++
>  meta/recipes-core/glibc/glibc_2.21.bb        | 9 +++------
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
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
> index 0c28814..4b94cba 100644
> --- a/meta/recipes-core/glibc/glibc_2.21.bb
> +++ b/meta/recipes-core/glibc/glibc_2.21.bb
> @@ -69,14 +69,11 @@ TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
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

