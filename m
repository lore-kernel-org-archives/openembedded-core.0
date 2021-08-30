Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web08.283.1630339387734236719
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 09:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QI7zZBM4;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id s15so8707237qta.10
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 09:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nc9algHhQBGQ8tloyXefgd3J1EeHug9GRzVli24u8xs=;
        b=QI7zZBM4Ej9AZO09cBOakuKO0Bcx9QqQQCydIEge0VIKRnpYgXt6RceyrpVls1H0ag
         2FOvu4xbPSsEjieW5O0Rv1pE9K4QDWeACTHqjoA1yZ0d8G0qRCMweILjFdjKW9oSRtMk
         tmyIlBaxgn5P9Up/HmZV5l4mQZauecVQbEawL+6zBsHfeDIWenRveNy2uSLcZPToZIfy
         tVKLJi9gzvUXK2WfiaLfy37VKxzApYW9e+9TRugmctk6zC+vAFhdRaZFC3OZy+pfdsr9
         JDqJcBSAGzFPz/FHAzoc5eoFdtfBznuDTesjGs1qkNfmEITvfsdeiTkHMXMqSwZhJPLj
         vSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nc9algHhQBGQ8tloyXefgd3J1EeHug9GRzVli24u8xs=;
        b=I0e0xpFSC/NJGB3Ro9E3RMYWAXyAUCNVbTRqbSW5Qu0shuQB1+/DuWcLivA54iMpjp
         j6NTMnP4nJZk9UpOpeYsibhyD5ry0IHAU0kHF7lOEy8Rlbu/p2o202Y3grbuuN/CzzgO
         Y8GdZ/ir3OAXywoKmeZV1uZ8KcWccjxaX4rIavXQqGVEjfnw7uRaEWWhjYSAItE0I/7c
         BMAjYjhzYfdo4WZR1jewMBJ5JD6nRdAb0bySCt9jl2tICcaoWS8UsMDVMXeix9fzY0ab
         e/pttSNzzn0Pqr8k5/NBTo7SUmw75E1LJ/UyM0kL3h7LKJzXXsBpf089f1eswbtk0ya1
         nzkQ==
X-Gm-Message-State: AOAM5309yW9Xl+f78qCVJfhwL5kI5Img7ve6yvYPRCvqBGK3Xy27cEXW
	N6LgOp1PVbVLN2lgF3THzqHBr6sre5ZuH1pFF3k=
X-Google-Smtp-Source: ABdhPJxR/I7E7GnydYpjy7vk+XNDw1MMMK4A/s8g/qysAVeELMPiIlQmzl3dd3X6PJBgzN8fu+FteAmQAXfvZ3y+8Ec=
X-Received: by 2002:a05:622a:1452:: with SMTP id v18mr5303911qtx.214.1630339386712;
 Mon, 30 Aug 2021 09:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210830104644.422663-1-randy.li@synaptics.com> <20210830104644.422663-3-randy.li@synaptics.com>
In-Reply-To: <20210830104644.422663-3-randy.li@synaptics.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 30 Aug 2021 09:02:40 -0700
Message-ID: <CAMKF1srpiU2R9DeCtkW3CzGCHTQd+DQgYJ8rPa1Juk-JFPtxmQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] gcc: disable zstd by default
To: Hsia-Jun Li <randy.li@synaptics.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 30, 2021 at 3:47 AM Hsia-Jun Li <randy.li@synaptics.com> wrote:
>
> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
>
> I think this script is a little trick, unless you disable
> it, it would consider it enabled anyway.
>
> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
> ---
>  meta/recipes-devtools/gcc/gcc-11.2.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
> index 9fd30f5..77dd94e 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
> @@ -90,6 +90,7 @@ EXTRA_OECONF_BASE = "\
>      --enable-lto \
>      --disable-bootstrap \
>      --with-system-zlib \
> +    --with-zstd=no \
>      ${@'--with-linker-hash-style=${LINKER_HASH_STYLE}' if '${LINKER_HASH_STYLE}' else ''} \
>      --enable-linker-build-id \
>      --with-ppl=no \
> @@ -105,6 +106,7 @@ EXTRA_OECONF_INITIAL = "\
>      --disable-libquadmath \
>      --with-system-zlib \
>      --disable-lto \
> +    --with-zstd=no \
>      --disable-plugin \
>      --enable-linker-build-id \
>      --enable-decimal-float=no \
> --

why do we want to disable it ? In anycase perhaps make it a
packageconfig for consistency and I would
think we should enable it by default.

> 2.7.4
>
>
> 
>
