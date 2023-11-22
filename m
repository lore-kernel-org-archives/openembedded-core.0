Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0631EC61D85
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 01:06:24 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.9201.1700615179153441788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 17:06:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VenuWwe5;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a00191363c1so322927066b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 17:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700615177; x=1701219977; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iLcMpkEww4G4cvpTeHa+z7ZMwokHPuUzjAdNT1iYvQ=;
        b=VenuWwe5nWKUk9cPosEoJKCUIeTeue1pGLDLajmjnkD1TVT2E/UxWHxSkvCJpJvDla
         ejVmpDV4nx43vpinz6cESyuXBwtgTDlAYGI0hYqCxMxN/x02vPbSmgChTQj/kDL9qur9
         35ufsqJYDjY+E3LDToLqdQ6FjR/IXnc3rVJN8UfWu0M5nVkjl+mF0aLK5Wkq8OwHoe/X
         SBgLHgOp6g2BK5NGY2Lgel9IT+z3raWEPYvj3ZlMkEVNMyxhD142uVte1u7YnMWMsV2j
         NydnTLucynCjo5JB6kUm8yQNURfhsYVU21wDz2grnkaFZnPSPQjLllc9VFRG1Ey+Ksx2
         UViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700615177; x=1701219977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iLcMpkEww4G4cvpTeHa+z7ZMwokHPuUzjAdNT1iYvQ=;
        b=Bkz8Q3KB6oKKttNwBD6mSat0qIgCubdx57vHq0pWEqid55Jhp9qJeHgXDW1xtsl2CQ
         984VKLA954LiJvaEM8FW6FP0YTGhNb83EUQ7jl+z/sxLPS7IwwHiRmHHE7AJgWHrKaf9
         ZQ7opt2VgVxw/2uogQLuOQTLeyoHIBY3XPvLYSncckLhtNdKDg1eLwtto90CWV2rw7Ef
         Q+5gMs1721rqIL9lLMtQbpqNrZZlAWn1Z6Dg8zz9my45FvONlHHDGDz3w5Yht3iDrxzE
         hBOrOilRRu8Z0Q/YlAIG1DM44Y9lhVPquI5YJK9mwD1IPAzBwimjioN4MF/d3R6NIHcc
         GgOQ==
X-Gm-Message-State: AOJu0YxESPEYd0hspmkpdf3/DLKDPCuNmLz+2ggKN4YnhnOFlj4FRBe+
	NaFLycxerPcTGKXbRiS1HIYonzc6dFkHuJbSK/0=
X-Google-Smtp-Source: AGHT+IFNDGcdl2HP2FuswLpHxSBKLSmYNDClp8LY6jgPToUxppc2Yut+lTNUyqbLzlO35mLLTyGHKpIePdxb+2HJ6bM=
X-Received: by 2002:a17:907:d403:b0:9e7:8ad0:a471 with SMTP id
 vi3-20020a170907d40300b009e78ad0a471mr453139ejc.12.1700615177087; Tue, 21 Nov
 2023 17:06:17 -0800 (PST)
MIME-Version: 1.0
References: <20230901233231.1109712-1-michelle.linto91@gmail.com>
 <141c44bea4477d552aa4fc0371094b8ad4dc65b5.camel@linuxfoundation.org>
 <6f267d3e-adc7-c650-8d81-4fc019384d5a@linux.microsoft.com>
 <CALT56yOchv+3n7Xs_0w+FTEKtVu0qEH-VqmjNsMHXcw7RmG6fw@mail.gmail.com> <CADkTA4NQXEosRG-wJpfEqQNfzOwhcp_OHQJ1iYvUKgvsFa_uwg@mail.gmail.com>
In-Reply-To: <CADkTA4NQXEosRG-wJpfEqQNfzOwhcp_OHQJ1iYvUKgvsFa_uwg@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Wed, 22 Nov 2023 03:06:05 +0200
Message-ID: <CALT56yMZP9YaiNfQzXADAumVsPu0ipT326arFk4q+00BBAFKhQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] uki: Add support for building Unified Kernel Images
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Michelle Lin <michelle.linto91@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 01:06:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190996

On Mon, 20 Nov 2023 at 15:26, Bruce Ashfield <bruce.ashfield@gmail.com> wro=
te:
>
> On Mon, Nov 20, 2023 at 7:49=E2=80=AFAM Dmitry Baryshkov <dbaryshkov@gmai=
l.com> wrote:
> >
> > On Thu, 7 Sept 2023 at 01:29, Alejandro Hernandez Samaniego
> > <alhe@linux.microsoft.com> wrote:
> > >
> > >
> > > On 9/2/23 00:53, Richard Purdie wrote:
> > > > On Fri, 2023-09-01 at 23:32 +0000, Michelle Lin wrote:
> > > >> Currently, there is not a class to support the building of unified=
 kernel
> > > >> images. Adding a uki.bbclass to support the creation of UKIs. This=
 class calls
> > > >> the systemd Ukify tool, which will combine the kernel/initrd/stub =
components to
> > > >> build the UKI. To sign the UKI (i.e. SecureBoot, TPM PCR signing),=
 the keys/cert
> > > >> files are to be specified in a separate configuration file, and th=
e path to the
> > > >> file is passed to the Ukify tool. UKIs are supported by UEFI and c=
an improve
> > > >> security through predicted TPM PCR states, and reduce the build bu=
rden due to
> > > >> its single PE binary format.
> > > >>
> > > >> Signed-off-by: Michelle Lin <michelle.linto91@gmail.com>
> > > >> ---
> > > >>   meta/classes/uki.bbclass                 | 140 +++++++++++++++++=
++++++
> > > >>   meta/recipes-core/systemd/systemd_254.bb |  23 ++++
> > > >>   2 files changed, 163 insertions(+)
> > > >>   create mode 100644 meta/classes/uki.bbclass
> > > >>
> > > >> diff --git a/meta/classes/uki.bbclass b/meta/classes/uki.bbclass
> > > >> new file mode 100644
> > > >> index 0000000000..2eff387c75
> > > >> --- /dev/null
> > > >> +++ b/meta/classes/uki.bbclass
> > > >> @@ -0,0 +1,140 @@
> > > >> +#
> > > >> +# Unified kernel image (UKI) class
> > > >> +#
> > > >> +#
> > > >> +# This bbclass is designed to repack an Overlake image as a UKI, =
to be booted on a qemuarm64 with SecureBoot
> > > >> +# signing and embedded with TPM PCR measurements.
> > > >> +#
> > > >> +# The UKI is composed by:
> > > >> +#   - an UEFI stub
> > > >> +#     The linux kernel can generate a UEFI stub, however the one =
from systemd-boot can fetch
> > > >> +#     the command line from a separate section of the EFI applica=
tion, avoiding the need to
> > > >> +#     rebuild the kernel.
> > > >> +#   - the kernel
> > > >> +#   - an initramfs
> > > >> +#   - other metadata (e.g. PCR measurements)
> > > >> +#
> > > >> +#
> > > >> +#
> > > >> +
> > > >> +# List build time dependencies
> > > >> +DEPENDS +=3D "systemd-native \
> > > >> +            sbsigntool-native \
> > > >> +            virtual/${TARGET_PREFIX}binutils \
> > > >> +            "
> > > >> +
> > > >> +REQUIRED_DISTRO_FEATURES +=3D "usrmerge systemd"
> > > >> +
> > > >> +inherit features_check
> > > >> +require ../conf/image-uefi.conf
> > > >> +
> > > >> +INITRD_IMAGE ?=3D "core-image-minimal-initramfs"
> > > >> +
> > > >> +INITRD_LIVE ?=3D "${@ ('${DEPLOY_DIR_IMAGE}/' + d.getVar('INITRD_=
IMAGE') + '-${MACHINE}.cpio.gz') if d.getVar('INITRD_IMAGE') else ''}"
> > > >> +
> > > >> +UKI_CONFIG_FILE ?=3D "${WORKDIR}/core-image-minimal-uki.conf"
> > > >> +UKI_FILENAME ?=3D "${@ 'UKI.signed.efi' if d.getVar('UKI_CONFIG_F=
ILE') else 'UKI.unsigned.efi'}"
> > > >> +
> > > >> +do_uki[depends] +=3D " \
> > > >> +                        systemd-boot:do_deploy \
> > > >> +                        virtual/kernel:do_deploy \
> > > >> +                     "
> > > >> +
> > > >> +# INITRD_IMAGE is added to INITRD_LIVE, which we use to create ou=
r initrd, so depend on it if it is set
> > > >> +# So we want to generate the initrd image if INITRD_IMAGE exists
> > > >> +do_uki[depends] +=3D "${@ '${INITRD_IMAGE}:do_image_complete' if =
d.getVar('INITRD_IMAGE') else ''}"
> > > >> +
> > > >> +# ensure that the build directory is empty everytime we generate =
a newly-created uki
> > > >> +do_uki[cleandirs] =3D "${B}"
> > > >> +# influence the build directory at the start of the builds
> > > >> +do_uki[dirs] =3D "${B}"
> > > >> +
> > > >> +# we want to allow specifying files in SRC_URI, such as for signi=
ng the UKI
> > > >> +python () {
> > > >> +    d.delVarFlag("do_fetch","noexec")
> > > >> +    d.delVarFlag("do_unpack","noexec")
> > > >> +}
> > > >> +
> > > >> +# main task
> > > >> +python do_uki() {
> > > >> +    import glob
> > > >> +    import subprocess
> > > >> +
> > > >> +    # Construct the ukify command
> > > >> +    ukify_cmd =3D ("ukify build")
> > > >> +
> > > >> +    # Handle the creation of an initrd image by reading and conca=
tenating multiple cpio files.
> > > >> +    # If the INITRD_LIVE variable is defined and not empty, it op=
ens the necessary files, reads their contents,
> > > >> +    # and constructs a list.
> > > >> +    if d.getVar('INITRD_LIVE'):
> > > >> +        initrd_list =3D ""
> > > >> +        for cpio in d.getVar('INITRD_LIVE').split():
> > > >> +            # get a list of initrds
> > > >> +            initrd_list +=3D cpio + ' '
> > > >> +
> > > >> +        ukify_cmd +=3D " --initrd=3D%s" % initrd_list
> > > >> +    else:
> > > >> +        bb.fatal("ERROR - Required argument: INITRD")
> > > >> +
> > > >> +    deploy_dir_image =3D d.getVar('DEPLOY_DIR_IMAGE')
> > > >> +
> > > >> +    # Kernel
> > > >> +    if d.getVar('KERNEL_IMAGETYPE'):
> > > >> +        kernel =3D "%s/%s" % (deploy_dir_image, d.getVar('KERNEL_=
IMAGETYPE'))
> > > >> +        kernel_version =3D d.getVar('KERNEL_VERSION')
> > > >> +        if not os.path.exists(kernel):
> > > >> +            bb.fatal(f"ERROR: cannot find {kernel}.")
> > > >> +
> > > >> +        ukify_cmd +=3D " --linux=3D%s --uname %s" % (kernel, kern=
el_version)
> > > >> +    else:
> > > >> +        bb.fatal("ERROR - Required argument: KERNEL")
> > > >> +
> > > >> +    # Architecture
> > > >> +    target_arch =3D d.getVar('EFI_ARCH')
> > > >> +    ukify_cmd +=3D " --efi-arch %s" % target_arch
> > > >> +
> > > >> +    # Stub
> > > >> +    stub =3D "%s/linux%s.efi.stub" % (deploy_dir_image, target_ar=
ch)
> > > >> +    if not os.path.exists(stub):
> > > >> +        bb.fatal(f"ERROR: cannot find {stub}.")
> > > >> +    ukify_cmd +=3D " --stub %s" % stub
> > > >> +
> > > >> +    # Add option for dtb
> > > >> +    if d.getVar('KERNEL_DEVICETREE'):
> > > >> +        first_dtb =3D d.getVar('KERNEL_DEVICETREE').split()[0]
> > > >> +        dtb_path =3D "%s/%s" % (deploy_dir_image, first_dtb)
> > > >> +
> > > >> +        if not os.path.exists(dtb_path):
> > > >> +            bb.fatal(f"ERROR: cannot find {dtb_path}.")
> > > >> +
> > > >> +        ukify_cmd +=3D " --devicetree %s" % dtb_path
> > > >> +
> > > >> +    # Add option to pass a config file to sign the UKI.
> > > >> +    if os.path.exists(d.getVar('UKI_CONFIG_FILE')):
> > > >> +        ukify_cmd +=3D " --config=3D%s" % d.getVar('UKI_CONFIG_FI=
LE')
> > > >> +        ukify_cmd +=3D " --tools=3D%s%s/lib/systemd/tools" % (d.g=
etVar("RECIPE_SYSROOT_NATIVE"), d.getVar("prefix"))
> > > >> +        bb.note("Pulling keys from config file")
> > > >> +    else:
> > > >> +        bb.note("Generating unsigned UKI")
> > > >> +
> > > >> +    # Custom UKI name
> > > >> +    output =3D " --output=3D%s" % d.getVar('UKI_FILENAME')
> > > >> +    ukify_cmd +=3D " %s" % output
> > > >> +
> > > >> +    # Set env to determine where bitbake should look for dynamic =
libraries
> > > >> +    env =3D os.environ.copy() # get the env variables
> > > >> +    env['LD_LIBRARY_PATH'] =3D d.expand("${RECIPE_SYSROOT_NATIVE}=
/usr/lib/systemd:${LD_LIBRARY_PATH}")
> > > >> +
> > > >> +    # Run the ukify command
> > > >> +    subprocess.check_call(ukify_cmd, env=3Denv, shell=3DTrue)
> > > >> +}
> > > >> +
> > > >> +inherit deploy
> > > >> +
> > > >> +do_deploy () {
> > > >> +    # Copy generated UKI into DEPLOYDIR
> > > >> +    install ${B}/${UKI_FILENAME} ${DEPLOYDIR}
> > > >> +}
> > > >> +
> > > >> +addtask uki before do_deploy do_image after do_rootfs
> > > >> +addtask deploy before do_build after do_compile
> > > >> \ No newline at end of file
> > > >> diff --git a/meta/recipes-core/systemd/systemd_254.bb b/meta/recip=
es-core/systemd/systemd_254.bb
> > > >> index 8d5cf13095..65f132abb8 100644
> > > >> --- a/meta/recipes-core/systemd/systemd_254.bb
> > > >> +++ b/meta/recipes-core/systemd/systemd_254.bb
> > > >> @@ -6,6 +6,9 @@ PE =3D "1"
> > > >>
> > > >>   DEPENDS =3D "intltool-native gperf-native libcap util-linux pyth=
on3-jinja2-native"
> > > >>
> > > >> +# The Ukify tool requires this module
> > > >> +DEPENDS:append:class-native =3D " python3-pefile-native"
> > > > Do we need to add this to OE-Core? I think this will cause current
> > > > builds to fail?
> > >
> > >
> > > I think you are right, there are some dependencies from this that are
> > > not present in OE-core, this probably belongs in a different layer, a=
t
> > > least for the time being.
> >
> > I think that ukify is useful in OE-core. Having it in another layer
> > would mean that we can not use it from the BSP layer.
> >
>
> Can you elaborate on that first point ? That sounds like an internal
> restriction / rule, so it really doesn't factor into whether or not
> something needs to be in oe-core or not.

Hmm, maybe I misinterpreted the Yocyo compatibility requirements.
Anyway, if we are allowed to use other layers, then it's even better.
Thanks for pointing that out.

>
> The answer itself doesn't matter to me, I just didn't want someone
> in the future to be searching and think that their BSP layer can
> only use functionality from oe-core.
>
> Bruce
>
> > As the ukify is usable even without sbsign and pesign, I think we can
> > do either of the following things:
> >
> > - Mark sbsign and pesign as recomendations instead of dependencies
> >
> > - Add PACAKGECONFIG for the signing support. If it is not enabled,
> > replace sbsign and pesign support with the error message.
> >
> > --
> > With best wishes
> > Dmitry
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#190876): https://lists.openembedded.org/g/openembed=
ded-core/message/190876
> > Mute This Topic: https://lists.openembedded.org/mt/101106095/1050810
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--=20
With best wishes
Dmitry

