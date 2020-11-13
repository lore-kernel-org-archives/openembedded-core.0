Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web10.15263.1605235361045730416
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 18:42:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CZznm7p3;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id t9so8901844edq.8
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 18:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=snPPhsXH2p+M2+VUqI19e/ZE3N9RjOqUscHrjbUyzQ8=;
        b=CZznm7p3swGp7qkloZEE9DgRtSfG8+IrxFtGPwr8u3+PDpQd4T33k/ZjUKaH0Wu1R4
         8zYvPB+haDLV60DifR5Xkcu/7T6TJ3YaRcnxcW17OeqOXVjfS7PO+/sstWNqKuP5XyPn
         cNJZJUp+uH3QGC1AxrK73IRDPifGIO0zi8bOKQEkR2s14OnLiDRsiXMbTZc0EDQWnPjv
         64Osti2UVuCf8Eq5LgsXvrSyaEpVz0BhM5dW5oBxsd0bIISoZWXD1zR/qtj5jQtNIKHi
         zi0bSaJfXObOxWT6vEfKjpVum4i3EZgXWn3S2k5qaZwxf4b2pIx4ide/uBhG0nnX8RVG
         UEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=snPPhsXH2p+M2+VUqI19e/ZE3N9RjOqUscHrjbUyzQ8=;
        b=b3hEPi0RP8nTYrfnO1M9ar6yPkPQiUKMhLgjqJPCKCzRu9P9dSc/LDUe1grUzXCYku
         WkFWCRcuO9oaNkb2Vqyx287OyYzAPmSlvWpSA+lKJE5M2OXX9u6b9RbS2QwGZJsjvu+0
         E0ZcHwacPUZm6NGysNSB9DPfGUMNMKlL/QK50ptalUesAuTEl1ysd7TLjMmlamIsRojf
         c9EcSx4c/q0H3nTkMAHbpqUmBVP1siJRRqrZz+tQqQLfp3bk3li7NscBhHONd6h6KlW9
         31xpHKw3OsVFobOhmTesM9Xc0Be3UJ6W5ISMFo9IE8RbXBOMuhOlYAVgorWDf8UWw+KZ
         1B1g==
X-Gm-Message-State: AOAM530m11ATyxYVyLvissRc/RduyZj+gS+vyQbL9fSFMEAu0VatW61i
	w5HRdir4FF5e6XgNgwEyxXbJUaeHgcZnCgvOvGA=
X-Google-Smtp-Source: ABdhPJzxBwNi2b8FLuZ8hd6KbAqfn1omo6HYuMBR6U7ZmKJvrpop9A5InsR8DizEjFGYooDnXcl7TiQy57fGa1sbuGM=
X-Received: by 2002:aa7:c886:: with SMTP id p6mr329640eds.352.1605235359455;
 Thu, 12 Nov 2020 18:42:39 -0800 (PST)
MIME-Version: 1.0
References: <20201113021002.30015-1-lili.li@intel.com>
In-Reply-To: <20201113021002.30015-1-lili.li@intel.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 12 Nov 2020 21:42:28 -0500
Message-ID: <CADkTA4Po=it-hvSFG2KZXpKXWUxsPs-jLcnaWGTpwdUdc7RzgQ@mail.gmail.com>
Subject: Re: [OE-core][gatesgarth][dunfell][master][PATCH] kernel.bbclass: fix module.lds missing issue since kernel v5.10
To: Lili Li <lili.li@intel.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Anuj Mittal <anuj.mittal@intel.com>, kris.pan@intel.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 12, 2020 at 9:11 PM Lili Li <lili.li@intel.com> wrote:
>
> With v5.10-rc1 kernel commit 596b0474d3d9 (kbuild: preprocess module
>  linker script), external kernel module need scripts/module.lds
> for compiling.
>
> Error Log:
> *** No rule to make target 'scripts/module.lds', needed by ....

I have a similar change locally, but I do have a question.

>
> Signed-off-by: Pan, Kris <kris.pan@intel.com>
> Signed-off-by: Lili Li <lili.li@intel.com>
> ---
>  meta/classes/kernel.bbclass | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 9e3c34ad48..5c262f340e 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -358,6 +358,10 @@ do_compile_kernelmodules() {
>                 # other kernel modules and will look at this
>                 # file to do symbol lookups
>                 cp ${B}/Module.symvers ${STAGING_KERNEL_BUILDDIR}/
> +               if [ -e ${B}/scripts/module.lds ]; then
> +                       mkdir -p ${STAGING_KERNEL_BUILDDIR}/scripts
> +                       cp ${B}/scripts/module.lds ${STAGING_KERNEL_BUILDDIR}/scripts/
> +               fi

You really shouldn't need this here.

The only reason we copy Module.symvers is that the kernel module build
updates it.

I only have the single copy in my local change (since it is created by
modules_prepare), and I'm not seeing any breakage.

Were you seeing somewhere that it was updated, or something that was breaking ?

Bruce


>         else
>                 bbnote "no modules to compile"
>         fi
> @@ -465,6 +469,11 @@ do_shared_workdir () {
>         # Copy files required for module builds
>         cp System.map $kerneldir/System.map-${KERNEL_VERSION}
>         [ -e Module.symvers ] && cp Module.symvers $kerneldir/
> +       if [ -e ./scripts/module.lds ]; then
> +               mkdir -p $kerneldir/scripts
> +               cp ./scripts/module.lds $kerneldir/scripts/
> +       fi
> +
>         cp .config $kerneldir/
>         mkdir -p $kerneldir/include/config
>         cp include/config/kernel.release $kerneldir/include/config/kernel.release
> --
> 2.17.1
>
>
> 
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
