Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RYYA2-0005Iy-1D
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 08:12:54 +0100
Received: by eekb15 with SMTP id b15so935436eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2011 23:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+TPXWOLX37TuUaiaAHxGyxS9UwN2rLI19PC/+trFV90=;
	b=x2Lx9wZMc3z8yo7btPYy8NP5Y94xoi4Kpwu2MxS4IpWetnHaE9OFwvnr868YdKHrxX
	L0jdmpMuff9rXdBFOrgWVUmMY1aJwAKNmxVE3E1ul3Ppri/BVkcIpv7uh8GiamMu3wi2
	j0gUOidAfn1autyetCfFNblslzdnrrd1FlQ2k=
Received: by 10.14.14.160 with SMTP id d32mr11385eed.223.1323327962716;
	Wed, 07 Dec 2011 23:06:02 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 65sm14520021eeg.8.2011.12.07.23.06.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 23:06:00 -0800 (PST)
Date: Thu, 8 Dec 2011 08:05:49 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111208070548.GB3761@jama.jama.net>
References: <1323279247.30601.51.camel@ted>
	<201112080053.11966.schnitzeltony@gmx.de>
MIME-Version: 1.0
In-Reply-To: <201112080053.11966.schnitzeltony@gmx.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] bitbake.conf/image.bbclass: Ensure images use the correct passwd/group files
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
X-List-Received-Date: Thu, 08 Dec 2011 07:12:54 -0000
X-Groupsio-MsgNum: 13812
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KFztAG8eRSV9hGtP"
Content-Disposition: inline

--KFztAG8eRSV9hGtP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 08, 2011 at 12:53:11AM +0100, Andreas M=FCller wrote:
> On Wednesday, December 07, 2011 06:34:07 PM Richard Purdie wrote:
> > We need pseudo to use the rootfs passwd/group files belonging to the
> > rootfs when building images. This patch ensures that we use the rootfs
> > files instead of those in the sysroot which can lead to incorrect file
> > ownership issues.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >=20
> > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > index 4642fa6..865d430 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -121,6 +121,8 @@ IMAGE_LINGUAS ?=3D "de-de fr-fr en-gb"
> >=20
> >  LINGUAS_INSTALL =3D "${@" ".join(map(lambda s: "locale-base-%s" % s,
> > d.getVar('IMAGE_LINGUAS', 1).split()))}"
> >=20
> > +PSEUDO_PASSWD =3D "${IMAGE_ROOTFS}"
> > +
> >  do_rootfs[nostamp] =3D "1"
> >  do_rootfs[dirs] =3D "${TOPDIR}"
> >  do_rootfs[lockfiles] +=3D "${IMAGE_ROOTFS}.lock"
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index e80cc32..eeb1fc4 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -580,11 +580,12 @@ SRC_URI =3D "file://${FILE}"
> >=20
> >  # Use pseudo as the fakeroot implementation
> >  PSEUDO_LOCALSTATEDIR ?=3D "${WORKDIR}/pseudo/"
> > +PSEUDO_PASSWD ?=3D "${STAGING_DIR_TARGET}"
> >  export PSEUDO_DISABLED =3D "1"
> >  #export PSEUDO_PREFIX =3D "${STAGING_DIR_NATIVE}${prefix_native}"
> >  #export PSEUDO_BINDIR =3D "${STAGING_DIR_NATIVE}${bindir_native}"
> >  #export PSEUDO_LIBDIR =3D
> > "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib -FAKEROOTENV =3D
> > "PSEUDO_PREFIX=3D${STAGING_DIR_NATIVE}${prefix_native}
> > PSEUDO_LOCALSTATEDIR=3D${PSEUDO_LOCALSTATEDIR}
> > PSEUDO_PASSWD=3D${STAGING_DIR_TARGET} PSEUDO_NOSYMLINKEXP=3D1
> > PSEUDO_DISABLED=3D0" +FAKEROOTENV =3D
> > "PSEUDO_PREFIX=3D${STAGING_DIR_NATIVE}${prefix_native}
> > PSEUDO_LOCALSTATEDIR=3D${PSEUDO_LOCALSTATEDIR}
> > PSEUDO_PASSWD=3D${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=3D1 PSEUDO_DISABLE=
D=3D0"
> > FAKEROOTNOENV =3D "PSEUDO_UNLOAD=3D1"
> >  FAKEROOTDIRS =3D "${PSEUDO_LOCALSTATEDIR}"
> >  PREFERRED_PROVIDER_virtual/fakeroot-native ?=3D "pseudo-native"
> dbus still needs manual call of=20
>=20
> 	chown messagebus:messagebus /var/run/dbus /var/lib/dbus
>=20
> ( it is root:root on my image) and
>=20
> 	chown root:messagebus /usr/libexec/dbus-daemon-launch-helper
>=20
> ( it is avahi:netdev on my image )
>=20
> Does this one fix it?

It did for me, see:
http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1711

> To test: Is it enough to rebuild dbus?

I had right owners in dbus package, wrong only in rootfs, so your issue
could be different.

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KFztAG8eRSV9hGtP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7gYcwACgkQN1Ujt2V2gBzf1QCgjdDPtSSmzB4Vq+LLKeFLRRvA
jNkAmQFWoZ/hogyM7yT72sSH8hgcHdDf
=nt34
-----END PGP SIGNATURE-----

--KFztAG8eRSV9hGtP--
