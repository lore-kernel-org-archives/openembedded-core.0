X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Date: Thu, 14 Oct 2021 13:39:48 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] [PATCH] libpam: Fix build with DISTRO_FEATURES usrmerge
Message-ID: <YWgXBNvqPs7TjkGb@piout.net>
References: <20211012111726.493810-1-zboszor@pr.hu>
 <CACS+7ZTXToShB1BjSA3WBB7CbcqWCeRotU3Ki3+WrzJDLLajqg@mail.gmail.com>
 <976419e0-eb32-d33e-d90d-b2eefc711034@pr.hu>
MIME-Version: 1.0
In-Reply-To: <976419e0-eb32-d33e-d90d-b2eefc711034@pr.hu>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-id: <openembedded-core.lists.openembedded.org>
To: zboszor@pr.hu
Cc: Dan McGregor <danismostlikely@gmail.com>, Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, =?iso-8859-1?B?Wm9sdOFuIEL2c3r2cm3pbnlp?= <zboszor@gmail.com>

On 14/10/2021 08:54:35+0200, Zoltan Boszormenyi via lists.openembedded.org =
wrote:
> On 2021. 10. 13. 21:38, Dan McGregor wrote:
> > Thanks for this. I hit it pretty immediately.
> >=20
> > On Tue, 12 Oct 2021 at 05:17, Zoltan Boszormenyi via
> > lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote:
> > >=20
> > > From: Zolt=E1n B=F6sz=F6rm=E9nyi <zboszor@gmail.com>
> > >=20
> > > Signed-off-by: Zolt=E1n B=F6sz=F6rm=E9nyi <zboszor@gmail.com>
> > > ---
> > >   meta/recipes-extended/pam/libpam_1.5.2.bb | 6 ++++--
> > >   1 file changed, 4 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes=
-extended/pam/libpam_1.5.2.bb
> > > index a3c4a50cb3..ee3a84a3b6 100644
> > > --- a/meta/recipes-extended/pam/libpam_1.5.2.bb
> > > +++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
> > > @@ -147,8 +147,10 @@ do_install() {
> > >          if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','=
false',d)}; then
> > >                  echo "session optional pam_systemd.so" >> ${D}${sysc=
onfdir}/pam.d/common-session
> > >          fi
> > > -        install -d ${D}/${libdir}/
> > > -       mv ${D}/${base_libdir}/pkgconfig ${D}/${libdir}/
> > > +       if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','false',=
'true',d)}; then
> >=20
> > In the patch I made that I kept local for now my condition was
> >=20
> > if [ "${base_libdir}" !=3D "${libdir}" ]
> >=20
> > It could be that a user sets libdir and base_libdir to be equal
> > without enabling usrmerge, but both checks solve the immediate
> > problem.
>=20
> Right, this is the correct solution.
>=20

The patch was just merged in master so you'd have to rebase on that

> >=20
> >=20
> > > +               install -d ${D}/${libdir}/
> > > +               mv ${D}/${base_libdir}/pkgconfig ${D}/${libdir}/
> > > +       fi
> > >   }
> > >=20
> > >   do_install_ptest() {
> > > --
> > > 2.31.1
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
>=20

>=20
>=20
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
