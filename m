Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.20096.1605677220972144456
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 21:27:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ipx3KZAx;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id i12so865206qtj.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 21:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CS7DErsqilulHpUx2jHSBDA//0doIKEJzZW8tsixzFM=;
        b=Ipx3KZAxkWOHRlB63cNs0F2q7BQfMpc9WB0rCElUqLEkzZMpW2n/g2SQFkRtYRw2Ne
         CBWXyFkmijxbcyXYD+OIYZ/XM5DgJcyGLpwV76cIuGmWuclatHnDJSzLdBpQoyff0moz
         dgEW8IYgQ48nHHmC7fiMHqPYSJTBbg4SRmpavr8sX2dazarlptRazcM26DdRx9rsTWyY
         w+qEpho0bTzCOyo/mVTjHLeGdHmb6lszyCCWkvn0Rm86lpx4aFJRyocTfhZ2Cqc8hOlU
         PaDMa05lfPDGYl6PKm2iGuOXusBzJyOuPw7saN3lfxIMEajLLdYReuyfar81yKLC3IeF
         KOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CS7DErsqilulHpUx2jHSBDA//0doIKEJzZW8tsixzFM=;
        b=N2wnRHx/+NvMzTJz7Duph8DGsDJdyiZcBEqzrNAxFH2UipqezlBwCyvuNFNpC/VeGv
         ATgNkGx2MJMwDAlkTw/RQtqtNNC22nwnIMOWzgUNFR9qbqMQi5PzWrC2ylufPxccZtQD
         OBf9vBITlK0DIv/2kmqsUp8eGTi8gy1ASDIm7qbvhw99PMhr5iKk2dGcBBiN8mLcp29a
         EjyhJ3icvSn9yMUoDswR5joXSCjBoQ1YQH9MR9bJOov9gezAeY6Sts3cE/lgv64fJDdk
         N/400y1MeazsSc+ivx7z+us+mOXLth68yER9Ay5c/WMU7UchkKx42+pnwFaUHsVff+hc
         lx2w==
X-Gm-Message-State: AOAM53050b83JVnIPe701vOxTovhHDDOt4j3uCGcOTLAc7P3CZIzmPiL
	oWX1xHWxosz4BR2RuTRVEHo02lIWgsekc7w+sX0=
X-Google-Smtp-Source: ABdhPJzZHsHqJrV5esBsdEbuHZ5FqEQEpcEvr0MTFSED/uleIT22iZrG93sQkoTWYXEPNmIc0ZreBWjRYS4UFf0ftbI=
X-Received: by 2002:ac8:3805:: with SMTP id q5mr3304841qtb.53.1605677220076;
 Tue, 17 Nov 2020 21:27:00 -0800 (PST)
MIME-Version: 1.0
References: <20201118045633.47396-1-bruce.ashfield@gmail.com>
In-Reply-To: <20201118045633.47396-1-bruce.ashfield@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 17 Nov 2020 21:26:33 -0800
Message-ID: <CAMKF1srTbkuaffVrAy61t=zGVigXT9aioq2Ky0s2FMgEf_a4PA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kernel: relocate copy of module.lds to module compilation task
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

thanks this version looks good and works too.

On Tue, Nov 17, 2020 at 8:56 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
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
