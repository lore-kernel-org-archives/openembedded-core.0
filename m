X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Date: Tue, 5 Oct 2021 12:18:16 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 1/2] kernel, kernel-module-split: Add runtime dependency to subpackages on main package
Message-ID: <YVwmaBtjodK5888P@piout.net>
References: <16A93426652F9306.27626@lists.openembedded.org>
 <20210930141444.698139-1-zboszor@pr.hu>
 <20210930141444.698139-2-zboszor@pr.hu>
MIME-Version: 1.0
In-Reply-To: <20210930141444.698139-2-zboszor@pr.hu>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-id: <openembedded-core.lists.openembedded.org>
To: zboszor@pr.hu
Cc: openembedded-core@lists.openembedded.org, =?iso-8859-1?B?Wm9sdOFuIEL2c3r2cm3pbnlp?= <zboszor@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>

Hello,

On 30/09/2021 16:14:43+0200, Zoltan Boszormenyi via lists.openembedded.org =
wrote:
> From: Zolt=E1n B=F6sz=F6rm=E9nyi <zboszor@gmail.com>
>=20
> This creates a circular dependency between the main kernel package
> and its subpackages. It helps package managers to automatically
> remove all kernel packages of the same version when upgrading.
>=20
> Signed-off-by: Zolt=E1n B=F6sz=F6rm=E9nyi <zboszor@gmail.com>
> ---
> v2: No changes
>=20
> v3: Add reverse RDEPENDS to subpackages unconditionally
>     Handle KERNEL_SPLIT_MODULES=3D1 (default) case in
>     meta/classes/kernel-module-split.bbclass
>=20
>  meta/classes/kernel-module-split.bbclass | 5 +++--
>  meta/classes/kernel.bbclass              | 7 ++++++-
>  2 files changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kern=
el-module-split.bbclass
> index a29c294810..2ddcea538c 100644
> --- a/meta/classes/kernel-module-split.bbclass
> +++ b/meta/classes/kernel-module-split.bbclass
> @@ -176,8 +176,9 @@ python split_kernel_module_packages () {
>      module_pattern =3D module_pattern_prefix + kernel_package_name + '-m=
odule-%s' + module_pattern_suffix
> =20
>      modules =3D do_split_packages(d, root=3D'${nonarch_base_libdir}/modu=
les', file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, descripti=
on=3D'%s kernel module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=3D=
True, hook=3Dfrob_metadata, extra_depends=3D'%s-%s' % (kernel_package_name,=
 kernel_version))
> -    if modules:
> -        d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
> +    for mod in modules:
> +        d.appendVar('RDEPENDS:' + metapkg, ' %s (=3D ${EXTENDPKGV})' % m=
od)
> +        d.appendVar('RDEPENDS:' + mod, ' %s (=3D ${EXTENDPKGV})' % kerne=
l_package_name)
> =20

I believe this causes the following issues:

https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/4135/step=
s/18/logs/stdio

Error:=20
 Problem: package hello-mod-0.1-r0.qemux86_64 requires kernel-module-hello-=
5.14.6-yocto-standard =3D 0.1-r0, but none of the providers can be installed

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2342/step=
s/11/logs/stdio

Error:=20
 Problem: package lttng-tools-ptest-2.13.0-r0.cortexa57 requires lttng-modu=
les, but none of the providers can be installed
  - package lttng-modules-2.13.0-r0.qemuarm64 requires kernel-module-lttng-=
wrapper-5.14.6-yocto-standard =3D 2.13.0-r0, but none of the providers can =
be installed
  - conflicting requests
  - nothing provides kernel =3D 2.13.0-r0 needed by kernel-module-lttng-wra=
pper-5.14.6-yocto-standard-2.13.0-r0.qemuarm64
(try to add '--skip-broken' to skip uninstallable packages)


>      # If modules-load.d and modprobe.d are empty at this point, remove t=
hem to
>      # avoid warnings. removedirs only raises an OSError if an empty
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 4acec1877e..afd9f8045e 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -98,7 +98,9 @@ python __anonymous () {
>          typelower =3D type.lower()
>          d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
>          d.setVar('FILES:' + kname + '-image-' + typelower, '/' + imagede=
st + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + type)
> +        d.appendVar('RDEPENDS:%s-image' % kname, ' %s (=3D ${EXTENDPKGV}=
)' % kname)
>          d.appendVar('RDEPENDS:%s-image' % kname, ' %s-image-%s (=3D ${EX=
TENDPKGV})' % (kname, typelower))
> +        d.appendVar('RDEPENDS:%s-image-%s' % (kname, typelower), ' %s (=
=3D ${EXTENDPKGV})' % kname)
>          splitmods =3D d.getVar("KERNEL_SPLIT_MODULES")
>          if splitmods !=3D '1':
>              d.appendVar('RDEPENDS:%s-image' % kname, ' %s-modules (=3D $=
{EXTENDPKGV})' % kname)
> @@ -627,8 +629,11 @@ RDEPENDS:${KERNEL_PACKAGE_NAME} =3D "${KERNEL_PACKAG=
E_NAME}-base (=3D ${EXTENDPKGV})
>  # Allow machines to override this dependency if kernel image files are
>  # not wanted in images as standard
>  RDEPENDS:${KERNEL_PACKAGE_NAME}-base ?=3D "${KERNEL_PACKAGE_NAME}-image =
(=3D ${EXTENDPKGV})"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append =3D " ${KERNEL_PACKAGE_NAME}=
 (=3D ${EXTENDPKGV})"
>  PKG:${KERNEL_PACKAGE_NAME}-image =3D "${KERNEL_PACKAGE_NAME}-image-${@le=
gitimize_package_name(d.getVar('KERNEL_VERSION'))}"
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-image +=3D "${@oe.utils.conditional('KER=
NEL_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux (=3D ${EXTENDPKG=
V})', '', d)}"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-image:append =3D "${@oe.utils.conditiona=
l('KERNEL_IMAGETYPE', 'vmlinux', ' ${KERNEL_PACKAGE_NAME}-vmlinux (=3D ${EX=
TENDPKGV})', '', d)}"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-vmlinux:append =3D "${@oe.utils.conditio=
nal('KERNEL_IMAGETYPE', 'vmlinux', ' ${KERNEL_PACKAGE_NAME} (=3D ${EXTENDPK=
GV})', '', d)}"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-modules:append =3D " ${KERNEL_PACKAGE_NA=
ME} (=3D ${EXTENDPKGV})"
>  PKG:${KERNEL_PACKAGE_NAME}-base =3D "${KERNEL_PACKAGE_NAME}-${@legitimiz=
e_package_name(d.getVar('KERNEL_VERSION'))}"
>  RPROVIDES:${KERNEL_PACKAGE_NAME}-base +=3D "${KERNEL_PACKAGE_NAME}-${KER=
NEL_VERSION}"
>  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} =3D "1"
> --=20
> 2.31.1
>=20

>=20
>=20
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
