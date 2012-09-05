Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T9B0q-0000Ol-7i
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 10:31:04 +0200
Received: by weyr6 with SMTP id r6so236648wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2012 01:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hy/Bm7UQ5TWuPp1m9kmcW0ytxndEOkbFMc0vfR55Wog=;
	b=Grp7wKh5rg3EURzVzcbrfUPwMnlFcQ5xSTIsqXDz4ZrmN93PEpBx7PTmmq+V87qoKI
	ePrKaPB74I1Ck0Vh4yQy6N7yiUTEm00bxEwHdf8ziEYdJb3jNAqF4U7mHmy2tCzVU8YW
	+Gv6SBTjMUPtIP9gKi5VMCgCjvoVOePGaX8hRz3OKKIKzmuN9O0AcuaaUX5W8fn8vSfC
	fM3WEBc3XW4vbP6k4vQuvKKf2JSVnWbtAYNZPSV2t39bx4rjrq3uRYyLveyZL6G7ry6V
	yata1tacdqC+zo1l5u1UiauQTlm/ORb0MLVDVxN+A4gNTi3v9Nx+iOgFMsWimTNm9zkY
	JmHQ==
Received: by 10.217.6.12 with SMTP id x12mr11892404wes.176.1346833121428;
	Wed, 05 Sep 2012 01:18:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm27980997wiv.11.2012.09.05.01.18.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 01:18:40 -0700 (PDT)
Date: Wed, 5 Sep 2012 10:19:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20120905081909.GL3372@jama.jama.net>
References: <1346807137-4231-1-git-send-email-Martin.Jansa@gmail.com>
	<1346807137-4231-2-git-send-email-Martin.Jansa@gmail.com>
	<5046ED1D.9080204@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5046ED1D.9080204@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] pixman: ignore NEON, IWMMXT, LOONGSON_MMI variables for class-native
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
X-List-Received-Date: Wed, 05 Sep 2012 08:31:04 -0000
X-Groupsio-MsgNum: 28706
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="64LDleNqNegJ4g97"
Content-Disposition: inline

--64LDleNqNegJ4g97
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 05, 2012 at 02:11:41PM +0800, Robert Yang wrote:
>=20
>=20
> On 09/05/2012 09:05 AM, Martin Jansa wrote:
> > * pixman-native can have different do_configure sstate checksums if it'=
s built with armv4t machine and armv7a
> >    OE @ ~ $ bitbake/bin/bitbake-diffsigs
> >      before-mgmt/stamps.1346795706/nokia900/x86_64-linux/pixman-native-=
*.do_configure.sigdata.*
> >      after-mgmt/stamps.1346801508/om-gta02/x86_64-linux/pixman-native-*=
=2Edo_configure.sigdata.*
> >    basehash changed from 27e577de60880a788c7aaba797ef83e0 to c6799807eb=
3e767daf1e75738fc753f7
> >    Variable NEON value changed from   to  --disable-arm-neon
> > * so if you start building with different machine then last time (wrt
> >    NEON setting) all recipes which depends on pixman-native will be reb=
uilt too
> > * this explains why sstate-cache-management.sh wanted to remove many
> >    native sstate packages when --stamps-dir option was used (see comment
> >    28 in https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2897)
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >   meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb b/meta/rec=
ipes-graphics/xorg-lib/pixman_0.27.2.bb
> > index 35a2def..218808a 100644
> > --- a/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb
> > +++ b/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb
> > @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D14096c769a=
e0cbb5fcb94ec468be11b3 \
> >   DEPENDS +=3D "zlib libpng"
> >   BBCLASSEXTEND =3D "native"
> >
> > -PR =3D "r1"
> > +PR =3D "r2"
> >
> >   PE =3D "1"
> >
> > @@ -25,7 +25,8 @@ NEON =3D " --disable-arm-neon "
> >   NEON_armv7a =3D " "
> >   NEON_armv7a-vfp-neon =3D " "
> >
> > -EXTRA_OECONF=3D"--disable-gtk ${IWMMXT} ${LOONGSON_MMI} ${NEON}"
> > +EXTRA_OECONF =3D "--disable-gtk ${IWMMXT} ${LOONGSON_MMI} ${NEON}"
> > +EXTRA_OECONF_class-native =3D "--disable-gtk"
> >
>=20
> Hi Martin,
>=20
> What's the differences between "_virtclass-native" and "_class-native", p=
lease?

_class-foo works for all types of recipes:
target,native,cross,crosssdk,cross-canadian,nativesdk

classes/base.bbclass:CLASSOVERRIDE ?=3D "class-target"
classes/cross-canadian.bbclass:CLASSOVERRIDE =3D "class-cross-canadian"
classes/cross.bbclass:CLASSOVERRIDE =3D "class-cross"
classes/crosssdk.bbclass:CLASSOVERRIDE =3D "class-crosssdk"
classes/native.bbclass:CLASSOVERRIDE =3D "class-native"
classes/nativesdk.bbclass:CLASSOVERRIDE =3D "class-nativesdk"
conf/bitbake.conf:OVERRIDES =3D "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:bui=
ld-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERR=
IDE}:forcevariable"
conf/bitbake.conf:CLASSOVERRIDE ?=3D "class-target"

while _virtclass-foo works only for cross, native, nativesdk and multilib
classes/cross.bbclass:    bb.data.setVar("OVERRIDES", e.data.getVar("OVERRI=
DES", False) + ":virtclass-cross", e.data)
classes/native.bbclass:    e.data.setVar("OVERRIDES", e.data.getVar("OVERRI=
DES", False) + ":virtclass-native")
classes/nativesdk.bbclass:    e.data.setVar("OVERRIDES", e.data.getVar("OVE=
RRIDES", False) + ":virtclass-nativesdk")
classes/populate_sdk_base.bbclass:        overrides =3D d.getVar("OVERRIDES=
", False) + ":virtclass-multilib-" + item
classes/utils.bbclass:        overrides =3D localdata.getVar("OVERRIDES", F=
alse) + ":virtclass-multilib-" + item
recipes-core/eglibc/eglibc-ld.inc:        overrides =3D localdata.getVar("O=
VERRIDES", False) + ":virtclass-multilib-" + item

IIRC RP said somewhere that virtclass usages should be=20
cleaned from metadata and replaced with stronger CLASSOVERRIDE, that's
why I used class-native here.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--64LDleNqNegJ4g97
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBHCv0ACgkQN1Ujt2V2gBxJJwCdFMINE3bpszVzvzjyvZOwgzXV
dbEAnRdWwXIWP5mPm4Q+Z7DS/iNMuBmG
=8Ws0
-----END PGP SIGNATURE-----

--64LDleNqNegJ4g97--
