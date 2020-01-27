Return-Path: <paul.barker@konsulko.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4FFB07FD68
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 10:09:37 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id g64so7779668otb.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 02:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=v0kUZ0SrCV+ROTuuyImV5FeHif/pbpV9uSUjLAWFV9A=;
	b=pDCfVqcv05yYWh2wtD5ueTZVy2KjhJfm/Iu9b4Q7i6V1DPxtJ50AUcNvYw2v9Ohirf
	whtdqeTdKWAlt8iogVBDbOoxWw1rvQFtP1CYJvatVe6lad7JdDOLcSi30rhJq65EejEa
	8ya6LO340kmB1gJgYj6XYNe7fLI/J19GGIxl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=v0kUZ0SrCV+ROTuuyImV5FeHif/pbpV9uSUjLAWFV9A=;
	b=SGxMU+bzAb64uDUQRwxlDBA8hHUOSzeOR6zOOnU3MODreM9DetubF63gbyT2twpaVu
	lBHlgjB54iOTap5x9rk4BFelL9dqGLFVpFGL75ayf0xjEDVrjJbjIvj5xIUzUHbnE15K
	spvHuDXhkjPDKYjafXlRhLHUOQ2aL03fUEgdmJHjnQOOJAlCUnUb9g0RXkQiIfrTY2Kz
	xRkJvUTs7BIN9yy6+0HOLAjDHBo9MKtP6P5MFPWYfkG47m0IPfhhu06nEUaFqCy8PJaA
	inJ1EbSMDnZsqQIhnV1G35G++xcJwWVgnbH3iX7DZOG+NUXxHKMqsNLy76KZMp0gSCEB
	erJw==
X-Gm-Message-State: APjAAAV4og3XfjsrZfmjkH3O5LhBYEjn24wwBNAPqpbaIBGvNwtAdo8X
	SEt+YTQDbimHXryHt0YjC7bkzOcqk5eBNT1g7uGmQMK4uDJFTQ==
X-Google-Smtp-Source: APXvYqxMp5rK/R4VsANPRwv8SvsM+fIY0hqPExT7xRANNVWZ846AwIc445ZSk/lYbKzgHjd/JbfwQHl+QZGIwcoLxno=
X-Received: by 2002:a05:6830:194:: with SMTP id
	q20mr12362010ota.92.1580119778133; 
	Mon, 27 Jan 2020 02:09:38 -0800 (PST)
MIME-Version: 1.0
References: <1580119213-10641-1-git-send-email-alejandro@enedino.org>
In-Reply-To: <1580119213-10641-1-git-send-email-alejandro@enedino.org>
From: Paul Barker <pbarker@konsulko.com>
Date: Mon, 27 Jan 2020 10:09:27 +0000
Message-ID: <CAM9ZRVvWRcvV3MMZCwr3-Au2KKU2xJcMi=jkLDZtHKTB7822Nw@mail.gmail.com>
To: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] baremetal-helloworld: Create recipe for baremetal examples on QEMU
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
X-List-Received-Date: Mon, 27 Jan 2020 10:09:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Jan 2020 at 10:00, Alejandro Enedino Hernandez Samaniego
<alejandro@enedino.org> wrote:
>
> Create HelloWorld examples that run on several of the QEMU architectures
> supported by the build system.
>
> This recipe can be used by anyone to understand how baremetal applications
> can be built using OpenEmbedded and how the wiring to set them up could be.
>
> This should also facilitate creating/extending the OE testing infrastructure
> to allow baremetal applications or RTOSs to be tested in the same way that
> Linux currently is.
>
> This can easily be extended to work on other MACHINES in the future.
>
> To run this example:
>
> # Source the oe environment as usual
> $ source oe-init-buildenv
>
> # Set TCLIBC to either newlib or baremetal
> $ echo "TCLIBC = \"newlib\"" >> ./conf/local.conf
>
> # Use one of the supported architectures (qemuarm64, qemuarm or qemuarmv5)
> $ echo "MACHINE = \"qemuarm64\"" >> ./conf/local.conf
>
> # Build
> $ bitbake baremetal-helloworld
>
> # Launch QEMU
> $ runqemu
>
> runqemu - INFO - Running bitbake -e ...
> runqemu - INFO - Continuing with the following parameters:
> KERNEL: [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.bin]
> MACHINE: [qemuarm64]
> FSTYPE: [bin]
> ROOTFS: [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.bin]
> CONFFILE: [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.qemuboot.conf]
>
> Hello OpenEmbedded!
>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
> ---
>  .../baremetal-examples/baremetal-helloworld_git.bb | 114 +++++++++++++++++++++
>  1 file changed, 114 insertions(+)
>  create mode 100644 meta/recipes-extended/baremetal-examples/baremetal-helloworld_git.bb
>
> diff --git a/meta/recipes-extended/baremetal-examples/baremetal-helloworld_git.bb b/meta/recipes-extended/baremetal-examples/baremetal-helloworld_git.bb
> new file mode 100644
> index 0000000..aab48b1
> --- /dev/null
> +++ b/meta/recipes-extended/baremetal-examples/baremetal-helloworld_git.bb
> @@ -0,0 +1,114 @@
> +SUMMARY = "Baremetal examples to work with the several QEMU architectures supported on OpenEmbedded"
> +HOMEPAGE = "https://github.com/aehs29/baremetal-helloqemu"
> +LICENSE = "CC-BY-SA-4.0"

I've raised https://github.com/aehs29/baremetal-helloqemu/issues/1 as
CC licenses aren't recommended for software.

> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4084714af41157e38872e798eb3fe1b1"
> +
> +SRCREV = "fe81742f1159725408dd7305e40e7bd4dfd1e264"
> +
> +SRC_URI = "git://github.com/aehs29/baremetal-helloqemu.git;protocol=https "
> +
> +S = "${WORKDIR}/git"
> +B = "${WORKDIR}/build"
> +
> +# These examples are not meant to be built when using either musl or glibc
> +COMPATIBLE_HOST_libc-musl_class-target = "null"
> +COMPATIBLE_HOST_libc-glibc_class-target = "null"
> +
> +# This will be translated automatically to the architecture and
> +# machine that QEMU uses on OE, e.g. -machine virt -cpu cortex-a57
> +# but the examples can also be run on other architectures/machines
> +# such as vexpress-a15 by overriding the setting on the machine.conf
> +COMPATIBLE_MACHINE = "qemuarmv5|qemuarm|qemuarm64"
> +
> +BAREMETAL_QEMUARCH ?= ""
> +BAREMETAL_QEMUARCH_qemuarmv5 = "versatile"
> +BAREMETAL_QEMUARCH_qemuarm = "arm"
> +BAREMETAL_QEMUARCH_qemuarm64 = "aarch64"
> +
> +
> +EXTRA_OEMAKE_append = " QEMUARCH=${BAREMETAL_QEMUARCH}"
> +
> +do_configure(){
> +    # Avoid building on the source directory
> +    cp ${S}/* ${B}
> +}
> +
> +do_install(){
> +    install -d ${D}/${datadir}
> +    install -m 755 ${B}/hello_baremetal_${BAREMETAL_QEMUARCH}.bin ${D}/${datadir}/hello_baremetal_${MACHINE}.bin
> +    install -m 755 ${B}/hello_baremetal_${BAREMETAL_QEMUARCH}.elf ${D}/${datadir}/hello_baremetal_${MACHINE}.elf
> +}
> +
> +# Make sure there are no race conditions when
> +# assembling compiling and linking steps
> +PARALLEL_MAKE = ""
> +
> +# Borrowed from meta-freertos

Can these borrowed sections go into a bbclass to make the example
simpler? meta-freertos might then be able to use the bbclass from
openembedded-core.

> +inherit rootfs-postcommands
> +inherit deploy
> +do_deploy[dirs] = "${DEPLOYDIR} ${DEPLOY_DIR_IMAGE}"
> +do_rootfs[dirs] = "${DEPLOYDIR} ${DEPLOY_DIR_IMAGE}"
> +DEPLOYDIR = "${IMGDEPLOYDIR}"
> +IMAGE_LINK_NAME ?= "baremetal-helloworld-image-${MACHINE}"
> +IMAGE_NAME_SUFFIX ?= ""
> +
> +do_deploy(){
> +    install ${D}/${datadir}/hello_baremetal_${MACHINE}.bin ${DEPLOYDIR}/${IMAGE_LINK_NAME}.bin
> +    install ${D}/${datadir}/hello_baremetal_${MACHINE}.elf ${DEPLOYDIR}/${IMAGE_LINK_NAME}.elf
> +}
> +
> +do_image(){
> +    :
> +}
> +
> +FILES_${PN} += " \
> +    ${datadir}/hello_baremetal_${MACHINE}.bin \
> +    ${datadir}/hello_baremetal_${MACHINE}.elf \
> +"
> +
> +python do_rootfs(){
> +    from oe.utils import execute_pre_post_process
> +    from pathlib import Path
> +
> +    # Write empty manifest testdate file
> +    deploy_dir = d.getVar('DEPLOYDIR')
> +    link_name = d.getVar('IMAGE_LINK_NAME')
> +    manifest_name = d.getVar('IMAGE_MANIFEST')
> +
> +    Path(manifest_name).touch()
> +    if os.path.exists(manifest_name) and link_name:
> +        manifest_link = deploy_dir + "/" + link_name + ".manifest"
> +        if os.path.lexists(manifest_link):
> +            os.remove(manifest_link)
> +        os.symlink(os.path.basename(manifest_name), manifest_link)
> +    execute_pre_post_process(d, d.getVar('ROOTFS_POSTPROCESS_COMMAND'))
> +}
> +
> +# QEMU generic FreeRTOS parameters
> +QB_DEFAULT_KERNEL = "${IMAGE_LINK_NAME}.bin"
> +QB_MEM = "-m 256"
> +QB_OPT_APPEND = "-nographic"
> +QB_DEFAULT_FSTYPE = "bin"
> +QB_DTB = ""
> +
> +# This next part is necessary to trick the build system into thinking
> +# its building an image recipe so it generates the qemuboot.conf
> +addtask do_deploy after do_write_qemuboot_conf before do_build
> +addtask do_rootfs before do_deploy after do_install
> +addtask do_image after do_rootfs before do_build
> +inherit qemuboot
> +
> +# Based on image.bbclass to make sure we build qemu
> +python(){
> +    # do_addto_recipe_sysroot doesnt exist for all recipes, but we need it to have
> +    # /usr/bin on recipe-sysroot (qemu) populated
> +    def extraimage_getdepends(task):
> +        deps = ""
> +        for dep in (d.getVar('EXTRA_IMAGEDEPENDS') or "").split():
> +        # Make sure we only add it for qemu
> +            if 'qemu' in dep:
> +                deps += " %s:%s" % (dep, task)
> +        return deps
> +    d.appendVarFlag('do_image', 'depends', extraimage_getdepends('do_addto_recipe_sysroot'))
> +    d.appendVarFlag('do_image', 'depends', extraimage_getdepends('do_populate_sysroot'))
> +}
> --
> 2.7.4

Thanks,
Paul

