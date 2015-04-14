Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id F2EAF6E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 15:34:40 +0000 (UTC)
Received: by igbqf9 with SMTP id qf9so17700269igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 08:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=XwbfsEaMhR85OKf18g24SywHEQGINCjjVgpvht8n1SQ=;
	b=JW8fuECuFiKqcxY/meppAA6IMXdgTkXcikXknFoXbibiDbgo7zKrnSDQedh6hG3cQ1
	CP/6gsPq3eGpUuL2wd3Z0CY3QBLobryUl4eSzGuXSvDuxl6GfMqBNT1+CFu0THOFyJ8U
	WakyulnEcsQeVgy3wVv7ZBGVL5Sr6BfnZAhqb8J1tItmqSiO8NdIOkDQqX3HUMfpBNvY
	NxZFNhaYtcuvw4v8qctnXBAjZEigXPM9l/tkMlWvqllWtadkmgxX1H7D5+zXLVoX9Z4T
	R88P3MlyAGDCqbLlw2D63O4WCB863doLP3NAJnMlZcA9q+iMi6ozQditzHQFPc7HWXa+
	BqwQ==
MIME-Version: 1.0
X-Received: by 10.50.111.115 with SMTP id ih19mr24715605igb.47.1429025681189; 
	Tue, 14 Apr 2015 08:34:41 -0700 (PDT)
Received: by 10.107.158.20 with HTTP; Tue, 14 Apr 2015 08:34:41 -0700 (PDT)
In-Reply-To: <20150414094258.GF19841@deadlock.dhs.org>
References: <20150413141345.GF17921@deadlock.dhs.org>
	<CADkTA4N7CTFHgBrG5HO0XrtG6YP3YN5J5ibOx4ZnwG9bHS=0sA@mail.gmail.com>
	<20150414094258.GF19841@deadlock.dhs.org>
Date: Tue, 14 Apr 2015 11:34:41 -0400
Message-ID: <CADkTA4OAau2UL4T_AyFkgvMQAtu_0cWbqfoCUPunJ+1cz9_jEg@mail.gmail.com>
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
X-List-Received-Date: Tue, 14 Apr 2015 15:34:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2015 at 5:42 AM, Sergey 'Jin' Bostandzhyan
<jin@dev.digitalstrom.org> wrote:
> Hi Bruce,
>
> thanks for the initial feedback, I guess I'll need a bit more help/guidan=
ce,
> so I hope that others will also join the discussion.
>
> On Mon, Apr 13, 2015 at 11:31:50AM -0400, Bruce Ashfield wrote:
>> > I'd be happy to hear some feedback on this and I'm willing to tune any=
thing
>> > that might be necessary in order to get this feature merged into core.
>>
>> My big concerns are around compatibility/consistency and the wreckage
>> that changing
>> the package names will cause for the system.
>
>> I'm competent in packaging .. but not an expert, so I'm hoping that
>> Richard and folks
>> like Mark Hatle can jump in with options to allow the package managers
>> to deal with
>> this as well.
>
> +1, hoping to hear their feedback as well.
>
>> > diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/k=
ernel-module-split.bbclass
>> > index 9a95b72..dbfad01 100644
>> > --- a/meta/classes/kernel-module-split.bbclass
>> > +++ b/meta/classes/kernel-module-split.bbclass
>> > @@ -28,7 +28,7 @@ do_install_append() {
>> >
>> >  PACKAGESPLITFUNCS_prepend =3D "split_kernel_module_packages "
>> >
>> > -KERNEL_MODULES_META_PACKAGE ?=3D "kernel-modules"
>> > +KERNEL_MODULES_META_PACKAGE ?=3D "${KERNEL_PACKAGE_NAME}-modules"
>>
>> The problem that I have with this is one of wider consistency and eco
>> system layers.
>> Before, I could count on the fact that "kernel-modules" got me all the
>> built kernel
>> modules for any kernel provided by the virtual/kernel dependency. Now
>> I have to know
>> if a layer changes this variable and/or update all my package lists to
>> use this variable.
>>
>> Not impossible, but preferably something to avoid.
>
> Would it make sense to introduce some virtual/kernel-modules, similar to
> virtual/kernel?

The modules and kernel really are the same thing, and we do need the module=
s
to be provided (but packaged separately) by the same kernel, so as near as =
I
can tell, that wouldn't buy us anything and add complexity. A good thought
though.

I see that Mark just followed up as well, and probably just generating a
RPROVIDES under the old name would meet that compatibility issue.

>
> This way we would have one kernel and kernel modules provider which can a=
lways
> be referenced by a clear name.
>
>> >  python split_kernel_module_packages () {
>> >      import re
>> > @@ -178,12 +178,15 @@ python split_kernel_module_packages () {
>> >
>> >      module_deps =3D parse_depmod()
>> >      module_regex =3D '^(.*)\.k?o$'
>> > -    module_pattern =3D 'kernel-module-%s'
>> > +
>> > +    kernel_package_name =3D d.getVar('KERNEL_PACKAGE_NAME')
>> > +
>> > +    module_pattern =3D kernel_package_name + '-module-%s'
>> >
>> >      postinst =3D d.getVar('pkg_postinst_modules', True)
>> >      postrm =3D d.getVar('pkg_postrm_modules', True)
>> >
>> > -    modules =3D do_split_packages(d, root=3D'/lib/modules', file_rege=
x=3Dmodule_regex, output_pattern=3Dmodule_pattern, description=3D'%s kernel=
 module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue, hook=3Dfr=
ob_metadata, extra_depends=3D'kernel-%s' % (d.getVar("KERNEL_VERSION", True=
)))
>> > +    modules =3D do_split_packages(d, root=3D'/lib/modules', file_rege=
x=3Dmodule_regex, output_pattern=3Dmodule_pattern, description=3D'%s kernel=
 module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue, hook=3Dfr=
ob_metadata, extra_depends=3D'%s-%s' % (kernel_package_name, d.getVar("KERN=
EL_VERSION", True)))
>> >      if modules:
>> >          metapkg =3D d.getVar('KERNEL_MODULES_META_PACKAGE', True)
>> >          d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
>> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> > index 70ed95b..c7c6c3e 100644
>> > --- a/meta/classes/kernel.bbclass
>> > +++ b/meta/classes/kernel.bbclass
>> > @@ -6,11 +6,43 @@ DEPENDS +=3D "virtual/${TARGET_PREFIX}binutils virtu=
al/${TARGET_PREFIX}gcc kmod-na
>> >  # we include gcc above, we dont need virtual/libc
>> >  INHIBIT_DEFAULT_DEPS =3D "1"
>> >
>> > +
>> > +KERNEL_PACKAGE_NAME =3D ""
>>
>> You do set a default to "kernel" in the processvars routine below, but
>> what's the harm
>> in setting this to "kernel" as well ?
>
> Roger that.
>
>> > +
>> > +# adds a suffix to the kernel name, allowing to change the naming sch=
eme of
>> > +# the kernel packages, result will be "kernel-${KERNEL_PACKAGE_EXTRA_=
NAME}"
>> > +KERNEL_PACKAGE_EXTRA_NAME ?=3D ""
>> > +
>> >  KERNEL_IMAGETYPE ?=3D "zImage"
>> >  INITRAMFS_IMAGE ?=3D ""
>> >  INITRAMFS_TASK ?=3D ""
>> >  INITRAMFS_IMAGE_BUNDLE ?=3D ""
>> >
>> > +python kernel_processvars_handler () {
>> > +    extra_name =3D e.data.getVar('KERNEL_PACKAGE_EXTRA_NAME', True) o=
r ""
>> > +    default_name =3D e.data.getVar('KERNEL_PACKAGE_NAME', True) or "k=
ernel"
>> > +    if extra_name !=3D "":
>> > +        new_kernel_package_name =3D '%s-%s' % (default_name, extra_na=
me)
>> > +        e.data.setVar('KERNEL_PACKAGE_NAME', new_kernel_package_name)
>> > +        localversion =3D e.data.getVar('KERNEL_LOCALVERSION', True) o=
r ""
>> > +        if (localversion =3D=3D ""):
>> > +            localversion =3D "-%s" % extra_name
>> > +        else:
>> > +            localversion =3D "%s+%s" % (localversion, extra_name)
>> > +
>> > +        e.data.setVar('KERNEL_LOCALVERSION', localversion)
>> > +        # if name has been tuned, add localversion to the kernel src =
path
>> > +        # in order to avoid conflicts with virtual/kernel
>> > +        e.data.setVar('KERNEL_SRC_PATH', '/usr/src/%s%s' % (new_kerne=
l_package_name, localversion))
>> > +    else:
>> > +        e.data.setVar('KERNEL_PACKAGE_NAME', '%s' % default_name)
>> > +
>> > +}
>>
>> Both the extra time to process this and the now (relatively) hidden
>> complexity and
>> processing the variables is a concern for me.
>>
>> If layers or other handlers are changing things like the kernel source
>> path, I see
>> issues with priority and ordering. Not to mention a consistent location =
on disk.
>
> Well, to be honest I simply did not know how to do it better and I tried
> various approaches - this is the one which worked for me. I'll try to exp=
lain
> what I was attempting to achieve, maybe someone can suggest a better way
> of doing it.

I've been bitten by handlers in the past, so I'm a bit hesitant to add more
to the system, this is an area where Richard can likely guide us better
than almost anyone else.

>
> Basically I did not want to uglify the default kernel package names for
> situations where the KERNEL_PACKAGE_EXTRA_NAME is not used/not set at all=
. I
> also had to take into account, that when the feature was set I had to tun=
e
> the kernels localversion in order to achieve module separation on the roo=
tfs.

A good goal, and I can see that it does that. I'm just not aware of any
other options .. but will continue to think on it myself.

>
> I first tried to do these things in an anonymous python function, but tha=
t was
> clearly "too late" in the variable evaluation chain, that is why I used t=
he
> handler.

I've been there before as well, and I feel the pain :)

>
>> For all these, isn't this something that update alternatives and symlink=
s can
>> handle ? Maybe not update alternatives per-se, but at least an always pr=
esent
>> location would be handy .. regardless of what someone decides to use for
>> their kernel package name. Again, it's about that consistency of experie=
nce.
>
> If you are referring to the KERNEL_SRC_PATH, then I think update alternat=
ives
> could do the trick, on the other hand - wouldn't you expect that the sour=
ce
> path points to the kernel which you are actually running? With multiple
> kernels in place this can change...

I would expect that!

>
> I looked how it's done on Fedora, they have a /usr/src/kernels directory,
> below it there are subdirectories named by `uname -r`, just similar to
> how kernel modules are separated.
>
> Would this be an option?

I'd think that would be suitable, or similar to what you have above with
/usr/src/linux-<version>-<name>-<whatever> with a link from
/lib/modules/<name>/build
back to the source tree. And then uname can direct you to the modules and
from there, the source.

>
>> > +
>> > +addhandler kernel_processvars_handler
>> > +kernel_processvars_handler[eventmask] =3D "bb.event.RecipePreFinalise=
"
>> > +
>> > +
>> >  python __anonymous () {
>> >      kerneltype =3D d.getVar('KERNEL_IMAGETYPE', True)
>> >      if kerneltype =3D=3D 'uImage':
>> > @@ -33,9 +65,9 @@ python __anonymous () {
>> >
>> >  inherit kernel-arch deploy
>> >
>> > -PACKAGES_DYNAMIC +=3D "^kernel-module-.*"
>> > -PACKAGES_DYNAMIC +=3D "^kernel-image-.*"
>> > -PACKAGES_DYNAMIC +=3D "^kernel-firmware-.*"
>> > +PACKAGES_DYNAMIC +=3D "^${KERNEL_PACKAGE_NAME}-module-.*"
>> > +PACKAGES_DYNAMIC +=3D "^${KERNEL_PACKAGE_NAME}-image-.*"
>> > +PACKAGES_DYNAMIC +=3D "^${KERNEL_PACKAGE_NAME}-firmware-.*"
>> >
>> >  export OS =3D "${TARGET_OS}"
>> >  export CROSS_COMPILE =3D "${TARGET_PREFIX}"
>> > @@ -344,27 +376,27 @@ EXPORT_FUNCTIONS do_compile do_install do_config=
ure
>> >
>> >  # kernel-base becomes kernel-${KERNEL_VERSION}
>> >  # kernel-image becomes kernel-image-${KERNEL_VERISON}
>> > -PACKAGES =3D "kernel kernel-base kernel-vmlinux kernel-image kernel-d=
ev kernel-modules"
>> > +PACKAGES =3D "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KE=
RNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NA=
ME}-dev ${KERNEL_PACKAGE_NAME}-modules"
>> >  FILES_${PN} =3D ""
>> > -FILES_kernel-base =3D "/lib/modules/${KERNEL_VERSION}/modules.order /=
lib/modules/${KERNEL_VERSION}/modules.builtin"
>> > -FILES_kernel-image =3D "/boot/${KERNEL_IMAGETYPE}*"
>> > -FILES_kernel-dev =3D "/boot/System.map* /boot/Module.symvers* /boot/c=
onfig* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
>> > -FILES_kernel-vmlinux =3D "/boot/vmlinux*"
>> > -FILES_kernel-modules =3D ""
>> > -RDEPENDS_kernel =3D "kernel-base"
>> > +FILES_${KERNEL_PACKAGE_NAME}-base =3D "/lib/modules/${KERNEL_VERSION}=
/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
>> > +FILES_${KERNEL_PACKAGE_NAME}-image =3D "/boot/${KERNEL_IMAGETYPE}*"
>> > +FILES_${KERNEL_PACKAGE_NAME}-dev =3D "/boot/System.map* /boot/Module.=
symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/bu=
ild"
>> > +FILES_${KERNEL_PACKAGE_NAME}-vmlinux =3D "/boot/vmlinux*"
>> > +FILES_${KERNEL_PACKAGE_NAME}-modules =3D ""
>> > +RDEPENDS_${KERNEL_PACKAGE_NAME} =3D "${KERNEL_PACKAGE_NAME}-base"
>> >  # Allow machines to override this dependency if kernel image files ar=
e
>> >  # not wanted in images as standard
>> > -RDEPENDS_kernel-base ?=3D "kernel-image"
>> > -PKG_kernel-image =3D "kernel-image-${@legitimize_package_name('${KERN=
EL_VERSION}')}"
>> > -PKG_kernel-base =3D "kernel-${@legitimize_package_name('${KERNEL_VERS=
ION}')}"
>> > -RPROVIDES_kernel-base +=3D "kernel-${KERNEL_VERSION}"
>> > -ALLOW_EMPTY_kernel =3D "1"
>> > -ALLOW_EMPTY_kernel-base =3D "1"
>> > -ALLOW_EMPTY_kernel-image =3D "1"
>> > -ALLOW_EMPTY_kernel-modules =3D "1"
>> > -DESCRIPTION_kernel-modules =3D "Kernel modules meta package"
>> > -
>> > -pkg_postinst_kernel-base () {
>> > +RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?=3D "${KERNEL_PACKAGE_NAME}-ima=
ge"
>> > +PKG_${KERNEL_PACKAGE_NAME}-image =3D "${KERNEL_PACKAGE_NAME}-image-${=
@legitimize_package_name('${KERNEL_VERSION}')}"
>> > +PKG_${KERNEL_PACKAGE_NAME}-base =3D "${KERNEL_PACKAGE_NAME}-${@legiti=
mize_package_name('${KERNEL_VERSION}')}"
>> > +RPROVIDES_${KERNEL_PACKAGE_NAME}-base +=3D "${KERNEL_PACKAGE_NAME}-${=
KERNEL_VERSION}"
>> > +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME} =3D "1"
>> > +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-base =3D "1"
>> > +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-image =3D "1"
>> > +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-modules =3D "1"
>> > +DESCRIPTION_${KERNEL_PACKAGE_NAME}-modules =3D "Kernel modules meta p=
ackage"
>> > +
>> > +pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {
>> >         if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
>> >                 mkdir -p $D/lib/modules/${KERNEL_VERSION}
>> >         fi
>> > @@ -375,18 +407,19 @@ pkg_postinst_kernel-base () {
>> >         fi
>> >  }
>> >
>> > -pkg_postinst_kernel-image () {
>> > +pkg_postinst_${KERNEL_PACKAGE_NAME}-image () {
>> >         update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IM=
AGETYPE} ${KERNEL_IMAGETYPE} /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KER=
NEL_VERSION} ${KERNEL_PRIORITY} || true
>> >  }
>> >
>> > -pkg_postrm_kernel-image () {
>> > +pkg_postrm_${KERNEL_PACKAGE_NAME}-image () {
>> >         update-alternatives --remove ${KERNEL_IMAGETYPE} ${KERNEL_IMAG=
ETYPE}-${KERNEL_VERSION} || true
>> >  }
>> >
>> >  PACKAGESPLITFUNCS_prepend =3D "split_kernel_packages "
>> >
>> >  python split_kernel_packages () {
>> > -    do_split_packages(d, root=3D'/lib/firmware', file_regex=3D'^(.*)\=
.(bin|fw|cis|dsp)$', output_pattern=3D'kernel-firmware-%s', description=3D'=
Firmware for %s', recursive=3DTrue, extra_depends=3D'')
>> > +    kernel_package_name =3D d.getVar('KERNEL_PACKAGE_NAME', True)
>> > +    do_split_packages(d, root=3D'/lib/firmware', file_regex=3D'^(.*)\=
.(bin|fw|cis|dsp)$', output_pattern=3Dkernel_package_name + '-firmware-%s',=
 description=3D'Firmware for %s', recursive=3DTrue, extra_depends=3D'')
>> >  }
>> >
>> >  do_strip() {
>> > @@ -436,15 +469,15 @@ do_sizecheck[dirs] =3D "${B}"
>> >
>> >  addtask sizecheck before do_install after do_strip
>> >
>> > -KERNEL_IMAGE_BASE_NAME ?=3D "${KERNEL_IMAGETYPE}-${PKGE}-${PKGV}-${PK=
GR}-${MACHINE}-${DATETIME}"
>> > +KERNEL_IMAGE_BASE_NAME ?=3D "${KERNEL_IMAGETYPE}-${KERNEL_PACKAGE_NAM=
E}-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
>> >  # Don't include the DATETIME variable in the sstate package signature=
s
>> >  KERNEL_IMAGE_BASE_NAME[vardepsexclude] =3D "DATETIME"
>> > -KERNEL_IMAGE_SYMLINK_NAME ?=3D "${KERNEL_IMAGETYPE}-${MACHINE}"
>> > -MODULE_IMAGE_BASE_NAME ?=3D "modules-${PKGE}-${PKGV}-${PKGR}-${MACHIN=
E}-${DATETIME}"
>> > +KERNEL_IMAGE_SYMLINK_NAME ?=3D "${KERNEL_IMAGETYPE}-${KERNEL_PACKAGE_=
NAME}-${MACHINE}"
>>
>> We've now change the symlink that has previously been in place to someth=
ing
>> new, i.e. there's no compatibility, we always have "kernel" or whatever =
the
>> recipes decide to call it in the symlink name and that wasn't the case b=
efore
>> (unless I'm misreading things).
>
> I could add the symlink name setting to the variable preprocessing routin=
e
> (that is if we keep it at all), this way the symlink would only change fo=
r
> renamed kernels and/or for kernels who are not virtual/kernel provider.

That sounds feasible to me.

>
> Ideally the virtual/kernel provider should not undergo any changes in ord=
er
> to fulfill the backwards compatibility criteria, you have a point here. T=
he
> only place where I am a bit unsure is the kernel source dir, I'd feel mor=
e
> comfortable moving it to /usr/src/kernels/`uname -r` scheme, somehow feel=
s
> more logical when you expect that multiple kernels can be present...

Agreed.

>
> I'm hoping for more feedback, where do we go from here?

I'd like to hear from Richard, but I'd say spin a v2 patch, and we can have
another look at it.

Cheers,

Bruce

>
> Kind regards,
> Sergey
>
>
>
>> > +MODULE_IMAGE_BASE_NAME ?=3D "${KERNEL_PACKAGE_NAME}-modules-${PKGE}-$=
{PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
>> >  MODULE_IMAGE_BASE_NAME[vardepsexclude] =3D "DATETIME"
>> >  MODULE_TARBALL_BASE_NAME ?=3D "${MODULE_IMAGE_BASE_NAME}.tgz"
>> >  # Don't include the DATETIME variable in the sstate package signature=
s
>> > -MODULE_TARBALL_SYMLINK_NAME ?=3D "modules-${MACHINE}.tgz"
>> > +MODULE_TARBALL_SYMLINK_NAME ?=3D "${KERNEL_PACKAGE_NAME}-modules-${MA=
CHINE}.tgz"
>> >  MODULE_TARBALL_DEPLOY ?=3D "1"
>> >
>> >  do_uboot_mkimage() {
>> > @@ -481,7 +514,7 @@ kernel_do_deploy() {
>> >         fi
>> >
>> >         ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMA=
GE_SYMLINK_NAME}.bin
>> > -       ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMA=
GETYPE}
>> > +       ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMA=
GETYPE}-${KERNEL_PACKAGE_NAME}
>> >
>> >         cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/RE=
ADME_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
>> >
>> > diff --git a/meta/classes/linux-kernel-base.bbclass b/meta/classes/lin=
ux-kernel-base.bbclass
>> > index 4f2b0a4..91656c0 100644
>> > --- a/meta/classes/linux-kernel-base.bbclass
>> > +++ b/meta/classes/linux-kernel-base.bbclass
>> > @@ -25,8 +25,10 @@ def get_kernelversion(p):
>> >      return None
>> >
>> >  def linux_module_packages(s, d):
>> > +       kernel_package_name =3D d.getVar('KERNEL_PACKAGE_NAME')
>> > +
>> >         suffix =3D ""
>> > -       return " ".join(map(lambda s: "kernel-module-%s%s" % (s.lower(=
).replace('_', '-').replace('@', '+'), suffix), s.split()))
>> > +       return " ".join(map(lambda s: "%s-module-%s%s" % (kernel_packa=
ge_name, s.lower().replace('_', '-').replace('@', '+'), suffix), s.split())=
)
>> >
>> >  # that's all
>> >
>> > diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbc=
lass
>> > index eea2fd5..550d47e 100644
>> > --- a/meta/classes/multilib.bbclass
>> > +++ b/meta/classes/multilib.bbclass
>> > @@ -117,14 +117,15 @@ PACKAGEFUNCS_append =3D " do_package_qa_multilib=
"
>> >  python do_package_qa_multilib() {
>> >
>> >      def check_mlprefix(pkg, var, mlprefix):
>> > +        kernel_package_name =3D d.getVar('KERNEL_PACKAGE_NAME')
>> >          values =3D bb.utils.explode_deps(d.getVar('%s_%s' % (var, pkg=
), True) or d.getVar(var, True) or "")
>> >          candidates =3D []
>> >          for i in values:
>> >              if i.startswith('virtual/'):
>> >                  i =3D i[len('virtual/'):]
>> > -            if (not i.startswith('kernel-module')) and (not i.startsw=
ith(mlprefix)) and \
>> > +            if (not i.startswith('%s-module' % kernel_package_name)) =
and (not i.startswith(mlprefix)) and \
>> >                  (not 'cross-canadian' in i) and (not i.startswith("na=
tivesdk-")) and \
>> > -                (not i.startswith("rtld")) and (not i.startswith('ker=
nel-vmlinux')):
>> > +                (not i.startswith("rtld")) and (not i.startswith('%s-=
vmlinux' % kernel_package_name)):
>> >                  candidates.append(i)
>> >          if len(candidates) > 0:
>> >              bb.warn("Multilib QA Issue: %s package %s - suspicious va=
lues '%s' in %s"
>> > diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbcla=
ss
>> > index 96d7fd9..b1e0543 100644
>> > --- a/meta/classes/package.bbclass
>> > +++ b/meta/classes/package.bbclass
>> > @@ -1301,11 +1301,12 @@ python package_do_filedeps() {
>> >      def chunks(files, n):
>> >          return [files[i:i+n] for i in range(0, len(files), n)]
>> >
>> > +    kernel_package_name =3D d.getVar('KERNEL_PACKAGE_NAME') or "kerne=
l"
>> >      pkglist =3D []
>> >      for pkg in packages.split():
>> >          if d.getVar('SKIP_FILEDEPS_' + pkg, True) =3D=3D '1':
>> >              continue
>> > -        if pkg.endswith('-dbg') or pkg.endswith('-doc') or pkg.find('=
-locale-') !=3D -1 or pkg.find('-localedata-') !=3D -1 or pkg.find('-gconv-=
') !=3D -1 or pkg.find('-charmap-') !=3D -1 or pkg.startswith('kernel-modul=
e-'):
>> > +        if pkg.endswith('-dbg') or pkg.endswith('-doc') or pkg.find('=
-locale-') !=3D -1 or pkg.find('-localedata-') !=3D -1 or pkg.find('-gconv-=
') !=3D -1 or pkg.find('-charmap-') !=3D -1 or pkg.startswith('%s-module-' =
% kernel_package_name):
>> >              continue
>> >          for files in chunks(pkgfiles[pkg], 100):
>> >              pkglist.append((pkg, files, rpmdeps, pkgdest))
>> > --
>> > 2.3.0
>> >
>> >
>> >
>> >
>> >
>> > From d2620d154047e1b8db4fa93d1911c2d690a3f1e2 Mon Sep 17 00:00:00 2001
>> > From: Sergey 'Jin' Bostandzhyan <jin at mediatomb dot cc>
>> > Date: Mon, 13 Apr 2015 15:52:44 +0200
>> > Subject: [PATCH 2/2] allow to mark a kernel package as "additional"
>> >
>> > Introduce a KERNEL_PACKAGE_ADDITIONAL variable with allowed values of =
0
>> > or 1 which will remove the virtual/kernel PROVIDES from the package.
>> > This allows to generate kernel packages that are treated as regular
>> > packages by the package manager, making it possible to install multipl=
e
>> > kernels in the rootfs as long as their names do not clash.
>> > ---
>> >  meta/classes/kernel.bbclass | 8 +++++++-
>> >  1 file changed, 7 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> > index c7c6c3e..27eadf2 100644
>> > --- a/meta/classes/kernel.bbclass
>> > +++ b/meta/classes/kernel.bbclass
>> > @@ -1,6 +1,5 @@
>> >  inherit linux-kernel-base kernel-module-split
>> >
>> > -PROVIDES +=3D "virtual/kernel"
>> >  DEPENDS +=3D "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFI=
X}gcc kmod-native depmodwrapper-cross bc-native"
>> >
>> >  # we include gcc above, we dont need virtual/libc
>> > @@ -12,6 +11,9 @@ KERNEL_PACKAGE_NAME =3D ""
>> >  # adds a suffix to the kernel name, allowing to change the naming sch=
eme of
>> >  # the kernel packages, result will be "kernel-${KERNEL_PACKAGE_EXTRA_=
NAME}"
>> >  KERNEL_PACKAGE_EXTRA_NAME ?=3D ""
>> > +# indicates that this is an additional kernel package which can be in=
stalled
>> > +# and uninstalled without a dependency to the image itself
>> > +KERNEL_PACKAGE_ADDITIONAL ?=3D "0"
>> >
>> >  KERNEL_IMAGETYPE ?=3D "zImage"
>> >  INITRAMFS_IMAGE ?=3D ""
>> > @@ -37,6 +39,10 @@ python kernel_processvars_handler () {
>> >      else:
>> >          e.data.setVar('KERNEL_PACKAGE_NAME', '%s' % default_name)
>> >
>> > +    if e.data.getVar('KERNEL_PACKAGE_ADDITIONAL', True) !=3D '1':
>> > +        provides =3D e.data.getVar("PROVIDES", True)
>> > +        provides =3D "%s virtual/kernel" % provides
>> > +        e.data.setVar('PROVIDES', provides)
>> >  }
>> >
>> >  addhandler kernel_processvars_handler
>> > --
>> > 2.3.0
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

