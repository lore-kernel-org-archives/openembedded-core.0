Return-Path: <kory.maincent@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECCAC433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 15:03:44 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web12.12827.1642691022972200220
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 07:03:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: kory.maincent@bootlin.com)
Received: (Authenticated sender: kory.maincent@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 924FB240011;
	Thu, 20 Jan 2022 15:03:40 +0000 (UTC)
Date: Thu, 20 Jan 2022 16:03:39 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 thomas.petazzoni@bootlin.com, Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core][PATCH] icu: fix make_icudata dependencies
Message-ID: <20220120160339.4f21c216@kmaincent-XPS-13-7390>
In-Reply-To: 
 <CANNYZj8iOcC6TLkOW2Bt6G+Ey=h5zwxrEUNQC8E7v8yXz0GFpg@mail.gmail.com>
References: <20220120143242.35930-1-kory.maincent@bootlin.com>
	<CANNYZj8iOcC6TLkOW2Bt6G+Ey=h5zwxrEUNQC8E7v8yXz0GFpg@mail.gmail.com>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 15:03:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160765

Hello Alexander,

On Thu, 20 Jan 2022 15:37:26 +0100
Alexander Kanavin <alex.kanavin@gmail.com> wrote:

> Can we rather make a dependency on the task that prepares the sysroot,
> instead of listing the dependencies one by one (with anonymous python too=
!)?

Thanks for the review,
I do not understand your comments as the make_icudata is before the
configuration task.
Could you be more explicit or use an example?

Regards,

K=C3=B6ry

>=20
> Alex
>=20
> On Thu, 20 Jan 2022 at 15:32, Kory Maincent <kory.maincent@bootlin.com>
> wrote:
>=20
> > The make_icudata task is set before the configure task then the
> > dependencies for this task are not populate yet.
> >
> > Fixed it by setting autoconf, automake and ccache native dependencies
> > to this task.
> >
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >  meta/recipes-support/icu/icu_70.1.bb | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/meta/recipes-support/icu/icu_70.1.bb
> > b/meta/recipes-support/icu/icu_70.1.bb
> > index 0988ae8b8e..ae985bca4f 100644
> > --- a/meta/recipes-support/icu/icu_70.1.bb
> > +++ b/meta/recipes-support/icu/icu_70.1.bb
> > @@ -123,6 +123,14 @@ EXTRA_OECONF:append:libc-musl =3D "
> > ac_cv_func_strtod_l=3Dno"
> >  PACKAGECONFIG ?=3D ""
> >  PACKAGECONFIG[make-icudata] =3D ",,,"
> >
> > +# Add dependencies to make_icudata
> > +do_make_icudata[depends] =3D "autoconf-native:do_populate_sysroot
> > automake-native:do_populate_sysroot"
> > +python() {
> > +    if not (bb.data.inherits_class("native", d) or
> > +            bb.utils.to_boolean(d.getVar('CCACHE_DISABLE'))):
> > +        d.appendVarFlag('do_make_icudata', 'depends', '
> > ccache-native:do_populate_sysroot')
> > +}
> > +
> >  do_make_icudata:class-target () {
> >      ${@bb.utils.contains('PACKAGECONFIG', 'make-icudata', '', 'exit 0',
> > d)}
> >      cd ${S}
> > --
> > 2.25.1
> >
> > =20


