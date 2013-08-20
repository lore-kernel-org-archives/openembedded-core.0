Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 498306B882
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 16:41:19 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id eh20so496388lab.19
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 09:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=1uKU/srH5q6V8BHTOZrhkhTAeX/A5pYXCs+GfruQalA=;
	b=nXpcZgiHdr7GpXfndbKbe3awILCvbD3/3umxywAi+yEmM5K4nxd8Cuu9d7y4W6f2jC
	63kPzp1xRxPvi6UushY5/hKzzsDPAYxZ35kFc1sbg/Y8xAGNZMctaJHSVRZ3DdYypOg7
	DCgNoE+kWR6AXa/e6rcae6Ae9rRYiO7elNZA1Z/jM8tXor2YaNiMg1M5fSr3nLeQLKnJ
	/c1tZuAJxKQ7KdkK9mF4WTEpXLep3hBYJgh3h4cdu4J/7oxBZmzZ2OrpWYBFqCLYJlgm
	XpXL9nBGAoboMEv0OyvJvOdwBgoktWydTYIykS0Kck4QI3fHzBSUigPKJYkSQuCTgvn+
	4E7w==
MIME-Version: 1.0
X-Received: by 10.112.205.106 with SMTP id lf10mr55173lbc.77.1377016879110;
	Tue, 20 Aug 2013 09:41:19 -0700 (PDT)
Received: by 10.112.69.171 with HTTP; Tue, 20 Aug 2013 09:41:19 -0700 (PDT)
In-Reply-To: <52139917.4020809@windriver.com>
References: <1376939513-10400-1-git-send-email-jason.wessel@windriver.com>
	<5213745A.8000307@windriver.com>
	<CAAQYJAs5z7KYd3COy++9Pe8XQrsaSGOxCZGB7OKHokTTE=kPKA@mail.gmail.com>
	<52139917.4020809@windriver.com>
Date: Tue, 20 Aug 2013 18:41:19 +0200
Message-ID: <CAAQYJAvfd9PMs+JUoj1hGWaHRM66j4qtU+270tpQL==J=vZe=A@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass, image.bbclass: Implement kernel INITRAMFS dependency and bundling
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
X-List-Received-Date: Tue, 20 Aug 2013 16:41:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 20, 2013 at 6:28 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> On 13-08-20 11:03 AM, Andrea Adami wrote:
>>
>> On Tue, Aug 20, 2013 at 3:51 PM, Bruce Ashfield
>> <bruce.ashfield@windriver.com> wrote:
>>>
>>> On 13-08-19 03:11 PM, Jason Wessel wrote:
>>>>
>>>>
>>>> This patch aims to fix the following two cases for the INITRAMFS
>>>> generation.
>>>>     1) Allow an image recipe to specify a paired INITRAMFS recipe such
>>>>        as core-image-minimal-initramfs.  This allows building a base
>>>>        image which always generates the needed initramfs image in one
>>>> step
>>>>     2) Allow building a single binary which contains a kernel and
>>>>        the initramfs.
>>>>
>>>> A key requirement of the initramfs is to be able to add kernel
>>>> modules.  The current implementation of the INITRAMFS_IMAGE variable
>>>> has a circular dependency when using kernel modules in the initramfs
>>>> image.bb file that is caused by kernel.bbclass trying to build the
>>>> initramfs before the kernel's do_install rule.
>>>>
>>>> The solution for this problem is to have the kernel's
>>>> do_bundle_initramfs_image task depend on the do_rootfs from the
>>>> INITRAMFS_IMAGE and not some intermediate point.  The image.bbclass
>>>> will also sets up dependencies to make the initramfs creation task run
>>>> last.
>>>>
>>>> The code to bundle the kernel and initramfs together has been added.
>>>> At a high level, all it is doing is invoking a second compilation of
>>>> the kernel but changing the value of CONFIG_INITRAMFS_SOURCE to point
>>>> to the generated initramfs from the image recipe.
>>>
>>>
>>>
>>> In case it wasn't obvious with Jason cc'ing me, I've seen the patch
>>> before, and I'm good with the change.
>>>
>>> So definitely: Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>
>>> I'm adding Andrea to the cc list as well, since we've been talking
>>> about initramfs creation for years now, and I'd want his opinion on
>>> whether this looks good, and would work for meta-handheld.
>>>
>>> Cheers,
>>>
>>> Bruce
>>>
>>>
>>>>
>>>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>>>> ---
>>>>    meta/classes/image.bbclass  |   12 ++++++
>>>>    meta/classes/kernel.bbclass |   96
>>>> +++++++++++++++++++++++++++++++++++++------
>>>>    meta/conf/local.conf.sample |   20 +++++++++
>>>>    3 files changed, 116 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>>>> index 116bd22..78c25db 100644
>>>> --- a/meta/classes/image.bbclass
>>>> +++ b/meta/classes/image.bbclass
>>>> @@ -140,6 +140,10 @@ python () {
>>>>        d.setVar('MULTILIB_VENDORS', ml_vendor_list)
>>>>
>>>>        check_image_features(d)
>>>> +    initramfs_image = d.getVar('INITRAMFS_IMAGE', True) or ""
>>>> +    if initramfs_image != "":
>>>> +        d.appendVarFlag('do_build', 'depends', "
>>>> %s:do_bundle_initramfs"
>>>> %  d.getVar('PN', True))
>>>> +        d.appendVarFlag('do_bundle_initramfs', 'depends', "
>>>> %s:do_rootfs"
>>>> % initramfs_image)
>>>>    }
>>>>
>>>>    #
>>>> @@ -614,3 +618,11 @@ do_package_write_deb[noexec] = "1"
>>>>    do_package_write_rpm[noexec] = "1"
>>>>
>>>>    addtask rootfs before do_build
>>>> +# Allow the kernel to be repacked with the initramfs and boot image
>>>> file
>>>> as a single file
>>>> +do_bundle_initramfs[depends] += "virtual/kernel:do_bundle_initramfs"
>>>> +do_bundle_initramfs[nostamp] = "1"
>>>> +do_bundle_initramfs[noexec] = "1"
>>>> +do_bundle_initramfs () {
>>>> +       :
>>>> +}
>>>> +addtask bundle_initramfs after do_rootfs
>>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>>> index e039dfc..8cf66ce 100644
>>>> --- a/meta/classes/kernel.bbclass
>>>> +++ b/meta/classes/kernel.bbclass
>>>> @@ -9,6 +9,7 @@ INHIBIT_DEFAULT_DEPS = "1"
>>>>    KERNEL_IMAGETYPE ?= "zImage"
>>>>    INITRAMFS_IMAGE ?= ""
>>>>    INITRAMFS_TASK ?= ""
>>>> +INITRAMFS_IMAGE_BUNDLE ?= ""
>>>>
>>>>    python __anonymous () {
>>>>        kerneltype = d.getVar('KERNEL_IMAGETYPE', True) or ''
>>>> @@ -19,7 +20,15 @@ python __anonymous () {
>>>>
>>>>        image = d.getVar('INITRAMFS_IMAGE', True)
>>>>        if image:
>>>> -        d.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs')
>>>> +        d.appendVarFlag('do_bundle_initramfs', 'depends', '
>>>> ${INITRAMFS_IMAGE}:do_rootfs')
>>>> +
>>>> +    # NOTE: setting INITRAMFS_TASK is for backward compatibility
>>>> +    #       The preferred method is to set INITRAMFS_IMAGE, because
>>>> +    #       this INITRAMFS_TASK has circular dependency problems
>>>> +    #       if the initramfs requires kernel modules
>>>> +    image_task = d.getVar('INITRAMFS_TASK', True)
>>>> +    if image_task:
>>>> +        d.appendVarFlag('do_configure', 'depends', '
>>>> ${INITRAMFS_TASK}')
>>>>    }
>>>>
>>>>    inherit kernel-arch deploy
>>>> @@ -72,9 +81,82 @@ KERNEL_SRC_PATH = "/usr/src/kernel"
>>>>
>>>>    KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz"
>>>> else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
>>>>
>>>> +copy_initramfs() {
>>>> +       echo "Copying initramfs into ./usr ..."
>>>> +       # Find and use the first initramfs image archive type we find
>>>> +       rm -f ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
>>>> +       for img in cpio.gz cpio.lzo cpio.lzma cpio.xz; do
>>>> +               if [ -e
>>>> "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" ]; then
>>>> +                       cp
>>>> ${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img ${B}/usr/.
>>>> +                       case $img in
>>>> +                       *gz)
>>>> +                               echo "gzip decompressing image"
>>>> +                               gunzip -f
>>>> ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
>>>> +                               break
>>>> +                               ;;
>>>> +                       *lzo)
>>>> +                               echo "lzo decompressing image"
>>>> +                               lzop -df
>>>> ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
>>>> +                               break
>>>> +                               ;;
>>>> +                       *lzma)
>>>> +                               echo "lzma decompressing image"
>>>> +                               lzmash -df
>>>> ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
>>>> +                               break
>>>> +                               ;;
>>>> +                       *xz)
>>>> +                               echo "xz decompressing image"
>>>> +                               xz -df
>>>> ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
>>>> +                               break
>>>> +                               ;;
>>>> +                       esac
>>>> +               fi
>>>> +       done
>>>> +       echo "Finished copy of initramfs into ./usr"
>>>> +}
>>>> +
>>>> +INITRAMFS_BASE_NAME =
>>>> "${KERNEL_IMAGETYPE}-initramfs-${PV}-${PR}-${MACHINE}-${DATETIME}"
>>>> +INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
>>>> +do_bundle_initramfs () {
>>>> +       if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" =
>>>> x1 ]; then
>>>> +               echo "Creating a kernel image with a bundled
>>>> initramfs..."
>>>> +               copy_initramfs
>>>> +               if [ -e ${KERNEL_OUTPUT} ] ; then
>>>> +                       mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.bak
>>>> +               fi
>>>> +
>>>>
>>>> use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
>>>> +               kernel_do_compile
>>>> +               mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.initramfs
>>>> +               mv -f ${KERNEL_OUTPUT}.bak ${KERNEL_OUTPUT}
>>>> +               # Update install area
>>>> +               echo "There is kernel image bundled with initramfs:
>>>> ${B}/${KERNEL_OUTPUT}.initramfs"
>>>> +               install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs
>>>> ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
>>>> +               echo "${B}/${KERNEL_OUTPUT}.initramfs"
>>>> +               cd ${B}
>>>> +               # Update deploy directory
>>>> +               if [ -e "${KERNEL_OUTPUT}.initramfs" ]; then
>>>> +                       echo "Copying deploy kernel-initramfs image and
>>>> setting up links..."
>>>> +                       initramfs_base_name=${INITRAMFS_BASE_NAME}
>>>> +
>>>> initramfs_symlink_name=${KERNEL_IMAGETYPE}-initramfs-${MACHINE}
>>>> +                       install -m 0644 ${KERNEL_OUTPUT}.initramfs
>>>> ${DEPLOY_DIR_IMAGE}/${initramfs_base_name}.bin
>>>> +                       cd ${DEPLOY_DIR_IMAGE}
>>>> +                       ln -sf ${initramfs_base_name}.bin
>>>> ${initramfs_symlink_name}.bin
>>>> +               fi
>>>> +       fi
>>>> +}
>>>> +do_bundle_initramfs[nostamp] = "1"
>>>> +addtask bundle_initramfs after do_compile
>>>> +
>>>>    kernel_do_compile() {
>>>>          unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>>>> -       oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE}
>>>> CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>>>> +       # The $use_alternate_initrd is only set from
>>>> +       # do_bundle_initramfs() This variable is specifically for the
>>>> +       # case where we are making a second pass at the kernel
>>>> +       # compilation and we want to force the kernel build to use a
>>>> +       # different initramfs image.  The way to do that in the kernel
>>>> +       # is to specify:
>>>> +       # make ...args...
>>>> CONFIG_INITRAMFS_SOURCE=some_other_initramfs.cpio
>>>> +       oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE}
>>>> CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>>>> $use_alternate_initrd
>>>>          if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" =
>>>> "${KERNEL_IMAGETYPE}";
>>>> then
>>>>                  gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" >
>>>> "${KERNEL_OUTPUT}"
>>>>          fi
>>>> @@ -219,18 +301,8 @@ kernel_do_configure() {
>>>>                  cp "${WORKDIR}/defconfig" "${B}/.config"
>>>>          fi
>>>>          yes '' | oe_runmake oldconfig
>>>> -
>>>> -       if [ ! -z "${INITRAMFS_IMAGE}" ]; then
>>>> -               for img in cpio.gz cpio.lzo cpio.lzma cpio.xz; do
>>>> -               if [ -e
>>>> "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" ]; then
>>>> -                       cp
>>>> "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" initramfs.$img
>>>> -               fi
>>>> -               done
>>>> -       fi
>>>>    }
>>>>
>>>> -do_configure[depends] += "${INITRAMFS_TASK}"
>>>> -
>>>>    do_savedefconfig() {
>>>>          oe_runmake savedefconfig
>>>>    }
>>>> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
>>>> index 2b078d0..17733ab 100644
>>>> --- a/meta/conf/local.conf.sample
>>>> +++ b/meta/conf/local.conf.sample
>>>> @@ -146,6 +146,26 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
>>>>    USER_CLASSES ?= "buildstats image-mklibs image-prelink"
>>>>
>>>>    #
>>>> +# Kernel image features
>>>> +#
>>>> +# The INITRAMFS_IMAGE image variable will cause an additional recipe to
>>>> +# be built as a dependency to the what ever rootfs recipe you might be
>>>> +# using such as core-image-sato.  The initramfs might be needed for
>>>> +# the initial boot of of the target system such as to load kernel
>>>> +# modules prior to mounting the root file system.
>>>> +#
>>>> +# INITRAMFS_IMAGE_BUNDLE variable controls if the image recipe
>>>> +# specified by the INITRAMFS_IMAGE will be run through an extra pass
>>>> +# through the kernel compilation in order to build a single binary
>>>> +# which contains both the kernel image and the initramfs.  The
>>>> +# combined binary will be deposited into the tmp/deploy directory.
>>>> +# NOTE: You can set INITRAMFS_IMAGE in an image recipe, but
>>>> +#       INITRAMFS_IMAGE_BUNDLE can only be set in a conf file.
>>>> +#
>>>> +#INITRAMFS_IMAGE = "core-image-minimal-initramfs"
>>>> +#INITRAMFS_IMAGE_BUNDLE = "1"
>>>> +
>>>> +#
>>>>    # Runtime testing of images
>>>>    #
>>>>    # The build system can test booting virtual machine images under qemu
>>>> (an emulator)
>>>>
>>>
>>
>> I plan to test this as soon as possible.
>>
>> Though, it seems to me a bit too special-cased: you only change
>> CONFIG_INITRAMFS_SOURCE=some_other_initramfs.cpio.
>> I mean, our necessity is to have a *different* second kernel embedding
>> the initramfs and in fact we have linux-yocto as standard kernel and a
>> linux-yocto-tiny derived special-purpose kernel+cpio.
>
>
> This is exactly what I was hoping to hear as feedback, and yes,
> this solution does stop short of the kexec solution or a two
> kernel variant. It does allow you to have a kernel module for a
> driver in your initramfs, and a unique filesystem for that
> initramfs.
>
> Your document/steps are one of the cases that I had in mind, it
> would be nice to make it simpler as well .. if possible.
>
>
>>
>> (in case you missed it:
>> http://kexecboot.org/documentation/crosscompiling/oe-yocto )
>>
>> About building all in one-pass, well, we were there and we did step back.
>> It was preferred to build only the 'production' kernel when building
>> images and to build separately the special kernel+cpio.
>> The logic was to create a dummy recipe and let the option to build it
>> automatically i.e. adding it as # EXTRA_IMAGEDEPENDS += "dummy" in
>> your machine.conf or another conf file
>
>
> Remind me on this part. When you assemble and include that second
> kernel into the production kernel's initramfs, how are the build
> artifacts shared ? i.e. it's just a second build with a shared
> deploy directory ? (your my-installer.bb recipe) ?
>
Yes, exactly.
In the specific case you can manually do 'bitbake zaurus-installer' or
just uncomment the
following line in zaurus.inc (belongs to the machine config file).

# If set here, each image will also build linux-yocto-tiny-kexecboot
and the updater
# EXTRA_IMAGEDEPENDS += "zaurus-installer"

This will build all the needed parts.

Regards

Andrea


> Cheers,
>
> Bruce
>
>
>>
>> I'll test soon anyway, thx.
>>
>> Cheers
>>
>> Andrea
>>
>

