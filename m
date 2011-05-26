Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1QPVIw-0001r1-6N
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 09:48:26 +0200
Received: by yxn22 with SMTP id 22so190374yxn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 00:45:19 -0700 (PDT)
Received: by 10.236.9.4 with SMTP id 4mr641452yhs.442.1306395919024;
	Thu, 26 May 2011 00:45:19 -0700 (PDT)
Received: from [10.0.0.8] (ppp-69-148-48-26.dsl.hstntx.swbell.net
	[69.148.48.26])
	by mx.google.com with ESMTPS id y21sm739309yhl.8.2011.05.26.00.45.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 May 2011 00:45:17 -0700 (PDT)
References: <cover.1306385875.git.dvhart@linux.intel.com>
	<c83bebea4e1c4dd15422ad2cb75eab977cea4a59.1306385875.git.dvhart@linux.intel.com>
In-Reply-To: <c83bebea4e1c4dd15422ad2cb75eab977cea4a59.1306385875.git.dvhart@linux.intel.com>
Mime-Version: 1.0 (iPad Mail 8C148)
Message-Id: <732E0947-423B-4DD0-BA56-4C11313BD5DA@beagleboard.org>
X-Mailer: iPad Mail (8C148)
From: Jason Kridner <jkridner@beagleboard.org>
Date: Thu, 26 May 2011 02:47:35 -0500
To: Darren Hart <dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [pull-oe-uboot 1/2] u-boot: remove UBOOT_MACHINE and COMPATIBLE_MACHINES
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
X-List-Received-Date: Thu, 26 May 2011 07:48:26 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I think this is a good change. One comment below...

On May 26, 2011, at 12:02 AM, Darren Hart <dvhart@linux.intel.com> wrote:

> oe-core does not define any machines, so it does not make sense to
> add machine specific information in the oe-core u-boot recipe and
> infrastructure. Also note that COMPATIBLE_MACHINES is not easily extended d=
ue to
> its regex syntax: "(machine_a|machine_b)", making it difficult to extend t=
he
> u-boot recipe in bbappend files without resorting to machine specific over=
rides.
>=20
> Remove COMPATIBLE_MACHINES and the default UBOOT_MACHINE from the recipe a=
nd
> insert some anonymous python into u-boot.inc to raise SkipPackage if
> UBOOT_MACHINE is not set (this ensures 'world' still works for machines th=
at
> can't build u-boot).
>=20
> UBOOT_MACHINE must now be specified in each machine config that requires u=
-boot.
> This is an improvement over requiring machine specific overrides in every B=
SP
> layer's u-boot_git.bbappend file. For example, a beagleboard machine confi=
g
> currently contains:
>=20
> UBOOT_ENTRYPOINT =3D "0x80008000"
> UBOOT_LOADADDRESS =3D "0x80008000"
>=20
> With this change, it must now contain:
>=20
> UBOOT_MACHINE =3D "omap3_beagle_config"
> UBOOT_ENTRYPOINT =3D "0x80008000"
> UBOOT_LOADADDRESS =3D "0x80008000"
>=20
> So long as the SRC_URI in the base recipe can build a working u-boot for a=
 given
> machine, there is no need to create a u-boot_git.bbappend file. If additio=
nal
> patches are deemed necessary, a BSP layer creates a u-boot_git.bbappend fi=
le and
> extends the SRC_URI to include general or machine specific backports.
>=20
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Koen Kooi <koen@dominion.thruhere.net>
> Cc: Jason Kridner <jkridner@beagleboard.org>
> ---
> meta/recipes-bsp/uboot/u-boot.inc    |    8 +++++++-
> meta/recipes-bsp/uboot/u-boot_git.bb |   11 ++++++-----
> 2 files changed, 13 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/recipes-bsp/uboot/u-boot.inc b/meta/recipes-bsp/uboot/u-=
boot.inc
> index 058e3ba..a54cf24 100644
> --- a/meta/recipes-bsp/uboot/u-boot.inc
> +++ b/meta/recipes-bsp/uboot/u-boot.inc
> @@ -11,7 +11,13 @@ PARALLEL_MAKE=3D""
> # GCC 4.5.1 builds unusable binaries using -Os, remove it from OPTFLAGS
> EXTRA_OEMAKE =3D "CROSS_COMPILE=3D${TARGET_PREFIX} OPTFLAGS=3D'-O2'"
>=20
> -UBOOT_MACHINE ?=3D "${MACHINE}_config"
> +python () {
> +    if not bb.data.getVar('UBOOT_MACHINE', d, 1):
> +        bb.debug("To build %s, see u-boot_git.bb for instructions on \

If this file was renamed, don't you also want to update this printout?

> +              setting up your machine config" % pn)
> +        raise bb.parse.SkipPackage("because UBOOT_MACHINE is not set")
> +}
> +
> UBOOT_IMAGE ?=3D "u-boot-${MACHINE}-${PV}-${PR}.bin"
> UBOOT_SYMLINK ?=3D "u-boot-${MACHINE}.bin"
> UBOOT_MAKE_TARGET ?=3D "all"
> diff --git a/meta/recipes-bsp/uboot/u-boot_git.bb b/meta/recipes-bsp/uboot=
/u-boot_git.bb
> index 4c8f5df..0fbb9ba 100644
> --- a/meta/recipes-bsp/uboot/u-boot_git.bb
> +++ b/meta/recipes-bsp/uboot/u-boot_git.bb
> @@ -1,5 +1,11 @@
> require u-boot.inc
>=20
> +# To build u-boot for your machine, provide the following lines in your m=
achine
> +# config, replacing the assignments as appropriate for your machine.
> +# UBOOT_MACHINE =3D "omap3_beagle_config"
> +# UBOOT_ENTRYPOINT =3D "0x80008000"
> +# UBOOT_LOADADDRESS =3D "0x80008000"
> +
> LICENSE =3D "GPLv2+"
> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a5651ec=
b \
>                     file://README;beginline=3D1;endline=3D22;md5=3D3a00ef5=
1d3fc96e9d6c1bc4708ccd3b5"
> @@ -12,11 +18,6 @@ PR=3D"r3"
>=20
> SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgit"
>=20
> -UBOOT_MACHINE_beagleboard =3D "omap3_beagle_config"
> -UBOOT_MACHINE_overo =3D "omap3_overo_config"
> -
> S =3D "${WORKDIR}/git"
>=20
> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> -
> -COMPATIBLE_MACHINE =3D "(beagleboard|overo)"
> --=20
> 1.7.1
>=20


