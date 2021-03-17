Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.571.1616013140166828254
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 13:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qkB3vB1B;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id d10so2068186qve.7
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Mar 2021 13:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a+6RoijvvpywSHVCGArjJqGE59ZBAY5hoHy5T1n2O4I=;
        b=qkB3vB1BiAfOE0q+NtejbYxLiMMm7iAw/Xqgz+kkTUXr2lTUGboAYYaDbFF4Ely6JK
         Cvu0Hl1RiY60rDCjspKJ8pSVgZMdoMER4/va/0mWKqb+EBrWiZ9MES4COW5zl+kM5G+O
         KOY3bboL/loYKkesGBExX43AznhRdOlwGG/TNb8kjjVkJFhMVkhCA3onhEjDjQMy953K
         owcpSxfDk51Bu8pVgLI2k9B2J4/h+kvwb5iY0XTvjyUnzG3AvEX7o+vOZrOyJAYtu2/P
         dH3RXeGJJ3lj2bfcbcDenAu8A9riuvUEtuT9xMl45PpdN99udhP4znwJ6giaYR+U49dQ
         OtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a+6RoijvvpywSHVCGArjJqGE59ZBAY5hoHy5T1n2O4I=;
        b=ZSKilXmiiMdQSi4+62zrEvkThUIoDwejPRX6VWlPInexf5+1iV3Keh8Ox2efHEtojl
         fOunXkGWRZE/OynxEZDPxfPAyV9JqetMu7lBfgAdkw9kIAe2AvfxwoC61Np/63IU0qQx
         AwwAnc24BWPyrHgrD0R2TNgIoT6Sm39DnOjyxOIUCu3vZiAjJlgw5jbLRUhCmUmtXrCh
         oLF9a6zX2KiSirtBbcI6jU8Jo5v/cy/vb+Yy0xM8jWIOMwBnw4DfDxPmYd4nV7DaOgL8
         jHOA9uY0+ti+Q9vgFFm4CrzkjMMM5Kms3/9S6BC70BFGDLCqQY38woi9xaIx/sPyflQr
         HdGQ==
X-Gm-Message-State: AOAM530i5F9vZkqIo0cQ0GHljHRn+w3Cv6ixd7VZmXV9u1t8YomEaG4U
	Y4FoOqj85h00QxbKKZpEfUKWEE5+5kez2wSulRY=
X-Google-Smtp-Source: ABdhPJzmlRUDXCv8bcMuJoFD7+djQMEQm4vpJOz+tisldWbIx3jHbYUQZiPO+fICKMiCymKQPJr6iNFN4Fji9+CUYQg=
X-Received: by 2002:a0c:f44d:: with SMTP id h13mr894607qvm.31.1616013139187;
 Wed, 17 Mar 2021 13:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210317003155.1368207-1-raj.khem@gmail.com> <7f78d5f7-86ec-420a-9f07-753437c41010@www.fastmail.com>
In-Reply-To: <7f78d5f7-86ec-420a-9f07-753437c41010@www.fastmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 17 Mar 2021 13:31:53 -0700
Message-ID: <CAMKF1sqBu7zx0kJdimy4Do=N_N5BBK5RPWWN1cQkBPV-5Xphkg@mail.gmail.com>
Subject: Re: [PATCH] webkitgtk: Reduce stack and heap sizes for jsc on musl
To: Andrei Gherzan <andrei@gherzan.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 17, 2021 at 9:06 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> Hi,
>
> On Wed, 17 Mar 2021, at 00:31, Khem Raj wrote:
> > Fixes
> >
> > [YOCTO #14281]
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Andrei Gherzan <andrei@gherzan.com>
> > ---
> >  .../webkitgtk/musl-lower-stack-usage.patch    | 51 +++++++++++++++++++
> >  meta/recipes-sato/webkit/webkitgtk_2.30.5.bb  |  1 +
> >  2 files changed, 52 insertions(+)
> >  create mode 100644
> > meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
> >
> > diff --git
> > a/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
> > b/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
> > new file mode 100644
> > index 0000000000..3d66766d9a
> > --- /dev/null
> > +++ b/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
> > @@ -0,0 +1,51 @@
> > +reduce thread stack and heap usage for javascriptcore on musl
> > +
> > +default sizes for musl are smaller compared to glibc, this matches
> > +to musl defaults, avoid stack overflow crashes in jscore
>
> Tested and it works as expected. I was fixing it a bit hacky doing something similar to https://github.com/yaegashi/muslstack but this is cleaner.
>
Thanks for testing, I have sent a v2 which should be better. I would
rather not use muslstack utility as it papers over real issues. I
think real fix would
be in webkit to use pthread_attr_setstacksize() instead of hardcoding
the values, but I will let some experts in webkit to take it on.

> I've backported your patch for dunfell too (rebased the patch).
>
> Andrei
