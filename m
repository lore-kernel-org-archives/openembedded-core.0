Return-Path: <andrea.adami@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id B51296FFD7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 13:21:49 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id u10-v6so1949953pfn.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Nov 2018 05:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NoTI5P6qMDuh3xHmFkpzp0Z5EkaPSkrgNC9pmRD1Fo0=;
	b=RpNotvs0kpWsQ7gqiy3B/4sZNrBWhhpCXDwQQwlxAh8YPKPoAUyKy+QVe1h+JL4TaW
	Gaq54DJU/ZuTGeEHGuXXSPPO+VG3dyleRuFhDNYEjCHN6ppBL+h919UdFS11HHp2Y4wl
	G9hSVkTyYptrIOMKQkO1m8U3PlPks/GYJsN+WGqHaB18pbJsxrMFofYERiBkPGKvCbFx
	xKzM/agjiHpZT6ZyDvyKlE/I8ufsSQvh1A1GaXs9XDigFudPhwsByCnnSExckMMqDgMy
	MBsTOFUHg/5Zkrbkrnvr4p90xL2KJfr5/pYCGAujIgZgd/JIdwXFWFrjCvxNae7EcNBw
	EezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NoTI5P6qMDuh3xHmFkpzp0Z5EkaPSkrgNC9pmRD1Fo0=;
	b=RuGqlN1Z6X33auMlLKqqjJWqCBY6IzytI+OUrA4DeDdV6hIULgjbn/3nS3zpz++uCt
	3dOrFQ+sVUpFgvar45yFxumB10RZSSqPeFemVtAxUBri+kvig7UN1dc/s36kbPXQDxxI
	sJhspdC8mHkO2klvg9pAGYAEzkV/Snnf9xX7Dvgo8i3p7pfnmTvSZNTOq6zN5gV7EbX0
	R2LatSOtS5BJgveL1iSXp++fM7V6CLOkznKODQMqX9UyvpxBvawwF8Dg+PeB0TKad0tp
	GPuKbAXqPlR7a9bQm5fmIAeYkwqgGqDZi0EdZqy/kW0z4wllHOhqJUjWp//EqeDVF0u8
	tz4Q==
X-Gm-Message-State: AGRZ1gJ3HrBHnRqjuG6Zs4SbrmDnkOIcAxu7uPP9WK6dfAFNAcyJcmJP
	YqowatrcPnzwu5qitP9KcDm11Gj3SBQC42lOFzoEuAYb
X-Google-Smtp-Source: AJdET5fXM+br30cH+yM+9BLRa+5OD32m3hpeJJEnrMkad3c2+h7ijFctG5ATY4O8Mmb4cKoKPsbJ3KchNqbhWRVbjNk=
X-Received: by 2002:a62:5285:: with SMTP id
	g127-v6mr207795pfb.128.1541596910633; 
	Wed, 07 Nov 2018 05:21:50 -0800 (PST)
MIME-Version: 1.0
References: <20181107121602.13768-1-nathan@nathanrossi.com>
In-Reply-To: <20181107121602.13768-1-nathan@nathanrossi.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Wed, 7 Nov 2018 14:21:38 +0100
Message-ID: <CAAQYJAt5JNxG=mASzPO0XqHLO==v7hKQjxG1-a4eTPD57hfQ3g@mail.gmail.com>
To: nathan@nathanrossi.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] kernel-initramfs.bbclass: Separate initramfs setup
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
X-List-Received-Date: Wed, 07 Nov 2018 13:21:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 7, 2018 at 1:16 PM Nathan Rossi <nathan@nathanrossi.com> wrote:
>
> This change moves the initramfs bundling functions and tasks into a
> separate class called 'kernel-initramfs'. The change also converts the
> copy_initramfs into a task that itself depends on the do_image_complete
> of the initramfs image. Making this change allows for the do_initramfs_*
> tasks to be conditionally added instead of relying on the task checking
> the variables, with the exception of do_deploy(_append).
>
> The 'use_alternate_initrd' of kernel_do_compile is replaced with a
> general use 'extra_make' variable. And the INITRAMFS_TASK functionality
> of kernel_do_compile is removed.
>
> The 'KERNEL_CLASSES' inherit is moved to after the EXPORT_FUNCTIONS
> do_deploy in order to allow these classes to append to the do_deploy
> task without breaking the do_deploy task itself.
>
> The functionality for INITRAMFS_TASK remained for backwards
> compatibility when the bundle changes were introduced. The bundle
> functionality has been available for a number of releases since, as such
> this change does not carry forward the functionality of INITRAMFS_TASK.
> The information regarding INITRAMFS_TASK issues for is kept along with
> the generation of a bb.fatal when a user attempts to use it.
>
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>

Hi Nathan,

thanks for your efforts, clearly cleaning is needed wrt the bunling.

As for the results of this work, I fear it will break the existent (10
yrs) infrastructure.
A brief recap: we want to build a non-yocto kernel bundled with our
initramfs image, this in a single kernel recipe.

http://cgit.openembedded.org/meta-handheld/tree/recipes-kernel/linux/linux-kexecboot_4.4.bb

In the years I have adjusted the recipe which is today needing both

INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_image_complete"

I will test your patch and include the new kernel-initramfs.bbclass.
The point is that I don't want/need the NITRAMFS_IMAGE_BUNDLE for th
emain kernel, just for thi ssecond kernel provided by the a.m. recipe.
I have to check again but this var has to be set upper in local.conf,
not in the recipe afaik.

Let me pls check this before (n)acking it...

Cheers
Andrea

> ---
>  meta/classes/kernel-initramfs.bbclass | 114 +++++++++++++++++++++++++
>  meta/classes/kernel.bbclass           | 155 +++++-----------------------------
>  2 files changed, 133 insertions(+), 136 deletions(-)
>  create mode 100644 meta/classes/kernel-initramfs.bbclass
>
> diff --git a/meta/classes/kernel-initramfs.bbclass b/meta/classes/kernel-initramfs.bbclass
> new file mode 100644
> index 0000000000..b23fb51495
> --- /dev/null
> +++ b/meta/classes/kernel-initramfs.bbclass
> @@ -0,0 +1,114 @@
> +
> +INITRAMFS_IMAGE ?= ""
> +INITRAMFS_IMAGE_NAME ?= "${@'${INITRAMFS_IMAGE}-${MACHINE}' if d.getVar('INITRAMFS_IMAGE') else ''}"
> +INITRAMFS_IMAGE_BUNDLE ?= ""
> +
> +python __anonymous () {
> +    # NOTE: setting INITRAMFS_TASK was for backward compatibility
> +    #       The preferred method is to set INITRAMFS_IMAGE, because
> +    #       this INITRAMFS_TASK has circular dependency problems
> +    #       if the initramfs requires kernel modules
> +    if d.getVar('INITRAMFS_TASK'):
> +        bb.fatal("The INITRAMFS_TASK variable is no longer supported. Use INITRAMFS_IMAGE and INITRAMFS_IMAGE_BUNDLE.")
> +
> +    image = d.getVar("INITRAMFS_IMAGE")
> +    bundle = oe.types.boolean(d.getVar("INITRAMFS_IMAGE_BUNDLE") or "0")
> +    if image and bundle:
> +        # add all the tasks
> +        bb.build.addtask('do_initramfs_copy', 'do_initramfs_bundle', 'do_install', d)
> +        bb.build.addtask('do_initramfs_bundle', 'do_deploy', 'do_initramfs_copy', d)
> +
> +        # make the do_initramfs_copy task depend on the image do_image_complete task
> +        d.appendVarFlag('do_initramfs_copy', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
> +}
> +
> +do_initramfs_copy[dirs] = "${B}"
> +do_initramfs_copy () {
> +    echo "Copying initramfs into ./usr ..."
> +    # In case the directory is not created yet from the first pass compile:
> +    mkdir -p ${B}/usr
> +    # Find and use the first initramfs image archive type we find
> +    rm -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
> +    for img in cpio cpio.gz cpio.lz4 cpio.lzo cpio.lzma cpio.xz; do
> +        if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img" ]; then
> +            cp ${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img ${B}/usr/.
> +            case $img in
> +            *gz)
> +                echo "gzip decompressing image"
> +                gunzip -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
> +                break
> +                ;;
> +            *lz4)
> +                echo "lz4 decompressing image"
> +                lz4 -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
> +                break
> +                ;;
> +            *lzo)
> +                echo "lzo decompressing image"
> +                lzop -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
> +                break
> +                ;;
> +            *lzma)
> +                echo "lzma decompressing image"
> +                lzma -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
> +                break
> +                ;;
> +            *xz)
> +                echo "xz decompressing image"
> +                xz -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
> +                break
> +                ;;
> +            esac
> +        fi
> +    done
> +    if [ ! -e ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio ]; then
> +        bbfatal "Failed to copy initramfs cpio for image ${INITRAMFS_IMAGE_NAME}"
> +    fi
> +    echo "Finished copy of initramfs into ./usr"
> +}
> +
> +do_initramfs_bundle[dirs] = "${B}"
> +do_initramfs_bundle () {
> +    echo "Creating a kernel image with a bundled initramfs..."
> +    # Backing up kernel image relies on its type(regular file or symbolic link)
> +    tmp_path=""
> +    for imageType in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
> +        if [ -h ${KERNEL_OUTPUT_DIR}/$imageType ] ; then
> +            linkpath=`readlink -n ${KERNEL_OUTPUT_DIR}/$imageType`
> +            realpath=`readlink -fn ${KERNEL_OUTPUT_DIR}/$imageType`
> +            mv -f $realpath $realpath.bak
> +            tmp_path=$tmp_path" "$imageType"#"$linkpath"#"$realpath
> +        elif [ -f ${KERNEL_OUTPUT_DIR}/$imageType ]; then
> +            mv -f ${KERNEL_OUTPUT_DIR}/$imageType ${KERNEL_OUTPUT_DIR}/$imageType.bak
> +            tmp_path=$tmp_path" "$imageType"##"
> +        fi
> +    done
> +    extra_make=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
> +    kernel_do_compile
> +    # Restoring kernel image
> +    for tp in $tmp_path ; do
> +        imageType=`echo $tp|cut -d "#" -f 1`
> +        linkpath=`echo $tp|cut -d "#" -f 2`
> +        realpath=`echo $tp|cut -d "#" -f 3`
> +        if [ -n "$realpath" ]; then
> +            mv -f $realpath $realpath.initramfs
> +            mv -f $realpath.bak $realpath
> +            ln -sf $linkpath.initramfs ${B}/${KERNEL_OUTPUT_DIR}/$imageType.initramfs
> +        else
> +            mv -f ${KERNEL_OUTPUT_DIR}/$imageType ${KERNEL_OUTPUT_DIR}/$imageType.initramfs
> +            mv -f ${KERNEL_OUTPUT_DIR}/$imageType.bak ${KERNEL_OUTPUT_DIR}/$imageType
> +        fi
> +    done
> +}
> +
> +do_deploy_append () {
> +    if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
> +        for imageType in ${KERNEL_IMAGETYPES} ; do
> +            initramfs_base_name=${imageType}-${INITRAMFS_NAME}
> +            initramfs_symlink_name=${imageType}-${INITRAMFS_LINK_NAME}
> +            install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${initramfs_base_name}.bin
> +            ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
> +        done
> +    fi
> +}
> +
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index e04d2fe004..c0e9452ca6 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -20,10 +20,6 @@ OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"
>  INHIBIT_DEFAULT_DEPS = "1"
>
>  KERNEL_IMAGETYPE ?= "zImage"
> -INITRAMFS_IMAGE ?= ""
> -INITRAMFS_IMAGE_NAME ?= "${@['${INITRAMFS_IMAGE}-${MACHINE}', ''][d.getVar('INITRAMFS_IMAGE') == '']}"
> -INITRAMFS_TASK ?= ""
> -INITRAMFS_IMAGE_BUNDLE ?= ""
>
>  # KERNEL_VERSION is extracted from source code. It is evaluated as
>  # None for the first parsing, since the code has not been fetched.
> @@ -93,37 +89,8 @@ python __anonymous () {
>          d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' % (kname, typelower))
>          d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>          d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
> -
> -    image = d.getVar('INITRAMFS_IMAGE')
> -    if image:
> -        d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
> -
> -    # NOTE: setting INITRAMFS_TASK is for backward compatibility
> -    #       The preferred method is to set INITRAMFS_IMAGE, because
> -    #       this INITRAMFS_TASK has circular dependency problems
> -    #       if the initramfs requires kernel modules
> -    image_task = d.getVar('INITRAMFS_TASK')
> -    if image_task:
> -        d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
>  }
>
> -# Here we pull in all various kernel image types which we support.
> -#
> -# In case you're wondering why kernel.bbclass inherits the other image
> -# types instead of the other way around, the reason for that is to
> -# maintain compatibility with various currently existing meta-layers.
> -# By pulling in the various kernel image types here, we retain the
> -# original behavior of kernel.bbclass, so no meta-layers should get
> -# broken.
> -#
> -# KERNEL_CLASSES by default pulls in kernel-uimage.bbclass, since this
> -# used to be the default behavior when only uImage was supported. This
> -# variable can be appended by users who implement support for new kernel
> -# image types.
> -
> -KERNEL_CLASSES ?= " kernel-uimage "
> -inherit ${KERNEL_CLASSES}
> -
>  # Old style kernels may set ${S} = ${WORKDIR}/git for example
>  # We need to move these over to STAGING_KERNEL_DIR. We can't just
>  # create the symlink in advance as the git fetcher can't cope with
> @@ -188,90 +155,10 @@ KERNEL_EXTRA_ARGS ?= ""
>  EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
>  KERNEL_ALT_IMAGETYPE ??= ""
>
> -copy_initramfs() {
> -       echo "Copying initramfs into ./usr ..."
> -       # In case the directory is not created yet from the first pass compile:
> -       mkdir -p ${B}/usr
> -       # Find and use the first initramfs image archive type we find
> -       rm -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
> -       for img in cpio cpio.gz cpio.lz4 cpio.lzo cpio.lzma cpio.xz; do
> -               if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img" ]; then
> -                       cp ${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img ${B}/usr/.
> -                       case $img in
> -                       *gz)
> -                               echo "gzip decompressing image"
> -                               gunzip -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
> -                               break
> -                               ;;
> -                       *lz4)
> -                               echo "lz4 decompressing image"
> -                               lz4 -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
> -                               break
> -                               ;;
> -                       *lzo)
> -                               echo "lzo decompressing image"
> -                               lzop -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
> -                               break
> -                               ;;
> -                       *lzma)
> -                               echo "lzma decompressing image"
> -                               lzma -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
> -                               break
> -                               ;;
> -                       *xz)
> -                               echo "xz decompressing image"
> -                               xz -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
> -                               break
> -                               ;;
> -                       esac
> -               fi
> -       done
> -       echo "Finished copy of initramfs into ./usr"
> -}
> -
> -do_bundle_initramfs () {
> -       if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
> -               echo "Creating a kernel image with a bundled initramfs..."
> -               copy_initramfs
> -               # Backing up kernel image relies on its type(regular file or symbolic link)
> -               tmp_path=""
> -               for imageType in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
> -                       if [ -h ${KERNEL_OUTPUT_DIR}/$imageType ] ; then
> -                               linkpath=`readlink -n ${KERNEL_OUTPUT_DIR}/$imageType`
> -                               realpath=`readlink -fn ${KERNEL_OUTPUT_DIR}/$imageType`
> -                               mv -f $realpath $realpath.bak
> -                               tmp_path=$tmp_path" "$imageType"#"$linkpath"#"$realpath
> -                       elif [ -f ${KERNEL_OUTPUT_DIR}/$imageType ]; then
> -                               mv -f ${KERNEL_OUTPUT_DIR}/$imageType ${KERNEL_OUTPUT_DIR}/$imageType.bak
> -                               tmp_path=$tmp_path" "$imageType"##"
> -                       fi
> -               done
> -               use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
> -               kernel_do_compile
> -               # Restoring kernel image
> -               for tp in $tmp_path ; do
> -                       imageType=`echo $tp|cut -d "#" -f 1`
> -                       linkpath=`echo $tp|cut -d "#" -f 2`
> -                       realpath=`echo $tp|cut -d "#" -f 3`
> -                       if [ -n "$realpath" ]; then
> -                               mv -f $realpath $realpath.initramfs
> -                               mv -f $realpath.bak $realpath
> -                               ln -sf $linkpath.initramfs ${B}/${KERNEL_OUTPUT_DIR}/$imageType.initramfs
> -                       else
> -                               mv -f ${KERNEL_OUTPUT_DIR}/$imageType ${KERNEL_OUTPUT_DIR}/$imageType.initramfs
> -                               mv -f ${KERNEL_OUTPUT_DIR}/$imageType.bak ${KERNEL_OUTPUT_DIR}/$imageType
> -                       fi
> -               done
> -       fi
> -}
> -do_bundle_initramfs[dirs] = "${B}"
> -
>  python do_devshell_prepend () {
>      os.environ["LDFLAGS"] = ''
>  }
>
> -addtask bundle_initramfs after do_install before do_deploy
> -
>  get_cc_option () {
>                 # Check if KERNEL_CC supports the option "file-prefix-map".
>                 # This option allows us to build images with __FILE__ values that do not
> @@ -302,22 +189,10 @@ kernel_do_compile() {
>                 export KCONFIG_NOTIMESTAMP=1
>                 bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
>         fi
> -       # The $use_alternate_initrd is only set from
> -       # do_bundle_initramfs() This variable is specifically for the
> -       # case where we are making a second pass at the kernel
> -       # compilation and we want to force the kernel build to use a
> -       # different initramfs image.  The way to do that in the kernel
> -       # is to specify:
> -       # make ...args... CONFIG_INITRAMFS_SOURCE=some_other_initramfs.cpio
> -       if [ "$use_alternate_initrd" = "" ] && [ "${INITRAMFS_TASK}" != "" ] ; then
> -               # The old style way of copying an prebuilt image and building it
> -               # is turned on via INTIRAMFS_TASK != ""
> -               copy_initramfs
> -               use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
> -       fi
>         cc_extra=$(get_cc_option)
> +       # extra_make is set via users of kernel_do_compile like do_initramfs_bundle
>         for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
> -               oe_runmake ${typeformake} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
> +               oe_runmake ${typeformake} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $extra_make
>         done
>         # vmlinux.gz is not built by kernel
>         if (echo "${KERNEL_IMAGETYPES}" | grep -wq "vmlinux\.gz"); then
> @@ -679,15 +554,6 @@ kernel_do_deploy() {
>                 tar -cvzf $deployDir/modules-${MODULE_TARBALL_NAME}.tgz -C ${D}${root_prefix} lib
>                 ln -sf modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
>         fi
> -
> -       if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
> -               for imageType in ${KERNEL_IMAGETYPES} ; do
> -                       initramfs_base_name=${imageType}-${INITRAMFS_NAME}
> -                       initramfs_symlink_name=${imageType}-${INITRAMFS_LINK_NAME}
> -                       install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${initramfs_base_name}.bin
> -                       ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
> -               done
> -       fi
>  }
>  do_deploy[cleandirs] = "${DEPLOYDIR}"
>  do_deploy[dirs] = "${DEPLOYDIR} ${B}"
> @@ -697,5 +563,22 @@ addtask deploy after do_populate_sysroot do_packagedata
>
>  EXPORT_FUNCTIONS do_deploy
>
> +# Here we pull in all various kernel image types which we support.
> +#
> +# In case you're wondering why kernel.bbclass inherits the other image
> +# types instead of the other way around, the reason for that is to
> +# maintain compatibility with various currently existing meta-layers.
> +# By pulling in the various kernel image types here, we retain the
> +# original behavior of kernel.bbclass, so no meta-layers should get
> +# broken.
> +#
> +# KERNEL_CLASSES by default pulls in kernel-uimage.bbclass, since this
> +# used to be the default behavior when only uImage was supported. This
> +# variable can be appended by users who implement support for new kernel
> +# image types.
> +
> +KERNEL_CLASSES ?= " kernel-uimage kernel-initramfs "
> +inherit ${KERNEL_CLASSES}
> +
>  # Add using Device Tree support
>  inherit kernel-devicetree
> ---
> 2.19.1
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

