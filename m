Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC45C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 12:52:06 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.31959.1701175923748918482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 04:52:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=UArtFa00;
 spf=pass (domain: linaro.org, ip: 209.85.208.175, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2c9b1839e90so5834751fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 04:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701175922; x=1701780722; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HTc1yVfHZNeIM2p4PM+OcONB0GdEwb18fIh+jpGyv/4=;
        b=UArtFa00nNiZfH/DswSVN+ewh3zWT04JDom7KMpCFfrSRhLeE9MVNtW4aO4C3pIRsK
         mmhoXuNNuolnwLjEW3TcT66Uus9iAavvD9HQoygupmMROXIV/IdnHI8nscag10R/kuhQ
         ZKI2eKLG7FoYRz/235MUHnKieZsrk2osT5jzRNDqNQcPABLmSjgGpuld0R5Q04HISWa2
         v9hAzg+ljX5OcpcUjHtxYZQ9Od2pU7B6APf3dxcowZQSmqrs7cZb4YhnKCvLQW+jiZ2b
         EoNLh6fLpvF4RulYrQvoAJhxim8HWKx2l8pSqeF0Rj9NiFu458xdXuFDYM48pDEW65Ix
         ySmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701175922; x=1701780722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTc1yVfHZNeIM2p4PM+OcONB0GdEwb18fIh+jpGyv/4=;
        b=SpasL34ItbJXLS9dCT7VJkYa+Z7y7YcRAht7vBWfg6Tf/uRwkq711jKYl+7ulfQLRR
         nwxbcyDZ7lThs4Rmx8Fn3ebwvDPx+98Tqc4sfyJCB3cNQxagiwakqFpQbpCrL6vTkrlh
         W24/lkPEhobS5gX9PvOP/0ZjanSMKDDhpCAx3sj+okic0AgF6VLnlNCv7ADe1PDo6sLS
         6j4zjjtlUDeFEYUnhyXbv6S+Y2NZdKLH1lr5Lx3YWbwr22E6/D2zRamyMrD4JCXNrNMD
         KPMlxyno+0/yXuU1lZSgu1kBPGqtAD1WPH2HwCIUikaW/lsvRWBOkUX5ODwJol+QENtH
         bLeQ==
X-Gm-Message-State: AOJu0Ywyw4BYK2E333F8YVtDvz4v3ZWe2unpN3t4a3lhp1zGjGsALMNQ
	t6Wr4G7bSryR8U7S67jSdu4+zA==
X-Google-Smtp-Source: AGHT+IGgpBWx2f3PgtSTylKYGWIDkoj/IPpyiBmQP5+9f3J2fx6p4X9/4cD1dN2I0bh0hPPnTWE47A==
X-Received: by 2002:a05:651c:48a:b0:2c9:b860:19f9 with SMTP id s10-20020a05651c048a00b002c9b86019f9mr338267ljc.19.1701175921762;
        Tue, 28 Nov 2023 04:52:01 -0800 (PST)
Received: from nuoska (dc7g6tyyyyyyyyyyyyhlt-3.rev.dnainternet.fi. [2001:14ba:16cb:a800::193])
        by smtp.gmail.com with ESMTPSA id a4-20020a05651c030400b002c00e475e23sm1740463ljp.131.2023.11.28.04.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 04:52:01 -0800 (PST)
Date: Tue, 28 Nov 2023 14:51:57 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: Michelle Lin <michelle.linto91@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] uki: Add support for building Unified Kernel
 Images
Message-ID: <ZWXibQvpZls3Cg_g@nuoska>
References: <20230901233231.1109712-1-michelle.linto91@gmail.com>
 <CALT56yM7fL9sSqW-mO64BoHz=SrJi8aOHCQqqbe64b+vpSSijw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALT56yM7fL9sSqW-mO64BoHz=SrJi8aOHCQqqbe64b+vpSSijw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 12:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191365

Hi,

On Tue, Nov 28, 2023 at 02:32:14PM +0200, Dmitry Baryshkov wrote:
> On Sat, 2 Sept 2023 at 02:32, Michelle Lin <michelle.linto91@gmail.com> wrote:
> >
> > Currently, there is not a class to support the building of unified kernel
> > images. Adding a uki.bbclass to support the creation of UKIs. This class calls
> > the systemd Ukify tool, which will combine the kernel/initrd/stub components to
> > build the UKI. To sign the UKI (i.e. SecureBoot, TPM PCR signing), the keys/cert
> > files are to be specified in a separate configuration file, and the path to the
> > file is passed to the Ukify tool. UKIs are supported by UEFI and can improve
> > security through predicted TPM PCR states, and reduce the build burden due to
> > its single PE binary format.
> >
> > Signed-off-by: Michelle Lin <michelle.linto91@gmail.com>
> > ---
> >  meta/classes/uki.bbclass                 | 140 +++++++++++++++++++++++
> >  meta/recipes-core/systemd/systemd_254.bb |  23 ++++
> >  2 files changed, 163 insertions(+)
> >  create mode 100644 meta/classes/uki.bbclass
> >
> > diff --git a/meta/classes/uki.bbclass b/meta/classes/uki.bbclass
> > new file mode 100644
> > index 0000000000..2eff387c75
> > --- /dev/null
> > +++ b/meta/classes/uki.bbclass
> > @@ -0,0 +1,140 @@
> > +#
> > +# Unified kernel image (UKI) class
> > +#
> > +#
> > +# This bbclass is designed to repack an Overlake image as a UKI, to be booted on a qemuarm64 with SecureBoot
> > +# signing and embedded with TPM PCR measurements.
> > +#
> > +# The UKI is composed by:
> > +#   - an UEFI stub
> > +#     The linux kernel can generate a UEFI stub, however the one from systemd-boot can fetch
> > +#     the command line from a separate section of the EFI application, avoiding the need to
> > +#     rebuild the kernel.
> > +#   - the kernel
> > +#   - an initramfs
> > +#   - other metadata (e.g. PCR measurements)
> > +#
> > +#
> > +#
> > +
> > +# List build time dependencies
> > +DEPENDS += "systemd-native \
> > +            sbsigntool-native \
> > +            virtual/${TARGET_PREFIX}binutils \
> > +            "
> > +
> > +REQUIRED_DISTRO_FEATURES += "usrmerge systemd"
> > +
> > +inherit features_check
> > +require ../conf/image-uefi.conf
> > +
> > +INITRD_IMAGE ?= "core-image-minimal-initramfs"
> > +
> > +INITRD_LIVE ?= "${@ ('${DEPLOY_DIR_IMAGE}/' + d.getVar('INITRD_IMAGE') + '-${MACHINE}.cpio.gz') if d.getVar('INITRD_IMAGE') else ''}"
> > +
> > +UKI_CONFIG_FILE ?= "${WORKDIR}/core-image-minimal-uki.conf"
> > +UKI_FILENAME ?= "${@ 'UKI.signed.efi' if d.getVar('UKI_CONFIG_FILE') else 'UKI.unsigned.efi'}"
> > +
> > +do_uki[depends] += " \
> > +                        systemd-boot:do_deploy \
> > +                        virtual/kernel:do_deploy \
> > +                     "
> > +
> > +# INITRD_IMAGE is added to INITRD_LIVE, which we use to create our initrd, so depend on it if it is set
> > +# So we want to generate the initrd image if INITRD_IMAGE exists
> > +do_uki[depends] += "${@ '${INITRD_IMAGE}:do_image_complete' if d.getVar('INITRD_IMAGE') else ''}"
> > +
> > +# ensure that the build directory is empty everytime we generate a newly-created uki
> > +do_uki[cleandirs] = "${B}"
> > +# influence the build directory at the start of the builds
> > +do_uki[dirs] = "${B}"
> > +
> > +# we want to allow specifying files in SRC_URI, such as for signing the UKI
> > +python () {
> > +    d.delVarFlag("do_fetch","noexec")
> > +    d.delVarFlag("do_unpack","noexec")
> > +}
> > +
> > +# main task
> > +python do_uki() {
> > +    import glob
> > +    import subprocess
> > +
> > +    # Construct the ukify command
> > +    ukify_cmd = ("ukify build")
> > +
> > +    # Handle the creation of an initrd image by reading and concatenating multiple cpio files.
> > +    # If the INITRD_LIVE variable is defined and not empty, it opens the necessary files, reads their contents,
> > +    # and constructs a list.
> > +    if d.getVar('INITRD_LIVE'):
> > +        initrd_list = ""
> > +        for cpio in d.getVar('INITRD_LIVE').split():
> > +            # get a list of initrds
> > +            initrd_list += cpio + ' '
> > +
> > +        ukify_cmd += " --initrd=%s" % initrd_list
> > +    else:
> > +        bb.fatal("ERROR - Required argument: INITRD")
> > +
> > +    deploy_dir_image = d.getVar('DEPLOY_DIR_IMAGE')
> > +
> > +    # Kernel
> > +    if d.getVar('KERNEL_IMAGETYPE'):
> > +        kernel = "%s/%s" % (deploy_dir_image, d.getVar('KERNEL_IMAGETYPE'))
> > +        kernel_version = d.getVar('KERNEL_VERSION')
> > +        if not os.path.exists(kernel):
> > +            bb.fatal(f"ERROR: cannot find {kernel}.")
> > +
> > +        ukify_cmd += " --linux=%s --uname %s" % (kernel, kernel_version)
> > +    else:
> > +        bb.fatal("ERROR - Required argument: KERNEL")
> > +
> > +    # Architecture
> > +    target_arch = d.getVar('EFI_ARCH')
> > +    ukify_cmd += " --efi-arch %s" % target_arch
> > +
> > +    # Stub
> > +    stub = "%s/linux%s.efi.stub" % (deploy_dir_image, target_arch)
> > +    if not os.path.exists(stub):
> > +        bb.fatal(f"ERROR: cannot find {stub}.")
> > +    ukify_cmd += " --stub %s" % stub
> > +
> > +    # Add option for dtb
> > +    if d.getVar('KERNEL_DEVICETREE'):
> > +        first_dtb = d.getVar('KERNEL_DEVICETREE').split()[0]
> > +        dtb_path = "%s/%s" % (deploy_dir_image, first_dtb)
> > +
> > +        if not os.path.exists(dtb_path):
> > +            bb.fatal(f"ERROR: cannot find {dtb_path}.")
> > +
> > +        ukify_cmd += " --devicetree %s" % dtb_path
> 
> Hmm, I have not noticed this before. This doesn't look generic enough.
> KERNEL_DEVICETREE can have several DT files and the first one is not
> in any way special. It should not be picked up for the UKI image.
> E.g. in our (meta-qcom / qcom-armv8a) case the KERNEL_DEVICETREE lists
> dtb for all supported machines, ranging from the old dragonboard410c
> up to the latest HDKs.

So all decice tree files should be looped in. I hope ukify.py supports
this but IMO it should.

Cheers,

-Mikko
 
> > +
> > +    # Add option to pass a config file to sign the UKI.
> > +    if os.path.exists(d.getVar('UKI_CONFIG_FILE')):
> > +        ukify_cmd += " --config=%s" % d.getVar('UKI_CONFIG_FILE')
> > +        ukify_cmd += " --tools=%s%s/lib/systemd/tools" % (d.getVar("RECIPE_SYSROOT_NATIVE"), d.getVar("prefix"))
> > +        bb.note("Pulling keys from config file")
> > +    else:
> > +        bb.note("Generating unsigned UKI")
> > +
> > +    # Custom UKI name
> > +    output = " --output=%s" % d.getVar('UKI_FILENAME')
> > +    ukify_cmd += " %s" % output
> > +
> > +    # Set env to determine where bitbake should look for dynamic libraries
> > +    env = os.environ.copy() # get the env variables
> > +    env['LD_LIBRARY_PATH'] = d.expand("${RECIPE_SYSROOT_NATIVE}/usr/lib/systemd:${LD_LIBRARY_PATH}")
> > +
> > +    # Run the ukify command
> > +    subprocess.check_call(ukify_cmd, env=env, shell=True)
> > +}
> > +
> > +inherit deploy
> > +
> > +do_deploy () {
> > +    # Copy generated UKI into DEPLOYDIR
> > +       install ${B}/${UKI_FILENAME} ${DEPLOYDIR}
> > +}
> > +
> > +addtask uki before do_deploy do_image after do_rootfs
> > +addtask deploy before do_build after do_compile
> > \ No newline at end of file
> > diff --git a/meta/recipes-core/systemd/systemd_254.bb b/meta/recipes-core/systemd/systemd_254.bb
> > index 8d5cf13095..65f132abb8 100644
> > --- a/meta/recipes-core/systemd/systemd_254.bb
> > +++ b/meta/recipes-core/systemd/systemd_254.bb
> > @@ -6,6 +6,9 @@ PE = "1"
> >
> >  DEPENDS = "intltool-native gperf-native libcap util-linux python3-jinja2-native"
> >
> > +# The Ukify tool requires this module
> > +DEPENDS:append:class-native = " python3-pefile-native"
> > +
> >  SECTION = "base/shell"
> >
> >  inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives qemu systemd gettext bash-completion manpages features_check
> > @@ -18,6 +21,8 @@ REQUIRED_DISTRO_FEATURES += "usrmerge"
> >  # that we don't build both udev and systemd in world builds.
> >  REQUIRED_DISTRO_FEATURES += "systemd"
> >
> > +REQUIRED_DISTRO_FEATURES:class-native = ""
> > +
> >  SRC_URI += " \
> >             file://touchscreen.rules \
> >             file://00-create-volatile.conf \
> > @@ -120,6 +125,8 @@ PACKAGECONFIG:remove:libc-musl = " \
> >  # https://github.com/seccomp/libseccomp/issues/347
> >  PACKAGECONFIG:remove:mipsarch = "seccomp"
> >
> > +PACKAGECONFIG:class-native = "serial-getty-generator openssl tpm2 efi"
> > +
> >  TARGET_CC_ARCH:append:libc-musl = " -D__UAPI_DEF_ETHHDR=0 -D_LARGEFILE64_SOURCE"
> >
> >  # Some of the dependencies are weak-style recommends - if not available at runtime,
> > @@ -260,6 +267,9 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
> >                    -Dloadkeys-path=${bindir}/loadkeys \
> >                    -Dsetfont-path=${bindir}/setfont"
> >
> > +EXTRA_OEMESON:append:class-native = " -Dbootloader=true \
> > +                                      -Dman=false \
> > +                                    "
> >  # The 60 seconds is watchdog's default vaule.
> >  WATCHDOG_TIMEOUT ??= "60"
> >
> > @@ -380,6 +390,14 @@ do_install() {
> >      fi
> >  }
> >
> > +do_install:class-native() {
> > +       meson_do_install
> > +       install -d ${D}${bindir}
> > +       install -m 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
> > +       install -d ${D}${prefix}/lib/systemd/tools
> > +       install -m 0755 ${B}/systemd-measure ${D}${prefix}/lib/systemd/tools
> > +}
> > +
> >  python populate_packages:prepend (){
> >      systemdlibdir = d.getVar("rootlibdir")
> >      do_split_packages(d, systemdlibdir, r'^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
> > @@ -702,6 +720,9 @@ RRECOMMENDS:${PN} += "systemd-extra-utils \
> >                        ${@bb.utils.contains('PACKAGECONFIG', 'logind', 'pam-plugin-umask', '', d)} \
> >  "
> >
> > +RRECOMMENDS:${PN}:class-native = ""
> > +RDEPENDS:${PN}:class-native = ""
> > +
> >  INSANE_SKIP:${PN} += "dev-so libdir"
> >  INSANE_SKIP:${PN}-dbg += "libdir"
> >  INSANE_SKIP:${PN}-doc += " libdir"
> > @@ -852,3 +873,5 @@ pkg_postinst:udev-hwdb () {
> >  pkg_prerm:udev-hwdb () {
> >         rm -f $D${sysconfdir}/udev/hwdb.bin
> >  }
> > +
> > +BBCLASSEXTEND += "native"
> > --
> > 2.34.1
> >
> >
> > 
> >
> 
> 
> -- 
> With best wishes
> Dmitry

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191364): https://lists.openembedded.org/g/openembedded-core/message/191364
> Mute This Topic: https://lists.openembedded.org/mt/101106095/7159507
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


