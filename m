Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF1B2C197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 13:26:39 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.50091.1700486791578482939
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 05:26:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U+8hRlLx;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-357cf6725acso17804315ab.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 05:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700486791; x=1701091591; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LybjHGc3xvYQXcs6uHdGErNpjXJfgTjMz+RcwjrHNg=;
        b=U+8hRlLxeT6gbVlizTCSD1J13ud5bFiLP9eVPYrIox0gM/01LKMNU9qc4NaUFY+t2K
         136DlTB9+ELFEFMZ5sxXR9eAFtqQpITtIxSqM6Pe9vVeTcB+aAmNbqi0phevXhmcvcZl
         /7MLe6CAcFC+KVS0PMmzZUvXTRk3RZ6UiJ59bsY8hSzg6vc1r3T7PbkP04DERyfvlKS1
         XWc4cHYNzCWlCZtlKIWdtcE2CyUEX3y7tV1CK28tmZyg6E9kLIX45VrghskIJlHMCycB
         B1v313i46Fq80k2BvrjXVsCF6pUQgqqzE66OjH5RUqlk2iAhBY7zWhkMJ3lCNb92JYM5
         uWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700486791; x=1701091591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8LybjHGc3xvYQXcs6uHdGErNpjXJfgTjMz+RcwjrHNg=;
        b=VcrKgBgYFCPM9fvs6UxmXtDPJpsp45KPNh4UM5UmxykqOTpDjQCqaPoWVp2Oy1L4HU
         eUScy7FvNqo18MPdwP5hVXinYQThwdh3aU3po9aG2Vdhcy92Moy/8iZWIdswzIaVD/Tz
         GxRlnO5reCVXgWsAHvInMDQLWLQaTg39/lrj3rQf1dUllU48FGLq2yjenVeYC3OLKGlH
         SBVmblvwF6TKipDwYY4uL5p3C1YIyYPXSj2NKGOeqsh5GjITvS4j5QqGBSYMNnGCWqIY
         JJkYdnt4LXkW6SSDKELdSyoLr9PVSHjM0tOiJf9EfesX3M4Zvy1U/O2Fmthq8RK6dFfK
         GDgQ==
X-Gm-Message-State: AOJu0YzjTyNKSxSbw5KA/NWGOUqCop0VhpMu8jTLMjUX04mmKav0QMr4
	3NDPgjt7wlewB7AUAVAFnusON9KxxHxzcvtvaSI=
X-Google-Smtp-Source: AGHT+IHbwKrw+2vip9NF67H5/YeQ+oWTYqJja6Ry5kzav28tXCJhtAHjCsBmkvzaJKXjXmjGcbm2h0H2VMXciz2BClk=
X-Received: by 2002:a05:6e02:4ae:b0:35a:b0a5:23ab with SMTP id
 e14-20020a056e0204ae00b0035ab0a523abmr8513812ils.21.1700486790567; Mon, 20
 Nov 2023 05:26:30 -0800 (PST)
MIME-Version: 1.0
References: <20230901233231.1109712-1-michelle.linto91@gmail.com>
 <141c44bea4477d552aa4fc0371094b8ad4dc65b5.camel@linuxfoundation.org>
 <6f267d3e-adc7-c650-8d81-4fc019384d5a@linux.microsoft.com> <CALT56yOchv+3n7Xs_0w+FTEKtVu0qEH-VqmjNsMHXcw7RmG6fw@mail.gmail.com>
In-Reply-To: <CALT56yOchv+3n7Xs_0w+FTEKtVu0qEH-VqmjNsMHXcw7RmG6fw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 20 Nov 2023 08:26:19 -0500
Message-ID: <CADkTA4NQXEosRG-wJpfEqQNfzOwhcp_OHQJ1iYvUKgvsFa_uwg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] uki: Add support for building Unified Kernel Images
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Michelle Lin <michelle.linto91@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 13:26:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190877

On Mon, Nov 20, 2023 at 7:49=E2=80=AFAM Dmitry Baryshkov <dbaryshkov@gmail.=
com> wrote:
>
> On Thu, 7 Sept 2023 at 01:29, Alejandro Hernandez Samaniego
> <alhe@linux.microsoft.com> wrote:
> >
> >
> > On 9/2/23 00:53, Richard Purdie wrote:
> > > On Fri, 2023-09-01 at 23:32 +0000, Michelle Lin wrote:
> > >> Currently, there is not a class to support the building of unified k=
ernel
> > >> images. Adding a uki.bbclass to support the creation of UKIs. This c=
lass calls
> > >> the systemd Ukify tool, which will combine the kernel/initrd/stub co=
mponents to
> > >> build the UKI. To sign the UKI (i.e. SecureBoot, TPM PCR signing), t=
he keys/cert
> > >> files are to be specified in a separate configuration file, and the =
path to the
> > >> file is passed to the Ukify tool. UKIs are supported by UEFI and can=
 improve
> > >> security through predicted TPM PCR states, and reduce the build burd=
en due to
> > >> its single PE binary format.
> > >>
> > >> Signed-off-by: Michelle Lin <michelle.linto91@gmail.com>
> > >> ---
> > >>   meta/classes/uki.bbclass                 | 140 +++++++++++++++++++=
++++
> > >>   meta/recipes-core/systemd/systemd_254.bb |  23 ++++
> > >>   2 files changed, 163 insertions(+)
> > >>   create mode 100644 meta/classes/uki.bbclass
> > >>
> > >> diff --git a/meta/classes/uki.bbclass b/meta/classes/uki.bbclass
> > >> new file mode 100644
> > >> index 0000000000..2eff387c75
> > >> --- /dev/null
> > >> +++ b/meta/classes/uki.bbclass
> > >> @@ -0,0 +1,140 @@
> > >> +#
> > >> +# Unified kernel image (UKI) class
> > >> +#
> > >> +#
> > >> +# This bbclass is designed to repack an Overlake image as a UKI, to=
 be booted on a qemuarm64 with SecureBoot
> > >> +# signing and embedded with TPM PCR measurements.
> > >> +#
> > >> +# The UKI is composed by:
> > >> +#   - an UEFI stub
> > >> +#     The linux kernel can generate a UEFI stub, however the one fr=
om systemd-boot can fetch
> > >> +#     the command line from a separate section of the EFI applicati=
on, avoiding the need to
> > >> +#     rebuild the kernel.
> > >> +#   - the kernel
> > >> +#   - an initramfs
> > >> +#   - other metadata (e.g. PCR measurements)
> > >> +#
> > >> +#
> > >> +#
> > >> +
> > >> +# List build time dependencies
> > >> +DEPENDS +=3D "systemd-native \
> > >> +            sbsigntool-native \
> > >> +            virtual/${TARGET_PREFIX}binutils \
> > >> +            "
> > >> +
> > >> +REQUIRED_DISTRO_FEATURES +=3D "usrmerge systemd"
> > >> +
> > >> +inherit features_check
> > >> +require ../conf/image-uefi.conf
> > >> +
> > >> +INITRD_IMAGE ?=3D "core-image-minimal-initramfs"
> > >> +
> > >> +INITRD_LIVE ?=3D "${@ ('${DEPLOY_DIR_IMAGE}/' + d.getVar('INITRD_IM=
AGE') + '-${MACHINE}.cpio.gz') if d.getVar('INITRD_IMAGE') else ''}"
> > >> +
> > >> +UKI_CONFIG_FILE ?=3D "${WORKDIR}/core-image-minimal-uki.conf"
> > >> +UKI_FILENAME ?=3D "${@ 'UKI.signed.efi' if d.getVar('UKI_CONFIG_FIL=
E') else 'UKI.unsigned.efi'}"
> > >> +
> > >> +do_uki[depends] +=3D " \
> > >> +                        systemd-boot:do_deploy \
> > >> +                        virtual/kernel:do_deploy \
> > >> +                     "
> > >> +
> > >> +# INITRD_IMAGE is added to INITRD_LIVE, which we use to create our =
initrd, so depend on it if it is set
> > >> +# So we want to generate the initrd image if INITRD_IMAGE exists
> > >> +do_uki[depends] +=3D "${@ '${INITRD_IMAGE}:do_image_complete' if d.=
getVar('INITRD_IMAGE') else ''}"
> > >> +
> > >> +# ensure that the build directory is empty everytime we generate a =
newly-created uki
> > >> +do_uki[cleandirs] =3D "${B}"
> > >> +# influence the build directory at the start of the builds
> > >> +do_uki[dirs] =3D "${B}"
> > >> +
> > >> +# we want to allow specifying files in SRC_URI, such as for signing=
 the UKI
> > >> +python () {
> > >> +    d.delVarFlag("do_fetch","noexec")
> > >> +    d.delVarFlag("do_unpack","noexec")
> > >> +}
> > >> +
> > >> +# main task
> > >> +python do_uki() {
> > >> +    import glob
> > >> +    import subprocess
> > >> +
> > >> +    # Construct the ukify command
> > >> +    ukify_cmd =3D ("ukify build")
> > >> +
> > >> +    # Handle the creation of an initrd image by reading and concate=
nating multiple cpio files.
> > >> +    # If the INITRD_LIVE variable is defined and not empty, it open=
s the necessary files, reads their contents,
> > >> +    # and constructs a list.
> > >> +    if d.getVar('INITRD_LIVE'):
> > >> +        initrd_list =3D ""
> > >> +        for cpio in d.getVar('INITRD_LIVE').split():
> > >> +            # get a list of initrds
> > >> +            initrd_list +=3D cpio + ' '
> > >> +
> > >> +        ukify_cmd +=3D " --initrd=3D%s" % initrd_list
> > >> +    else:
> > >> +        bb.fatal("ERROR - Required argument: INITRD")
> > >> +
> > >> +    deploy_dir_image =3D d.getVar('DEPLOY_DIR_IMAGE')
> > >> +
> > >> +    # Kernel
> > >> +    if d.getVar('KERNEL_IMAGETYPE'):
> > >> +        kernel =3D "%s/%s" % (deploy_dir_image, d.getVar('KERNEL_IM=
AGETYPE'))
> > >> +        kernel_version =3D d.getVar('KERNEL_VERSION')
> > >> +        if not os.path.exists(kernel):
> > >> +            bb.fatal(f"ERROR: cannot find {kernel}.")
> > >> +
> > >> +        ukify_cmd +=3D " --linux=3D%s --uname %s" % (kernel, kernel=
_version)
> > >> +    else:
> > >> +        bb.fatal("ERROR - Required argument: KERNEL")
> > >> +
> > >> +    # Architecture
> > >> +    target_arch =3D d.getVar('EFI_ARCH')
> > >> +    ukify_cmd +=3D " --efi-arch %s" % target_arch
> > >> +
> > >> +    # Stub
> > >> +    stub =3D "%s/linux%s.efi.stub" % (deploy_dir_image, target_arch=
)
> > >> +    if not os.path.exists(stub):
> > >> +        bb.fatal(f"ERROR: cannot find {stub}.")
> > >> +    ukify_cmd +=3D " --stub %s" % stub
> > >> +
> > >> +    # Add option for dtb
> > >> +    if d.getVar('KERNEL_DEVICETREE'):
> > >> +        first_dtb =3D d.getVar('KERNEL_DEVICETREE').split()[0]
> > >> +        dtb_path =3D "%s/%s" % (deploy_dir_image, first_dtb)
> > >> +
> > >> +        if not os.path.exists(dtb_path):
> > >> +            bb.fatal(f"ERROR: cannot find {dtb_path}.")
> > >> +
> > >> +        ukify_cmd +=3D " --devicetree %s" % dtb_path
> > >> +
> > >> +    # Add option to pass a config file to sign the UKI.
> > >> +    if os.path.exists(d.getVar('UKI_CONFIG_FILE')):
> > >> +        ukify_cmd +=3D " --config=3D%s" % d.getVar('UKI_CONFIG_FILE=
')
> > >> +        ukify_cmd +=3D " --tools=3D%s%s/lib/systemd/tools" % (d.get=
Var("RECIPE_SYSROOT_NATIVE"), d.getVar("prefix"))
> > >> +        bb.note("Pulling keys from config file")
> > >> +    else:
> > >> +        bb.note("Generating unsigned UKI")
> > >> +
> > >> +    # Custom UKI name
> > >> +    output =3D " --output=3D%s" % d.getVar('UKI_FILENAME')
> > >> +    ukify_cmd +=3D " %s" % output
> > >> +
> > >> +    # Set env to determine where bitbake should look for dynamic li=
braries
> > >> +    env =3D os.environ.copy() # get the env variables
> > >> +    env['LD_LIBRARY_PATH'] =3D d.expand("${RECIPE_SYSROOT_NATIVE}/u=
sr/lib/systemd:${LD_LIBRARY_PATH}")
> > >> +
> > >> +    # Run the ukify command
> > >> +    subprocess.check_call(ukify_cmd, env=3Denv, shell=3DTrue)
> > >> +}
> > >> +
> > >> +inherit deploy
> > >> +
> > >> +do_deploy () {
> > >> +    # Copy generated UKI into DEPLOYDIR
> > >> +    install ${B}/${UKI_FILENAME} ${DEPLOYDIR}
> > >> +}
> > >> +
> > >> +addtask uki before do_deploy do_image after do_rootfs
> > >> +addtask deploy before do_build after do_compile
> > >> \ No newline at end of file
> > >> diff --git a/meta/recipes-core/systemd/systemd_254.bb b/meta/recipes=
-core/systemd/systemd_254.bb
> > >> index 8d5cf13095..65f132abb8 100644
> > >> --- a/meta/recipes-core/systemd/systemd_254.bb
> > >> +++ b/meta/recipes-core/systemd/systemd_254.bb
> > >> @@ -6,6 +6,9 @@ PE =3D "1"
> > >>
> > >>   DEPENDS =3D "intltool-native gperf-native libcap util-linux python=
3-jinja2-native"
> > >>
> > >> +# The Ukify tool requires this module
> > >> +DEPENDS:append:class-native =3D " python3-pefile-native"
> > > Do we need to add this to OE-Core? I think this will cause current
> > > builds to fail?
> >
> >
> > I think you are right, there are some dependencies from this that are
> > not present in OE-core, this probably belongs in a different layer, at
> > least for the time being.
>
> I think that ukify is useful in OE-core. Having it in another layer
> would mean that we can not use it from the BSP layer.
>

Can you elaborate on that first point ? That sounds like an internal
restriction / rule, so it really doesn't factor into whether or not
something needs to be in oe-core or not.

The answer itself doesn't matter to me, I just didn't want someone
in the future to be searching and think that their BSP layer can
only use functionality from oe-core.

Bruce

> As the ukify is usable even without sbsign and pesign, I think we can
> do either of the following things:
>
> - Mark sbsign and pesign as recomendations instead of dependencies
>
> - Add PACAKGECONFIG for the signing support. If it is not enabled,
> replace sbsign and pesign support with the error message.
>
> --
> With best wishes
> Dmitry
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190876): https://lists.openembedded.org/g/openembedde=
d-core/message/190876
> Mute This Topic: https://lists.openembedded.org/mt/101106095/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

