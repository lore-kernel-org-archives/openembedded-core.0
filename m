Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1Tatg6-0001pq-B3; Tue, 20 Nov 2012 20:40:14 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so3529576eei.6
	for <multiple recipients>; Tue, 20 Nov 2012 11:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FhoEm3EBR2DdWc4cjRuzm9LXSWgkzY+6r9NdsjayL0o=;
	b=ONGfo5QL1DH/WW43ZZNxGg8kUNrhQrI5a7TZga0LBLBxRxtDs38gXdL90uNmUdQYol
	jDP0igO8khy4AbM3kmo3dT+Oi6R/EPMEFCXfww6EUy769NMOYTGt26vLD9JqK6tMfYhV
	N5MoVk9F3u3tEoUuCXDMuZxeAsbIoYim76COvwK68cOT6ur6vZi5vI8nEtXcjP4DJ6wL
	QndEQznM1D1kLAG0XiKFJsXTRv1lIfkov4GSmwG2+lORkDmGLuohuxy4kV5BnwlKq0Pl
	ke09WFBrT28hSC9DNW5q/738L6V1QF6Dzq2Efb4nzo58YB/ybJJHgivLRXQkH4GbxheB
	O1+g==
Received: by 10.14.178.195 with SMTP id f43mr36998415eem.44.1353439570443;
	Tue, 20 Nov 2012 11:26:10 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 46sm22608016eeg.4.2012.11.20.11.26.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Nov 2012 11:26:09 -0800 (PST)
Date: Tue, 20 Nov 2012 20:26:05 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Message-ID: <20121120192605.GB12637@jama.jama.net>
References: <20121120152957.729DC1034D@opal>
MIME-Version: 1.0
In-Reply-To: <20121120152957.729DC1034D@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : bitbake.conf/sanity: Separate versions and PN stamp components into separate directories for WORKDIR and STAMP
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
X-List-Received-Date: Tue, 20 Nov 2012 19:40:14 -0000
X-Groupsio-MsgNum: 31577
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Content-Disposition: inline

--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 20, 2012 at 03:29:56PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 05075cf3138d1c61f5cf4fe0e1a4587acc00c692
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D05075cf3138d1c61f5cf4fe0e1a4587acc00c692
>=20
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Fri Nov 16 15:35:53 2012 +0000
>=20
> bitbake.conf/sanity: Separate versions and PN stamp components into separ=
ate directories for WORKDIR and STAMP
>=20
> This means some of the hacks we have to tell where the package name ends =
and
> the version starts in the directory layout becomes obsolete, simplifying =
the
> work of some of the cleanup scripts. It also makes the layout slightly mo=
re
> intuitive to the user.
>=20
> It does force a rebuild onto the user but it will reuse sstate successful=
ly.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/classes/sanity.bbclass |    2 ++
>  meta/conf/abi_version.conf  |    2 +-
>  meta/conf/bitbake.conf      |    6 +++---
>  3 files changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 3806bc5..5b4f070 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -605,6 +605,8 @@ def check_sanity(sanity_data):
>              f.write(current_abi)
>          elif abi =3D=3D "7" and current_abi =3D=3D "8":
>              messages =3D messages + "Your configuration is using stamp f=
iles including the sstate hash but your build directory was built with stam=
p files that do not include this.\nTo continue, either rebuild or switch ba=
ck to the OEBasic signature handler with BB_SIGNATURE_HANDLER =3D 'OEBasic'=
=2E\n"
> +        elif (abi !=3D current_abi and current_abi =3D=3D "9"):
> +            messages =3D messages + "The layout of the TMPDIR STAMPS dir=
ectory has changed. Please clean out TMPDIR and rebuild (sstate will be sti=
ll be valid and reused)\n"

The part about valid and reused sstate doesn't seem to be true, if I compar=
e=20
sstate checksums with and without this patch (current master and master wit=
h=20
this patch reverted), they are different:

$ bitbake-diffsigs stamps.1353438701/om-gta02/armv4t-oe-linux-gnueabi/linux=
-libc-headers/3.4.3-r0.do_package.sigdata.9bf64da2bd20a51a9f34d0e909ea94de =
stamps.1353439128/om-gta02/armv4t-oe-linux-gnueabi/linux-libc-headers-3.4.3=
-r0.do_package.sigdata.e2d8b3b59ff70b134b71f02b92f9d952
basehash changed from fd8635729e529ea26a963c47c1af647d to 0fd2c572da433536e=
317e1c7c12c4f60
List of dependencies for variable WORKDIR changed from set(['PR', 'PV', 'MU=
LTIMACH_TARGET_SYS', 'PN', 'EXTENDPE', 'TMPDIR']) to set(['PF', 'TMPDIR', '=
MULTIMACH_TARGET_SYS'])
changed items: set(['PR', 'PV', 'PF', 'PN', 'EXTENDPE'])
Variable WORKDIR value changed from ${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/=
${PN}/${EXTENDPE}${PV}-${PR} to ${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PF}
Hash for dependent task linux-libc-headers_3.4.3.bb.do_install changed from=
 ac25fb45e330ee0f9848210a1ad71924 to fe785052d57bae397d0ab38fa69af65d

$ bitbake-diffsigs stamps.1353438701/om-gta02/armv4t-oe-linux-gnueabi/linux=
-libc-headers/3.4.3-r0.do_patch.sigdata.ab675d07d2d05b3621d3d68752deb1d5 st=
amps.1353439128/om-gta02/armv4t-oe-linux-gnueabi/linux-libc-headers-3.4.3-r=
0.do_patch.sigdata.1da915f84f81b15ca5f4f76176add79e
Task dependencies changed from:
['ABIEXTENSION', 'ARMPKGARCH', 'ARMPKGSFX_DSP', 'ARMPKGSFX_EABI', 'ARMPKGSF=
X_ENDIAN', 'ARMPKGSFX_FPU', 'ARMPKGSFX_THUMB', 'EXTENDPE', 'LIBCEXTENSION',=
 'MULTIMACH_TARGET_SYS', 'PACKAGE_ARCH', 'PATCHTOOL', 'PE', 'PN', 'PR', 'PV=
', 'S', 'SRCREV', 'TARGET_OS', 'TARGET_VENDOR', 'TUNE_PKGARCH', 'WORKDIR', =
'base_do_patch', 'patch_do_patch', 'patch_path', 'should_apply', 'src_patch=
es']
to:
['ABIEXTENSION', 'ARMPKGARCH', 'ARMPKGSFX_DSP', 'ARMPKGSFX_EABI', 'ARMPKGSF=
X_ENDIAN', 'ARMPKGSFX_FPU', 'ARMPKGSFX_THUMB', 'EXTENDPE', 'LIBCEXTENSION',=
 'MULTIMACH_TARGET_SYS', 'PACKAGE_ARCH', 'PATCHTOOL', 'PE', 'PF', 'PN', 'PR=
', 'PV', 'S', 'SRCREV', 'TARGET_OS', 'TARGET_VENDOR', 'TUNE_PKGARCH', 'WORK=
DIR', 'base_do_patch', 'patch_do_patch', 'patch_path', 'should_apply', 'src=
_patches']
basehash changed from 944e176cca5d006ba0306f57e85084bc to 5fb73074cd1a6bf4b=
5ba41f893232325
List of dependencies for variable WORKDIR changed from set(['PR', 'PV', 'MU=
LTIMACH_TARGET_SYS', 'PN', 'EXTENDPE', 'TMPDIR']) to set(['PF', 'TMPDIR', '=
MULTIMACH_TARGET_SYS'])
changed items: set(['PR', 'PV', 'PF', 'PN', 'EXTENDPE'])
Dependency on Variable PF was removed
Variable WORKDIR value changed from ${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/=
${PN}/${EXTENDPE}${PV}-${PR} to ${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PF}

> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index cf779a4..450a0ee 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -337,9 +337,9 @@ GITDIR =3D "${CO_DIR}/git2"
>  BZRDIR =3D "${CO_DIR}/bzr"
>  HGDIR =3D "${CO_DIR}/hg"
> =20
> -STAMP =3D "${TMPDIR}/stamps/${MULTIMACH_TARGET_SYS}/${PN}-${EXTENDPE}${P=
V}-${PR}"
> -STAMPCLEAN =3D "${TMPDIR}/stamps/${MULTIMACH_TARGET_SYS}/${PN}-[0-9]*-*"
> -WORKDIR =3D "${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PF}"
> +STAMP =3D "${TMPDIR}/stamps/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${P=
V}-${PR}"
> +STAMPCLEAN =3D "${TMPDIR}/stamps/${MULTIMACH_TARGET_SYS}/${PN}/*-*"
> +WORKDIR =3D "${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${P=
V}-${PR}"

This breaks paths in all PN-dbg, as reported on previous patch doing this w=
ith
WORKDIR:
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-September/03003=
1.html

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCr2U0ACgkQN1Ujt2V2gByTSgCfbJ51IgQ/JXL9l1vz8yqQ/eRc
IUsAnjsCjHfQN2XuuhuwsapESd7I8uzc
=RY7p
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--
