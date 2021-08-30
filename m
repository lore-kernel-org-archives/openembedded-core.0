Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.3002.1630356949096270668
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 13:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TEb5hJ9i;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: andrey.z@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id m4so28123822ljq.8
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 13:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RP8lW32/GeSyhm/WCE8vHSSmVUwHPzPrPTGEXlAmYDI=;
        b=TEb5hJ9iWqwpiZaIFsiruO4qVh/NZS132XKT97nIK+l0O8HOrCWKTffGSifD0rFuQm
         tZ7f5X4FlszGr1GcbtvImXJKqnAk2Fthu3tV6nT3ekWu5Q0ozL4YDOBHG2yhJ6hK/Blx
         bOyCkFJy2adAKP8rI5iHVSnYTvuqJSSbC2b8t2YUvjIOXAQxlyRrrXIU6Mgt1E6CLScl
         6z6WYro1oGgH4Y+cn0o17gbn6sU3qO5xM+jdG2H3T/KRnPcc4shYEX7U7IkV1QuCA9Q+
         0jpeShstrsErkejxwrlp+oQGCaf6Vipgfv3QqdBwxjcFQxrkWjbLHJnH3W9bkev2XYb2
         7xyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RP8lW32/GeSyhm/WCE8vHSSmVUwHPzPrPTGEXlAmYDI=;
        b=LbmEuHqkxgEISe6l/H6NbAdPvehIyjCOpuN+Q7HMnwujD8XdAvUUAYlgRlvWw9D4gt
         +QiJfxeVZ6habrasOKzrxPqQXq6cX2CzUtADElM4wpw4sBMIUpD1ihf34nYQS5G3TioG
         Sgm/DxO7dOGJhdq7TWIjoWhyunb1oYK94/vJKV44S7OiAK3Ffp7pbJH2N8D7rBtknZtn
         3cX12Owfn19rwY4EXJ0goj1oyCz2M/w/Qh+KHgQbhZBwRweJvhQO2/EHKNAC/dy2NoPi
         WAbaQYv24vhAjbkc4XX11IqpYvVHEZM/0PxLoxSHZO4VACRf2lmwr9gmPYck0A+qnMqo
         kaEQ==
X-Gm-Message-State: AOAM5331oshQjhIhkUbhKMoC3vuhzHNTBInC4Dgq032u49Fjsgv90e0s
	HQ29JvF0jHYGwM+vrpnYaVP6mw4pibDL5zD1vZg=
X-Google-Smtp-Source: ABdhPJy5AlOr5UknYbidPmFFnwiLAtwkIgYlMegEIYnMKJOx3lmqJZU/yTn9nidOFLQZvy1q/LZnDQ2bz/ZDwog8ddY=
X-Received: by 2002:a05:651c:a12:: with SMTP id k18mr21916925ljq.90.1630356947407;
 Mon, 30 Aug 2021 13:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210830200540.9888-1-andrey.z@gmail.com> <27aadf4835874e5117ea57ddcb26c07f73d2a7f4.camel@linuxfoundation.org>
In-Reply-To: <27aadf4835874e5117ea57ddcb26c07f73d2a7f4.camel@linuxfoundation.org>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Mon, 30 Aug 2021 22:55:13 +0200
Message-ID: <CAHtQpK4i=Kp-GC0u=C_b1YQh9xBEW7yiURnRkO9TV5+veAxRjA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] perl: add integer module required for kernel >= 5.14
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hello Richard,

On Mon, Aug 30, 2021 at 10:30 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2021-08-30 at 20:05 +0000, Andrey Zhizhikin wrote:
> > Kernel commit 12dd461ebd19 ("crypto: arm64 - generate *.S by Perl at
> > build time instead of shipping them") uses perl to generate assembler
> > files for crypto functionality, which relies on the integer.pm module to
> > be provided.
> >
> > Add this module to FILES and export it for build system.
> >
> > Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-devtools/perl/perl_5.34.0.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
> > index ab19a8d0be0..7a07b3f4911 100644
> > --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
> > +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
> > @@ -248,6 +248,7 @@ FILES:${PN} = "${bindir}/perl ${bindir}/perl.real ${bindir}/perl${PV} ${libdir}/
> >                 ${libdir}/perl5/${PV}/strict.pm \
> >                 ${libdir}/perl5/${PV}/warnings.pm \
> >                 ${libdir}/perl5/${PV}/warnings \
> > +               ${libdir}/perl5/${PV}/integer.pm \
> >                 ${libdir}/perl5/${PV}/vars.pm \
> >                 ${libdir}/perl5/site_perl \
> >                 ${libdir}/perl5/${PV}/ExtUtils/MANIFEST.SKIP \
>
> Doesn't that mean something is missing an RDEPENDS on perl-module-integer rather
> than adding to the main perl package?

Good point! Now that I look at it - this does look a bit too intrusive
(even though it did serve the purpose).

I'm just not sure if I can craft it to RDEPENDS in kernel class instead...

This is definitely required by newer kernel builds (>= 5.14), but I'm
no expert in how those dependencies are set in kernel class. Would
need to look a bit deeper there.

>
> Cheers,
>
> Richard
>

--
Regards,
Andrey.
