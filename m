Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.361.1601563029161607936
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2020 07:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iUbwc7Qb;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id gr14so8470722ejb.1
        for <Openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2020 07:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iLb0Rcv4qeQ+WL/4lWQID3rWY6ahqwve+OklK7ufFm8=;
        b=iUbwc7QbHLORaMoCVGpizVbttHwoOBUv2jvyir3qe6VOiXKml6Dsv7XpXccZi3D3s3
         ikgTiFXKFTWmsJuegyX4WGjhIa/jd0YzMYJ2jpHg6KVHpNyv0kxU3oOsn7+Zmg0U+C0+
         fq4fxp38lCoP5jbTzPyaE9AKI0g1NOBnv/rwEI7gnDyqahit1bD3L/8NEItT1CKHa0m+
         5rDA2rpX5LV/uXoiJl4Sp2lhAa21vbFGvJLhKuNYQUtrCC55mn/z+9MuqccUNZEuJiYX
         CHGEl3xeJUPh1k8FYk3E7cQQjsG40yAk4I6Q+PtpEbW6CvvrVmCdzKnLCsmAg3xcQYWJ
         /RcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iLb0Rcv4qeQ+WL/4lWQID3rWY6ahqwve+OklK7ufFm8=;
        b=i2PgBz4rFpfIAc9MNv/lVb2F3E13UHvtm/WqZTIlb+FhGLuyPr3CkeiJnrcM++qdAy
         pmqiam5n5nhP3c0vGzrmB84eJlQ+2XB1nQl2Sr0N7bYqOuRaOYOIOz24p4abXg1I9glj
         0hapkq6ymp416n/RX734KEmawsQRQ1YdOson82rA3YKxgBeK1ALu+FXZrzt3jaFnerUU
         K3Z/84tfvBdYm9WVTcqF9ePs4wbQyKkp3ujy7ArCU2WF4QfCfqOSP43SWMbQ77UlnWDU
         qVLEWEhgptmESyZx/RIVDlCKpO/5qa5cvQrzCY+dsHdl7cGZ89Wsa+0lMigSsN5W30Hw
         OFFg==
X-Gm-Message-State: AOAM5322n6DPOcAMkjIcM1gNxoKmL0MsWDaFzwDoqGGYssi0G/G+g0eE
	ZRiCdlirRgNk4Bz7Ybg50piQwvTnu/ug/T1zlrk=
X-Google-Smtp-Source: ABdhPJw2G16JJMwlJ1aqH91BEHE9Z7rXWOW3dDx2slZAFXUnzIABoh+Qxz17/pMedh2pq9QTEdcgk91pJ2FcmrPIDtY=
X-Received: by 2002:a17:906:359b:: with SMTP id o27mr7535808ejb.247.1601563027498;
 Thu, 01 Oct 2020 07:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201001135927.721794-1-uvv.mail@gmail.com>
In-Reply-To: <20201001135927.721794-1-uvv.mail@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 1 Oct 2020 10:36:56 -0400
Message-ID: <CADkTA4OZNhbMaykKi_pU_Af49D-wAjeqQ=3L-y241Lcj7TUd2A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] module.bbclass: add HOSTCC for out-of-tree modules
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Patches and discussions about the oe-core layer <Openembedded-core@lists.openembedded.org>, 
	Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 1, 2020 at 9:59 AM Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>
> From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
>
> Module build environment should be aware of native C and C++ compiler's
> environment otherwise kernel Makefile might silently fail for some checks.
> A particular example is CONFIG_STACK_VALIDATION when CONFIG_UNWINDER_ORC
> is used, Makefile tries unsuccessfully locate libelf, even though it's
> already available in recipe sysroot.
>
> Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> ---
>  meta/classes/module.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> index c0dfa35061..8a691922c7 100644
> --- a/meta/classes/module.bbclass
> +++ b/meta/classes/module.bbclass
> @@ -1,6 +1,6 @@
>  inherit module-base kernel-module-split pkgconfig
>
> -EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
> +EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR} HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
>

We already ran into this with the main kernel flags, and we don't want
to duplicate them here.

Why aren't what we have in kernel.bbclass working in your scenario ?

Bruce

>  MODULES_INSTALL_TARGET ?= "modules_install"
>  MODULES_MODULE_SYMVERS_LOCATION ?= ""
> --
> 2.25.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
