Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AFCACAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 14:04:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.9869.1759413848731677497
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 07:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DCF9940C85;
	Thu,  2 Oct 2025 14:04:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3SXsZuoIeW7p; Thu,  2 Oct 2025 14:04:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AFF8740C2E;
	Thu,  2 Oct 2025 14:04:05 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EC4211640DC; Thu,  2 Oct 2025 10:04:04 -0400 (EDT)
Date: Thu, 2 Oct 2025 10:04:04 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [OE-core] [RFC PATCH 3/5] musl: set compatibility a bit more
 flexible
Message-ID: <20251002140404.GC3125@denix.org>
References: <20251002000810.226673-1-denis@denix.org>
 <20251002000810.226673-3-denis@denix.org>
 <CAMKF1spcHAvNJtsStzG0OgigTKkU_QHgApdY1m5Q+Zf4aecTRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMKF1spcHAvNJtsStzG0OgigTKkU_QHgApdY1m5Q+Zf4aecTRg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 14:04:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224359

On Wed, Oct 01, 2025 at 07:12:34PM -0700, Khem Raj wrote:
> On Wed, Oct 1, 2025 at 5:08=E2=80=AFPM Denys Dmytriyenko via
> lists.openembedded.org <denis=3Ddenix.org@lists.openembedded.org> wrote=
:
> >
> > From: Denys Dmytriyenko <denys@konsulko.com>
> >
> > Like musl Linux config, baremetal also uses musl as a libc, but
> > it has a different host triplet set. Hence adjust COMPATIBLE_HOST
> > to accomodate this use case by checking that musl is a preferred
> > provider of libc.
>=20
> This sounds a bit odd. Why do we use musl for baremetal targets ?

Was like that for 10 years since the beginning of baremetal support:
https://git.openembedded.org/openembedded-core/commit/?id=3Dcb010e306a6a8=
56c589db5f41fdcaea4e5035d93


> while musl does have FDPIC support but I don't think thats how we
> use it.
>=20
> >
> > [YOCTO #15982]
> >
> > Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > ---
> >  meta/recipes-core/musl/bsd-headers.bb      | 2 +-
> >  meta/recipes-core/musl/libssp-nonshared.bb | 3 ++-
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-core/musl/bsd-headers.bb b/meta/recipes-cor=
e/musl/bsd-headers.bb
> > index ad9ba81e4f..c6a3814a49 100644
> > --- a/meta/recipes-core/musl/bsd-headers.bb
> > +++ b/meta/recipes-core/musl/bsd-headers.bb
> > @@ -25,7 +25,7 @@ do_install() {
> >  #
> >  # We will skip parsing for non-musl systems
> >  #
> > +COMPATIBLE_HOST =3D "${@oe.utils.conditional('PREFERRED_PROVIDER_vir=
tual/libc', 'musl', '.*', 'null', d)}"
> >
> > -COMPATIBLE_HOST =3D ".*-musl.*"
> >  DEV_PKG_DEPENDENCY =3D ""
> >  RRECOMMENDS:${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV})"
> > diff --git a/meta/recipes-core/musl/libssp-nonshared.bb b/meta/recipe=
s-core/musl/libssp-nonshared.bb
> > index 4bcbaef7ea..6f12ff0c9b 100644
> > --- a/meta/recipes-core/musl/libssp-nonshared.bb
> > +++ b/meta/recipes-core/musl/libssp-nonshared.bb
> > @@ -29,7 +29,8 @@ do_install() {
> >  #
> >  # We will skip parsing for non-musl systems
> >  #
> > -COMPATIBLE_HOST =3D ".*-musl.*"
> > +COMPATIBLE_HOST =3D "${@oe.utils.conditional('PREFERRED_PROVIDER_vir=
tual/libc', 'musl', '.*', 'null', d)}"
> > +
> >  RDEPENDS:${PN}-staticdev =3D ""
> >  DEV_PKG_DEPENDENCY =3D ""
> >  RRECOMMENDS:${PN}-dbg =3D "${PN}-staticdev (=3D ${EXTENDPKGV})"
> > --
> > 2.25.1

