Return-Path: <Kexin.Hao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F0E577943F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 13:58:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w86DwGMd002476
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Sep 2018 06:58:16 -0700
Received: from pek-khao-d2 (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 6 Sep 2018 06:58:14 -0700
Date: Thu, 6 Sep 2018 21:57:27 +0800
From: Kevin Hao <kexin.hao@windriver.com>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20180906135727.GA3420@pek-khao-d2>
References: <20180906131120.87405-1-kexin.hao@windriver.com>
	<20180906132739.GR26633@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20180906132739.GR26633@bill-the-cat>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Originating-IP: [147.11.105.121]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: Introduce the --use-label partition parameter
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2018 13:58:17 -0000
X-Groupsio-MsgNum: 115980
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 06, 2018 at 09:27:39AM -0400, Tom Rini wrote:
> On Thu, Sep 06, 2018 at 09:11:20PM +0800, Kevin Hao wrote:
>=20
> > We can use this parameter to make the wic use the label to name a
> > partition in /etc/fstab.
> >=20
> > Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
>=20
> Reviewed-by: Tom Rini <trini@konsulko.com>
>=20
> A few minor things below:
>=20
> [snip]
> > @@ -945,6 +945,14 @@ DESCRIPTION
> >                          label is already in use by another filesystem,
> >                          a new label is created for the partition.
> > =20
> > +         --use-label: This option is specific to wic. It makes wic to =
use the
> > +                      label in /etc/fstab to specify a partition. If t=
he
> > +                      --use-label and --use-uuid are used at the same =
time,
> > +                      we prefer the uuid because it is less likely to =
cause
> > +                      name confliction. We don't support to use this p=
arameter
> > +                      on a root partition since the kernel can't under=
stand the
> > +                      LABEL syntax.
>=20
> I think we should have the last sentence read more like:
> We don't support using this parameter on the root partition since it
> requires an initramfs to parse this value and we do not currently
> support that.
>=20
> Only because while what you said is correct, this makes it clear what
> would be needed to support it.

Absolutely. I will rephrase it as what you suggested.

>=20
> > @@ -197,10 +198,14 @@ class KickStart():
> >                                               (confpath, lineno, err))
> >                      if line.startswith('part'):
> >                          # SquashFS does not support UUID
> > -                        if parsed.fstype =3D=3D 'squashfs' and parsed.=
use_uuid:
> > +                        if parsed.fstype =3D=3D 'squashfs' and (parsed=
=2Euse_uuid or parsed.use_label):
> >                              err =3D "%s:%d: SquashFS does not support =
UUID" \
> >                                    % (confpath, lineno)
> >                              raise KickStartError(err)
>=20
> This hunk is going to conflict with Emmanuel's patch.  Further I think
> it should be a separate check on fstype =3D=3D squashfs and (label &&
> use_label) with a label-specific error message.  Thanks!

Thanks for the notice. I will rebase on the Emmanuel's new version patch.

Thanks,
Kevin
>=20
> --=20
> Tom



--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEHc6qFoLCZqgJD98Zk1jtMN6usXEFAluRMkcACgkQk1jtMN6u
sXHEswgAsCv/fIimYFrGZVVK5Jl6T/at+Y3QVi1rRS0vQypDHyekx8oEX6VXdZyJ
hucOgIYro4eGeC6Ln1L3x8MdHljyuJ+jPGQIIoSmEvLEZH4qSL1dS2bYSUTYxK+P
zIuEAoTSskDk3amkMpdc4C8d6jma38WudXRFi/J5N3yRrzi9Ginc69Ztl4mNrjhe
AJVjJ8MMQgblF2m8ccGL8Yn4hVoB03eUeVEkCPwvk0ncRfj4TlkvDcRqTatNx3Sp
ur6Fo+PYux/bIIZhSkwjLjqmQj0tWLQAXzYeVBxr+tFn2+25kdNZJFG93o396bEZ
M14Dv05ZRe7r+HQbilk92GWW/Uge1A==
=BFKW
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
