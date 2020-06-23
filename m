Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
 by mx.groups.io with SMTP id smtpd.web11.5654.1592915022448382478
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 05:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tpjqLqE7;
 spf=pass (domain: konsulko.com, ip: 209.85.167.193, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f193.google.com with SMTP id x202so18676844oix.11
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 05:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xzlnPYVFQG163ue2nphLNym9l00cmwvG7Sw/wIHQ2jE=;
        b=tpjqLqE7MT4sbbH7dKzU2+DICCQ4ZDhJkseqeFtZUEeOiIqU3sti4/ODm6WqXJo2Pa
         BP6KAz+jXB5xhJ3eQp/q6ltXBZaYhGbiw2onsnVyVXWjls9PVUFjYldx1cOpolGvbTOH
         w6nqTai3p7WGZezFhe9dnMwah892qKmHr6CcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xzlnPYVFQG163ue2nphLNym9l00cmwvG7Sw/wIHQ2jE=;
        b=iqGDZ9uqGkbxT5smOxxIDLRzGFh8h2/FB7Mly7HaHorlawzUyyWGrLjHncOV3/IqwY
         eIO1piKwsATTYBaU54xFbx/jXmpZtWZEuxpO1qMeFZlwJ3F3F4mHjri5SDvHdJstte0c
         lTTZYKnIhxo6P6unHOXufxBDbMr6+q6lyFSe83d8AAkRCxV1wsCT/S45qvlT6el+L5gu
         ZiGO4PK/zsjkoc7XOQK9tGNoOa8jJGdCCHuFobeGIBQvEOFVjn0AaEtmCNP0B2+beT5g
         bFySPCVJZ+medhTu3D1i3Sp3cHQMZrUum6apXo0kdj/1WlSpm8vGYdifMYU+XNYPL/zH
         mJsg==
X-Gm-Message-State: AOAM530k/3hIdLshbJi79EvwYpOdGFXHgl1zluGWbPC7V5rjNJoXlxn/
	LWS7ImSa13+KjepRXqyOLHHulVp8ZzGQ1nfjjZXXrGuGw/g=
X-Google-Smtp-Source: ABdhPJzwvz1z9Uzx6OxfdlqMszIURhmmQv0jmPqi1oI2GCy14mr18jB4TgJNAXpny8UgZ5WGq+/o+Jcged7aY1o/Ohk=
X-Received: by 2002:aca:df04:: with SMTP id w4mr15840772oig.27.1592915021685;
 Tue, 23 Jun 2020 05:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200623111328.5838-1-fredrigu@axis.com> <20200623111328.5838-3-fredrigu@axis.com>
 <b42a94227a052cb6344788925c7e26566e2a191c.camel@linuxfoundation.org> <1592914337760.75731@axis.com>
In-Reply-To: <1592914337760.75731@axis.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 23 Jun 2020 13:23:31 +0100
Message-ID: <CAM9ZRVvaB2VaQjVNQByYpXiZQ9vMtS7Fd4V1=TVJgD=qHY6+iA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] lib/oe: Split package manager code to multiple files
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>, Hugo Cedervall <Hugo.Cedervall@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Jun 2020 at 13:12, Fredrik Gustafsson
<fredrik.gustafsson@axis.com> wrote:
>
>
> ________________________________________
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> Sent: Tuesday, June 23, 2020 2:02 PM
> To: Fredrik Gustafsson; openembedded-core@lists.openembedded.org
> Cc: tools-cfpbuild-internal; Hugo Cedervall; Fredrik Gustafsson
> Subject: Re: [OE-core] [PATCH 2/2] lib/oe: Split package manager code to =
multiple files
>
> On Tue, 2020-06-23 at 13:13 +0200, Fredrik Gustafsson wrote:
> > Today OE-Core has support for three package managers, even if there
> > are many more package managers that could be interesting to use.
> > Adding a new package manager to OE-Core would increase the test matrix
> > significantly. In order to let users use their favorite package manager
> > without need for it to have support from upstream, this patch refactors
> > the package manager code so that it's easy to add a new package
> > manager in another layer.
> >
> > This patch is mostly moving code and duplicating some code (because of
> > the hard coupling between deb and ipk).
> >
> > Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
> > ---
> >  meta/classes/populate_sdk_base.bbclass        |   11 +-
> >  meta/lib/oe/manifest.py                       |  149 +-
> >  meta/lib/oe/package_manager.py                | 1402 +----------------
> >  meta/lib/oe/package_managers/deb/manifest.py  |   31 +
> >  .../package_managers/deb/package_manager.py   |  719 +++++++++
> >  meta/lib/oe/package_managers/deb/rootfs.py    |  213 +++
> >  meta/lib/oe/package_managers/deb/sdk.py       |   97 ++
> >  .../ipk/.package_manager.py.swo               |  Bin 0 -> 45056 bytes
> >  meta/lib/oe/package_managers/ipk/manifest.py  |   79 +
> >  .../package_managers/ipk/package_manager.py   |  588 +++++++
> >  meta/lib/oe/package_managers/ipk/rootfs.py    |  395 +++++
> >  meta/lib/oe/package_managers/ipk/sdk.py       |  104 ++
> >  meta/lib/oe/package_managers/rpm/manifest.py  |   62 +
> >  .../package_managers/rpm/package_manager.py   |  423 +++++
> >  meta/lib/oe/package_managers/rpm/rootfs.py    |  154 ++
> >  meta/lib/oe/package_managers/rpm/sdk.py       |  104 ++
> >  meta/lib/oe/rootfs.py                         |  631 +-------
> >  meta/lib/oe/sdk.py                            |  311 +---
> >  meta/lib/oeqa/utils/package_manager.py        |   29 +-
> >  meta/recipes-core/meta/package-index.bb       |    2 +-
> >  20 files changed, 3014 insertions(+), 2490 deletions(-)
>
> I'm afraid this patch is basically impossible to review. There are
> warning signs like the inclusion of the binary swo file. The hint that
> code gets duplicated also worries me, even if you abstract this, there
> shouldn't be reason to do that.
>
> If we do this its going to have to be a more granular series where the
> patches *just* move code to new locations so we can see/understand what
> other changes are being made as I simply don't trust this patch, sorry
> :(.
>
> Cheers,
>
> Richard
>
>
> Hi,
> sorry about the swo file that's a mistake on my side. The duplicated code=
 is simply so that deb and ipk shares a class. So my choice was to either d=
uplicate that class (and let them diverge which is fine) or in the core pac=
kage_manager.py file have a class that is not used by all package managers =
(rpm doesn't use it).
>
> This patch is only code moves and class renames. I know it's very hard to=
 review, that's a real problem. Let me see if I can split it up some more.

I really like the idea here but agree with Richard that the patch is
impossible to review as is. I'd recommend moving things over in stages
and keeping the package_manager.py file around until we're completely
finished. Recipes like package-index.bb should not need to change at
all - leave a shim layer in place with the old import path.

I see you split the code into package_manager.py, rootfs.py, sdk.py
and manifest.py for each package manager. That suggests you could
start by just splitting out the rootfs code from each package manager,
leaving the rest in package_manager.py. Then on the next commit move
the sdk handling, etc. That would make each commit easier to reason
about.

I'd also recommend adding a __init__.py file in the ipk, rpm and deb
directories so it's easier to import things when needed.

Thanks,

--=20
Paul Barker
Konsulko Group
