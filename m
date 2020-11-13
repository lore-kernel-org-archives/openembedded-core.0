Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web08.8417.1605291002659100456
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 10:10:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=az+XB3ll;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: raj.khem@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id cq7so11758549edb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 10:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MfYw8xobC4DJjFKdjI7gA9KKtnwgpmUI7pWHpbLlRhs=;
        b=az+XB3ll+imtgwtCj5ANnS3fs4ULczwxO8g49P0cwWVi4JdxRG/FVYJAn+FEDslv5z
         avDtFN2I2HxiJg7iGYQ15Bp6OtfFZ/9cYxPoyw2fUwRCZkURJshdq5aYeWG7oIC0kCEE
         oAteSmu50cfGdRY3jOYM8Zv2ZEANirwxNgEOOxE+6Q7HQh0TPKAUp4bVeNMKKEK0whUy
         L6eXGFbUER14n9Rdlv3lLfXd3WierIH85uczuQ9bA8StfOTVlOct4D8Oeam5ITiTi9Ce
         VXD/bNAucd5xRj8QP8ldUc/chc/EgDNDIKc1+94EDyxPUhzLfSPL4xvNNFyT0WvH1/ck
         T6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MfYw8xobC4DJjFKdjI7gA9KKtnwgpmUI7pWHpbLlRhs=;
        b=m9g80Oz2XUXXQ854AKMcp02phYTbk24NV6hCYFY53Jv+ZnXNRXqoc3RkLWaP5tf/yB
         cU4q9LVM/hyj9VuS5dRS2BHiJ94w3+23QYhqfdxSHkoS8+9HxiXZWmvWmjyxMGa4bP5p
         vMkK4MuDbb1Fp6XQWrSDbT+yOIqZ7DuR3J+QlRXLsLiCdxcWgdyEzKmwM9ondFVPtafF
         SoCPycc225tf/9hiecxJLYU3XSKyDSiYQZtPpc+0/G6O5Ptu6BtkOW0ytvx5PP8qJoHX
         AvnDRULXVrb4K5xh2+cd1r1zXTZmfoDm+J2VJtiw/MyMWJe3OGWEeHtUsWwCvcmIwTwV
         gENQ==
X-Gm-Message-State: AOAM5303IQyCLGPKFtWAL+Et0aCIxCG229Y5paT49NtPN/ppn4zaulrp
	7ggGm83FisILVw7u6m/Q8TrpdpaAYXxqYEWBV59Orm55DB0xpA==
X-Google-Smtp-Source: ABdhPJxd/hbhmRG2reRB4CDuz23lc+HY1XdndFdUXFKz1ca2tFYiqBUhS+CHhH4NL21SPc0a7XeGqjjrYvLQCepWnv0=
X-Received: by 2002:a05:6402:30b5:: with SMTP id df21mr3750377edb.146.1605291000624;
 Fri, 13 Nov 2020 10:10:00 -0800 (PST)
MIME-Version: 1.0
References: <20201113063206.1716-1-bruce.ashfield@gmail.com>
In-Reply-To: <20201113063206.1716-1-bruce.ashfield@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 13 Nov 2020 10:09:33 -0800
Message-ID: <CAMKF1squzG-WAXMg6ncjvnfLqrxYT-YpFmR=i816DZ_QVWPBmA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: provide module.lds for out of tree builds in v5.10+
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, lili.li@intel.com, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 12, 2020 at 10:32 PM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> The upstream commit 596b0474d3d [kbuild: preprocess module linker
> script], adds a dependency on module.lds for external module
> building.
>
> Since module.lds is generated as part of 'modules_prepare', we
> must make it available with the other kernel artifacts in the
> kernel shared workdir, otherwise out of tree builds fail.
>
> This fixes errors like:
>
>     | make[4]: *** No rule to make target 'scripts/module.lds', needed by
>         'build/tmp/work/qemuarm64-poky-linux/cryptodev-module/1.11-r0/git/cryptodev.ko'.
>         Stop.
>     | make[4]: *** Waiting for unfinished jobs....
>
> We also ensure that kernel-devsrc has a copy to support on
> target module builds that are often prepared with 'make scripts
> prepare'. Those targets won't regenerate it, so the build fails.
> If 'make modules_prepare' is used, the file will be regenerated
> and overwrite our copy (as expected).
>
> Signed-off-by: Pan, Kris <kris.pan@intel.com>
> Signed-off-by: Lili Li <lili.li@intel.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/classes/kernel.bbclass                | 1 +
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index be93a258f6..ccd74e61e8 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -494,6 +494,7 @@ do_shared_workdir () {
>         # Copy files required for module builds
>         cp System.map $kerneldir/System.map-${KERNEL_VERSION}
>         [ -e Module.symvers ] && cp Module.symvers $kerneldir/
> +       [ -e scripts/module.lds ] && install -Dm 0644 scripts/module.lds $kerneldir/scripts/module.lds
>         cp .config $kerneldir/
>         mkdir -p $kerneldir/include/config
>         cp include/config/kernel.release $kerneldir/include/config/kernel.release
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 81b1e36041..5f0dedbdf7 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -100,6 +100,12 @@ do_install() {
>         # be dealt with.
>         # cp -a scripts $kerneldir/build
>
> +       # although module.lds can be regenerated on target via 'make modules_prepare'
> +       # there are several places where 'makes scripts prepare' is done, and that won't
> +       # regenerate the file. So we copy it onto the target as a migration to using
> +       # modules_prepare
> +       cp -a --parents scripts/module.lds $kerneldir/build/ 2>/dev/null || :
> +

I see there are more occurrence of cp -a in this recipe but I thought
I will mention it
cp -a could be perhaps made more portable with cp --preserve=mode,timestamps -R

>          if [ -d arch/${ARCH}/scripts ]; then
>             cp -a arch/${ARCH}/scripts $kerneldir/build/arch/${ARCH}
>         fi
> --
> 2.19.1
>
>
> 
>
