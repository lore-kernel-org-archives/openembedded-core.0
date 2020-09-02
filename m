Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.5823.1599048865384055973
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 05:14:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jiG0A881;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id g4so379132edk.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 05:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5EdD3uhN14xNNCjuquZ7R3o1xqFeBOdKEVqsu75+DJo=;
        b=jiG0A881BiW8RjF9DOf4EnslW9VNr+uBS63iXUcfNEjybo/LPFzTioo9LCb0ZecyaC
         fNnPZjpTn9/TWt+w5rKWhFBNYHfbVB9a7r+VL2ZTcQ2TIQbS4W09o7tbjxh7rwWpNQUp
         0me5vzynE7Z36ZYX/w1uNojLSpU5jOdrwN1+aIUGhNzlSMFH7J22Atsa7cOdeDBo/VuW
         sRkjvsdycarUsv79uqPjwsLxTyufcyrhcxg8aXR3MFU22R0t17+z9xOT+5PNgiXZ8Z4f
         5PkZ6m1O3IYcFVgSvroshSaijKlPKWVAh65W0/psL/+qwekGdb4fCACdnS+shqKDSs4d
         w06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5EdD3uhN14xNNCjuquZ7R3o1xqFeBOdKEVqsu75+DJo=;
        b=uEt9S2u0fBJ6C5IB+Bmq7TORmdB8Xt3+sFF6U4+eXywruBiErHz6PG01E5F9jCcM1B
         myh7dBmnobwdszR5iLxv3w2l3LDIZySOuaHPTGE59svoIaXqzH2OfFXHQQ1wl96bFITv
         +zCylwdNQuVSz9opbq4dMfExaQcd0uOeHOb1MwQ65vMNW3OZNYGFq/LpL9J66PUJfCTa
         QBzpf2b3cFa8Dx7n0lz7vOTGwInTqG/CW7C04WFXJoa1k7cW0DpDGva0I7N51w4deVUM
         lBADCxJeXz/lUTMuo2UzG/D6StomnSBz82aIAd0wrWImiy8tgAXwWL0bPrLi2m29KhXQ
         CaMw==
X-Gm-Message-State: AOAM532xTwesut8eCj9bxtqF56Hxor5M6OsUZ0omixZ70nnZ7C85Jenl
	+OkYxzFw3iVp73G9y4EoE0pbRZSJnv5I01f6UHE=
X-Google-Smtp-Source: ABdhPJxsGO2QaDZ+QttYR/BpbhhN7N9h508vOsBlxdfxwGnUSXIMbwhOOz7dvSoFfMJjurZyDLQ3IZTTQIiuIaBRTEQ=
X-Received: by 2002:a50:e846:: with SMTP id k6mr5987742edn.27.1599048863524;
 Wed, 02 Sep 2020 05:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200902031936.3804-1-yanfei.xu@windriver.com>
In-Reply-To: <20200902031936.3804-1-yanfei.xu@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 2 Sep 2020 08:12:28 -0400
Message-ID: <CADkTA4PVQWoKZ_8aB3+E2QqkCjRKH5OygrqPdVO6q7TbbgtZ9g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kernel-yocto: Fix an inappropriate process with include path
To: "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 1, 2020 at 11:20 PM Xu, Yanfei <yanfei.xu@windriver.com> wrote:
>
> From: Yanfei Xu <yanfei.xu@windriver.com>
>
> We just want to remove the first '-I' in $d, hence removing the
> 'g' of sed avoid changing the real path which is include '-I'
>

The g was intentional. Is it actually causing a bug ? if not, I see no
reason to change it.

Anyone with paths with embedded '-I' have more issues than this sed expression.

Bruce

> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 96ea612258..b672a1143a 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -225,7 +225,7 @@ do_kernel_metadata() {
>                 for feature in ${KERNEL_FEATURES}; do
>                         feature_found=f
>                         for d in $includes; do
> -                               path_to_check=$(echo $d | sed 's/-I//g')
> +                               path_to_check=$(echo $d | sed 's/-I//')
>                                 if [ "$feature_found" = "f" ] && [ -e "$path_to_check/$feature" ]; then
>                                     feature_found=t
>                                 fi
> --
> 2.18.2
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
