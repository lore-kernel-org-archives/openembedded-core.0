Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web08.56866.1606721934385536575
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Nov 2020 23:38:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eSkxHKjS;
 spf=pass (domain: linaro.org, ip: 209.85.219.180, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f180.google.com with SMTP id 10so10502179ybx.9
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Nov 2020 23:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y7TgLEZ3OlX1YKecdvn5KLqNkW5h7FPmd+i/Pm6YFVc=;
        b=eSkxHKjSxNnjMCxFSzkKYUVIOEjldFkKvxcGnbhwfrsFhud6JIWHnRJ5MeMeWDspA4
         hNTQd0zz38zK5VStk62Gy1kALCOQJ0bq03NgjW9G4Qg+8Dw8mYHtZ1w7lRNRKHN1FDs5
         /nKgVquniqlykW4bEMP++utyKRceCAY4iSHAmk4ZkQaHYH83AmjPrNC3ynCXH8FgtsDb
         EFhjhORH0oRPOaz/n9T1f/+yYkdxByWMus345jeIRLN+JK31go9dnFDCk/X8H9gw7Wc3
         7bpu2Re+ignpTxEyvjLpf0hXinMC6WC4v+8veG4dN1wPZtNNNEy5uMg97HJsWFstJpu+
         vAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y7TgLEZ3OlX1YKecdvn5KLqNkW5h7FPmd+i/Pm6YFVc=;
        b=iBXQD5+ECAU5FMi0qEYsCg0eB1KzAKjgRRJ5tH/1N1nOYaCMaD9khH/UVx4197g88Z
         k2z5bV3qIf83j5JyCx0/9dVLOHZ9QubPeME+w+Hp7iS+DnyJ/oo72aL6izcgavJxyYgy
         qSep8YcEs+Gs9RUHCcNt4Pg7+dshyXqdk26QEoGhBwTxm03MPoVyMVz9M8yOTiGS3HZo
         4KegumuyM47wJfX1WHe7TVuR405ZKtU09D5OQNQvqT+fXwdxb3Ya0FQa32Vn2JsoGWUW
         wWbLOyu5lrLET+hWWfhSnyMviohcg5pcJmDDvgHJGlajEJ+CimxNKKV+bQ2yK8HJgwek
         e+BQ==
X-Gm-Message-State: AOAM53211kfeIxTy/1kYyO+D9uCnmmXv667FiKrErESKcl94eaWfwO+1
	gzcZT535uuZXs//YsKRLRipztxzauqF7TGPXl3UROA==
X-Google-Smtp-Source: ABdhPJx7JrMgkeWr4C9/SZAy6l4Z+Fy6CYTxpISz9fl9IUWcOIC1ohyqaDDunEfuF2l8Dtr+CZKgq0USFWUrkgqy+Ig=
X-Received: by 2002:a25:ab2c:: with SMTP id u41mr31545143ybi.133.1606721933524;
 Sun, 29 Nov 2020 23:38:53 -0800 (PST)
MIME-Version: 1.0
References: <20201118045633.47396-1-bruce.ashfield@gmail.com>
In-Reply-To: <20201118045633.47396-1-bruce.ashfield@gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 30 Nov 2020 08:38:42 +0100
Message-ID: <CAP71Wjzp=9QWJLvANLXw2p6YtbgbZbK6yx0sxHVU2zBKB7x1oA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kernel: relocate copy of module.lds to module compilation task
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Steve Sakoman <steve@sakoman.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

hi Steve and Bruce,

On Wed, Nov 18, 2020 at 5:56 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> There were two copies of this patch floating around, and the merged
> variant has the copy in the wrong place.
>
> module.lds is only created during modules_prepare, and that target is
> not invoked during our main build of the kernel. We aren't about to
> change the kernel build (there's no need), so we move the copy into
> the compile_kernelmodules task. After that runs, we have module.lds
> availble to copy.
>
> This has been tested against clean kernel + out of tree module
> builds, and the dependencies are correct that the file is copied
> before the out of tree module build starts.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>


Can we get this patch into dunfell? This is fixing a bug for BSP using
5.10+ kernel, so I believe this is important for LTS. I haven't
attempted to backport it yet.. but let me know if you need help with
the backport.

> ---
>
> v2:
>
> I had done my test builds on a branch that didn't actually contain my
> change, hence why 5.8 builds where blowing up.
>
> I switched to the if [ ] model, since that doesn't run afoul of the
> exit handler. I do find it curious that the compile task behaves so
> differently than the install ones (even with set +e, I couldn't use
> the [ ] method.
>
> Anyway, this is tested against 5.8 and 5.10 + eternal module builds
>
> Bruce
>
>  meta/classes/kernel.bbclass | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index ccd74e61e8..8b28ee626f 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -391,6 +391,10 @@ do_compile_kernelmodules() {
>                 # other kernel modules and will look at this
>                 # file to do symbol lookups
>                 cp ${B}/Module.symvers ${STAGING_KERNEL_BUILDDIR}/
> +               # 5.10+ kernels have module.lds that we need to copy for external module builds
> +               if [ -e "${B}/scripts/module.lds" ]; then
> +                       install -Dm 0644 ${B}/scripts/module.lds ${STAGING_KERNEL_BUILDDIR}/scripts/module.lds
> +               fi
>         else
>                 bbnote "no modules to compile"
>         fi
> @@ -494,7 +498,6 @@ do_shared_workdir () {
>         # Copy files required for module builds
>         cp System.map $kerneldir/System.map-${KERNEL_VERSION}
>         [ -e Module.symvers ] && cp Module.symvers $kerneldir/
> -       [ -e scripts/module.lds ] && install -Dm 0644 scripts/module.lds $kerneldir/scripts/module.lds
>         cp .config $kerneldir/
>         mkdir -p $kerneldir/include/config
>         cp include/config/kernel.release $kerneldir/include/config/kernel.release
> --
> 2.19.1
>
>
> 
>
