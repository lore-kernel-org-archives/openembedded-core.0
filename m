Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.6086.1599049770822936993
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 05:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EiIYglFL;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id a15so3705550ejf.11
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 05:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZyspOaf6rbKX5zGNckV9+7L3ly238ihCxR9tO6inxh8=;
        b=EiIYglFLl9uxNaRLtW1edI3kVekNOLy0cZTDh52ozilSGQR3Li687xiut1Arz8h3X3
         4tvXSYXQT7ejQZT2uAgEmvfVLpD8u38Pk/TgdWmeBeeTLTkz1kGY7VsFLY5DltcwbA97
         rdHGO2Ib9A9XkQa27lb+QHSOQN5j218culEnBVJae3BdoqeDq15ibiPKOSI0VMA/LkMo
         ZW8GU7wZVQL3WQmSAAj1frAdzPU9m1KL0/XQeyfDD2Wf4dVq/C5VykIfdPLuzvR2uFC5
         3isrmGOFPcyovqjRkHnYkPlZI6qMiZYJhCsqm4GkjBDFA/ayx31GGrfRsIUsM5b7ySpK
         q5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZyspOaf6rbKX5zGNckV9+7L3ly238ihCxR9tO6inxh8=;
        b=bFAdasQjQhBcD6X7zGPLNUpNhsEHLOtMdAIgrSW87vkRs0Z8Qw5aODRcYVwrBKaCYB
         DHBUhsNlOO0kt4tGeJVr2CFhWlmEnSSmMhI0AIt2xkQ66TmZfeOnsUdpOx4MgiOgBNMM
         A//UfYB9TVk6+FsDtFBLF3nMRG3lRYjOJ+kgQO0lozAJrHwmpZcCDiR6kf1BxgC+ngcs
         gN/lw8h0tT/FIIWg4Kc+G22keMasPIVnFR+pjVcDVaSQOZ+VYQUZef2x+oU8l2P8FLnz
         3CjtIluBCZV6gF8T3wU+TL6UlS/7BQP2oGduYl9p0jn7OuDonCPSHHhtWsx6c5GTwgw3
         +6BQ==
X-Gm-Message-State: AOAM532xvYWa6J+qdDO9fnp360xXl50JLhLY9FPi6A/y3auABoo5aYKx
	FmcfN8/H6eCfqjcgammUGAs1WbTMgHDoiH/fg3s=
X-Google-Smtp-Source: ABdhPJx4yDJ5a77r6PnPyq7UY9+Ir30s48g0fA/cK5izX9Yq0u1ycCbdn0wetZsnb5MPq8JIvclll9Bu7uglN3kApkY=
X-Received: by 2002:a17:906:46d5:: with SMTP id k21mr5882488ejs.247.1599049769093;
 Wed, 02 Sep 2020 05:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200902031936.3804-1-yanfei.xu@windriver.com> <1630F678AD724BF5.30785@lists.openembedded.org>
In-Reply-To: <1630F678AD724BF5.30785@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 2 Sep 2020 08:27:34 -0400
Message-ID: <CADkTA4ME0V1fR=1cN8Q0DNcgZBebQOjoMgeoi+iSv+JpEhLdnw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kernel-yocto: Fix an inappropriate process with include path
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "Xu, Yanfei" <yanfei.xu@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 2, 2020 at 8:14 AM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>
> On Tue, Sep 1, 2020 at 11:20 PM Xu, Yanfei <yanfei.xu@windriver.com> wrote:
> >
> > From: Yanfei Xu <yanfei.xu@windriver.com>
> >
> > We just want to remove the first '-I' in $d, hence removing the
> > 'g' of sed avoid changing the real path which is include '-I'
> >
>
> The g was intentional. Is it actually causing a bug ? if not, I see no
> reason to change it.
>
> Anyone with paths with embedded '-I' have more issues than this sed expression.

Actually, on further thought. I'll just pull this into my queued patches.

It is my habit to almost always use /g on my sed expressions, but
there's no reason to leave this lurking (but my comment still stands
about configurations that have -I in their actual paths :)

Bruce

>
> Bruce
>
> > Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> > ---
> >  meta/classes/kernel-yocto.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> > index 96ea612258..b672a1143a 100644
> > --- a/meta/classes/kernel-yocto.bbclass
> > +++ b/meta/classes/kernel-yocto.bbclass
> > @@ -225,7 +225,7 @@ do_kernel_metadata() {
> >                 for feature in ${KERNEL_FEATURES}; do
> >                         feature_found=f
> >                         for d in $includes; do
> > -                               path_to_check=$(echo $d | sed 's/-I//g')
> > +                               path_to_check=$(echo $d | sed 's/-I//')
> >                                 if [ "$feature_found" = "f" ] && [ -e "$path_to_check/$feature" ]; then
> >                                     feature_found=t
> >                                 fi
> > --
> > 2.18.2
> >
> >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
