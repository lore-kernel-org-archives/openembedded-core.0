Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjDX2-0000h7-Pr
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 19:29:18 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so1570149pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2012 10:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qAFOT1iYl9liLfrFdT2yl54QZv5vXWfKrqXkfZ0zdVg=;
	b=0bSM64WC2qek/gfR+HheTPolVukz48eCyRrCDYj3agbqk7flGqOQYtqJRuu7YE9T0i
	mzLzy35gR5m2VGZ5VPJKYzLX+QGmsybKGfSSXGB0eye26N3jRjxWEzmANHvCpYprXDWD
	IVt2lO4hClLZ5NGp8QwVbnPGsu7iyKWqNhKa14gIpjObKQCjluxZJd1U5xzZnV6ryiIO
	/Li95z145uc7aJtLlJVSbHAKrR8yGBeGMEgZsdNBU63n+LJ5Baq+8thZV5FByxgiSwyE
	pyH/FJ21sCUAClguqXGcC2qxAmO8TfPjhwiUuygcQqH59KV4kJ65tHgh6BFprRUoG8a/
	GDOg==
Received: by 10.68.230.135 with SMTP id sy7mr7894194pbc.76.1355422480930;
	Thu, 13 Dec 2012 10:14:40 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id f2sm1632877paz.25.2012.12.13.10.14.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 10:14:39 -0800 (PST)
Date: Thu, 13 Dec 2012 19:14:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20121213181453.GF3356@jama.jama.net>
References: <50C91323.10204@linux.intel.com>
	<1355356120-20313-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1355356120-20313-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 2/2] gettext: move remove-potcdate.sin from gettext-native to gettext-minimal-native
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
X-List-Received-Date: Thu, 13 Dec 2012 18:29:18 -0000
X-Groupsio-MsgNum: 32640
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WlEyl6ow+jlIgNUh"
Content-Disposition: inline

--WlEyl6ow+jlIgNUh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 13, 2012 at 12:48:40AM +0100, Martin Jansa wrote:
> * now autotools.bbclass are copying not only Makefile.in.in but also=20
>   remove-potcdate.sin which is used by Makefile.in.in, so we need to
>   provide this file already in gettext-minimal-native otherwise build=20
>   can fail, when autotools.bbclass is used before gettext-native (full)=
=20
>   is built.
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>=20
>  v2: only commit message

Please be aware that this needs one manual step.

clean gettext-native before upgrading gettext-minimal-native
or
clean gettext-minimal-native after gettext-native was rebuilt

Without this manual step it will cause missing remove-potcdate.sin in
native sysroot, because

1) gettext-minimal-native_0.18.1.1.bb installs it with warning:
   WARNING: The recipe gettext-minimal-native is trying to install files
   into a shared area when those files already exist. Those files and their
   manifest location are:
      /OE/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/share/gettext/po/rem=
ove-potcdate.sin
      Matched in manifest-x86_64-gettext-native
   Please verify which package should provide the above files.

2) building gettext-native will clean its own sstate data from sysroot
   including remove-potcdate.sin because it was part of gettext-native
   before, then installs without error, but also without remove-potcdate.sin

It's the same problem as with config.rpath before:
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-October/031120.=
html

Cheers,

>=20
>  .../gettext-minimal-0.18.1.1/remove-potcdate.sin      | 19 +++++++++++++=
++++++
>  .../gettext/gettext-minimal-native_0.18.1.1.bb        |  4 +++-
>  meta/recipes-core/gettext/gettext_0.18.1.1.bb         |  3 ++-
>  3 files changed, 24 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.18.1.1/re=
move-potcdate.sin
>=20
> diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/remove-po=
tcdate.sin b/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/remove-potc=
date.sin
> new file mode 100644
> index 0000000..2436c49
> --- /dev/null
> +++ b/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/remove-potcdate.=
sin
> @@ -0,0 +1,19 @@
> +# Sed script that remove the POT-Creation-Date line in the header entry
> +# from a POT file.
> +#
> +# The distinction between the first and the following occurrences of the
> +# pattern is achieved by looking at the hold space.
> +/^"POT-Creation-Date: .*"$/{
> +x
> +# Test if the hold space is empty.
> +s/P/P/
> +ta
> +# Yes it was empty. First occurrence. Remove the line.
> +g
> +d
> +bb
> +:a
> +# The hold space was nonempty. Following occurrences. Do nothing.
> +x
> +:b
> +}
> diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb=
 b/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb
> index a46a40d..f008a79 100644
> --- a/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb
> +++ b/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb
> @@ -1,6 +1,7 @@
>  SRC_URI =3D "file://aclocal.tgz \
>             file://config.rpath \
>             file://Makefile.in.in \
> +           file://remove-potcdate.sin \
>             file://COPYING"
> =20
>  INHIBIT_DEFAULT_DEPS =3D "1"
> @@ -11,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0854da868a92=
9923087141d9d7aba7d5"
> =20
>  inherit native
> =20
> -PR =3D "r4"
> +PR =3D "r5"
> =20
>  S =3D "${WORKDIR}"
> =20
> @@ -21,4 +22,5 @@ do_install () {
>  	install -d ${D}${datadir}/gettext/po/
>  	cp ${WORKDIR}/config.rpath ${D}${datadir}/gettext/
>  	cp ${WORKDIR}/Makefile.in.in ${D}${datadir}/gettext/po/
> +	cp ${WORKDIR}/remove-potcdate.sin ${D}${datadir}/gettext/po/
>  }
> diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes=
-core/gettext/gettext_0.18.1.1.bb
> index c3265e1..4639481 100644
> --- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> @@ -5,7 +5,7 @@ SECTION =3D "libs"
>  LICENSE =3D "GPLv3+ & LGPL-2.1+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> =20
> -PR =3D "r18"
> +PR =3D "r19"
>  DEPENDS =3D "gettext-native virtual/libiconv ncurses expat"
>  DEPENDS_class-native =3D "gettext-minimal-native"
>  PROVIDES =3D "virtual/libintl virtual/gettext"
> @@ -104,6 +104,7 @@ do_install_append_class-native () {
>  	rm ${D}${datadir}/aclocal/*
>  	rm ${D}${datadir}/gettext/config.rpath
>  	rm ${D}${datadir}/gettext/po/Makefile.in.in
> +	rm ${D}${datadir}/gettext/po/remove-potcdate.sin
>  }
> =20
>  BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 1.8.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WlEyl6ow+jlIgNUh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDKGx0ACgkQN1Ujt2V2gBzHzACgiaPZlcWydfzj8NZk2xT/mHPs
tjEAnieuCKi721yCz2ssFc21sHz/M+pX
=Ymvu
-----END PGP SIGNATURE-----

--WlEyl6ow+jlIgNUh--
