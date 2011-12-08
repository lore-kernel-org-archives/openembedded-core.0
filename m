Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RYfj0-0006WZ-QT
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 16:17:31 +0100
Received: by eekb15 with SMTP id b15so1101036eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2011 07:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Jx86C/a31LNOCo4pf4duOx+qQP2JKhhTrws4I6QXxvM=;
	b=dX2XcYr5gY8i4bUVZApEHW0ZMzbJKs5/0MUKBuRvqBXYPGvPWXhlTGzQw95zzT997M
	Oxx6rFTrVQJbYxob8oObBuNsfbhrd4KAEIgwX4NBeWUv9Z+NCRGGqmb3dHgDC6z2lExn
	0UwnTKqWlLqF2+rL7QvVJ0SyaqR5r5iHKJGds=
Received: by 10.14.14.160 with SMTP id d32mr156861eed.223.1323357041145;
	Thu, 08 Dec 2011 07:10:41 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z43sm6537914eef.7.2011.12.08.07.10.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Dec 2011 07:10:38 -0800 (PST)
Date: Thu, 8 Dec 2011 16:10:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111208151026.GC3761@jama.jama.net>
References: <cover.1323212403.git.andrea.adami@gmail.com>
	<68e1fafa3ed455dd26cfbfe2a76b3cbdb5b7bfc2.1323212403.git.andrea.adami@gmail.com>
	<CA+M6bXmdt7UE+-HkLva9snnv=AJhhh0sxKSKCJhQOb58bNKGJQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+M6bXmdt7UE+-HkLva9snnv=AJhhh0sxKSKCJhQOb58bNKGJQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] image_types.bbclass: implement jffs2 summary images (sum.jffs2)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Dec 2011 15:17:31 -0000
X-Groupsio-MsgNum: 13860
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iFRdW5/EC4oqxDHL"
Content-Disposition: inline

--iFRdW5/EC4oqxDHL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 08, 2011 at 07:57:52AM -0700, Tom Rini wrote:
> On Tue, Dec 6, 2011 at 4:23 PM, Andrea Adami <andrea.adami@gmail.com> wro=
te:
> > * Building the jffs2 filesystem to include summary information speeds up
> > * the mount process considerably at the cost of increased size.
> > * The rate of speedup is generally higher on NAND chips and on the chips
> > * where the erase block size is large.
> >
> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>

I'll repeat my comment from yesterday, but IMHO it would be easier to
see the difference between those 2 images if the IMAGE_CMD_jffs2 output is=
=20
renamed to .jffs2.nosummary and IMAGE_CMD_sum.jffs2 (or renamed IMAGE_CMD_j=
ffs2.summary)
produces .jffs2.summary (or even just .jffs2 if we can agree that .summary =
is
what enduser wants by default)

But other than that it looks fine and will make my IMAGE_DEPENDS_jffs2 a
bit shorter.

Regards,

>=20
> Acked-by: Tom Rini <tom.rini@gmail.com>
>=20
> > ---
> > =A0meta/classes/image_types.bbclass | =A0 =A05 ++++-
> > =A01 files changed, 4 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_type=
s.bbclass
> > index 29b6380..bd4b7bc 100644
> > --- a/meta/classes/image_types.bbclass
> > +++ b/meta/classes/image_types.bbclass
> > @@ -35,6 +35,8 @@ XZ_COMPRESSION_LEVEL ?=3D "-e -9"
> > =A0XZ_INTEGRITY_CHECK ?=3D "crc32"
> >
> > =A0IMAGE_CMD_jffs2 =3D "mkfs.jffs2 --root=3D${IMAGE_ROOTFS} --faketime =
--output=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
> > +IMAGE_CMD_sum.jffs2 =3D "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR=
_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
> > + =A0 =A0 =A0 -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${E=
XTRA_IMAGECMD}"
> >
> > =A0IMAGE_CMD_cramfs =3D "mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/$=
{IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
> >
> > @@ -138,6 +140,7 @@ EXTRA_IMAGECMD_btrfs ?=3D ""
> >
> > =A0IMAGE_DEPENDS =3D ""
> > =A0IMAGE_DEPENDS_jffs2 =3D "mtd-utils-native"
> > +IMAGE_DEPENDS_sum.jffs2 =3D "mtd-utils-native"
> > =A0IMAGE_DEPENDS_cramfs =3D "cramfs-native"
> > =A0IMAGE_DEPENDS_ext2 =3D "genext2fs-native"
> > =A0IMAGE_DEPENDS_ext2.gz =3D "genext2fs-native"
> > @@ -157,4 +160,4 @@ IMAGE_DEPENDS_ubi =3D "mtd-utils-native"
> > =A0IMAGE_DEPENDS_ubifs =3D "mtd-utils-native"
> >
> > =A0# This variable is available to request which values are suitable fo=
r IMAGE_FSTYPES
> > -IMAGE_TYPES =3D "jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.=
lzma live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz=
 cpio.xz cpio.lzma"
> > +IMAGE_TYPES =3D "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext=
3.gz ext2.lzma live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cp=
io cpio.gz cpio.xz cpio.lzma"
> > --
> > 1.7.3.4
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
>=20
> --=20
> Tom
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iFRdW5/EC4oqxDHL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7g02IACgkQN1Ujt2V2gBzRiwCfUsknujEnpO0NDqCpn8FTX3Wc
LsAAnjZNQc0B8brrbpeoBdFf2rww5Le4
=sJ67
-----END PGP SIGNATURE-----

--iFRdW5/EC4oqxDHL--
