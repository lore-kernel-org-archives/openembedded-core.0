Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 40033701D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 11:19:48 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id f8so5773667wiw.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 04:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0ywlsA976JgBRe5tRuaYL0jXVft262+i7EGz/2QCHYA=;
	b=kQ9LY53cI6QR/EXIReXqJMQ9XowbWytFrvzzx4F0I68xy3B0E1jIgetWoMGAURITK7
	E/1CoZ74AuPAjshjE2Qu9oVniIcb7mxCut2Z2WhUWuoY6Iu7ZhBEp3IBVVr5v4Ma0WmE
	XUTNjMvwrFdGz2zZJyX8F9p23T52t+xlrzmOnyp+fbXHuriofbptFuMxWex6suxQNLpz
	//L7VVqgk4wDM8BJvOqVfy43jmd9breW0xUJWEbuCq/uB0Wep4oiAtanPZ6MKv6UyWt+
	i2WwruddxWE82gSwFDMIoTA+7mF+b/KZIsGJ51yhzTQZ+BYxjaVQ6khWrWmpFfHEQ849
	ycZg==
X-Received: by 10.180.205.141 with SMTP id lg13mr13968561wic.21.1406027989715; 
	Tue, 22 Jul 2014 04:19:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pl1sm1621289wic.17.2014.07.22.04.19.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 04:19:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 22 Jul 2014 13:20:04 +0200
To: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Message-ID: <20140722112004.GR22875@jama>
References: <1403176695-18917-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1403176695-18917-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [DO-NOT-MERGE][RFC][PATCH] DO-NOT-MERGE: distutils3.bbclass: Don't use MACHINE variable
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
X-List-Received-Date: Tue, 22 Jul 2014 11:19:49 -0000
X-Groupsio-MsgNum: 55356
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6qFdnjy6dKaiDX/E"
Content-Disposition: inline

--6qFdnjy6dKaiDX/E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2014 at 01:18:15PM +0200, Martin Jansa wrote:
> The original patch says this about MACHINE variables:
>=20
>     Use MACHINE for sysroot when not building for build host
>=20
>     Python's machinery replaces directories in sysroot path to match OE's
>     staging area sysroots. Earlier we use to have HOST_SYS represent sysr=
oot
>     always but now we use MACHINE to represent target sysroots but HOST_S=
YS
>     to represent host sysroot. This patch caters to that difference
>=20
> But I think we need to find some different solution, because right now th=
e only
> user of distutils3 bbclass python3-distribute becames effectivelly MACHIN=
E_ARCH
> because of this. Detected with sstate-diff-machines.sh script:
>=20
>  =3D=3D Comparing signatures for python3-distribute.do_populate_sysroot.s=
igdata between qemux86 and qemux86copy =3D=3D
>   Hash for dependent task python3-distribute_0.6.32.bb.do_install changed=
 from ef2f64ea6aecf1f9c2c6a0f201c52f67 to 7afd17fd366b28cf4a0353c7dd5e1c5b
>=20
>   $ bitbake-diffsigs sstate-diff/1403174194/qemux86*/i586*/python3-distri=
bute*/*do_install*
>     basehash changed from 5311d29c25ff324645de9c17cdefe083 to 2f079b81b13=
427faddeb040e7a115965
>     Variable MACHINE value changed from 'qemux86copy' to 'qemux86'
>     Hash for dependent task python3-distribute_0.6.32.bb.do_compile chang=
ed from 4fcb29eb2a0df7bef2f9806a0d9cdd92 to e7df3cdd7b82733d69c87f1822b7177b
>=20
>   $ bitbake-diffsigs sstate-diff/1403174194/qemux86*/i586*/python3-distri=
bute*/*do_compile*
>     basehash changed from 870a9e01c2c4eb73dd57451eeb2a7f0c to c061ae11d7f=
16d74d49f667243a21be0
>     Variable MACHINE value changed from 'qemux86copy' to 'qemux86'

No comment?

+Khem who added this

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/distutils3.bbclass | 28 ++++------------------------
>  1 file changed, 4 insertions(+), 24 deletions(-)
>=20
> diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bb=
class
> index bbd645c..8cf29d5 100644
> --- a/meta/classes/distutils3.bbclass
> +++ b/meta/classes/distutils3.bbclass
> @@ -9,14 +9,9 @@ DISTUTILS_INSTALL_ARGS ?=3D "--prefix=3D${D}/${prefix} \
>      --install-data=3D${D}/${datadir}"
> =20
>  distutils3_do_compile() {
> -        if [ ${BUILD_SYS} !=3D ${HOST_SYS} ]; then
> -                SYS=3D${MACHINE}
> -        else
> -                SYS=3D${HOST_SYS}
> -        fi
>          STAGING_INCDIR=3D${STAGING_INCDIR} \
>          STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> -        BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${SYS} \
> +        BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
>          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.=
py \
>          build ${DISTUTILS_BUILD_ARGS} || \
>          bbfatal "${PYTHON_PN} setup.py build_ext execution failed."
> @@ -24,42 +19,27 @@ distutils3_do_compile() {
> =20
>  distutils3_stage_headers() {
>          install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
> -        if [ ${BUILD_SYS} !=3D ${HOST_SYS} ]; then
> -                SYS=3D${MACHINE}
> -        else
> -                SYS=3D${HOST_SYS}
> -        fi
> -        BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${SYS} \
> +        BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
>          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.=
py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
>          bbfatal "${PYTHON_PN} setup.py install_headers execution failed."
>  }
> =20
>  distutils3_stage_all() {
> -        if [ ${BUILD_SYS} !=3D ${HOST_SYS} ]; then
> -                SYS=3D${MACHINE}
> -        else
> -                SYS=3D${HOST_SYS}
> -        fi
>          STAGING_INCDIR=3D${STAGING_INCDIR} \
>          STAGING_LIBDIR=3D${STAGING_LIBDIR} \
>          install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
>          PYTHONPATH=3D${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
> -        BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${SYS} \
> +        BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
>          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.=
py install ${DISTUTILS_STAGE_ALL_ARGS} || \
>          bbfatal "${PYTHON_PN} setup.py install (stage) execution failed."
>  }
> =20
>  distutils3_do_install() {
>          install -d ${D}${PYTHON_SITEPACKAGES_DIR}
> -        if [ ${BUILD_SYS} !=3D ${HOST_SYS} ]; then
> -                SYS=3D${MACHINE}
> -        else
> -                SYS=3D${HOST_SYS}
> -        fi
>          STAGING_INCDIR=3D${STAGING_INCDIR} \
>          STAGING_LIBDIR=3D${STAGING_LIBDIR} \
>          PYTHONPATH=3D${D}${PYTHON_SITEPACKAGES_DIR} \
> -        BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${SYS} \
> +        BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
>          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.=
py install --install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INST=
ALL_ARGS} || \
>          bbfatal "${PYTHON_PN} setup.py install execution failed."
> =20
> --=20
> 2.0.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6qFdnjy6dKaiDX/E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPOSOQACgkQN1Ujt2V2gBx2oQCeKx4h0lvEYRqQyDLqITus+7ro
lWYAn2gJKrJBmtomF4X6B/xxq4Ic5wIn
=/cJV
-----END PGP SIGNATURE-----

--6qFdnjy6dKaiDX/E--
