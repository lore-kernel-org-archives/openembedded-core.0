Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E91C4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 13:14:41 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.19987.1707311676263551124
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 05:14:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=cPPsMtq3;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1707311676; x=1738847676;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=pRdHAfCJuT9t9e6XkD3g2DbY3gebVULwt7JdwAEWJ50=;
  b=cPPsMtq3ui+F83F8hFBNQDRso7MR0L47qbJGXjtXU9Tx0/j6RK4ML3fd
   /9Hv0ad23l/jI32ml6qFkqHHGQJbidZjuUU8nwaNXW0GJlH1TkLtpvEKj
   jyX7rDY1uAg3XEE9/Ahe9aE+bfWq9uxPEltcd7xP7Lfl8D2SouDhznuKF
   qa7TyNLVEg4qwXl0cK10fR5vUcuqs9m3kVsO+Mpkd0g5uE7u6BGLRJCLN
   OLSP9RNIhxT2EcsBFtqxsX4xg51fRNjGpjphSB5+X86rrRJNRjb5AqgQh
   dTD9zRGGorf/gZTRk8svvBTg2dUUcmLfXdmdPLx76xG/dRYDgMt+SRu50
   A==;
X-IronPort-AV: E=Sophos;i="6.05,251,1701126000"; 
   d="scan'208";a="35295137"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 07 Feb 2024 14:14:34 +0100
Received: from [192.168.153.128] (SCHIFFERM-M3.tq-net.de [10.121.49.135])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id C6939280075;
	Wed,  7 Feb 2024 14:14:33 +0100 (CET)
Message-ID: <d8b9db15ae3ff57b6a34cc1a0278d208d588a773.camel@ew.tq-group.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: install .config to deploy dir
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "oss@ew.tq-group.com"
	 <oss@ew.tq-group.com>
Date: Wed, 07 Feb 2024 14:14:33 +0100
In-Reply-To: <CADkTA4NS3=8tUYUz_SMiwfd+E=takHWEVTYi1AjuX41A0p8YOQ@mail.gmail.com>
References: <20240207102529.128369-1-matthias.schiffer@ew.tq-group.com>
	 <CADkTA4NS3=8tUYUz_SMiwfd+E=takHWEVTYi1AjuX41A0p8YOQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 13:14:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195060

On Wed, 2024-02-07 at 12:42 +0000, Bruce Ashfield wrote:
> ********************
> Achtung externe E-Mail: =C3=96ffnen Sie Anh=C3=A4nge und Links nur, wenn =
Sie wissen, dass diese aus einer sicheren Quelle stammen und sicher sind. L=
eiten Sie die E-Mail im Zweifelsfall zur Pr=C3=BCfung an den IT-Helpdesk we=
iter.
> Attention external email: Open attachments and links only if you know tha=
t they are from a secure source and are safe. In doubt forward the email to=
 the IT-Helpdesk to check it.
> ********************
>=20
> On Wed, Feb 7, 2024 at 5:26=E2=80=AFAM Matthias Schiffer
> <matthias.schiffer@ew.tq-group.com> wrote:
> >=20
> > Deploy the kernel configuration with the built images, so it is easy to
> > check its contents, or rebuild the same configuration outside of the
> > Yocto build system.
> >=20
>=20
> I'm not convinced we need yet more clutter in the deploy directory, but
> at a minimum, this patch also needs an update to the documentation
> (apologies if I missed it on the docs list).

Sorry about the missing docs, I'll provide a patch for that as well.

>=20
> One could argue that the config could be pulled out of the other
> packages and artifacts, and that it wouldn't be recommended to
> use that config for rebuilding outside of yocto, as we aren't providing
> the matching sources in the deploy directory.

There are at least some cases where the config can't be pulled out of anyth=
ing else - without
CONFIG_IKCONFIG, the config is not embedded in the built kernel images. In =
constrained environments,
it may be desirable to disable such options to reduce the kernel size.

As a data point from other distros, Debian/Ubuntu disable CONFIG_IKCONFIG a=
nd instead provide the
config next to the kernel images in /boot.

>=20
> I would also be nice in the commit log to indicate how cleanup of the
> deploydir has been tested to show that we won't end up with config*
> files and links in the directory after their associated images have been
> removed. (I haven't looked at the deploy classes in quite some time,
> so I'm unsure if anything in particular needs to be done).

My understanding is that unclean deploy dir issues are pretty much a thing =
of the past, as
deploy.bbclass sets `do_deploy[cleandirs] =3D "${DEPLOYDIR}"` (so do_deploy=
 always starts with
a pristine destination directory), and the sstate tracking takes care of th=
e rest.=20

Thanks,
Matthias



>=20
> Bruce
>=20
>=20
>=20
> > This can be particularly convenient when running a Yocto build as a CI
> > job, and only the deploy dir is made available for download.
> >=20
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > ---
> >  meta/classes-recipe/kernel-artifact-names.bbclass | 3 +++
> >  meta/classes-recipe/kernel.bbclass                | 7 +++++++
> >  2 files changed, 10 insertions(+)
> >=20
> > diff --git a/meta/classes-recipe/kernel-artifact-names.bbclass b/meta/c=
lasses-recipe/kernel-artifact-names.bbclass
> > index 1a7611a15e..8e2ef0d627 100644
> > --- a/meta/classes-recipe/kernel-artifact-names.bbclass
> > +++ b/meta/classes-recipe/kernel-artifact-names.bbclass
> > @@ -16,6 +16,9 @@ KERNEL_ARTIFACT_NAME ?=3D "${PKGE}-${PKGV}-${PKGR}${I=
MAGE_MACHINE_SUFFIX}${IMAGE_V
> >  KERNEL_ARTIFACT_LINK_NAME ?=3D "${MACHINE}"
> >  KERNEL_ARTIFACT_BIN_EXT ?=3D ".bin"
> >=20
> > +KERNEL_CONFIG_NAME ?=3D "${KERNEL_ARTIFACT_NAME}"
> > +KERNEL_CONFIG_LINK_NAME ?=3D "${KERNEL_ARTIFACT_LINK_NAME}"
> > +
> >  KERNEL_IMAGE_NAME ?=3D "${KERNEL_ARTIFACT_NAME}"
> >  KERNEL_IMAGE_LINK_NAME ?=3D "${KERNEL_ARTIFACT_LINK_NAME}"
> >  KERNEL_IMAGE_BIN_EXT ?=3D "${KERNEL_ARTIFACT_BIN_EXT}"
> > diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/k=
ernel.bbclass
> > index a76aaee5ba..8a98899e04 100644
> > --- a/meta/classes-recipe/kernel.bbclass
> > +++ b/meta/classes-recipe/kernel.bbclass
> > @@ -812,6 +812,13 @@ kernel_do_deploy() {
> >                 mkdir "$deployDir"
> >         fi
> >=20
> > +       if [ -n "${KERNEL_CONFIG_NAME}" ]; then
> > +               install -m 0644 .config $deployDir/config-${KERNEL_CONF=
IG_NAME}
> > +               if [ -n "${KERNEL_CONFIG_LINK_NAME}" ]; then
> > +                       ln -sf config-${KERNEL_CONFIG_NAME} $deployDir/=
config-${KERNEL_CONFIG_LINK_NAME}
> > +               fi
> > +       fi
> > +
> >         for imageType in ${KERNEL_IMAGETYPES} ; do
> >                 baseName=3D$imageType-${KERNEL_IMAGE_NAME}
> >=20
> > --
> > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, =
Germany
> > Amtsgericht M=C3=BCnchen, HRB 105018
> > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan=
 Schneider
> > https://www.tq-group.com/
> >=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#195047): https://lists.openembedded.org/g/openembed=
ded-core/message/195047
> > Mute This Topic: https://lists.openembedded.org/mt/104215836/1050810
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20
>=20
>=20
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

