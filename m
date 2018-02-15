Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8CF7F77DCD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 20:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 15294184AE;
	Thu, 15 Feb 2018 21:12:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id AA3rzmOPy15A; Thu, 15 Feb 2018 21:12:16 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 5B245184A7;
	Thu, 15 Feb 2018 21:12:16 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F15E1E072;
	Thu, 15 Feb 2018 21:12:16 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 339B31E070;
	Thu, 15 Feb 2018 21:12:16 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu, 15 Feb 2018 21:12:16 +0100 (CET)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 2795E118F;
	Thu, 15 Feb 2018 21:12:16 +0100 (CET)
Received: from xbox11.axis.com (10.0.5.25) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Thu, 15 Feb 2018 21:12:16 +0100
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Thu, 15 Feb 2018 21:12:15 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Thu, 15 Feb 2018 21:12:16 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [RFC][PATCH 12/12] make-mod-scripts: change how some
	kernel module tools are built
Thread-Index: AQHTlsFnZdMWtmHLVUm5HyzCOP6UEqOl+CBQ
Date: Thu, 15 Feb 2018 20:12:15 +0000
Message-ID: <1cd76e22c50541db9bc2cfdccf5444a8@XBOX02.axis.com>
References: <cover.1516973739.git.bruce.ashfield@windriver.com>
	<f277f872c728ed18709c58e88e26a3fc81f23663.1516973739.git.bruce.ashfield@windriver.com>
In-Reply-To: <f277f872c728ed18709c58e88e26a3fc81f23663.1516973739.git.bruce.ashfield@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 12/12] make-mod-scripts: change how some	kernel module tools are built
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
X-List-Received-Date: Thu, 15 Feb 2018 20:12:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Bruce Ashfield
> Sent: den 26 januari 2018 14:59
> To: richard.purdie@linuxfoundation.org
> Cc: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [RFC][PATCH 12/12] make-mod-scripts: change how some
> kernel module tools are built
>=20
> From: Joe Slater <jslater@windriver.com>
>=20
> Remove do_make_scripts() from module-base.bbclass and put
> functionality in a recipe.  This will build the scripts only
> once instead of each time an external module is built.
>=20
> [YOCTO #12228]
>=20
> Signed-off-by: Joe Slater <jslater@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/classes/module-base.bbclass                   | 12 +++--------
>  meta/classes/module.bbclass                        |  4 ----
>  .../make-mod-scripts/make-mod-scripts_1.0.bb       | 24
> ++++++++++++++++++++++
>  3 files changed, 27 insertions(+), 13 deletions(-)
>  create mode 100644 meta/recipes-kernel/make-mod-scripts/make-mod-
> scripts_1.0.bb
>=20
> diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-
> base.bbclass
> index 6fe77c01b7ed..d6762a7dffd8 100644
> --- a/meta/classes/module-base.bbclass
> +++ b/meta/classes/module-base.bbclass
> @@ -1,7 +1,8 @@
>  inherit kernel-arch
>=20
> -# This is instead of DEPENDS =3D "virtual/kernel"
> -do_configure[depends] +=3D "virtual/kernel:do_compile_kernelmodules"
> +# We do the dependency this way because the output is not preserved
> +# in sstate, so we must force do_compile to run (once).
> +do_configure[depends] +=3D "make-mod-scripts:do_compile"
>=20
>  export OS =3D "${TARGET_OS}"
>  export CROSS_COMPILE =3D "${TARGET_PREFIX}"
> @@ -18,10 +19,3 @@ KERNEL_OBJECT_SUFFIX =3D ".ko"
>  # kernel modules are generally machine specific
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
> -# Function to ensure the kernel scripts are created. Expected to
> -# be called before do_compile. See module.bbclass for an example.
> -do_make_scripts() {
> -	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> -	make CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" AR=3D"${KERNEL_AR}" \
> -	           -C ${STAGING_KERNEL_DIR}
> O=3D${STAGING_KERNEL_BUILDDIR} scripts
> -}
> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> index 78d1b21dbd83..e34496024434 100644
> --- a/meta/classes/module.bbclass
> +++ b/meta/classes/module.bbclass
> @@ -1,9 +1,5 @@
>  inherit module-base kernel-module-split pkgconfig
>=20
> -addtask make_scripts after do_prepare_recipe_sysroot before
> do_configure
> -do_make_scripts[lockfiles] =3D "${TMPDIR}/kernel-scripts.lock"
> -do_make_scripts[depends] +=3D "virtual/kernel:do_shared_workdir"
> -
>  EXTRA_OEMAKE +=3D "KERNEL_SRC=3D${STAGING_KERNEL_DIR}"
>=20
>  MODULES_INSTALL_TARGET ?=3D "modules_install"
> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-
> scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-
> scripts_1.0.bb
> new file mode 100644
> index 000000000000..6645c873f015
> --- /dev/null
> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> @@ -0,0 +1,24 @@
> +SUMMARY =3D "Build tools needed by external modules"
> +LICENSE =3D "GPLv2"
> +
> +inherit kernel-arch

This recipe needs to inherit pkgconfig as well (since pkg-config is used=20
when building kconfig as part of the kernel scripts).

> +
> +S =3D "${WORKDIR}"
> +
> +do_configure[depends] +=3D "virtual/kernel:do_shared_workdir"
> +do_compile[depends] +=3D "virtual/kernel:do_compile_kernelmodules"
> +
> +# Build some host tools under work-shared.  CC, LD, and AR are probably
> +# not used, but this is the historical way of invoking "make scripts".
> +#
> +do_configure() {
> +	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> +	make CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" AR=3D"${KERNEL_AR}" \
> +	           -C ${STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR} scri=
pts
> +}
> +
> +
> +# There is no reason to build this on its own.
> +#
> +EXCLUDE_FROM_WORLD =3D "1"
> +
> --
> 2.5.0

//Peter

