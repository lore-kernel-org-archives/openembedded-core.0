Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 543216FFE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 00:33:22 +0000 (UTC)
Received: by pfnn128 with SMTP id n128so114259960pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 16:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=5Y9R8njB0ZcjM0VySjm67sfB4NtjyibIYJLauawq2bA=;
	b=ISvQYOmvJwLJRsxMCyCShT0h3gguePvDUrOzdfIghEKksoWDWROU2O7+NXcYFGQNMe
	ThITC52PfZS9bRgYoDH69FCsTRnx6IuiLuU6fI6KhnxhizbuwJ9an3DAvRLrpSG1JuG+
	S8yqsqLx8iOu4C2igKeFnAmHHtYAS+AHBLpdSy4EjBipUIl2vNtNk2IMAfMwcK9FOqM+
	Wj8wDEFIPfHeedl0bvM31Nz+FkWbKD2BMC8F1C1TkEpvHJRmQF7OKJQTHvk+HIX8Y8KA
	J65+/dR13oCzk2pnigBTWaw4Vd4gJ1JEVoLPD+BiUVKhq8LGVuZyFSyZOxN10VWd9v5d
	iz1Q==
X-Received: by 10.98.75.71 with SMTP id y68mr40363647pfa.75.1450139603030;
	Mon, 14 Dec 2015 16:33:23 -0800 (PST)
Received: from [192.168.0.4] (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	r20sm44751788pfa.93.2015.12.14.16.33.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Dec 2015 16:33:22 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1450132548-31177-1-git-send-email-haris.okanovic@ni.com>
Date: Mon, 14 Dec 2015 16:33:17 -0800
Message-Id: <D29D34BA-D50B-45F9-9866-854FB1B8F843@gmail.com>
References: <CADkTA4PoDAgiJ2kdpT9HBnWLfGG-spLmSnF66BP33z520ig6wA@mail.gmail.com>
	<1450132548-31177-1-git-send-email-haris.okanovic@ni.com>
To: Haris Okanovic <haris.okanovic@ni.com>
X-Mailer: Apple Mail (2.3112)
Cc: Gratian Crisan <gratian.crisan@ni.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Tue, 15 Dec 2015 00:33:23 -0000
X-Groupsio-MsgNum: 74766
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9F92A607-B0CB-4F04-BA8D-D156E556CFB3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9F92A607-B0CB-4F04-BA8D-D156E556CFB3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Dec 14, 2015, at 2:35 PM, Haris Okanovic <haris.okanovic@ni.com> =
wrote:
>=20
> From: Gratian Crisan <gratian.crisan@ni.com>
>=20
> This change allows distributions to provide multiple builds of kernel
> and module packages. For example, a distro may want provide an =
alternate
> debug kernel in a package feed for debug/testing.
>=20
> Templetize kernel package name:
>=20
> Add a "weak" variable KERNEL_PACKAGE_NAME used as the base name for =
kernel
> packages. It defaults to the old hard-coded name 'kernel' but it can =
be
> redefined by recipes that provide additional kernel packages in order
> to avoid build conflicts.
>=20
> Change hard-coded 'kernel' references to KERNEL_PACKAGE_NAME in
> kernel bbclass-es.
>=20
> Build alternate kernels from WORKDIR instead of STAGING_KERNEL_DIR:
>=20
> Prior to this change, kernel recipes would all fetch source to
> STAGING_KERNEL_DIR as defined by bitbake/distro confs. This broke
> parallel builds when more than one kernel recipes are defined in
> the distribution, since they all attempted to fetch() and patch()
> in a shared source dir.
>=20
> With this change, alternate kernel recipes fetch source into their
> ${WORKDIR} so that they may build in parallel to each other and the
> default kernel recipe, which still fetches to STAGING_KERNEL_DIR.
>=20
> Testing:
>=20
> Built linux-yocto-4.1.13 for qemux86 and verified it produced kernel
> image and modules packages. Added kernel recipe with non-default
> KERNEL_PACKAGE_NAME and verified it produces kernel image and modules
> packages with alternate name next to default kernel.

is it all targeted at just kernel package ? can you cite some use cases =
which benefit from
such a thing and what are current alternatives ?

>=20
> Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
> Coauthored-by: Haris Okanovic <haris.okanovic@ni.com>
> Coauthored-by: Josh Hernstrom <josh.hernstrom@ni.com>
> Natinst-ReviewBoard-ID: 120348
> Natinst-ReviewBoard-ID: 120447
> ---
> meta/classes/kernel-module-split.bbclass |  9 ++--
> meta/classes/kernel.bbclass              | 76 =
++++++++++++++++++++------------
> meta/conf/documentation.conf             |  1 +
> meta/recipes-kernel/linux/linux-dtb.inc  |  2 +-
> 4 files changed, 55 insertions(+), 33 deletions(-)
>=20
> diff --git a/meta/classes/kernel-module-split.bbclass =
b/meta/classes/kernel-module-split.bbclass
> index e1a70e6..7415ec8 100644
> --- a/meta/classes/kernel-module-split.bbclass
> +++ b/meta/classes/kernel-module-split.bbclass
> @@ -28,7 +28,7 @@ do_install_append() {
>=20
> PACKAGESPLITFUNCS_prepend =3D "split_kernel_module_packages "
>=20
> -KERNEL_MODULES_META_PACKAGE ?=3D "kernel-modules"
> +KERNEL_MODULES_META_PACKAGE ?=3D "${KERNEL_PACKAGE_NAME}-modules"
>=20
> python split_kernel_module_packages () {
>     import re
> @@ -179,14 +179,17 @@ python split_kernel_module_packages () {
>         # Avoid automatic -dev recommendations for modules ending with =
-dev.
>         d.setVarFlag('RRECOMMENDS_' + pkg, 'nodeprrecs', 1)
>=20
> +    kernel_package_name =3D d.getVar("KERNEL_PACKAGE_NAME", True)
> +    kernel_version =3D d.getVar("KERNEL_VERSION", True)
> +
>     module_deps =3D parse_depmod()
>     module_regex =3D '^(.*)\.k?o$'
> -    module_pattern =3D 'kernel-module-%s'
> +    module_pattern =3D '%s-module-%%s' % kernel_package_name
>=20
>     postinst =3D d.getVar('pkg_postinst_modules', True)
>     postrm =3D d.getVar('pkg_postrm_modules', True)
>=20
> -    modules =3D do_split_packages(d, root=3D'/lib/modules', =
file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, =
description=3D'%s kernel module', postinst=3Dpostinst, postrm=3Dpostrm, =
recursive=3DTrue, hook=3Dfrob_metadata, extra_depends=3D'kernel-%s' % =
(d.getVar("KERNEL_VERSION", True)))
> +    modules =3D do_split_packages(d, root=3D'/lib/modules', =
file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, =
description=3D'%s kernel module', postinst=3Dpostinst, postrm=3Dpostrm, =
recursive=3DTrue, hook=3Dfrob_metadata, extra_depends=3D'%s-%s' % =
(kernel_package_name, kernel_version))
>     if modules:
>         metapkg =3D d.getVar('KERNEL_MODULES_META_PACKAGE', True)
>         d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index b75a462..281519e 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -1,5 +1,23 @@
> inherit linux-kernel-base kernel-module-split
>=20
> +KERNEL_PACKAGE_NAME ??=3D "kernel"
> +
> +# The default kernel recipe builds in a shared location defined by
> +# bitbake/distro confs: STAGING_KERNEL_DIR and =
STAGING_KERNEL_BUILDDIR.
> +# Set these variables to directories under ${WORKDIR} in alternate
> +# kernel recipes (I.e. where KERNEL_PACKAGE_NAME !=3D kernel) so that =
they
> +# may build in parallel with the default kernel without clobbering.
> +python __anonymous () {
> +    if d.getVar("KERNEL_PACKAGE_NAME", True) !=3D "kernel":
> +        workdir =3D d.getVar("WORKDIR", True)
> +
> +        sourceDir =3D os.path.join(workdir, 'kernel-source')
> +        artifactsDir =3D os.path.join(workdir, =
'kernel-build-artifacts')
> +
> +        d.setVar("STAGING_KERNEL_DIR", sourceDir)
> +        d.setVar("STAGING_KERNEL_BUILDDIR", artifactsDir)
> +}
> +
> PROVIDES +=3D "virtual/kernel"
> DEPENDS +=3D "virtual/${TARGET_PREFIX}binutils =
virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross bc-native"
>=20
> @@ -79,9 +97,9 @@ base_do_unpack_append () {
>=20
> inherit kernel-arch deploy
>=20
> -PACKAGES_DYNAMIC +=3D "^kernel-module-.*"
> -PACKAGES_DYNAMIC +=3D "^kernel-image-.*"
> -PACKAGES_DYNAMIC +=3D "^kernel-firmware-.*"
> +PACKAGES_DYNAMIC +=3D "^${KERNEL_PACKAGE_NAME}-module-.*"
> +PACKAGES_DYNAMIC +=3D "^${KERNEL_PACKAGE_NAME}-image-.*"
> +PACKAGES_DYNAMIC +=3D "^${KERNEL_PACKAGE_NAME}-firmware-.*"
>=20
> export OS =3D "${TARGET_OS}"
> export CROSS_COMPILE =3D "${TARGET_PREFIX}"
> @@ -270,9 +288,9 @@ do_shared_workdir_setscene () {
>=20
> emit_depmod_pkgdata() {
> 	# Stash data for depmod
> -	install -d ${PKGDESTWORK}/kernel-depmod/
> -	echo "${KERNEL_VERSION}" > =
${PKGDESTWORK}/kernel-depmod/kernel-abiversion
> -	cp ${B}/System.map =
${PKGDESTWORK}/kernel-depmod/System.map-${KERNEL_VERSION}
> +	install -d ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/
> +	echo "${KERNEL_VERSION}" > =
${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/${KERNEL_PACKAGE_NAME}-abiver=
sion
> +	cp ${B}/System.map =
${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/System.map-${KERNEL_VERSION}
> }
>=20
> PACKAGEFUNCS +=3D "emit_depmod_pkgdata"
> @@ -287,7 +305,7 @@ do_shared_workdir () {
> 	# Store the kernel version in sysroots for module-base.bbclass
> 	#
>=20
> -	echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
> +	echo "${KERNEL_VERSION}" > =
$kerneldir/${KERNEL_PACKAGE_NAME}-abiversion
>=20
> 	# Copy files required for module builds
> 	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
> @@ -361,28 +379,28 @@ EXPORT_FUNCTIONS do_compile do_install =
do_configure
>=20
> # kernel-base becomes kernel-${KERNEL_VERSION}
> # kernel-image becomes kernel-image-${KERNEL_VERISON}
> -PACKAGES =3D "kernel kernel-base kernel-vmlinux kernel-image =
kernel-dev kernel-modules"
> +PACKAGES =3D "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base =
${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image =
${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules"
> FILES_${PN} =3D ""
> -FILES_kernel-base =3D "/lib/modules/${KERNEL_VERSION}/modules.order =
/lib/modules/${KERNEL_VERSION}/modules.builtin"
> -FILES_kernel-image =3D "/boot/${KERNEL_IMAGETYPE}*"
> -FILES_kernel-dev =3D "/boot/System.map* /boot/Module.symvers* =
/boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
> -FILES_kernel-vmlinux =3D "/boot/vmlinux*"
> -FILES_kernel-modules =3D ""
> -RDEPENDS_kernel =3D "kernel-base"
> +FILES_${KERNEL_PACKAGE_NAME}-base =3D =
"/lib/modules/${KERNEL_VERSION}/modules.order =
/lib/modules/${KERNEL_VERSION}/modules.builtin"
> +FILES_${KERNEL_PACKAGE_NAME}-image =3D "/boot/${KERNEL_IMAGETYPE}*"
> +FILES_${KERNEL_PACKAGE_NAME}-dev =3D "/boot/System.map* =
/boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} =
/lib/modules/${KERNEL_VERSION}/build"
> +FILES_${KERNEL_PACKAGE_NAME}-vmlinux =3D "/boot/vmlinux*"
> +FILES_${KERNEL_PACKAGE_NAME}-modules =3D ""
> +RDEPENDS_${KERNEL_PACKAGE_NAME} =3D "${KERNEL_PACKAGE_NAME}-base"
> # Allow machines to override this dependency if kernel image files are
> # not wanted in images as standard
> -RDEPENDS_kernel-base ?=3D "kernel-image"
> -PKG_kernel-image =3D =
"kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
> -RDEPENDS_kernel-image +=3D "${@base_conditional('KERNEL_IMAGETYPE', =
'vmlinux', 'kernel-vmlinux', '', d)}"
> -PKG_kernel-base =3D =
"kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
> -RPROVIDES_kernel-base +=3D "kernel-${KERNEL_VERSION}"
> -ALLOW_EMPTY_kernel =3D "1"
> -ALLOW_EMPTY_kernel-base =3D "1"
> -ALLOW_EMPTY_kernel-image =3D "1"
> -ALLOW_EMPTY_kernel-modules =3D "1"
> -DESCRIPTION_kernel-modules =3D "Kernel modules meta package"
> -
> -pkg_postinst_kernel-base () {
> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?=3D =
"${KERNEL_PACKAGE_NAME}-image"
> +PKG_${KERNEL_PACKAGE_NAME}-image =3D =
"${KERNEL_PACKAGE_NAME}-image-${@legitimize_package_name('${KERNEL_VERSION=
}')}"
> +RDEPENDS_${KERNEL_PACKAGE_NAME}-image +=3D =
"${@base_conditional('KERNEL_IMAGETYPE', 'vmlinux', =
'${KERNEL_PACKAGE_NAME}-vmlinux', '', d)}"
> +PKG_${KERNEL_PACKAGE_NAME}-base =3D =
"${KERNEL_PACKAGE_NAME}-${@legitimize_package_name('${KERNEL_VERSION}')}"
> +RPROVIDES_${KERNEL_PACKAGE_NAME}-base +=3D =
"${KERNEL_PACKAGE_NAME}-${KERNEL_VERSION}"
> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME} =3D "1"
> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-base =3D "1"
> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-image =3D "1"
> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-modules =3D "1"
> +DESCRIPTION_${KERNEL_PACKAGE_NAME}-modules =3D "Kernel modules meta =
package"
> +
> +pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {
> 	if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
> 		mkdir -p $D/lib/modules/${KERNEL_VERSION}
> 	fi
> @@ -393,18 +411,18 @@ pkg_postinst_kernel-base () {
> 	fi
> }
>=20
> -pkg_postinst_kernel-image () {
> +pkg_postinst_${KERNEL_PACKAGE_NAME}-image () {
> 	update-alternatives --install =
/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} =
/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} =
${KERNEL_PRIORITY} || true
> }
>=20
> -pkg_postrm_kernel-image () {
> +pkg_postrm_${KERNEL_PACKAGE_NAME}-image () {
> 	update-alternatives --remove ${KERNEL_IMAGETYPE} =
${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
> }
>=20
> PACKAGESPLITFUNCS_prepend =3D "split_kernel_packages "
>=20
> python split_kernel_packages () {
> -    do_split_packages(d, root=3D'/lib/firmware', =
file_regex=3D'^(.*)\.(bin|fw|cis|dsp)$', =
output_pattern=3D'kernel-firmware-%s', description=3D'Firmware for %s', =
recursive=3DTrue, extra_depends=3D'')
> +    do_split_packages(d, root=3D'/lib/firmware', =
file_regex=3D'^(.*)\.(bin|fw|cis|dsp)$', =
output_pattern=3D'${KERNEL_PACKAGE_NAME}-firmware-%s', =
description=3D'Firmware for %s', recursive=3DTrue, extra_depends=3D'')
> }
>=20
> do_strip() {
> diff --git a/meta/conf/documentation.conf =
b/meta/conf/documentation.conf
> index 1b5c071..fb5e03f 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -250,6 +250,7 @@ KERNEL_FEATURES[doc] =3D "Includes additional =
metadata from the Yocto Project kern
> KERNEL_IMAGETYPE[doc] =3D "The type of kernel to build for a device, =
usually set by the machine configuration files and defaults to =
'zImage'."
> KERNEL_MODULE_AUTOLOAD[doc] =3D "Lists kernel modules that need to be =
auto-loaded during boot"
> KERNEL_MODULE_PROBECONF[doc] =3D "Lists kernel modules for which the =
build system expects to find module_conf_* values that specify =
configuration for each of the modules"
> +KERNEL_PACKAGE_NAME[doc] =3D "Name prefix for kernel packages. =
Defaults to 'kernel'."
> KERNEL_PATH[doc] =3D "The location of the kernel sources. This =
variable is set to the value of the STAGING_KERNEL_DIR within the module =
class (module.bbclass)."
> KERNEL_SRC[doc] =3D "The location of the kernel sources. This variable =
is set to the value of the STAGING_KERNEL_DIR within the module class =
(module.bbclass)."
> KFEATURE_DESCRIPTION[doc] =3D "Provides a short description of a =
configuration fragment. You use this variable in the .scc file that =
describes a configuration fragment file."
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc =
b/meta/recipes-kernel/linux/linux-dtb.inc
> index 772adcb..c27a3cb 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -2,7 +2,7 @@
> FILES_kernel-devicetree =3D "/${KERNEL_IMAGEDEST}/devicetree*"
>=20
> python __anonymous () {
> -    d.appendVar("PACKAGES", " kernel-devicetree")
> +    d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-devicetree")
> }
>=20
> normalize_dtb () {
> --
> 2.6.2
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_9F92A607-B0CB-4F04-BA8D-D156E556CFB3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZvX9EACgkQuwUzVZGdMxQSTQCfUvEJr137HrPpu+mVunQsGSSW
iRUAnR8deBv6UMkwoBK9ixM4qw1Jt3G5
=n2Ri
-----END PGP SIGNATURE-----

--Apple-Mail=_9F92A607-B0CB-4F04-BA8D-D156E556CFB3--
