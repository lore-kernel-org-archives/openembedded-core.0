Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.32637.1605522811788188855
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 02:33:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=ShlYIwmx;
 spf=pass (domain: nathanrossi.com, ip: 209.85.221.66, mailfrom: nathan@nathanrossi.com)
Received: by mail-wr1-f66.google.com with SMTP id d12so18064848wrr.13
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 02:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ii5nLVvoCskVI/ky3GrUA9HAONU4E+dkrz/+gvuE0gE=;
        b=ShlYIwmxZI44hdjeNeFXVXlGYGVao3oHt2+WgP6vyCjr0kne9blBgRx86EfY+alEd1
         NX3ZV5kpiqQ0fJoivPAVOC+NjsYBWXefMXdKI6QUvMLNeNNP7BnhxZdb8itzyTz+eZjN
         hj09I02MO5MTgclndXQBzkLGulFY8G/uhWjn4LZzuVN/rkF/W/33xWIpe6gs1s9UwBJQ
         wqN5wdot6TJRDnMwyk+nWvhC7xybhD8ncJzviRhLRUSqyhRJxLrdsWLQoKDE2XgA6aeE
         E/phcbI1ji3Sub+8Mr+bluuKxX5vc1uCEczai8YbNP4IICOfGvotN/9RCvLdDBYtL/4Q
         Lahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ii5nLVvoCskVI/ky3GrUA9HAONU4E+dkrz/+gvuE0gE=;
        b=pKiUQ/hjTFe1UJcg44LshqWGGxFfzuAb5wUWjZxQAL+yYPtz8UwP3Hy3s766fPq9pV
         nKsARgb7wgc6cR3I5ZjpQNcl6Q9I3O+amjuWZt6k19lE57Vq5GPt1yWGT0ODw0hrBJP7
         wMENmCGumpwCtwGkY0BoZVsHqgEhc/ZER+9+Dnxe3pS7qTEuN0IyFn6qn0LlN9ZMrPcD
         C0gkGHaCMDFvJq757tJdgK6z7VcgNlzFgZwCy/yIlYXOySlEkodhTLqf/ajr4iEErJBi
         WyIe63GHBT3dAhK8/iTnotOnrieDoVUg/7k5m7dr4EUVyVyjEFV+uhCpkHopgVDv31zO
         X3MA==
X-Gm-Message-State: AOAM532C5QnoMgpqVxMiQKyCoCozN8KaAoFQZlqpWPpE4t+/B/mk37k6
	W3Qdw3lcWVcBtP6dVeMHGOu5p9yQ8vw6uXxv/fOf2A==
X-Google-Smtp-Source: ABdhPJwM9fH1CELAu8CC5mLAPJRiiNdE23TtK0CsxiuK7DkNIa963W4oC2t9zXeowoOLCoeR28tghJN/4jaPlWpBOT0=
X-Received: by 2002:adf:b74d:: with SMTP id n13mr1458300wre.101.1605522810222;
 Mon, 16 Nov 2020 02:33:30 -0800 (PST)
MIME-Version: 1.0
References: <20201116094542.4688-1-wonmin82@gmail.com>
In-Reply-To: <20201116094542.4688-1-wonmin82@gmail.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
Date: Mon, 16 Nov 2020 20:33:18 +1000
Message-ID: <CA+aJhH0gFx118Ync4w5Gie+4YxMPELOo3DGSHNOsNKQDtYZUMA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cml1: Set proper LD while during kernel menuconfig
To: Wonmin Jung <wonmin82@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2020 at 19:46, Wonmin Jung <wonmin82@gmail.com> wrote:
>
> With 'ld-is-gold' and linux kernel 5.4 or later, menuconfig
> task for kernel recipes will fail with:
>
> $ bitbake -c menuconfig virtual/kernel
> ...
> scripts/kconfig/mconf  Kconfig
> scripts/Kconfig.include:43:  gold linker 'x86_64-poky-linux-ld' not supported
> /OE/build/tmp/work-shared/qemux86-64/kernel-source/scripts/kconfig/Makefile:29:
>  recipe for target 'menuconfig' failed
> make[2]: *** [menuconfig] Error 1
> /OE/build/tmp/work-shared/qemux86-64/kernel-source/Makefile:606:
>  recipe for target 'menuconfig' failed
> make[1]: *** [menuconfig] Error 2
> /OE/build/tmp/work-shared/qemux86-64/kernel-source/Makefile:185:
>  recipe for target '__sub-make' failed
> make: *** [__sub-make] Error 2
> Command failed.
>
> This is because that the KERNEL_LD variable already set in
> kernel-arch.bbclass isn't used by do_menuconfig function of
> cml1.bbclass.
>
> To fix this issue specify LD variable while calling the kernel
> menuconfig command.
>
> Signed-off-by: Wonmin Jung <wonmin82@gmail.com>
> ---
>  meta/classes/cml1.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
> index d319d66ab2..02cd058fc5 100644
> --- a/meta/classes/cml1.bbclass
> +++ b/meta/classes/cml1.bbclass
> @@ -48,7 +48,7 @@ python do_menuconfig() {
>      # ensure that environment variables are overwritten with this tasks 'd' values
>      d.appendVar("OE_TERMINAL_EXPORTS", " PKG_CONFIG_DIR PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR")
>
> -    oe_terminal("sh -c \"make %s; if [ \\$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
> +    oe_terminal("sh -c \"make LD=${KERNEL_LD} %s; if [ \\$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),

I don't think this is the right place to be setting this, since cml1
is not only for the kernel. I think a better place to set this would
be in kernel.bbclass, alongside the existing HOSTLDFLAGS setting
through KCONFIG_CONFIG_COMMAND.
(https://git.openembedded.org/openembedded-core/tree/meta/classes/kernel.bbclass#n589)

Regards,
Nathan


>                  d.getVar('PN') + ' Configuration', d)
>
>      # FIXME this check can be removed when the minimum bitbake version has been bumped
> --
> 2.29.2
>
>
> 
>
