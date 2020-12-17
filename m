Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.6071.1608200746440452792
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 02:25:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: kory.maincent@bootlin.com)
X-Originating-IP: 78.113.208.212
Received: from kmaincent-XPS-13-7390 (212.208.113.78.rev.sfr.net [78.113.208.212])
	(Authenticated sender: kory.maincent@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id C7D50E001A;
	Thu, 17 Dec 2020 10:25:43 +0000 (UTC)
Date: Thu, 17 Dec 2020 11:25:42 +0100
From: "Kory Maincent" <kory.maincent@bootlin.com>
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] ltp: fix rpc build error
Message-ID: <20201217112542.7f5c38f4@kmaincent-XPS-13-7390>
In-Reply-To: <AM9PR09MB473969D9F9FE59640D07DBEEA8C40@AM9PR09MB4739.eurprd09.prod.outlook.com>
References: <20201217095506.28531-1-kory.maincent@bootlin.com>
	<AM9PR09MB473969D9F9FE59640D07DBEEA8C40@AM9PR09MB4739.eurprd09.prod.outlook.com>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Konrad,

On Thu, 17 Dec 2020 11:03:39 +0100
Konrad Weihmann <kweihmann@outlook.com> wrote:

> On 17.12.20 10:55, Kory Maincent wrote:
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >   meta/recipes-extended/ltp/ltp_20200930.bb | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/meta/recipes-extended/ltp/ltp_20200930.bb
> > b/meta/recipes-extended/ltp/ltp_20200930.bb index 7acf15b360..9b17d68f67
> > 100644 --- a/meta/recipes-extended/ltp/ltp_20200930.bb
> > +++ b/meta/recipes-extended/ltp/ltp_20200930.bb
> > @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D "\
> >       file://utils/benchmark/kernbench-0.42/COPYING;md5=3D94d55d512a9ba=
36caa9b7df079bae19f
> > \ "
> >  =20
> > -DEPENDS =3D "attr libaio libcap acl openssl zip-native"
> > +DEPENDS =3D "attr libaio libcap acl openssl zip-native libtirpc" =20
>=20
> Can we have that as a PACKAGECONFIG entry, please? otherwise I think it=20
> will change the behavior of the existing setups.

I assumed the tirpc was disable because they did not manage to build with
it "# ltp network/rpc test cases ftbfs when libtirpc is found".
But if you prefer I can add it to PACKAGECONFIG.

> Also the dependency has a `PROVIDES =3D "virtual/librpc"`, so I think=20
> depending on virtual/librpc should be the safest way

Ok

>=20
> >   DEPENDS_append_libc-musl =3D " fts "
> >   EXTRA_OEMAKE_append_libc-musl =3D " LIBC=3Dmusl "
> >   EXTRA_OECONF_append_libc-musl =3D " LIBS=3D-lfts "
> > @@ -44,12 +44,12 @@ TARGET_CC_ARCH +=3D "${LDFLAGS}"
> >  =20
> >   export prefix =3D "/opt/${PN}"
> >   export exec_prefix =3D "/opt/${PN}"
> > +export libdir =3D "/usr/lib"
> > +export incdir =3D "/usr/include" =20
>=20
> Those should be ${libdir} and ${incdir} if I'm not mistaken

The exporting of ${prefix} change the value of ${libdir} and ${incdir}
therefore I set them up again. If I don't set it, pkgconfig can not find
libtirpc.

>=20
> >  =20
> >   PACKAGECONFIG[numa] =3D "--with-numa, --without-numa, numactl," =20
>=20
>=20
> >   EXTRA_AUTORECONF +=3D "-I ${S}/testcases/realtime/m4"
> >   EXTRA_OECONF =3D " --with-realtime-testsuite --with-open-posix-testsu=
ite "
> > -# ltp network/rpc test cases ftbfs when libtirpc is found
> > -EXTRA_OECONF +=3D " --without-tirpc " =20
>=20
> Should be part of a PACKAGECONFIG entry, with `--without-tirpc` being=20
> the default

Ok,

K=C3=B6ry




