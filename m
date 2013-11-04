Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6D5BC6D290
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 09:08:22 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id t10so927986eei.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2013 01:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0Lbd5op8MdKpM3iwkKaJF9sj024pqdGw7O5l/6ugPdY=;
	b=iiXrpTIvHaivIlTF1aUodUC2o3faQR4JF+PwgQyNunPGVzXKnsQuhM6o0vlSFd2kqe
	Fmo5T8VbVyigrskLFISaEKMG641zVHw0FOytxIjXO7gRnRUPOs2DTqgHQs0YID3ubGqC
	sygMhphSbyYXXDZgBDud5O9WEWEIjHditg8zajNW694S3v6YX8PBc2+2Aleb4PEI/lO+
	BuxsonxSK/Y+USKRdauq03xIeTSRaNebzK4dbp3O2S0hqDpUwOwcXzdDmX4p+wJBzr4U
	KSTSqXeSKjCfPOfUdx7Kre241QHE0vwnD3rd2gN5k8AVWFi/b+DlMIhZnzUnbjWaR6Go
	7sRg==
X-Received: by 10.14.246.11 with SMTP id p11mr17414386eer.9.1383556103746;
	Mon, 04 Nov 2013 01:08:23 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id s3sm43966197eeo.3.2013.11.04.01.08.22
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Nov 2013 01:08:22 -0800 (PST)
Date: Mon, 4 Nov 2013 10:08:31 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Jonathan Liu <net147@gmail.com>
Message-ID: <20131104090831.GC3684@jama>
References: <1383546675-23002-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1383546675-23002-1-git-send-email-net147@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc_2.18.bb: accept make versions 4.0 and greater
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
X-List-Received-Date: Mon, 04 Nov 2013 09:08:23 -0000
X-Groupsio-MsgNum: 46576
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z4+8/lEcDcG5Ke9S"
Content-Disposition: inline

--z4+8/lEcDcG5Ke9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2013 at 05:31:15PM +1100, Jonathan Liu wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>

Hi,

FYI: there is bug report for this:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5391

> ---
>  meta/recipes-core/eglibc/eglibc-2.18/make-4.patch | 31 +++++++++++++++++=
++++++
>  meta/recipes-core/eglibc/eglibc_2.18.bb           |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.18/make-4.patch
>=20
> diff --git a/meta/recipes-core/eglibc/eglibc-2.18/make-4.patch b/meta/rec=
ipes-core/eglibc/eglibc-2.18/make-4.patch
> new file mode 100644
> index 0000000..ec105b4
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.18/make-4.patch
> @@ -0,0 +1,31 @@
> +Accept make versions 4.0 and greater
> +
> +Backport of glibc 28d708c44bc47b56f6551ff285f78edcf61c208a.
> +
> +Upstream-Status: Backport
> +Signed-off-by: Jonathan Liu <net147@gmail.com>
> +
> +diff -Nur libc.orig/configure libc/configure
> +--- libc.orig/configure     2013-08-21 02:23:48.000000000 +1000
> ++++ libc/configure  2013-11-04 17:04:17.778333748 +1100
> +@@ -4772,7 +4772,7 @@
> +   ac_prog_version=3D`$MAKE --version 2>&1 | sed -n 's/^.*GNU Make[^0-9]=
*\([0-9][0-9.]*\).*$/\1/p'`
> +   case $ac_prog_version in
> +     '') ac_prog_version=3D"v. ?.??, bad"; ac_verc_fail=3Dyes;;
> +-    3.79* | 3.[89]*)
> ++    3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*)
> +        ac_prog_version=3D"$ac_prog_version, ok"; ac_verc_fail=3Dno;;
> +     *) ac_prog_version=3D"$ac_prog_version, bad"; ac_verc_fail=3Dyes;;
> +=20
> +diff -Nur libc.orig/configure.in libc/configure.in
> +--- libc.orig/configure.in	2013-08-21 02:23:48.000000000 +1000
> ++++ libc/configure.in	2013-11-04 16:54:17.955014870 +1100
> +@@ -989,7 +989,7 @@
> +   critic_missing=3D"$critic_missing gcc")
> + AC_CHECK_PROG_VER(MAKE, gnumake gmake make, --version,
> +   [GNU Make[^0-9]*\([0-9][0-9.]*\)],
> +-  [3.79* | 3.[89]*], critic_missing=3D"$critic_missing make")
> ++  [3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*], critic_missing=3D"$critic_=
missing make")
> +=20
> + AC_CHECK_PROG_VER(MSGFMT, gnumsgfmt gmsgfmt msgfmt, --version,
> +   [GNU gettext.* \([0-9]*\.[0-9.]*\)],
> diff --git a/meta/recipes-core/eglibc/eglibc_2.18.bb b/meta/recipes-core/=
eglibc/eglibc_2.18.bb
> index 710b498..15e5eed 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.18.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.18.bb
> @@ -27,6 +27,7 @@ SRC_URI =3D "http://downloads.yoctoproject.org/releases=
/eglibc/eglibc-${PV}-svnr23
>             file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-=
S.patch \
>             file://fix-tibetian-locales.patch \
>             file://0001-ARM-Pass-dl_hwcap-to-IFUNC-resolver.patch \
> +           file://make-4.patch \
>            "
>  SRC_URI[md5sum] =3D "b395b021422a027d89884992e91734fc"
>  SRC_URI[sha256sum] =3D "15f564b45dc5dd65faf0875579e3447961ae61e876933384=
ae05d19328539ad4"
> --=20
> 1.8.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--z4+8/lEcDcG5Ke9S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJ3ZA8ACgkQN1Ujt2V2gBwB/wCgiijt3r/3/HUmW5Omx1PkpTbx
Z6YAn1H+G0BbyHIfSsi/HGaQ/fybqX4m
=z6Hq
-----END PGP SIGNATURE-----

--z4+8/lEcDcG5Ke9S--
