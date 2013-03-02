Received: from mail-pa0-f41.google.com ([209.85.220.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBsRO-0006xg-N9
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 20:50:32 +0100
Received: by mail-pa0-f41.google.com with SMTP id fb11so2450789pad.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Mar 2013 11:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=lDvA9v3qZq9GPQDaS2ZIvAZ7bDIMx/8BKQ90j/2coJQ=;
	b=O0J6bfP5wGpjW3LXseSaZPg12BB+4Rb0zWiRuiBq5dqnSTJ4YiK4rmfa1nx4dI6tHb
	R5FUKvAEmpg6r9BGGjIIQvtDG4c2l5b8Uod07FwAiAWnNvSK/lMklGqp6Em+rl5GgwHm
	vzdFYCB9UBn6Ocaz9FkVyiCytwxzRBXcT/Zn1Oii8kmdM2rWkaMJzksdt9oRU2XiCLtQ
	JaeKKhsLWXuRFM25MMTg8UxjX3aIkKLLW1yPTW5KxH4SamG2NBxO070/OwdNIfizts7o
	TDqAt4S9pS6QCPZ1KQSATbg1bvzH3zlR2/g9YvRRl/86XI4/5GPbmGEGE+SWr9nXGNI1
	dGzA==
X-Received: by 10.66.26.167 with SMTP id m7mr24617119pag.212.1362252808730;
	Sat, 02 Mar 2013 11:33:28 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id a10sm16376039pbq.29.2013.03.02.11.33.24
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 02 Mar 2013 11:33:27 -0800 (PST)
Date: Sat, 2 Mar 2013 20:33:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20130302193320.GC3279@jama>
References: <1361273568-30066-1-git-send-email-andrei.adrianx.dinu@intel.com>
	<51325221.5050802@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <51325221.5050802@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libpng : update to 1.60.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 02 Mar 2013 19:50:32 -0000
X-Groupsio-MsgNum: 36150
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2+IiqX0tbFQDLF7Q"
Content-Disposition: inline

--2+IiqX0tbFQDLF7Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 02, 2013 at 11:25:21AM -0800, Saul Wold wrote:
>=20
> While this is a straight forward patch, it causes some problems with=20
> depender's of libpng, since the library name changes from libpng15 ->=20
> libpng16 a lot of both -native and target packages fail to compile.
>=20
> I know in the past we would do a load of PR bumps to all these packages=
=20
> to address this issue.
>=20
> This is because many packages encode the libpng15 information into=20
> libtool (.la) files, when the sysroot is populated with an older build=20
> or sstate cache, the libpng15 info remains.
>=20
> There already is a link from libpng.la, why does this not get used by=20
> libtool and stored in the .la file?
>=20
> I am sure there is some strange magical history around this issue.

Last upgrade to 1.5 had the same problem, I still have magical "cleanup"=20
oneliner from that:

for MACHINE in nokia900 om-gta04 tuna qemux86-64 om-gta02 spitz; do
export MACHINE; bitbake -c cleansstate vlc vte qt4-x11-free qt4-embedded
python-pygtk pidgin poppler pango  packagekit nautilus mplayer2 metacity
matchbox-keyboard matchbox-panel-2 librsvg libwmf libsdl-image libunique
gst-plugins-bad gst-plugins-good avahi-ui cheese libass glade3
evolution-data-server gtk+3 gnome-disk-utility gnome-panel gnome-desktop
directfb cups gnome-keyring evince webkit-efl libcanberra cairo libglade
libgweather libwnck polkit-gnome  libgpewidget libgnomekbd gmtk
numptyphysics; done;

But this list is only to fix binary feed I care about, not all packages
available in layers.

> On 02/19/2013 03:32 AM, Andrei Dinu wrote:
> > Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> > ---
> >   .../libpng/{libpng_1.5.14.bb =3D> libpng_1.6.0.bb}   |   10 +++++-----
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> >   rename meta/recipes-multimedia/libpng/{libpng_1.5.14.bb =3D> libpng_1=
=2E6.0.bb} (50%)
> >
> > diff --git a/meta/recipes-multimedia/libpng/libpng_1.5.14.bb b/meta/rec=
ipes-multimedia/libpng/libpng_1.6.0.bb
> > similarity index 50%
> > rename from meta/recipes-multimedia/libpng/libpng_1.5.14.bb
> > rename to meta/recipes-multimedia/libpng/libpng_1.6.0.bb
> > index b2b82d3..951e34a 100644
> > --- a/meta/recipes-multimedia/libpng/libpng_1.5.14.bb
> > +++ b/meta/recipes-multimedia/libpng/libpng_1.6.0.bb
> > @@ -3,17 +3,17 @@ DESCRIPTION =3D "PNG Library"
> >   HOMEPAGE =3D "http://www.libpng.org/"
> >   SECTION =3D "libs"
> >   LICENSE =3D "Libpng"
> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D58c8238139ee86082f8d29eb893=
04241 \
> > -                    file://png.h;beginline=3D207;endline=3D321;md5=3D4=
f17771edaee8bb3c17a95d7faaa3681"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D03b8ec701cb796c0ec84af22f88=
4edef \
> > +                    file://png.h;beginline=3D207;endline=3D321;md5=3De=
829cebefd08488ba5142ea5faea6821"
> >   DEPENDS =3D "zlib"
> >   PR =3D "r0"
> > -LIBV =3D "15"
> > +LIBV =3D "16"
> >
> >   SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}=
/libpng-${PV}.tar.xz \
> >             "
> >
> > -SRC_URI[md5sum] =3D "94284b01d62ca43c5eb3f6702db08ed8"
> > -SRC_URI[sha256sum] =3D "1459488e1b58d3be1c798453cf40c522c05bd66b61156c=
d51f469f17dff87b54"
> > +SRC_URI[md5sum] =3D "3ee623b9a4d33bda7310a5124080b14d"
> > +SRC_URI[sha256sum] =3D "5e13c31321083b03956b5ff298bacffab7a7ad35c34c12=
2acef314593944b97b"
> >
> >   inherit autotools binconfig pkgconfig
> >
> >
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2+IiqX0tbFQDLF7Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEyVAAACgkQN1Ujt2V2gBzObgCfWLps6CpmpTSRFC4fj/ZEMdw2
yRoAnj0RXZfPbGDpvLA1mKrZj+SDs1Vm
=bUhe
-----END PGP SIGNATURE-----

--2+IiqX0tbFQDLF7Q--
