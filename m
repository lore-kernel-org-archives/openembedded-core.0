Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id CA55A6A543
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 17:43:18 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z7so109922eaf.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2013 10:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oQ8iUQ+exlfs3PkS70PPCtLMlKTn/3n2UONBfg0jzjg=;
	b=RWmoklqp1vYm+HtQIWq9sg8+eCi3iuChzXmqguKsGXlA0GBwsWVjpK0O+09v5EfzXt
	pNjerURuVXWLnXyaCwH6naeq5t6TPOUKcB5tlcfn7DspF5pESzkVi08WllbFk/kzXZtk
	EdZUAUpj5ypgSSFTpLEkE0pJkvXE/sp5BpzNhWBXyt0FjL8+aEEnSYOKZ9FieD4yB4KC
	57hRC5jGklEtbWLepQ96zyuBxCI0Xl22v1bcRtNHAeuw0JO0KpMwn72hwUDuRaPGboPK
	AIUX7UL8rJXh4coDRSCy6w4gEFNHpOBTFFn8GZsry120YbZsaplNZXLMBD7H2MaxiHKd
	HHVg==
X-Received: by 10.14.0.131 with SMTP id 3mr17191131eeb.98.1370626999559;
	Fri, 07 Jun 2013 10:43:19 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	cf47sm11186269eeb.17.2013.06.07.10.43.18 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 07 Jun 2013 10:43:18 -0700 (PDT)
Date: Fri, 7 Jun 2013 19:43:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: eu@felipetonello.com
Message-ID: <20130607174338.GJ22710@jama>
References: <1370626502-5233-1-git-send-email-eu@felipetonello.com>
	<20130607174252.GI22710@jama>
MIME-Version: 1.0
In-Reply-To: <20130607174252.GI22710@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] valgrind: added perl dependency
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
X-List-Received-Date: Fri, 07 Jun 2013 17:43:19 -0000
X-Groupsio-MsgNum: 40327
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i6vqABX3nJKXLk01"
Content-Disposition: inline

--i6vqABX3nJKXLk01
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2013 at 07:42:52PM +0200, Martin Jansa wrote:
> On Fri, Jun 07, 2013 at 10:35:02AM -0700, eu@felipetonello.com wrote:
> > From: "Felipe F. Tonello" <eu@felipetonello.com>
> >=20
> > This is necessary since the valgrind package depends on /usr/bin/perl.
> >=20
> > This patch will fix this error while installing into rootfs:
> > Computing transaction...error: Can't install valgrind-3.8.1-r8@armv7a_v=
fp_neon: no package provides /usr/bin/perl
>=20
> This doesn't look as build-time dependency and before you add it to
> RDEPENDS_${PN} use grep to find which file in valgrind package is using
> /usr/bin/perl shebang
>=20
> grep -R '#/usr/bin/perl' packages-split/valgrind

ups, missed ! but you probably got the ide

>=20
> and if it's just some "extra" script not always needed for valgrind,
> then move it to extra package and add perl only to
> PN-this-extra-package.
>=20
> Cheers,
>=20
> >=20
> > Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
> > ---
> >  meta/recipes-devtools/valgrind/valgrind_3.8.1.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb b/meta/re=
cipes-devtools/valgrind/valgrind_3.8.1.bb
> > index 3520d49..ae2c5a2 100644
> > --- a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
> > +++ b/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
> > @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc46082167a31=
4d785d012a244748d803 \
> >                      file://COPYING.DOCS;md5=3D8fdeb5abdb235a08e76835f8=
f3260215"
> > =20
> >  X11DEPENDS =3D "virtual/libx11"
> > -DEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}=
', '', d)}"
> > -PR =3D "r8"
> > +DEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}=
', '', d)} perl"
> > +PR =3D "r9"
> > =20
> >  SRC_URI =3D "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
> >  	   file://fix_issue_caused_by_ccache.patch \
> > --=20
> > 1.8.1.4
> >=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--i6vqABX3nJKXLk01
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGyG8oACgkQN1Ujt2V2gBzwJQCfXkZumz+SnwJZyZPlGs1jvivH
9xwAn3b1kcxb/VPyOpNbvrFSdGS3AM2G
=VuAK
-----END PGP SIGNATURE-----

--i6vqABX3nJKXLk01--
