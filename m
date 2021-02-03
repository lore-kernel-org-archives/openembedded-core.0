Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web12.1882.1612382203639339407
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 11:56:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HuhHzcaP;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id s77so1000561qke.4
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 11:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NhK1INzqGWVhbI8bppUvGDDwrWdfYTQm7qx0RBTkFvM=;
        b=HuhHzcaPLtVUsDREvQes0sXSbfcaSUHHONLxVKw5mJdrCfSsxQFFNOf4mCrUh2yL+7
         s4PiGMizM+qaRCfBe927sb5X7N0SUaAk+XWYVGXvT2ExuUvn5LlJE5cTDo/kgXdqSyym
         GdT4IeptUXh2r8R4uxkHepSOezKznpPs0FafB7Xx7yaIonuu6B0trrnDS8O4ijPW5fh3
         u9tLyO1G608ESMcGoQ7jV0DWcCAm2cGtjOnSr9nMhPKIIuIfa4WD5/LOG+CDznK5FjdH
         eO+Z5Jq1JOsXJOATaK6QqJqhIo5EX62RLxKrWB7uofX2q8s0RZQXjFFsDElEWvymg+FW
         KJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NhK1INzqGWVhbI8bppUvGDDwrWdfYTQm7qx0RBTkFvM=;
        b=mJd1WJgjicux7gv4d3WS1U5DP9yLe0KJA7BoOPiL5WpYvhQx5mR0EMTiCbOVPHYCc+
         MBkR3YSg2tZrA0JRQi3hqiltCgOhMps4AiIB/Ia+XU7pgnw4z2poRGFvUxf2vFSnIQsa
         ngS2PpVsolb2xEXB/bBS2OVKBc66MJaO4Yyaqk5Oh9ovrqaupXuvsHhiTOLnmOEdOM1Q
         YOVpJ0pCQoJgjEPF6yfh0wAn906Hwruw9HXxPpfxqwyfY75mKI04cTlyP9sjbVaLeqUN
         OHMHRuYlt340b2ySKA8e0ynE53pgAxEpMoXQ4b4y+WWq178aNV8/hX9wV/qoxl1/lEy7
         FQ0Q==
X-Gm-Message-State: AOAM530IJohZwOwnGVG/LR/xcNZm9WVtb1ko9meCjmogtCPIdBTnaZaB
	AYySYGmixefz69Sb134GxxBDMX12G6rjs4wAZ+U=
X-Google-Smtp-Source: ABdhPJyCT4tWIDNzdRC0ccj/ip46rqKvEswQquJWSchnT7nrr5kTyk67aHLihlsUYJbS3tkmkiF+ksRMjAFg5j9K57Q=
X-Received: by 2002:a37:7047:: with SMTP id l68mr4046003qkc.337.1612382202769;
 Wed, 03 Feb 2021 11:56:42 -0800 (PST)
MIME-Version: 1.0
References: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org> <20210129102419.1360572-8-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210129102419.1360572-8-richard.purdie@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 3 Feb 2021 11:56:16 -0800
Message-ID: <CAMKF1srLi6QnKPva2rm2tE_SWvPz37k4M-egQcWjCBhL99=W0A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 08/13] pseudo: Update to include passwd and file renaming fixes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Richard

I am seeing compile errors for pseudo, it could be glibc 2.33
introduced and perhaps pseudo needs some forward porting ?

https://errors.yoctoproject.org/Errors/Details/566884/

On Fri, Jan 29, 2021 at 2:24 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Pulls in:
>   pseudo_client: Ensure renames update open fd file paths
>   pseudo_client.c: Rebuild passwd paths after chroot
>
> which should fix issues seen in apt package index creation, new
> binutils and other autobuilder race issues in pseudo amongst other
> issues.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
> index 29fa9152e2d..0ba7b503551 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
>             file://fallback-group \
>             "
>
> -SRCREV = "f9754ac14672c4af19b77bc698a1a808b0828265"
> +SRCREV = "8317c0ab172db47dabcef909bae02cd77b1f1010"
>  S = "${WORKDIR}/git"
>  PV = "1.9.0+git${SRCPV}"
>
> --
> 2.27.0
>
>
> 
>
