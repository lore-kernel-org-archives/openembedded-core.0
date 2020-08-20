Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.122008.1597963903975537496
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 15:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ujs2J7VM;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id g26so3033040qka.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2020 15:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+sFvCmpEbcPqieEtk0eL8sqkWmH1Cjqbzb+DNNsvd/c=;
        b=ujs2J7VMTRRzdSkWXivN9xvjvy0S33oy9Zid0f8NKu7t3aiS+mXQZverV8u3fpbEoa
         zrePNzX4+/6PRioO23TRc2GilR9fpkygxg0T6cHxFUs6nmcAh1rMqz+OAfyyo/X7Csw1
         H44pSB6ouWl7RfbPUuhYmwudw6cG+6Rs09PHeIl5A/LSRBGajyoIV5hZj7QABHBiYwEa
         /m5zuuKQr8SzlKt7tzkXv78lhIj1DJb4fWUhtYzj/JwwQ50TVHU2fJ7hrsgz/UiiFYy6
         gS6jR4sbSm1sSXlv+bmpgSWwa+U09q49HEwlGjEOkdXcnLZBywf3MjA+6LKQXfwAVpPG
         6cTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+sFvCmpEbcPqieEtk0eL8sqkWmH1Cjqbzb+DNNsvd/c=;
        b=t4Wy9MoBpaxKOr9TZ0LMswJ/v0ZnCvhjc+zuKeUtdFjQhI+Q/Djo0vYfpsBonJz/yp
         ni/YNNb+1jC+Ga5M8I0rxvz7b6h8+2yI6EQyUYpWCGC/pxGoOfYzq/OslCVk/CfAnKEP
         9NnZCJ1STtq/QDaLgUjofCvrMfLwXW3OsCm0ve1EPQiek2tdOsEUYmaUDDqmKhApnwrw
         EF9BMyoxCWIpHuYEEUALPv2wuiAaHuXrGmd3iSPmXTJjH5Jl6sGaIyObkKCHccuyIabY
         HKTzvjWP9JJLp2tM0WzZEGtLhoDqAAuAGLo1FffVxE/vr5WRQnUAJvP4nWiwhO1Fxu2a
         q/1Q==
X-Gm-Message-State: AOAM531g59exwr65iEhBwPfkfET79FRVD6H6V2hUAIy1CQQdiRYCwd3m
	F9/NLgsDBc2UVuBjmWWk0efUb0u73tvDRm0T1NY4WDmS/T0=
X-Google-Smtp-Source: ABdhPJxkuAeNdR+IV57J5w86hHy4vfvtGboeAIIBT/7Rv/3UtLZJxEyelwoY2MbK19LrITE6k9DnNbSgFd/QVG7/Qs0=
X-Received: by 2002:a37:9b15:: with SMTP id d21mr215107qke.9.1597963902930;
 Thu, 20 Aug 2020 15:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200820080115.2715139-1-raj.khem@gmail.com> <20200820080115.2715139-2-raj.khem@gmail.com>
 <CAMjhiJhf9zumg0_uC6xWwSZjqc6fHKh1Tze2jK51bkauwFco-g@mail.gmail.com>
In-Reply-To: <CAMjhiJhf9zumg0_uC6xWwSZjqc6fHKh1Tze2jK51bkauwFco-g@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 20 Aug 2020 15:51:16 -0700
Message-ID: <CAMKF1sqHahGfXMfPiFvAktLszvDg0gRwKAkRqhhi7qY4yGK+wA@mail.gmail.com>
Subject: Re: [PATCH V2 2/3] gcc-cross-canadian: Install gcc/g++ wrappers for musl
To: Leon Woestenberg <leon@sidebranch.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 20, 2020 at 2:07 PM Leon Woestenberg <leon@sidebranch.com> wrote:
>
> On Thu, Aug 20, 2020 at 10:01 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > gcc needs -mmusl option to be passed in SDK since we ship crossdk compiler
> > configured for glibc by default, this helps in creating correct
> > compiler defaults for musl based SDK compilers
> >
> > [YOCTO #13459]
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Leon Woestenberg <leon@sidebranch.com>
> > ---
> > v2: Delete file before creating wrapper
> >
> Thanks, v2 works and solves [YOCTO #13459]. We already independently
> had the same v1->v2 fix locally,  while we tested your v1 approach
> (and ignored the mailing list...)
>
> Tested-by: Leon Woestenberg <leon@sidebranch.com>
> Acked-by: Leon Woestenberg <leon@sidebranch.com>

Great thanks for confirmation, happy musl'ing :)
