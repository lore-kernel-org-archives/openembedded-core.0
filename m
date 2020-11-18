Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.18498.1605666003902890179
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 18:20:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h0o3+0RR;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id g20so584257qtu.4
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 18:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bcu+lpGOqJuxj5T2OCfidWqsl2xfq2G8F9z6xePejV8=;
        b=h0o3+0RRDIPToVc9OWIJUM0oOqjI98+RODorNaQ84eEWeHMi+XuaZWNumJQ+XLRwHg
         KcjXHZYa/qAPUoalestEi47WtjewteIWSb2PC4OuepEEF+RyskZYUhU31W5MyDmYzm/J
         5swW8AkF44OpsLeY7oy7a86rObJd57NDHaWJ17QZ/nUpd5w/KiTAxwiB0oeTCh1eCVBR
         20Hhe/MmvENITwEpl0MUfIV0Yaceb/AAdM7IyoUw5dQW02+FQHFoaRW8cJ1ersCfVsvF
         RTb/yXITunPQQiIjukCG7CTPJGPvHm1ysEI8r6yV1qfXlkXhng95oozDYaegiwKP8dR7
         k/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bcu+lpGOqJuxj5T2OCfidWqsl2xfq2G8F9z6xePejV8=;
        b=K7aIgKGeuxPH/YRUc0g7LIMIvuaCGqgwdo/JM1Uavm9N1o5hhrSmiq3kqR7mIzqJx2
         YbT+1t1kEfDMyOtUcP9F5ZXaJXF0Qz3A3AEAjblBnZw4XDwcXtfNzFZZPSHz3lDf65nz
         aK29gxjj5BvoTHtIoA+BEoamWCxMgzEVnSm7fZOKj/jlcWsIh6JanzXNDHGrpbIzQjy8
         RqO277cfO6BonNcPLWtWND0FZNXzDnYkTw7YEZEzYTu+AqJieqcz420wJ+7FeUGlD10x
         Sjp9OU5sme1OTPqBFqreL5a4/pMf2lDReKWSI4yDEt6jp4XOBO0crgv7Wx4wFGVwcxYO
         Nf2A==
X-Gm-Message-State: AOAM530ZLERECRXddMVBa6ujBDJeOKlfdd2d2wcH4Y9KZqdtsucRR/K9
	3XG82at/17kWc7PfxP8w1EAajsn3oQGwLJQ3DS4=
X-Google-Smtp-Source: ABdhPJxPV5ezOhzphmrZ1GV8AXX3u7g4sIbnLUIjyKpys1V98ys/g9HgtBGHK0fCe0ATrGMdawt/yMxKJIfFBrA4NTY=
X-Received: by 2002:ac8:5844:: with SMTP id h4mr2794385qth.194.1605666002951;
 Tue, 17 Nov 2020 18:20:02 -0800 (PST)
MIME-Version: 1.0
References: <20201117140641.19575-1-bruce.ashfield@gmail.com>
In-Reply-To: <20201117140641.19575-1-bruce.ashfield@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 17 Nov 2020 18:19:36 -0800
Message-ID: <CAMKF1srGFphXgGN-RfnV35PGqpthR5XeEH87-djvx4_guWVcYg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: relocate copy of module.lds to module compilation task
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bruce

On Tue, Nov 17, 2020 at 6:06 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
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
> This is just a fixup to the patch [kernel: provide module.lds for out of
> tree builds in v5.10+], which v1 merged instead of v2.
>
> Build tested locally.
>
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index ccd74e61e8..af4c891de4 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -391,6 +391,7 @@ do_compile_kernelmodules() {
>                 # other kernel modules and will look at this
>                 # file to do symbol lookups
>                 cp ${B}/Module.symvers ${STAGING_KERNEL_BUILDDIR}/
> +               [ -e ${B}/scripts/module.lds ] && install -Dm 0644 ${B}/scripts/module.lds ${STAGING_KERNEL_BUILDDIR}/scripts/module.lds

This change fails the task if file does not exist

make: Leaving directory
'/mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/linux-raspberrypi/1_5.4.72+gitAUTOINC+5d52d9eea9_154de7bbd5-r0/linux-raspberrypi4_64-standard-build'
WARNING: /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/linux-raspberrypi/1_5.4.72+gitAUTOINC+5d52d9eea9_154de7bbd5-r0/temp/run.do_compile_kernelmodules.1515902:175
exit 1 from '[ -e
/mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/linux-raspberrypi/1_5.4.72+gitAUTOINC+5d52d9eea9_154de7bbd5-r0/linux-raspberrypi4_64-standard-build/scripts/module.lds
]'
WARNING: Backtrace (BB generated script):
        #1: main,
/mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/linux-raspberrypi/1_5.4.72+gitAUTOINC+5d52d9eea9_154de7bbd5-r0/temp/run.do_compile_kernelmodules.1515902,
line 175

however if I change the above fragment to


if [ -f ${B}/scripts/module.lds ]; then
  install -Dm 0644 ${B}/scripts/module.lds
${STAGING_KERNEL_BUILDDIR}/scripts/module.lds
fi

it works well.

and note I have used -f instead of -e since that appropriate check but
it does not matter if we use -e or -f it fails in same
way with the check you proposed.
>         else
>                 bbnote "no modules to compile"
>         fi
> @@ -494,7 +495,6 @@ do_shared_workdir () {
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
