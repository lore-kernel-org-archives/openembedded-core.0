Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web09.7060.1617310369740529759
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 13:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sOgTSaAt;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id e7so3375278edu.10
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 13:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5NpvlhlmQw6CQW9Wp8MjhiCGgImSwuqwIF+r4pagl3I=;
        b=sOgTSaAt8fMJqRQ3kz6X+jv8H/7DZA+XL1Hq+rWR+Lh2RnV7M7zd/Yyq7S2qr3IGl9
         6LPm4vutu6aKFlGFhf57zvZ9AvJPbL90hXtDTC28WjN1flYKlARAZ0BDdV614x+agIB0
         UeymSVDkNgCgIYhP0RWxY41s1h6L1k2S6W638HnY3rkRwKb0eQo6PHDMbYoRyRhalRAN
         AHaFLAi780+NOK5I4ZqIEjdy8d5NW5BfiS3luzp6MfqMv5kRAQdXwetPGb7RYOdce1IY
         3bT5+qi4mLhONT4MSqKd0h9qnMp0+zfFo/21jqB5huTvK6xGGAjcHxiXelJGWHbCEzgY
         85eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5NpvlhlmQw6CQW9Wp8MjhiCGgImSwuqwIF+r4pagl3I=;
        b=O1tyW/NpqjiEsvAwhtXCFqFw9+RESLuTBIDYKmJ7JeYHIO33Wn1vmPnGGrmrmtV6j5
         xfemrcNA4HVCh9G/Mou63QSZDx0ylOeyi9IcqW2aVuawIEfQ2EIVUPiHXbPFDBlPpALv
         XottDwZL/Z5xWrNMyMs7l6cVY4dWKMC+nzvCquiv/no3tbsJB+2RlmyffzXF9Qvntw4d
         V1ilewxawe+t2+XMVRY7/NrWZh1P0WR1pGhuwLTbG1/sqYMRJyT+vNAWhNNDMH8aKCBq
         FBppSo2FtI0h5RRtgaJ/NAZ3dQxMKD1WhdGkhHUCwMAXOjb0+UsTi7iZ6IHysviDzYlA
         CP/Q==
X-Gm-Message-State: AOAM530ZJp6dF5cc0ovlaQnJerKsg+4UZeBJLRSHsXovGq+ex5duiLvQ
	n1D7+cRP3dPTmkYDyMUU6rTLqiMbdOtXhUBxR9w=
X-Google-Smtp-Source: ABdhPJyzo54VAADdx/UTYHEf9q9skHp6y99P978EMozFlC0lB/JJANpHBx6ggR8wIalwpGa1vZRtGFgYnhw1MJLrYpE=
X-Received: by 2002:a05:6402:105a:: with SMTP id e26mr12060135edu.164.1617310368090;
 Thu, 01 Apr 2021 13:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <1617235191-37594-1-git-send-email-denis@denix.org>
 <CADkTA4PmeaiFRZLxFkJ=TJnWLcMHYnEn_tvNUwZ4N+uHV05S-Q@mail.gmail.com> <20210401203131.6sxb4rnpopuvkzni@upstate>
In-Reply-To: <20210401203131.6sxb4rnpopuvkzni@upstate>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 1 Apr 2021 16:52:36 -0400
Message-ID: <CADkTA4OYuHR_GF2pUmjEE=-YfWEy4KQwSjj7FXoxd+i37s=TMA@mail.gmail.com>
Subject: Re: [PATCH] make-mod-scripts: pass CROSS_COMPILE to configure and build
To: Nishanth Menon <nm@ti.com>
Cc: Denys Dmytriyenko <denis@denix.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 1, 2021 at 4:31 PM Nishanth Menon <nm@ti.com> wrote:
>
> On 09:22-20210401, Bruce Ashfield wrote:
> > On Wed, Mar 31, 2021 at 8:00 PM Denys Dmytriyenko <denis@denix.org> wrote:
> > >
> > > Fixes:
> > > |   CALL    /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/scripts/checksyscalls.sh
> > > |   CALL    /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/scripts/atomic/check-atomics.sh
> > > |   LDS     arch/arm64/kernel/vdso/vdso.lds
> > > |   CC      arch/arm64/kernel/vdso/vgettimeofday.o
> > > |   AS      arch/arm64/kernel/vdso/note.o
> > > |   AS      arch/arm64/kernel/vdso/sigreturn.o
> > > |   LD      arch/arm64/kernel/vdso/vdso.so.dbg
> > > |   VDSOSYM include/generated/vdso-offsets.h
> > > |   OBJCOPY arch/arm64/kernel/vdso/vdso.so
> > > | objcopy: Unable to recognise the format of the input file `arch/arm64/kernel/vdso/vdso.so.dbg'
> > > | /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/arch/arm64/kernel/vdso/Makefile:61: recipe for target 'arch/arm64/kernel/vdso/vdso.so' failed
> > >
> > > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > I like the lighter touch of this patch. I still can't explain why this
> > isn't necessary on one of my builders, but is on the other .. but that
> > of course isn't relevant to this!
> >
> > I've reviewed and tested this, so no concerns from my end.
> >
> > Queue the cheesy -by lines:
> >
> > Reviewed-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Tested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
>
> Sounds good to me as well.. Thanks for discussing this chain[1].
>
>
> Tested-by: Nishanth Menon <nm@ti.com>
>
>
> Though I still don't understand the rationale why would we not move
> CROSS_COMPILE from kernel.bbclass to kernel-arch.bbclass instead of
> having to duplicate it here? after all KERNEL_CC etc are in that realm
> and would'nt CROSS_COMPILE fall in that bucket?

It is definitely a valid thing to do as well.

My only hesitation is the timing. We are very close to release, so I'd
prefer the lightest touch fix, which is this one.

We can of course revisit in about a month when the release is out.

Bruce


>
> > > Cc: Nishanth Menon <nm@ti.com>
> > > Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> > > ---
> > >  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > > index 92ffa47..b2b50b9 100644
> > > --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > > +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > > @@ -19,7 +19,7 @@ DEPENDS += "bc-native bison-native"
> > >  DEPENDS += "gmp-native"
> > >
> > >  EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
> > > -EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}""
> > > +EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
> > >
> > >  # Build some host tools under work-shared.  CC, LD, and AR are probably
> > >  # not used, but this is the historical way of invoking "make scripts".
> > > --
> > > 2.7.4
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>
> --
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
>
> [1] https://lists.openembedded.org/g/openembedded-core/message/150143



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
