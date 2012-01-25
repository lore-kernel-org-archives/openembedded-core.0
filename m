Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rq3So-0002Vj-J8
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 15:04:38 +0100
Received: by eekd41 with SMTP id d41so1693215eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 05:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WTXV066jtOxfDkZ0z9r06z01y3lVeoKBMa3u3sTHXks=;
	b=IgL0aOn9NkcWy6oHx7W6eI5dm0NeIIV2UV7Tv7lLc65rHTOFRNP3fzwPqKJ/ZAM4E2
	z97VHVo7CEn4aaoq0pBthGY1BajqAYiJ/o29ga0LNfutvUX+xkC0SRyx/D5jeCFYeAjV
	W3TeYFMfsVkvl24V8RXEE39LOposurx75mOVs=
Received: by 10.14.99.197 with SMTP id x45mr6029687eef.114.1327499811659;
	Wed, 25 Jan 2012 05:56:51 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y12sm1865039eeb.11.2012.01.25.05.56.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 05:56:50 -0800 (PST)
Date: Wed, 25 Jan 2012 14:56:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120125135648.GB3843@jama.jama.net>
References: <1327425023.19643.100.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1327425023.19643.100.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "Garman, Scott A" <scott.a.garman@intel.com>
Subject: Re: [PATCH] shadow: Split securetty into a separate recipe
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
X-List-Received-Date: Wed, 25 Jan 2012 14:04:38 -0000
X-Groupsio-MsgNum: 16539
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U+BazGySraz5kW0T"
Content-Disposition: inline

--U+BazGySraz5kW0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2012 at 05:10:23PM +0000, Richard Purdie wrote:
> The securetty file is machine specific whilst the rest of the shadow reci=
pe
> is not. Unfortunately making the recipce machine specific is both ineffic=
ient
> and also causes dependency problems since parts of the system such as the=
 useradd
> code depend upon it and this introduces a machine specific element to sst=
ate
> checksums which should not be machine specific.
>=20
> To resolve this, this patch separates out the file into a separate recipe
> meaning the machine specific components are isolated.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
> diff --git a/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb b/m=
eta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb
> new file mode 100644
> index 0000000..e391d24
> --- a/dev/null
> +++ b/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb
> @@ -0,0 +1,29 @@
> +SUMMARY =3D "Provider of the machine specific securetty file"
> +DESCRIPTION =3D "Provider of the machine specific securetty file"
> +SECTION =3D "base utils"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
> +
> +INHIBIT_DEFAULT_DEPS =3D "1"
> +
> +SRC_URI =3D "file://securetty"
> +
> +# Since we deduce our arch from ${SERIAL_CONSOLE}
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +do_install () {
> +	# Ensure we add a suitable securetty file to the package that has
> +	# most common embedded TTYs defined.
> +	if [ ! -z "${SERIAL_CONSOLE}" ]; then
> +		# Our SERIAL_CONSOLE contains a baud rate and sometimes a -L
> +		# option as well. The following pearl :) takes that and converts
> +		# it into newline-separated tty's and appends them into
> +		# securetty. So if a machine has a weird looking console device
> +		# node (e.g. ttyAMA0) that securetty does not know, it will get
> +		# appended to securetty and root logins will be allowed on that
> +		# console.
> +		echo "${SERIAL_CONSOLE}" | sed -e 's/[0-9][0-9]\|\-L//g'|tr "[ ]" "[\n=
]"  >> ${WORKDIR}/securetty
> +	fi
> +	install -d ${D}${sysconfdir}
> +	install -m 0400 ${WORKDIR}/securetty ${D}${sysconfdir}/securetty=20
> +}
> diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipe=
s-extended/shadow/shadow_4.1.4.3.bb
> index dddac2c..a69eb7c 100644
> --- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
> +++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
> @@ -8,13 +8,12 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D08c553a87d4e=
51bbed50b20e0adcaede \
>                      file://src/passwd.c;firstline=3D8;endline=3D30;md5=
=3D2899a045e90511d0e043b85a7db7e2fe"
> =20
>  DEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)=
}"
> -RDEPENDS_${PN} =3D "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_PL=
UGINS}', '', d)}"
> -PR =3D "r6"
> +RDEPENDS_${PN} =3D "shadow-securetty ${@base_contains('DISTRO_FEATURES',=
 'pam', '${PAM_PLUGINS}', '', d)}"
> +PR =3D "r7"
> =20
>  SRC_URI =3D "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.t=
ar.bz2 \
>             file://login_defs_pam.sed \
>             ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', =
'', d)} \
> -           file://securetty \
>             file://shadow.automake-1.11.patch \
>             file://shadow-4.1.3-dots-in-usernames.patch \
>             file://shadow-4.1.4.2-env-reset-keep-locale.patch \
> @@ -27,9 +26,6 @@ SRC_URI[sha256sum] =3D "633f5bb4ea0c88c55f3642c97f9d25c=
bef74f82e0b4cf8d54e7ad6f9f9
> =20
>  inherit autotools gettext
> =20
> -# Since we deduce our arch from ${SERIAL_CONSOLE}
> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> -
>  EXTRA_OECONF +=3D "--without-audit \
>                   --without-libcrack \
>                   ${@base_contains('DISTRO_FEATURES', 'pam', '--with-libp=
am', '--without-libpam', d)} \
> @@ -101,20 +97,6 @@ do_install_append() {
>  	# lead rpm failed dependencies.
>  	ln -sf vipw.${PN} ${D}${base_sbindir}/vigr.${PN}
>  	ln -sf newgrp.${PN} ${D}${bindir}/sg
> -
> -	# Ensure we add a suitable securetty file to the package that has
> -	# most common embedded TTYs defined.
> -	if [ ! -z "${SERIAL_CONSOLE}" ]; then
> -		# Our SERIAL_CONSOLE contains a baud rate and sometimes a -L
> -		# option as well. The following pearl :) takes that and converts
> -		# it into newline-separated tty's and appends them into
> -		# securetty. So if a machine has a weird looking console device
> -		# node (e.g. ttyAMA0) that securetty does not know, it will get
> -		# appended to securetty and root logins will be allowed on that
> -		# console.
> -		echo "${SERIAL_CONSOLE}" | sed -e 's/[0-9][0-9]\|\-L//g'|tr "[ ]" "[\n=
]"  >> ${WORKDIR}/securetty
> -	fi
> -	install -m 0400 ${WORKDIR}/securetty ${D}${sysconfdir}/securetty=20
>  }
> =20
>  pkg_postinst_${PN} () {
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--U+BazGySraz5kW0T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8gCiAACgkQN1Ujt2V2gBxzbwCeKgCpxgrBfDUwFnPxXcN6spSB
tFgAnA6kCLIG+nJgYOJGeimfmKDPZ3RP
=ErTs
-----END PGP SIGNATURE-----

--U+BazGySraz5kW0T--
