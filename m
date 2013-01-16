Received: from mail-pa0-f53.google.com ([209.85.220.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TvUk1-0004uX-UJ
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 16:17:26 +0100
Received: by mail-pa0-f53.google.com with SMTP id hz1so827892pad.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2013 07:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=8LJRBqHxcoTclGv5Ztnw8+jDlVDcrdwSxuwsC7H75MY=;
	b=yM58E4vNEPVuVfc6qde2T33nMAclAb2Nfaqg7t2xf6bAMPpSEfFLp6pz3u0/eyRtyI
	wczphA3JWv9GYsM8Yftw7H7vNvqTHk0aFDi1XA8wid/akKsMKlwZh298JZj6/TWpcplp
	ASkBehA/jcx8WgVs8PNRC990zRBlmZVaRmy5ko7Ug3U/xCpdh2Rhb8/Iyc07pS2IwjL7
	emjW48VRNBnvmC077txRAKQACd0u1N+GjuLPMcwJz6RqqqWMlevFcF1jA4WvasGbobAy
	Y1pFYqJj+3pmM1vGH6qt4MnK/EBclR5BhWIQlKRn2S6XeaFFFbCLR+Br3Yj16L7D2xjm
	s28A==
X-Received: by 10.68.244.6 with SMTP id xc6mr3509828pbc.94.1358348523357;
	Wed, 16 Jan 2013 07:02:03 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id kp4sm12424602pbc.52.2013.01.16.07.02.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 16 Jan 2013 07:02:02 -0800 (PST)
Date: Wed, 16 Jan 2013 16:02:05 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
Message-ID: <20130116150205.GE3002@jama>
References: <1358345647-13274-1-git-send-email-giuseppe.condorelli@st.com>
MIME-Version: 1.0
In-Reply-To: <1358345647-13274-1-git-send-email-giuseppe.condorelli@st.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: fix as and ld check in libc dir
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
X-List-Received-Date: Wed, 16 Jan 2013 15:17:28 -0000
X-Groupsio-MsgNum: 33881
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cz6wLo+OExbGG7q/"
Content-Disposition: inline

--cz6wLo+OExbGG7q/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 16, 2013 at 03:14:07PM +0100, Giuseppe CONDORELLI wrote:
> Fix routine to check as and ld version check in the configure, to allow s=
ystem
> to correctly check for version 2.1x.

Does it build with gold now?
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/020310.ht=
ml

>=20
> Signed-off-by: Giuseppe Condorelli <giuseppe.condorelli@st.com>
> ---
>  .../eglibc-2.16_fix_as_ld_ver_check.patch          |   23 ++++++++++++++=
++++++
>  meta/recipes-core/eglibc/eglibc_2.16.bb            |    3 +-
>  2 files changed, 25 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/eglibc-2.16_fix_=
as_ld_ver_check.patch
>=20
> diff --git a/meta/recipes-core/eglibc/eglibc-2.16/eglibc-2.16_fix_as_ld_v=
er_check.patch b/meta/recipes-core/eglibc/eglibc-2.16/eglibc-2.16_fix_as_ld=
_ver_check.patch
> new file mode 100644
> index 0000000..a8a2344
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.16/eglibc-2.16_fix_as_ld_ver_chec=
k.patch
> @@ -0,0 +1,23 @@
> +Fix as and ld checking steps to allow system to correctly check 2.1x ver=
sions.
> +
> +Signed-off-by: Giuseppe Condorelli <giuseppe.condorelli@st.com>=20
> +--- libc.orig/configure	2013-01-16 12:07:18.146902148 +0100
> ++++ libc/configure	2013-01-16 12:08:10.598911559 +0100
> +@@ -4757,7 +4757,7 @@ $as_echo_n "checking version of $AS... "
> +   ac_prog_version=3D`$AS --version 2>&1 | sed -n 's/^.*GNU assembler.* =
\([0-9]*\.[0-9.]*\).*$/\1/p'`
> +   case $ac_prog_version in
> +     '') ac_prog_version=3D"v. ?.??, bad"; ac_verc_fail=3Dyes;;
> +-    2.1[0-9][0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][0-9]*)
> ++    2.1[0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][0-9]*)
> +        ac_prog_version=3D"$ac_prog_version, ok"; ac_verc_fail=3Dno;;
> +     *) ac_prog_version=3D"$ac_prog_version, bad"; ac_verc_fail=3Dyes;;
> +=20
> +@@ -4820,7 +4820,7 @@ $as_echo_n "checking version of $LD... "
> +   ac_prog_version=3D`$LD --version 2>&1 | sed -n 's/^.*GNU ld.* \([0-9]=
[0-9]*\.[0-9.]*\).*$/\1/p'`
> +   case $ac_prog_version in
> +     '') ac_prog_version=3D"v. ?.??, bad"; ac_verc_fail=3Dyes;;
> +-    2.1[0-9][0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][0-9]*)
> ++    2.1[0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][0-9]*)
> +        ac_prog_version=3D"$ac_prog_version, ok"; ac_verc_fail=3Dno;;
> +     *) ac_prog_version=3D"$ac_prog_version, bad"; ac_verc_fail=3Dyes;;
> +=20
> diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/=
eglibc/eglibc_2.16.bb
> index 2dcaceb..fbc1499 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.16.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
> @@ -33,6 +33,7 @@ SRC_URI =3D "http://downloads.yoctoproject.org/releases=
/eglibc/eglibc-${PV}-svnr21
>             file://tzselect-sh.patch \
>             file://tzselect-awk.patch \
>             file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-=
S.patch \
> +	   file://eglibc-2.16_fix_as_ld_ver_check.patch \

wrong indentation

>            "
> =20
>  SRC_URI[tarball.md5sum] =3D "88894fa6e10e58e85fbd8134b8e486a8"
> @@ -69,7 +70,7 @@ TARGET_CPPFLAGS =3D "-I${STAGING_DIR_TARGET}${includedi=
r}"
> =20
>  GLIBC_BROKEN_LOCALES =3D " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_ET=
 gez_ER bn_BD te_IN es_CR.ISO-8859-1"
> =20
> -FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}/eglibc-${PV}', '=
${FILE_DIRNAME}/eglibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
> +#FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}/eglibc-${PV}', =
'${FILE_DIRNAME}/eglibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"

this does not belong here

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cz6wLo+OExbGG7q/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD2wO0ACgkQN1Ujt2V2gByH3ACgubWVxzkgiIXPWsDU1inpEEi2
LB4An11Z684eIOGmpaAKEd/NyiqxYmRk
=Bj7a
-----END PGP SIGNATURE-----

--cz6wLo+OExbGG7q/--
