Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web12.14526.1588352088932506539
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2020 09:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Mp1SymHj;
 spf=pass (domain: gmail.com, ip: 209.85.166.65, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f65.google.com with SMTP id f3so5462137ioj.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 May 2020 09:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=pkIVu/l8ho2T8UKDlVmjIQQp9w0zCvkUG9It4Xx1EpQ=;
        b=Mp1SymHjHARLqdxdQTl8pUFy8qkCMduw1Z++S/QWC3SMbRlhq8paW/XIptsrIsVHDf
         gcDAVyJlWDI/TICZfVb3srkqVOeG9uTHxiMbEqzMP7J3kc/aO1QAmx0RY67i2V0Aj7mm
         QXFj/oEfM/K261ZnKlFMxkQWz1d7/r+BaAdQNv6RBw0pTzPxRabw1imQcOQXtPSkbUHx
         u19LYgJi/KZ+D1MDsbV/wBOjvWSso7RpapbTasnK+lp1kCs8FP3kwmMKIbdNzV8g4GUU
         Zzz62hnlDnLSjKFMZaelWxt4+1XxgSd1vsSlIgXrnQs5NmezjuGRxIWgCptXtYyk2mVq
         6KZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pkIVu/l8ho2T8UKDlVmjIQQp9w0zCvkUG9It4Xx1EpQ=;
        b=rpS1kiub4CNwjTS6CaJNiCAkzMSmtwZej8PgF0icLMEEhtPh+glCPplP/w37syTo5O
         mdek5DAriM31bJ3oFxzNGI0bjeD4HnxO9C0cI+g7sOPbJY9HevTia9bHUHtx9FGZbDgO
         Yyt2o7Ubji3vvtuA2nF+uW5NT5g11wgY/VGxoSN+bKxEirVB8j2PdUaWpCq/y9de1nzM
         T+gTayYjFkDHiD5sNi4Fz7ROjQF99aTOpjxyPM7nHbxW27sIYUptXaOfSDmptzsVRbgl
         6sWZ8JPgWcHO9g9g6BQ2qbbPPggwi4QBqpK+EV9xpvaqJCx8wHpD+KOXs2uTSqoxMimr
         Ax3Q==
X-Gm-Message-State: AGi0PuZ+ARwt8ojnj0u8G7KJQch5tjVbiuNuvzJJe9OxV6uGT2JZA1z8
	g4H7fyCWNB5mOw999bf6tjyoDHdomrc=
X-Google-Smtp-Source: APiQypLoJJPKtxP5MtqDZXgbY9xB0Rsktx6ey2Afuru/Q3zLR2pNS7BvuTW9BZ3l1Z9HOBYiVbux8Q==
X-Received: by 2002:a02:cebb:: with SMTP id z27mr4167145jaq.32.1588352087738;
        Fri, 01 May 2020 09:54:47 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:6039:4dc0:afeb:41ef? ([2601:646:9200:4e0:6039:4dc0:afeb:41ef])
        by smtp.gmail.com with ESMTPSA id s69sm1438194ild.6.2020.05.01.09.54.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2020 09:54:47 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 1/2] gcc-target: Ensure buildtools-extended-tarball doesn't use arch=native
To: openembedded-core@lists.openembedded.org
References: <20200501164602.1540633-1-richard.purdie@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <2d491ab5-3ac4-aa69-1abb-0696c6122b68@gmail.com>
Date: Fri, 1 May 2020 09:54:45 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501164602.1540633-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/1/20 9:46 AM, Richard Purdie wrote:
> A nativesdk BBCLASSEXTEND was added to gcc-target without realising this
> would pass arch=native through to it for x86-64. This heavily optimises
> gcc output for the host its running on meaning it can't be reused via
> sstate on other machines.
> 
> Add class-target overrides here to get the desired behaviour. All
> targets have been covered for completeness.
> 

yeah perhaps it should have been --with-arch=generic for non target option,

this looks ok

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-devtools/gcc/gcc-target.inc | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
> index 8cb432780f5..6263e814971 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -15,11 +15,11 @@ EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
>   
>   ARMFPARCHEXT ?= ""
>   
> -EXTRA_OECONF_append_armv6 = " --with-arch=armv6${ARMFPARCHEXT}"
> -EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a${ARMFPARCHEXT}"
> -EXTRA_OECONF_append_armv7ve = " --with-arch=armv7ve${ARMFPARCHEXT}"
> -EXTRA_OECONF_append_arc = " --with-cpu=${TUNE_PKGARCH}"
> -EXTRA_OECONF_append_x86-64 = " --with-arch=native"
> +EXTRA_OECONF_append_armv6_class-target = " --with-arch=armv6${ARMFPARCHEXT}"
> +EXTRA_OECONF_append_armv7a_class-target = " --with-arch=armv7-a${ARMFPARCHEXT}"
> +EXTRA_OECONF_append_armv7ve_class-target = " --with-arch=armv7ve${ARMFPARCHEXT}"
> +EXTRA_OECONF_append_arc_class-target = " --with-cpu=${TUNE_PKGARCH}"
> +EXTRA_OECONF_append_x86-64_class-target = " --with-arch=native"
>   
>   # libcc1 requres gcc_cv_objdump when cross build, but gcc_cv_objdump is
>   # set in subdir gcc, so subdir libcc1 can't use it, export it here to
> 
> 
> 
> 
