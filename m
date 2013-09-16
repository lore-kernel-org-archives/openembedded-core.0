Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id E4B1D60648
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 12:37:43 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id u14so4107496lbd.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 05:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=hwe835DF0SZIsXSFMXUvCY2bcjOVHmIoSJiCXpOzIj8=;
	b=Lt8LoMusMjYOIW09QY+UJs6CQV4wZz9GP808S9dVVPOi4K557c96ZUPXZ2IAFQ1XOw
	+5IdMO/xMM8gXCSmACWMOmYmtILhIjl5djDB6HfxypOo73BrgE54K16yv/oCtrWjoh1B
	MCziKwgJmd8T0eF6o8fA+WYl32wqSKKQrKyi7ulHO5658K4FaRoFOrjRmAoan+GaSd/M
	6d+6ZaJgThe1kHGlJp78hUpRgvySQ1Dq9AH9hOFikanrOY8W4yOU/SxKhHBnu1toxjth
	34bnE8/OFHeNJDa0WUje68sT4qKqIlOIz7v4e8q4hb20cy5qylYRaIxkqCASeG/qT/5p
	k1WA==
MIME-Version: 1.0
X-Received: by 10.152.21.200 with SMTP id x8mr978878lae.43.1379335065044; Mon,
	16 Sep 2013 05:37:45 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Mon, 16 Sep 2013 05:37:44 -0700 (PDT)
In-Reply-To: <1379071094.3484.245.camel@ted>
References: <1379071094.3484.245.camel@ted>
Date: Mon, 16 Sep 2013 08:37:44 -0400
Message-ID: <CADkTA4PT_GvK2nhz0NdomV1qPZSMwFc4t0Kx+3-TAeYz57N_Wg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: Add big warning about antisocial behaviour
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
X-List-Received-Date: Mon, 16 Sep 2013 12:37:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 13, 2013 at 7:18 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I'm getting concerned with the number of people forking this recipe
> and not understanding what they're doing. I'm therefore proposing
> adding in a suitable warning to people thinking of copying it.
>

This definitely has my vote. Its an issue that I'm constantly
explaining as well.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>



> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> index 96fe2ff..79b7dc4 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> @@ -2,6 +2,28 @@ DESCRIPTION = "Sanitized set of kernel headers for the C library's use."
>  SECTION = "devel"
>  LICENSE = "GPLv2"
>
> +#########################################################################
> +####                        PLEASE READ
> +#########################################################################
> +#
> +# You're probably looking here thinking you need to create some new copy
> +# of linux-libc-headers since you have your own custom kernel. To put
> +# this simply, you DO NOT.
> +#
> +# Why? These headers are used to build the libc. If you customise the
> +# headers you are customising the libc and the libc becomes machine
> +# specific. Most people do not add custom libc extensions to the kernel
> +# and have a machine specific libc.
> +#
> +# But you have some kernel headers you need for some driver? That is fine
> +# but get them from STAGING_KERNEL_DIR where the kernel installs itself.
> +# This will make the package using them machine specific but this is much
> +# better than having a maching specific C library. This does mean your
> +# recipe needs a DEPENDS += "virtual/kernel" but again, that is fine and
> +# makes total sense.
> +#
> +# -- RP
> +
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
>
>  python __anonymous () {
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

