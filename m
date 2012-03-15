Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S856D-0004Qd-F7
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 08:27:49 +0100
Received: by wibhj13 with SMTP id hj13so3315835wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 00:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8Vywj15b2V2e48ATa7AAFHD+MkxFxtbXL7Q3OzyYH8Y=;
	b=aAJDuwzTHnB1FcbhDZbdczwCZzi1w79rszyPZJ0h6QZM9z0NzZllO5GMhnghWVTaOn
	mKcbM5REOS5Msq32xQcD2/HDwPKnYJN3gb3NPvL854a4o2HFOnRPdT//ZUwquvAY6MAF
	hl/D13R77R1+lvMDIEVUg0PmkdwQ9J0uFQcr6rsWme9cFtkc5rh4yhleG3CvesyMLceB
	41PCkP8Vi8yj77pSx83Zze4aUncIteNB552H/MJy+2zm2r2JNwTL74Yh/66zI9Jxu2g4
	OtI7GOJzGJ+l3VRIM+VzYtDyeAdZlFXxqtdtEhHs+X2G9SmJSXgNQHqlaFTCAqG5v5Ap
	9VyQ==
Received: by 10.180.93.4 with SMTP id cq4mr12613120wib.21.1331795943491;
	Thu, 15 Mar 2012 00:19:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm2873872wiy.7.2012.03.15.00.19.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Mar 2012 00:19:02 -0700 (PDT)
Date: Thu, 15 Mar 2012 08:19:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120315071901.GB4973@jama.jama.net>
References: <cover.1331776831.git.nitin.a.kamble@intel.com>
	<1b743bf3864539a8ce1902a269a5cec7d50dba1b.1331776832.git.nitin.a.kamble@intel.com>
MIME-Version: 1.0
In-Reply-To: <1b743bf3864539a8ce1902a269a5cec7d50dba1b.1331776832.git.nitin.a.kamble@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 5/8] python: fix install when libdir is not "lib"
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
X-List-Received-Date: Thu, 15 Mar 2012 07:27:49 -0000
X-Groupsio-MsgNum: 18872
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Content-Disposition: inline

--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 14, 2012 at 07:02:14PM -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>=20
> This commit fixes python's install issue of not finding the
> native pythong binray modules.
>=20
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  .../python/fix_for_using_different_libdir.patch    |   78 ++++++++++++++=
++++++
>  meta/recipes-devtools/python/python_2.7.2.bb       |    3 +-
>  2 files changed, 80 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-devtools/python/python/fix_for_using_dif=
ferent_libdir.patch
>=20
> diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-=
devtools/python/python_2.7.2.bb
> index d2100be..412b294 100644
> --- a/meta/recipes-devtools/python/python_2.7.2.bb
> +++ b/meta/recipes-devtools/python/python_2.7.2.bb
> @@ -20,7 +20,7 @@ SRC_URI +=3D "\
>    file://setup_py_skip_cross_import_check.patch \
>    file://add-md5module-support.patch \
>    file://host_include_contamination.patch \
> -  file://sys_platform_is_now_always_linux2.patch \
> +  file://fix_for_using_different_libdir.patch \

^ really?

>  "
> =20
>  S =3D "${WORKDIR}/Python-${PV}"
> @@ -99,6 +99,7 @@ do_install() {
>  =09
>  	oe_runmake HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/pgen \
>  		HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python \
> +		CROSSPYTHONPATH=3D${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-=
dynload/ \
>  		STAGING_LIBDIR=3D${STAGING_LIBDIR} \
>  		STAGING_INCDIR=3D${STAGING_INCDIR} \
>  		BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9hl+UACgkQN1Ujt2V2gByNmgCeLXBrHdw1P+sKOK8gTMtd8c5B
SusAnRrECHS9vP+ZqoPvyJspdkGdWRK/
=JwmV
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--
