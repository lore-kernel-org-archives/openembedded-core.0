Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RYRXP-0006nc-0F for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 01:08:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB801j73021227
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 00:01:45 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20748-05 for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2011 00:01:40 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB801bla021221
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 00:01:38 GMT
Message-ID: <1323302508.971.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Dec 2011 00:01:48 +0000
In-Reply-To: <201112080053.11966.schnitzeltony@gmx.de>
References: <1323279247.30601.51.camel@ted>
	<201112080053.11966.schnitzeltony@gmx.de>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	pB801j73021227
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
X-List-Received-Date: Thu, 08 Dec 2011 00:08:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2011-12-08 at 00:53 +0100, Andreas M=C3=BCller wrote:
> On Wednesday, December 07, 2011 06:34:07 PM Richard Purdie wrote:
> > We need pseudo to use the rootfs passwd/group files belonging to the
> > rootfs when building images. This patch ensures that we use the rootf=
s
> > files instead of those in the sysroot which can lead to incorrect fil=
e
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
> > PSEUDO_PASSWD=3D${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=3D1 PSEUDO_DISAB=
LED=3D0"
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
> To test: Is it enough to rebuild dbus?

It could well do. You just need to apply the patch and rebuild the
image.

Cheers,

Richard



