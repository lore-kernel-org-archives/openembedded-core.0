Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.21209.1621851299030337530
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 03:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=19uBmYYo;
 spf=pass (domain: burtonini.com, ip: 209.85.221.48, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f48.google.com with SMTP id y14so25854119wrm.13
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 03:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PeiDEMnKfaXjg1VTLeaN/frrnylsy7T+A58Ad/WJBTM=;
        b=19uBmYYoCUx6GJJuB5nXcKovpS9us+qKxTL0okojs4QwWDlGCGvvCF98GsS8aRDyUY
         /kWJaZgLSBv0munEFDFRq25EE3H2zmkNQbJxwyFyrT77MS+9icpuRvBmmGvW/hU592bp
         AWAHepC+6jOT7Sk3RaxUkszV2yzYaKVMwxWKlvOe7koxzCKjt8kHWe8rd3EUZReJWUDA
         2hGnoyjUCLJHagixFK5m1r0ZHr97S9xAtWWR2CrL/jWtEeRzyCHjm0nrEYBADSvP8RoJ
         Qxrag+lgSWrYPcM7lof6V9cfytxfYjF6mrTfp3VdPMkT1+ZFC4CQ1fk0RiYTG6Xv5Brc
         RBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PeiDEMnKfaXjg1VTLeaN/frrnylsy7T+A58Ad/WJBTM=;
        b=H2v+445dC4bjGZuNJDLQDSaydN/nVVccyt8FqZnifgTG/+T4VXuLgnLoJHnXFHhKch
         ZF0CfT0vJOShiV3SnEkuSNonoqzabQORtN5lYNHwN76lZBVoNy8AvBlTSDULMtovau5l
         5TQjZi6VFzvgpAz9S9rPohEIQHORd2xdNPB38roODRj0ulYkZ8UvIeCguSVtNZHj5grx
         rm///CFzq92bxth/h21FAJ8BZ8mGpTTMnQ4hxGGxOxZ7H5jZg+5DgCjmXQJKJfrIZOow
         rZ+MwsZRBLkYZ404cdCMK1JAJgw17zutXNcyNcPOPGhvs6b9BKN2ZQ0nfQ6LbPfDTiuG
         Cz4A==
X-Gm-Message-State: AOAM532DAVE+rYpB6uxuBVyr2hSESNpKHrmauNYkpK1RLtuDoZPooNju
	Ofv8pKgcpWzBREa/IgXd8xr42wEpDtaiTTv7PTn++w==
X-Google-Smtp-Source: ABdhPJyCZF1Cbuy/gqBdD/V+Hdon4uRhUy7vzOhqX+Hx43Jzj9/FlqMK9lBpSCs/F9fW4XLLmhGIsyU/akNj80t0KpY=
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr21820396wrw.109.1621851297406;
 Mon, 24 May 2021 03:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210523144532.325221-1-raj.khem@gmail.com>
In-Reply-To: <20210523144532.325221-1-raj.khem@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 24 May 2021 11:14:46 +0100
Message-ID: <CAAnfSTuiyaysU6ws05KEZ2W=5sEanWNa+kLFUFjj6k=X6Dg1Cg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] glibc: Enable memory tagging for aarch64
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

+1 from me, I had the same patch locally that I was about to send :)

I do wonder if we should start using that PACKAGECONFIG for these
tunables, as on non-MTE hardware there is an overhead (albeit small).

Ross

On Sun, 23 May 2021 at 15:45, Khem Raj <raj.khem@gmail.com> wrote:
>
> Glibc on aarch64 has a memory tagging option that can be enabled
> via GLIBC_TUNABLES="glibc.mem.tagging=$SOMETHING" when glibc
> is built with memory tagging support and the kernel/HW supports
> MTE. There should be no side effects unless the user turns it
> on with approprate HW support
>
> Linux 5.4 headers and binutils 2.33.1 or newer is needed.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Rebased
>
>  meta/recipes-core/glibc/glibc_2.33.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
> index 75a1f36d6b..c805755bb9 100644
> --- a/meta/recipes-core/glibc/glibc_2.33.bb
> +++ b/meta/recipes-core/glibc/glibc_2.33.bb
> @@ -95,6 +95,7 @@ EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
>
>  EXTRA_OECONF_append_x86 = " --enable-cet"
>  EXTRA_OECONF_append_x86-64 = " --enable-cet"
> +EXTRA_OECONF_append_aarch64 = " --enable-memory-tagging"
>
>  PACKAGECONFIG ??= "nscd"
>  PACKAGECONFIG[nscd] = "--enable-nscd,--disable-nscd"
> --
> 2.31.1
>
>
> 
>
