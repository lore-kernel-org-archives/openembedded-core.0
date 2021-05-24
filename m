Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web12.23942.1621866912138242620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 07:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uQkQNaVJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id k4so16062890qkd.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 07:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sBQiilV6Sbhhkf1nHjHO462Yo6SBgZMIbezB3sBN7nA=;
        b=uQkQNaVJeU8drZvhwAlajCRJfLfAvaDc7CVI3AHtQhI+K5MxlQ3T+9b/kQgf5WgoNW
         gY8fsOGtjkfxTsjuRDWtdw+9G3x4pSY+z8tcS3aE4wvYKRvKpKK+nWTEX6iv0mcb6kuL
         46IfyAUYV7gC/CLk2DyAgJuv/w61JaaAksBGVJYHzyWMFi0OGbICzqZePs0klbsXIQeG
         dI3GN0afpF+NZ+TYe+35akyg50EauWYaHcPChi218aIzwYQcAhkCBVHm0KsOMWxfTLte
         BQ0lGuah1VWe6mKSM3bimg0F9BPOWe61K1isw7b/Gl495kdHdPOHvFLpWMAexOzeZXOk
         Ng1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sBQiilV6Sbhhkf1nHjHO462Yo6SBgZMIbezB3sBN7nA=;
        b=fI3he6iEFPIHJHyPrmVAKz/YEkAxH+vEGSNi4W4ea5CLEz6RTXqlV1M5LDoI0xNxtv
         0ljxd5x14pB7JEZsYyXLaBqLLzc6MTKLsIz0BGGmZfANTxIlAxdfhsAClFdRccI0TxoK
         19neew358trEfl+PMHR8kxxnOuzh9VmIZ7Wj909jRUUBmmLS92K5OOmM+ArLjvfR/41G
         gqjE1NHQg35WWPX1T3eUvXajt4tvjG27/yBB06NWSuC7329pke1kiZUGxgwBjk9U1t7A
         9ZA80TZB8BRHel3lAAmIDSYFQdAnl5Gj0qQ+a9MPnWDjj15WaHDIRBFMgiaq3gv76p2j
         ii9A==
X-Gm-Message-State: AOAM530DvGL43d2dMEBViigXzwzJbHJa6L4XXo+Ja+j3C+FiEBKa45Nx
	ij5KhXEMiDLwBwLPMwGDYH3B2EkRl+wV+US9oFCM3JGQBwQ=
X-Google-Smtp-Source: ABdhPJxTqp5XpB9eOvgNqjOggRqr0M+EPjMu45Ap0bEzwgIK4zVW0fGfZ1n+HrZsVpNfjKVNnHQWSTjZ98kVhVMKnSk=
X-Received: by 2002:a37:9c17:: with SMTP id f23mr29265403qke.125.1621866911152;
 Mon, 24 May 2021 07:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210523144532.325221-1-raj.khem@gmail.com> <CAAnfSTuiyaysU6ws05KEZ2W=5sEanWNa+kLFUFjj6k=X6Dg1Cg@mail.gmail.com>
In-Reply-To: <CAAnfSTuiyaysU6ws05KEZ2W=5sEanWNa+kLFUFjj6k=X6Dg1Cg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 24 May 2021 07:34:44 -0700
Message-ID: <CAMKF1soGj9bK=62XFhnpaDjqKPie42AJjP0fmoMW1cQNnGc9LA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] glibc: Enable memory tagging for aarch64
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 24, 2021 at 3:14 AM Ross Burton <ross@burtonini.com> wrote:
>
> +1 from me, I had the same patch locally that I was about to send :)
>
> I do wonder if we should start using that PACKAGECONFIG for these
> tunables, as on non-MTE hardware there is an overhead (albeit small).
>

for aarch64 it would be better to stay with common glibc for wide
subset if we can

> Ross
>
> On Sun, 23 May 2021 at 15:45, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Glibc on aarch64 has a memory tagging option that can be enabled
> > via GLIBC_TUNABLES="glibc.mem.tagging=$SOMETHING" when glibc
> > is built with memory tagging support and the kernel/HW supports
> > MTE. There should be no side effects unless the user turns it
> > on with approprate HW support
> >
> > Linux 5.4 headers and binutils 2.33.1 or newer is needed.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Rebased
> >
> >  meta/recipes-core/glibc/glibc_2.33.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
> > index 75a1f36d6b..c805755bb9 100644
> > --- a/meta/recipes-core/glibc/glibc_2.33.bb
> > +++ b/meta/recipes-core/glibc/glibc_2.33.bb
> > @@ -95,6 +95,7 @@ EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
> >
> >  EXTRA_OECONF_append_x86 = " --enable-cet"
> >  EXTRA_OECONF_append_x86-64 = " --enable-cet"
> > +EXTRA_OECONF_append_aarch64 = " --enable-memory-tagging"
> >
> >  PACKAGECONFIG ??= "nscd"
> >  PACKAGECONFIG[nscd] = "--enable-nscd,--disable-nscd"
> > --
> > 2.31.1
> >
> >
> > 
> >
