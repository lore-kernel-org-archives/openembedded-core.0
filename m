Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.2356.1605328037437144128
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 20:27:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X4SCo6+e;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id za3so16836067ejb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 20:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Eg/qGBsR0IPyrqlDYazs9WHraSgazLPxwPt/TI3C4qs=;
        b=X4SCo6+eCZyBDGGyBBFyp7ISBZy7qbH5w+0BQf8fkseyags7dwM9HCH6T8wqid53xp
         DdGEz1ezhplbuob6uhWPBZ+WUpwYB7tN9wkNn/t+9Wc/KcODqlWX1QkZ/yMBtw9ZowXe
         bYJPshNvtTVwLCwjkcHPSreGk/SS59TYRfMZRT5/3Nsus9wG07f6+sazZ/YCQJWRpybh
         MZUuUlZTKM/HHuK7MhGL1rZClrfhC/ix/Q9zQjXEvkW6s9elNNqh06dKrKcoBTtEFE06
         YNfffJYOtDfeM73FrqTItI75/3/rbihc/xg2kTHYl/QWcKaSIylqblhLQIxyF9xBScgX
         VIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Eg/qGBsR0IPyrqlDYazs9WHraSgazLPxwPt/TI3C4qs=;
        b=svBvrj3eBu+hYlKYamJzk0Ili2cJmiLdb929zjrZPAuF/9jCVjUS5XqihQEiOLZx7B
         Iw/QShbpBCiqT5gdT1G7IIrsUQtWD2LzqRfrxqjMlbPB9a8PRG2h5uW4GMUSe7D+TjCx
         JYyJOCfqivEK/aLEmKj2J3YMr8UWETLZJYapv/+acQwrNqjaLU3/rjYb8C76psBvHYb+
         kjuH2Xsa7HAuYPe34kjb7PdrmTTPTVHaEnT39KbfLK/KkeAUYa/u6ZXHYes4CdKTWFXp
         3bfyQCVnTLJQGBfSXs3xCiKr/eXo53bn8xSdRofVzfMyKA6InNgNSkimB/Oj/vNYmOCQ
         50Xw==
X-Gm-Message-State: AOAM530SIvrHcClNtxCiHArV8HxvLf+Ypd9RQDB6mk1M7sTm+cpcpuc9
	nFsxsHEoKXKo1T+oiYPbGxzSARI+TI/I7GP+9tU=
X-Google-Smtp-Source: ABdhPJx9z8GbFAxgYBIP3MpGFB4OTlIZ9olI5ZD5nXr28bB7G0y4a4VQA5GXkIs43u9ieoLKKEoZ57YvM8Uo9N40om8=
X-Received: by 2002:a17:906:3644:: with SMTP id r4mr5189529ejb.517.1605328035921;
 Fri, 13 Nov 2020 20:27:15 -0800 (PST)
MIME-Version: 1.0
References: <20201113063206.1716-1-bruce.ashfield@gmail.com>
 <da1c1435-f884-6d74-e6ad-292cf0a3f47e@broadcom.com> <771b373d-927a-4ac6-8716-b51f2b6d355f@broadcom.com>
In-Reply-To: <771b373d-927a-4ac6-8716-b51f2b6d355f@broadcom.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 13 Nov 2020 23:27:04 -0500
Message-ID: <CADkTA4Mv6LTzaNz9Vz-OvxmArRE9tiUagf_fX8=t4t_NOsSVbQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: provide module.lds for out of tree builds in v5.10+
To: Scott Branden <scott.branden@broadcom.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Lili Li <lili.li@intel.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 13, 2020 at 11:19 PM Scott Branden
<scott.branden@broadcom.com> wrote:
>
> Sorry, spoke too soon.  Doesn't seem to work from a clean build now.
>

How so ? Works on repeated clean builds here. For 5.4/5.8 and 5.10

Bruce

> On 2020-11-13 9:53 a.m., Scott Branden wrote:
>
> Thanks, works for me building external kernel modules.
>
> On 2020-11-12 10:32 p.m., Bruce Ashfield wrote:
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
>
> Tested-by: Scott Branden <scott.branden@broadcom.com>
>
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
>   # Copy files required for module builds
>   cp System.map $kerneldir/System.map-${KERNEL_VERSION}
>   [ -e Module.symvers ] && cp Module.symvers $kerneldir/
> + [ -e scripts/module.lds ] && install -Dm 0644 scripts/module.lds $kerneldir/scripts/module.lds
>   cp .config $kerneldir/
>   mkdir -p $kerneldir/include/config
>   cp include/config/kernel.release $kerneldir/include/config/kernel.release
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 81b1e36041..5f0dedbdf7 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -100,6 +100,12 @@ do_install() {
>   # be dealt with.
>   # cp -a scripts $kerneldir/build
>
> + # although module.lds can be regenerated on target via 'make modules_prepare'
> + # there are several places where 'makes scripts prepare' is done, and that won't
> + # regenerate the file. So we copy it onto the target as a migration to using
> + # modules_prepare
> + cp -a --parents scripts/module.lds $kerneldir/build/ 2>/dev/null || :
> +
>          if [ -d arch/${ARCH}/scripts ]; then
>      cp -a arch/${ARCH}/scripts $kerneldir/build/arch/${ARCH}
>   fi
>
>
> 
>
>
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
