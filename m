Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.10212.1599060149111681830
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B/iVZscK;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id p65so3842792qtd.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 08:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rQm0IRGlTrpI9aER4oD17OOzQQcshsosQUd/67wqq5w=;
        b=B/iVZscKlngHyvVU2F+2Jhmw7JpICNu8ngej65391V9LR3VWOrlvuLl4o3EurHSCCl
         lUeZh/viVb0887zM7FzQopBpzJLajZPsj3BOx7zD2GMWnNAgOND0oq3mgbf8uxxI/fZj
         3mu9MV6v2xlnrXMwkN29pj3XRHxuWpWY6szJyLhWKjMGSWcID39xgMy+zA1rb1OPIVnE
         U6/cd9ijicj6NEQiOP0be1KCEtTxkUKCQke3Qy+sSW+OlHnN9mhicqSlkGWknJWpWB+/
         o4bCj89UrKgK5QWiyEZyv+6LHmuaTJcrxHro2gWH7igZUzH1kSe4MTzzE9wX2IweA6Ux
         f6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rQm0IRGlTrpI9aER4oD17OOzQQcshsosQUd/67wqq5w=;
        b=BvWLNYnLOXncjUR6hAuJjVAk+QpXiOBKsni+YkS96At1qONfoYJdWIfGCiBdT49TC0
         gfG8SUxcgp81gFfcznCBEDHmGgnF74vG+yZOEzFFEPrPCP0MGReWYMzw0RElQJMA3LAf
         LvSp1w6IdA6jdVdwoKTa2NkQJwoF/WT/lDJs1HHRh+RHA82owWA5RlrSvV8MqKbyab/m
         PZVxjpxyV7+HMHfZTPFTK4nl6vy01NUZUfKvn7TvT9E3pf72a1+smmy1s2vLQf146KAW
         DEz1nY2bmHHNte/0WfuCotn73o9BRzGqo5yW/0PuVPodF1x5Z+ypXPA94KDojb5djY2g
         Dq/A==
X-Gm-Message-State: AOAM5335CxGDFxRQJwG4xyypmgMmD5bTwOnNyCBQGO9EmyH9BDmyAgx+
	JyFz0PDhOGBToKgC5CHJ7XjTXSFmdgxIh+zXvq9pR4UfC2A=
X-Google-Smtp-Source: ABdhPJwACRN6ce1iRixe4iSGritvKTelXpPJL5b9hpGDREKCW2WgT8BH7s3W9/0pbHoe1KXt9agvdhnOLwPI+sl8PAg=
X-Received: by 2002:ac8:72d6:: with SMTP id o22mr7317609qtp.53.1599060148142;
 Wed, 02 Sep 2020 08:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200902032241.3586810-1-raj.khem@gmail.com> <6711e35c-0bf2-2f17-482a-d85eae508dc0@burtonini.com>
In-Reply-To: <6711e35c-0bf2-2f17-482a-d85eae508dc0@burtonini.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 2 Sep 2020 08:22:02 -0700
Message-ID: <CAMKF1spB696VjCFDCeFgSCfNN0krMdo-+TtzPtJeTD2wayT2xQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] elfutils: Fix GNU_HASH QA Issue
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 2, 2020 at 2:41 AM Ross Burton <ross@burtonini.com> wrote:
>
> On 02/09/2020 04:22, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   .../recipes-devtools/elfutils/elfutils_0.180.bb |  1 +
> >   .../elfutils/files/ldflags.patch                | 17 +++++++++++++++++
> >   2 files changed, 18 insertions(+)
> >   create mode 100644 meta/recipes-devtools/elfutils/files/ldflags.patch
> >
> > diff --git a/meta/recipes-devtools/elfutils/elfutils_0.180.bb b/meta/recipes-devtools/elfutils/elfutils_0.180.bb
> > index 9f8bfc24f3..d3ee750725 100644
> > --- a/meta/recipes-devtools/elfutils/elfutils_0.180.bb
> > +++ b/meta/recipes-devtools/elfutils/elfutils_0.180.bb
> > @@ -20,6 +20,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
> >              file://run-ptest \
> >              file://ptest.patch \
> >              file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
> > +           file://ldflags.patch \
> >              "
> >   SRC_URI_append_libc-musl = " \
> >              file://0001-musl-obstack-fts.patch \
> > diff --git a/meta/recipes-devtools/elfutils/files/ldflags.patch b/meta/recipes-devtools/elfutils/files/ldflags.patch
> > new file mode 100644
> > index 0000000000..ef1d65e2c3
> > --- /dev/null
> > +++ b/meta/recipes-devtools/elfutils/files/ldflags.patch
> > @@ -0,0 +1,17 @@
> > +Pass linker flags along to CCLD, this ensures proper linking
> > +w.r.t. hash_style selection during cross-compile
>
> Did you re-run the test suite?  That binary is explicitly compiled with
> minimal flags, so adding the LDFLAGS might actually break the test.  For
> the same reason, you can set Upstream-Status to Inappropriate.
>

I have executed on qemu and it worked ok.

> I've a fix here for the same issue that uses INSANE_SKIP instead.
>
> Ross
>
