Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.2203.1605744752343513219
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 16:12:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=arrXGaQ/;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.52, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f52.google.com with SMTP id y17so5283087ejh.11
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2020 16:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TcrmIMN/Upb47k66wgFrhqe56RFq+Cd0G0Ste1ffiZ4=;
        b=arrXGaQ/UflDYdNSKENHAzSTbyRGi8o/snFNQXkbUlrIMIBgj8VVBzvA0DxD9bq288
         Np/h4AGU08sZ+nDrELJGTitHi/UZur+DpjJ83DXg7P58nuspZlbXKXft9cMjcxjRqvfc
         LogjESSUuDI/zTNcH19PA+fBoOTYjurChxvTsqI+jrGkQpRKXN5BE2IeqWH/NsWDSGb6
         scN49q7s6X/W9QcqAGkw9xJxrh6G3c1nynVQ2OuXjWYLvDoUsRn+4dSmu29El9BiqF/c
         Pe+SXLorFKiVgxsEtUSqFqwhcPvwpJc6HxdRyv9m6hWZoDpoUTotAXecpfq3nDGiJLzv
         ov1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TcrmIMN/Upb47k66wgFrhqe56RFq+Cd0G0Ste1ffiZ4=;
        b=XJMltly3J4nwmvatqrRIxhxqQK1bnU0Nw2x5Rr/afuGSbwb65EyIg3V5SqfzWxnNdx
         maef7QoT6eV9EU6ocj3r6zJyKwOg71Zi+xf4+/AKaGcXRlQuxo8i1yt3is/lhl6UoNQS
         89/A6Q3uJ+Qf0SLoTjQhCJyzN+Yd5oY29iQROAcATwigXrlfVNc6hXQ4reGpnvGJ+UIP
         08w42FYFODv0kEUGpoSt0E0iwBIhXqKOdKIf7hMzBfacxZ3CHCOJHWBcAg3i8knCmdm7
         cmBS/7SZmyMOLYkbx8VXSm8TutnlBRGunzxqixq05gIXxfp9Kyp5UJ+75hUTCD6G6tDZ
         JPTw==
X-Gm-Message-State: AOAM531xjB6a+aASgXQr2a/Qq2k2FQZuis4DFs9RC3ryNHmWC11V5YYi
	hFy9v9qjHUIx+2N+Jnd70IooFyKitgoigzodMvws5A==
X-Google-Smtp-Source: ABdhPJzF83TQjEc2Gy5YAhIDeka4JEs7sOqWQJ5wf44yBJN3PCOZILD5KtTpD1Wod+ki9VH4smSMudWREIMLgFe03M4=
X-Received: by 2002:a17:906:7a11:: with SMTP id d17mr25659601ejo.153.1605744750758;
 Wed, 18 Nov 2020 16:12:30 -0800 (PST)
MIME-Version: 1.0
References: <20201118152522.20849-1-steve@sakoman.com> <8df909f90903613c2aa74e2b43dec9d747b5330a.camel@intel.com>
In-Reply-To: <8df909f90903613c2aa74e2b43dec9d747b5330a.camel@intel.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 18 Nov 2020 14:12:18 -1000
Message-ID: <CAOSpxdZWBUh3UCDLoAgOgZvpgCBD6SGvRETcgjx2HHfKUuh_NQ@mail.gmail.com>
Subject: Re: [OE-core] cups: whitelist CVE-2018-6553
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2020 at 1:56 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Wed, 2020-11-18 at 05:25 -1000, Steve Sakoman wrote:
> > This an Ububtu specific issue:
> >
> > The CUPS AppArmor profile incorrectly confined the dnssd backend
> > due to use of hard links. A local attacker could possibly use this
> > issue to escape confinement. This flaw affects versions prior to
> > 2.2.7-1ubuntu2.1 in Ubuntu 18.04 LTS, prior to 2.2.4-7ubuntu3.1
> > in Ubuntu 17.10, prior to 2.1.3-4ubuntu0.5 in Ubuntu 16.04 LTS,
> >  and prior to 1.7.2-0ubuntu1.10 in Ubuntu 14.04 LTS
>
> It doesn't affect the default configuration but someone in theory could
> have extended the recipe to have AppArmor support and then it might be
> vulnerable?

I suppose if someone implemented AppArmor support and botched it in the
same way as it was in Ubuntu, then yes they would have the same vulnerability!

> Since this CVE is sort of distro specific and not package specific,
> should this be part of recipe or the poky distro meta data?

I'm open for suggestions.  There are many ways people can take our
standard recipes and implement a horribly insecure image. IMHO
this is one of the more unlikely paths that someone would take :-)

But if the community feels this is best in the poky distro metadata I have no
issue with that.

Steve
>
> Thanks,
>
> Anuj
>
> >
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/recipes-extended/cups/cups.inc | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-
> > extended/cups/cups.inc
> > index 87870e4aba..df8d4d284a 100644
> > --- a/meta/recipes-extended/cups/cups.inc
> > +++ b/meta/recipes-extended/cups/cups.inc
> > @@ -20,6 +20,9 @@ SRC_URI = "
> > https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.t
> >  UPSTREAM_CHECK_URI = "https://github.com/apple/cups/releases"
> >  UPSTREAM_CHECK_REGEX = "cups-(?P<pver>\d+\.\d+(\.\d+)?)-source.tar"
> >
> > +# This is an Ubuntu only issue.
> > +CVE_CHECK_WHITELIST += "CVE-2018-6553"
> > +
> >  LEAD_SONAME = "libcupsdriver.so"
> >
> >  CLEANBROKEN = "1"
> >
> > 
> >
>
