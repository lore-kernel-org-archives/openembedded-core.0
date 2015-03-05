Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id AECA0738E9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 23:07:06 +0000 (UTC)
Received: by wgha1 with SMTP id a1so5909372wgh.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2015 15:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TmQFycSsUYC4ClNewB+RbYBh+3v/mVD1aIvkvbVjKdQ=;
	b=vFzYRXTiZbh9NcxN5TWAtC7g0KBKI3k0ro8e7tzAjTjXuS5HArwcrb2qWdponP+kOR
	L0Nk6yoH9o3EEpUI6bzpDmF/a/HrNo1NxtMTgIUdWD2uOzW3K9VU7Pk/atF/xPdRyZm1
	8jQCBPcSjjtgUq/AEHseXbW1RVXzwyODnkEW/3loIOmzk4KtK6P5i1RtctrPeRrUw7l4
	DI+yPZ8EdQMfMsACZ+D1lKBtMSGGaLzhWQqH2hwAOwEfUhfZs1ETYbD+pxxCJ1VBS7Bp
	w2A52uSe5Nfwom9tccibJfPjLd0vbNEsG2egXOIvjipoOu+FeZlR4mzFZ52LS2JZA95J
	BWeA==
X-Received: by 10.180.35.33 with SMTP id e1mr68776494wij.49.1425596827585;
	Thu, 05 Mar 2015 15:07:07 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hs7sm31665994wib.4.2015.03.05.15.07.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 15:07:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 6 Mar 2015 00:07:12 +0100
To: openembedded-core@lists.openembedded.org
Message-ID: <20150305230712.GC2337@jama>
References: <1425596608-24197-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1425596608-24197-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [dizzy][PATCH] serf: fix 'ccache' builds
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
X-List-Received-Date: Thu, 05 Mar 2015 23:07:07 -0000
X-Groupsio-MsgNum: 63024
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="irrheVdOic6+Kbak"
Content-Disposition: inline

--irrheVdOic6+Kbak
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 06, 2015 at 12:03:28AM +0100, Martin Jansa wrote:
> From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>=20
> 'scons' cleans the environment which breaks ccache builds because
> CCACHEDIR can point to an unexpected location:
>=20
> | ccache arm-linux-gnueabi-gcc ... context.c
> | ccache: failed to create .../serf/1.3.8-r0/.home/.ccache (No such file =
or directory)

This also fixes the build with external toolchain which doesn't exist in
STAGING_BINDIR_TOOLCHAIN, so please consider to merge this in dizzy.

> Issue is described in
>=20
>   http://www.scons.org/wiki/ImportingEnvironmentSettings
>=20
> and because 'bitbake' cleans environment we can pass it completely
> instead of trying to enumerate needed env.
>=20
> With the 'env.patch' the FULLCC variable is not needed anymore (which
> would break when CC is 'ccache arm-...-gcc' and host ccache is used)
> because the correct $PATH is available during scons build:
>=20
> | sh: .../sysroots/x86_64-oe-linux/usr/bin/arm-linux-gnueabi/ccache: No s=
uch file or directory
> | scons: *** [context.o] Error 127
>=20
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-support/serf/serf/env.patch | 28 ++++++++++++++++++++++++++=
++
>  meta/recipes-support/serf/serf_1.3.7.bb  |  8 +++-----
>  2 files changed, 31 insertions(+), 5 deletions(-)
>  create mode 100644 meta/recipes-support/serf/serf/env.patch
>=20
> diff --git a/meta/recipes-support/serf/serf/env.patch b/meta/recipes-supp=
ort/serf/serf/env.patch
> new file mode 100644
> index 0000000..9d073e9
> --- /dev/null
> +++ b/meta/recipes-support/serf/serf/env.patch
> @@ -0,0 +1,28 @@
> +'scons' cleans the environment which breaks ccache builds because
> +CCACHEDIR can point to an unexpected location:
> +
> +| ccache arm-linux-gnueabi-gcc ... context.c
> +| ccache: failed to create .../serf/1.3.6-r0/.home/.ccache (No such file=
 or directory)
> +
> +Issue is described in
> +
> +  http://www.scons.org/wiki/ImportingEnvironmentSettings
> +
> +and because 'bitbake' cleans environment we can pass it completely
> +instead of trying to enumerate needed env.
> +
> +Upstream-Status: Inappropriate
> +
> +
> +Index: serf-1.3.6/SConstruct
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- serf-1.3.6.orig/SConstruct
> ++++ serf-1.3.6/SConstruct
> +@@ -149,6 +149,7 @@ if sys.platform =3D=3D 'win32':
> + env =3D Environment(variables=3Dopts,
> +                   tools=3D('default', 'textfile',),
> +                   CPPPATH=3D['.', ],
> ++                  ENV =3D os.environ,
> +                   )
> +
> + env.Append(BUILDERS =3D {
> diff --git a/meta/recipes-support/serf/serf_1.3.7.bb b/meta/recipes-suppo=
rt/serf/serf_1.3.7.bb
> index 5230ef7..b87a04a 100644
> --- a/meta/recipes-support/serf/serf_1.3.7.bb
> +++ b/meta/recipes-support/serf/serf_1.3.7.bb
> @@ -1,6 +1,7 @@
> =20
>  SRC_URI =3D "http://serf.googlecode.com/svn/src_releases/serf-1.3.7.tar.=
bz2 \
> -           file://norpath.patch"
> +           file://norpath.patch \
> +           file://env.patch"
>  SRC_URI[md5sum] =3D "0a6fa745df4517dd8f79c75c538919bc"
>  SRC_URI[sha256sum] =3D "ecccb74e665e6ea7539271e126a21d0f7eeddfeaa8ce090a=
db3aec6682f9f0ae"
> =20
> @@ -9,12 +10,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c32=
4c9479bd8986968f4327"
> =20
>  DEPENDS =3D "python-scons-native openssl apr apr-util util-linux expat"
> =20
> -FULLCC =3D "${STAGING_BINDIR_TOOLCHAIN}/${CC}"
> -FULLCC_class-native =3D "${CC}"
> -
>  do_compile() {
>  	${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} PREFIX=3D${prefix} \
> -		CC=3D"${FULLCC}" \
> +		CC=3D"${CC}" \
>  		APR=3D`which apr-1-config` APU=3D`which apu-1-config` \
>  		CFLAGS=3D"${CFLAGS}" LINKFLAGS=3D"${LDFLAGS}" \
>  		OPENSSL=3D"${STAGING_EXECPREFIXDIR}"
> --=20
> 2.3.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--irrheVdOic6+Kbak
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT44aAACgkQN1Ujt2V2gBxsTACgt1DWUS95xZnctWxUboK4q2RZ
M14AnjZhB/S5Q82B5RCs13oqu0OdcWzt
=ZrfM
-----END PGP SIGNATURE-----

--irrheVdOic6+Kbak--
