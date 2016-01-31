Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id EDF7C76312
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 15:35:45 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id t15so19020357igr.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 07:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=asNY4+HtNfKoFutoYhouo+LDVwtHlmuuM0wlX58RPLU=;
	b=M/aVXiZoxmVtHOFLBxXs9WGcjrtTWLU+ftz/RJgeI3NpJgWun/StJwGGzsJuNb8mH7
	ayI/XuvX74eW/wsR211KOdQyPhXP2sPW8CJunw+q79KrpvmtfUO4+DUc3m7Ev9EcZqcn
	Efbv+1BiAQOmFu8mTWTTg4Y8dU26YBsPYIFyKDb3uIri53d4uOF9pQRAs6fc4W4twjed
	LKS2xBST7xhFukWDC23tytyQcWCUyZduoc0qHDyzxtKLu+NH13YYuZ5YCCIHFd6DUAPV
	C0FVqCtp7i/v/KCrXv6uBOvIB9H2f88L/47H13IZGwqHajoqmFS+XW62dqiltJceCnIu
	W/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=asNY4+HtNfKoFutoYhouo+LDVwtHlmuuM0wlX58RPLU=;
	b=JyMcfK9E9mxNaBDW7vk6rBWV6z9ElDDeTMZWD5wVlnonhd/pZrfOjuoyPAAgWq+ULa
	8tskkIpjdVqtbhsSNacRt/f3cJNrbqCEiF32Z7ngLWEURjq0eVbuQmRX4MWdPNW54cKd
	VB7AG256ggY8jNDtlHOjA244KXP+4xT9w6+4Aua2I04TwyHc1Vfas/qTYNV0HHsTzEGM
	nYoh78x1pO5DcE7DACRPRevfcYeIPx6X0+2O3DUJVAWKdsmrmb2T8w/FoVMhFa/OYeiH
	abrsV0qWEX4Gw4a5v6BGbtCPa1XZWrvL94blCLEdTXTve+Chw/skU9YcFit7sq592lOw
	i5OQ==
X-Gm-Message-State: AG10YOT49NXAefXEwez3GwljzqrsvXi78XlGEXwRk+KuJtJYpkUDpZf3K9QqdKznES8lpi0nQ37C41xx/phRig==
X-Received: by 10.50.79.196 with SMTP id l4mr6914726igx.11.1454254545870; Sun,
	31 Jan 2016 07:35:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Sun, 31 Jan 2016 07:35:16 -0800 (PST)
In-Reply-To: <1454246466.27087.12.camel@linuxfoundation.org>
References: <1454246466.27087.12.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 31 Jan 2016 07:35:16 -0800
Message-ID: <CAMKF1sqF-ON6_PBpv-XmwEqiBTDyWj1pGqi85TU0ZPmR--XSyA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binutils: Use target provided zlib
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
X-List-Received-Date: Sun, 31 Jan 2016 15:35:46 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jan 31, 2016 at 5:21 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> When using -fpic (security related cflags), qemux6-64 builds would
> fail due to linker symbol errors. This was due to the internal zlib
> that binutils was using.
>
> Add the switch to tell it to use the target system zlib which is
> already in DEPENDS. That zlib is already compiled with the correct
> flags.

this looks good to me.

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/recipes-devtools/binutils/binutils_2.26.bb b/meta/recipes-devtools/binutils/binutils_2.26.bb
> index 6f42671..b70ffbf 100644
> --- a/meta/recipes-devtools/binutils/binutils_2.26.bb
> +++ b/meta/recipes-devtools/binutils/binutils_2.26.bb
> @@ -7,6 +7,7 @@ EXTRA_OECONF += "--with-sysroot=/ \
>                  --enable-install-libbfd \
>                  --enable-install-libiberty \
>                  --enable-shared \
> +                --with-system-zlib \
>                  "
>
>  EXTRA_OECONF_class-native = "--enable-targets=all \
>
>

