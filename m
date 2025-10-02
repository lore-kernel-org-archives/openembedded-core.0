Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45590CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 19:31:19 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2710.1759433476488645861
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 12:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B532140C85;
	Thu,  2 Oct 2025 19:31:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PrtJDbZFzyoX; Thu,  2 Oct 2025 19:31:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 88FAB40C2E;
	Thu,  2 Oct 2025 19:31:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4686016421A; Thu,  2 Oct 2025 15:31:13 -0400 (EDT)
Date: Thu, 2 Oct 2025 15:31:13 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [OE-core] [RFC PATCH 3/5] musl: set compatibility a bit more
 flexible
Message-ID: <20251002193113.GF3125@denix.org>
References: <20251002000810.226673-1-denis@denix.org>
 <20251002000810.226673-3-denis@denix.org>
 <CAMKF1spcHAvNJtsStzG0OgigTKkU_QHgApdY1m5Q+Zf4aecTRg@mail.gmail.com>
 <20251002140404.GC3125@denix.org>
 <CAMKF1sonoReY5oR-eB9-_UmDGeLX_htXS53+rJ3VFL+Fs0wqAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMKF1sonoReY5oR-eB9-_UmDGeLX_htXS53+rJ3VFL+Fs0wqAw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 19:31:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224378

On Thu, Oct 02, 2025 at 10:23:25AM -0700, Khem Raj wrote:
> On Thu, Oct 2, 2025 at 7:04=E2=80=AFAM Denys Dmytriyenko <denis@denix.o=
rg> wrote:
> >
> > On Wed, Oct 01, 2025 at 07:12:34PM -0700, Khem Raj wrote:
> > > On Wed, Oct 1, 2025 at 5:08=E2=80=AFPM Denys Dmytriyenko via
> > > lists.openembedded.org <denis=3Ddenix.org@lists.openembedded.org> w=
rote:
> > > >
> > > > From: Denys Dmytriyenko <denys@konsulko.com>
> > > >
> > > > Like musl Linux config, baremetal also uses musl as a libc, but
> > > > it has a different host triplet set. Hence adjust COMPATIBLE_HOST
> > > > to accomodate this use case by checking that musl is a preferred
> > > > provider of libc.
> > >
> > > This sounds a bit odd. Why do we use musl for baremetal targets ?
> >
> > Was like that for 10 years since the beginning of baremetal support:
> > https://git.openembedded.org/openembedded-core/commit/?id=3Dcb010e306=
a6a856c589db5f41fdcaea4e5035d93
> >
>=20
> A lot has changed since then in terms of toolchain sequences and depend=
encies
> it might be a good time to revise this

Yeah, that would be the next step and is part of my longer todo list.

We've noticed that the baremetal toolchain build is now much larger and m=
uch=20
longer than how it used to be several years ago - there seems to be a lot=
 of=20
unnecessary dependencies being pulled just to build a couple of self-cont=
ained=20
firmware images... Still need to investigate further though.


> > > while musl does have FDPIC support but I don't think thats how we
> > > use it.
> > >
> > > >
> > > > [YOCTO #15982]
> > > >
> > > > Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > > > ---
> > > >  meta/recipes-core/musl/bsd-headers.bb      | 2 +-
> > > >  meta/recipes-core/musl/libssp-nonshared.bb | 3 ++-
> > > >  2 files changed, 3 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/meta/recipes-core/musl/bsd-headers.bb b/meta/recipes=
-core/musl/bsd-headers.bb
> > > > index ad9ba81e4f..c6a3814a49 100644
> > > > --- a/meta/recipes-core/musl/bsd-headers.bb
> > > > +++ b/meta/recipes-core/musl/bsd-headers.bb
> > > > @@ -25,7 +25,7 @@ do_install() {
> > > >  #
> > > >  # We will skip parsing for non-musl systems
> > > >  #
> > > > +COMPATIBLE_HOST =3D "${@oe.utils.conditional('PREFERRED_PROVIDER=
_virtual/libc', 'musl', '.*', 'null', d)}"
> > > >
> > > > -COMPATIBLE_HOST =3D ".*-musl.*"
> > > >  DEV_PKG_DEPENDENCY =3D ""
> > > >  RRECOMMENDS:${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV})"
> > > > diff --git a/meta/recipes-core/musl/libssp-nonshared.bb b/meta/re=
cipes-core/musl/libssp-nonshared.bb
> > > > index 4bcbaef7ea..6f12ff0c9b 100644
> > > > --- a/meta/recipes-core/musl/libssp-nonshared.bb
> > > > +++ b/meta/recipes-core/musl/libssp-nonshared.bb
> > > > @@ -29,7 +29,8 @@ do_install() {
> > > >  #
> > > >  # We will skip parsing for non-musl systems
> > > >  #
> > > > -COMPATIBLE_HOST =3D ".*-musl.*"
> > > > +COMPATIBLE_HOST =3D "${@oe.utils.conditional('PREFERRED_PROVIDER=
_virtual/libc', 'musl', '.*', 'null', d)}"
> > > > +
> > > >  RDEPENDS:${PN}-staticdev =3D ""
> > > >  DEV_PKG_DEPENDENCY =3D ""
> > > >  RRECOMMENDS:${PN}-dbg =3D "${PN}-staticdev (=3D ${EXTENDPKGV})"
> > > > --
> > > > 2.25.1

