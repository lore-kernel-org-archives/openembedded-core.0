Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9D03F6AC23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 15:31:49 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so77254646ied.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 08:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=NlVGDp0QvgKy5vt3RbyK5ohC3iUFIIqx5kf7gECHVDE=;
	b=xMyDe4WprMO+aB/PNeMkGMaTTWubgVNWXseb7ECrDq5qKNBi+AioNRhQ9S5tKrqBNP
	3TbCi+LMmegtZbYepoC1pIIshWmRSVplUvnC8IEm7ZZpWYImWtPPt6Cub8drFjPm7Rhy
	cOe2gzDbKRpXfs0bWTtpBAKkMaRog+WKQ1xYFdnqmiGdjhnyVlimpUp0380Sy2j6S378
	8s7xkcVKlpPja2CkfgPvcc/Lo6fGpLpDfHblBfUEZexrA8jAAzCRz3Bvet2uMjhhJSqa
	veMyKHrzNGvY5UO82ojr78BujGIwVMGXiXgU5ceLcAJNQrEndoU1ldiiZhDyi47CCZYo
	LGhw==
MIME-Version: 1.0
X-Received: by 10.50.66.227 with SMTP id i3mr17167368igt.47.1428939110236;
	Mon, 13 Apr 2015 08:31:50 -0700 (PDT)
Received: by 10.107.158.20 with HTTP; Mon, 13 Apr 2015 08:31:50 -0700 (PDT)
In-Reply-To: <20150413141345.GF17921@deadlock.dhs.org>
References: <20150413141345.GF17921@deadlock.dhs.org>
Date: Mon, 13 Apr 2015 11:31:50 -0400
Message-ID: <CADkTA4N7CTFHgBrG5HO0XrtG6YP3YN5J5ibOx4ZnwG9bHS=0sA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Sergey 'Jin' Bostandzhyan" <jin@dev.digitalstrom.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] allow installation of multiple kernels in the rootfs
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
X-List-Received-Date: Mon, 13 Apr 2015 15:31:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2015 at 10:13 AM, Sergey 'Jin' Bostandzhyan
<jin@dev.digitalstrom.org> wrote:
> Hi everyone,
>
> below is a suggestion of an implementation of a feature that we need on o=
ur
> system. Basically we would like to be able to install multiple kernel pac=
kages
> in the rootfs, ideally they should be handled by the package manager. We =
then
> plan to use the kexec mechanism to implement "safe" kernel upgrades and a=
 rescue
> system. The kernel that was flashed at production time would stay the sam=
e
> forever, making it impossible to brick the device.
>
> I studied the kernel classes and I was able to identify two points that n=
eeded
> some hacking:
>
>  * the kernel package names are currently hardcoded, any kernel recipe wi=
ll be
>    packaged as "kernel-*.ipk"
>
>  * I have the impression that there can be only one virtual/kernel provid=
er
>
> I tried to address these two points in the patches below.
>
> I'd be happy to hear some feedback on this and I'm willing to tune anythi=
ng
> that might be necessary in order to get this feature merged into core.

My big concerns are around compatibility/consistency and the wreckage
that changing
the package names will cause for the system.

I'm competent in packaging .. but not an expert, so I'm hoping that
Richard and folks
like Mark Hatle can jump in with options to allow the package managers
to deal with
this as well.

>
> Kind regards,
> Sergey
>
> P.S. I'm Jin^eLD on IRC
>
>
>
> From eec42c5ffe018fd0ab591099c9d0869b5f87ee08 Mon Sep 17 00:00:00 2001
> From: Sergey 'Jin' Bostandzhyan <jin at mediatomb dot cc>
> Date: Mon, 13 Apr 2015 15:52:22 +0200
> Subject: [PATCH 1/2] allow to specify custom kernel package names
>
> Introduce a KERNEL_PACKAGE_EXTRA_NAME variable which will append itself
> to the names of the appropriate packages and deployed files. It will
> also influence the kernels local version, because we need unique module
> directories for each additional kernel.
>
> The idea is to create a separation of kernel files so that multiple
> kernel packages with different names can co-exist on the same roofs and
> can be handled by the package manager.
>
> Signed-off-by: Sergey Bostandzhyan <jin@dev.digitalstrom.org>
> ---
>  meta/classes/kernel-module-split.bbclass |  9 ++--
>  meta/classes/kernel.bbclass              | 91 ++++++++++++++++++++++----=
------
>  meta/classes/linux-kernel-base.bbclass   |  4 +-
>  meta/classes/multilib.bbclass            |  5 +-
>  meta/classes/package.bbclass             |  3 +-
>  5 files changed, 76 insertions(+), 36 deletions(-)
>
> diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kern=
el-module-split.bbclass
> index 9a95b72..dbfad01 100644
> --- a/meta/classes/kernel-module-split.bbclass
> +++ b/meta/classes/kernel-module-split.bbclass
> @@ -28,7 +28,7 @@ do_install_append() {
>
>  PACKAGESPLITFUNCS_prepend =3D "split_kernel_module_packages "
>
> -KERNEL_MODULES_META_PACKAGE ?=3D "kernel-modules"
> +KERNEL_MODULES_META_PACKAGE ?=3D "${KERNEL_PACKAGE_NAME}-modules"

The problem that I have with this is one of wider consistency and eco
system layers.
Before, I could count on the fact that "kernel-modules" got me all the
built kernel
modules for any kernel provided by the virtual/kernel dependency. Now
I have to know
if a layer changes this variable and/or update all my package lists to
use this variable.

Not impossible, but preferably something to avoid.

>
>  python split_kernel_module_packages () {
>      import re
> @@ -178,12 +178,15 @@ python split_kernel_module_packages () {
>
>      module_deps =3D parse_depmod()
>      module_regex =3D '^(.*)\.k?o$'
> -    module_pattern =3D 'kernel-module-%s'
> +
> +    kernel_package_name =3D d.getVar('KERNEL_PACKAGE_NAME')
> +
> +    module_pattern =3D kernel_package_name + '-module-%s'
>
>      postinst =3D d.getVar('pkg_postinst_modules', True)
>      postrm =3D d.getVar('pkg_postrm_modules', True)
>
> -    modules =3D do_split_packages(d, root=3D'/lib/modules', file_regex=
=3Dmodule_regex, output_pattern=3Dmodule_pattern, description=3D'%s kernel =
module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue, hook=3Dfro=
b_metadata, extra_depends=3D'kernel-%s' % (d.getVar("KERNEL_VERSION", True)=
))
> +    modules =3D do_split_packages(d, root=3D'/lib/modules', file_regex=
=3Dmodule_regex, output_pattern=3Dmodule_pattern, description=3D'%s kernel =
module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue, hook=3Dfro=
b_metadata, extra_depends=3D'%s-%s' % (kernel_package_name, d.getVar("KERNE=
L_VERSION", True)))
>      if modules:
>          metapkg =3D d.getVar('KERNEL_MODULES_META_PACKAGE', True)
>          d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 70ed95b..c7c6c3e 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -6,11 +6,43 @@ DEPENDS +=3D "virtual/${TARGET_PREFIX}binutils virtual/=
${TARGET_PREFIX}gcc kmod-na
>  # we include gcc above, we dont need virtual/libc
>  INHIBIT_DEFAULT_DEPS =3D "1"
>
> +
> +KERNEL_PACKAGE_NAME =3D ""

You do set a default to "kernel" in the processvars routine below, but
what's the harm
in setting this to "kernel" as well ?

> +
> +# adds a suffix to the kernel name, allowing to change the naming scheme=
 of
> +# the kernel packages, result will be "kernel-${KERNEL_PACKAGE_EXTRA_NAM=
E}"
> +KERNEL_PACKAGE_EXTRA_NAME ?=3D ""
> +
>  KERNEL_IMAGETYPE ?=3D "zImage"
>  INITRAMFS_IMAGE ?=3D ""
>  INITRAMFS_TASK ?=3D ""
>  INITRAMFS_IMAGE_BUNDLE ?=3D ""
>
> +python kernel_processvars_handler () {
> +    extra_name =3D e.data.getVar('KERNEL_PACKAGE_EXTRA_NAME', True) or "=
"
> +    default_name =3D e.data.getVar('KERNEL_PACKAGE_NAME', True) or "kern=
el"
> +    if extra_name !=3D "":
> +        new_kernel_package_name =3D '%s-%s' % (default_name, extra_name)
> +        e.data.setVar('KERNEL_PACKAGE_NAME', new_kernel_package_name)
> +        localversion =3D e.data.getVar('KERNEL_LOCALVERSION', True) or "=
"
> +        if (localversion =3D=3D ""):
> +            localversion =3D "-%s" % extra_name
> +        else:
> +            localversion =3D "%s+%s" % (localversion, extra_name)
> +
> +        e.data.setVar('KERNEL_LOCALVERSION', localversion)
> +        # if name has been tuned, add localversion to the kernel src pat=
h
> +        # in order to avoid conflicts with virtual/kernel
> +        e.data.setVar('KERNEL_SRC_PATH', '/usr/src/%s%s' % (new_kernel_p=
ackage_name, localversion))
> +    else:
> +        e.data.setVar('KERNEL_PACKAGE_NAME', '%s' % default_name)

Both the extra time to process this and the now (relatively) hidden
complexity and
processing the variables is a concern for me.

If layers or other handlers are changing things like the kernel source
path, I see
issues with priority and ordering. Not to mention a consistent location on =
disk.

For all these, isn't this something that update alternatives and symlinks c=
an
handle ? Maybe not update alternatives per-se, but at least an always prese=
nt
location would be handy .. regardless of what someone decides to use for
their kernel package name. Again, it's about that consistency of experience=
.

> +
> +}
> +
> +addhandler kernel_processvars_handler
> +kernel_processvars_handler[eventmask] =3D "bb.event.RecipePreFinalise"
> +
> +
>  python __anonymous () {
>      kerneltype =3D d.getVar('KERNEL_IMAGETYPE', True)
>      if kerneltype =3D=3D 'uImage':
> @@ -33,9 +65,9 @@ python __anonymous () {
>
>  inherit kernel-arch deploy
>
> -PACKAGES_DYNAMIC +=3D "^kernel-module-.*"
> -PACKAGES_DYNAMIC +=3D "^kernel-image-.*"
> -PACKAGES_DYNAMIC +=3D "^kernel-firmware-.*"
> +PACKAGES_DYNAMIC +=3D "^${KERNEL_PACKAGE_NAME}-module-.*"
> +PACKAGES_DYNAMIC +=3D "^${KERNEL_PACKAGE_NAME}-image-.*"
> +PACKAGES_DYNAMIC +=3D "^${KERNEL_PACKAGE_NAME}-firmware-.*"
>
>  export OS =3D "${TARGET_OS}"
>  export CROSS_COMPILE =3D "${TARGET_PREFIX}"
> @@ -344,27 +376,27 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
>
>  # kernel-base becomes kernel-${KERNEL_VERSION}
>  # kernel-image becomes kernel-image-${KERNEL_VERISON}
> -PACKAGES =3D "kernel kernel-base kernel-vmlinux kernel-image kernel-dev =
kernel-modules"
> +PACKAGES =3D "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNE=
L_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}=
-dev ${KERNEL_PACKAGE_NAME}-modules"
>  FILES_${PN} =3D ""
> -FILES_kernel-base =3D "/lib/modules/${KERNEL_VERSION}/modules.order /lib=
/modules/${KERNEL_VERSION}/modules.builtin"
> -FILES_kernel-image =3D "/boot/${KERNEL_IMAGETYPE}*"
> -FILES_kernel-dev =3D "/boot/System.map* /boot/Module.symvers* /boot/conf=
ig* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
> -FILES_kernel-vmlinux =3D "/boot/vmlinux*"
> -FILES_kernel-modules =3D ""
> -RDEPENDS_kernel =3D "kernel-base"
> +FILES_${KERNEL_PACKAGE_NAME}-base =3D "/lib/modules/${KERNEL_VERSION}/mo=
dules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
> +FILES_${KERNEL_PACKAGE_NAME}-image =3D "/boot/${KERNEL_IMAGETYPE}*"
> +FILES_${KERNEL_PACKAGE_NAME}-dev =3D "/boot/System.map* /boot/Module.sym=
vers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build=
"
> +FILES_${KERNEL_PACKAGE_NAME}-vmlinux =3D "/boot/vmlinux*"
> +FILES_${KERNEL_PACKAGE_NAME}-modules =3D ""
> +RDEPENDS_${KERNEL_PACKAGE_NAME} =3D "${KERNEL_PACKAGE_NAME}-base"
>  # Allow machines to override this dependency if kernel image files are
>  # not wanted in images as standard
> -RDEPENDS_kernel-base ?=3D "kernel-image"
> -PKG_kernel-image =3D "kernel-image-${@legitimize_package_name('${KERNEL_=
VERSION}')}"
> -PKG_kernel-base =3D "kernel-${@legitimize_package_name('${KERNEL_VERSION=
}')}"
> -RPROVIDES_kernel-base +=3D "kernel-${KERNEL_VERSION}"
> -ALLOW_EMPTY_kernel =3D "1"
> -ALLOW_EMPTY_kernel-base =3D "1"
> -ALLOW_EMPTY_kernel-image =3D "1"
> -ALLOW_EMPTY_kernel-modules =3D "1"
> -DESCRIPTION_kernel-modules =3D "Kernel modules meta package"
> -
> -pkg_postinst_kernel-base () {
> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?=3D "${KERNEL_PACKAGE_NAME}-image"
> +PKG_${KERNEL_PACKAGE_NAME}-image =3D "${KERNEL_PACKAGE_NAME}-image-${@le=
gitimize_package_name('${KERNEL_VERSION}')}"
> +PKG_${KERNEL_PACKAGE_NAME}-base =3D "${KERNEL_PACKAGE_NAME}-${@legitimiz=
e_package_name('${KERNEL_VERSION}')}"
> +RPROVIDES_${KERNEL_PACKAGE_NAME}-base +=3D "${KERNEL_PACKAGE_NAME}-${KER=
NEL_VERSION}"
> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME} =3D "1"
> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-base =3D "1"
> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-image =3D "1"
> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-modules =3D "1"
> +DESCRIPTION_${KERNEL_PACKAGE_NAME}-modules =3D "Kernel modules meta pack=
age"
> +
> +pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {
>         if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
>                 mkdir -p $D/lib/modules/${KERNEL_VERSION}
>         fi
> @@ -375,18 +407,19 @@ pkg_postinst_kernel-base () {
>         fi
>  }
>
> -pkg_postinst_kernel-image () {
> +pkg_postinst_${KERNEL_PACKAGE_NAME}-image () {
>         update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGE=
TYPE} ${KERNEL_IMAGETYPE} /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL=
_VERSION} ${KERNEL_PRIORITY} || true
>  }
>
> -pkg_postrm_kernel-image () {
> +pkg_postrm_${KERNEL_PACKAGE_NAME}-image () {
>         update-alternatives --remove ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETY=
PE}-${KERNEL_VERSION} || true
>  }
>
>  PACKAGESPLITFUNCS_prepend =3D "split_kernel_packages "
>
>  python split_kernel_packages () {
> -    do_split_packages(d, root=3D'/lib/firmware', file_regex=3D'^(.*)\.(b=
in|fw|cis|dsp)$', output_pattern=3D'kernel-firmware-%s', description=3D'Fir=
mware for %s', recursive=3DTrue, extra_depends=3D'')
> +    kernel_package_name =3D d.getVar('KERNEL_PACKAGE_NAME', True)
> +    do_split_packages(d, root=3D'/lib/firmware', file_regex=3D'^(.*)\.(b=
in|fw|cis|dsp)$', output_pattern=3Dkernel_package_name + '-firmware-%s', de=
scription=3D'Firmware for %s', recursive=3DTrue, extra_depends=3D'')
>  }
>
>  do_strip() {
> @@ -436,15 +469,15 @@ do_sizecheck[dirs] =3D "${B}"
>
>  addtask sizecheck before do_install after do_strip
>
> -KERNEL_IMAGE_BASE_NAME ?=3D "${KERNEL_IMAGETYPE}-${PKGE}-${PKGV}-${PKGR}=
-${MACHINE}-${DATETIME}"
> +KERNEL_IMAGE_BASE_NAME ?=3D "${KERNEL_IMAGETYPE}-${KERNEL_PACKAGE_NAME}-=
${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
>  # Don't include the DATETIME variable in the sstate package signatures
>  KERNEL_IMAGE_BASE_NAME[vardepsexclude] =3D "DATETIME"
> -KERNEL_IMAGE_SYMLINK_NAME ?=3D "${KERNEL_IMAGETYPE}-${MACHINE}"
> -MODULE_IMAGE_BASE_NAME ?=3D "modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-=
${DATETIME}"
> +KERNEL_IMAGE_SYMLINK_NAME ?=3D "${KERNEL_IMAGETYPE}-${KERNEL_PACKAGE_NAM=
E}-${MACHINE}"

We've now change the symlink that has previously been in place to something
new, i.e. there's no compatibility, we always have "kernel" or whatever the
recipes decide to call it in the symlink name and that wasn't the case befo=
re
(unless I'm misreading things).

Bruce

> +MODULE_IMAGE_BASE_NAME ?=3D "${KERNEL_PACKAGE_NAME}-modules-${PKGE}-${PK=
GV}-${PKGR}-${MACHINE}-${DATETIME}"
>  MODULE_IMAGE_BASE_NAME[vardepsexclude] =3D "DATETIME"
>  MODULE_TARBALL_BASE_NAME ?=3D "${MODULE_IMAGE_BASE_NAME}.tgz"
>  # Don't include the DATETIME variable in the sstate package signatures
> -MODULE_TARBALL_SYMLINK_NAME ?=3D "modules-${MACHINE}.tgz"
> +MODULE_TARBALL_SYMLINK_NAME ?=3D "${KERNEL_PACKAGE_NAME}-modules-${MACHI=
NE}.tgz"
>  MODULE_TARBALL_DEPLOY ?=3D "1"
>
>  do_uboot_mkimage() {
> @@ -481,7 +514,7 @@ kernel_do_deploy() {
>         fi
>
>         ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGE_=
SYMLINK_NAME}.bin
> -       ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGET=
YPE}
> +       ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGET=
YPE}-${KERNEL_PACKAGE_NAME}
>
>         cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/READM=
E_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
>
> diff --git a/meta/classes/linux-kernel-base.bbclass b/meta/classes/linux-=
kernel-base.bbclass
> index 4f2b0a4..91656c0 100644
> --- a/meta/classes/linux-kernel-base.bbclass
> +++ b/meta/classes/linux-kernel-base.bbclass
> @@ -25,8 +25,10 @@ def get_kernelversion(p):
>      return None
>
>  def linux_module_packages(s, d):
> +       kernel_package_name =3D d.getVar('KERNEL_PACKAGE_NAME')
> +
>         suffix =3D ""
> -       return " ".join(map(lambda s: "kernel-module-%s%s" % (s.lower().r=
eplace('_', '-').replace('@', '+'), suffix), s.split()))
> +       return " ".join(map(lambda s: "%s-module-%s%s" % (kernel_package_=
name, s.lower().replace('_', '-').replace('@', '+'), suffix), s.split()))
>
>  # that's all
>
> diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclas=
s
> index eea2fd5..550d47e 100644
> --- a/meta/classes/multilib.bbclass
> +++ b/meta/classes/multilib.bbclass
> @@ -117,14 +117,15 @@ PACKAGEFUNCS_append =3D " do_package_qa_multilib"
>  python do_package_qa_multilib() {
>
>      def check_mlprefix(pkg, var, mlprefix):
> +        kernel_package_name =3D d.getVar('KERNEL_PACKAGE_NAME')
>          values =3D bb.utils.explode_deps(d.getVar('%s_%s' % (var, pkg), =
True) or d.getVar(var, True) or "")
>          candidates =3D []
>          for i in values:
>              if i.startswith('virtual/'):
>                  i =3D i[len('virtual/'):]
> -            if (not i.startswith('kernel-module')) and (not i.startswith=
(mlprefix)) and \
> +            if (not i.startswith('%s-module' % kernel_package_name)) and=
 (not i.startswith(mlprefix)) and \
>                  (not 'cross-canadian' in i) and (not i.startswith("nativ=
esdk-")) and \
> -                (not i.startswith("rtld")) and (not i.startswith('kernel=
-vmlinux')):
> +                (not i.startswith("rtld")) and (not i.startswith('%s-vml=
inux' % kernel_package_name)):
>                  candidates.append(i)
>          if len(candidates) > 0:
>              bb.warn("Multilib QA Issue: %s package %s - suspicious value=
s '%s' in %s"
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 96d7fd9..b1e0543 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1301,11 +1301,12 @@ python package_do_filedeps() {
>      def chunks(files, n):
>          return [files[i:i+n] for i in range(0, len(files), n)]
>
> +    kernel_package_name =3D d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
>      pkglist =3D []
>      for pkg in packages.split():
>          if d.getVar('SKIP_FILEDEPS_' + pkg, True) =3D=3D '1':
>              continue
> -        if pkg.endswith('-dbg') or pkg.endswith('-doc') or pkg.find('-lo=
cale-') !=3D -1 or pkg.find('-localedata-') !=3D -1 or pkg.find('-gconv-') =
!=3D -1 or pkg.find('-charmap-') !=3D -1 or pkg.startswith('kernel-module-'=
):
> +        if pkg.endswith('-dbg') or pkg.endswith('-doc') or pkg.find('-lo=
cale-') !=3D -1 or pkg.find('-localedata-') !=3D -1 or pkg.find('-gconv-') =
!=3D -1 or pkg.find('-charmap-') !=3D -1 or pkg.startswith('%s-module-' % k=
ernel_package_name):
>              continue
>          for files in chunks(pkgfiles[pkg], 100):
>              pkglist.append((pkg, files, rpmdeps, pkgdest))
> --
> 2.3.0
>
>
>
>
>
> From d2620d154047e1b8db4fa93d1911c2d690a3f1e2 Mon Sep 17 00:00:00 2001
> From: Sergey 'Jin' Bostandzhyan <jin at mediatomb dot cc>
> Date: Mon, 13 Apr 2015 15:52:44 +0200
> Subject: [PATCH 2/2] allow to mark a kernel package as "additional"
>
> Introduce a KERNEL_PACKAGE_ADDITIONAL variable with allowed values of 0
> or 1 which will remove the virtual/kernel PROVIDES from the package.
> This allows to generate kernel packages that are treated as regular
> packages by the package manager, making it possible to install multiple
> kernels in the rootfs as long as their names do not clash.
> ---
>  meta/classes/kernel.bbclass | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index c7c6c3e..27eadf2 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -1,6 +1,5 @@
>  inherit linux-kernel-base kernel-module-split
>
> -PROVIDES +=3D "virtual/kernel"
>  DEPENDS +=3D "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}g=
cc kmod-native depmodwrapper-cross bc-native"
>
>  # we include gcc above, we dont need virtual/libc
> @@ -12,6 +11,9 @@ KERNEL_PACKAGE_NAME =3D ""
>  # adds a suffix to the kernel name, allowing to change the naming scheme=
 of
>  # the kernel packages, result will be "kernel-${KERNEL_PACKAGE_EXTRA_NAM=
E}"
>  KERNEL_PACKAGE_EXTRA_NAME ?=3D ""
> +# indicates that this is an additional kernel package which can be insta=
lled
> +# and uninstalled without a dependency to the image itself
> +KERNEL_PACKAGE_ADDITIONAL ?=3D "0"
>
>  KERNEL_IMAGETYPE ?=3D "zImage"
>  INITRAMFS_IMAGE ?=3D ""
> @@ -37,6 +39,10 @@ python kernel_processvars_handler () {
>      else:
>          e.data.setVar('KERNEL_PACKAGE_NAME', '%s' % default_name)
>
> +    if e.data.getVar('KERNEL_PACKAGE_ADDITIONAL', True) !=3D '1':
> +        provides =3D e.data.getVar("PROVIDES", True)
> +        provides =3D "%s virtual/kernel" % provides
> +        e.data.setVar('PROVIDES', provides)
>  }
>
>  addhandler kernel_processvars_handler
> --
> 2.3.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

