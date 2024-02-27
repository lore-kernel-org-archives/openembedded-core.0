Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1C1C5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 18:55:27 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.2430.1709060126126302131
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 10:55:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1rf2bs-0001QG-Gz; Tue, 27 Feb 2024 19:55:24 +0100
Message-ID: <b3485a14d8f03e3c29e6f12a065775e1522e7ad0.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] kernel-yocto.bblass: run
 kernel_version_sanity_check after do_patch
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Date: Tue, 27 Feb 2024 19:55:23 +0100
In-Reply-To: <CADkTA4PY4HXpcu4K7YkuqLSuLor=tKfTz04fEORKBRycgE12Fw@mail.gmail.com>
References: <20240227170902.3718203-1-ejo@pengutronix.de>
	 <20240227170902.3718203-2-ejo@pengutronix.de>
	 <CADkTA4PY4HXpcu4K7YkuqLSuLor=tKfTz04fEORKBRycgE12Fw@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 18:55:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196290

Am Dienstag, dem 27.02.2024 um 12:36 -0500 schrieb Bruce Ashfield:
> On Tue, Feb 27, 2024 at 12:09=E2=80=AFPM Enrico J=C3=B6rns <ejo@pengutron=
ix.de> wrote:
> >=20
> > The kernel patches may modify the kernel version, thus wait for do_patc=
h
> > before running the version check.
>=20
> While that may be true for kernel's in general, I sincerely hope that no =
one is
> patching in a new kernel version to linux-yocto.
>=20
> I don't have any great concerns with the patch, I just don't think it
> is necessary :)

Yes, the use case is actually not linux-yocto itself.
Thus it might be most relevant in combination with moving the version check=
 to kernel.bbclass.=20

How I actually came across this check is that (in some projects) we use the=
 linux-yocto.bbclass for
non-linux-yocto kernels since some functionality (especially fragment handl=
ing) seems useful in
general.

I am still unsure if I should try to move (or duplicate) the required featu=
res in the generic
kernel.bbclass or if using linux-yocto.bbclass for 'mainline' kernel is an =
appropriate use case..?


Regards, Enrico

> Bruce
>=20
> >=20
> > Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> > ---
> > =C2=A0meta/classes-recipe/kernel-yocto.bbclass | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-re=
cipe/kernel-yocto.bbclass
> > index 108b7e6752..854e4681d5 100644
> > --- a/meta/classes-recipe/kernel-yocto.bbclass
> > +++ b/meta/classes-recipe/kernel-yocto.bbclass
> > @@ -729,6 +729,6 @@ python () {
> > =C2=A0}
> >=20
> > =C2=A0# extra tasks
> > -addtask kernel_version_sanity_check after do_kernel_metadata do_kernel=
_checkout before
> > do_compile
> > +addtask kernel_version_sanity_check after do_patch before do_compile
> > =C2=A0addtask validate_branches before do_patch after do_kernel_checkou=
t
> > =C2=A0addtask kernel_configcheck after do_configure before do_compile
> > --
> > 2.39.2
> >=20
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

