Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROAgo-0005HE-7K
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 17:07:50 +0100
Received: by bkbzs2 with SMTP id zs2so1516974bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2011 08:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RU5HkgbyAVauht3p/74CquVaqbeBrx66C0GEg5vf1Bs=;
	b=VmL3kOsSH2N9SZbPj/ZmCMNa3JCS73Dl+mrIveK/jsowTGjFx/mZwPxmcYouc2mPum
	MzjwFKQoImXSrYn/cQ6I8Z6rI4xtWp6ZIQbyE5s/eTie43sCxyA6xodvhbKFQUCMQgZa
	9Q0VPRJaZsiPfBVLVPRKLzccTw9/4jcRuSFUw=
Received: by 10.204.9.211 with SMTP id m19mr2152356bkm.92.1320854494680;
	Wed, 09 Nov 2011 08:01:34 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k13sm24361862fah.0.2011.11.09.08.01.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 08:01:33 -0800 (PST)
Date: Wed, 9 Nov 2011 17:01:16 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20111109160116.GB21022@jama.jama.net>
References: <cover.1320675529.git.Martin.Jansa@gmail.com>
	<66b436c4cba411e56445c32a98e0f5e160ab13a8.1320675529.git.Martin.Jansa@gmail.com>
	<4EB97FEC.3020602@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4EB97FEC.3020602@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core 1/6] libsdl: enable cdrom, alsa and tslib, disable rpath and add few fixes from meta-oe
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
X-List-Received-Date: Wed, 09 Nov 2011 16:07:50 -0000
X-Groupsio-MsgNum: 12222
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Content-Disposition: inline

--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2011 at 11:15:56AM -0800, Saul Wold wrote:
> On 11/07/2011 06:19 AM, Martin Jansa wrote:
> > * virtual/libsdl is used in sdl.bbclass but nothing was providing it
> > * rpath disabled because otherwise libtool and ld try to link against
> >    ${libdir}/libdl.so.2 on the host
> >    (see OE-classic commit af1a2e0e7626e372f22afbcabf08d9ae6b0d7b01)
> >
> > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> > ---
> >   meta/recipes-graphics/libsdl/libsdl_1.2.14.bb |   18 ++++++++++++----=
--
> >   1 files changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb b/meta/recip=
es-graphics/libsdl/libsdl_1.2.14.bb
> > index 6b23344..17a3103 100644
> > --- a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> > +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> > @@ -10,10 +10,12 @@ SECTION =3D "libs"
> >   LICENSE =3D "LGPLv2.1"
> >   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D27818cd7fd83877a8e3ef82b82=
798ef4"
> >
> > -DEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/li=
bgl', '', d)} virtual/libx11 libxext libxrandr libxrender"
> > +PROVIDES =3D "virtual/libsdl"
> > +
> > +DEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/li=
bgl', '', d)} virtual/libx11 libxext libxrandr libxrender alsa-lib tslib"
> >   DEPENDS_virtclass-nativesdk =3D "libx11-nativesdk libxrandr-nativesdk=
 libxrender-nativesdk libxext-nativesdk"
> >
> Shouldn't the enabling of alsa be based on the DISTRO_FEATURE of alsa?

OK

I'll send patch changing this and opengl to PACKAGECONFIG options.

>=20
> Sau!
>=20
> > -PR =3D "r0"
> > +PR =3D "r1"
> >
> >   SRC_URI =3D "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
> >   	   file://configure_tweak.patch \
> > @@ -26,25 +28,29 @@ SRC_URI[sha256sum] =3D "5d927e287034cb6bb0ebccfa382=
cb1d185cb113c8ab5115a0759798642
> >
> >   inherit autotools binconfig pkgconfig
> >
> > -EXTRA_OECONF =3D "--disable-static --disable-debug --disable-cdrom --e=
nable-threads --enable-timers --enable-endian \
> > -                --enable-file --disable-oss --disable-alsa --disable-e=
sd --disable-arts \
> > +EXTRA_OECONF =3D "--disable-static --disable-debug --enable-cdrom --en=
able-threads --enable-timers --enable-endian \
> > +                --enable-file --disable-oss --enable-alsa --disable-es=
d --disable-arts \
> >                   --disable-diskaudio --disable-nas --disable-esd-share=
d --disable-esdtest \
> >                   --disable-mintaudio --disable-nasm --enable-video-x11=
 --disable-video-dga \
> >                   --disable-video-fbcon --disable-video-directfb --disa=
ble-video-ps2gs --disable-video-ps3 \
> >                   --disable-video-xbios --disable-video-gem --disable-v=
ideo-dummy \
> > -                --enable-input-events --enable-pthreads \
> > +                --enable-input-events --enable-input-tslib --enable-pt=
hreads \
> >   		${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-openg=
l', '--disable-video-opengl', d)} \
> >   		--disable-video-svga \
> > -                --disable-video-picogui --disable-video-qtopia --enabl=
e-dlopen"
> > +                --disable-video-picogui --disable-video-qtopia --enabl=
e-dlopen \
> > +                --disable-rpath"
> >
> >   PARALLEL_MAKE =3D ""
> >
> > +EXTRA_AUTORECONF +=3D "--include=3Dacinclude --exclude=3Dautoheader"
> > +
> >   do_configure_prepend() {
> >           # Remove old libtool macros.
> >           MACROS=3D"libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 l=
tversion.m4"
> >           for i in ${MACROS}; do
> >                  rm -f acinclude/$i
> >           done
> > +        export SYSROOT=3D$PKG_CONFIG_SYSROOT_DIR
> >   }
> >
> >   BBCLASSEXTEND =3D "nativesdk"

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk66o8wACgkQN1Ujt2V2gBzmrgCeIeKIXCsywOkCZn2VX4lCiGYi
fE4AnRZxt0B0msXIcvDB+OESXo8F6g65
=YAct
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
