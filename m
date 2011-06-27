Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QbEYS-0001FW-73
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 18:20:57 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jun 2011 09:17:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,432,1304319600"; d="scan'208";a="23415081"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jun 2011 09:17:15 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.226.10) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 27 Jun 2011 09:17:14 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx605.amr.corp.intel.com ([10.22.226.10]) with mapi;
	Mon, 27 Jun 2011 09:17:14 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jun 2011 09:17:14 -0700
Thread-Topic: [OE-core] [PATCH] binutils: allow distro to select gold as
	default	linker
Thread-Index: Acw04hNbWD/vhpjWSR6O/fy06rVzuAAA0esA
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE03E3AB@orsmsx504.amr.corp.intel.com>
References: <1309189876.21613.327.camel@phil-desktop>
In-Reply-To: <1309189876.21613.327.camel@phil-desktop>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH] binutils: allow distro to select gold as default	linker
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
X-List-Received-Date: Mon, 27 Jun 2011 16:20:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Good to see that gold is enabled only if distro config requests it. I have =
some need which will need disabling gold.

Thanks,
Nitin


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Phil Blundell
> Sent: Monday, June 27, 2011 8:51 AM
> To: oe-core
> Subject: [OE-core] [PATCH] binutils: allow distro to select gold as
> default linker
>=20
> But ensure that gcc-cross-intermediate always uses ld.bfd since
> (e)glibc won't build with gold.
>=20
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/recipes-devtools/binutils/binutils-cross.inc  |    3 ++-
>  .../gcc/gcc-cross-intermediate.inc                 |    7 ++++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc
> b/meta/recipes-devtools/binutils/binutils-cross.inc
> index 4b90972..5a41970 100644
> --- a/meta/recipes-devtools/binutils/binutils-cross.inc
> +++ b/meta/recipes-devtools/binutils/binutils-cross.inc
> @@ -5,7 +5,8 @@ EXTRA_OECONF =3D "--with-sysroot=3D${STAGING_DIR_TARGET} =
\
>                  --program-prefix=3D${TARGET_PREFIX} \
>                  --disable-install-libbfd \
>                  --disable-werror \
> -                --enable-poison-system-directories"
> +                --enable-poison-system-directories \
> +		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--
> enable-gold=3Ddefault', '', d)}"
>=20
>  do_install () {
>  	oe_runmake 'DESTDIR=3D${D}' install
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> index 92c3ce2..05b5dbc 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> @@ -7,6 +7,10 @@ CROSS_TARGET_SYS_DIR_append =3D ".${PN}"
>=20
>  # This is intended to be a -very- basic config
>  # sysroot is needed in case we use libc-initial
> +#
> +# Glibc won't compile with gold, and building glibc is the whole point
> of
> +# this recipe.   So we select ld.bfd explicitly here if gold is the
> distro's
> +# preferred linker.
>  EXTRA_OECONF =3D "--with-local-
> prefix=3D${STAGING_DIR_TARGET}${target_prefix} \
>  		--enable-shared \
>  		--disable-multilib \
> @@ -17,7 +21,8 @@ EXTRA_OECONF =3D "--with-local-
> prefix=3D${STAGING_DIR_TARGET}${target_prefix} \
>  		--with-sysroot=3D${STAGING_DIR_TCBOOTSTRAP} \
>  		--with-build-sysroot=3D${STAGING_DIR_TCBOOTSTRAP} \
>  		${EXTRA_OECONF_INTERMEDIATE} \
> -		${@get_gcc_fpu_setting(bb, d)}"
> +		${@get_gcc_fpu_setting(bb, d)} \
> +		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--with-
> ld=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)}"
>=20
>  do_populate_sysroot[sstate-inputdirs] =3D
> "${SYSROOT_DESTDIR}/${STAGING_DIR_HOST}
> ${SYSROOT_DESTDIR}/${STAGING_DIR_TARGET}/${target_base_libdir}"
>  do_populate_sysroot[sstate-outputdirs] =3D "${STAGING_DIR_HOST}
> ${STAGING_DIR_TCBOOTSTRAP}/${target_base_libdir}"
> --
> 1.7.2.5
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


