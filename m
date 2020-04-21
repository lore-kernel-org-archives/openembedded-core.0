Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.7670.1587472427221051869
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2020 05:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mitnoE9s;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id a2so10867672ejx.5
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2020 05:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hb/SdqwLgfXeDEHQlSEF5ebX+LyM83f0dfqVtmuUdNU=;
        b=mitnoE9sMEk4LW2G6Oaz+fSTwc8fA8XHq7OzOfMZ7nDhG7JoE7vQ0OsCVDpDywUDxV
         aH90r0sy4E4UhrhsAfADZxMwacAhHKTx0lcv5rRMqa7P98bcUnJ7dwMCurvcstX62bNw
         bdCkZB8MrJY0dLadcdv6QkdeCN2pyLxSgVw2SvLBuziLnZA150jnlfHbTzow1yPjkzO0
         KxJ1DGZadfxuPisUZodSPbJ3onbbs1YajcUAZvdM5ARcKXuXoUPvC3dzrcoy7NWQnrZS
         Jc6oBRMLW1iH67bkQRaLma0x5WWIlmuo4E8alWRnjeVwJdJTbb6cEx8p+UF2n2W+vqjD
         oXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hb/SdqwLgfXeDEHQlSEF5ebX+LyM83f0dfqVtmuUdNU=;
        b=joZqNOKXha1HkuDEt4hSFspYsowxcSCoIX0rLtZ6I6ABWU5gnkeWXg7AiMSPwRCHNb
         SCmgyXBJgzwAJPFO8sA/d9z+j/IumsMg4qtA4gMfSz/UFDIh67DOVNxm0VZuhJNMjgIO
         fExOMn/ihrdIumBCXE4J3H73l9+JsVGzwRgbRdMqhmxtmmeWZEaWyFiJKvGfAYu4O/xt
         jpeLPZSBqMj2CXa0KFNhFOYXIlJ6jxmkR+nUoSZQJMlxs3uSgyCb6hNwIrsh5m5A3De9
         FYu86BCaZntq1kSaGNVWhL/qF9nXixoQ4sIeakyQ/W0o/bnUi9VulL5Fqf1Z5n+fDohG
         H/Tg==
X-Gm-Message-State: AGi0PubaIGQuAzvLiB8Lqaw19UjXZnHgF0LWq0ZFHJMsm00/SGvpaYW0
	Rqc6WqaFVsZ9no3sq7bTPFTFISyp3O8/Hcplnwo=
X-Google-Smtp-Source: APiQypJii8vnmKfUcQLtiRJm99mQrHLvIlEwW7Hjt6BP0DAq5RtTHbvDUIMg7h8g53FKgRkYiAaMJVvzlmSUDz25tlc=
X-Received: by 2002:a17:906:2962:: with SMTP id x2mr19357008ejd.233.1587472425542;
 Tue, 21 Apr 2020 05:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200421093732.29192-1-dan.callaghan@opengear.com>
In-Reply-To: <20200421093732.29192-1-dan.callaghan@opengear.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 21 Apr 2020 08:33:34 -0400
Message-ID: <CADkTA4NGkRXf-jmvX9TooAEAr9RiA+0dWr01icYAKkp0yZZPCg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: copy some more needed files in do_shared_workdir
To: Dan Callaghan <dan.callaghan@opengear.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 21, 2020 at 5:37 AM Dan Callaghan
<dan.callaghan@opengear.com> wrote:
>
> We need to copy include/config/auto.conf into ${STAGING_KERNEL_BUILDDIR}
> to avoid module compilation errors like this:
>
>     | make[1]: Entering directory 'build/tmp-glibc/work-shared/machine/kernel-source'
>     | make[2]: Entering directory 'build/tmp-glibc/work-shared/machine/kernel-build-artifacts'
>     |
>     |   ERROR: Kernel configuration is invalid.
>     |          include/generated/autoconf.h or include/config/auto.conf are missing.
>     |          Run 'make oldconfig && make prepare' on kernel src to fix it.
>     |
>     | make[2]: *** [build/tmp-glibc/work-shared/machine/kernel-source/Makefile:641: include/config/auto.conf] Error 1
>
> We also need scripts/basic/fixdep to avoid errors like this:
>
>     | make[1]: Entering directory 'build/tmp-glibc/work-shared/machine/kernel-source'
>     | make[2]: Entering directory 'build/tmp-glibc/work-shared/machine/kernel-build-artifacts'
>     |   CC [M]  build/tmp-glibc/work/vendor-linux/tehuti-module/0.3.6-r0/git/TLK10232_phy_Linux.o
>     | /bin/sh: scripts/basic/fixdep: No such file or directory
>     | make[3]: *** [build/tmp-glibc/work-shared/machine/kernel-source/scripts/Makefile.build:303: build/tmp-glibc/work/vendor-linux/tehuti-module/0.3.6-r0/git/TLK10232_phy_Linux.o] Error 127
>
> And scripts/mod/modpost to avoid errors like this:
>
>     |   Building modules, stage 2.
>     |   MODPOST 1 modules
>     | /bin/sh: scripts/mod/modpost: No such file or directory
>     | make[3]: *** [build/tmp-glibc/work-shared/machine/kernel-source/scripts/Makefile.modpost:92: __modpost] Error 127
>
> Most of the time, the absence of these files is masked by the
> make-mod-scripts recipe's do_configure task, which causes a whole bunch
> of extra files to be built into ${STAGING_KERNEL_BUILDDIR} (including
> these two). Typically make-mod-scripts will be built before any kernel
> modules, and so it didn't matter that do_shared_workdir was missing
> these files.
>

The design is that, make-mod-scripts is what provides those files, we
don't want to copy them, since it is an ever incomplete list (more so
in the past, but the concept still holds).

> However the problem will be evident if you do certain sequences of
> tasks, for example a complete build first (so that make-mod-scripts is
> already built), then:
>
>     bitbake linux-yocto my-kernel-module -c clean
>     bitbake my-kernel-module -c install

Why can't we fix the dependency ? We chased a few of these around when
the mod-scripts recipe was introduced, and this just looks like a
variant we missed.

Bruce

>
> Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
> ---
>  meta/classes/kernel.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index a724645466..5a49d01aa5 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -452,6 +452,7 @@ do_shared_workdir () {
>         cp .config $kerneldir/
>         mkdir -p $kerneldir/include/config
>         cp include/config/kernel.release $kerneldir/include/config/kernel.release
> +       cp include/config/auto.conf $kerneldir/include/config/
>         if [ -e certs/signing_key.x509 ]; then
>                 # The signing_key.* files are stored in the certs/ dir in
>                 # newer Linux kernels
> @@ -460,6 +461,10 @@ do_shared_workdir () {
>         elif [ -e signing_key.priv ]; then
>                 cp signing_key.* $kerneldir/
>         fi
> +       mkdir -p $kerneldir/scripts/basic
> +       cp scripts/basic/fixdep $kerneldir/scripts/basic/
> +       mkdir -p $kerneldir/scripts/mod
> +       cp scripts/mod/modpost $kerneldir/scripts/mod/
>
>         # We can also copy over all the generated files and avoid special cases
>         # like version.h, but we've opted to keep this small until file creep starts
> --
> 2.21.1
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
