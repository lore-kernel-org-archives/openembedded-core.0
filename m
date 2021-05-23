Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.10881.1621781070648876989
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 May 2021 07:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EnaxOdor;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id o59so12940135qva.1
        for <openembedded-core@lists.openembedded.org>; Sun, 23 May 2021 07:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ehFenOjYtj5roHdxmSeoZe10a7mpna5gG15epYAo2Cw=;
        b=EnaxOdorf/cdNN6j2QSPjmdEofqt564VwJkYvEVYRgelJoBPClCYORGwjdXn/xsKvj
         s+J8GsYWv8x6DPO8a2KGNIVhOPdD/pxB79umrZ//da4qqt6uPRWpa7L0jZRG8ZuWR5Jk
         Gd6s9QFq39ee4Dnx7TlUZ7T6EERprNqDMQoIqVfdFoyK6NvMHyDDW6I5ZNWeJz5vl80J
         W74NBp6TimvUA15NmGC3IBI0lZ8RJ1lkhbm+tu9apPVQOv8FQ2YyojWJPh2yQum9MFk8
         jJGMmwY6fpAohFvtj+zh9Z5hvhrWYkuNT8BE/CwRJoTCkEzdDnPGccOBcHKyU1xVpRHX
         f43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ehFenOjYtj5roHdxmSeoZe10a7mpna5gG15epYAo2Cw=;
        b=EkXGRtn79Xy38rHGfCK8lY8GrAcL2aw+W6cI20Dpm9UGePrK5vLQMCiCsJib63GdHF
         XKituYsRVvrBhFQVtpXLla1XQcav1x5wp0P5/hnHtD4J5zOx3S0jzwnCI1WUeKBWDcwf
         pYXUWudCf45ilO8rR2Fr+mHsqq+ixNSspvNw4V1vZIyabkdkqyuergJ13YpqGBu/X28h
         /nsCgl5s6a/VcyYOC2O9HHV3qAWQMM1fdTnowOIZ5ztUAVQt5nXNo1pNWs3OcFSHsVW+
         owiN7Iu75y90ScCi/u2gcKYDt8L1is9mxYeWEtdJoU7FQt5D0dQS7RntcfDGnGIMviY5
         4B1Q==
X-Gm-Message-State: AOAM5319sK0g5XRMhidiYOcm2zoKeX9vjInVUnP/Lugj64cffCyNbODJ
	bbyHCjL7pUAMAqnhonF7QTA9jlc2BYfTAJdX9CY=
X-Google-Smtp-Source: ABdhPJzguLPkBuIvsoZga0PQPXrW6RAPutbtPJssBtxBurkVh2TYNyp46OrVVpnlRwnMXhtZ2/THMn5wge6MGKGo2o0=
X-Received: by 2002:ad4:4e91:: with SMTP id dy17mr24691548qvb.55.1621781069753;
 Sun, 23 May 2021 07:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210523043047.2398841-1-raj.khem@gmail.com> <8a1dc1e96b491d0da3a8062a7941a63435eaffdf.camel@linuxfoundation.org>
In-Reply-To: <8a1dc1e96b491d0da3a8062a7941a63435eaffdf.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 23 May 2021 07:44:02 -0700
Message-ID: <CAMKF1sqZ78sg+5Z2AUu7tpzZVjqi0E7owm0=hVsmDPrWCzBu9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Enable memory tagging for aarch64
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 23, 2021 at 3:38 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2021-05-22 at 21:30 -0700, Khem Raj wrote:
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
> >  meta/recipes-core/glibc/glibc_2.34.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
> > index 0deb727ae4..37cf8ed85f 100644
> > --- a/meta/recipes-core/glibc/glibc_2.34.bb
> > +++ b/meta/recipes-core/glibc/glibc_2.34.bb
> > @@ -91,6 +91,7 @@ EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
> >
> >
> >
> >
> >  EXTRA_OECONF_append_x86 = " --enable-cet"
> >  EXTRA_OECONF_append_x86-64 = " --enable-cet"
> > +EXTRA_OECONF_append_aarch64 = " --enable-memory-tagging"
> >
> >
> >
> >
> >  PACKAGECONFIG ??= "nscd"
> >  PACKAGECONFIG[nscd] = "--enable-nscd,--disable-nscd"
>
> glibc 2.34 doesn't exist in master? :)

ah I should have rebased
>
> Cheers,
>
> Richard
>
