Received: from mail-pa0-f48.google.com ([209.85.220.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UNnie-00083w-7y
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 19:13:00 +0200
Received: by mail-pa0-f48.google.com with SMTP id lj1so1570217pab.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 09:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=rtt+bLFaveyRJoVX3IVj60+tsvuM3ZcCgFSuYjYfQwA=;
	b=agu+o7ZH5srhd/mpNVt1bdriuCbCA/n3ISZiRyPNbSeJXMKyeKO+LEuWYIbYFSNea6
	7FuF8iEJ+AxgVL+GIMFSb/EKMkcaFIr/sPXTned91Nx2coNVAFJi38fq7KiW+hLVJ95W
	EgbAkE4HXkKtQlZ1Gp5c3+XJkOzrL9Zcyfso6hkln2h6zSNBI1FJxaAi2xkj481QklbV
	Z8zyXDyo5UhSI7WrDcnLPmvolXs5Wj20I5gmMO/2Bqpz0lQF20Ib2cXCpcNosB/XoTcF
	MuMd/uvrE8T64a4SoILiVGhamT+0FFVy7aitbBUHnpcKsK22hoGJNolX6we2nE2h/0Wf
	OuGQ==
X-Received: by 10.68.252.136 with SMTP id zs8mr5037799pbc.36.1365094546572;
	Thu, 04 Apr 2013 09:55:46 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id cn1sm10876424pbb.7.2013.04.04.09.55.43
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 09:55:45 -0700 (PDT)
Date: Thu, 4 Apr 2013 18:55:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130404165547.GF1271@jama.dyndns-home.com>
References: <1365093733-31674-1-git-send-email-Martin.Jansa@gmail.com>
	<1365094008.6526.115.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1365094008.6526.115.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] systemd: set INHIBIT_UPDATERCD_BBCLASS without sysvinit in features
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
X-List-Received-Date: Thu, 04 Apr 2013 17:13:00 -0000
X-Groupsio-MsgNum: 37442
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qp4W5+cUSnZs0RIF"
Content-Disposition: inline

--qp4W5+cUSnZs0RIF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 04, 2013 at 05:46:48PM +0100, Richard Purdie wrote:
> On Thu, 2013-04-04 at 18:42 +0200, Martin Jansa wrote:
> > * fixes udev configure in run-postinsts failing with:
> >   update-rc.d: /etc/init.d/systemd-udev: file does not exist
> >   because systemd-udev is installed only with sysvinit in features
> >   but update-rc.d was always called from PN postinst
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-core/systemd/systemd_199.bb | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >=20
> > diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-co=
re/systemd/systemd_199.bb
> > index ba1d133..e574548 100644
> > --- a/meta/recipes-core/systemd/systemd_199.bb
> > +++ b/meta/recipes-core/systemd/systemd_199.bb
> > @@ -239,6 +239,12 @@ INITSCRIPT_PACKAGES =3D "udev"
> >  INITSCRIPT_NAME_udev =3D "systemd-udevd"
> >  INITSCRIPT_PARAMS_udev =3D "start 03 S ."
> > =20
> > +python __anonymous() {
> > +    features =3D d.getVar("DISTRO_FEATURES", True).split()
> > +    if "sysvinit" not in features:
> > +        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
> > +}
> > +
> >  # TODO:
> >  # u-a for runlevel and telinit
>=20
> Would this make sense to be in systemd.bbclass?

Similar logic is in systemd.bbclass already, but systemd is not inherited f=
rom
systemd and dbus recipes.

Also the version from systemd.bbclass does check also for systemd in
DISTRO_FEATURES, but that's not wanted here, because decision to install in=
it.d
script is based only on sysvinit in DISTRO_FEATURES.

Lot's of fun with all init systems sharing the same PN :/.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qp4W5+cUSnZs0RIF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFdsJMACgkQN1Ujt2V2gBzZ/wCaA+YD6FFTqCYxsWd3kKH2e6mZ
H8oAmwdUFOtj9M25WNn10DpowB5BICAM
=hsyj
-----END PGP SIGNATURE-----

--qp4W5+cUSnZs0RIF--
