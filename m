Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 12E32797B5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 16:16:13 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id h4-v6so24810581qtj.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 09:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UmXyzsM2+3xAIa6jxCfMDHmOU+zig9MMoOjr8E0aywo=;
	b=nWFwLCqGAAb+dGdlvOnzYuLOocPxLWJ5fc8nWQa+jtRpGZO5Jl3P56n9F/Dw8jY4r5
	shAQBqVwMJWUIyCLrYtcr2i0dq0Rbav1LQGaIZG/r4zr6dfJsvXqh473BSA3fURALyuU
	FHgVgUMi+jXjiUqSAEBw8CdvHkwrVHRhesxzYkuV08rXyMr/4bEfoVMZToiXPu0Dqd3+
	xCv3ZdXbFJfyVl86iVVMqQ/JvJ40AWPvSYVBaUx7O1f/nCHgpJvqlhh5FeIPkmIOS4V/
	d67UpWe/PCLeZfEe9EL/FXBCSUA8moOR+WSbrxBXkue3+Zl5sx06VkSqfdbklrZBJjlO
	sDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UmXyzsM2+3xAIa6jxCfMDHmOU+zig9MMoOjr8E0aywo=;
	b=unWyWMCzGRh2SZJGs9/tOYIHnqHjgR+rjnQY5Uodemx1Xq0yC0j9M/KubGccahYX38
	Z/n+Qd0R+Yo+2J/NQ4yst9iW4XATeegnOERjKoPhOXTrN6sMQKbBbYM3F0xPK9xowd0p
	HgpoKVZwX5ZXtYtPrqeSepklcmnGRPZsexKn4Ze2w2mGSFPZlpucqGb3wZuksX41VmLz
	YgI3+/RpDf8rLpIf2rZJM22lVhFCW7FsPfRMiiFu2xeSiwq0jggcb9Qw/IahMoBA9w1g
	/vLY418YWhoRnkg5ePuKBTomQeu86BD7EcyQo4PjmAd/AXzsCUh2IqoByfguLUTP5C2x
	ikpA==
X-Gm-Message-State: APzg51BsxYUf3K25h7Ii7XJfykgzOTaWgCNb8u52YWGE5RTykRy46Awv
	qy7Qsut0QhG3sQKwViSzdEWolsqWFlm3GJZ89vTzCw==
X-Google-Smtp-Source: ANB0VdYC5P7sSxJz0Ceu4cMIHeN9IGl1AADb9r/8uJwmwc0CyKqFt+gFbnmGfdaI5k7MgbNpHcCNgNRVkDQazETcghw=
X-Received: by 2002:a0c:87f8:: with SMTP id
	53-v6mr15359526qvk.228.1536596174886; 
	Mon, 10 Sep 2018 09:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20180910124413.20946-1-nathan@nathanrossi.com>
In-Reply-To: <20180910124413.20946-1-nathan@nathanrossi.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Sep 2018 09:15:48 -0700
Message-ID: <CAMKF1sqD-iTTogMVTX81Cr7-NgkPy0gYi2KAiTRiuo67+nn_+Q@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tclibc: For newlib and baremetal disable some security features
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
X-List-Received-Date: Mon, 10 Sep 2018 16:16:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 10, 2018 at 5:44 AM Nathan Rossi <nathan@nathanrossi.com> wrote:
>
> With GCCPIE being enabled by default with security_flags.inc the
> compiler will by default attempt to compile and link programs as PIE.
> The targets that use newlib and baremetal in general do not support PIE
> or are otherwise unable to use it due to how embedded targets are
> compiled and executed. As such it makes sense to disable PIE by default
> for these libc's in order to prevent build failures.
>
> For baremetal tclibc there are no libc features or implementation as
> such there is no implementation for the strong stack protector by
> default.
>

LGTM.
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---
>  meta/conf/distro/include/tclibc-baremetal.inc | 6 ++++++
>  meta/conf/distro/include/tclibc-newlib.inc    | 4 ++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/distro/include/tclibc-baremetal.inc
> index 1bf44c8591..b00917913f 100644
> --- a/meta/conf/distro/include/tclibc-baremetal.inc
> +++ b/meta/conf/distro/include/tclibc-baremetal.inc
> @@ -28,3 +28,9 @@ TOOLCHAIN_HOST_TASK ?= "packagegroup-cross-canadian-${MACHINE}"
>  TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
>  TOOLCHAIN_TARGET_TASK ?= "libgcc-dev"
>  TOOLCHAIN_NEED_CONFIGSITE_CACHE_remove = "virtual/${MLPREFIX}libc zlib ncurses"
> +
> +# disable stack protector by default (no-libc, no protector implementation)
> +SECURITY_STACK_PROTECTOR_libc-baremetal = ""
> +# disable pie security flags by default
> +SECURITY_CFLAGS_libc-baremetal = "${SECURITY_NOPIE_CFLAGS}"
> +SECURITY_LDFLAGS_libc-baremetal = ""
> diff --git a/meta/conf/distro/include/tclibc-newlib.inc b/meta/conf/distro/include/tclibc-newlib.inc
> index dc631d8ada..896c0b16d7 100644
> --- a/meta/conf/distro/include/tclibc-newlib.inc
> +++ b/meta/conf/distro/include/tclibc-newlib.inc
> @@ -42,3 +42,7 @@ TARGET_OS_arm = "eabi"
>  TOOLCHAIN_HOST_TASK ?= "packagegroup-cross-canadian-${MACHINE}"
>  TOOLCHAIN_TARGET_TASK ?= "${LIBC_DEPENDENCIES}"
>  TOOLCHAIN_NEED_CONFIGSITE_CACHE_remove = "zlib ncurses"
> +
> +# disable pie security flags by default
> +SECURITY_CFLAGS_libc-newlib = "${SECURITY_NOPIE_CFLAGS}"
> +SECURITY_LDFLAGS_libc-newlib = ""
> ---
> 2.18.0
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

