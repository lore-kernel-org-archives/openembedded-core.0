Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B773C54E76
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 12:49:19 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.49338.1700484552090222369
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 04:49:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ew2mH/9N;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-548d1f8b388so885373a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 04:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700484550; x=1701089350; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mymSOQ5pVLXnJr/ay9d4wedzh8VWnzxFJmK6JBuJ6S8=;
        b=ew2mH/9Nyzm4tmXcEZ3V0jaesbiOLLQxzHbFooO7mAyOgISLbZbZzxkViKeKU/uacr
         9w0RpLdOgD1v/HL0ltTqxXaS/D9FlVv9JRRYsyNWP/4+RuqwtL41oVukj78kbNhbNXyP
         IPsyo04L/nSiiOmT7U7Sc49r9YWGcFd34w+wIYbm0CvvTb3Xud+eJj+HRGkKsaNbcx92
         C7CB4mHZIyEVKDuMWgc47A7+PNYQOrTETN23RG1QG8x3YoQs1GRZG1zzTpyPcapT8Jyh
         QXj4DmQGjSCeu4VjmiwCGZlLUJ559PIPZQgc+zQEmqbVAMbZUDVjUI/mgKiD0CbVvTo6
         KTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700484550; x=1701089350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mymSOQ5pVLXnJr/ay9d4wedzh8VWnzxFJmK6JBuJ6S8=;
        b=dsJ4HXZANovI0/cObA+mVlMMHDDo/bzEegQKE3K8+/3iCeYQBHc2HQHP0FeoE/ESmi
         FLgdYi4O3DkRpDp6VC2f7xmg2veX0ovlhorUeSUzLWAUDu62mf0Oe3i1aOWOcgBkADs+
         xAFJXJNE55pexAbW2ChrUtVAPkpfbkX2DUFHGhOGeso7UkomBi0jpeqyb4Fl9XIxrB56
         gN7BH8aoH1ua66Ma1yhvXalULr4F6OcSmiKtIdLKYzzIfQBUKwIqYE3+RDv9E/mDRN5M
         +qSrd3tPjBjgXzw5tRFmd7SFQHsjsZNhUdDB/9nNJyCfiTldlQYIEKtAYWbZB/wk1vrB
         Lwwg==
X-Gm-Message-State: AOJu0YzPTO4bz2inWQfrvbeLhjWm3DAwfTgj6M7hJVOUXdSRZqhml6b1
	TUPjkZ2GOe4ZBd9YTorv1AJtNQRpsG1YmipBudo=
X-Google-Smtp-Source: AGHT+IGnRjpHsZaG1AKcD+sPIogzILa8y9uBiYHTIAzEEISIcyihJ15B2k9jfG2ghVbjH4BQTLJEz56ms3K5VcstFDs=
X-Received: by 2002:aa7:c9d7:0:b0:548:a227:b09c with SMTP id
 i23-20020aa7c9d7000000b00548a227b09cmr3170306edt.36.1700484550350; Mon, 20
 Nov 2023 04:49:10 -0800 (PST)
MIME-Version: 1.0
References: <20230901233231.1109712-1-michelle.linto91@gmail.com>
 <141c44bea4477d552aa4fc0371094b8ad4dc65b5.camel@linuxfoundation.org> <6f267d3e-adc7-c650-8d81-4fc019384d5a@linux.microsoft.com>
In-Reply-To: <6f267d3e-adc7-c650-8d81-4fc019384d5a@linux.microsoft.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Mon, 20 Nov 2023 14:48:59 +0200
Message-ID: <CALT56yOchv+3n7Xs_0w+FTEKtVu0qEH-VqmjNsMHXcw7RmG6fw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] uki: Add support for building Unified Kernel Images
To: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Michelle Lin <michelle.linto91@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 12:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190876

On Thu, 7 Sept 2023 at 01:29, Alejandro Hernandez Samaniego
<alhe@linux.microsoft.com> wrote:
>
>
> On 9/2/23 00:53, Richard Purdie wrote:
> > On Fri, 2023-09-01 at 23:32 +0000, Michelle Lin wrote:
> >> Currently, there is not a class to support the building of unified kernel
> >> images. Adding a uki.bbclass to support the creation of UKIs. This class calls
> >> the systemd Ukify tool, which will combine the kernel/initrd/stub components to
> >> build the UKI. To sign the UKI (i.e. SecureBoot, TPM PCR signing), the keys/cert
> >> files are to be specified in a separate configuration file, and the path to the
> >> file is passed to the Ukify tool. UKIs are supported by UEFI and can improve
> >> security through predicted TPM PCR states, and reduce the build burden due to
> >> its single PE binary format.
> >>
> >> Signed-off-by: Michelle Lin <michelle.linto91@gmail.com>
> >> ---
> >>   meta/classes/uki.bbclass                 | 140 +++++++++++++++++++++++
> >>   meta/recipes-core/systemd/systemd_254.bb |  23 ++++
> >>   2 files changed, 163 insertions(+)
> >>   create mode 100644 meta/classes/uki.bbclass
> >>
> >> diff --git a/meta/classes/uki.bbclass b/meta/classes/uki.bbclass
> >> new file mode 100644
> >> index 0000000000..2eff387c75
> >> --- /dev/null
> >> +++ b/meta/classes/uki.bbclass
> >> @@ -0,0 +1,140 @@
> >> +#
> >> +# Unified kernel image (UKI) class
> >> +#
> >> +#
> >> +# This bbclass is designed to repack an Overlake image as a UKI, to be booted on a qemuarm64 with SecureBoot
> >> +# signing and embedded with TPM PCR measurements.
> >> +#
> >> +# The UKI is composed by:
> >> +#   - an UEFI stub
> >> +#     The linux kernel can generate a UEFI stub, however the one from systemd-boot can fetch
> >> +#     the command line from a separate section of the EFI application, avoiding the need to
> >> +#     rebuild the kernel.
> >> +#   - the kernel
> >> +#   - an initramfs
> >> +#   - other metadata (e.g. PCR measurements)
> >> +#
> >> +#
> >> +#
> >> +
> >> +# List build time dependencies
> >> +DEPENDS += "systemd-native \
> >> +            sbsigntool-native \
> >> +            virtual/${TARGET_PREFIX}binutils \
> >> +            "
> >> +
> >> +REQUIRED_DISTRO_FEATURES += "usrmerge systemd"
> >> +
> >> +inherit features_check
> >> +require ../conf/image-uefi.conf
> >> +
> >> +INITRD_IMAGE ?= "core-image-minimal-initramfs"
> >> +
> >> +INITRD_LIVE ?= "${@ ('${DEPLOY_DIR_IMAGE}/' + d.getVar('INITRD_IMAGE') + '-${MACHINE}.cpio.gz') if d.getVar('INITRD_IMAGE') else ''}"
> >> +
> >> +UKI_CONFIG_FILE ?= "${WORKDIR}/core-image-minimal-uki.conf"
> >> +UKI_FILENAME ?= "${@ 'UKI.signed.efi' if d.getVar('UKI_CONFIG_FILE') else 'UKI.unsigned.efi'}"
> >> +
> >> +do_uki[depends] += " \
> >> +                        systemd-boot:do_deploy \
> >> +                        virtual/kernel:do_deploy \
> >> +                     "
> >> +
> >> +# INITRD_IMAGE is added to INITRD_LIVE, which we use to create our initrd, so depend on it if it is set
> >> +# So we want to generate the initrd image if INITRD_IMAGE exists
> >> +do_uki[depends] += "${@ '${INITRD_IMAGE}:do_image_complete' if d.getVar('INITRD_IMAGE') else ''}"
> >> +
> >> +# ensure that the build directory is empty everytime we generate a newly-created uki
> >> +do_uki[cleandirs] = "${B}"
> >> +# influence the build directory at the start of the builds
> >> +do_uki[dirs] = "${B}"
> >> +
> >> +# we want to allow specifying files in SRC_URI, such as for signing the UKI
> >> +python () {
> >> +    d.delVarFlag("do_fetch","noexec")
> >> +    d.delVarFlag("do_unpack","noexec")
> >> +}
> >> +
> >> +# main task
> >> +python do_uki() {
> >> +    import glob
> >> +    import subprocess
> >> +
> >> +    # Construct the ukify command
> >> +    ukify_cmd = ("ukify build")
> >> +
> >> +    # Handle the creation of an initrd image by reading and concatenating multiple cpio files.
> >> +    # If the INITRD_LIVE variable is defined and not empty, it opens the necessary files, reads their contents,
> >> +    # and constructs a list.
> >> +    if d.getVar('INITRD_LIVE'):
> >> +        initrd_list = ""
> >> +        for cpio in d.getVar('INITRD_LIVE').split():
> >> +            # get a list of initrds
> >> +            initrd_list += cpio + ' '
> >> +
> >> +        ukify_cmd += " --initrd=%s" % initrd_list
> >> +    else:
> >> +        bb.fatal("ERROR - Required argument: INITRD")
> >> +
> >> +    deploy_dir_image = d.getVar('DEPLOY_DIR_IMAGE')
> >> +
> >> +    # Kernel
> >> +    if d.getVar('KERNEL_IMAGETYPE'):
> >> +        kernel = "%s/%s" % (deploy_dir_image, d.getVar('KERNEL_IMAGETYPE'))
> >> +        kernel_version = d.getVar('KERNEL_VERSION')
> >> +        if not os.path.exists(kernel):
> >> +            bb.fatal(f"ERROR: cannot find {kernel}.")
> >> +
> >> +        ukify_cmd += " --linux=%s --uname %s" % (kernel, kernel_version)
> >> +    else:
> >> +        bb.fatal("ERROR - Required argument: KERNEL")
> >> +
> >> +    # Architecture
> >> +    target_arch = d.getVar('EFI_ARCH')
> >> +    ukify_cmd += " --efi-arch %s" % target_arch
> >> +
> >> +    # Stub
> >> +    stub = "%s/linux%s.efi.stub" % (deploy_dir_image, target_arch)
> >> +    if not os.path.exists(stub):
> >> +        bb.fatal(f"ERROR: cannot find {stub}.")
> >> +    ukify_cmd += " --stub %s" % stub
> >> +
> >> +    # Add option for dtb
> >> +    if d.getVar('KERNEL_DEVICETREE'):
> >> +        first_dtb = d.getVar('KERNEL_DEVICETREE').split()[0]
> >> +        dtb_path = "%s/%s" % (deploy_dir_image, first_dtb)
> >> +
> >> +        if not os.path.exists(dtb_path):
> >> +            bb.fatal(f"ERROR: cannot find {dtb_path}.")
> >> +
> >> +        ukify_cmd += " --devicetree %s" % dtb_path
> >> +
> >> +    # Add option to pass a config file to sign the UKI.
> >> +    if os.path.exists(d.getVar('UKI_CONFIG_FILE')):
> >> +        ukify_cmd += " --config=%s" % d.getVar('UKI_CONFIG_FILE')
> >> +        ukify_cmd += " --tools=%s%s/lib/systemd/tools" % (d.getVar("RECIPE_SYSROOT_NATIVE"), d.getVar("prefix"))
> >> +        bb.note("Pulling keys from config file")
> >> +    else:
> >> +        bb.note("Generating unsigned UKI")
> >> +
> >> +    # Custom UKI name
> >> +    output = " --output=%s" % d.getVar('UKI_FILENAME')
> >> +    ukify_cmd += " %s" % output
> >> +
> >> +    # Set env to determine where bitbake should look for dynamic libraries
> >> +    env = os.environ.copy() # get the env variables
> >> +    env['LD_LIBRARY_PATH'] = d.expand("${RECIPE_SYSROOT_NATIVE}/usr/lib/systemd:${LD_LIBRARY_PATH}")
> >> +
> >> +    # Run the ukify command
> >> +    subprocess.check_call(ukify_cmd, env=env, shell=True)
> >> +}
> >> +
> >> +inherit deploy
> >> +
> >> +do_deploy () {
> >> +    # Copy generated UKI into DEPLOYDIR
> >> +    install ${B}/${UKI_FILENAME} ${DEPLOYDIR}
> >> +}
> >> +
> >> +addtask uki before do_deploy do_image after do_rootfs
> >> +addtask deploy before do_build after do_compile
> >> \ No newline at end of file
> >> diff --git a/meta/recipes-core/systemd/systemd_254.bb b/meta/recipes-core/systemd/systemd_254.bb
> >> index 8d5cf13095..65f132abb8 100644
> >> --- a/meta/recipes-core/systemd/systemd_254.bb
> >> +++ b/meta/recipes-core/systemd/systemd_254.bb
> >> @@ -6,6 +6,9 @@ PE = "1"
> >>
> >>   DEPENDS = "intltool-native gperf-native libcap util-linux python3-jinja2-native"
> >>
> >> +# The Ukify tool requires this module
> >> +DEPENDS:append:class-native = " python3-pefile-native"
> > Do we need to add this to OE-Core? I think this will cause current
> > builds to fail?
>
>
> I think you are right, there are some dependencies from this that are
> not present in OE-core, this probably belongs in a different layer, at
> least for the time being.

I think that ukify is useful in OE-core. Having it in another layer
would mean that we can not use it from the BSP layer.

As the ukify is usable even without sbsign and pesign, I think we can
do either of the following things:

- Mark sbsign and pesign as recomendations instead of dependencies

- Add PACAKGECONFIG for the signing support. If it is not enabled,
replace sbsign and pesign support with the error message.

-- 
With best wishes
Dmitry

