Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.2675.1593713676388931124
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 11:14:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vgj3qzpQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id dg28so24933751edb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2020 11:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=urdSlCN7YDTPffQzPrQYqgtOxM272/ukY8evhFFzNlA=;
        b=Vgj3qzpQlYVucmE5uU48ZvR05rH7reeFLlyUJv905MfPTEeRkCeioBJLBuzno9kg8S
         TSioL0Qg0qH6nPkAvtTc3/zOrS6YY7QSdvSYWzC7H2MBn+dWzAPjLln9BGfq/u+pOwZz
         i3lw3no7doQAmjl022DN/mHR2Af3sqImV20Ur/RCCNjjiZG76+YWZYE10WLArBJ85esw
         Hp6r/Dt37OWpDpPfkYYTxYMLIY1cPmuYZ0usol+ety5vh6tqDevZgAvqWdzMLhzReSyy
         HscT71SjN2rf3FYQ7auipx/Dgq0+LytBuD4FbaudE0L/rN4WUSHk5Dl3V4a2CjuMyhcd
         R3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=urdSlCN7YDTPffQzPrQYqgtOxM272/ukY8evhFFzNlA=;
        b=BM3V1BzRO1clxTXigjA/Qgx4UrRWtmHJTLGbR4Vo/r1YdwPD7wV6F57GuEVpbKPqyy
         Klz7RznNIa/cP3tFeGLR5YER/lk2aOhH4kHmk3D0MCi2V6VeIIQ/GiAtnos5gV4m6buy
         RkTQBflhxvQnhEz9+NMww5cPa7OrSzl5fntrMZtaPRP4uSiTteL8VTk+YkFAGy1hNKG1
         RE/3ngwQYsKSTUKR+5i1yIgSru9aVRGnb3fkxULIFJ+BtMqsIsbphzOVmgAwM4mFFdJI
         CZjZ9Ip1UH28xEFe79+dXvsUslTq0Oq3RLDYrrunMbrAUQt68EzK0WQKWgHu+WgNbAH6
         5oLA==
X-Gm-Message-State: AOAM531cFT7hzTTVtedNuNJ/TNK+z0ZpU578ej3P7V5PDgRVC68RD7et
	erQlFBzsjjuL0EIvhvb8bgja5fcs4lRYylLat2U=
X-Google-Smtp-Source: ABdhPJxpmYPDAsomCQEBBaOPpH3SLLcihYEABmdH1U9MUU+RxpX6DHmz8xA8mwBiYV8B1GKifBB0eI92i4utAlnyT8c=
X-Received: by 2002:a50:f385:: with SMTP id g5mr34858160edm.347.1593713674663;
 Thu, 02 Jul 2020 11:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200626054556.32056-1-lili.li@intel.com>
In-Reply-To: <20200626054556.32056-1-lili.li@intel.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 2 Jul 2020 14:14:23 -0400
Message-ID: <CADkTA4MkWVxzzhoos_Di=jhbgbMFn9VtT7_zgEpjci1EtOVV+w@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][master][PATCH] kernel.bbclass: Fix Module.symvers support
To: lili.li@intel.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Anuj Mittal <Anuj.Mittal@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 26, 2020 at 1:47 AM <lili.li@intel.com> wrote:
>
> From: Lili Li <lili.li@intel.com>
>
> Starting from v5.8-rc1 commit 269a535ca931 (modpost: generate
> vmlinux.symvers and reuse it for the second modpost"), kernel will
> generate new vmlinux.symvers instead of dumping all the vmlinux symbols
> into Module.symvers in the first pass.
>
> Error log:
>     'run.do_shared_workdir.16614' failed with exit code 1:
>     DEBUG: cp: cannot stat 'Module.symvers': No such file or directory
>
> This change will check the file Module.symvers existence before copying it.

This doesn't actually fix the problem where we still want
Module.symvers, it just ignores copying it to the shared directory.
But it will be created ones modules are built.

We either need a 2nd copy task, or we need to move the
do_shared_workdir until after modules are built. I'm looking into
which makes more sense.

Bruce

>
> Signed-off-by: Lili Li <lili.li@intel.com>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 20a0135fc979..a1219f315620 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -463,7 +463,7 @@ do_shared_workdir () {
>
>         # Copy files required for module builds
>         cp System.map $kerneldir/System.map-${KERNEL_VERSION}
> -       cp Module.symvers $kerneldir/
> +       [ -e Module.symvers ] && cp Module.symvers $kerneldir/
>         cp .config $kerneldir/
>         mkdir -p $kerneldir/include/config
>         cp include/config/kernel.release $kerneldir/include/config/kernel.release
> --
> 2.26.2
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
