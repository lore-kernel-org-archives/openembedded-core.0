Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 25D2160124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 21:19:50 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n132so26263198qka.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 14:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V0TNPBTbgfOgJtbY+vlr0N0Cdlrk+nI6w9EuNO/V32E=;
	b=OygTK/is1/psGfim4VCC/6skJGxB3pHw9zFzuvlkax3Q0Q+PqT6EDtp3gMQw+9G+mr
	DDtXEVpKecJNe2npi06tGggzWgG9JWJgHCe3J0aR6CsEYawhn4eoiSrmizjQZfoFZXE8
	GbLr8aSKjMs+Rpjw97WgoAwwqz7b96XY55aoKnEEEgav4ldWW197FO38OWeoFMkKOnZ/
	Jdwqo/IcL6w/izoZIeTgDXUny4fGldg8XYWMC0JyzGDUDuXhVPzSVlnKSXsaGLj9kk/9
	1lj0vJW7jF6jmD4HrCqOJv2xTYfZMDKxfxVP3VrRBzrlSo4xpdCEapaf2eMECqTBURE6
	S6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V0TNPBTbgfOgJtbY+vlr0N0Cdlrk+nI6w9EuNO/V32E=;
	b=AGs7c8sgruQQOWy5RKSZPJ7hTRGBFMuEJD2n8tM3oVz4s11Ktq6psghaUG6n3nT7mN
	PhEM6wS/hN3SKM4VDZuX9gg+7Nqu9RmBvHERtKsPIs2kCHS87bs1ovLiEYVy90C+dvVF
	eCmx2nzZ1j3lFUSjmC1d6SLyUqPxgtt0p5vEiSbflmSICUP9K9RHJv6IXfAXHJt7XaCP
	MKrVP7WE3hU6aqC0MRU6WE4DD0rZO4h/eIr0eLdGZLYEDhk+zLxyq7PHIwgdofAjvcmw
	9iw++LS3aociXE4SM7ggrMAnCJluqeVn9ObZVO3jMW7deeQLK9RaDi17NaIa2msMNQ78
	Yaxw==
X-Gm-Message-State: ALyK8tKg7P6/M7CjSztaMSamTIgG1JTO9Dn3ymtRV6a9ElecJUzHOmEVkSUUk4wbJUnhxoqWAerA4F4bAavOkg==
X-Received: by 10.55.97.80 with SMTP id v77mr527376qkb.41.1467407990874; Fri,
	01 Jul 2016 14:19:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Fri, 1 Jul 2016 14:19:21 -0700 (PDT)
In-Reply-To: <1467405897-14036-1-git-send-email-kergoth@gmail.com>
References: <1467405897-14036-1-git-send-email-kergoth@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Jul 2016 14:19:21 -0700
Message-ID: <CAMKF1sqOmppX34XM=GpKrZwxHO1Rmdc+kfKR_P=MT4xra99v2w@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] gcc-cross: remove --with-linker-hash-style
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
X-List-Received-Date: Fri, 01 Jul 2016 21:19:51 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 1, 2016 at 1:44 PM, Christopher Larson <kergoth@gmail.com> wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>
> We explicitly set the hash style to gnu in our LDFLAGS. Setting the default to
> this in the toolchain, while convenient, actually hides bugs, as a failure to
> obey LDFLAGS isn't noticed. By removing this, it's not dissimilar to how we
> poison the sysroot -- rather than relying on the default, notice right away if
> somoeone isn't obeying the needed flags.
>
> This will result in a failure to obey LDFLAGS causing a GNU_HASH QA failure,
> which is what's often seen with external toolchains. This brings us all on the
> same page, and makes sure a failure to obey LDFLAGS is seen early.
>
> This is limited to cross, to retain ease of use for SDKs.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.9.inc   | 3 ++-
>  meta/recipes-devtools/gcc/gcc-5.3.inc   | 3 ++-
>  meta/recipes-devtools/gcc/gcc-6.1.inc   | 3 ++-
>  meta/recipes-devtools/gcc/gcc-cross.inc | 1 +
>  4 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
> index 64701c8..05e02d9 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
> @@ -107,13 +107,14 @@ JAVA = ""
>
>  LTO = "--enable-lto"
>
> +OECONF_HASH_STYLE = "--with-linker-hash-style=${LINKER_HASH_STYLE}"
>  EXTRA_OECONF_BASE = "\
>      ${LTO} \
> +    ${OECONF_HASH_STYLE} \
>      --enable-libssp \
>      --disable-bootstrap \
>      --disable-libmudflap \
>      --with-system-zlib \
> -    --with-linker-hash-style=${LINKER_HASH_STYLE} \
>      --enable-linker-build-id \
>      --with-ppl=no \
>      --with-cloog=no \
> diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
> index 8613a10..faa1292 100644
> --- a/meta/recipes-devtools/gcc/gcc-5.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
> @@ -113,14 +113,15 @@ JAVA = ""
>
>  LTO = "--enable-lto"
>
> +OECONF_HASH_STYLE = "--with-linker-hash-style=${LINKER_HASH_STYLE}"
>  EXTRA_OECONF_BASE = "\
>      ${LTO} \
> +    ${OECONF_HASH_STYLE} \
>      --enable-libssp \
>      --enable-libitm \
>      --disable-bootstrap \
>      --disable-libmudflap \
>      --with-system-zlib \
> -    --with-linker-hash-style=${LINKER_HASH_STYLE} \
>      --enable-linker-build-id \
>      --with-ppl=no \
>      --with-cloog=no \
> diff --git a/meta/recipes-devtools/gcc/gcc-6.1.inc b/meta/recipes-devtools/gcc/gcc-6.1.inc
> index 1a00f3f..e3ff9cb 100644
> --- a/meta/recipes-devtools/gcc/gcc-6.1.inc
> +++ b/meta/recipes-devtools/gcc/gcc-6.1.inc
> @@ -93,14 +93,15 @@ JAVA = ""
>
>  LTO = "--enable-lto"
>
> +OECONF_HASH_STYLE = "--with-linker-hash-style=${LINKER_HASH_STYLE}"
>  EXTRA_OECONF_BASE = "\
>      ${LTO} \
> +    ${OECONF_HASH_STYLE} \
>      --enable-libssp \
>      --enable-libitm \
>      --disable-bootstrap \
>      --disable-libmudflap \
>      --with-system-zlib \
> -    --with-linker-hash-style=${LINKER_HASH_STYLE} \
>      --enable-linker-build-id \
>      --with-ppl=no \
>      --with-cloog=no \
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
> index f479360..850c63a 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -33,6 +33,7 @@ EXTRA_OECONF_PATHS = "\
>      --with-sysroot=/not/exist \
>      --with-build-sysroot=${STAGING_DIR_TARGET} \
>  "
> +OECONF_HASH_STYLE = ""

May be we can just explicitly override default LINKER_HASH_STYLE here
by setting LINKER_HASH_STYLE = "sysv"
which is effectively what we are doing by removing the option.

>
>  ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
>
> --
> 2.8.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

