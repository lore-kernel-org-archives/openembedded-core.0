Return-Path: <m.felsch@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA7CC2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 20:16:06 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.4767.1747685759565379487
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 13:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: mfe@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uH6tx-0003qJ-Hr; Mon, 19 May 2025 22:15:57 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uH6tw-000Iix-1m;
	Mon, 19 May 2025 22:15:56 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uH6tw-00Ef2T-1P;
	Mon, 19 May 2025 22:15:56 +0200
Date: Mon, 19 May 2025 22:15:56 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: AdrianF <adrian.freihofer@siemens.com>
Cc: openembedded-core@lists.openembedded.org, marex@denx.de,
	yocto@pengutronix.de
Subject: Re: [PATCH v4 07/16] kernel-fit-image.bbclass: add a new FIT image
 implementation
Message-ID: <20250519201556.m5cve4ufizexazuy@pengutronix.de>
References: <20250519110838.82978-1-adrian.freihofer@siemens.com>
 <20250519110838.82978-8-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519110838.82978-8-adrian.freihofer@siemens.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 20:16:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216877

Hi Adrian,

thanks for your patch, please see my comments below.

On 25-05-19, AdrianF wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
> 
> The new recipe linux-yocto-fitimage.bb and the new
> kernel-fit-image.bbclass are intended to become successors of the
> kernel-fitimage.bbclass.
> 
> Instead of injecting the FIT image related build steps into the kernel
> recipe, the new recipe takes the kernel artifacts from the kernel recipe
> and creates the FIT image as an independent task.
> 
> This solves some basic problems:
> * sstate does not work well when a fitImage contains an initramfs. The
>   kernel is rebuilt from scratch if the build runs from an empty TMPDIR.
> * A fitImage kernel is not available as a package, but all other kernel
>   image types are.
> * The task dependencies in the kernel are very complex and difficult to
>   debug if something goes wrong. As a separate, downstream recipe, this
>   is now much easier.
> 
> The recipe takes the kernel artifacts from the deploy folder. There was
> also a test implementation passing the kernel artifacts via sysroot
> directory. This requires changes on the kernel.bbclass to make it
> copying the artifacts also to the sysroot directory while the same
> artifacts are already in the sstate-cached deploy directory.
> 
> The long story about this issue is here:
> [YOCTO #12912]
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  meta/classes-recipe/kernel-fit-image.bbclass  | 184 +++++++
>  meta/classes/multilib.bbclass                 |   1 +
>  meta/lib/oe/fitimage.py                       | 463 ++++++++++++++++++
>  .../linux/linux-yocto-fitimage_6.12.bb        |  13 +
>  4 files changed, 661 insertions(+)
>  create mode 100644 meta/classes-recipe/kernel-fit-image.bbclass
>  create mode 100644 meta/lib/oe/fitimage.py
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-fitimage_6.12.bb
> 
> diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
> new file mode 100644
> index 00000000000..67c717f88d5
> --- /dev/null
> +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> @@ -0,0 +1,184 @@
> +
> +inherit kernel-arch kernel-artifact-names uboot-config deploy
> +require conf/image-fitimage.conf
> +
> +S = "${WORKDIR}/sources"
> +UNPACKDIR = "${S}"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +DEPENDS += "\
> +    u-boot-tools-native dtc-native \
> +    ${@'kernel-signing-keys-native' if d.getVar('FIT_GENERATE_KEYS') == '1' else ''} \
> +"
> +
> +python () {
> +    image = d.getVar('INITRAMFS_IMAGE')
> +    if image and d.getVar('INITRAMFS_IMAGE_BUNDLE') != '1':
> +        if d.getVar('INITRAMFS_MULTICONFIG'):
> +            mc = d.getVar('BB_CURRENT_MC')
> +            d.appendVarFlag('do_compile', 'mcdepends', ' mc:' + mc + ':${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_complete')
> +        else:
> +            d.appendVarFlag('do_compile', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
> +
> +    #check if there are any dtb providers
> +    providerdtb = d.getVar("PREFERRED_PROVIDER_virtual/dtb")
> +    if providerdtb:
> +        d.appendVarFlag('do_compile', 'depends', ' virtual/dtb:do_populate_sysroot')
> +        d.setVar('EXTERNAL_KERNEL_DEVICETREE', "${RECIPE_SYSROOT}/boot/devicetree")
> +}
> +
> +do_configure[noexec] = "1"
> +
> +UBOOT_MKIMAGE_KERNEL_TYPE ?= "kernel"
> +KERNEL_IMAGEDEST ?= "/boot"
> +
> +python do_compile() {
> +    import shutil
> +    import oe.fitimage
> +
> +    itsfile = "fit-image.its"
> +    fitname = "fitImage"
> +    kernel_deploydir = d.getVar('DEPLOY_DIR_IMAGE')
> +    kernel_deploysubdir = d.getVar('KERNEL_DEPLOYSUBDIR')
> +    if kernel_deploysubdir:
> +        kernel_deploydir = os.path.join(kernel_deploydir, kernel_deploysubdir)
> +
> +    # Collect all the its nodes before the its file is generated and mkimage gets executed
> +    root_node = oe.fitimage.ItsNodeRootKernel(
> +        d.getVar("FIT_DESC"), d.getVar("FIT_ADDRESS_CELLS"),
> +        d.getVar('HOST_PREFIX'), d.getVar('UBOOT_ARCH'),  d.getVar("FIT_CONF_PREFIX"),
> +        oe.types.boolean(d.getVar('UBOOT_SIGN_ENABLE')), d.getVar("UBOOT_SIGN_KEYDIR"),

Since FIT is bootloader agnostic I would like to see to rename the
UBOOT_* related variables, since there are bootloaders which supports
FIT as well e.g. barebox:
 - https://git.openembedded.org/openembedded-core/tree/meta/recipes-bsp/barebox/barebox.bb?h=walnascar

> +        d.getVar("UBOOT_MKIMAGE"), d.getVar("UBOOT_MKIMAGE_DTCOPTS"),
> +        d.getVar("UBOOT_MKIMAGE_SIGN"), d.getVar("UBOOT_MKIMAGE_SIGN_ARGS"),
> +        d.getVar('FIT_HASH_ALG'), d.getVar('FIT_SIGN_ALG'), d.getVar('FIT_PAD_ALG'),
> +        d.getVar('UBOOT_SIGN_KEYNAME'),
> +        oe.types.boolean(d.getVar('FIT_SIGN_INDIVIDUAL')), d.getVar('UBOOT_SIGN_IMG_KEYNAME')
> +    )
> +
> +    # Prepare a kernel image section.
> +    shutil.copyfile(os.path.join(kernel_deploydir, "linux.bin"), "linux.bin")
> +    with open(os.path.join(kernel_deploydir, "linux_comp")) as linux_comp_f:
> +        linux_comp = linux_comp_f.read()
> +    root_node.fitimage_emit_section_kernel("kernel-1", "linux.bin", linux_comp,
> +        d.getVar('UBOOT_LOADADDRESS'), d.getVar('UBOOT_ENTRYPOINT'),
> +        d.getVar('UBOOT_MKIMAGE_KERNEL_TYPE'), d.getVar("UBOOT_ENTRYSYMBOL"))
> +
> +    # Prepare a DTB image section
> +    kernel_devicetree = d.getVar('KERNEL_DEVICETREE')
> +    external_kernel_devicetree = d.getVar("EXTERNAL_KERNEL_DEVICETREE")

Where are the KERNEL_DEVICETREE and EXTERNAL_KERNEL_DEVICETREE variables
defined?

> +    if kernel_devicetree:
> +        for dtb in kernel_devicetree.split():
> +            dtb_name = os.path.basename(dtb)
> +
> +            # Skip DTB if it's also provided in EXTERNAL_KERNEL_DEVICETREE directory
> +            if external_kernel_devicetree:
> +                ext_dtb_path = os.path.join(external_kernel_devicetree, dtb_name)
> +                if os.path.exists(ext_dtb_path) and os.path.getsize(ext_dtb_path) > 0:
> +                    continue
> +
> +            # Copy the dtb or dtbo file into the FIT image assembly directory
> +            shutil.copyfile(os.path.join(kernel_deploydir, dtb_name), dtb_name)
> +            root_node.fitimage_emit_section_dtb(dtb_name, dtb_name,
> +                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"))
> +
> +    if external_kernel_devicetree:
> +        # iterate over all .dtb and .dtbo files in the external kernel devicetree directory
> +        # and copy them to the FIT image assembly directory
> +        for dtb_name in os.listdir(external_kernel_devicetree):
> +            if dtb_name.endswith('.dtb') or dtb_name.endswith('.dtbo'):
> +                dtb_path = os.path.join(external_kernel_devicetree, dtb_name)
> +
> +                # Also skip if a symlink. We'll later have each config section point at it
> +                if oe.fitimage.symlink_points_below(dtb_name, external_kernel_devicetree):
> +                    continue
> +
> +                shutil.copyfile(dtb_path, dtb_name)
> +                root_node.fitimage_emit_section_dtb(dtb_name, dtb_name,
> +                    d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"))
> +
> +    # Prepare a u-boot script section
> +    fit_uboot_env = d.getVar("FIT_UBOOT_ENV")

Same question for FIT_UBOOT_ENV.

> +    if fit_uboot_env:
> +        root_node.fitimage_emit_section_boot_script("bootscr-"+fit_uboot_env , fit_uboot_env)
> +
> +    # Prepare a setup section (For x86)

Huh.. this is rather uncommen. IIRC the primary goal of FIT images was
to have a container format for embedded verified boot setups, e.g.
ARM/ARM64/RISC-V. On x86 UKIs:
  - https://uapi-group.org/specifications/specs/unified_kernel_image

should be used instead.

> +    setup_bin_path = os.path.join(kernel_deploydir, "setup.bin")
> +    if os.path.exists(setup_bin_path):
> +        shutil.copyfile(setup_bin_path, "setup.bin")
> +        root_node.fitimage_emit_section_setup("setup-1", "setup.bin")
> +
> +    # Prepare a ramdisk section.
> +    initramfs_image = d.getVar('INITRAMFS_IMAGE')
> +    if initramfs_image and d.getVar("INITRAMFS_IMAGE_BUNDLE") != '1':
> +        # Find and use the first initramfs image archive type we find
> +        found = False
> +        for img in d.getVar("FIT_SUPPORTED_INITRAMFS_FSTYPES").split():
> +            initramfs_path = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), "%s.%s" % (d.getVar('INITRAMFS_IMAGE_NAME'), img))
> +            if os.path.exists(initramfs_path):
> +                bb.note("Found initramfs image: " + initramfs_path)
> +                found = True
> +                root_node.fitimage_emit_section_ramdisk("ramdisk-1", initramfs_path,
> +                    initramfs_image,
> +                    d.getVar("UBOOT_RD_LOADADDRESS"),
> +                    d.getVar("UBOOT_RD_ENTRYPOINT"))
> +                break
> +            else:
> +                bb.note("Did not find initramfs image: " + initramfs_path)
> +
> +        if not found:
> +            bb.fatal("Could not find a valid initramfs type for %s, the supported types are: %s" % (d.getVar('INITRAMFS_IMAGE_NAME'), d.getVar('FIT_SUPPORTED_INITRAMFS_FSTYPES')))
> +
> +    # Generate the configuration section
> +    root_node.fitimage_emit_section_config()
> +
> +    # Write the its file
> +    root_node.write_its_file(itsfile)
> +
> +    # Assemble the FIT image
> +    root_node.run_mkimage_assemble(itsfile, fitname)
> +
> +    # Sign the FIT image if required
> +    root_node.run_mkimage_sign(fitname)
> +}
> +do_compile[depends] += "virtual/kernel:do_deploy"

...

> diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
> new file mode 100644
> index 00000000000..735c09b151d
> --- /dev/null
> +++ b/meta/lib/oe/fitimage.py

...

> +    def run_mkimage_sign(self, fitfile):
> +        if not self._sign_enable:
> +            bb.debug(1, "FIT image signing is disabled. Skipping signing.")
> +            return
> +
> +        # Some sanity checks because mkimage exits with 0 also without needed keys
> +        sign_key_path = os.path.join(self._sign_keydir, self._sign_keyname_conf)
> +        if not os.path.exists(sign_key_path + '.key') or not os.path.exists(sign_key_path + '.crt'):
> +            bb.fatal("%s.key or .crt does not exist" % sign_key_path)
> +        if self._sign_individual:
> +            sign_key_img_path = os.path.join(self._sign_keydir, self._sign_keyname_img)
> +            if not os.path.exists(sign_key_img_path + '.key') or not os.path.exists(sign_key_img_path + '.crt'):
> +                bb.fatal("%s.key or .crt does not exist" % sign_key_img_path)

This is a very critical part since storing the priv. key within a
directory increases the risk of a key leakage.

Therefore the fitimage.bbclass from meta-openembedded supports the
PKCS#11 API:
 - https://github.com/openembedded/meta-openembedded/blob/master/meta-oe/classes/fitimage.bbclass#L48

by using the signing.bbclass.

Regards,
  Marco

