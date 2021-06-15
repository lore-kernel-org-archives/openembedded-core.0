Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.5758.1623738188674705818
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 23:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qX+kLLM2;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: armccurdy@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id c9so16949705wrt.5
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 23:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vz5rKItqMEqrsi4h81tFQ7lEDjyZCSseDPctfQnfk0s=;
        b=qX+kLLM2uK/ekBN4f9veWuB4mdvi1mJr5GNd0KIfP4kiY41hFknzDG+yBrt9ULNROq
         sHs1W4hlhr1oCdKiiWEYMIIjnW1FynX2EuCsRXsn12ZKTYZr/bB6kZnrJiBPQRMZmK4n
         GEupaMACDu0tJZb5HXCB/R9mIV8yOSUj3lJB5kxljK3m4qpmQ2Cl5lQFe3jjccT0GD9v
         nX7SDQD0tb+CWe1hcQ+T56vU63aETqo47FWd+BMuP9QaOUGNB6EXv+6B0EqZdThHZqV8
         jtq5GYY5nat2cgGPHAl3r9BvYn2nsY5ZxJroFnYDm5njmCzCRY80RgKDG7SG5IOuzM4V
         X43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vz5rKItqMEqrsi4h81tFQ7lEDjyZCSseDPctfQnfk0s=;
        b=muVedJ63IoLTcCKw9fRVE75fdyvdaAXa0VY3+x07Y7NkAFWwUneRcaZYI05gcFVT/V
         8i3ULqvvOJZkaAZkRdmLD7zqCK8jWnllaI3Huk8fFdkn6iy5Jz8tF5W4UKYeDHZRH/+q
         HSZ8SemrbqWhoUZcJGsQ+bgiYnIY7dq+CtP4EvkdXh6xp4jX7/P9/juqmmBRN78+Sg1D
         fOyq0W37DuY/cAeid/UMqqcUcIu9Nfi2ouCP8dJmKdLoeT/P9tnDTQGGp3GKBTixYavm
         Bxa87auQPQDlK4Cailo3bqjVBoxTf2h1/ejXrKTgnXiMWXzHKwyembGuGxBVW76Vr+NF
         jUyg==
X-Gm-Message-State: AOAM530+UrmFjEVg1DP5XbYduLyhxone3ZOg7Fq3N5ep0q5NmfXgpY3r
	Dp8QUjmaHhSdnePcyhdkg9vH9f/eGGlvHyNiW/n2ZpGr
X-Google-Smtp-Source: ABdhPJyh530hczCeTkt1li6PENxm2HUo1VLoczXTt9N+JB4AoHirA6Hpl4/5jmckrQPW1oPLtawOUdQtg0qNGDBKBIY=
X-Received: by 2002:adf:f7c3:: with SMTP id a3mr9646389wrq.301.1623738186916;
 Mon, 14 Jun 2021 23:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210615035404.10376-1-kai.kang@windriver.com>
In-Reply-To: <20210615035404.10376-1-kai.kang@windriver.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 14 Jun 2021 23:22:55 -0700
Message-ID: <CAJ86T=UpWm8YM0S0tcBoTFBaG+bWqZxCNc5LB4o1jKz-qv8_-g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ffmpeg: link in libatomic on 32-bit mips
To: kai <kai.kang@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 14, 2021 at 8:54 PM kai <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> It needs some functions from libatomic on 32-bit mips too:
>
> | libavformat/libavformat.so: undefined reference to `__atomic_fetch_sub_8'
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> index 3ed009bbb7..f3097f8ebf 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> @@ -130,6 +130,7 @@ EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'mips32r6', '--disable-mi
>  EXTRA_OECONF_append_mips = " --extra-libs=-latomic --disable-mips32r5 --disable-mipsdsp --disable-mipsdspr2 \
>                               --disable-loongson2 --disable-loongson3 --disable-mmi --disable-msa --disable-msa2"
>  EXTRA_OECONF_append_riscv32 = " --extra-libs=-latomic"
> +EXTRA_OECONF_append_powerpc = " --extra-libs=-latomic"

Subject mentions mips, not powerpc.

>  # gold crashes on x86, another solution is to --disable-asm but thats more hacky
>  # ld.gold: internal error in relocate_section, at ../../gold/i386.cc:3684
> --
> 2.17.1
>
>
> 
>
