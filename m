Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 12E2F7825B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 23:52:55 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id t3so5454687pgt.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 16:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MsRAPr6lp8YuIt0t109jAn4ZQ9ewVY5zCKwO6gw1tuk=;
	b=koJbbzlsyIJHRfDUErFulOujQZyVFM6ZU1o/BX07afj7A3VZPZLbqIQ8sSd6CVlbp1
	xRYyMGQmLNTbyKQNBovytx0vHtuYRwjZmjY/AW6xF8FXdafSbHZqaoXtEzO+gTGRqCXq
	oFuMEfZ+BdmIUFdrIL286VrXVKDIuvmgH0Xhd7LgLtRC5pakwNsxywWMyddRZsxvWxm7
	zqk3LErcV6M1xR+RGeliQyOubYhd15vXPL9T6byjUDbR0QyEUiyh8aDocuUmkNH+u2WE
	QPTlCrlB2564t/J4KdNhXFE3ovoU5tfsai4CrYoNhEqsPVDdnscAAzpBEF/zocwZrjLk
	a02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MsRAPr6lp8YuIt0t109jAn4ZQ9ewVY5zCKwO6gw1tuk=;
	b=kOFM7YQQjB6Asbch/C8WygGQ7WUNVV5SYI+r/wptC443/fFeO2YE2KSU3K3UXP8GvT
	XmMDNNSMqPzAdA13B2yxHm0cqY2iDy5b7M10LuMQqlL5sOtiNYMANEMYVBi+uyZQY7nD
	1fAsfefYDKp7dIvSliEfBSQGbcUEv/zy+ZU7Do5B3GQV+fOKG7S1sAjbswNkZmylfVfD
	YPcw6DduUEMcrNwASpixKHA81HATugboUomdQQ6l2ad1XLwJRDwt0kJSHxJH46D1rl9e
	WTU4fgX5noQmGS1HpPquxzNNhmjITTr3dR3s4Dolr+aYym2KJFqwsDqh1C354LM9cscz
	1/yw==
X-Gm-Message-State: AHYfb5gQMuRWRjT+SfmE116O3Mpm7bh96aXq44EKRqJhdmWBTI9x77Gc
	hOnSUU8QpXoWje3/mT5jZGo/3VO2aw==
X-Received: by 10.99.141.76 with SMTP id z73mr4733365pgd.288.1503359577015;
	Mon, 21 Aug 2017 16:52:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Mon, 21 Aug 2017 16:52:26 -0700 (PDT)
In-Reply-To: <20170821205721.20086-2-Martin.Jansa@gmail.com>
References: <20170821205721.20086-1-Martin.Jansa@gmail.com>
	<20170821205721.20086-2-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Aug 2017 16:52:26 -0700
Message-ID: <CAMKF1spVbAz9h4Z0SWJ9BEh0-03g1ZAi18Z22AztYXfnMLOffw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] grub2: fix build with gcc-7
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
X-List-Received-Date: Mon, 21 Aug 2017 23:52:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 21, 2017 at 1:57 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * build with gcc-7 fails with:
>   | ./config-util.h:1504:48: error: this use of "defined" may not be   portable [-Werror=expansion-to-defined]
>   |              || (defined _FORTIFY_SOURCE && 0 < _FORTIFY_SOURCE \
>   |
                                            ^~~~~~~~~~~~~~~
>   and we're not building on Apple or BSD, so we should be able
>   to just ignoreit until it's resolved properly in some newer gnulib
>   and imported from gnulib to grub-2
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-bsp/grub/grub-efi_2.02.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
> index b949bebced..45f4c1ed34 100644
> --- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
> +++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
> @@ -36,6 +36,12 @@ EXTRA_OECONF += "--enable-efiemu=no"
>  # and many other places in the grub code when compiled with some native gcc compilers (specifically, gentoo)
>  CFLAGS_append_class-native = " -Wno-error=trampolines"
>
> +# this comes from gnulib and it's used only for Apple and BSD, so we can ignore it
> +# ./config-util.h:1504:48: error: this use of "defined" may not be portable [-Werror=expansion-to-defined]
> +#             || (defined _FORTIFY_SOURCE && 0 < _FORTIFY_SOURCE \
> +#                                                ^~~~~~~~~~~~~~~
> +CFLAGS_append_class-native = " -Wno-error=expansion-to-defined"
> +

This workaround seems reasonable but I wonder why it fails on build host
for you. how is your build hosts toolchain configured to generate this
warning. Since you mentioned gcc7 then why doesnt it fail for OE
targets
in same way.

An upstreamable fix would be to break this define into another #if ..
#else macros and define the new macro to 1 or 0 depending upon the
conditions
being tested.

>  do_install_class-native() {
>         install -d ${D}${bindir}
>         install -m 755 grub-mkimage ${D}${bindir}
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

