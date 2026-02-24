Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70943F4BB6B
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 17:56:55 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26447.1771955806976208017
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 09:56:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=USnxzA/q;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-899afcec41eso5057596d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 09:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771955806; x=1772560606; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eYC6cagC6TnakJMUI5gTz7gZJ7rimcTpFK4/UNz40Qg=;
        b=USnxzA/q4O5mwiV+a+m7iNQ3td5MOwSHQONcckpyRNDkljYnYlzaIRq3QSlEcDysm4
         sQjrEFQz1MTirAItFthqrwrYpGRVs6BP9lXF1bNYEefYTuZVkYeu4t2/jeo1B9LQMxHu
         1VCs1yuULWSV+hDRQGjGqpDVcr51XcqazgGLXWBdOcIy4O7sKtMubwOVQp/6mceYjRxA
         d9aWshO8MEKysU/jLGv16cLozDDiX4Injb0F3TyekG4ZdbQjTxadsH6lScX/huKeKrv/
         KZS6JMS4+UsPLMPnTLn688xu5cfWF+368dmYd/V736yO4FqJ7yN20DZSnjk8N+vO0Wi5
         Hbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771955806; x=1772560606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYC6cagC6TnakJMUI5gTz7gZJ7rimcTpFK4/UNz40Qg=;
        b=Crr7OiZtzIoA5hpPZFXdJ09Ij1NzgAFAGLR21rk/N/rBne4mLnl/unBwNjrRUbtsa4
         H0WJVZ2gJcjqdjBPljEVMVV0wJ4qQaECyP4RDDvDjhilX8tu87fy5Zuqp5/ZwzgsqbuW
         HgFggGVXSnuua4ZiOI8M4NRO8pwbUZzt9Tr66NwRwUh+SKAxHE3xNl+UQSsSk2v2wHAV
         Ori9cduvQngl6RxRYDqRZbrK3WZZ2ey70ghFXFm3WuoeHkiZGZdtCOS+Xav+j95rYmVr
         8u63cWOGvfu0IAc6ozYPq4Uw7Z9iZ0z8jfDrYt7CM9C9Ys7mfAhg4lfiLaMJVjDrJkag
         1Zlw==
X-Gm-Message-State: AOJu0YzAzODehRrxt5mHBa37IZjX1orBnnV7nIRcLAS6WmEmafNFlDWI
	0LFvT9TjBXqJvU9abkVEe3jTA2j+VEtyRroraGYnt/6M3iLFu2rJY+QC
X-Gm-Gg: ATEYQzx6bgeuqbaUwBWEm8kLvqgNNiTtIdECyTfrIfQATmzBmSCCWrhqfh/+Y6dCjEl
	UsZR9302cU4SvA8mtFnKABzTtXOPevj/nTrdvL1vzsbGP+Ff6q3KeXz0A2FKYmnCz/QbM/8BtGV
	ppOmIvwCK6vA91JbCdhzBFoWJTQf1wvvt/A/sQuveFVcfxcTjA8AFUyGUQJWCcbsCd/9ZsfxQdg
	OTkfSjpiI+ZMQr8QL5QLUOcOfzkPERd2YoL/YL8nT77ISn5eS+wNjk/tJmP+lrx7SnoJny34yPO
	lcB1GtkKIqt//crSKB5tS70iiH5SKDautwbeaZ7hORWKOSGhtML8saoxD3XdAOYlOL8vHrwdac3
	dpNHzTb93hnoWfgJIHgT2wUbtUZEfPcrJT2gDU41HDoX7nZedXTT2e5G1ZYbRZIfNZ0Ne/BERsg
	NWuiJMlvSFyY8S5P4Eqx6FHUi9E0OJvlRjQwim02AsaEK4WEyPZ0UMqSk8JRGJOSWe9g==
X-Received: by 2002:a05:6214:401d:b0:896:fca0:2ba9 with SMTP id 6a1803df08f44-89979efd559mr195941086d6.57.1771955805414;
        Tue, 24 Feb 2026 09:56:45 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899b3863159sm5163886d6.24.2026.02.24.09.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 09:56:44 -0800 (PST)
Date: Tue, 24 Feb 2026 12:56:42 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org,
	Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: Re: [OE-core] [PATCH v5 02/10] ufs image class: add
Message-ID: <aZ3mWszZ8qiQo9t-@localhost.localdomain>
References: <20260223215008.2062721-1-twoerner@gmail.com>
 <20260223215008.2062721-3-twoerner@gmail.com>
 <36490e83fdeceabcb275e5d38daccb2640eebe2e.camel@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <36490e83fdeceabcb275e5d38daccb2640eebe2e.camel@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 17:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231900

On Tue 2026-02-24 @ 10:02:38 AM, Paul Barker wrote:
> On Mon, 2026-02-23 at 16:50 -0500, Trevor Woerner via
> lists.openembedded.org wrote:
> > Add an image class and wks file that demonstrates generating a wic image
> > with a 4096-byte sector size.
> > 
> > Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> > changes in v5:
> > - none
> > 
> > changes in v4:
> > - update the partition table format from mbr (msdos) to gpt
> > 
> > changes in v3:
> > - tested more scenarios and make sure to fix the warning from v1 in
> >   every case
> > 
> > changes in v2:
> > - add Mark as a co-creator (sorry for missing this the first time!)
> > - provide a fix for the following warning:
> > 	WARNING: core-image-minimal-1.0-r0 do_image_wic_ufs: Function do_image_wic_ufs doesn't exist
> > ---
> >  meta/classes-recipe/image.bbclass           |   2 +-
> >  meta/classes-recipe/image_types_ufs.bbclass | 221 ++++++++++++++++++++
> >  scripts/lib/wic/canned-wks/mkdisk-ufs.wks   |   5 +
> >  3 files changed, 227 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/classes-recipe/image_types_ufs.bbclass
> >  create mode 100644 scripts/lib/wic/canned-wks/mkdisk-ufs.wks
> > 
> > diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
> > index 53f1a9dc45b0..97465836c14a 100644
> > --- a/meta/classes-recipe/image.bbclass
> > +++ b/meta/classes-recipe/image.bbclass
> > @@ -18,7 +18,7 @@ inherit populate_sdk_base
> >  IMGCLASSES += "${@['', 'populate_sdk_ext']['linux' in d.getVar("SDK_OS")]}"
> >  IMGCLASSES += "${@bb.utils.contains_any('IMAGE_FSTYPES', 'live iso hddimg', 'image-live', '', d)}"
> >  IMGCLASSES += "${@bb.utils.contains('IMAGE_FSTYPES', 'container', 'image-container', '', d)}"
> > -IMGCLASSES += "image_types_wic"
> > +IMGCLASSES += "image_types_wic image_types_ufs"
> >  IMGCLASSES += "rootfs-postcommands"
> >  IMGCLASSES += "image-postinst-intercepts"
> >  IMGCLASSES += "overlayfs-etc"
> > diff --git a/meta/classes-recipe/image_types_ufs.bbclass b/meta/classes-recipe/image_types_ufs.bbclass
> > new file mode 100644
> > index 000000000000..9a984f084289
> > --- /dev/null
> > +++ b/meta/classes-recipe/image_types_ufs.bbclass
> > @@ -0,0 +1,221 @@
> > +#
> > +# Copyright OpenEmbedded Contributors
> > +#
> > +# SPDX-License-Identifier: MIT
> > +#
> > +
> > +# The WICUFSVARS variable is used to define the base list of bitbake variables used in wic code
> > +# variables from this list are written to <image>.env file
> > +WICUFSVARS ?= "\
> > +	APPEND \
> > +	ASSUME_PROVIDED \
> > +	BBLAYERS \
> > +	DEPLOY_DIR_IMAGE \
> > +	FAKEROOTCMD \
> > +	HOSTTOOLS_DIR \
> > +	IMAGE_BASENAME \
> > +	IMAGE_BOOT_FILES \
> > +	IMAGE_CLASSES \
> > +	IMAGE_EFI_BOOT_FILES \
> > +	IMAGE_EXTRA_PARTITION_FILES \
> > +	IMAGE_LINK_NAME \
> > +	IMAGE_ROOTFS \
> > +	IMGDEPLOYDIR \
> > +	INITRAMFS_FSTYPES \
> > +	INITRAMFS_IMAGE \
> > +	INITRAMFS_IMAGE_BUNDLE \
> > +	INITRAMFS_LINK_NAME \
> > +	INITRD \
> > +	INITRD_LIVE \
> > +	ISODIR \
> > +	KERNEL_CONSOLE \
> > +	KERNEL_IMAGETYPE \
> > +	MACHINE \
> > +	PSEUDO_INCLUDE_PATHS \
> > +	RECIPE_SYSROOT_NATIVE \
> > +	ROOTFS_SIZE \
> > +	STAGING_DATADIR \
> > +	STAGING_DIR \
> > +	STAGING_DIR_HOST \
> > +	STAGING_LIBDIR \
> > +	TARGET_SYS \
> > +"
> > +
> > +inherit_defer ${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', 'kernel-artifact-names', '', d)}
> > +
> > +WKSUFS_FILE ??= "${WKS_FILE}"
> > +WKSUFS_FILES ?= "${WKSUFS_FILE} ${IMAGE_BASENAME}.wks"
> > +WKSUFS_SEARCH_PATH ?= "${THISDIR}:${@':'.join('%s/wic' % p for p in '${BBPATH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l for l in '${BBPATH}:${COREBASE}'.split(':'))}"
> > +WKSUFS_FULL_PATH = "${@wks_search(d.getVar('WKSUFS_FILES').split(), d.getVar('WKSUFS_SEARCH_PATH')) or ''}"
> > +
> > +def wks_search(files, search_path):
> > +    for f in files:
> > +        if os.path.isabs(f):
> > +            if os.path.exists(f):
> > +                return f
> > +        else:
> > +            searched = bb.utils.which(search_path, f)
> > +            if searched:
> > +                return searched
> > +
> > +def wks_checksums(files, search_path):
> > +    ret = ""
> > +    for f in files:
> > +        found, hist = bb.utils.which(search_path, f, history=True)
> > +        ret = ret + " " + " ".join(h + ":False" for h in hist[:-1])
> > +        if found:
> > +            ret = ret + " " + found + ":True"
> > +    return ret
> > +
> > +
> > +WICUFS_CREATE_EXTRA_ARGS ?= "${WIC_CREATE_EXTRA_ARGS}"
> > +
> > +IMAGE_CMD:wic.ufs () {
> > +	out="${IMGDEPLOYDIR}/${IMAGE_NAME}"
> > +	build_wic_ufs="${WORKDIR}/build-wic-ufs"
> > +	tmp_wic_ufs="${WORKDIR}/tmp-wic-ufs"
> > +	wks="${WKSUFS_FULL_PATH}"
> > +	if [ -e "$tmp_wic_ufs" ]; then
> > +		# Ensure we don't have any junk leftover from a previously interrupted
> > +		# do_image_wic_ufs execution
> > +		rm -rf "$tmp_wic_ufs"
> > +	fi
> > +	if [ -z "$wks" ]; then
> > +		bbfatal "No kickstart files from WKSUFS_FILES were found: ${WKSUFS_FILES}. Please set WKSUFS_FILE or WKSUFS_FILES appropriately."
> > +	fi
> > +	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create --debug "$wks" --sector-size 4096 --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}-ufs" -o "$build_wic_ufs/" -w "$tmp_wic_ufs" ${WICUFS_CREATE_EXTRA_ARGS}
> > +
> > +	# look to see if the user specifies a custom imager
> > +	IMAGER=direct
> > +	eval set -- "${WICUFS_CREATE_EXTRA_ARGS} --"
> > +	while [ 1 ]; do
> > +		case "$1" in
> > +			--imager|-i)
> > +				shift
> > +				IMAGER=$1
> > +				;;
> > +			--)
> > +				shift
> > +				break
> > +				;;
> > +		esac
> > +		shift
> > +	done
> > +	mv "$build_wic_ufs/$(basename "${wks%.wks}")"*.${IMAGER} "$out.wic.ufs"
> > +}
> > +IMAGE_CMD:wic.ufs[vardepsexclude] = "WKSUFS_FULL_PATH WKSUFS_FILES TOPDIR"
> > +SPDX_IMAGE_PURPOSE:wic.ufs = "diskImage"
> > +do_image_wic_ufs[cleandirs] = "${WORKDIR}/build-wic-ufs"
> > +
> > +# Rebuild when the wks file or vars in WICUFSVARS change
> > +USING_WIC_UFS = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic.ufs ' + ' '.join('wic.ufs.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
> > +WKSUFS_FILE_CHECKSUM = "${@wks_checksums(d.getVar('WKSUFS_FILES').split(), d.getVar('WKSUFS_SEARCH_PATH')) if '${USING_WIC_UFS}' else ''}"
> > +do_image_wic_ufs[file-checksums] += "${WKSUFS_FILE_CHECKSUM}"
> > +do_image_wic_ufs[depends] += "${@' '.join('%s-native:do_populate_sysroot' % r for r in ('parted', 'gptfdisk', 'dosfstools', 'mtools'))}"
> > +
> > +# We ensure all artfacts are deployed (e.g virtual/bootloader)
> > +do_image_wic_ufs[recrdeptask] += "do_deploy"
> > +do_image_wic_ufs[deptask] += "do_image_complete"
> > +
> > +WKSUFS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
> > +WKSUFS_FILE_DEPENDS_DEFAULT += "bmaptool-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
> > +# Unified kernel images need objcopy
> > +WKSUFS_FILE_DEPENDS_DEFAULT += "virtual/cross-binutils"
> > +WKSUFS_FILE_DEPENDS_BOOTLOADERS = ""
> > +WKSUFS_FILE_DEPENDS_BOOTLOADERS:aarch64 = "grub-efi systemd-boot"
> > +WKSUFS_FILE_DEPENDS_BOOTLOADERS:arm = "systemd-boot"
> > +WKSUFS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot"
> > +WKSUFS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux grub-efi systemd-boot"
> > +WKSUFS_FILE_DEPENDS_BOOTLOADERS:x86-x32 = "syslinux grub-efi"
> > +
> > +WKSUFS_FILE_DEPENDS ??= "${WKSUFS_FILE_DEPENDS_DEFAULT} ${WKSUFS_FILE_DEPENDS_BOOTLOADERS}"
> > +
> > +DEPENDS += "${@ '${WKSUFS_FILE_DEPENDS}' if d.getVar('USING_WIC_UFS') else '' }"
> > +
> > +python do_write_wksufs_template () {
> > +    """Write out expanded template contents to WKSUFS_FULL_PATH."""
> > +    import re
> > +
> > +    template_body = d.getVar('_WKSUFS_TEMPLATE')
> > +
> > +    # Remove any remnant variable references left behind by the expansion
> > +    # due to undefined variables
> > +    expand_var_regexp = re.compile(r"\${[^{}@\n\t :]+}")
> > +    while True:
> > +        new_body = re.sub(expand_var_regexp, '', template_body)
> > +        if new_body == template_body:
> > +            break
> > +        else:
> > +            template_body = new_body
> > +
> > +    wks_file = d.getVar('WKSUFS_FULL_PATH')
> > +    with open(wks_file, 'w') as f:
> > +        f.write(template_body)
> > +    f.close()
> > +    # Copy the finalized wks file to the deploy directory for later use
> > +    depdir = d.getVar('IMGDEPLOYDIR')
> > +    basename = d.getVar('IMAGE_BASENAME') + '-ufs'
> > +    bb.utils.copyfile(wks_file, "%s/%s" % (depdir, basename + '-' + os.path.basename(wks_file)))
> > +}
> > +
> > +do_flush_pseudodb() {
> > +	${FAKEROOTENV} ${FAKEROOTCMD} -S
> > +}
> > +
> > +python () {
> > +    if d.getVar('USING_WIC_UFS'):
> > +        wksufs_file_u = d.getVar('WKSUFS_FULL_PATH', False)
> > +        wksufs_file = d.expand(wksufs_file_u)
> > +        base, ext = os.path.splitext(wksufs_file)
> > +        if ext == '.in' and os.path.exists(wksufs_file):
> > +            wksufs_out_file = os.path.join(d.getVar('WORKDIR'), os.path.basename(base))
> > +            d.setVar('WKSUFS_FULL_PATH', wksufs_out_file)
> > +            d.setVar('WKSUFS_TEMPLATE_PATH', wksufs_file_u)
> > +            d.setVar('WKSUFS_FILE_CHECKSUM', '${WKSUFS_TEMPLATE_PATH}:True')
> > +
> > +            # We need to re-parse each time the file changes, and bitbake
> > +            # needs to be told about that explicitly.
> > +            bb.parse.mark_dependency(d, wksufs_file)
> > +
> > +            try:
> > +                with open(wksufs_file, 'r') as f:
> > +                    body = f.read()
> > +            except (IOError, OSError) as exc:
> > +                pass
> > +            else:
> > +                # Previously, I used expandWithRefs to get the dependency list
> > +                # and add it to WICUFSVARS, but there's no point re-parsing the
> > +                # file in process_wks_template as well, so just put it in
> > +                # a variable and let the metadata deal with the deps.
> > +                d.setVar('_WKSUFS_TEMPLATE', body)
> > +                bb.build.addtask('do_write_wksufs_template', 'do_image_wic_ufs', 'do_image', d)
> > +        bb.build.addtask('do_image_wic_ufs', 'do_image_complete', 'do_image_wic', d)
> > +}
> > +
> > +#
> > +# Write environment variables used by wic
> > +# to tmp/sysroots/<machine>/imgdata/<image>-ufs.env
> > +#
> > +python do_rootfs_wicufsenv () {
> > +    wicufsvars = d.getVar('WICUFSVARS')
> > +    if not wicufsvars:
> > +        return
> > +
> > +    stdir = d.getVar('STAGING_DIR')
> > +    outdir = os.path.join(stdir, d.getVar('MACHINE'), 'imgdata')
> > +    bb.utils.mkdirhier(outdir)
> > +    basename = d.getVar('IMAGE_BASENAME') + '-ufs'
> > +    with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
> > +        for var in wicufsvars.split():
> > +            value = d.getVar(var)
> > +            if value:
> > +                envf.write('%s="%s"\n' % (var, value.strip()))
> > +    envf.close()
> > +    # Copy .env file to deploy directory for later use with stand alone wic
> > +    depdir = d.getVar('IMGDEPLOYDIR')
> > +    bb.utils.copyfile(os.path.join(outdir, basename) + '.env', os.path.join(depdir, basename) + '.env')
> > +}
> > +addtask do_flush_pseudodb after do_rootfs before do_image do_image_qa
> > +addtask do_rootfs_wicufsenv after do_image before do_image_wic_ufs
> > +do_rootfs_wicufsenv[vardeps] += "${WICUFSVARS}"
> > +do_rootfs_wicufsenv[prefuncs] = 'set_image_size'
> 
> This is mostly duplication of code from image_types_wic.bbclass with
> different variable names, which makes it difficult to review the
> meaningful differences. Why do we need a separate class here? If we do
> need one, can we reduce duplication?

At work we create sector-size=512 and sector-size=4k images in the same
build (the 4k images are for UFS-based flash devices). With a separate
class we can generate these images simultaneously rather than doing them
one after the other. But (I believe) the only way to generate them
simultaneously is to have separate classes with separate variable names,
otherwise they will clobber each other.

As UFS-based flash becomes more popular, I'm guessing more users of The
Yocto Project will be interested in having support for it readily
available. Therefore I wanted to provide it in oe-core.

The most significant difference between these two classes is the
"--sector-size 4096" option to the wic command.

Can we reduce duplication? Almost every line of both these classes has a
wic-related variable in it. If the variables need to be kept separate so
that parallel builds don't clobber each other, there aren't very many
lines in common!

If I am correct that separate classes with separate variable names are
needed to be able to generate both images simultaneously, would this
patch be okay as-is in a v6 patchset?

