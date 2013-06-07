Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7F1186A543
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 17:42:32 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b15so2570081eae.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2013 10:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3uOg9PcmMaKpfJC6v7L79OzZTPeRqBfUtXC+Funh0XE=;
	b=vvSxxmtE+cCic8f12KL/kmTST4ENmob1tJdUmXcgpDsxYNmKcCd+U1+6r3tiBTXaff
	BprvWjtxEwdg8gbQAZNa61VXrk5/WXshw02o4QQsw70qxHw3aOGmRexmCRScUduKjxED
	iHG7onESVqWlAUprP00zt1kS1sBEPyNAHvtDbCBxYpq85MTT7N/susQkOdsfKCrce4u7
	LqMOu+nkBtqNf6Mrwd7EOCM2odFzssW9DduML31eJ8A7UEktAETfRD4sGlU1zZ5Y+oWs
	uMPPj+UyIM8ZlVY9u/Y1JHheHqTlYNgzRWPibYcMy7iwDDW/3KoDNXzQKmipQy4ZKVzg
	JmeA==
X-Received: by 10.15.35.71 with SMTP id f47mr39940157eev.15.1370626953124;
	Fri, 07 Jun 2013 10:42:33 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	y10sm113324853eev.3.2013.06.07.10.42.32 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 07 Jun 2013 10:42:32 -0700 (PDT)
Date: Fri, 7 Jun 2013 19:42:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: eu@felipetonello.com
Message-ID: <20130607174252.GI22710@jama>
References: <1370626502-5233-1-git-send-email-eu@felipetonello.com>
MIME-Version: 1.0
In-Reply-To: <1370626502-5233-1-git-send-email-eu@felipetonello.com>
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
X-List-Received-Date: Fri, 07 Jun 2013 17:42:32 -0000
X-Groupsio-MsgNum: 40326
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="q8dntDJTu318bll0"
Content-Disposition: inline

--q8dntDJTu318bll0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2013 at 10:35:02AM -0700, eu@felipetonello.com wrote:
> From: "Felipe F. Tonello" <eu@felipetonello.com>
>=20
> This is necessary since the valgrind package depends on /usr/bin/perl.
>=20
> This patch will fix this error while installing into rootfs:
> Computing transaction...error: Can't install valgrind-3.8.1-r8@armv7a_vfp=
_neon: no package provides /usr/bin/perl

This doesn't look as build-time dependency and before you add it to
RDEPENDS_${PN} use grep to find which file in valgrind package is using
/usr/bin/perl shebang

grep -R '#/usr/bin/perl' packages-split/valgrind

and if it's just some "extra" script not always needed for valgrind,
then move it to extra package and add perl only to
PN-this-extra-package.

Cheers,

>=20
> Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
> ---
>  meta/recipes-devtools/valgrind/valgrind_3.8.1.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb b/meta/reci=
pes-devtools/valgrind/valgrind_3.8.1.bb
> index 3520d49..ae2c5a2 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc46082167a314d=
785d012a244748d803 \
>                      file://COPYING.DOCS;md5=3D8fdeb5abdb235a08e76835f8f3=
260215"
> =20
>  X11DEPENDS =3D "virtual/libx11"
> -DEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}',=
 '', d)}"
> -PR =3D "r8"
> +DEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}',=
 '', d)} perl"
> +PR =3D "r9"
> =20
>  SRC_URI =3D "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>  	   file://fix_issue_caused_by_ccache.patch \
> --=20
> 1.8.1.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--q8dntDJTu318bll0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGyG5wACgkQN1Ujt2V2gBzzNwCfau6lUQkZ7JYliZ7fF1/v8Hvr
nskAn0YrpnUcU2I8cIGsG3bQ8aTSNAl/
=W+vk
-----END PGP SIGNATURE-----

--q8dntDJTu318bll0--
