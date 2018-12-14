Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6223460290
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 03:13:56 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id p17so4757989qtl.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 19:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MT22I+MnCw7SA7qiEVVEWLAan/rVjYFUnpMt3qxPO2A=;
	b=m9PCpJQcZlq0d0bDus1SQPsvzcO6rZ6axEh4YHjKMLCySyra1rFXLZdHEM+3v3fHVZ
	BnZC79w/1LLl2DqvDL4wIb2gh59EiRkI4gtJyOAWMVAESDY6/vBFtXX0IzUg584BUexs
	jcbxjYmtEeyeHQGWgGGv6+U1UaPPFMuzYPItA88kglUvPll10v500p62FrOTdeMNHO+J
	/RA107ca8vyC/sqtjbzW2w35ahtDbhR+KvbDzPFbo4p+KXrjjTW2acXqP9oVG1I4Fxlj
	8GptZ4psBpy47iAGPkgHMTTXAc2fmEzDO1ltJbQemQrqkTUD1eGE8MeV00TCsb/U0hZK
	2ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MT22I+MnCw7SA7qiEVVEWLAan/rVjYFUnpMt3qxPO2A=;
	b=YrAVklyBx44VlUlrmNk+g7ybPOSS2+GlggkUFXEKfAFAuaNVhL6Vg7OQ/uKfgt6mEn
	KOkrsl2IqodU9jRNrFyTzOw7YDkpA9gBGtM9tgazkTp6qHUa46VX1+NAZoHlN5tEIHlk
	zZvpICKXATrcnpouB2O/+Dsq9fxm0wahBKeskNcLqYtgTsmh5+pvdeNh4YTvPueFAUZG
	IhiAkfbsCEVEWNHRQ30AWqatF7qilxg3SNnovqAUg25ACb4AjK3R1pOsFRygBdXTiROg
	xbGCuzUkL9oCVrJAh/Gdku0h2TKoPx6sBcxlp/xsVEPlgtroen/Y94nEHiLuaCznh1KC
	3GQg==
X-Gm-Message-State: AA+aEWaDq3BM/4pSQmYEkuU/D/DNSvke2axir9Y18+rUAIL7yqCuOTOt
	eWlEJozHGn6by7tYNXiWlehIPF1DmxzE++mUN5g=
X-Google-Smtp-Source: AFSGD/WD4etbDD7R5DVaLMVYTdVWtZOl9qa9NbOrpYqWcI0QuFUlgYXjEK/By8/jsEbu6caKHNNJ+3D4tdhPLMX2jzs=
X-Received: by 2002:a0c:93e2:: with SMTP id g31mr1251880qvg.194.1544757236798; 
	Thu, 13 Dec 2018 19:13:56 -0800 (PST)
MIME-Version: 1.0
References: <20181213141312.14587-1-andrea.adami@gmail.com>
In-Reply-To: <20181213141312.14587-1-andrea.adami@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Dec 2018 19:13:30 -0800
Message-ID: <CAMKF1srSoF3DJq231kSaspe0U8iVYqn1tFVtv6ABUv9eKaN+vw@mail.gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: fix build for powerpc-linux.musl and powerpc64-linux-musl
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
X-List-Received-Date: Fri, 14 Dec 2018 03:13:56 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Andrea

Sigh, while I dont like what configury is doing here, we can probably
instead surgically check for

$CC --print-multiarch on ppc/musl

and then update the tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch
patch to consider musl multiarch triplets. Maybe do it for ppc64 while here
but I will not hold you accountable for that.
On Thu, Dec 13, 2018 at 6:13 AM Andrea Adami <andrea.adami@gmail.com> wrote:
>
> Add the missing triplets (not considering uclibc) for do_configure.
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../python3/powerpc-musl-triplets.patch       | 43 +++++++++++++++++++
>  meta/recipes-devtools/python/python3_3.5.6.bb |  1 +
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/powerpc-musl-triplets.patch
>
> diff --git a/meta/recipes-devtools/python/python3/powerpc-musl-triplets.patch b/meta/recipes-devtools/python/python3/powerpc-musl-triplets.patch
> new file mode 100644
> index 0000000000..477d049858
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/powerpc-musl-triplets.patch
> @@ -0,0 +1,43 @@
> +Using musl libc the task do_configure fails on powerpc*.
> +
> +  checking build system type... x86_64-pc-linux-gnu
> +  checking host system type... powerpc-oe-linux-musl
> +  checking for python3.5... python3.5
> + ...
> +  checking for the platform triplet based on compiler characteristics...
> +  powerpc-linux-gnu
> +  configure: error: internal configure error for the platform triplet
> +
> +Fix this by adding the musl triplets.
> +Note: uclibc is purposedly not considered (unsupported in oe-core).
> +
> +Upstream-Status: Pending
> +Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> +
> +--- a/configure.ac     2018-12-13 14:44:55.414309610 +0100
> ++++ b/configure.ac     2018-12-13 13:22:37.546497547 +0100
> +@@ -831,14 +831,22 @@
> +         or1k-linux-gnu
> + # elif defined(__powerpc__) && defined(__SPE__)
> +         powerpc-linux-gnuspe
> ++# elif defined(__powerpc__) && !defined(__GLIBC__)
> ++        powerpc-linux-musl
> ++# elif defined(__powerpc__)
> ++        powerpc-linux-gnu
> ++# elif defined(__powerpc64__) && !defined(__GLIBC__)
> ++#  if defined(__LITTLE_ENDIAN__)
> ++        powerpc64le-linux-musl
> ++#  else
> ++        powerpc64-linux-musl
> ++#  endif
> + # elif defined(__powerpc64__)
> + #  if defined(__LITTLE_ENDIAN__)
> +         powerpc64le-linux-gnu
> + #  else
> +         powerpc64-linux-gnu
> + #  endif
> +-# elif defined(__powerpc__)
> +-        powerpc-linux-gnu
> + # elif defined(__s390x__)
> +         s390x-linux-gnu
> + # elif defined(__s390__)
> diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
> index cd7991e7f8..2e8ae711d5 100644
> --- a/meta/recipes-devtools/python/python3_3.5.6.bb
> +++ b/meta/recipes-devtools/python/python3_3.5.6.bb
> @@ -44,6 +44,7 @@ SRC_URI += "\
>              file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch \
>              file://run-ptest \
>             "
> +SRC_URI_append_libc-musl = " file://powerpc-musl-triplets.patch"
>
>  inherit multilib_header python3native update-alternatives qemu ptest
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

