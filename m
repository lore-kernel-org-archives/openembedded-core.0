Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 995F06E665
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 20:02:44 +0000 (UTC)
Received: by vkca188 with SMTP id a188so162371043vkc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 12:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=e6Ymm6NYzKYDrMsIWP8Xcp+U306CRRCxNrs1Qe2iNUI=;
	b=qlTMHY7Cy0Qsic4VS3s7iKhHLw3uWWCzKKJFZfpi//6wBOkSTn4Xq9RAt6+gvUwVcQ
	ulF5HhWxA7feHJWCz2WJgO06jvdYftKQMCQQDtPRiRPM1bpuIJue6n1tAD9BQMFtBIH3
	aUVWZp5hwWYi2zU/CqOwbY4gMnuyV/rx7Sr0Afy5UwGwWVf1Ze9baxuraoh6NL1JWAl5
	Nw4AWISIbTZZVlHXpfeaP+KLXMJ3Ys+5e9jHuWNv/CYD1naEcUPddosiJ+Ec0a/bXYtK
	kVSY5KX/PXHPcgzLXksvhbGhQEMm03sP+FEsROFLTouBL5WdBmPkXmOjGW4wzPdWLkNb
	zLEg==
MIME-Version: 1.0
X-Received: by 10.31.192.12 with SMTP id q12mr26315073vkf.96.1450123364820;
	Mon, 14 Dec 2015 12:02:44 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Mon, 14 Dec 2015 12:02:44 -0800 (PST)
In-Reply-To: <CADkTA4OFzBpvo_fSnf-0h85erobO=DY4cJcc05+=Gg+Ua9xHyQ@mail.gmail.com>
References: <1450119998-2912-1-git-send-email-haris.okanovic@ni.com>
	<CADkTA4OFzBpvo_fSnf-0h85erobO=DY4cJcc05+=Gg+Ua9xHyQ@mail.gmail.com>
Date: Mon, 14 Dec 2015 15:02:44 -0500
Message-ID: <CADkTA4PoDAgiJ2kdpT9HBnWLfGG-spLmSnF66BP33z520ig6wA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Haris Okanovic <haris.okanovic@ni.com>
Cc: Gratian Crisan <gratian.crisan@ni.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Mon, 14 Dec 2015 20:02:49 -0000
Content-Type: multipart/alternative; boundary=001a114394260a6dc00526e128ca

--001a114394260a6dc00526e128ca
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 14, 2015 at 2:17 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Mon, Dec 14, 2015 at 2:06 PM, Haris Okanovic <haris.okanovic@ni.com>
> wrote:
>
>> From: Gratian Crisan <gratian.crisan@ni.com>
>>
>> Templetize kernel package name:
>>
>> Add a "weak" variable KERNEL_PACKAGE_NAME used as the base name for kernel
>> packages. It defaults to the old hard-coded name 'kernel' but it can be
>> redefined by recipes that provide additional kernel packages in order
>> to avoid build conflicts.
>>
>> Change hard-coded 'kernel' references to KERNEL_PACKAGE_NAME in
>> kernel bbclass-es.
>>
>> Build alternate kernels from WORKDIR instead of STAGING_KERNEL_DIR:
>>
>> Prior to this change, kernel recipes would all fetch source to
>> STAGING_KERNEL_DIR as defined by bitbake/distro confs. This broke
>> parallel builds when more than one kernel recipes are defined in
>> the distribution, since they all attempted to fetch() and patch()
>> in a shared source dir.
>>
>> With this change, alternate kernel recipes fetch source into their
>> ${WORKDIR} so that they may build in parallel to each other and the
>> default kernel recipe, which still fetches to STAGING_KERNEL_DIR.
>>
>
>
> But what's the system level use case for this capability ? Honestly, it
> just
> looks complicated .. and I'm not seeing exactly multiple kernels are being
> built in parallel in a single build. We've been forcing everything
> explicitly
> to be in a single, shared location .. and I see that this is both
> complicating
> and a possible source of errors.
>
> It's probably that I'm just misunderstanding the point of the change.
>
> If I had to guess, you are building recovery, or kexec/kdump kernels along
> side the main kernel ?
>

Aha. I see the debug kernel reference in the comments (as one example).

As a follow up. If these kernel's are building via kernel.bbclass, how are
you
avoiding the artifacts all ending up in STAGING_KERNEL_BUILDDIR ? I did
a quick scan, and couldn't see if it was being considered.

Bruce


>
> Cheers,
>
> Bruce
>
>
>>
>> Testing:
>>
>> Built linux-yocto-4.1.13 for qemux86 and verified it produced kernel
>> image and modules packages. Added kernel recipe with non-default
>> KERNEL_PACKAGE_NAME and verified it produces kernel image and modules
>> packages with alternate name next to default kernel.
>>
>> Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
>> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
>> Coauthored-by: Haris Okanovic <haris.okanovic@ni.com>
>> Coauthored-by: Josh Hernstrom <josh.hernstrom@ni.com>
>> Natinst-ReviewBoard-ID: 120348
>> Natinst-ReviewBoard-ID: 120447
>> ---
>>  meta/classes/kernel-module-split.bbclass |  9 ++--
>>  meta/classes/kernel.bbclass              | 71
>> ++++++++++++++++++--------------
>>  meta/conf/documentation.conf             |  1 +
>>  meta/recipes-kernel/linux/linux-dtb.inc  |  2 +-
>>  4 files changed, 49 insertions(+), 34 deletions(-)
>>
>> diff --git a/meta/classes/kernel-module-split.bbclass
>> b/meta/classes/kernel-module-split.bbclass
>> index e1a70e6..7415ec8 100644
>> --- a/meta/classes/kernel-module-split.bbclass
>> +++ b/meta/classes/kernel-module-split.bbclass
>> @@ -28,7 +28,7 @@ do_install_append() {
>>
>>  PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
>>
>> -KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
>> +KERNEL_MODULES_META_PACKAGE ?= "${KERNEL_PACKAGE_NAME}-modules"
>>
>>  python split_kernel_module_packages () {
>>      import re
>> @@ -179,14 +179,17 @@ python split_kernel_module_packages () {
>>          # Avoid automatic -dev recommendations for modules ending with
>> -dev.
>>          d.setVarFlag('RRECOMMENDS_' + pkg, 'nodeprrecs', 1)
>>
>> +    kernel_package_name = d.getVar("KERNEL_PACKAGE_NAME", True)
>> +    kernel_version = d.getVar("KERNEL_VERSION", True)
>> +
>>      module_deps = parse_depmod()
>>      module_regex = '^(.*)\.k?o$'
>> -    module_pattern = 'kernel-module-%s'
>> +    module_pattern = '%s-module-%%s' % kernel_package_name
>>
>>      postinst = d.getVar('pkg_postinst_modules', True)
>>      postrm = d.getVar('pkg_postrm_modules', True)
>>
>> -    modules = do_split_packages(d, root='/lib/modules',
>> file_regex=module_regex, output_pattern=module_pattern, description='%s
>> kernel module', postinst=postinst, postrm=postrm, recursive=True,
>> hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION",
>> True)))
>> +    modules = do_split_packages(d, root='/lib/modules',
>> file_regex=module_regex, output_pattern=module_pattern, description='%s
>> kernel module', postinst=postinst, postrm=postrm, recursive=True,
>> hook=frob_metadata, extra_depends='%s-%s' % (kernel_package_name,
>> kernel_version))
>>      if modules:
>>          metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE', True)
>>          d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index b75a462..cc27364 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -3,7 +3,6 @@ inherit linux-kernel-base kernel-module-split
>>  PROVIDES += "virtual/kernel"
>>  DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc
>> kmod-native depmodwrapper-cross bc-native"
>>
>> -S = "${STAGING_KERNEL_DIR}"
>>  B = "${WORKDIR}/build"
>>  KBUILD_OUTPUT = "${B}"
>>  OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"
>> @@ -11,6 +10,7 @@ OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"
>>  # we include gcc above, we dont need virtual/libc
>>  INHIBIT_DEFAULT_DEPS = "1"
>>
>> +KERNEL_PACKAGE_NAME ??= "kernel"
>>  KERNEL_IMAGETYPE ?= "zImage"
>>  INITRAMFS_IMAGE ?= ""
>>  INITRAMFS_TASK ?= ""
>> @@ -34,6 +34,17 @@ python __anonymous () {
>>      image_task = d.getVar('INITRAMFS_TASK', True)
>>      if image_task:
>>          d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
>> +
>> +    # The default kernel recipe fetches it's source to
>> +    # STAGING_KERNEL_DIR as defined by bitbake/distro confs.
>> +    # Alternate kernel recipes (E.g. debug kernels) fetch source into
>> +    # their work dir so that they may build in parallel.
>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel":
>> +        d.setVar("S", d.getVar("STAGING_KERNEL_DIR", True))
>> +    else:
>> +        workdir = d.getVar("WORKDIR", True)
>> +        kernelSourceDir = os.path.join(workdir, 'kernel-source')
>> +        d.setVar("S", kernelSourceDir)
>>  }
>>
>>  # Here we pull in all various kernel image types which we support.
>> @@ -79,9 +90,9 @@ base_do_unpack_append () {
>>
>>  inherit kernel-arch deploy
>>
>> -PACKAGES_DYNAMIC += "^kernel-module-.*"
>> -PACKAGES_DYNAMIC += "^kernel-image-.*"
>> -PACKAGES_DYNAMIC += "^kernel-firmware-.*"
>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-module-.*"
>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-image-.*"
>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-firmware-.*"
>>
>>  export OS = "${TARGET_OS}"
>>  export CROSS_COMPILE = "${TARGET_PREFIX}"
>> @@ -270,9 +281,9 @@ do_shared_workdir_setscene () {
>>
>>  emit_depmod_pkgdata() {
>>         # Stash data for depmod
>> -       install -d ${PKGDESTWORK}/kernel-depmod/
>> -       echo "${KERNEL_VERSION}" >
>> ${PKGDESTWORK}/kernel-depmod/kernel-abiversion
>> -       cp ${B}/System.map
>> ${PKGDESTWORK}/kernel-depmod/System.map-${KERNEL_VERSION}
>> +       install -d ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/
>> +       echo "${KERNEL_VERSION}" >
>> ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/${KERNEL_PACKAGE_NAME}-abiversion
>> +       cp ${B}/System.map
>> ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/System.map-${KERNEL_VERSION}
>>  }
>>
>>  PACKAGEFUNCS += "emit_depmod_pkgdata"
>> @@ -287,7 +298,7 @@ do_shared_workdir () {
>>         # Store the kernel version in sysroots for module-base.bbclass
>>         #
>>
>> -       echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
>> +       echo "${KERNEL_VERSION}" >
>> $kerneldir/${KERNEL_PACKAGE_NAME}-abiversion
>>
>>         # Copy files required for module builds
>>         cp System.map $kerneldir/System.map-${KERNEL_VERSION}
>> @@ -361,28 +372,28 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
>>
>>  # kernel-base becomes kernel-${KERNEL_VERSION}
>>  # kernel-image becomes kernel-image-${KERNEL_VERISON}
>> -PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev
>> kernel-modules"
>> +PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base
>> ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
>> ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules"
>>  FILES_${PN} = ""
>> -FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order
>> /lib/modules/${KERNEL_VERSION}/modules.builtin"
>> -FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
>> -FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers*
>> /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
>> -FILES_kernel-vmlinux = "/boot/vmlinux*"
>> -FILES_kernel-modules = ""
>> -RDEPENDS_kernel = "kernel-base"
>> +FILES_${KERNEL_PACKAGE_NAME}-base =
>> "/lib/modules/${KERNEL_VERSION}/modules.order
>> /lib/modules/${KERNEL_VERSION}/modules.builtin"
>> +FILES_${KERNEL_PACKAGE_NAME}-image = "/boot/${KERNEL_IMAGETYPE}*"
>> +FILES_${KERNEL_PACKAGE_NAME}-dev = "/boot/System.map*
>> /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}
>> /lib/modules/${KERNEL_VERSION}/build"
>> +FILES_${KERNEL_PACKAGE_NAME}-vmlinux = "/boot/vmlinux*"
>> +FILES_${KERNEL_PACKAGE_NAME}-modules = ""
>> +RDEPENDS_${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base"
>>  # Allow machines to override this dependency if kernel image files are
>>  # not wanted in images as standard
>> -RDEPENDS_kernel-base ?= "kernel-image"
>> -PKG_kernel-image =
>> "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
>> -RDEPENDS_kernel-image += "${@base_conditional('KERNEL_IMAGETYPE',
>> 'vmlinux', 'kernel-vmlinux', '', d)}"
>> -PKG_kernel-base =
>> "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
>> -RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
>> -ALLOW_EMPTY_kernel = "1"
>> -ALLOW_EMPTY_kernel-base = "1"
>> -ALLOW_EMPTY_kernel-image = "1"
>> -ALLOW_EMPTY_kernel-modules = "1"
>> -DESCRIPTION_kernel-modules = "Kernel modules meta package"
>> -
>> -pkg_postinst_kernel-base () {
>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image"
>> +PKG_${KERNEL_PACKAGE_NAME}-image =
>> "${KERNEL_PACKAGE_NAME}-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-image +=
>> "${@base_conditional('KERNEL_IMAGETYPE', 'vmlinux',
>> '${KERNEL_PACKAGE_NAME}-vmlinux', '', d)}"
>> +PKG_${KERNEL_PACKAGE_NAME}-base =
>> "${KERNEL_PACKAGE_NAME}-${@legitimize_package_name('${KERNEL_VERSION}')}"
>> +RPROVIDES_${KERNEL_PACKAGE_NAME}-base +=
>> "${KERNEL_PACKAGE_NAME}-${KERNEL_VERSION}"
>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME} = "1"
>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-base = "1"
>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-image = "1"
>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-modules = "1"
>> +DESCRIPTION_${KERNEL_PACKAGE_NAME}-modules = "Kernel modules meta
>> package"
>> +
>> +pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {
>>         if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
>>                 mkdir -p $D/lib/modules/${KERNEL_VERSION}
>>         fi
>> @@ -393,18 +404,18 @@ pkg_postinst_kernel-base () {
>>         fi
>>  }
>>
>> -pkg_postinst_kernel-image () {
>> +pkg_postinst_${KERNEL_PACKAGE_NAME}-image () {
>>         update-alternatives --install
>> /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}
>> /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
>> ${KERNEL_PRIORITY} || true
>>  }
>>
>> -pkg_postrm_kernel-image () {
>> +pkg_postrm_${KERNEL_PACKAGE_NAME}-image () {
>>         update-alternatives --remove ${KERNEL_IMAGETYPE}
>> ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
>>  }
>>
>>  PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
>>
>>  python split_kernel_packages () {
>> -    do_split_packages(d, root='/lib/firmware',
>> file_regex='^(.*)\.(bin|fw|cis|dsp)$', output_pattern='kernel-firmware-%s',
>> description='Firmware for %s', recursive=True, extra_depends='')
>> +    do_split_packages(d, root='/lib/firmware',
>> file_regex='^(.*)\.(bin|fw|cis|dsp)$',
>> output_pattern='${KERNEL_PACKAGE_NAME}-firmware-%s', description='Firmware
>> for %s', recursive=True, extra_depends='')
>>  }
>>
>>  do_strip() {
>> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
>> index 1b5c071..fb5e03f 100644
>> --- a/meta/conf/documentation.conf
>> +++ b/meta/conf/documentation.conf
>> @@ -250,6 +250,7 @@ KERNEL_FEATURES[doc] = "Includes additional metadata
>> from the Yocto Project kern
>>  KERNEL_IMAGETYPE[doc] = "The type of kernel to build for a device,
>> usually set by the machine configuration files and defaults to 'zImage'."
>>  KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that need to be
>> auto-loaded during boot"
>>  KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which the build
>> system expects to find module_conf_* values that specify configuration for
>> each of the modules"
>> +KERNEL_PACKAGE_NAME[doc] = "Name prefix for kernel packages. Defaults to
>> 'kernel'."
>>  KERNEL_PATH[doc] = "The location of the kernel sources. This variable is
>> set to the value of the STAGING_KERNEL_DIR within the module class
>> (module.bbclass)."
>>  KERNEL_SRC[doc] = "The location of the kernel sources. This variable is
>> set to the value of the STAGING_KERNEL_DIR within the module class
>> (module.bbclass)."
>>  KFEATURE_DESCRIPTION[doc] = "Provides a short description of a
>> configuration fragment. You use this variable in the .scc file that
>> describes a configuration fragment file."
>> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
>> b/meta/recipes-kernel/linux/linux-dtb.inc
>> index 772adcb..c27a3cb 100644
>> --- a/meta/recipes-kernel/linux/linux-dtb.inc
>> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
>> @@ -2,7 +2,7 @@
>>  FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/devicetree*"
>>
>>  python __anonymous () {
>> -    d.appendVar("PACKAGES", " kernel-devicetree")
>> +    d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-devicetree")
>>  }
>>
>>  normalize_dtb () {
>> --
>> 2.6.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114394260a6dc00526e128ca
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Dec 14, 2015 at 2:17 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<=
a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote"><span class=3D"">On Mon, Dec 14, 2015 at 2:06 PM, Haris Ok=
anovic <span dir=3D"ltr">&lt;<a href=3D"mailto:haris.okanovic@ni.com" targe=
t=3D"_blank">haris.okanovic@ni.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">From: Gratian Crisan &lt;<a href=3D"mail=
to:gratian.crisan@ni.com" target=3D"_blank">gratian.crisan@ni.com</a>&gt;<b=
r>
<br>
Templetize kernel package name:<br>
<br>
Add a &quot;weak&quot; variable KERNEL_PACKAGE_NAME used as the base name f=
or kernel<br>
packages. It defaults to the old hard-coded name &#39;kernel&#39; but it ca=
n be<br>
redefined by recipes that provide additional kernel packages in order<br>
to avoid build conflicts.<br>
<br>
Change hard-coded &#39;kernel&#39; references to KERNEL_PACKAGE_NAME in<br>
kernel bbclass-es.<br>
<br>
Build alternate kernels from WORKDIR instead of STAGING_KERNEL_DIR:<br>
<br>
Prior to this change, kernel recipes would all fetch source to<br>
STAGING_KERNEL_DIR as defined by bitbake/distro confs. This broke<br>
parallel builds when more than one kernel recipes are defined in<br>
the distribution, since they all attempted to fetch() and patch()<br>
in a shared source dir.<br>
<br>
With this change, alternate kernel recipes fetch source into their<br>
${WORKDIR} so that they may build in parallel to each other and the<br>
default kernel recipe, which still fetches to STAGING_KERNEL_DIR.<br></bloc=
kquote><div><br><br></div></span><div>But what&#39;s the system level use c=
ase for this capability ? Honestly, it just<br></div><div>looks complicated=
 .. and I&#39;m not seeing exactly multiple kernels are being<br></div><div=
>built in parallel in a single build. We&#39;ve been forcing everything exp=
licitly<br></div><div>to be in a single, shared location .. and I see that =
this is both complicating<br></div><div>and a possible source of errors.<br=
><br></div><div>It&#39;s probably that I&#39;m just misunderstanding the po=
int of the change.<br><br></div><div>If I had to guess, you are building re=
covery, or kexec/kdump kernels along<br></div><div>side the main kernel ?<b=
r></div></div></div></div></blockquote><div><br></div><div>Aha. I see the d=
ebug kernel reference in the comments (as one example).<br><br></div><div>A=
s a follow up. If these kernel&#39;s are building via kernel.bbclass, how a=
re you<br></div><div>avoiding the artifacts all ending up in STAGING_KERNEL=
_BUILDDIR ? I did<br></div><div>a quick scan, and couldn&#39;t see if it wa=
s being considered.<br><br></div><div>Bruce<br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D=
"gmail_extra"><div class=3D"gmail_quote"><div></div><div><br></div><div>Che=
ers,<br><br></div><div>Bruce<br></div><div><div class=3D"h5"><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Testing:<br>
<br>
Built linux-yocto-4.1.13 for qemux86 and verified it produced kernel<br>
image and modules packages. Added kernel recipe with non-default<br>
KERNEL_PACKAGE_NAME and verified it produces kernel image and modules<br>
packages with alternate name next to default kernel.<br>
<br>
Signed-off-by: Gratian Crisan &lt;<a href=3D"mailto:gratian.crisan@ni.com" =
target=3D"_blank">gratian.crisan@ni.com</a>&gt;<br>
Signed-off-by: Haris Okanovic &lt;<a href=3D"mailto:haris.okanovic@ni.com" =
target=3D"_blank">haris.okanovic@ni.com</a>&gt;<br>
Coauthored-by: Haris Okanovic &lt;<a href=3D"mailto:haris.okanovic@ni.com" =
target=3D"_blank">haris.okanovic@ni.com</a>&gt;<br>
Coauthored-by: Josh Hernstrom &lt;<a href=3D"mailto:josh.hernstrom@ni.com" =
target=3D"_blank">josh.hernstrom@ni.com</a>&gt;<br>
Natinst-ReviewBoard-ID: 120348<br>
Natinst-ReviewBoard-ID: 120447<br>
---<br>
=C2=A0meta/classes/kernel-module-split.bbclass |=C2=A0 9 ++--<br>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 71 ++++++++++++++++++--------------<br>
=C2=A0meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 1 +<br>
=C2=A0meta/recipes-kernel/linux/linux-dtb.inc=C2=A0 |=C2=A0 2 +-<br>
=C2=A04 files changed, 49 insertions(+), 34 deletions(-)<br>
<br>
diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel=
-module-split.bbclass<br>
index e1a70e6..7415ec8 100644<br>
--- a/meta/classes/kernel-module-split.bbclass<br>
+++ b/meta/classes/kernel-module-split.bbclass<br>
@@ -28,7 +28,7 @@ do_install_append() {<br>
<br>
=C2=A0PACKAGESPLITFUNCS_prepend =3D &quot;split_kernel_module_packages &quo=
t;<br>
<br>
-KERNEL_MODULES_META_PACKAGE ?=3D &quot;kernel-modules&quot;<br>
+KERNEL_MODULES_META_PACKAGE ?=3D &quot;${KERNEL_PACKAGE_NAME}-modules&quot=
;<br>
<br>
=C2=A0python split_kernel_module_packages () {<br>
=C2=A0 =C2=A0 =C2=A0import re<br>
@@ -179,14 +179,17 @@ python split_kernel_module_packages () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Avoid automatic -dev recommendations fo=
r modules ending with -dev.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVarFlag(&#39;RRECOMMENDS_&#39; + pkg=
, &#39;nodeprrecs&#39;, 1)<br>
<br>
+=C2=A0 =C2=A0 kernel_package_name =3D d.getVar(&quot;KERNEL_PACKAGE_NAME&q=
uot;, True)<br>
+=C2=A0 =C2=A0 kernel_version =3D d.getVar(&quot;KERNEL_VERSION&quot;, True=
)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0module_deps =3D parse_depmod()<br>
=C2=A0 =C2=A0 =C2=A0module_regex =3D &#39;^(.*)\.k?o$&#39;<br>
-=C2=A0 =C2=A0 module_pattern =3D &#39;kernel-module-%s&#39;<br>
+=C2=A0 =C2=A0 module_pattern =3D &#39;%s-module-%%s&#39; % kernel_package_=
name<br>
<br>
=C2=A0 =C2=A0 =C2=A0postinst =3D d.getVar(&#39;pkg_postinst_modules&#39;, T=
rue)<br>
=C2=A0 =C2=A0 =C2=A0postrm =3D d.getVar(&#39;pkg_postrm_modules&#39;, True)=
<br>
<br>
-=C2=A0 =C2=A0 modules =3D do_split_packages(d, root=3D&#39;/lib/modules&#3=
9;, file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, description=
=3D&#39;%s kernel module&#39;, postinst=3Dpostinst, postrm=3Dpostrm, recurs=
ive=3DTrue, hook=3Dfrob_metadata, extra_depends=3D&#39;kernel-%s&#39; % (d.=
getVar(&quot;KERNEL_VERSION&quot;, True)))<br>
+=C2=A0 =C2=A0 modules =3D do_split_packages(d, root=3D&#39;/lib/modules&#3=
9;, file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, description=
=3D&#39;%s kernel module&#39;, postinst=3Dpostinst, postrm=3Dpostrm, recurs=
ive=3DTrue, hook=3Dfrob_metadata, extra_depends=3D&#39;%s-%s&#39; % (kernel=
_package_name, kernel_version))<br>
=C2=A0 =C2=A0 =C2=A0if modules:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0metapkg =3D d.getVar(&#39;KERNEL_MODULES_=
META_PACKAGE&#39;, True)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVar(&#39;RDEPENDS_&#39; + metapkg=
, &#39; &#39;+&#39; &#39;.join(modules))<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index b75a462..cc27364 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -3,7 +3,6 @@ inherit linux-kernel-base kernel-module-split<br>
=C2=A0PROVIDES +=3D &quot;virtual/kernel&quot;<br>
=C2=A0DEPENDS +=3D &quot;virtual/${TARGET_PREFIX}binutils virtual/${TARGET_=
PREFIX}gcc kmod-native depmodwrapper-cross bc-native&quot;<br>
<br>
-S =3D &quot;${STAGING_KERNEL_DIR}&quot;<br>
=C2=A0B =3D &quot;${WORKDIR}/build&quot;<br>
=C2=A0KBUILD_OUTPUT =3D &quot;${B}&quot;<br>
=C2=A0OE_TERMINAL_EXPORTS +=3D &quot;KBUILD_OUTPUT&quot;<br>
@@ -11,6 +10,7 @@ OE_TERMINAL_EXPORTS +=3D &quot;KBUILD_OUTPUT&quot;<br>
=C2=A0# we include gcc above, we dont need virtual/libc<br>
=C2=A0INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
<br>
+KERNEL_PACKAGE_NAME ??=3D &quot;kernel&quot;<br>
=C2=A0KERNEL_IMAGETYPE ?=3D &quot;zImage&quot;<br>
=C2=A0INITRAMFS_IMAGE ?=3D &quot;&quot;<br>
=C2=A0INITRAMFS_TASK ?=3D &quot;&quot;<br>
@@ -34,6 +34,17 @@ python __anonymous () {<br>
=C2=A0 =C2=A0 =C2=A0image_task =3D d.getVar(&#39;INITRAMFS_TASK&#39;, True)=
<br>
=C2=A0 =C2=A0 =C2=A0if image_task:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag(&#39;do_configure&#39;, &=
#39;depends&#39;, &#39; ${INITRAMFS_TASK}&#39;)<br>
+<br>
+=C2=A0 =C2=A0 # The default kernel recipe fetches it&#39;s source to<br>
+=C2=A0 =C2=A0 # STAGING_KERNEL_DIR as defined by bitbake/distro confs.<br>
+=C2=A0 =C2=A0 # Alternate kernel recipes (E.g. debug kernels) fetch source=
 into<br>
+=C2=A0 =C2=A0 # their work dir so that they may build in parallel.<br>
+=C2=A0 =C2=A0 if d.getVar(&quot;KERNEL_PACKAGE_NAME&quot;, True) =3D=3D &q=
uot;kernel&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;S&quot;, d.getVar(&quot;STAGING=
_KERNEL_DIR&quot;, True))<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 workdir =3D d.getVar(&quot;WORKDIR&quot;, True=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernelSourceDir =3D os.path.join(workdir, &#39=
;kernel-source&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;S&quot;, kernelSourceDir)<br>
=C2=A0}<br>
<br>
=C2=A0# Here we pull in all various kernel image types which we support.<br=
>
@@ -79,9 +90,9 @@ base_do_unpack_append () {<br>
<br>
=C2=A0inherit kernel-arch deploy<br>
<br>
-PACKAGES_DYNAMIC +=3D &quot;^kernel-module-.*&quot;<br>
-PACKAGES_DYNAMIC +=3D &quot;^kernel-image-.*&quot;<br>
-PACKAGES_DYNAMIC +=3D &quot;^kernel-firmware-.*&quot;<br>
+PACKAGES_DYNAMIC +=3D &quot;^${KERNEL_PACKAGE_NAME}-module-.*&quot;<br>
+PACKAGES_DYNAMIC +=3D &quot;^${KERNEL_PACKAGE_NAME}-image-.*&quot;<br>
+PACKAGES_DYNAMIC +=3D &quot;^${KERNEL_PACKAGE_NAME}-firmware-.*&quot;<br>
<br>
=C2=A0export OS =3D &quot;${TARGET_OS}&quot;<br>
=C2=A0export CROSS_COMPILE =3D &quot;${TARGET_PREFIX}&quot;<br>
@@ -270,9 +281,9 @@ do_shared_workdir_setscene () {<br>
<br>
=C2=A0emit_depmod_pkgdata() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Stash data for depmod<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${PKGDESTWORK}/kernel-depmod/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;${KERNEL_VERSION}&quot; &gt; ${PKGDE=
STWORK}/kernel-depmod/kernel-abiversion<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${B}/System.map ${PKGDESTWORK}/kernel-depmod=
/System.map-${KERNEL_VERSION}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME=
}-depmod/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;${KERNEL_VERSION}&quot; &gt; ${PKGDE=
STWORK}/${KERNEL_PACKAGE_NAME}-depmod/${KERNEL_PACKAGE_NAME}-abiversion<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${B}/System.map ${PKGDESTWORK}/${KERNEL_PACK=
AGE_NAME}-depmod/System.map-${KERNEL_VERSION}<br>
=C2=A0}<br>
<br>
=C2=A0PACKAGEFUNCS +=3D &quot;emit_depmod_pkgdata&quot;<br>
@@ -287,7 +298,7 @@ do_shared_workdir () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Store the kernel version in sysroots for modu=
le-base.bbclass<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;${KERNEL_VERSION}&quot; &gt; $kernel=
dir/kernel-abiversion<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;${KERNEL_VERSION}&quot; &gt; $kernel=
dir/${KERNEL_PACKAGE_NAME}-abiversion<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Copy files required for module builds<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp System.map $kerneldir/System.map-${KERNEL_VE=
RSION}<br>
@@ -361,28 +372,28 @@ EXPORT_FUNCTIONS do_compile do_install do_configure<b=
r>
<br>
=C2=A0# kernel-base becomes kernel-${KERNEL_VERSION}<br>
=C2=A0# kernel-image becomes kernel-image-${KERNEL_VERISON}<br>
-PACKAGES =3D &quot;kernel kernel-base kernel-vmlinux kernel-image kernel-d=
ev kernel-modules&quot;<br>
+PACKAGES =3D &quot;${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KE=
RNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NA=
ME}-dev ${KERNEL_PACKAGE_NAME}-modules&quot;<br>
=C2=A0FILES_${PN} =3D &quot;&quot;<br>
-FILES_kernel-base =3D &quot;/lib/modules/${KERNEL_VERSION}/modules.order /=
lib/modules/${KERNEL_VERSION}/modules.builtin&quot;<br>
-FILES_kernel-image =3D &quot;/boot/${KERNEL_IMAGETYPE}*&quot;<br>
-FILES_kernel-dev =3D &quot;/boot/System.map* /boot/Module.symvers* /boot/c=
onfig* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build&quot;<br>
-FILES_kernel-vmlinux =3D &quot;/boot/vmlinux*&quot;<br>
-FILES_kernel-modules =3D &quot;&quot;<br>
-RDEPENDS_kernel =3D &quot;kernel-base&quot;<br>
+FILES_${KERNEL_PACKAGE_NAME}-base =3D &quot;/lib/modules/${KERNEL_VERSION}=
/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin&quot;<br>
+FILES_${KERNEL_PACKAGE_NAME}-image =3D &quot;/boot/${KERNEL_IMAGETYPE}*&qu=
ot;<br>
+FILES_${KERNEL_PACKAGE_NAME}-dev =3D &quot;/boot/System.map* /boot/Module.=
symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/bu=
ild&quot;<br>
+FILES_${KERNEL_PACKAGE_NAME}-vmlinux =3D &quot;/boot/vmlinux*&quot;<br>
+FILES_${KERNEL_PACKAGE_NAME}-modules =3D &quot;&quot;<br>
+RDEPENDS_${KERNEL_PACKAGE_NAME} =3D &quot;${KERNEL_PACKAGE_NAME}-base&quot=
;<br>
=C2=A0# Allow machines to override this dependency if kernel image files ar=
e<br>
=C2=A0# not wanted in images as standard<br>
-RDEPENDS_kernel-base ?=3D &quot;kernel-image&quot;<br>
-PKG_kernel-image =3D &quot;kernel-image-${@legitimize_package_name(&#39;${=
KERNEL_VERSION}&#39;)}&quot;<br>
-RDEPENDS_kernel-image +=3D &quot;${@base_conditional(&#39;KERNEL_IMAGETYPE=
&#39;, &#39;vmlinux&#39;, &#39;kernel-vmlinux&#39;, &#39;&#39;, d)}&quot;<b=
r>
-PKG_kernel-base =3D &quot;kernel-${@legitimize_package_name(&#39;${KERNEL_=
VERSION}&#39;)}&quot;<br>
-RPROVIDES_kernel-base +=3D &quot;kernel-${KERNEL_VERSION}&quot;<br>
-ALLOW_EMPTY_kernel =3D &quot;1&quot;<br>
-ALLOW_EMPTY_kernel-base =3D &quot;1&quot;<br>
-ALLOW_EMPTY_kernel-image =3D &quot;1&quot;<br>
-ALLOW_EMPTY_kernel-modules =3D &quot;1&quot;<br>
-DESCRIPTION_kernel-modules =3D &quot;Kernel modules meta package&quot;<br>
-<br>
-pkg_postinst_kernel-base () {<br>
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?=3D &quot;${KERNEL_PACKAGE_NAME}-ima=
ge&quot;<br>
+PKG_${KERNEL_PACKAGE_NAME}-image =3D &quot;${KERNEL_PACKAGE_NAME}-image-${=
@legitimize_package_name(&#39;${KERNEL_VERSION}&#39;)}&quot;<br>
+RDEPENDS_${KERNEL_PACKAGE_NAME}-image +=3D &quot;${@base_conditional(&#39;=
KERNEL_IMAGETYPE&#39;, &#39;vmlinux&#39;, &#39;${KERNEL_PACKAGE_NAME}-vmlin=
ux&#39;, &#39;&#39;, d)}&quot;<br>
+PKG_${KERNEL_PACKAGE_NAME}-base =3D &quot;${KERNEL_PACKAGE_NAME}-${@legiti=
mize_package_name(&#39;${KERNEL_VERSION}&#39;)}&quot;<br>
+RPROVIDES_${KERNEL_PACKAGE_NAME}-base +=3D &quot;${KERNEL_PACKAGE_NAME}-${=
KERNEL_VERSION}&quot;<br>
+ALLOW_EMPTY_${KERNEL_PACKAGE_NAME} =3D &quot;1&quot;<br>
+ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-base =3D &quot;1&quot;<br>
+ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-image =3D &quot;1&quot;<br>
+ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-modules =3D &quot;1&quot;<br>
+DESCRIPTION_${KERNEL_PACKAGE_NAME}-modules =3D &quot;Kernel modules meta p=
ackage&quot;<br>
+<br>
+pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ! -e &quot;$D/lib/modules/${KERNEL_VERSION=
}&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p $D/lib/mod=
ules/${KERNEL_VERSION}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
@@ -393,18 +404,18 @@ pkg_postinst_kernel-base () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
-pkg_postinst_kernel-image () {<br>
+pkg_postinst_${KERNEL_PACKAGE_NAME}-image () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 update-alternatives --install /${KERNEL_IMAGEDE=
ST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} /${KERNEL_IMAGEDEST}/${KERNEL_I=
MAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true<br>
=C2=A0}<br>
<br>
-pkg_postrm_kernel-image () {<br>
+pkg_postrm_${KERNEL_PACKAGE_NAME}-image () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 update-alternatives --remove ${KERNEL_IMAGETYPE=
} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true<br>
=C2=A0}<br>
<br>
=C2=A0PACKAGESPLITFUNCS_prepend =3D &quot;split_kernel_packages &quot;<br>
<br>
=C2=A0python split_kernel_packages () {<br>
-=C2=A0 =C2=A0 do_split_packages(d, root=3D&#39;/lib/firmware&#39;, file_re=
gex=3D&#39;^(.*)\.(bin|fw|cis|dsp)$&#39;, output_pattern=3D&#39;kernel-firm=
ware-%s&#39;, description=3D&#39;Firmware for %s&#39;, recursive=3DTrue, ex=
tra_depends=3D&#39;&#39;)<br>
+=C2=A0 =C2=A0 do_split_packages(d, root=3D&#39;/lib/firmware&#39;, file_re=
gex=3D&#39;^(.*)\.(bin|fw|cis|dsp)$&#39;, output_pattern=3D&#39;${KERNEL_PA=
CKAGE_NAME}-firmware-%s&#39;, description=3D&#39;Firmware for %s&#39;, recu=
rsive=3DTrue, extra_depends=3D&#39;&#39;)<br>
=C2=A0}<br>
<br>
=C2=A0do_strip() {<br>
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf<br=
>
index 1b5c071..fb5e03f 100644<br>
--- a/meta/conf/documentation.conf<br>
+++ b/meta/conf/documentation.conf<br>
@@ -250,6 +250,7 @@ KERNEL_FEATURES[doc] =3D &quot;Includes additional meta=
data from the Yocto Project kern<br>
=C2=A0KERNEL_IMAGETYPE[doc] =3D &quot;The type of kernel to build for a dev=
ice, usually set by the machine configuration files and defaults to &#39;zI=
mage&#39;.&quot;<br>
=C2=A0KERNEL_MODULE_AUTOLOAD[doc] =3D &quot;Lists kernel modules that need =
to be auto-loaded during boot&quot;<br>
=C2=A0KERNEL_MODULE_PROBECONF[doc] =3D &quot;Lists kernel modules for which=
 the build system expects to find module_conf_* values that specify configu=
ration for each of the modules&quot;<br>
+KERNEL_PACKAGE_NAME[doc] =3D &quot;Name prefix for kernel packages. Defaul=
ts to &#39;kernel&#39;.&quot;<br>
=C2=A0KERNEL_PATH[doc] =3D &quot;The location of the kernel sources. This v=
ariable is set to the value of the STAGING_KERNEL_DIR within the module cla=
ss (module.bbclass).&quot;<br>
=C2=A0KERNEL_SRC[doc] =3D &quot;The location of the kernel sources. This va=
riable is set to the value of the STAGING_KERNEL_DIR within the module clas=
s (module.bbclass).&quot;<br>
=C2=A0KFEATURE_DESCRIPTION[doc] =3D &quot;Provides a short description of a=
 configuration fragment. You use this variable in the .scc file that descri=
bes a configuration fragment file.&quot;<br>
diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/=
linux/linux-dtb.inc<br>
index 772adcb..c27a3cb 100644<br>
--- a/meta/recipes-kernel/linux/linux-dtb.inc<br>
+++ b/meta/recipes-kernel/linux/linux-dtb.inc<br>
@@ -2,7 +2,7 @@<br>
=C2=A0FILES_kernel-devicetree =3D &quot;/${KERNEL_IMAGEDEST}/devicetree*&qu=
ot;<br>
<br>
=C2=A0python __anonymous () {<br>
-=C2=A0 =C2=A0 d.appendVar(&quot;PACKAGES&quot;, &quot; kernel-devicetree&q=
uot;)<br>
+=C2=A0 =C2=A0 d.appendVar(&quot;PACKAGES&quot;, &quot; ${KERNEL_PACKAGE_NA=
ME}-devicetree&quot;)<br>
=C2=A0}<br>
<br>
=C2=A0normalize_dtb () {<br>
<span><font color=3D"#888888">--<br>
2.6.2<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div></div></div><span class=3D""><font color=
=3D"#888888"><br><br clear=3D"all"><br>-- <br><div>&quot;Thou shalt not fol=
low the NULL pointer, for chaos and madness await thee at its end&quot;</di=
v>
</font></span></div></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature">&quot;Thou shalt not follow the NULL pointer, for chaos and madness=
 await thee at its end&quot;</div>
</div></div>

--001a114394260a6dc00526e128ca--
