Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id B47DD60167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 19:03:11 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hi2so2739708wib.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 12:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=G2gjGP6kLgBvYgoe33KLMpsNOk75OrzZw0PI8ii8Ob0=;
	b=WOSidc9z/Wi4nItP4SkijRpUF+EuDPdwoCVaLMjZ8z9XnzrdYxXmYzMSvg2jlOqgPK
	+aSB9Y026WVsIHhT0XXmMoXJe94fUxCpWgNHwwm0kyru77ITQKEmEilPxCXVnlotVYj4
	I1g9zrzqoclvGiqGPcr9U2217Xorc8inFR7pyeZo1ZT3TPCAc7S8Gn8xPq/DGh106h1F
	J8Khh1tEU0VmNhzpDSPCBI8+GBJ2sPqNU1lgVdI68RlTgzshCbgo3fl4o24g11SdnyJf
	jSJ5456qD7wB5YLBTKFygIGxz0SajdCrjeb61VjKkvgWWEcE6VOqcvGSliHhYOg5ls9V
	3vOg==
X-Received: by 10.180.186.3 with SMTP id fg3mr27347144wic.78.1406142190670;
	Wed, 23 Jul 2014 12:03:10 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ex4sm12734645wic.2.2014.07.23.12.03.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jul 2014 12:03:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Jul 2014 21:03:26 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20140723190326.GA2492@jama>
References: <1403176695-18917-1-git-send-email-Martin.Jansa@gmail.com>
	<CAMKF1spKr_JzstojPa_ALCJKwBF=cDVh2bZmkucUO6hfB0ipsA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spKr_JzstojPa_ALCJKwBF=cDVh2bZmkucUO6hfB0ipsA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 23 Jul 2014 19:03:17 -0000
X-Groupsio-MsgNum: 55438
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline

--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2014 at 11:04:18AM -0700, Khem Raj wrote:
> On Thu, Jun 19, 2014 at 4:18 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > The original patch says this about MACHINE variables:
> >
> >     Use MACHINE for sysroot when not building for build host
> >
> >     Python's machinery replaces directories in sysroot path to match OE=
's
> >     staging area sysroots. Earlier we use to have HOST_SYS represent sy=
sroot
> >     always but now we use MACHINE to represent target sysroots but HOST=
_SYS
> >     to represent host sysroot. This patch caters to that difference
> >
> > But I think we need to find some different solution, because right now =
the only
> > user of distutils3 bbclass python3-distribute becames effectivelly MACH=
INE_ARCH
> > because of this. Detected with sstate-diff-machines.sh script:
> >
> >  =3D=3D Comparing signatures for python3-distribute.do_populate_sysroot=
=2Esigdata between qemux86 and qemux86copy =3D=3D
> >   Hash for dependent task python3-distribute_0.6.32.bb.do_install chang=
ed from ef2f64ea6aecf1f9c2c6a0f201c52f67 to 7afd17fd366b28cf4a0353c7dd5e1c5b
> >
> >   $ bitbake-diffsigs sstate-diff/1403174194/qemux86*/i586*/python3-dist=
ribute*/*do_install*
> >     basehash changed from 5311d29c25ff324645de9c17cdefe083 to 2f079b81b=
13427faddeb040e7a115965
> >     Variable MACHINE value changed from 'qemux86copy' to 'qemux86'
> >     Hash for dependent task python3-distribute_0.6.32.bb.do_compile cha=
nged from 4fcb29eb2a0df7bef2f9806a0d9cdd92 to e7df3cdd7b82733d69c87f1822b71=
77b
> >
> >   $ bitbake-diffsigs sstate-diff/1403174194/qemux86*/i586*/python3-dist=
ribute*/*do_compile*
> >     basehash changed from 870a9e01c2c4eb73dd57451eeb2a7f0c to c061ae11d=
7f16d74d49f667243a21be0
> >     Variable MACHINE value changed from 'qemux86copy' to 'qemux86'
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
>=20
> BUILD_SYS is needed in python machinery to construct proper sys root
> especially with python3 versions the cross build infra in python is
> different. I think this patch would fail to build python3, either we
> have to patch it in such a way that whatever sys root OE constructs is
> passed directly and used and thereby remove depending on referring to
> MACHINE but that would need a bigger patch for python which I was not
> willing to carry. if there is another check that can deduce difference
> of being compiled native or for target then we can use that check
> instead of comparing BUILD_SYS to MACHINE

FWIW: I've this patch in my world builds and I haven't seen any issue
caused by it (python3 builds fine there).

> > ---
> >  meta/classes/distutils3.bbclass | 28 ++++------------------------
> >  1 file changed, 4 insertions(+), 24 deletions(-)
> >
> > diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.=
bbclass
> > index bbd645c..8cf29d5 100644
> > --- a/meta/classes/distutils3.bbclass
> > +++ b/meta/classes/distutils3.bbclass
> > @@ -9,14 +9,9 @@ DISTUTILS_INSTALL_ARGS ?=3D "--prefix=3D${D}/${prefix}=
 \
> >      --install-data=3D${D}/${datadir}"
> >
> >  distutils3_do_compile() {
> > -        if [ ${BUILD_SYS} !=3D ${HOST_SYS} ]; then
> > -                SYS=3D${MACHINE}
> > -        else
> > -                SYS=3D${HOST_SYS}
> > -        fi
> >          STAGING_INCDIR=3D${STAGING_INCDIR} \
> >          STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> > -        BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${SYS} \
> > +        BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
> >          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setu=
p.py \
> >          build ${DISTUTILS_BUILD_ARGS} || \
> >          bbfatal "${PYTHON_PN} setup.py build_ext execution failed."
> > @@ -24,42 +19,27 @@ distutils3_do_compile() {
> >
> >  distutils3_stage_headers() {
> >          install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
> > -        if [ ${BUILD_SYS} !=3D ${HOST_SYS} ]; then
> > -                SYS=3D${MACHINE}
> > -        else
> > -                SYS=3D${HOST_SYS}
> > -        fi
> > -        BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${SYS} \
> > +        BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
> >          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setu=
p.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
> >          bbfatal "${PYTHON_PN} setup.py install_headers execution faile=
d."
> >  }
> >
> >  distutils3_stage_all() {
> > -        if [ ${BUILD_SYS} !=3D ${HOST_SYS} ]; then
> > -                SYS=3D${MACHINE}
> > -        else
> > -                SYS=3D${HOST_SYS}
> > -        fi
> >          STAGING_INCDIR=3D${STAGING_INCDIR} \
> >          STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> >          install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
> >          PYTHONPATH=3D${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
> > -        BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${SYS} \
> > +        BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
> >          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setu=
p.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
> >          bbfatal "${PYTHON_PN} setup.py install (stage) execution faile=
d."
> >  }
> >
> >  distutils3_do_install() {
> >          install -d ${D}${PYTHON_SITEPACKAGES_DIR}
> > -        if [ ${BUILD_SYS} !=3D ${HOST_SYS} ]; then
> > -                SYS=3D${MACHINE}
> > -        else
> > -                SYS=3D${HOST_SYS}
> > -        fi
> >          STAGING_INCDIR=3D${STAGING_INCDIR} \
> >          STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> >          PYTHONPATH=3D${D}${PYTHON_SITEPACKAGES_DIR} \
> > -        BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${SYS} \
> > +        BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
> >          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setu=
p.py install --install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_IN=
STALL_ARGS} || \
> >          bbfatal "${PYTHON_PN} setup.py install execution failed."
> >
> > --
> > 2.0.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPQBv4ACgkQN1Ujt2V2gBx7BwCgrdSdNVaRWWqA4qPj0BuAbf2G
80gAnRba8HNt8xxE7PK7LoB0OlDDDTFy
=hobq
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
