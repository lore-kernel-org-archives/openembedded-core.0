Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 887737297F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 03:43:49 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id gm9so3330431lab.26
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 19:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=RXtiY1PVQw8FGbNBcLAu4h9jHAX/JjtcHV7wZTPBYLE=;
	b=RCcdyYoAdV14HQG4zUpND6WCydgFZg3wJgXpa81Oou2mDFhrfSH/OZmSgerqXZPiNK
	c7MbCI/5O+YaudSo/2BHsVK5Smvz/yiDsEeeY7RQTDm7tIJ4s3EP0K5ELyCc8qltcTbt
	/J+mOoQyDE16KyOBZqp3YtHJ3HUL1xawUu0qngnHiCTZk2W9jqQHx9ie2eqJcOuIxYhw
	l3VAGNUJcVEmbREvApkcia11G7OCHEzkwIIBsOgeMwBSZTDZYKG4Y4T0APJlkWO/NeND
	6w1SUYyCmbx09I9RvgCTE594axGjpFEvlcMDck6mVgaoONj9f3j/Ne40XfnGWrTGwT5u
	DZOA==
MIME-Version: 1.0
X-Received: by 10.112.150.71 with SMTP id ug7mr19701401lbb.73.1419219828748;
	Sun, 21 Dec 2014 19:43:48 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Sun, 21 Dec 2014 19:43:48 -0800 (PST)
In-Reply-To: <1419164943.13316.51.camel@linuxfoundation.org>
References: <1419164943.13316.51.camel@linuxfoundation.org>
Date: Sun, 21 Dec 2014 23:43:48 -0400
Message-ID: <CADkTA4OYpdJYGjb7DB6a7kEUiCP=zUjLahddNJjy5CjxM8VqFg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: Handle ppc crtsaves.o explictly for now
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
X-List-Received-Date: Mon, 22 Dec 2014 03:43:53 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 21, 2014 at 8:29 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Resolve kernel module build failures for qemuppc by including crtsaves.o.
>
> I'm not particularly happy to be doing this, it should perhaps be contained
> in the kernel-dev package. Until the overlap between kernel-devsrc and
> kernel-dev is resolved, this at least removed the regressions.

Interesting. I built qemuppc for core-image-kerneldev and core-image-sato and
didn't see this.

Are the build steps that triggered this captured in the bug ? Or are they in the
mailing list thread ? Either way, I'd like to run them here as part of
any follow
on cleanups.

But the patch makes sense, and looks fine to me for the current state.

Bruce

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 2872f17..1557c27 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -46,6 +46,14 @@ do_install() {
>          cd ${S}
>          find . -type d -name '.git*' -prune -o -type f -print0 | cpio --null -pdlu $kerneldir
>          oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean _mrproper_scripts
> +
> +        # As of Linux kernel version 3.0.1, the clean target removes
> +        # arch/powerpc/lib/crtsavres.o which is present in
> +        # KBUILD_LDFLAGS_MODULE, making it required to build external modules.
> +        if [ ${ARCH} = "powerpc" ]; then
> +                mkdir -p $kerneldir/arch/powerpc/lib/
> +                cp ${S}/arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
> +        fi
>  }
>
>  PACKAGES = "kernel-devsrc"
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

