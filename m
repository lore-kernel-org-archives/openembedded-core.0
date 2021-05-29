Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.25528.1622324491703282827
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 May 2021 14:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M1tFNL44;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id 76so7710539qkn.13
        for <openembedded-core@lists.openembedded.org>; Sat, 29 May 2021 14:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XouMsYlTjyKy+k31QCSyBpBVeCk4fe+rPbYZb2gwaPs=;
        b=M1tFNL44mpCNaZTEHHKaJgjfb2zslDGRpAcRsida30oHdq6h8jiXKdY/upPzM+2zjt
         oNi+M3u695taZ+oHfSsYAIJ5p4IIJUIg774fJJu/ktkTi3J1RbX/RLkBZqwmaANK9/V8
         EFVIZFb6r5cUtVXJRK9wO3j81gDBhCpqBtSNpXjT7QvqOOUngebwk1M98l1d8gIQzf43
         53PTaSqmhho3xkuA4Y17poEEu5bVSuTYfEuw0YFhaxjTU48kxiiL1zygIYtpzL5c82Oh
         eVpgIcwPaqaruRhW99MiMQGxGz9BK3u1DbmUhUv49yv8hyZSzJtUCWSy/y3MEUOB0LJo
         bwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XouMsYlTjyKy+k31QCSyBpBVeCk4fe+rPbYZb2gwaPs=;
        b=o/QOva3hU6UHxiR5zrvDUfWx7lK5HiyY27OOcU9nRTrCOV2IB58VrIBVlPg+ubvjAp
         E6MZm55wEPd7hher6vo4waJ6AuH+/Axtp3SKn8cFADwfTshCoWQgIby1pcTT++RVLHPZ
         FHzGMiH8fAXvOa5GglTu4Hnt1UdKa+SNMh1jRherWztXXtkM+zOuC/++OtgvLb7FdnJ7
         GhDwIlQo4IyDM+5BD29oOMJfuYHZPxl5HasaIEsGE86xM9WWN6A4bwvmEA2lm6XuRFyG
         YII2/YVVBeI7/RV5XldAUivG6tFVQ9wPgaRnWj983lD/VUSM2j2+iSls95BxPv/hYNGf
         hykA==
X-Gm-Message-State: AOAM530UZNh8qc2aluGBAg473q0jJ2KFZyZVYRrd5ht6EDcpSZEAaqpn
	V0YeTENEVd8ajVe1izfjU6oED51qWF408cc+TUoTyeBIx5U=
X-Google-Smtp-Source: ABdhPJw0CmyYx5a+Pk0XWPqSCUuSmEvQH3aBeOW67+YwAPDdkZhk25v5pDRSAgn/7MIfR1bf6TcXF1xIgPGGfZraEgQ=
X-Received: by 2002:a05:620a:13a5:: with SMTP id m5mr9956731qki.119.1622324490669;
 Sat, 29 May 2021 14:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <e2e6ac-a52c-15db-8bc0-367da2c4a23a@crashcourse.ca>
In-Reply-To: <e2e6ac-a52c-15db-8bc0-367da2c4a23a@crashcourse.ca>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 29 May 2021 14:41:04 -0700
Message-ID: <CAMKF1soOHDqdXjf4apmAS3Mdxf2DaVQVoJ3GYqwRMpiJbLV+Mw@mail.gmail.com>
Subject: Re: [OE-core] cmake versus autotools in recipe files versus source
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Robert

On Sat, May 29, 2021 at 2:29 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   (yet another in an endless series of dumb questions as i get asked
> about these things by colleagues and realize i don't know the answer.)
>
>   can someone clarify the oddity of recipes whose source contains a
> CMakeLists.txt file at the top, but whose recipe does not "inherit
> cmake"?
>
>   example: oe-core's "lzo" -- the recipe file contains:
>
>   inherit autotools ptest
>
> but the unpacked source contains a "CMakeLists.txt" file (as well as
> autotools stuff).
>
>   is that just to give the user the option of building with cmake or
> autotools?

OE does not get to decide what build system a component will choose to
use and with time
many packages switch their build systems from one to other and some
add multiple build systems that
end user can choose to use one over other. What OE does is tries to
use most stable/robust one
that is supported by the particular community and developers, in some
case they allow an overlap for
few releases when they are migrating from one to other. So we wait
until new system is functionally
equivalent to prior one.

In example you cited OE is prefering to use autotools over cmake when
building lzo at the moment
if it so happens that CMake is what they are moving to and its
officially declared as supported them we
will switch to.

HTH
-Khem

>
> rday
>
> 
>
