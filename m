Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5412C54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 21:01:40 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.615.1709067689690622795
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 13:01:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1rf4Zr-0006Li-G3; Tue, 27 Feb 2024 22:01:27 +0100
Message-ID: <8f49574f0b5c04fd8852e4358d4130d54e8b42ec.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] kernel-yocto.bblass: run
 kernel_version_sanity_check after do_patch
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Date: Tue, 27 Feb 2024 22:01:26 +0100
In-Reply-To: <CADkTA4PY-nSY8cQZY49LWG87OAjBT4=Pz=6R5eNTL4h4BNN6Tw@mail.gmail.com>
References: <20240227170902.3718203-1-ejo@pengutronix.de>
	 <20240227170902.3718203-2-ejo@pengutronix.de>
	 <CADkTA4PY4HXpcu4K7YkuqLSuLor=tKfTz04fEORKBRycgE12Fw@mail.gmail.com>
	 <b3485a14d8f03e3c29e6f12a065775e1522e7ad0.camel@pengutronix.de>
	 <CADkTA4Ou-ty361eSd3LxBvKNn75EoDn6pbtEE63gwd0kg+uWtA@mail.gmail.com>
	 <5fe1a738ad6a53058fc7c4b1339ce64a0d0365ee.camel@pengutronix.de>
	 <CADkTA4PY-nSY8cQZY49LWG87OAjBT4=Pz=6R5eNTL4h4BNN6Tw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 21:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196297

Am Dienstag, dem 27.02.2024 um 14:46 -0500 schrieb Bruce Ashfield:
> On Tue, Feb 27, 2024 at 2:32=E2=80=AFPM Enrico J=C3=B6rns <ejo@pengutroni=
x.de> wrote:
> >=20
> > Am Dienstag, dem 27.02.2024 um 14:13 -0500 schrieb Bruce Ashfield:
> > > On Tue, Feb 27, 2024 at 1:55=E2=80=AFPM Enrico J=C3=B6rns <ejo@pengut=
ronix.de> wrote:
> > > >=20
> > > > Am Dienstag, dem 27.02.2024 um 12:36 -0500 schrieb Bruce Ashfield:
> > > > > On Tue, Feb 27, 2024 at 12:09=E2=80=AFPM Enrico J=C3=B6rns <ejo@p=
engutronix.de> wrote:
> > > > > >=20
> > > > > > The kernel patches may modify the kernel version, thus wait for=
 do_patch
> > > > > > before running the version check.
> > > > >=20
> > > > > While that may be true for kernel's in general, I sincerely hope =
that no one is
> > > > > patching in a new kernel version to linux-yocto.
> > > > >=20
> > > > > I don't have any great concerns with the patch, I just don't thin=
k it
> > > > > is necessary :)
> > > >=20
> > > > Yes, the use case is actually not linux-yocto itself.
> > > > Thus it might be most relevant in combination with moving the versi=
on check to
> > > > kernel.bbclass.
> > > >=20
> > > > How I actually came across this check is that (in some projects) we=
 use the linux-
> > > > yocto.bbclass
> > > > for
> > > > non-linux-yocto kernels since some functionality (especially fragme=
nt handling) seems useful
> > > > in
> > > > general.
> > > >=20
> > > > I am still unsure if I should try to move (or duplicate) the requir=
ed features in the
> > > > generic
> > > > kernel.bbclass or if using linux-yocto.bbclass for 'mainline' kerne=
l is an appropriate use
> > > > case..?
> > > >=20
> > >=20
> > > There's no need to use the linux-yocto repository when using
> > > kernel-yocto bbclass, so
> > > definitely, it is an acceptable use case. In fact meta-mainline, and
> > > linux-yocto themselves
> > > are both using kernel-yocto bbclass to build mainline/-stable kernels=
.
> > >=20
> > > I'd rather not move the kernel-yocto bits into kernel.bbclass, since
> > > if that was something
> > > easily done .. I would have done it a long time ago.
> > >=20
> > > Keeping the split in the functionality allows those that don't care
> > > about linux-yocto to
> > > keep their recipes and workflow the same, and those that want to opt
> > > into the kernel-yocto
> > > functionality can just inherit the class.
> >=20
> > Yes, I wouldn't move the meta data handling and its tricky pieces, sinc=
e this is actually
> > something
> > I see in kernel-yocto.bbclass, too.
> >=20
> > But.. do you have an opinion on adding simple config fragment handling =
in kernel.bbclass (like
> > we
> > have in busybox or u-boot)? So mainly calling merge_config.sh somewhere=
 around do_configure.
> > (It would however need to be compatible with (or replaced by) the more =
advanced handling in
> > kernel-
> > yocto.bbclass.)
>=20
> I do have a very strong opinion.
>=20
> If we were going to do that, I also would have done it many years ago.
>=20
> Having some, but not all of the meta-data and merging split between the
> classes would be a disaster.

I would not call config fragments 'meta-data' and was thinking more about s=
omething that is replaced
by kernel-yocto.bbclass. That a split of meta-data handling would be a disa=
ster is something I would
agree on.

> If there's something that the meta-data handling is doing in kernel-yocto
> bbclass that isn't working or isn't appropriate, we can fix it there.

Ok, if the opinion is that strong, than this is the way to go for me first =
of all.
(However, I do not have any meta-data in mind in our use case anyway.)

> Other layers and classes in those layers are of course free to do whateve=
r
> they want, but we need to be consistent in core.

Clear.

> In fact, I've had a bug and a prototype patch for many years now that
> does move some of the configuration merging to kernel.bbclass, but it
> only increases complexity and doesn't offer any benefits .. again, since
> if there's something wrong with the fragment gathering and merging
> in the kernel-yocto bbclass that makes it not broadly applicable, we need
> to fix it there, not make things more complex and confusing by arbitraril=
y
> splitting it into something unmaintainable.

Keeping it maintainable should be the primary goal, indeed!
I would not call it 'arbitrarily splitting' but at a well-defined point (*n=
o* meta-data vs. meta-
data), but if you have already tried to do a proper split I'd keep this as =
a good hint first of all
that the topic is quite tricky.

Thanks for sharing your opinions on that =F0=9F=99=82

Enrico

> Bruce
>=20
> >=20
> >=20
> > Enrico
> >=20
> > > Bruce
> > >=20
> > > >=20
> > > > Regards, Enrico
> > > >=20
> > > > > Bruce
> > > > >=20
> > > > > >=20
> > > > > > Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> > > > > > ---
> > > > > > =C2=A0meta/classes-recipe/kernel-yocto.bbclass | 2 +-
> > > > > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >=20
> > > > > > diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/cl=
asses-recipe/kernel-
> > > > > > yocto.bbclass
> > > > > > index 108b7e6752..854e4681d5 100644
> > > > > > --- a/meta/classes-recipe/kernel-yocto.bbclass
> > > > > > +++ b/meta/classes-recipe/kernel-yocto.bbclass
> > > > > > @@ -729,6 +729,6 @@ python () {
> > > > > > =C2=A0}
> > > > > >=20
> > > > > > =C2=A0# extra tasks
> > > > > > -addtask kernel_version_sanity_check after do_kernel_metadata d=
o_kernel_checkout before
> > > > > > do_compile
> > > > > > +addtask kernel_version_sanity_check after do_patch before do_c=
ompile
> > > > > > =C2=A0addtask validate_branches before do_patch after do_kernel=
_checkout
> > > > > > =C2=A0addtask kernel_configcheck after do_configure before do_c=
ompile
> > > > > > --
> > > > > > 2.39.2
> > > > > >=20
> > > > >=20
> > > > >=20
> > > >=20
> > > > --
> > > > Pengutronix e.K.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | Enrico J=C3=B6rns=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > > > Embedded Linux Consulting & Support=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | https://www.pengutronix.de/=C2=A0|
> > > > Steuerwalder Str. 21=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | Phone: +49-5121-206917-180=C2=A0 |
> > > > 31137 Hildesheim, Germany=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | Fax:=C2=A0=
=C2=A0 +49-5121-206917-9=C2=A0=C2=A0=C2=A0 |
> > >=20
> > >=20
> > >=20
> >=20
> > --
> > Pengutronix e.K.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | Enrico J=C3=B6rns=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > Embedded Linux Consulting & Support=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | https://www.pengutronix.de/=C2=A0|
> > Steuerwalder Str. 21=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | Phone: +49-5121-206917-180=C2=A0 |
> > 31137 Hildesheim, Germany=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | Fax:=C2=A0=C2=
=A0 +49-5121-206917-9=C2=A0=C2=A0=C2=A0 |
>=20
>=20
>=20

--=20
Pengutronix e.K.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Enrico J=C3=B6rns=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
Embedded Linux Consulting & Support=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| https://www.pengutronix.de/ |
Steuerwalder Str. 21=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| Phone: +49-5121-206917-180=C2=A0=C2=A0|
31137 Hildesheim, Germany=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Fax:=C2=A0=C2=
=A0=C2=A0+49-5121-206917-9=C2=A0=C2=A0=C2=A0=C2=A0|

