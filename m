Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.2535.1623278429198149930
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jun 2021 15:40:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XJhbRz2b;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: andrea.adami@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id r11so30357497edt.13
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jun 2021 15:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=agiju6OsL1HVHbZHUnJtXJDUvzju2WutJCNxeHlS95w=;
        b=XJhbRz2bhoVJQLnzu1xs3wujqzEZoQvLEhEqd7WaNrb/dZ6lmKCMxwYepIvfNThQaz
         74NyEu1yDq16B+GonI4HIcQxkC4HlhYlaI1YDKR+5giWOpD7Xi43Rv+81TW2nOoayBEo
         DQW9YJX2FPDaHzlAwupLs8pgytQI/jv2dW7/L9wT2sLNudwo58p1OCer8SsLLrnqBD2X
         H/OsDBt9BjA/LJF0m9jedVa0tsorMftUqdH0v6necAJoHoA2DC5NEvlIYLdflF3BuGVv
         p++lVLul52uqfTAJ0YbDpnwD34Pvs5vKSsm3oQNO1KDRcEX6ikgZCg2GQ5fq9fl10M0c
         /TIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=agiju6OsL1HVHbZHUnJtXJDUvzju2WutJCNxeHlS95w=;
        b=pJOdxA6pWIDGjavVRolgchT5nHUON1PALkHQE492QFnhW4mmVicU+2JVPfStop50nG
         65MlJIxiBsmXLkM+Ss8AAVuHbJIOBjBNAIINv7T8EvDn5pyn1sLLg4FXroUk1H0PVW4O
         eG5ZscbYqi5klKONeyeLz15WkV5kuqUa5u3lTtBmzlexMXle0BwG/R9aFJz3Vb3ORCnD
         Pkvn1PC4c2YCrA1TZipYf4D/KJ1Uoev9Hauv6YZE9mY5nWaBfu1c46Xih8vcgf3GZhO4
         cyvqshLeZFt25AHeFGz7pC6e8X5DeUGnS0LZd32MVuBBGU4DUxdoiTGYQjVg7XOI7Fao
         3FkA==
X-Gm-Message-State: AOAM530roeC8XmS62g1tHv/ihFFUE6Op/GtHkrLkh+BMEBvyTyLdbyj/
	zOKIQzD/1QkfAhIizCbg7WI0QZlE6TCNovIfroo=
X-Google-Smtp-Source: ABdhPJyRWATcZO4Rb1WXJw0aV+uaRMHZipnQBQcLl8avXQcpg56xyBUWeOKvkuUeLMViABuGNYqVL+rMNDe7kRrfRls=
X-Received: by 2002:aa7:d288:: with SMTP id w8mr1570763edq.276.1623278427449;
 Wed, 09 Jun 2021 15:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210609072939.6058-1-changqing.li@windriver.com> <CAJ86T=X8aHodEfG2uRWsB31xDSf3OfUUhXxxL3+yY4dzTiGzfQ@mail.gmail.com>
In-Reply-To: <CAJ86T=X8aHodEfG2uRWsB31xDSf3OfUUhXxxL3+yY4dzTiGzfQ@mail.gmail.com>
From: "Andrea Adami" <andrea.adami@gmail.com>
Date: Thu, 10 Jun 2021 00:40:16 +0200
Message-ID: <CAAQYJAsGZ=juTKre1msSe2sqgKhkQ3Ek8vEO-NFT8GAnxb68bg@mail.gmail.com>
Subject: Re: [OE-core] [V2][PATCH] libjpeg-turbo: fix do_compile error on armv5
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Changqing Li <changqing.li@windriver.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 9, 2021 at 7:30 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Wed, Jun 9, 2021 at 12:32 AM Changqing Li <changqing.li@windriver.com> wrote:
> >
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > fix below error:
> > /include/arm_neon.h:31:2: error: #error "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
> > 31 | #error "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
> >
> > Neon is not supported by armv5, disable the simd extension build.
>
> Drop this comment. Neon may be missing from other ISA levels too (i.e.
> this fix is not specific to armv5).
>
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ---
> >  meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
> > index 7f91cc02ac..da21971113 100644
> > --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
> > +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
> > @@ -40,6 +40,8 @@ EXTRA_OECMAKE_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "mx3
> >  # Work around missing non-floating point ABI support in MIPS
> >  EXTRA_OECMAKE_append_class-target = " ${@bb.utils.contains("MIPSPKGSFX_FPU", "-nf", "-DWITH_SIMD=False", "", d)}"
> >
> > +EXTRA_OECMAKE_append_class-target = " ${@ ('') if (d.getVar('TUNE_CCARGS_MFPU') != '') else '-DWITH_SIMD=False'}"
>
> Shouldn't this be checking for neon in TUNE_FEATURES rather than
> TUNE_CCARGS_MFPU? It should also probably be conditional on the _arm
> over-ride since neon will be missing from
> TUNE_CCARGS_MFPU/TUNE_FEATURES for other architectures. Since big
> endian ARM doesn't use the _arm over-ride you will also need a
> duplicate line with the same logic with the _armeb override too. See
> the lines below which do the equivalent for _powerpc / _powerpc64 as a
> reference.
>
> >  # Provide a workaround if Altivec unit is not present in PPC
> >  EXTRA_OECMAKE_append_class-target_powerpc = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=False", d)}"
> >  EXTRA_OECMAKE_append_class-target_powerpc64 = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=False", d)}"
> > --
> > 2.17.1
> >
> >
> >
> >
>
> 
>

Just to confirm it fails on armv4 as well.

CheckSymbolExists.c:8:19: error: 'vld1_s16_x3' undeclared (first use
in this function)
CheckSymbolExists.c:8:19: error: 'vld1_u16_x2' undeclared (first use
in this function)
CheckSymbolExists.c:8:19: error: 'vld1q_u8_x4' undeclared (first use
in this function)

...
#include <arm_neon.h>
...
    3 |     #error "float ABI = softfp"

A.A.
