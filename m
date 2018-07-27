Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id CFEC278CCC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 10:24:31 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id z74-v6so2914094qkb.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 03:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=K6nEczFkgEqynux29aH9nrjrs5EihPL4BLkiY/89Fq4=;
	b=b5Ps6h92cM1mjpfApw7oY0ES8V5oKJhXQVfLGDcoYgXHeAq4JelDheDXJG7pGjDrnz
	BOzDO0MLN2RV37Jw9vvgGsRXwjO9BiFQkWDQr/giJX9ORJHr5tHf52HIQ/RAAtg4S5wA
	m1RDUKWh94FAbHFifQ+GBoeMxreyVYkR7Try73T6KwCVEw6r2MRt30XmmFHFOOarHH0N
	/YUqSo5IPSWcfGdaeJe/oGonpif0hVqoSbPMdyVwJ2NqjfakO4XHtfMsZ63m5tOG2mKs
	WvMOhYNA3WUKqlyHNsjwTVDwBaX+wnqp6LCl2kyCxusu4sUOy8Ciik8Zh2Ol+btiO/tW
	UZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=K6nEczFkgEqynux29aH9nrjrs5EihPL4BLkiY/89Fq4=;
	b=kAcPefZQgTS0z3Qump6L9j5NaxgJxEWg09pTc6R6Pi+QM4TcCWD4m3kpfIClPsdN3B
	wsaszNM/XHlcNHcbxA+CNSLwZIeZDVjtzyX0dXjzvdnt+xMCnJJ1eYzo1Hws73xQU4lH
	pytr+ZOaHSaVhHMF6/77X2jrWvcV+tYiYM+62p0rchYoz+pyiyzreuShyLsf7WIZqJ46
	+2vlOb9eh8hpdbYsW6ZhlsZHBOY5p8Kch4JTFHOdTJTxFPttiKte/ltiqxm78XSDJin9
	uWcXx6vo4m75ofeI+cb1PBeRqNhkTRVHEDozWDKC/6LwNcNfgNWpRuFulnlIMyTbUas1
	j0Ww==
X-Gm-Message-State: AOUpUlEGANy1L3O4yK5Kk/63U9jhpVWU4kwOmhmWqHfwRg7v8QGGkhc2
	oI+4yj0uIS45S4cEbP6hshZYnI2rcnBL8urbGys=
X-Google-Smtp-Source: AAOMgpc5zXGq4PdtcAoJaIS8EvVH8niVvrt3wljzwHIuUhnFs/znq+eyhJcmzuqKgy5UHzzDTmvt1Jm4/UjPJr0Y6Y0=
X-Received: by 2002:a37:a24f:: with SMTP id
	l76-v6mr4999406qke.406.1532687072581; 
	Fri, 27 Jul 2018 03:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20180723115124.27548-1-ross.burton@intel.com>
	<20180723115124.27548-2-ross.burton@intel.com>
In-Reply-To: <20180723115124.27548-2-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Jul 2018 03:24:06 -0700
Message-ID: <CAMKF1srcpA0wowvnELw4JSsePBF8V7YtkBkwLMOCyFojenL09w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] gnutls: rationalise libunistring arguments
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
X-List-Received-Date: Fri, 27 Jul 2018 10:24:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 23, 2018 at 4:51 AM Ross Burton <ross.burton@intel.com> wrote:
>
> No need to pass --without-libunistring-prefix, and it looks a lot like we're
> trying to disable it.
>

This sneaked in and I did not notice it in the series, but its going
to cause regression
on build machines who installed libunistring on host. Its also because
gnuts is using
non standard AC macro called AC_LIB_HAVE_LINKFLAGS to detect this
library and it seems to be confusing cross builds.

This commit is essentially reverting
http://git.openembedded.org/openembedded-core/commit/?id=ee0b0da237c1661f43e27e26e0ab24b7d8ed174f

which was added to fix the above case. This should be reverted.

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-support/gnutls/gnutls.inc | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
> index 98ec8d9667b..b62a137e595 100644
> --- a/meta/recipes-support/gnutls/gnutls.inc
> +++ b/meta/recipes-support/gnutls/gnutls.inc
> @@ -41,7 +41,6 @@ EXTRA_OECONF = " \
>      --enable-local-libopts \
>      --enable-openssl-compatibility \
>      --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
> -    --without-libunistring-prefix \
>  "
>
>  LDFLAGS_append_libc-musl = " -largp"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

