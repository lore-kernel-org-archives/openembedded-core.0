Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RhrKL-0004jK-6m
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 00:30:01 +0100
Received: by eeit10 with SMTP id t10so10305600eei.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jan 2012 15:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YjQ4Kck0i51mdotLU7/mPrZFTbJ03mczGpX+ugvr2nY=;
	b=DB1DIH0TLQXsJMnzwcWeTx0f8APcYXCfmXlmpijqK2zubfQj94xqcH/NJTh+Uj/Gz+
	Eos2DQy4+MCUzMFDyxZwfhsRhRq+QwnrtIxHxubIzyJSfGWieXvbtvPalusUHaF3nevC
	KvM8bLn3+RoBhT2hR8hjpdWOtCMpySnXpZ+vo=
Received: by 10.213.26.75 with SMTP id d11mr11110632ebc.148.1325546561599;
	Mon, 02 Jan 2012 15:22:41 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a60sm197812711eeb.4.2012.01.02.15.22.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 Jan 2012 15:22:40 -0800 (PST)
Date: Tue, 3 Jan 2012 00:22:28 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120102232228.GA3958@jama.jama.net>
References: <1325541916-22423-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1325541916-22423-1-git-send-email-msm@freescale.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] libxml2: add shared library version info to libxml shared libraries
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
X-List-Received-Date: Mon, 02 Jan 2012 23:30:01 -0000
X-Groupsio-MsgNum: 15030
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline

--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 02, 2012 at 04:05:16PM -0600, Matthew McClintock wrote:
> This fixes an issue with RPM where it checks version imformation for
> binaries linked against libxml and fails because it's missing info
>=20
> | error: Failed dependencies:
> |              libxml2.so.2(LIBXML2_2.6.0) is needed by fmc-0.9.7+2-r2.1.=
ppce500mc
> |              libxml2.so.2(LIBXML2_2.4.30) is needed by fmc-0.9.7+2-r2.1=
=2Eppce500mc
> | ERROR: Function 'do_rootfs' failed (see
>=20
> Note: fmc is just an example recipe/name

Weird that I haven't noticed this in oe-core before, but probably
because in oe-core it was always without version. But it looks the same
as this
http://git.openembedded.org/openembedded/commit/?id=3D50ed401cdaaefb1f5ac33=
de2838af259a52b1c3a
so
Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  .../libxml/libxml2/fix_version_info.patch          |   23 ++++++++++++++=
++++++
>  meta/recipes-core/libxml/libxml2_2.7.8.bb          |    4 ++-
>  2 files changed, 26 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-core/libxml/libxml2/fix_version_info.pat=
ch
>=20
> diff --git a/meta/recipes-core/libxml/libxml2/fix_version_info.patch b/me=
ta/recipes-core/libxml/libxml2/fix_version_info.patch
> new file mode 100644
> index 0000000..77113ef
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/fix_version_info.patch
> @@ -0,0 +1,23 @@
> +Upstream-Status: Already upstream
> +
> +From 00819877651b87842ed878898ba17dba489820f0 Mon Sep 17 00:00:00 2001
> +From: Daniel Veillard <veillard@redhat.com>
> +Date: Thu, 04 Nov 2010 20:53:14 +0000
> +Subject: Reactivate the shared library versionning script
> +
> +---
> +diff --git a/configure.in b/configure.in
> +index 59d0629..a1d2c89 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -84,7 +84,7 @@ else
> +   esac
> + fi
> + AC_SUBST(VERSION_SCRIPT_FLAGS)
> +-AM_CONDITIONAL([USE_VERSION_SCRIPT], [test -z "$VERSION_SCRIPT_FLAGS"])
> ++AM_CONDITIONAL([USE_VERSION_SCRIPT], [test -n "$VERSION_SCRIPT_FLAGS"])
> +=20
> + dnl
> + dnl We process the AC_ARG_WITH first so that later we can modify
> +--
> +cgit v0.9.0.2
> diff --git a/meta/recipes-core/libxml/libxml2_2.7.8.bb b/meta/recipes-cor=
e/libxml/libxml2_2.7.8.bb
> index 2fa246e..0b6ce02 100644
> --- a/meta/recipes-core/libxml/libxml2_2.7.8.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.7.8.bb
> @@ -1,6 +1,8 @@
>  require libxml2.inc
> =20
> -PR =3D "r4"
> +PR =3D "r5"
> +
> +SRC_URI +=3D "file://fix_version_info.patch"
> =20
>  SRC_URI[md5sum] =3D "8127a65e8c3b08856093099b52599c86"
>  SRC_URI[sha256sum] =3D "cda23bc9ebd26474ca8f3d67e7d1c4a1f1e7106364b690d8=
22e009fdc3c417ec"
> --=20
> 1.7.6.1
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8CPDQACgkQN1Ujt2V2gByO9ACfVvQrIjN57mt954SVCgLojgtJ
HlgAniInlx3/852kIgf/SRILAn0x80V4
=Q/zp
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
