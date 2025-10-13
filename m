Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97015CCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 13:15:59 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.43212.1760361350768856551
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 06:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JmzpPQeA;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 94A621A1339;
	Mon, 13 Oct 2025 13:15:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5F3D0606D7;
	Mon, 13 Oct 2025 13:15:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 966E7102F224D;
	Mon, 13 Oct 2025 15:15:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760361346; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/I4Nv4Ru8H9ALL6clAhSqaR8dF1vOMzSkmgQ5e5z8F8=;
	b=JmzpPQeAoNZ3E8VLLK4gNFdtkKBp2k3FhkMoNgjSJG93VySQ3W6t8VVXph6QRbCP82Fq8d
	EUF86bpiV50Vt75N5SgTFPwO45hqPCcJ6SeDP/0HCbmA2CRQOrjYrzgL1Ji6csb+P729W4
	93AHkQ62mmoAhxZzGQohBAqhESWKmjY8XtaAL6HiV89NYQSVeQiqjSovtgBch+dwDOzkNN
	DWQedA21dw4Oe8LkrdqeQbL3NvBPRV6sIqHxyMrhzU4G23971XQWEsCOtp5uHxS2uio+PB
	y8r3EKOnV7fa5eBjPk9aKw6zLEiO1DDkOww7x7xscgRc61RBdTFBykD3COXlTQ==
Date: Mon, 13 Oct 2025 15:15:42 +0200
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com, 
	Miquel Raynal <miquel.raynal@bootlin.com>, mathieu.dubois-briand@bootlin.com, antonin.godard@bootlin.com, 
	Pascal Eberhard <pascal.eberhard@se.com>
Subject: Re: [PATCH 1/6] backport: SPDX 3.0 fixes and tasks from upstream
 version Walnascar
Message-ID: <s2vn75popo5jkgg3nrbnobsm36ltswxh52fyzrnsoaht4qzk65@4bu5gofo32ph>
References: <20250905171154.182825-1-kamel.bouhara@bootlin.com>
 <20250905171154.182825-2-kamel.bouhara@bootlin.com>
 <CAJdd5GaQvU03EXRgCybsy9wvJA4X=xGj6f3XULEtoL4DUPapAw@mail.gmail.com>
 <7ouum3sgbrdp6atsay5ihoee5wuvylvfknyasuu6miuhqizzun@srkbphaw4fal>
 <CAJdd5Ga60mcQtiw5KHRC4YMW+vzbMZ4YA8ZLSRNqao_HeuYLiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJdd5Ga60mcQtiw5KHRC4YMW+vzbMZ4YA8ZLSRNqao_HeuYLiQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 13:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224784

On Tue, Oct 07, 2025 at 02:05:33PM -0600, Joshua Watt wrote:
> On Tue, Oct 7, 2025 at 5:43=E2=80=AFAM Kamel Bouhara <kamel.bouhara@bootl=
in.com> wrote:
> >
> > On Mon, Oct 06, 2025 at 04:35:55PM -0600, Joshua Watt wrote:
> > > I reviewed this and the code that is here LGTM. The Yocto TSC approved
> > > it on the condition that the test code is implemented.
> > >
> >
> > Hi Joshua,
> >
> > Thanks for the review.
> >
> > V2 of the backport is almost ready and includes the test code as
> > requested.
> >
> > The only remaining issue is with CVE/VEX handling, which can cause
> > do_create_spdx to fail when SPDX_INCLUDE_VEX !=3D "none".
>
> Ok, it took me a bit to figure out what needs to be done here. The
> reason that this happens is because Marta improved the CVE APIs in
> 2024 (see: poky fb3f440b7d8 "cve-check: annotate CVEs during
> analysis") to make the API return a dictionary instead of a set of
> CVEs. However, the API gets the extra information by calling
> decode_cve_status(), so I think you can make the SPDX 3 code do that
> for each CVE instead of expecting get_patched_cves() to do it for you.
> The decoding of the data is a little different (e.g uses different
> keys), but if you look at the change it should reveal how to decode
> it. I believe that will allow it to work and result in equivalent
> output to the SPDX code on master, but let me know if you run into
> other problems.
>

Thanks for the clarification, I updated the SPDX 3 code to iterate over
the CVE IDs and call decode_cve_status() for each, instead of expecting
a dictionary from get_patched_cves(). It resolves the issue and aligns
with the updated cve-check API.

> >
> > I=E2=80=99ll investigate a proper fix for this before finalizing the pa=
tch
> > series.
> >
> > Greetings,
> >
> > > On Fri, Sep 5, 2025 at 11:11=E2=80=AFAM Kamel Bouhara <kamel.bouhara@=
bootlin.com> wrote:
> > > >
> > > > From: "Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.c=
om>
> > > >
> > > > Backports the SPDX 3.0 support and fixes from upstream walnascar
> > > > commit 49f47169953b807d430461ca33f3a2b076119712 into upstream
> > > > scarthgap.
> > > >
> > > > Signed-off-by: Kamel Bouhara (Schneider Electric) <kamel.bouhara@bo=
otlin.com>
> > > > ---
> > > >  .../create-spdx-image-3.0.bbclass             |   85 +
> > > >  .../create-spdx-sdk-3.0.bbclass               |   74 +
> > > >  meta/classes-recipe/nospdx.bbclass            |   13 +
> > > >  meta/classes/create-spdx-3.0.bbclass          |  200 +
> > > >  meta/classes/spdx-common.bbclass              |   99 +
> > > >  meta/lib/oe/__init__.py                       |    2 +-
> > > >  meta/lib/oe/sbom30.py                         | 1096 ++++
> > > >  meta/lib/oe/spdx30.py                         | 5593 +++++++++++++=
++++
> > > >  meta/lib/oe/spdx30_tasks.py                   | 1348 ++++
> > > >  meta/lib/oe/spdx_common.py                    |  244 +
> > > >  10 files changed, 8753 insertions(+), 1 deletion(-)
> > > >  create mode 100644 meta/classes-recipe/create-spdx-image-3.0.bbcla=
ss
> > > >  create mode 100644 meta/classes-recipe/create-spdx-sdk-3.0.bbclass
> > > >  create mode 100644 meta/classes-recipe/nospdx.bbclass
> > > >  create mode 100644 meta/classes/create-spdx-3.0.bbclass
> > > >  create mode 100644 meta/classes/spdx-common.bbclass
> > > >  create mode 100644 meta/lib/oe/sbom30.py
> > > >  create mode 100644 meta/lib/oe/spdx30.py
> > > >  create mode 100644 meta/lib/oe/spdx30_tasks.py
> > > >  create mode 100644 meta/lib/oe/spdx_common.py
> > > >
> > > > diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/me=
ta/classes-recipe/create-spdx-image-3.0.bbclass
> > > > new file mode 100644
> > > > index 0000000000..e0f1766bb7
> > > > --- /dev/null
> > > > +++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
> > > > @@ -0,0 +1,85 @@
> > > > +#
> > > > +# Copyright OpenEmbedded Contributors
> > > > +#
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > +#
> > > > +# SPDX image tasks
> > > > +
> > > > +SPDX_ROOTFS_PACKAGES =3D "${SPDXDIR}/rootfs-packages.json"
> > > > +SPDXIMAGEDEPLOYDIR =3D "${SPDXDIR}/image-deploy"
> > > > +SPDXROOTFSDEPLOY =3D "${SPDXDIR}/rootfs-deploy"
> > > > +
> > > > +python spdx_collect_rootfs_packages() {
> > > > +    import json
> > > > +    from pathlib import Path
> > > > +    from oe.rootfs import image_list_installed_packages
> > > > +
> > > > +    root_packages_file =3D Path(d.getVar("SPDX_ROOTFS_PACKAGES"))
> > > > +
> > > > +    packages =3D image_list_installed_packages(d)
> > > > +    if not packages:
> > > > +        packages =3D {}
> > > > +
> > > > +    root_packages_file.parent.mkdir(parents=3DTrue, exist_ok=3DTru=
e)
> > > > +    with root_packages_file.open("w") as f:
> > > > +        json.dump(packages, f)
> > > > +}
> > > > +ROOTFS_POSTUNINSTALL_COMMAND =3D+ "spdx_collect_rootfs_packages"
> > > > +
> > > > +python do_create_rootfs_spdx() {
> > > > +    import oe.spdx30_tasks
> > > > +    oe.spdx30_tasks.create_rootfs_spdx(d)
> > > > +}
> > > > +addtask do_create_rootfs_spdx after do_rootfs before do_image
> > > > +SSTATETASKS +=3D "do_create_rootfs_spdx"
> > > > +do_create_rootfs_spdx[sstate-inputdirs] =3D "${SPDXROOTFSDEPLOY}"
> > > > +do_create_rootfs_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
> > > > +do_create_rootfs_spdx[recrdeptask] +=3D "do_create_spdx do_create_=
package_spdx"
> > > > +do_create_rootfs_spdx[cleandirs] +=3D "${SPDXROOTFSDEPLOY}"
> > > > +do_create_rootfs_spdx[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> > > > +
> > > > +python do_create_rootfs_spdx_setscene() {
> > > > +    sstate_setscene(d)
> > > > +}
> > > > +addtask do_create_rootfs_spdx_setscene
> > > > +
> > > > +python do_create_image_spdx() {
> > > > +    import oe.spdx30_tasks
> > > > +    oe.spdx30_tasks.create_image_spdx(d)
> > > > +}
> > > > +addtask do_create_image_spdx after do_image_complete do_create_roo=
tfs_spdx before do_build
> > > > +SSTATETASKS +=3D "do_create_image_spdx"
> > > > +SSTATE_SKIP_CREATION:task-create-image-spdx =3D "1"
> > > > +do_create_image_spdx[sstate-inputdirs] =3D "${SPDXIMAGEWORK}"
> > > > +do_create_image_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
> > > > +do_create_image_spdx[cleandirs] =3D "${SPDXIMAGEWORK}"
> > > > +do_create_image_spdx[dirs] =3D "${SPDXIMAGEWORK}"
> > > > +do_create_image_spdx[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> > > > +do_create_image_spdx[vardeps] +=3D "\
> > > > +    SPDX_IMAGE_PURPOSE \
> > > > +    "
> > > > +
> > > > +python do_create_image_spdx_setscene() {
> > > > +    sstate_setscene(d)
> > > > +}
> > > > +addtask do_create_image_spdx_setscene
> > > > +
> > > > +
> > > > +python do_create_image_sbom_spdx() {
> > > > +    import oe.spdx30_tasks
> > > > +    oe.spdx30_tasks.create_image_sbom_spdx(d)
> > > > +}
> > > > +addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_c=
reate_image_spdx before do_build
> > > > +SSTATETASKS +=3D "do_create_image_sbom_spdx"
> > > > +SSTATE_SKIP_CREATION:task-create-image-sbom =3D "1"
> > > > +do_create_image_sbom_spdx[sstate-inputdirs] =3D "${SPDXIMAGEDEPLOY=
DIR}"
> > > > +do_create_image_sbom_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_IMA=
GE}"
> > > > +do_create_image_sbom_spdx[stamp-extra-info] =3D "${MACHINE_ARCH}"
> > > > +do_create_image_sbom_spdx[cleandirs] =3D "${SPDXIMAGEDEPLOYDIR}"
> > > > +do_create_image_sbom_spdx[recrdeptask] +=3D "do_create_spdx do_cre=
ate_package_spdx"
> > > > +do_create_image_sbom_spdx[file-checksums] +=3D "${SPDX3_LIB_DEP_FI=
LES}"
> > > > +
> > > > +python do_create_image_sbom_spdx_setscene() {
> > > > +    sstate_setscene(d)
> > > > +}
> > > > +addtask do_create_image_sbom_spdx_setscene
> > > > diff --git a/meta/classes-recipe/create-spdx-sdk-3.0.bbclass b/meta=
/classes-recipe/create-spdx-sdk-3.0.bbclass
> > > > new file mode 100644
> > > > index 0000000000..855fb3d09f
> > > > --- /dev/null
> > > > +++ b/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
> > > > @@ -0,0 +1,74 @@
> > > > +#
> > > > +# Copyright OpenEmbedded Contributors
> > > > +#
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > +#
> > > > +# SPDX SDK tasks
> > > > +
> > > > +do_populate_sdk[recrdeptask] +=3D "do_create_spdx do_create_packag=
e_spdx"
> > > > +do_populate_sdk[cleandirs] +=3D "${SPDXSDKWORK}"
> > > > +do_populate_sdk[postfuncs] +=3D "sdk_create_sbom"
> > > > +do_populate_sdk[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> > > > +POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk =3D " sdk_=
host_create_spdx"
> > > > +POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk =3D " sd=
k_target_create_spdx"
> > > > +
> > > > +do_populate_sdk_ext[recrdeptask] +=3D "do_create_spdx do_create_pa=
ckage_spdx"
> > > > +do_populate_sdk_ext[cleandirs] +=3D "${SPDXSDKEXTWORK}"
> > > > +do_populate_sdk_ext[postfuncs] +=3D "sdk_ext_create_sbom"
> > > > +do_populate_sdk_ext[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> > > > +POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk-ext =3D " =
sdk_ext_host_create_spdx"
> > > > +POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk-ext =3D =
" sdk_ext_target_create_spdx"
> > > > +
> > > > +python sdk_host_create_spdx() {
> > > > +    from pathlib import Path
> > > > +    import oe.spdx30_tasks
> > > > +    spdx_work_dir =3D Path(d.getVar('SPDXSDKWORK'))
> > > > +
> > > > +    oe.spdx30_tasks.sdk_create_spdx(d, "host", spdx_work_dir, d.ge=
tVar("TOOLCHAIN_OUTPUTNAME"))
> > > > +}
> > > > +
> > > > +python sdk_target_create_spdx() {
> > > > +    from pathlib import Path
> > > > +    import oe.spdx30_tasks
> > > > +    spdx_work_dir =3D Path(d.getVar('SPDXSDKWORK'))
> > > > +
> > > > +    oe.spdx30_tasks.sdk_create_spdx(d, "target", spdx_work_dir, d.=
getVar("TOOLCHAIN_OUTPUTNAME"))
> > > > +}
> > > > +
> > > > +python sdk_ext_host_create_spdx() {
> > > > +    from pathlib import Path
> > > > +    import oe.spdx30_tasks
> > > > +    spdx_work_dir =3D Path(d.getVar('SPDXSDKEXTWORK'))
> > > > +
> > > > +    # TODO: This doesn't seem to work
> > > > +    oe.spdx30_tasks.sdk_create_spdx(d, "host", spdx_work_dir, d.ge=
tVar("TOOLCHAINEXT_OUTPUTNAME"))
> > > > +}
> > > > +
> > > > +python sdk_ext_target_create_spdx() {
> > > > +    from pathlib import Path
> > > > +    import oe.spdx30_tasks
> > > > +    spdx_work_dir =3D Path(d.getVar('SPDXSDKEXTWORK'))
> > > > +
> > > > +    # TODO: This doesn't seem to work
> > > > +    oe.spdx30_tasks.sdk_create_spdx(d, "target", spdx_work_dir, d.=
getVar("TOOLCHAINEXT_OUTPUTNAME"))
> > > > +}
> > > > +
> > > > +
> > > > +python sdk_create_sbom() {
> > > > +    from pathlib import Path
> > > > +    import oe.spdx30_tasks
> > > > +    sdk_deploydir =3D Path(d.getVar("SDKDEPLOYDIR"))
> > > > +    spdx_work_dir =3D Path(d.getVar('SPDXSDKWORK'))
> > > > +
> > > > +    oe.spdx30_tasks.create_sdk_sbom(d, sdk_deploydir, spdx_work_di=
r, d.getVar("TOOLCHAIN_OUTPUTNAME"))
> > > > +}
> > > > +
> > > > +python sdk_ext_create_sbom() {
> > > > +    from pathlib import Path
> > > > +    import oe.spdx30_tasks
> > > > +    sdk_deploydir =3D Path(d.getVar("SDKEXTDEPLOYDIR"))
> > > > +    spdx_work_dir =3D Path(d.getVar('SPDXSDKEXTWORK'))
> > > > +
> > > > +    oe.spdx30_tasks.create_sdk_sbom(d, sdk_deploydir, spdx_work_di=
r, d.getVar("TOOLCHAINEXT_OUTPUTNAME"))
> > > > +}
> > > > +
> > > > diff --git a/meta/classes-recipe/nospdx.bbclass b/meta/classes-reci=
pe/nospdx.bbclass
> > > > new file mode 100644
> > > > index 0000000000..b20e28218b
> > > > --- /dev/null
> > > > +++ b/meta/classes-recipe/nospdx.bbclass
> > > > @@ -0,0 +1,13 @@
> > > > +#
> > > > +# Copyright OpenEmbedded Contributors
> > > > +#
> > > > +# SPDX-License-Identifier: MIT
> > > > +#
> > > > +
> > > > +deltask do_collect_spdx_deps
> > > > +deltask do_create_spdx
> > > > +deltask do_create_spdx_runtime
> > > > +deltask do_create_package_spdx
> > > > +deltask do_create_rootfs_spdx
> > > > +deltask do_create_image_spdx
> > > > +deltask do_create_image_sbom
> > > > diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/cr=
eate-spdx-3.0.bbclass
> > > > new file mode 100644
> > > > index 0000000000..044517d9f7
> > > > --- /dev/null
> > > > +++ b/meta/classes/create-spdx-3.0.bbclass
> > > > @@ -0,0 +1,200 @@
> > > > +#
> > > > +# Copyright OpenEmbedded Contributors
> > > > +#
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > +#
> > > > +
> > > > +inherit spdx-common
> > > > +
> > > > +SPDX_VERSION =3D "3.0.1"
> > > > +
> > > > +# The list of SPDX profiles generated documents will conform to
> > > > +SPDX_PROFILES ?=3D "core build software simpleLicensing security"
> > > > +
> > > > +SPDX_INCLUDE_BUILD_VARIABLES ??=3D "0"
> > > > +SPDX_INCLUDE_BUILD_VARIABLES[doc] =3D "If set to '1', the bitbake =
variables for a \
> > > > +    recipe will be included in the Build object. This will most li=
kely result \
> > > > +    in non-reproducible SPDX output"
> > > > +
> > > > +SPDX_INCLUDE_BITBAKE_PARENT_BUILD ??=3D "0"
> > > > +SPDX_INCLUDE_BITBAKE_PARENT_BUILD[doc] =3D "Report the parent invo=
cation of bitbake \
> > > > +    for each Build object. This allows you to know who invoked bit=
bake to perform \
> > > > +    a build, but will result in non-reproducible SPDX output."
> > > > +
> > > > +SPDX_PACKAGE_ADDITIONAL_PURPOSE ?=3D ""
> > > > +SPDX_PACKAGE_ADDITIONAL_PURPOSE[doc] =3D "The list of additional p=
urposes to assign to \
> > > > +    the generated packages for a recipe. The primary purpose is al=
ways `install`. \
> > > > +    Packages overrides are allowed to override the additional purp=
oses for \
> > > > +    individual packages."
> > > > +
> > > > +SPDX_IMAGE_PURPOSE ?=3D "filesystemImage"
> > > > +SPDX_IMAGE_PURPOSE[doc] =3D "The list of purposes to assign to the=
 generated images. \
> > > > +    The first listed item will be the Primary Purpose and all addi=
tional items will \
> > > > +    be added as additional purposes"
> > > > +
> > > > +SPDX_SDK_PURPOSE ?=3D "install"
> > > > +SPDX_SDK_PURPOSE[doc] =3D "The list of purposes to assign to the g=
enerate SDK installer. \
> > > > +    The first listed item will be the Primary Purpose and all addi=
tional items will \
> > > > +    be added as additional purposes"
> > > > +
> > > > +SPDX_INCLUDE_VEX ??=3D "current"
> > > > +SPDX_INCLUDE_VEX[doc] =3D "Controls what VEX information is in the=
 output. Set to \
> > > > +    'none' to disable all VEX data. Set to 'current' to only inclu=
de VEX data \
> > > > +    for vulnerabilities not already fixed in the upstream source c=
ode \
> > > > +    (recommended). Set  to 'all' to get all known historical vulne=
rabilities, \
> > > > +    including those already fixed upstream (warning: This can be l=
arge and \
> > > > +    slow)."
> > > > +
> > > > +SPDX_INCLUDE_TIMESTAMPS ?=3D "0"
> > > > +SPDX_INCLUDE_TIMESTAMPS[doc] =3D "Include time stamps in SPDX outp=
ut. This is \
> > > > +    useful if you want to know when artifacts were produced and wh=
en builds \
> > > > +    occurred, but will result in non-reproducible SPDX output"
> > > > +
> > > > +SPDX_IMPORTS ??=3D ""
> > > > +SPDX_IMPORTS[doc] =3D "SPDX_IMPORTS is the base variable that desc=
ribes how to \
> > > > +    reference external SPDX ids. Each import is defined as a key i=
n this \
> > > > +    variable with a suffix to describe to as a suffix to look up m=
ore \
> > > > +    information about the import. Each key can have the following =
variables: \
> > > > +        SPDX_IMPORTS_<key>_spdxid: The Fully qualified SPDX ID of =
the object \
> > > > +        SPDX_IMPORTS_<key>_uri: The URI where the SPDX Document th=
at contains \
> > > > +            the external object can be found. Optional but recomme=
nded \
> > > > +        SPDX_IMPORTS_<key>_hash_<hash>: The Checksum of the SPDX D=
ocument that \
> > > > +            contains the External ID. <hash> must be one the valid=
 SPDX hashing \
> > > > +            algorithms, as described by the HashAlgorithm vocabula=
ry in the\
> > > > +            SPDX 3 spec. Optional but recommended"
> > > > +
> > > > +# Agents
> > > > +#   Bitbake variables can be used to describe an SPDX Agent that m=
ay be used
> > > > +#   during the build. An Agent is specified using a set of variabl=
es which all
> > > > +#   start with some common base name:
> > > > +#
> > > > +#   <BASE>_name: The name of the Agent (required)
> > > > +#   <BASE>_type: The type of Agent. Must be one of "person", "orga=
nization",
> > > > +#       "software", or "agent" (the default if not specified)
> > > > +#   <BASE>_comment: The comment for the Agent (optional)
> > > > +#   <BASE>_id_<ID>: And External Identifier for the Agent. <ID> mu=
st be a valid
> > > > +#       ExternalIdentifierType from the SPDX 3 spec. Commonly, an =
E-mail address
> > > > +#       can be specified with <BASE>_id_email
> > > > +#
> > > > +#   Alternatively, an Agent can be an external reference by refere=
ncing a key
> > > > +#   in SPDX_IMPORTS like so:
> > > > +#
> > > > +#   <BASE>_import =3D "<key>"
> > > > +#
> > > > +#   Finally, the same agent described by another set of agent vari=
ables can be
> > > > +#   referenced by specifying the basename of the variable that sho=
uld be
> > > > +#   referenced:
> > > > +#
> > > > +#   SPDX_PACKAGE_SUPPLIER_ref =3D "SPDX_AUTHORS_openembedded"
> > > > +
> > > > +SPDX_AUTHORS ??=3D "openembedded"
> > > > +SPDX_AUTHORS[doc] =3D "A space separated list of the document auth=
ors. Each item \
> > > > +    is used to name a base variable like SPDX_AUTHORS_<AUTHOR> tha=
t \
> > > > +    describes the author."
> > > > +
> > > > +SPDX_AUTHORS_openembedded_name =3D "OpenEmbedded"
> > > > +SPDX_AUTHORS_openembedded_type =3D "organization"
> > > > +
> > > > +SPDX_BUILD_HOST[doc] =3D "The base variable name to describe the b=
uild host on \
> > > > +    which a build is running. Must be an SPDX_IMPORTS key. Require=
s \
> > > > +    SPDX_INCLUDE_BITBAKE_PARENT_BUILD. NOTE: Setting this will res=
ult in \
> > > > +    non-reproducible SPDX output"
> > > > +
> > > > +SPDX_INVOKED_BY[doc] =3D "The base variable name to describe the A=
gent that \
> > > > +    invoked the build, which builds will link to if specified. Req=
uires \
> > > > +    SPDX_INCLUDE_BITBAKE_PARENT_BUILD. NOTE: Setting this will lik=
ely result in \
> > > > +    non-reproducible SPDX output"
> > > > +
> > > > +SPDX_ON_BEHALF_OF[doc] =3D "The base variable name to describe the=
 Agent on who's \
> > > > +    behalf the invoking Agent (SPDX_INVOKED_BY) is running the bui=
ld. Requires \
> > > > +    SPDX_INCLUDE_BITBAKE_PARENT_BUILD. NOTE: Setting this will lik=
ely result in \
> > > > +    non-reproducible SPDX output"
> > > > +
> > > > +SPDX_PACKAGE_SUPPLIER[doc] =3D "The base variable name to describe=
 the Agent who \
> > > > +    is supplying artifacts produced by the build"
> > > > +
> > > > +SPDX_PACKAGE_VERSION ??=3D "${PV}"
> > > > +SPDX_PACKAGE_VERSION[doc] =3D "The version of a package, software_=
packageVersion \
> > > > +    in software_Package"
> > > > +
> > > > +IMAGE_CLASSES:append =3D " create-spdx-image-3.0"
> > > > +SDK_CLASSES +=3D "create-spdx-sdk-3.0"
> > > > +
> > > > +oe.spdx30_tasks.set_timestamp_now[vardepsexclude] =3D "SPDX_INCLUD=
E_TIMESTAMPS"
> > > > +oe.spdx30_tasks.get_package_sources_from_debug[vardepsexclude] +=
=3D "STAGING_KERNEL_DIR"
> > > > +oe.spdx30_tasks.collect_dep_objsets[vardepsexclude] =3D "SPDX_MULT=
ILIB_SSTATE_ARCHS"
> > > > +
> > > > +
> > > > +# SPDX library code makes heavy use of classes, which bitbake cann=
ot easily
> > > > +# parse out dependencies. As such, the library code files that mak=
e use of
> > > > +# classes are explicitly added as file checksum dependencies.
> > > > +SPDX3_LIB_DEP_FILES =3D "\
> > > > +    ${COREBASE}/meta/lib/oe/sbom30.py:True \
> > > > +    ${COREBASE}/meta/lib/oe/spdx30.py:True \
> > > > +    "
> > > > +
> > > > +python do_create_spdx() {
> > > > +    import oe.spdx30_tasks
> > > > +    oe.spdx30_tasks.create_spdx(d)
> > > > +}
> > > > +do_create_spdx[vardeps] +=3D "\
> > > > +    SPDX_INCLUDE_BITBAKE_PARENT_BUILD \
> > > > +    SPDX_PACKAGE_ADDITIONAL_PURPOSE \
> > > > +    SPDX_PROFILES \
> > > > +    SPDX_NAMESPACE_PREFIX \
> > > > +    SPDX_UUID_NAMESPACE \
> > > > +    "
> > > > +
> > > > +addtask do_create_spdx after \
> > > > +    do_collect_spdx_deps \
> > > > +    do_deploy_source_date_epoch \
> > > > +    do_populate_sysroot do_package do_packagedata \
> > > > +    before do_populate_sdk do_populate_sdk_ext do_build do_rm_work
> > > > +
> > > > +SSTATETASKS +=3D "do_create_spdx"
> > > > +do_create_spdx[sstate-inputdirs] =3D "${SPDXDEPLOY}"
> > > > +do_create_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
> > > > +do_create_spdx[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> > > > +
> > > > +python do_create_spdx_setscene () {
> > > > +    sstate_setscene(d)
> > > > +}
> > > > +addtask do_create_spdx_setscene
> > > > +
> > > > +do_create_spdx[dirs] =3D "${SPDXWORK}"
> > > > +do_create_spdx[cleandirs] =3D "${SPDXDEPLOY} ${SPDXWORK}"
> > > > +do_create_spdx[depends] +=3D " \
> > > > +    ${PATCHDEPENDENCY} \
> > > > +    ${@create_spdx_source_deps(d)} \
> > > > +"
> > > > +
> > > > +python do_create_package_spdx() {
> > > > +    import oe.spdx30_tasks
> > > > +    oe.spdx30_tasks.create_package_spdx(d)
> > > > +}
> > > > +oe.spdx30_tasks.create_package_spdx[vardepsexclude] =3D "OVERRIDES"
> > > > +
> > > > +addtask do_create_package_spdx after do_create_spdx before do_buil=
d do_rm_work
> > > > +SSTATETASKS +=3D "do_create_package_spdx"
> > > > +do_create_package_spdx[sstate-inputdirs] =3D "${SPDXRUNTIMEDEPLOY}"
> > > > +do_create_package_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
> > > > +do_create_package_spdx[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES=
}"
> > > > +
> > > > +python do_create_package_spdx_setscene () {
> > > > +    sstate_setscene(d)
> > > > +}
> > > > +addtask do_create_package_spdx_setscene
> > > > +
> > > > +do_create_package_spdx[dirs] =3D "${SPDXRUNTIMEDEPLOY}"
> > > > +do_create_package_spdx[cleandirs] =3D "${SPDXRUNTIMEDEPLOY}"
> > > > +do_create_package_spdx[rdeptask] =3D "do_create_spdx"
> > > > +
> > > > +python spdx30_build_started_handler () {
> > > > +    import oe.spdx30_tasks
> > > > +    d =3D e.data.createCopy()
> > > > +    oe.spdx30_tasks.write_bitbake_spdx(d)
> > > > +}
> > > > +
> > > > +addhandler spdx30_build_started_handler
> > > > +spdx30_build_started_handler[eventmask] =3D "bb.event.BuildStarted"
> > > > +
> > > > diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-c=
ommon.bbclass
> > > > new file mode 100644
> > > > index 0000000000..36feb56807
> > > > --- /dev/null
> > > > +++ b/meta/classes/spdx-common.bbclass
> > > > @@ -0,0 +1,99 @@
> > > > +#
> > > > +# Copyright OpenEmbedded Contributors
> > > > +#
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > +#
> > > > +
> > > > +SPDX_VERSION ??=3D ""
> > > > +DEPLOY_DIR_SPDX ??=3D "${DEPLOY_DIR}/spdx/${SPDX_VERSION}"
> > > > +
> > > > +# The product name that the CVE database uses.  Defaults to BPN, b=
ut may need to
> > > > +# be overriden per recipe (for example tiff.bb sets CVE_PRODUCT=3D=
libtiff).
> > > > +CVE_PRODUCT ??=3D "${BPN}"
> > > > +CVE_VERSION ??=3D "${PV}"
> > > > +
> > > > +SPDXDIR ??=3D "${WORKDIR}/spdx/${SPDX_VERSION}"
> > > > +SPDXDEPLOY =3D "${SPDXDIR}/deploy"
> > > > +SPDXWORK =3D "${SPDXDIR}/work"
> > > > +SPDXIMAGEWORK =3D "${SPDXDIR}/image-work"
> > > > +SPDXSDKWORK =3D "${SPDXDIR}/sdk-work"
> > > > +SPDXSDKEXTWORK =3D "${SPDXDIR}/sdk-ext-work"
> > > > +SPDXDEPS =3D "${SPDXDIR}/deps.json"
> > > > +
> > > > +SPDX_TOOL_NAME ??=3D "oe-spdx-creator"
> > > > +SPDX_TOOL_VERSION ??=3D "1.0"
> > > > +
> > > > +SPDXRUNTIMEDEPLOY =3D "${SPDXDIR}/runtime-deploy"
> > > > +
> > > > +SPDX_INCLUDE_SOURCES ??=3D "0"
> > > > +
> > > > +SPDX_UUID_NAMESPACE ??=3D "sbom.openembedded.org"
> > > > +SPDX_NAMESPACE_PREFIX ??=3D "http://spdx.org/spdxdocs"
> > > > +SPDX_PRETTY ??=3D "0"
> > > > +
> > > > +SPDX_LICENSES ??=3D "${COREBASE}/meta/files/spdx-licenses.json"
> > > > +
> > > > +SPDX_CUSTOM_ANNOTATION_VARS ??=3D ""
> > > > +
> > > > +SPDX_MULTILIB_SSTATE_ARCHS ??=3D "${SSTATE_ARCHS}"
> > > > +
> > > > +def create_spdx_source_deps(d):
> > > > +    import oe.spdx_common
> > > > +
> > > > +    deps =3D []
> > > > +    if d.getVar("SPDX_INCLUDE_SOURCES") =3D=3D "1":
> > > > +        pn =3D d.getVar('PN')
> > > > +        # do_unpack is a hack for now; we only need it to get the
> > > > +        # dependencies do_unpack already has so we can extract the=
 source
> > > > +        # ourselves
> > > > +        if oe.spdx_common.has_task(d, "do_unpack"):
> > > > +            deps.append("%s:do_unpack" % pn)
> > > > +
> > > > +        if oe.spdx_common.is_work_shared_spdx(d) and \
> > > > +           oe.spdx_common.process_sources(d):
> > > > +            # For kernel source code
> > > > +            if oe.spdx_common.has_task(d, "do_shared_workdir"):
> > > > +                deps.append("%s:do_shared_workdir" % pn)
> > > > +            elif d.getVar('S') =3D=3D d.getVar('STAGING_KERNEL_DIR=
'):
> > > > +                deps.append("virtual/kernel:do_shared_workdir")
> > > > +
> > > > +            # For gcc-source-${PV} source code
> > > > +            if oe.spdx_common.has_task(d, "do_preconfigure"):
> > > > +                deps.append("%s:do_preconfigure" % pn)
> > > > +            elif oe.spdx_common.has_task(d, "do_patch"):
> > > > +                deps.append("%s:do_patch" % pn)
> > > > +            # For gcc-cross-x86_64 source code
> > > > +            elif oe.spdx_common.has_task(d, "do_configure"):
> > > > +                deps.append("%s:do_configure" % pn)
> > > > +
> > > > +    return " ".join(deps)
> > > > +
> > > > +
> > > > +python do_collect_spdx_deps() {
> > > > +    # This task calculates the build time dependencies of the reci=
pe, and is
> > > > +    # required because while a task can deptask on itself, those d=
ependencies
> > > > +    # do not show up in BB_TASKDEPDATA. To work around that, this =
task does the
> > > > +    # deptask on do_create_spdx and writes out the dependencies it=
 finds, then
> > > > +    # do_create_spdx reads in the found dependencies when writing =
the actual
> > > > +    # SPDX document
> > > > +    import json
> > > > +    import oe.spdx_common
> > > > +    from pathlib import Path
> > > > +
> > > > +    spdx_deps_file =3D Path(d.getVar("SPDXDEPS"))
> > > > +
> > > > +    deps =3D oe.spdx_common.collect_direct_deps(d, "do_create_spdx=
")
> > > > +
> > > > +    with spdx_deps_file.open("w") as f:
> > > > +        json.dump(deps, f)
> > > > +}
> > > > +# NOTE: depending on do_unpack is a hack that is necessary to get =
it's dependencies for archive the source
> > > > +addtask do_collect_spdx_deps after do_unpack
> > > > +do_collect_spdx_deps[depends] +=3D "${PATCHDEPENDENCY}"
> > > > +do_collect_spdx_deps[deptask] =3D "do_create_spdx"
> > > > +do_collect_spdx_deps[dirs] =3D "${SPDXDIR}"
> > > > +
> > > > +oe.spdx_common.collect_direct_deps[vardepsexclude] +=3D "BB_TASKDE=
PDATA"
> > > > +oe.spdx_common.collect_direct_deps[vardeps] +=3D "DEPENDS"
> > > > +oe.spdx_common.collect_package_providers[vardepsexclude] +=3D "BB_=
TASKDEPDATA"
> > > > +oe.spdx_common.get_patched_src[vardepsexclude] +=3D "STAGING_KERNE=
L_DIR"
> > > > diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
> > > > index 6eb536ad28..dd9338ec2c 100644
> > > > --- a/meta/lib/oe/__init__.py
> > > > +++ b/meta/lib/oe/__init__.py
> > > > @@ -9,4 +9,4 @@ __path__ =3D extend_path(__path__, __name__)
> > > >
> > > >  BBIMPORTS =3D ["data", "path", "utils", "types", "package", "packa=
gedata", \
> > > >               "packagegroup", "sstatesig", "lsb", "cachedpath", "li=
cense", \
> > > > -             "qa", "reproducible", "rust", "buildcfg", "go"]
> > > > +             "qa", "reproducible", "rust", "buildcfg", "go", "spdx=
30_tasks", "spdx_common"]
> > > > diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> > > > new file mode 100644
> > > > index 0000000000..227ac51877
> > > > --- /dev/null
> > > > +++ b/meta/lib/oe/sbom30.py
> > > > @@ -0,0 +1,1096 @@
> > > > +#
> > > > +# Copyright OpenEmbedded Contributors
> > > > +#
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > +#
> > > > +
> > > > +from pathlib import Path
> > > > +
> > > > +import oe.spdx30
> > > > +import bb
> > > > +import re
> > > > +import hashlib
> > > > +import uuid
> > > > +import os
> > > > +import oe.spdx_common
> > > > +from datetime import datetime, timezone
> > > > +
> > > > +OE_SPDX_BASE =3D "https://rdf.openembedded.org/spdx/3.0/"
> > > > +
> > > > +VEX_VERSION =3D "1.0.0"
> > > > +
> > > > +SPDX_BUILD_TYPE =3D "http://openembedded.org/bitbake"
> > > > +
> > > > +OE_ALIAS_PREFIX =3D "http://spdxdocs.org/openembedded-alias/by-doc=
-hash/"
> > > > +OE_DOC_ALIAS_PREFIX =3D "http://spdxdocs.org/openembedded-alias/do=
c/"
> > > > +
> > > > +
> > > > +@oe.spdx30.register(OE_SPDX_BASE + "id-alias")
> > > > +class OEIdAliasExtension(oe.spdx30.extension_Extension):
> > > > +    """
> > > > +    This extension allows an Element to provide an internal alias =
for the SPDX
> > > > +    ID. Since SPDX requires unique URIs for each SPDX ID, most of =
the objects
> > > > +    created have a unique UUID namespace and the unihash of the ta=
sk encoded in
> > > > +    their SPDX ID. However, this causes a problem for referencing =
documents
> > > > +    across recipes, since the taskhash of a dependency may not fac=
tor into the
> > > > +    taskhash of the current task and thus the current task won't r=
ebuild and
> > > > +    see the new SPDX ID when the dependency changes (e.g. ABI safe=
 recipes and
> > > > +    tasks).
> > > > +
> > > > +    To help work around this, this extension provides a non-unique=
 alias for an
> > > > +    Element by which it can be referenced from other tasks/recipes=
=2E When a
> > > > +    final SBoM is created, references to these aliases will be rep=
laced with
> > > > +    the actual unique SPDX ID.
> > > > +
> > > > +    Most Elements will automatically get an alias created when the=
y are written
> > > > +    out if they do not already have one. To suppress the creation =
of an alias,
> > > > +    add an extension with a blank `alias` property.
> > > > +
> > > > +
> > > > +    It is in internal extension that should be removed when writin=
g out a final
> > > > +    SBoM
> > > > +    """
> > > > +
> > > > +    CLOSED =3D True
> > > > +    INTERNAL =3D True
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        cls._add_property(
> > > > +            "alias",
> > > > +            oe.spdx30.StringProp(),
> > > > +            OE_SPDX_BASE + "alias",
> > > > +            max_count=3D1,
> > > > +        )
> > > > +
> > > > +        cls._add_property(
> > > > +            "link_name",
> > > > +            oe.spdx30.StringProp(),
> > > > +            OE_SPDX_BASE + "link-name",
> > > > +            max_count=3D1,
> > > > +        )
> > > > +
> > > > +
> > > > +@oe.spdx30.register(OE_SPDX_BASE + "file-name-alias")
> > > > +class OEFileNameAliasExtension(oe.spdx30.extension_Extension):
> > > > +    CLOSED =3D True
> > > > +    INTERNAL =3D True
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        cls._add_property(
> > > > +            "aliases",
> > > > +            oe.spdx30.ListProp(oe.spdx30.StringProp()),
> > > > +            OE_SPDX_BASE + "filename-alias",
> > > > +        )
> > > > +
> > > > +
> > > > +@oe.spdx30.register(OE_SPDX_BASE + "license-scanned")
> > > > +class OELicenseScannedExtension(oe.spdx30.extension_Extension):
> > > > +    """
> > > > +    The presence of this extension means the file has already been=
 scanned for
> > > > +    license information
> > > > +    """
> > > > +
> > > > +    CLOSED =3D True
> > > > +    INTERNAL =3D True
> > > > +
> > > > +
> > > > +@oe.spdx30.register(OE_SPDX_BASE + "document-extension")
> > > > +class OEDocumentExtension(oe.spdx30.extension_Extension):
> > > > +    """
> > > > +    This extension is added to a SpdxDocument to indicate various =
useful bits
> > > > +    of information about its contents
> > > > +    """
> > > > +
> > > > +    CLOSED =3D True
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        cls._add_property(
> > > > +            "is_native",
> > > > +            oe.spdx30.BooleanProp(),
> > > > +            OE_SPDX_BASE + "is-native",
> > > > +            max_count=3D1,
> > > > +        )
> > > > +
> > > > +
> > > > +def spdxid_hash(*items):
> > > > +    h =3D hashlib.md5()
> > > > +    for i in items:
> > > > +        if isinstance(i, oe.spdx30.Element):
> > > > +            h.update(i._id.encode("utf-8"))
> > > > +        else:
> > > > +            h.update(i.encode("utf-8"))
> > > > +    return h.hexdigest()
> > > > +
> > > > +
> > > > +def spdx_sde(d):
> > > > +    sde =3D d.getVar("SOURCE_DATE_EPOCH")
> > > > +    if not sde:
> > > > +        return datetime.now(timezone.utc)
> > > > +
> > > > +    return datetime.fromtimestamp(int(sde), timezone.utc)
> > > > +
> > > > +
> > > > +def get_element_link_id(e):
> > > > +    """
> > > > +    Get the string ID which should be used to link to an Element. =
If the
> > > > +    element has an alias, that will be preferred, otherwise its SP=
DX ID will be
> > > > +    used.
> > > > +    """
> > > > +    ext =3D get_alias(e)
> > > > +    if ext is not None and ext.alias:
> > > > +        return ext.alias
> > > > +    return e._id
> > > > +
> > > > +
> > > > +def get_alias(obj):
> > > > +    for ext in obj.extension:
> > > > +        if not isinstance(ext, OEIdAliasExtension):
> > > > +            continue
> > > > +        return ext
> > > > +
> > > > +    return None
> > > > +
> > > > +
> > > > +def hash_id(_id):
> > > > +    return hashlib.sha256(_id.encode("utf-8")).hexdigest()
> > > > +
> > > > +
> > > > +def to_list(l):
> > > > +    if isinstance(l, set):
> > > > +        l =3D sorted(list(l))
> > > > +
> > > > +    if not isinstance(l, (list, tuple)):
> > > > +        raise TypeError("Must be a list or tuple. Got %s" % type(l=
))
> > > > +
> > > > +    return l
> > > > +
> > > > +
> > > > +class ObjectSet(oe.spdx30.SHACLObjectSet):
> > > > +    def __init__(self, d):
> > > > +        super().__init__()
> > > > +        self.d =3D d
> > > > +        self.alias_prefix =3D None
> > > > +
> > > > +    def create_index(self):
> > > > +        self.by_sha256_hash =3D {}
> > > > +        super().create_index()
> > > > +
> > > > +    def add_index(self, obj):
> > > > +        # Check that all elements are given an ID before being ins=
erted
> > > > +        if isinstance(obj, oe.spdx30.Element):
> > > > +            if not obj._id:
> > > > +                raise ValueError("Element missing ID")
> > > > +
> > > > +            alias_ext =3D get_alias(obj)
> > > > +            if alias_ext is not None and alias_ext.alias:
> > > > +                self.obj_by_id[alias_ext.alias] =3D obj
> > > > +
> > > > +            for v in obj.verifiedUsing:
> > > > +                if not isinstance(v, oe.spdx30.Hash):
> > > > +                    continue
> > > > +
> > > > +                if v.algorithm !=3D oe.spdx30.HashAlgorithm.sha256:
> > > > +                    continue
> > > > +
> > > > +                self.by_sha256_hash.setdefault(v.hashValue, set())=
=2Eadd(obj)
> > > > +
> > > > +        super().add_index(obj)
> > > > +        if isinstance(obj, oe.spdx30.SpdxDocument):
> > > > +            self.doc =3D obj
> > > > +            alias_ext =3D get_alias(obj)
> > > > +            if alias_ext is not None and alias_ext.alias:
> > > > +                self.alias_prefix =3D OE_ALIAS_PREFIX + hash_id(al=
ias_ext.alias) + "/"
> > > > +
> > > > +    def __filter_obj(self, obj, attr_filter):
> > > > +        return all(getattr(obj, k) =3D=3D v for k, v in attr_filte=
r.items())
> > > > +
> > > > +    def foreach_filter(self, typ, *, match_subclass=3DTrue, **attr=
_filter):
> > > > +        for obj in self.foreach_type(typ, match_subclass=3Dmatch_s=
ubclass):
> > > > +            if self.__filter_obj(obj, attr_filter):
> > > > +                yield obj
> > > > +
> > > > +    def find_filter(self, typ, *, match_subclass=3DTrue, **attr_fi=
lter):
> > > > +        for obj in self.foreach_filter(
> > > > +            typ, match_subclass=3Dmatch_subclass, **attr_filter
> > > > +        ):
> > > > +            return obj
> > > > +        return None
> > > > +
> > > > +    def foreach_root(self, typ, **attr_filter):
> > > > +        for obj in self.doc.rootElement:
> > > > +            if not isinstance(obj, typ):
> > > > +                continue
> > > > +
> > > > +            if self.__filter_obj(obj, attr_filter):
> > > > +                yield obj
> > > > +
> > > > +    def find_root(self, typ, **attr_filter):
> > > > +        for obj in self.foreach_root(typ, **attr_filter):
> > > > +            return obj
> > > > +        return None
> > > > +
> > > > +    def add_root(self, obj):
> > > > +        self.add(obj)
> > > > +        self.doc.rootElement.append(obj)
> > > > +        return obj
> > > > +
> > > > +    def is_native(self):
> > > > +        for e in self.doc.extension:
> > > > +            if not isinstance(e, oe.sbom30.OEDocumentExtension):
> > > > +                continue
> > > > +
> > > > +            if e.is_native is not None:
> > > > +                return e.is_native
> > > > +
> > > > +        return False
> > > > +
> > > > +    def set_is_native(self, is_native):
> > > > +        for e in self.doc.extension:
> > > > +            if not isinstance(e, oe.sbom30.OEDocumentExtension):
> > > > +                continue
> > > > +
> > > > +            e.is_native =3D is_native
> > > > +            return
> > > > +
> > > > +        if is_native:
> > > > +            self.doc.extension.append(oe.sbom30.OEDocumentExtensio=
n(is_native=3DTrue))
> > > > +
> > > > +    def add_aliases(self):
> > > > +        for o in self.foreach_type(oe.spdx30.Element):
> > > > +            self.set_element_alias(o)
> > > > +
> > > > +    def new_alias_id(self, obj, replace):
> > > > +        unihash =3D self.d.getVar("BB_UNIHASH")
> > > > +        namespace =3D self.get_namespace()
> > > > +        if unihash not in obj._id:
> > > > +            bb.warn(f"Unihash {unihash} not found in {obj._id}")
> > > > +            return None
> > > > +
> > > > +        if namespace not in obj._id:
> > > > +            bb.warn(f"Namespace {namespace} not found in {obj._id}=
")
> > > > +            return None
> > > > +
> > > > +        return obj._id.replace(unihash, "UNIHASH").replace(
> > > > +            namespace, replace + self.d.getVar("PN")
> > > > +        )
> > > > +
> > > > +    def remove_internal_extensions(self):
> > > > +        def remove(o):
> > > > +            o.extension =3D [e for e in o.extension if not getattr=
(e, "INTERNAL", False)]
> > > > +
> > > > +        for o in self.foreach_type(oe.spdx30.Element):
> > > > +            remove(o)
> > > > +
> > > > +        if self.doc:
> > > > +            remove(self.doc)
> > > > +
> > > > +    def get_namespace(self):
> > > > +        namespace_uuid =3D uuid.uuid5(
> > > > +            uuid.NAMESPACE_DNS, self.d.getVar("SPDX_UUID_NAMESPACE=
")
> > > > +        )
> > > > +        pn =3D self.d.getVar("PN")
> > > > +        return "%s/%s-%s" % (
> > > > +            self.d.getVar("SPDX_NAMESPACE_PREFIX"),
> > > > +            pn,
> > > > +            str(uuid.uuid5(namespace_uuid, pn)),
> > > > +        )
> > > > +
> > > > +    def set_element_alias(self, e):
> > > > +        if not e._id or e._id.startswith("_:"):
> > > > +            return
> > > > +
> > > > +        alias_ext =3D get_alias(e)
> > > > +        if alias_ext is None:
> > > > +            alias_id =3D self.new_alias_id(e, self.alias_prefix)
> > > > +            if alias_id is not None:
> > > > +                e.extension.append(OEIdAliasExtension(alias=3Dalia=
s_id))
> > > > +        elif (
> > > > +            alias_ext.alias
> > > > +            and not isinstance(e, oe.spdx30.SpdxDocument)
> > > > +            and not alias_ext.alias.startswith(self.alias_prefix)
> > > > +        ):
> > > > +            bb.warn(
> > > > +                f"Element {e._id} has alias {alias_ext.alias}, but=
 it should have prefix {self.alias_prefix}"
> > > > +            )
> > > > +
> > > > +    def new_spdxid(self, *suffix, include_unihash=3DTrue):
> > > > +        items =3D [self.get_namespace()]
> > > > +        if include_unihash:
> > > > +            unihash =3D self.d.getVar("BB_UNIHASH")
> > > > +            items.append(unihash)
> > > > +        items.extend(re.sub(r"[^a-zA-Z0-9_-]", "_", s) for s in su=
ffix)
> > > > +        return "/".join(items)
> > > > +
> > > > +    def new_import(self, key):
> > > > +        base =3D f"SPDX_IMPORTS_{key}"
> > > > +        spdxid =3D self.d.getVar(f"{base}_spdxid")
> > > > +        if not spdxid:
> > > > +            bb.fatal(f"{key} is not a valid SPDX_IMPORTS key")
> > > > +
> > > > +        for i in self.doc.import_:
> > > > +            if i.externalSpdxId =3D=3D spdxid:
> > > > +                # Already imported
> > > > +                return spdxid
> > > > +
> > > > +        m =3D oe.spdx30.ExternalMap(externalSpdxId=3Dspdxid)
> > > > +
> > > > +        uri =3D self.d.getVar(f"{base}_uri")
> > > > +        if uri:
> > > > +            m.locationHint =3D uri
> > > > +
> > > > +        for pyname, algorithm in oe.spdx30.HashAlgorithm.NAMED_IND=
IVIDUALS.items():
> > > > +            value =3D self.d.getVar(f"{base}_hash_{pyname}")
> > > > +            if value:
> > > > +                m.verifiedUsing.append(
> > > > +                    oe.spdx30.Hash(
> > > > +                        algorithm=3Dalgorithm,
> > > > +                        hashValue=3Dvalue,
> > > > +                    )
> > > > +                )
> > > > +
> > > > +        self.doc.import_.append(m)
> > > > +        return spdxid
> > > > +
> > > > +    def new_agent(self, varname, *, creation_info=3DNone, add=3DTr=
ue):
> > > > +        ref_varname =3D self.d.getVar(f"{varname}_ref")
> > > > +        if ref_varname:
> > > > +            if ref_varname =3D=3D varname:
> > > > +                bb.fatal(f"{varname} cannot reference itself")
> > > > +            return self.new_agent(ref_varname, creation_info=3Dcre=
ation_info)
> > > > +
> > > > +        import_key =3D self.d.getVar(f"{varname}_import")
> > > > +        if import_key:
> > > > +            return self.new_import(import_key)
> > > > +
> > > > +        name =3D self.d.getVar(f"{varname}_name")
> > > > +        if not name:
> > > > +            return None
> > > > +
> > > > +        spdxid =3D self.new_spdxid("agent", name)
> > > > +        agent =3D self.find_by_id(spdxid)
> > > > +        if agent is not None:
> > > > +            return agent
> > > > +
> > > > +        agent_type =3D self.d.getVar("%s_type" % varname)
> > > > +        if agent_type =3D=3D "person":
> > > > +            agent =3D oe.spdx30.Person()
> > > > +        elif agent_type =3D=3D "software":
> > > > +            agent =3D oe.spdx30.SoftwareAgent()
> > > > +        elif agent_type =3D=3D "organization":
> > > > +            agent =3D oe.spdx30.Organization()
> > > > +        elif not agent_type or agent_type =3D=3D "agent":
> > > > +            agent =3D oe.spdx30.Agent()
> > > > +        else:
> > > > +            bb.fatal("Unknown agent type '%s' in %s_type" % (agent=
_type, varname))
> > > > +
> > > > +        agent._id =3D spdxid
> > > > +        agent.creationInfo =3D creation_info or self.doc.creationI=
nfo
> > > > +        agent.name =3D name
> > > > +
> > > > +        comment =3D self.d.getVar("%s_comment" % varname)
> > > > +        if comment:
> > > > +            agent.comment =3D comment
> > > > +
> > > > +        for (
> > > > +            pyname,
> > > > +            idtype,
> > > > +        ) in oe.spdx30.ExternalIdentifierType.NAMED_INDIVIDUALS.it=
ems():
> > > > +            value =3D self.d.getVar("%s_id_%s" % (varname, pyname))
> > > > +            if value:
> > > > +                agent.externalIdentifier.append(
> > > > +                    oe.spdx30.ExternalIdentifier(
> > > > +                        externalIdentifierType=3Didtype,
> > > > +                        identifier=3Dvalue,
> > > > +                    )
> > > > +                )
> > > > +
> > > > +        if add:
> > > > +            self.add(agent)
> > > > +
> > > > +        return agent
> > > > +
> > > > +    def new_creation_info(self):
> > > > +        creation_info =3D oe.spdx30.CreationInfo()
> > > > +
> > > > +        name =3D "%s %s" % (
> > > > +            self.d.getVar("SPDX_TOOL_NAME"),
> > > > +            self.d.getVar("SPDX_TOOL_VERSION"),
> > > > +        )
> > > > +        tool =3D self.add(
> > > > +            oe.spdx30.Tool(
> > > > +                _id=3Dself.new_spdxid("tool", name),
> > > > +                creationInfo=3Dcreation_info,
> > > > +                name=3Dname,
> > > > +            )
> > > > +        )
> > > > +
> > > > +        authors =3D []
> > > > +        for a in self.d.getVar("SPDX_AUTHORS").split():
> > > > +            varname =3D "SPDX_AUTHORS_%s" % a
> > > > +            author =3D self.new_agent(varname, creation_info=3Dcre=
ation_info)
> > > > +
> > > > +            if not author:
> > > > +                bb.fatal("Unable to find or create author %s" % a)
> > > > +
> > > > +            authors.append(author)
> > > > +
> > > > +        creation_info.created =3D spdx_sde(self.d)
> > > > +        creation_info.specVersion =3D self.d.getVar("SPDX_VERSION")
> > > > +        creation_info.createdBy =3D authors
> > > > +        creation_info.createdUsing =3D [tool]
> > > > +
> > > > +        return creation_info
> > > > +
> > > > +    def copy_creation_info(self, copy):
> > > > +        c =3D oe.spdx30.CreationInfo(
> > > > +            created=3Dspdx_sde(self.d),
> > > > +            specVersion=3Dself.d.getVar("SPDX_VERSION"),
> > > > +        )
> > > > +
> > > > +        for author in copy.createdBy:
> > > > +            if isinstance(author, str):
> > > > +                c.createdBy.append(author)
> > > > +            else:
> > > > +                c.createdBy.append(author._id)
> > > > +
> > > > +        for tool in copy.createdUsing:
> > > > +            if isinstance(tool, str):
> > > > +                c.createdUsing.append(tool)
> > > > +            else:
> > > > +                c.createdUsing.append(tool._id)
> > > > +
> > > > +        return c
> > > > +
> > > > +    def new_annotation(self, subject, comment, typ):
> > > > +        return self.add(
> > > > +            oe.spdx30.Annotation(
> > > > +                _id=3Dself.new_spdxid("annotation", spdxid_hash(co=
mment, typ)),
> > > > +                creationInfo=3Dself.doc.creationInfo,
> > > > +                annotationType=3Dtyp,
> > > > +                subject=3Dsubject,
> > > > +                statement=3Dcomment,
> > > > +            )
> > > > +        )
> > > > +
> > > > +    def _new_relationship(
> > > > +        self,
> > > > +        cls,
> > > > +        from_,
> > > > +        typ,
> > > > +        to,
> > > > +        *,
> > > > +        spdxid_name=3D"relationship",
> > > > +        **props,
> > > > +    ):
> > > > +        from_ =3D to_list(from_)
> > > > +        to =3D to_list(to)
> > > > +
> > > > +        if not from_:
> > > > +            return []
> > > > +
> > > > +        if not to:
> > > > +            to =3D [oe.spdx30.IndividualElement.NoneElement]
> > > > +
> > > > +        ret =3D []
> > > > +
> > > > +        for f in from_:
> > > > +            hash_args =3D [typ, f]
> > > > +            for k in sorted(props.keys()):
> > > > +                hash_args.append(props[k])
> > > > +            hash_args.extend(to)
> > > > +
> > > > +            relationship =3D self.add(
> > > > +                cls(
> > > > +                    _id=3Dself.new_spdxid(spdxid_name, spdxid_hash=
(*hash_args)),
> > > > +                    creationInfo=3Dself.doc.creationInfo,
> > > > +                    from_=3Df,
> > > > +                    relationshipType=3Dtyp,
> > > > +                    to=3Dto,
> > > > +                    **props,
> > > > +                )
> > > > +            )
> > > > +            ret.append(relationship)
> > > > +
> > > > +        return ret
> > > > +
> > > > +    def new_relationship(self, from_, typ, to):
> > > > +        return self._new_relationship(oe.spdx30.Relationship, from=
_, typ, to)
> > > > +
> > > > +    def new_scoped_relationship(self, from_, typ, scope, to):
> > > > +        return self._new_relationship(
> > > > +            oe.spdx30.LifecycleScopedRelationship,
> > > > +            from_,
> > > > +            typ,
> > > > +            to,
> > > > +            scope=3Dscope,
> > > > +        )
> > > > +
> > > > +    def new_license_expression(
> > > > +        self, license_expression, license_data, license_text_map=
=3D{}
> > > > +    ):
> > > > +        license_list_version =3D license_data["licenseListVersion"]
> > > > +        # SPDX 3 requires that the license list version be a semver
> > > > +        # MAJOR.MINOR.MICRO, but the actual license version might =
be
> > > > +        # MAJOR.MINOR on some older versions. As such, manually ap=
pend a .0
> > > > +        # micro version if its missing to keep SPDX happy
> > > > +        if license_list_version.count(".") < 2:
> > > > +            license_list_version +=3D ".0"
> > > > +
> > > > +        spdxid =3D [
> > > > +            "license",
> > > > +            license_list_version,
> > > > +            re.sub(r"[^a-zA-Z0-9_-]", "_", license_expression),
> > > > +        ]
> > > > +
> > > > +        license_text =3D [
> > > > +            (k, license_text_map[k]) for k in sorted(license_text_=
map.keys())
> > > > +        ]
> > > > +
> > > > +        if not license_text:
> > > > +            lic =3D self.find_filter(
> > > > +                oe.spdx30.simplelicensing_LicenseExpression,
> > > > +                simplelicensing_licenseExpression=3Dlicense_expres=
sion,
> > > > +                simplelicensing_licenseListVersion=3Dlicense_list_=
version,
> > > > +            )
> > > > +            if lic is not None:
> > > > +                return lic
> > > > +        else:
> > > > +            spdxid.append(spdxid_hash(*(v for _, v in license_text=
)))
> > > > +            lic =3D self.find_by_id(self.new_spdxid(*spdxid))
> > > > +            if lic is not None:
> > > > +                return lic
> > > > +
> > > > +        lic =3D self.add(
> > > > +            oe.spdx30.simplelicensing_LicenseExpression(
> > > > +                _id=3Dself.new_spdxid(*spdxid),
> > > > +                creationInfo=3Dself.doc.creationInfo,
> > > > +                simplelicensing_licenseExpression=3Dlicense_expres=
sion,
> > > > +                simplelicensing_licenseListVersion=3Dlicense_list_=
version,
> > > > +            )
> > > > +        )
> > > > +
> > > > +        for key, value in license_text:
> > > > +            lic.simplelicensing_customIdToUri.append(
> > > > +                oe.spdx30.DictionaryEntry(key=3Dkey, value=3Dvalue)
> > > > +            )
> > > > +
> > > > +        return lic
> > > > +
> > > > +    def scan_declared_licenses(self, spdx_file, filepath, license_=
data):
> > > > +        for e in spdx_file.extension:
> > > > +            if isinstance(e, OELicenseScannedExtension):
> > > > +                return
> > > > +
> > > > +        file_licenses =3D set()
> > > > +        for extracted_lic in oe.spdx_common.extract_licenses(filep=
ath):
> > > > +            lic =3D self.new_license_expression(extracted_lic, lic=
ense_data)
> > > > +            self.set_element_alias(lic)
> > > > +            file_licenses.add(lic)
> > > > +
> > > > +        self.new_relationship(
> > > > +            [spdx_file],
> > > > +            oe.spdx30.RelationshipType.hasDeclaredLicense,
> > > > +            [oe.sbom30.get_element_link_id(lic_alias) for lic_alia=
s in file_licenses],
> > > > +        )
> > > > +        spdx_file.extension.append(OELicenseScannedExtension())
> > > > +
> > > > +    def new_file(self, _id, name, path, *, purposes=3D[]):
> > > > +        sha256_hash =3D bb.utils.sha256_file(path)
> > > > +
> > > > +        for f in self.by_sha256_hash.get(sha256_hash, []):
> > > > +            if not isinstance(f, oe.spdx30.software_File):
> > > > +                continue
> > > > +
> > > > +            if purposes:
> > > > +                new_primary =3D purposes[0]
> > > > +                new_additional =3D []
> > > > +
> > > > +                if f.software_primaryPurpose:
> > > > +                    new_additional.append(f.software_primaryPurpos=
e)
> > > > +                new_additional.extend(f.software_additionalPurpose)
> > > > +
> > > > +                new_additional =3D sorted(
> > > > +                    list(set(p for p in new_additional if p !=3D n=
ew_primary))
> > > > +                )
> > > > +
> > > > +                f.software_primaryPurpose =3D new_primary
> > > > +                f.software_additionalPurpose =3D new_additional
> > > > +
> > > > +            if f.name !=3D name:
> > > > +                for e in f.extension:
> > > > +                    if isinstance(e, OEFileNameAliasExtension):
> > > > +                        e.aliases.append(name)
> > > > +                        break
> > > > +                else:
> > > > +                    f.extension.append(OEFileNameAliasExtension(al=
iases=3D[name]))
> > > > +
> > > > +            return f
> > > > +
> > > > +        spdx_file =3D oe.spdx30.software_File(
> > > > +            _id=3D_id,
> > > > +            creationInfo=3Dself.doc.creationInfo,
> > > > +            name=3Dname,
> > > > +        )
> > > > +        if purposes:
> > > > +            spdx_file.software_primaryPurpose =3D purposes[0]
> > > > +            spdx_file.software_additionalPurpose =3D purposes[1:]
> > > > +
> > > > +        spdx_file.verifiedUsing.append(
> > > > +            oe.spdx30.Hash(
> > > > +                algorithm=3Doe.spdx30.HashAlgorithm.sha256,
> > > > +                hashValue=3Dsha256_hash,
> > > > +            )
> > > > +        )
> > > > +
> > > > +        return self.add(spdx_file)
> > > > +
> > > > +    def new_cve_vuln(self, cve):
> > > > +        v =3D oe.spdx30.security_Vulnerability()
> > > > +        v._id =3D self.new_spdxid("vulnerability", cve)
> > > > +        v.creationInfo =3D self.doc.creationInfo
> > > > +
> > > > +        v.externalIdentifier.append(
> > > > +            oe.spdx30.ExternalIdentifier(
> > > > +                externalIdentifierType=3Doe.spdx30.ExternalIdentif=
ierType.cve,
> > > > +                identifier=3Dcve,
> > > > +                identifierLocator=3D[
> > > > +                    f"https://cveawg.mitre.org/api/cve/{cve}",
> > > > +                    f"https://www.cve.org/CVERecord?id=3D{cve}",
> > > > +                ],
> > > > +            )
> > > > +        )
> > > > +        return self.add(v)
> > > > +
> > > > +    def new_vex_patched_relationship(self, from_, to):
> > > > +        return self._new_relationship(
> > > > +            oe.spdx30.security_VexFixedVulnAssessmentRelationship,
> > > > +            from_,
> > > > +            oe.spdx30.RelationshipType.fixedIn,
> > > > +            to,
> > > > +            spdxid_name=3D"vex-fixed",
> > > > +            security_vexVersion=3DVEX_VERSION,
> > > > +        )
> > > > +
> > > > +    def new_vex_unpatched_relationship(self, from_, to):
> > > > +        return self._new_relationship(
> > > > +            oe.spdx30.security_VexAffectedVulnAssessmentRelationsh=
ip,
> > > > +            from_,
> > > > +            oe.spdx30.RelationshipType.affects,
> > > > +            to,
> > > > +            spdxid_name=3D"vex-affected",
> > > > +            security_vexVersion=3DVEX_VERSION,
> > > > +            security_actionStatement=3D"Mitigation action unknown",
> > > > +        )
> > > > +
> > > > +    def new_vex_ignored_relationship(self, from_, to, *, impact_st=
atement):
> > > > +        return self._new_relationship(
> > > > +            oe.spdx30.security_VexNotAffectedVulnAssessmentRelatio=
nship,
> > > > +            from_,
> > > > +            oe.spdx30.RelationshipType.doesNotAffect,
> > > > +            to,
> > > > +            spdxid_name=3D"vex-not-affected",
> > > > +            security_vexVersion=3DVEX_VERSION,
> > > > +            security_impactStatement=3Dimpact_statement,
> > > > +        )
> > > > +
> > > > +    def import_bitbake_build_objset(self):
> > > > +        deploy_dir_spdx =3D Path(self.d.getVar("DEPLOY_DIR_SPDX"))
> > > > +        bb_objset =3D load_jsonld(
> > > > +            self.d, deploy_dir_spdx / "bitbake.spdx.json", require=
d=3DTrue
> > > > +        )
> > > > +        self.doc.import_.extend(bb_objset.doc.import_)
> > > > +        self.update(bb_objset.objects)
> > > > +
> > > > +        return bb_objset
> > > > +
> > > > +    def import_bitbake_build(self):
> > > > +        def find_bitbake_build(objset):
> > > > +            return objset.find_filter(
> > > > +                oe.spdx30.build_Build,
> > > > +                build_buildType=3DSPDX_BUILD_TYPE,
> > > > +            )
> > > > +
> > > > +        build =3D find_bitbake_build(self)
> > > > +        if build:
> > > > +            return build
> > > > +
> > > > +        bb_objset =3D self.import_bitbake_build_objset()
> > > > +        build =3D find_bitbake_build(bb_objset)
> > > > +        if build is None:
> > > > +            bb.fatal(f"No build found in {deploy_dir_spdx}")
> > > > +
> > > > +        return build
> > > > +
> > > > +    def new_task_build(self, name, typ):
> > > > +        current_task =3D self.d.getVar("BB_CURRENTTASK")
> > > > +        pn =3D self.d.getVar("PN")
> > > > +
> > > > +        build =3D self.add(
> > > > +            oe.spdx30.build_Build(
> > > > +                _id=3Dself.new_spdxid("build", name),
> > > > +                creationInfo=3Dself.doc.creationInfo,
> > > > +                name=3Df"{pn}:do_{current_task}:{name}",
> > > > +                build_buildType=3Df"{SPDX_BUILD_TYPE}/do_{current_=
task}/{typ}",
> > > > +            )
> > > > +        )
> > > > +
> > > > +        if self.d.getVar("SPDX_INCLUDE_BITBAKE_PARENT_BUILD") =3D=
=3D "1":
> > > > +            bitbake_build =3D self.import_bitbake_build()
> > > > +
> > > > +            self.new_relationship(
> > > > +                [bitbake_build],
> > > > +                oe.spdx30.RelationshipType.ancestorOf,
> > > > +                [build],
> > > > +            )
> > > > +
> > > > +        if self.d.getVar("SPDX_INCLUDE_BUILD_VARIABLES") =3D=3D "1=
":
> > > > +            for varname in sorted(self.d.keys()):
> > > > +                if varname.startswith("__"):
> > > > +                    continue
> > > > +
> > > > +                value =3D self.d.getVar(varname, expand=3DFalse)
> > > > +
> > > > +                # TODO: Deal with non-string values
> > > > +                if not isinstance(value, str):
> > > > +                    continue
> > > > +
> > > > +                build.build_parameter.append(
> > > > +                    oe.spdx30.DictionaryEntry(key=3Dvarname, value=
=3Dvalue)
> > > > +                )
> > > > +
> > > > +        return build
> > > > +
> > > > +    def new_archive(self, archive_name):
> > > > +        return self.add(
> > > > +            oe.spdx30.software_File(
> > > > +                _id=3Dself.new_spdxid("archive", str(archive_name)=
),
> > > > +                creationInfo=3Dself.doc.creationInfo,
> > > > +                name=3Dstr(archive_name),
> > > > +                software_primaryPurpose=3Doe.spdx30.software_Softw=
arePurpose.archive,
> > > > +            )
> > > > +        )
> > > > +
> > > > +    @classmethod
> > > > +    def new_objset(cls, d, name, copy_from_bitbake_doc=3DTrue):
> > > > +        objset =3D cls(d)
> > > > +
> > > > +        document =3D oe.spdx30.SpdxDocument(
> > > > +            _id=3Dobjset.new_spdxid("document", name),
> > > > +            name=3Dname,
> > > > +        )
> > > > +
> > > > +        document.extension.append(
> > > > +            OEIdAliasExtension(
> > > > +                alias=3Dobjset.new_alias_id(
> > > > +                    document,
> > > > +                    OE_DOC_ALIAS_PREFIX + d.getVar("PN") + "/" + n=
ame + "/",
> > > > +                ),
> > > > +            )
> > > > +        )
> > > > +        objset.doc =3D document
> > > > +        objset.add_index(document)
> > > > +
> > > > +        if copy_from_bitbake_doc:
> > > > +            bb_objset =3D objset.import_bitbake_build_objset()
> > > > +            document.creationInfo =3D objset.copy_creation_info(
> > > > +                bb_objset.doc.creationInfo
> > > > +            )
> > > > +        else:
> > > > +            document.creationInfo =3D objset.new_creation_info()
> > > > +
> > > > +        return objset
> > > > +
> > > > +    def expand_collection(self, *, add_objectsets=3D[]):
> > > > +        """
> > > > +        Expands a collection to pull in all missing elements
> > > > +
> > > > +        Returns the set of ids that could not be found to link int=
o the document
> > > > +        """
> > > > +        missing_spdxids =3D set()
> > > > +        imports =3D {e.externalSpdxId: e for e in self.doc.import_}
> > > > +
> > > > +        def merge_doc(other):
> > > > +            nonlocal imports
> > > > +
> > > > +            for e in other.doc.import_:
> > > > +                if not e.externalSpdxId in imports:
> > > > +                    imports[e.externalSpdxId] =3D e
> > > > +
> > > > +            self.objects |=3D other.objects
> > > > +
> > > > +        for o in add_objectsets:
> > > > +            merge_doc(o)
> > > > +
> > > > +        needed_spdxids =3D self.link()
> > > > +        provided_spdxids =3D set(self.obj_by_id.keys())
> > > > +
> > > > +        while True:
> > > > +            import_spdxids =3D set(imports.keys())
> > > > +            searching_spdxids =3D (
> > > > +                needed_spdxids - provided_spdxids - missing_spdxid=
s - import_spdxids
> > > > +            )
> > > > +            if not searching_spdxids:
> > > > +                break
> > > > +
> > > > +            spdxid =3D searching_spdxids.pop()
> > > > +            bb.debug(
> > > > +                1,
> > > > +                f"Searching for {spdxid}. Remaining: {len(searchin=
g_spdxids)}, Total: {len(provided_spdxids)}, Missing: {len(missing_spdxids)=
}, Imports: {len(import_spdxids)}",
> > > > +            )
> > > > +            dep_objset, dep_path =3D find_by_spdxid(self.d, spdxid)
> > > > +
> > > > +            if dep_objset:
> > > > +                dep_provided =3D set(dep_objset.obj_by_id.keys())
> > > > +                if spdxid not in dep_provided:
> > > > +                    bb.fatal(f"{spdxid} not found in {dep_path}")
> > > > +                provided_spdxids |=3D dep_provided
> > > > +                needed_spdxids |=3D dep_objset.missing_ids
> > > > +                merge_doc(dep_objset)
> > > > +            else:
> > > > +                missing_spdxids.add(spdxid)
> > > > +
> > > > +        self.doc.import_ =3D sorted(imports.values(), key=3Dlambda=
 e: e.externalSpdxId)
> > > > +        bb.debug(1, "Linking...")
> > > > +        self.link()
> > > > +
> > > > +        # Manually go through all of the simplelicensing_customIdT=
oUri DictionaryEntry
> > > > +        # items and resolve any aliases to actual objects.
> > > > +        for lic in self.foreach_type(oe.spdx30.simplelicensing_Lic=
enseExpression):
> > > > +            for d in lic.simplelicensing_customIdToUri:
> > > > +                if d.value.startswith(OE_ALIAS_PREFIX):
> > > > +                    obj =3D self.find_by_id(d.value)
> > > > +                    if obj is not None:
> > > > +                        d.value =3D obj._id
> > > > +                    else:
> > > > +                        self.missing_ids.add(d.value)
> > > > +
> > > > +        self.missing_ids -=3D set(imports.keys())
> > > > +        return self.missing_ids
> > > > +
> > > > +
> > > > +def load_jsonld(d, path, required=3DFalse):
> > > > +    deserializer =3D oe.spdx30.JSONLDDeserializer()
> > > > +    objset =3D ObjectSet(d)
> > > > +    try:
> > > > +        with path.open("rb") as f:
> > > > +            deserializer.read(f, objset)
> > > > +    except FileNotFoundError:
> > > > +        if required:
> > > > +            bb.fatal("No SPDX document named %s found" % path)
> > > > +        return None
> > > > +
> > > > +    if not objset.doc:
> > > > +        bb.fatal("SPDX Document %s has no SPDXDocument element" % =
path)
> > > > +        return None
> > > > +
> > > > +    objset.objects.remove(objset.doc)
> > > > +    return objset
> > > > +
> > > > +
> > > > +def jsonld_arch_path(d, arch, subdir, name, deploydir=3DNone):
> > > > +    if deploydir is None:
> > > > +        deploydir =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
> > > > +    return deploydir / arch / subdir / (name + ".spdx.json")
> > > > +
> > > > +
> > > > +def jsonld_hash_path(h):
> > > > +    return Path("by-spdxid-hash") / h[:2], h
> > > > +
> > > > +
> > > > +def load_jsonld_by_arch(d, arch, subdir, name, *, required=3DFalse=
):
> > > > +    path =3D jsonld_arch_path(d, arch, subdir, name)
> > > > +    objset =3D load_jsonld(d, path, required=3Drequired)
> > > > +    if objset is not None:
> > > > +        return (objset, path)
> > > > +    return (None, None)
> > > > +
> > > > +
> > > > +def find_jsonld(d, subdir, name, *, required=3DFalse):
> > > > +    package_archs =3D d.getVar("SPDX_MULTILIB_SSTATE_ARCHS").split=
()
> > > > +    package_archs.reverse()
> > > > +
> > > > +    for arch in package_archs:
> > > > +        objset, path =3D load_jsonld_by_arch(d, arch, subdir, name)
> > > > +        if objset is not None:
> > > > +            return (objset, path)
> > > > +
> > > > +    if required:
> > > > +        bb.fatal("Could not find a %s SPDX document named %s" % (s=
ubdir, name))
> > > > +
> > > > +    return (None, None)
> > > > +
> > > > +
> > > > +def write_jsonld_doc(d, objset, dest):
> > > > +    if not isinstance(objset, ObjectSet):
> > > > +        bb.fatal("Only an ObjsetSet can be serialized")
> > > > +        return
> > > > +
> > > > +    if not objset.doc:
> > > > +        bb.fatal("ObjectSet is missing a SpdxDocument")
> > > > +        return
> > > > +
> > > > +    objset.doc.rootElement =3D sorted(list(set(objset.doc.rootElem=
ent)))
> > > > +    objset.doc.profileConformance =3D sorted(
> > > > +        list(
> > > > +            getattr(oe.spdx30.ProfileIdentifierType, p)
> > > > +            for p in d.getVar("SPDX_PROFILES").split()
> > > > +        )
> > > > +    )
> > > > +
> > > > +    dest.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)
> > > > +
> > > > +    if d.getVar("SPDX_PRETTY") =3D=3D "1":
> > > > +        serializer =3D oe.spdx30.JSONLDSerializer(
> > > > +            indent=3D2,
> > > > +        )
> > > > +    else:
> > > > +        serializer =3D oe.spdx30.JSONLDInlineSerializer()
> > > > +
> > > > +    objset.objects.add(objset.doc)
> > > > +    with dest.open("wb") as f:
> > > > +        serializer.write(objset, f, force_at_graph=3DTrue)
> > > > +    objset.objects.remove(objset.doc)
> > > > +
> > > > +
> > > > +def write_recipe_jsonld_doc(
> > > > +    d,
> > > > +    objset,
> > > > +    subdir,
> > > > +    deploydir,
> > > > +    *,
> > > > +    create_spdx_id_links=3DTrue,
> > > > +):
> > > > +    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
> > > > +
> > > > +    dest =3D jsonld_arch_path(d, pkg_arch, subdir, objset.doc.name=
, deploydir=3Ddeploydir)
> > > > +
> > > > +    def link_id(_id):
> > > > +        hash_path =3D jsonld_hash_path(hash_id(_id))
> > > > +
> > > > +        link_name =3D jsonld_arch_path(
> > > > +            d,
> > > > +            pkg_arch,
> > > > +            *hash_path,
> > > > +            deploydir=3Ddeploydir,
> > > > +        )
> > > > +        try:
> > > > +            link_name.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)
> > > > +            link_name.symlink_to(os.path.relpath(dest, link_name.p=
arent))
> > > > +        except:
> > > > +            target =3D link_name.readlink()
> > > > +            bb.warn(
> > > > +                f"Unable to link {_id} in {dest} as {link_name}. A=
lready points to {target}"
> > > > +            )
> > > > +            raise
> > > > +
> > > > +        return hash_path[-1]
> > > > +
> > > > +    objset.add_aliases()
> > > > +
> > > > +    try:
> > > > +        if create_spdx_id_links:
> > > > +            alias_ext =3D get_alias(objset.doc)
> > > > +            if alias_ext is not None and alias_ext.alias:
> > > > +                alias_ext.link_name =3D link_id(alias_ext.alias)
> > > > +
> > > > +    finally:
> > > > +        # It is really helpful for debugging if the JSON document =
is written
> > > > +        # out, so always do that even if there is an error making =
the links
> > > > +        write_jsonld_doc(d, objset, dest)
> > > > +
> > > > +
> > > > +def find_root_obj_in_jsonld(d, subdir, fn_name, obj_type, **attr_f=
ilter):
> > > > +    objset, fn =3D find_jsonld(d, subdir, fn_name, required=3DTrue)
> > > > +
> > > > +    spdx_obj =3D objset.find_root(obj_type, **attr_filter)
> > > > +    if not spdx_obj:
> > > > +        bb.fatal("No root %s found in %s" % (obj_type.__name__, fn=
))
> > > > +
> > > > +    return spdx_obj, objset
> > > > +
> > > > +
> > > > +def load_obj_in_jsonld(d, arch, subdir, fn_name, obj_type, **attr_=
filter):
> > > > +    objset, fn =3D load_jsonld_by_arch(d, arch, subdir, fn_name, r=
equired=3DTrue)
> > > > +
> > > > +    spdx_obj =3D objset.find_filter(obj_type, **attr_filter)
> > > > +    if not spdx_obj:
> > > > +        bb.fatal("No %s found in %s" % (obj_type.__name__, fn))
> > > > +
> > > > +    return spdx_obj, objset
> > > > +
> > > > +
> > > > +def find_by_spdxid(d, spdxid, *, required=3DFalse):
> > > > +    if spdxid.startswith(OE_ALIAS_PREFIX):
> > > > +        h =3D spdxid[len(OE_ALIAS_PREFIX) :].split("/", 1)[0]
> > > > +        return find_jsonld(d, *jsonld_hash_path(h), required=3Dreq=
uired)
> > > > +    return find_jsonld(d, *jsonld_hash_path(hash_id(spdxid)), requ=
ired=3Drequired)
> > > > +
> > > > +
> > > > +def create_sbom(d, name, root_elements, add_objectsets=3D[]):
> > > > +    objset =3D ObjectSet.new_objset(d, name)
> > > > +
> > > > +    sbom =3D objset.add(
> > > > +        oe.spdx30.software_Sbom(
> > > > +            _id=3Dobjset.new_spdxid("sbom", name),
> > > > +            name=3Dname,
> > > > +            creationInfo=3Dobjset.doc.creationInfo,
> > > > +            software_sbomType=3D[oe.spdx30.software_SbomType.build=
],
> > > > +            rootElement=3Droot_elements,
> > > > +        )
> > > > +    )
> > > > +
> > > > +    missing_spdxids =3D objset.expand_collection(add_objectsets=3D=
add_objectsets)
> > > > +    if missing_spdxids:
> > > > +        bb.warn(
> > > > +            "The following SPDX IDs were unable to be resolved:\n =
 "
> > > > +            + "\n  ".join(sorted(list(missing_spdxids)))
> > > > +        )
> > > > +
> > > > +    # Filter out internal extensions from final SBoMs
> > > > +    objset.remove_internal_extensions()
> > > > +
> > > > +    # SBoM should be the only root element of the document
> > > > +    objset.doc.rootElement =3D [sbom]
> > > > +
> > > > +    # De-duplicate licenses
> > > > +    unique =3D set()
> > > > +    dedup =3D {}
> > > > +    for lic in objset.foreach_type(oe.spdx30.simplelicensing_Licen=
seExpression):
> > > > +        for u in unique:
> > > > +            if (
> > > > +                u.simplelicensing_licenseExpression
> > > > +                =3D=3D lic.simplelicensing_licenseExpression
> > > > +                and u.simplelicensing_licenseListVersion
> > > > +                =3D=3D lic.simplelicensing_licenseListVersion
> > > > +            ):
> > > > +                dedup[lic] =3D u
> > > > +                break
> > > > +        else:
> > > > +            unique.add(lic)
> > > > +
> > > > +    if dedup:
> > > > +        for rel in objset.foreach_filter(
> > > > +            oe.spdx30.Relationship,
> > > > +            relationshipType=3Doe.spdx30.RelationshipType.hasDecla=
redLicense,
> > > > +        ):
> > > > +            rel.to =3D [dedup.get(to, to) for to in rel.to]
> > > > +
> > > > +        for rel in objset.foreach_filter(
> > > > +            oe.spdx30.Relationship,
> > > > +            relationshipType=3Doe.spdx30.RelationshipType.hasConcl=
udedLicense,
> > > > +        ):
> > > > +            rel.to =3D [dedup.get(to, to) for to in rel.to]
> > > > +
> > > > +        for k, v in dedup.items():
> > > > +            bb.debug(1, f"Removing duplicate License {k._id} -> {v=
=2E_id}")
> > > > +            objset.objects.remove(k)
> > > > +
> > > > +        objset.create_index()
> > > > +
> > > > +    return objset, sbom
> > > > diff --git a/meta/lib/oe/spdx30.py b/meta/lib/oe/spdx30.py
> > > > new file mode 100644
> > > > index 0000000000..cd97eebd18
> > > > --- /dev/null
> > > > +++ b/meta/lib/oe/spdx30.py
> > > > @@ -0,0 +1,5593 @@
> > > > +#! /usr/bin/env python3
> > > > +#
> > > > +# Generated Python bindings from a SHACL model
> > > > +#
> > > > +# This file was automatically generated by shacl2code. DO NOT MANU=
ALLY MODIFY IT
> > > > +#
> > > > +# SPDX-License-Identifier: MIT
> > > > +
> > > > +import functools
> > > > +import hashlib
> > > > +import json
> > > > +import re
> > > > +import sys
> > > > +import threading
> > > > +import time
> > > > +from contextlib import contextmanager
> > > > +from datetime import datetime, timezone, timedelta
> > > > +from enum import Enum
> > > > +from abc import ABC, abstractmethod
> > > > +
> > > > +
> > > > +def check_type(obj, types):
> > > > +    if not isinstance(obj, types):
> > > > +        if isinstance(types, (list, tuple)):
> > > > +            raise TypeError(
> > > > +                f"Value must be one of type: {', '.join(t.__name__=
 for t in types)}. Got {type(obj)}"
> > > > +            )
> > > > +        raise TypeError(f"Value must be of type {types.__name__}. =
Got {type(obj)}")
> > > > +
> > > > +
> > > > +class Property(ABC):
> > > > +    """
> > > > +    A generic SHACL object property. The different types will deri=
ve from this
> > > > +    class
> > > > +    """
> > > > +
> > > > +    def __init__(self, *, pattern=3DNone):
> > > > +        self.pattern =3D pattern
> > > > +
> > > > +    def init(self):
> > > > +        return None
> > > > +
> > > > +    def validate(self, value):
> > > > +        check_type(value, self.VALID_TYPES)
> > > > +        if self.pattern is not None and not re.search(
> > > > +            self.pattern, self.to_string(value)
> > > > +        ):
> > > > +            raise ValueError(
> > > > +                f"Value is not correctly formatted. Got '{self.to_=
string(value)}'"
> > > > +            )
> > > > +
> > > > +    def set(self, value):
> > > > +        return value
> > > > +
> > > > +    def check_min_count(self, value, min_count):
> > > > +        return min_count =3D=3D 1
> > > > +
> > > > +    def check_max_count(self, value, max_count):
> > > > +        return max_count =3D=3D 1
> > > > +
> > > > +    def elide(self, value):
> > > > +        return value is None
> > > > +
> > > > +    def walk(self, value, callback, path):
> > > > +        callback(value, path)
> > > > +
> > > > +    def iter_objects(self, value, recursive, visited):
> > > > +        return []
> > > > +
> > > > +    def link_prop(self, value, objectset, missing, visited):
> > > > +        return value
> > > > +
> > > > +    def to_string(self, value):
> > > > +        return str(value)
> > > > +
> > > > +    @abstractmethod
> > > > +    def encode(self, encoder, value, state):
> > > > +        pass
> > > > +
> > > > +    @abstractmethod
> > > > +    def decode(self, decoder, *, objectset=3DNone):
> > > > +        pass
> > > > +
> > > > +
> > > > +class StringProp(Property):
> > > > +    """
> > > > +    A scalar string property for an SHACL object
> > > > +    """
> > > > +
> > > > +    VALID_TYPES =3D str
> > > > +
> > > > +    def set(self, value):
> > > > +        return str(value)
> > > > +
> > > > +    def encode(self, encoder, value, state):
> > > > +        encoder.write_string(value)
> > > > +
> > > > +    def decode(self, decoder, *, objectset=3DNone):
> > > > +        return decoder.read_string()
> > > > +
> > > > +
> > > > +class AnyURIProp(StringProp):
> > > > +    def encode(self, encoder, value, state):
> > > > +        encoder.write_iri(value)
> > > > +
> > > > +    def decode(self, decoder, *, objectset=3DNone):
> > > > +        return decoder.read_iri()
> > > > +
> > > > +
> > > > +class DateTimeProp(Property):
> > > > +    """
> > > > +    A Date/Time Object with optional timezone
> > > > +    """
> > > > +
> > > > +    VALID_TYPES =3D datetime
> > > > +    UTC_FORMAT_STR =3D "%Y-%m-%dT%H:%M:%SZ"
> > > > +    REGEX =3D r"^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(Z|[+-]\d{2}:\=
d{2})?$"
> > > > +
> > > > +    def set(self, value):
> > > > +        return self._normalize(value)
> > > > +
> > > > +    def encode(self, encoder, value, state):
> > > > +        encoder.write_datetime(self.to_string(value))
> > > > +
> > > > +    def decode(self, decoder, *, objectset=3DNone):
> > > > +        s =3D decoder.read_datetime()
> > > > +        if s is None:
> > > > +            return None
> > > > +        v =3D self.from_string(s)
> > > > +        return self._normalize(v)
> > > > +
> > > > +    def _normalize(self, value):
> > > > +        if value.utcoffset() is None:
> > > > +            value =3D value.astimezone()
> > > > +        offset =3D value.utcoffset()
> > > > +        seconds =3D offset % timedelta(minutes=3D-1 if offset.tota=
l_seconds() < 0 else 1)
> > > > +        if seconds:
> > > > +            offset =3D offset - seconds
> > > > +            value =3D value.replace(tzinfo=3Dtimezone(offset))
> > > > +        value =3D value.replace(microsecond=3D0)
> > > > +        return value
> > > > +
> > > > +    def to_string(self, value):
> > > > +        value =3D self._normalize(value)
> > > > +        if value.tzinfo =3D=3D timezone.utc:
> > > > +            return value.strftime(self.UTC_FORMAT_STR)
> > > > +        return value.isoformat()
> > > > +
> > > > +    def from_string(self, value):
> > > > +        if not re.match(self.REGEX, value):
> > > > +            raise ValueError(f"'{value}' is not a correctly format=
ted datetime")
> > > > +        if "Z" in value:
> > > > +            d =3D datetime(
> > > > +                *(time.strptime(value, self.UTC_FORMAT_STR)[0:6]),
> > > > +                tzinfo=3Dtimezone.utc,
> > > > +            )
> > > > +        else:
> > > > +            d =3D datetime.fromisoformat(value)
> > > > +
> > > > +        return self._normalize(d)
> > > > +
> > > > +
> > > > +class DateTimeStampProp(DateTimeProp):
> > > > +    """
> > > > +    A Date/Time Object with required timestamp
> > > > +    """
> > > > +
> > > > +    REGEX =3D r"^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(Z|[+-]\d{2}:\=
d{2})$"
> > > > +
> > > > +
> > > > +class IntegerProp(Property):
> > > > +    VALID_TYPES =3D int
> > > > +
> > > > +    def set(self, value):
> > > > +        return int(value)
> > > > +
> > > > +    def encode(self, encoder, value, state):
> > > > +        encoder.write_integer(value)
> > > > +
> > > > +    def decode(self, decoder, *, objectset=3DNone):
> > > > +        return decoder.read_integer()
> > > > +
> > > > +
> > > > +class PositiveIntegerProp(IntegerProp):
> > > > +    def validate(self, value):
> > > > +        super().validate(value)
> > > > +        if value < 1:
> > > > +            raise ValueError(f"Value must be >=3D1. Got {value}")
> > > > +
> > > > +
> > > > +class NonNegativeIntegerProp(IntegerProp):
> > > > +    def validate(self, value):
> > > > +        super().validate(value)
> > > > +        if value < 0:
> > > > +            raise ValueError(f"Value must be >=3D 0. Got {value}")
> > > > +
> > > > +
> > > > +class BooleanProp(Property):
> > > > +    VALID_TYPES =3D bool
> > > > +
> > > > +    def set(self, value):
> > > > +        return bool(value)
> > > > +
> > > > +    def encode(self, encoder, value, state):
> > > > +        encoder.write_bool(value)
> > > > +
> > > > +    def decode(self, decoder, *, objectset=3DNone):
> > > > +        return decoder.read_bool()
> > > > +
> > > > +
> > > > +class FloatProp(Property):
> > > > +    VALID_TYPES =3D (float, int)
> > > > +
> > > > +    def set(self, value):
> > > > +        return float(value)
> > > > +
> > > > +    def encode(self, encoder, value, state):
> > > > +        encoder.write_float(value)
> > > > +
> > > > +    def decode(self, decoder, *, objectset=3DNone):
> > > > +        return decoder.read_float()
> > > > +
> > > > +
> > > > +class IRIProp(Property):
> > > > +    def __init__(self, context=3D[], *, pattern=3DNone):
> > > > +        super().__init__(pattern=3Dpattern)
> > > > +        self.context =3D context
> > > > +
> > > > +    def compact(self, value):
> > > > +        for iri, compact in self.context:
> > > > +            if value =3D=3D iri:
> > > > +                return compact
> > > > +        return None
> > > > +
> > > > +    def expand(self, value):
> > > > +        for iri, compact in self.context:
> > > > +            if value =3D=3D compact:
> > > > +                return iri
> > > > +        return None
> > > > +
> > > > +    def iri_values(self):
> > > > +        return (iri for iri, _ in self.context)
> > > > +
> > > > +
> > > > +class ObjectProp(IRIProp):
> > > > +    """
> > > > +    A scalar SHACL object property of a SHACL object
> > > > +    """
> > > > +
> > > > +    def __init__(self, cls, required, context=3D[]):
> > > > +        super().__init__(context)
> > > > +        self.cls =3D cls
> > > > +        self.required =3D required
> > > > +
> > > > +    def init(self):
> > > > +        if self.required and not self.cls.IS_ABSTRACT:
> > > > +            return self.cls()
> > > > +        return None
> > > > +
> > > > +    def validate(self, value):
> > > > +        check_type(value, (self.cls, str))
> > > > +
> > > > +    def walk(self, value, callback, path):
> > > > +        if value is None:
> > > > +            return
> > > > +
> > > > +        if not isinstance(value, str):
> > > > +            value.walk(callback, path)
> > > > +        else:
> > > > +            callback(value, path)
> > > > +
> > > > +    def iter_objects(self, value, recursive, visited):
> > > > +        if value is None or isinstance(value, str):
> > > > +            return
> > > > +
> > > > +        if value not in visited:
> > > > +            visited.add(value)
> > > > +            yield value
> > > > +
> > > > +            if recursive:
> > > > +                for c in value.iter_objects(recursive=3DTrue, visi=
ted=3Dvisited):
> > > > +                    yield c
> > > > +
> > > > +    def encode(self, encoder, value, state):
> > > > +        if value is None:
> > > > +            raise ValueError("Object cannot be None")
> > > > +
> > > > +        if isinstance(value, str):
> > > > +            encoder.write_iri(value, self.compact(value))
> > > > +            return
> > > > +
> > > > +        return value.encode(encoder, state)
> > > > +
> > > > +    def decode(self, decoder, *, objectset=3DNone):
> > > > +        iri =3D decoder.read_iri()
> > > > +        if iri is None:
> > > > +            return self.cls.decode(decoder, objectset=3Dobjectset)
> > > > +
> > > > +        iri =3D self.expand(iri) or iri
> > > > +
> > > > +        if objectset is None:
> > > > +            return iri
> > > > +
> > > > +        obj =3D objectset.find_by_id(iri)
> > > > +        if obj is None:
> > > > +            return iri
> > > > +
> > > > +        self.validate(obj)
> > > > +        return obj
> > > > +
> > > > +    def link_prop(self, value, objectset, missing, visited):
> > > > +        if value is None:
> > > > +            return value
> > > > +
> > > > +        if isinstance(value, str):
> > > > +            o =3D objectset.find_by_id(value)
> > > > +            if o is not None:
> > > > +                self.validate(o)
> > > > +                return o
> > > > +
> > > > +            if missing is not None:
> > > > +                missing.add(value)
> > > > +
> > > > +            return value
> > > > +
> > > > +        # De-duplicate IDs
> > > > +        if value._id:
> > > > +            value =3D objectset.find_by_id(value._id, value)
> > > > +            self.validate(value)
> > > > +
> > > > +        value.link_helper(objectset, missing, visited)
> > > > +        return value
> > > > +
> > > > +
> > > > +class ListProxy(object):
> > > > +    def __init__(self, prop, data=3DNone):
> > > > +        if data is None:
> > > > +            self.__data =3D []
> > > > +        else:
> > > > +            self.__data =3D data
> > > > +        self.__prop =3D prop
> > > > +
> > > > +    def append(self, value):
> > > > +        self.__prop.validate(value)
> > > > +        self.__data.append(self.__prop.set(value))
> > > > +
> > > > +    def insert(self, idx, value):
> > > > +        self.__prop.validate(value)
> > > > +        self.__data.insert(idx, self.__prop.set(value))
> > > > +
> > > > +    def extend(self, items):
> > > > +        for i in items:
> > > > +            self.append(i)
> > > > +
> > > > +    def sort(self, *args, **kwargs):
> > > > +        self.__data.sort(*args, **kwargs)
> > > > +
> > > > +    def __getitem__(self, key):
> > > > +        return self.__data[key]
> > > > +
> > > > +    def __setitem__(self, key, value):
> > > > +        if isinstance(key, slice):
> > > > +            for v in value:
> > > > +                self.__prop.validate(v)
> > > > +            self.__data[key] =3D [self.__prop.set(v) for v in valu=
e]
> > > > +        else:
> > > > +            self.__prop.validate(value)
> > > > +            self.__data[key] =3D self.__prop.set(value)
> > > > +
> > > > +    def __delitem__(self, key):
> > > > +        del self.__data[key]
> > > > +
> > > > +    def __contains__(self, item):
> > > > +        return item in self.__data
> > > > +
> > > > +    def __iter__(self):
> > > > +        return iter(self.__data)
> > > > +
> > > > +    def __len__(self):
> > > > +        return len(self.__data)
> > > > +
> > > > +    def __str__(self):
> > > > +        return str(self.__data)
> > > > +
> > > > +    def __repr__(self):
> > > > +        return repr(self.__data)
> > > > +
> > > > +    def __eq__(self, other):
> > > > +        if isinstance(other, ListProxy):
> > > > +            return self.__data =3D=3D other.__data
> > > > +
> > > > +        return self.__data =3D=3D other
> > > > +
> > > > +
> > > > +class ListProp(Property):
> > > > +    """
> > > > +    A list of SHACL properties
> > > > +    """
> > > > +
> > > > +    VALID_TYPES =3D (list, ListProxy)
> > > > +
> > > > +    def __init__(self, prop):
> > > > +        super().__init__()
> > > > +        self.prop =3D prop
> > > > +
> > > > +    def init(self):
> > > > +        return ListProxy(self.prop)
> > > > +
> > > > +    def validate(self, value):
> > > > +        super().validate(value)
> > > > +
> > > > +        for i in value:
> > > > +            self.prop.validate(i)
> > > > +
> > > > +    def set(self, value):
> > > > +        if isinstance(value, ListProxy):
> > > > +            return value
> > > > +
> > > > +        return ListProxy(self.prop, [self.prop.set(d) for d in val=
ue])
> > > > +
> > > > +    def check_min_count(self, value, min_count):
> > > > +        check_type(value, ListProxy)
> > > > +        return len(value) >=3D min_count
> > > > +
> > > > +    def check_max_count(self, value, max_count):
> > > > +        check_type(value, ListProxy)
> > > > +        return len(value) <=3D max_count
> > > > +
> > > > +    def elide(self, value):
> > > > +        check_type(value, ListProxy)
> > > > +        return len(value) =3D=3D 0
> > > > +
> > > > +    def walk(self, value, callback, path):
> > > > +        callback(value, path)
> > > > +        for idx, v in enumerate(value):
> > > > +            self.prop.walk(v, callback, path + [f"[{idx}]"])
> > > > +
> > > > +    def iter_objects(self, value, recursive, visited):
> > > > +        for v in value:
> > > > +            for c in self.prop.iter_objects(v, recursive, visited):
> > > > +                yield c
> > > > +
> > > > +    def link_prop(self, value, objectset, missing, visited):
> > > > +        if isinstance(value, ListProxy):
> > > > +            data =3D [self.prop.link_prop(v, objectset, missing, v=
isited) for v in value]
> > > > +        else:
> > > > +            data =3D [self.prop.link_prop(v, objectset, missing, v=
isited) for v in value]
> > > > +
> > > > +        return ListProxy(self.prop, data=3Ddata)
> > > > +
> > > > +    def encode(self, encoder, value, state):
> > > > +        check_type(value, ListProxy)
> > > > +
> > > > +        with encoder.write_list() as list_s:
> > > > +            for v in value:
> > > > +                with list_s.write_list_item() as item_s:
> > > > +                    self.prop.encode(item_s, v, state)
> > > > +
> > > > +    def decode(self, decoder, *, objectset=3DNone):
> > > > +        data =3D []
> > > > +        for val_d in decoder.read_list():
> > > > +            v =3D self.prop.decode(val_d, objectset=3Dobjectset)
> > > > +            self.prop.validate(v)
> > > > +            data.append(v)
> > > > +
> > > > +        return ListProxy(self.prop, data=3Ddata)
> > > > +
> > > > +
> > > > +class EnumProp(IRIProp):
> > > > +    VALID_TYPES =3D str
> > > > +
> > > > +    def __init__(self, values, *, pattern=3DNone):
> > > > +        super().__init__(values, pattern=3Dpattern)
> > > > +
> > > > +    def validate(self, value):
> > > > +        super().validate(value)
> > > > +
> > > > +        valid_values =3D self.iri_values()
> > > > +        if value not in valid_values:
> > > > +            raise ValueError(
> > > > +                f"'{value}' is not a valid value. Choose one of {'=
 '.join(valid_values)}"
> > > > +            )
> > > > +
> > > > +    def encode(self, encoder, value, state):
> > > > +        encoder.write_enum(value, self, self.compact(value))
> > > > +
> > > > +    def decode(self, decoder, *, objectset=3DNone):
> > > > +        v =3D decoder.read_enum(self)
> > > > +        return self.expand(v) or v
> > > > +
> > > > +
> > > > +class NodeKind(Enum):
> > > > +    BlankNode =3D 1
> > > > +    IRI =3D 2
> > > > +    BlankNodeOrIRI =3D 3
> > > > +
> > > > +
> > > > +def is_IRI(s):
> > > > +    if not isinstance(s, str):
> > > > +        return False
> > > > +    if s.startswith("_:"):
> > > > +        return False
> > > > +    if ":" not in s:
> > > > +        return False
> > > > +    return True
> > > > +
> > > > +
> > > > +def is_blank_node(s):
> > > > +    if not isinstance(s, str):
> > > > +        return False
> > > > +    if not s.startswith("_:"):
> > > > +        return False
> > > > +    return True
> > > > +
> > > > +
> > > > +def register(type_iri, *, compact_type=3DNone, abstract=3DFalse):
> > > > +    def add_class(key, c):
> > > > +        assert (
> > > > +            key not in SHACLObject.CLASSES
> > > > +        ), f"{key} already registered to {SHACLObject.CLASSES[key]=
=2E__name__}"
> > > > +        SHACLObject.CLASSES[key] =3D c
> > > > +
> > > > +    def decorator(c):
> > > > +        global NAMED_INDIVIDUALS
> > > > +
> > > > +        assert issubclass(
> > > > +            c, SHACLObject
> > > > +        ), f"{c.__name__} is not derived from SHACLObject"
> > > > +
> > > > +        c._OBJ_TYPE =3D type_iri
> > > > +        c.IS_ABSTRACT =3D abstract
> > > > +        add_class(type_iri, c)
> > > > +
> > > > +        c._OBJ_COMPACT_TYPE =3D compact_type
> > > > +        if compact_type:
> > > > +            add_class(compact_type, c)
> > > > +
> > > > +        NAMED_INDIVIDUALS |=3D set(c.NAMED_INDIVIDUALS.values())
> > > > +
> > > > +        # Registration is deferred until the first instance of cla=
ss is created
> > > > +        # so that it has access to any other defined class
> > > > +        c._NEEDS_REG =3D True
> > > > +        return c
> > > > +
> > > > +    return decorator
> > > > +
> > > > +
> > > > +register_lock =3D threading.Lock()
> > > > +NAMED_INDIVIDUALS =3D set()
> > > > +
> > > > +
> > > > +@functools.total_ordering
> > > > +class SHACLObject(object):
> > > > +    CLASSES =3D {}
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    ID_ALIAS =3D None
> > > > +    IS_ABSTRACT =3D True
> > > > +
> > > > +    def __init__(self, **kwargs):
> > > > +        if self._is_abstract():
> > > > +            raise NotImplementedError(
> > > > +                f"{self.__class__.__name__} is abstract and cannot=
 be implemented"
> > > > +            )
> > > > +
> > > > +        with register_lock:
> > > > +            cls =3D self.__class__
> > > > +            if cls._NEEDS_REG:
> > > > +                cls._OBJ_PROPERTIES =3D {}
> > > > +                cls._OBJ_IRIS =3D {}
> > > > +                cls._register_props()
> > > > +                cls._NEEDS_REG =3D False
> > > > +
> > > > +        self.__dict__["_obj_data"] =3D {}
> > > > +        self.__dict__["_obj_metadata"] =3D {}
> > > > +
> > > > +        for iri, prop, _, _, _, _ in self.__iter_props():
> > > > +            self.__dict__["_obj_data"][iri] =3D prop.init()
> > > > +
> > > > +        for k, v in kwargs.items():
> > > > +            setattr(self, k, v)
> > > > +
> > > > +    def _is_abstract(self):
> > > > +        return self.__class__.IS_ABSTRACT
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        cls._add_property("_id", StringProp(), iri=3D"@id")
> > > > +
> > > > +    @classmethod
> > > > +    def _add_property(
> > > > +        cls,
> > > > +        pyname,
> > > > +        prop,
> > > > +        iri,
> > > > +        min_count=3DNone,
> > > > +        max_count=3DNone,
> > > > +        compact=3DNone,
> > > > +    ):
> > > > +        if pyname in cls._OBJ_IRIS:
> > > > +            raise KeyError(f"'{pyname}' is already defined for '{c=
ls.__name__}'")
> > > > +        if iri in cls._OBJ_PROPERTIES:
> > > > +            raise KeyError(f"'{iri}' is already defined for '{cls.=
__name__}'")
> > > > +
> > > > +        while hasattr(cls, pyname):
> > > > +            pyname =3D pyname + "_"
> > > > +
> > > > +        pyname =3D sys.intern(pyname)
> > > > +        iri =3D sys.intern(iri)
> > > > +
> > > > +        cls._OBJ_IRIS[pyname] =3D iri
> > > > +        cls._OBJ_PROPERTIES[iri] =3D (prop, min_count, max_count, =
pyname, compact)
> > > > +
> > > > +    def __setattr__(self, name, value):
> > > > +        if name =3D=3D self.ID_ALIAS:
> > > > +            self["@id"] =3D value
> > > > +            return
> > > > +
> > > > +        try:
> > > > +            iri =3D self._OBJ_IRIS[name]
> > > > +            self[iri] =3D value
> > > > +        except KeyError:
> > > > +            raise AttributeError(
> > > > +                f"'{name}' is not a valid property of {self.__clas=
s__.__name__}"
> > > > +            )
> > > > +
> > > > +    def __getattr__(self, name):
> > > > +        if name in self._OBJ_IRIS:
> > > > +            return self.__dict__["_obj_data"][self._OBJ_IRIS[name]]
> > > > +
> > > > +        if name =3D=3D self.ID_ALIAS:
> > > > +            return self.__dict__["_obj_data"]["@id"]
> > > > +
> > > > +        if name =3D=3D "_metadata":
> > > > +            return self.__dict__["_obj_metadata"]
> > > > +
> > > > +        if name =3D=3D "_IRI":
> > > > +            return self._OBJ_IRIS
> > > > +
> > > > +        if name =3D=3D "TYPE":
> > > > +            return self.__class__._OBJ_TYPE
> > > > +
> > > > +        if name =3D=3D "COMPACT_TYPE":
> > > > +            return self.__class__._OBJ_COMPACT_TYPE
> > > > +
> > > > +        raise AttributeError(
> > > > +            f"'{name}' is not a valid property of {self.__class__.=
__name__}"
> > > > +        )
> > > > +
> > > > +    def __delattr__(self, name):
> > > > +        if name =3D=3D self.ID_ALIAS:
> > > > +            del self["@id"]
> > > > +            return
> > > > +
> > > > +        try:
> > > > +            iri =3D self._OBJ_IRIS[name]
> > > > +            del self[iri]
> > > > +        except KeyError:
> > > > +            raise AttributeError(
> > > > +                f"'{name}' is not a valid property of {self.__clas=
s__.__name__}"
> > > > +            )
> > > > +
> > > > +    def __get_prop(self, iri):
> > > > +        if iri not in self._OBJ_PROPERTIES:
> > > > +            raise KeyError(
> > > > +                f"'{iri}' is not a valid property of {self.__class=
__.__name__}"
> > > > +            )
> > > > +
> > > > +        return self._OBJ_PROPERTIES[iri]
> > > > +
> > > > +    def __iter_props(self):
> > > > +        for iri, v in self._OBJ_PROPERTIES.items():
> > > > +            yield iri, *v
> > > > +
> > > > +    def __getitem__(self, iri):
> > > > +        return self.__dict__["_obj_data"][iri]
> > > > +
> > > > +    def __setitem__(self, iri, value):
> > > > +        if iri =3D=3D "@id":
> > > > +            if self.NODE_KIND =3D=3D NodeKind.BlankNode:
> > > > +                if not is_blank_node(value):
> > > > +                    raise ValueError(
> > > > +                        f"{self.__class__.__name__} ({id(self)}) c=
an only have local reference. Property '{iri}' cannot be set to '{value}' a=
nd must start with '_:'"
> > > > +                    )
> > > > +            elif self.NODE_KIND =3D=3D NodeKind.IRI:
> > > > +                if not is_IRI(value):
> > > > +                    raise ValueError(
> > > > +                        f"{self.__class__.__name__} ({id(self)}) c=
an only have an IRI value. Property '{iri}' cannot be set to '{value}'"
> > > > +                    )
> > > > +            else:
> > > > +                if not is_blank_node(value) and not is_IRI(value):
> > > > +                    raise ValueError(
> > > > +                        f"{self.__class__.__name__} ({id(self)}) H=
as invalid Property '{iri}' '{value}'. Must be a blank node or IRI"
> > > > +                    )
> > > > +
> > > > +        prop, _, _, _, _ =3D self.__get_prop(iri)
> > > > +        prop.validate(value)
> > > > +        self.__dict__["_obj_data"][iri] =3D prop.set(value)
> > > > +
> > > > +    def __delitem__(self, iri):
> > > > +        prop, _, _, _, _ =3D self.__get_prop(iri)
> > > > +        self.__dict__["_obj_data"][iri] =3D prop.init()
> > > > +
> > > > +    def __iter__(self):
> > > > +        return self._OBJ_PROPERTIES.keys()
> > > > +
> > > > +    def walk(self, callback, path=3DNone):
> > > > +        """
> > > > +        Walk object tree, invoking the callback for each item
> > > > +
> > > > +        Callback has the form:
> > > > +
> > > > +        def callback(object, path):
> > > > +        """
> > > > +        if path is None:
> > > > +            path =3D ["."]
> > > > +
> > > > +        if callback(self, path):
> > > > +            for iri, prop, _, _, _, _ in self.__iter_props():
> > > > +                prop.walk(self.__dict__["_obj_data"][iri], callbac=
k, path + [f".{iri}"])
> > > > +
> > > > +    def property_keys(self):
> > > > +        for iri, _, _, _, pyname, compact in self.__iter_props():
> > > > +            if iri =3D=3D "@id":
> > > > +                compact =3D self.ID_ALIAS
> > > > +            yield pyname, iri, compact
> > > > +
> > > > +    def iter_objects(self, *, recursive=3DFalse, visited=3DNone):
> > > > +        """
> > > > +        Iterate of all objects that are a child of this one
> > > > +        """
> > > > +        if visited is None:
> > > > +            visited =3D set()
> > > > +
> > > > +        for iri, prop, _, _, _, _ in self.__iter_props():
> > > > +            for c in prop.iter_objects(
> > > > +                self.__dict__["_obj_data"][iri], recursive=3Drecur=
sive, visited=3Dvisited
> > > > +            ):
> > > > +                yield c
> > > > +
> > > > +    def encode(self, encoder, state):
> > > > +        idname =3D self.ID_ALIAS or self._OBJ_IRIS["_id"]
> > > > +        if not self._id and self.NODE_KIND =3D=3D NodeKind.IRI:
> > > > +            raise ValueError(
> > > > +                f"{self.__class__.__name__} ({id(self)}) must have=
 a IRI for property '{idname}'"
> > > > +            )
> > > > +
> > > > +        if state.is_written(self):
> > > > +            encoder.write_iri(state.get_object_id(self))
> > > > +            return
> > > > +
> > > > +        state.add_written(self)
> > > > +
> > > > +        with encoder.write_object(
> > > > +            self,
> > > > +            state.get_object_id(self),
> > > > +            bool(self._id) or state.is_refed(self),
> > > > +        ) as obj_s:
> > > > +            self._encode_properties(obj_s, state)
> > > > +
> > > > +    def _encode_properties(self, encoder, state):
> > > > +        for iri, prop, min_count, max_count, pyname, compact in se=
lf.__iter_props():
> > > > +            value =3D self.__dict__["_obj_data"][iri]
> > > > +            if prop.elide(value):
> > > > +                if min_count:
> > > > +                    raise ValueError(
> > > > +                        f"Property '{pyname}' in {self.__class__._=
_name__} ({id(self)}) is required (currently {value!r})"
> > > > +                    )
> > > > +                continue
> > > > +
> > > > +            if min_count is not None:
> > > > +                if not prop.check_min_count(value, min_count):
> > > > +                    raise ValueError(
> > > > +                        f"Property '{pyname}' in {self.__class__._=
_name__} ({id(self)}) requires a minimum of {min_count} elements"
> > > > +                    )
> > > > +
> > > > +            if max_count is not None:
> > > > +                if not prop.check_max_count(value, max_count):
> > > > +                    raise ValueError(
> > > > +                        f"Property '{pyname}' in {self.__class__._=
_name__} ({id(self)}) requires a maximum of {max_count} elements"
> > > > +                    )
> > > > +
> > > > +            if iri =3D=3D self._OBJ_IRIS["_id"]:
> > > > +                continue
> > > > +
> > > > +            with encoder.write_property(iri, compact) as prop_s:
> > > > +                prop.encode(prop_s, value, state)
> > > > +
> > > > +    @classmethod
> > > > +    def _make_object(cls, typ):
> > > > +        if typ not in cls.CLASSES:
> > > > +            raise TypeError(f"Unknown type {typ}")
> > > > +
> > > > +        return cls.CLASSES[typ]()
> > > > +
> > > > +    @classmethod
> > > > +    def decode(cls, decoder, *, objectset=3DNone):
> > > > +        typ, obj_d =3D decoder.read_object()
> > > > +        if typ is None:
> > > > +            raise TypeError("Unable to determine type for object")
> > > > +
> > > > +        obj =3D cls._make_object(typ)
> > > > +        for key in (obj.ID_ALIAS, obj._OBJ_IRIS["_id"]):
> > > > +            with obj_d.read_property(key) as prop_d:
> > > > +                if prop_d is None:
> > > > +                    continue
> > > > +
> > > > +                _id =3D prop_d.read_iri()
> > > > +                if _id is None:
> > > > +                    raise TypeError(f"Object key '{key}' is the wr=
ong type")
> > > > +
> > > > +                obj._id =3D _id
> > > > +                break
> > > > +
> > > > +        if obj.NODE_KIND =3D=3D NodeKind.IRI and not obj._id:
> > > > +            raise ValueError("Object is missing required IRI")
> > > > +
> > > > +        if objectset is not None:
> > > > +            if obj._id:
> > > > +                v =3D objectset.find_by_id(_id)
> > > > +                if v is not None:
> > > > +                    return v
> > > > +
> > > > +        obj._decode_properties(obj_d, objectset=3Dobjectset)
> > > > +
> > > > +        if objectset is not None:
> > > > +            objectset.add_index(obj)
> > > > +        return obj
> > > > +
> > > > +    def _decode_properties(self, decoder, objectset=3DNone):
> > > > +        for key in decoder.object_keys():
> > > > +            if not self._decode_prop(decoder, key, objectset=3Dobj=
ectset):
> > > > +                raise KeyError(f"Unknown property '{key}'")
> > > > +
> > > > +    def _decode_prop(self, decoder, key, objectset=3DNone):
> > > > +        if key in (self._OBJ_IRIS["_id"], self.ID_ALIAS):
> > > > +            return True
> > > > +
> > > > +        for iri, prop, _, _, _, compact in self.__iter_props():
> > > > +            if compact =3D=3D key:
> > > > +                read_key =3D compact
> > > > +            elif iri =3D=3D key:
> > > > +                read_key =3D iri
> > > > +            else:
> > > > +                continue
> > > > +
> > > > +            with decoder.read_property(read_key) as prop_d:
> > > > +                v =3D prop.decode(prop_d, objectset=3Dobjectset)
> > > > +                prop.validate(v)
> > > > +                self.__dict__["_obj_data"][iri] =3D v
> > > > +            return True
> > > > +
> > > > +        return False
> > > > +
> > > > +    def link_helper(self, objectset, missing, visited):
> > > > +        if self in visited:
> > > > +            return
> > > > +
> > > > +        visited.add(self)
> > > > +
> > > > +        for iri, prop, _, _, _, _ in self.__iter_props():
> > > > +            self.__dict__["_obj_data"][iri] =3D prop.link_prop(
> > > > +                self.__dict__["_obj_data"][iri],
> > > > +                objectset,
> > > > +                missing,
> > > > +                visited,
> > > > +            )
> > > > +
> > > > +    def __str__(self):
> > > > +        parts =3D [
> > > > +            f"{self.__class__.__name__}(",
> > > > +        ]
> > > > +        if self._id:
> > > > +            parts.append(f"@id=3D'{self._id}'")
> > > > +        parts.append(")")
> > > > +        return "".join(parts)
> > > > +
> > > > +    def __hash__(self):
> > > > +        return super().__hash__()
> > > > +
> > > > +    def __eq__(self, other):
> > > > +        return super().__eq__(other)
> > > > +
> > > > +    def __lt__(self, other):
> > > > +        def sort_key(obj):
> > > > +            if isinstance(obj, str):
> > > > +                return (obj, "", "", "")
> > > > +            return (
> > > > +                obj._id or "",
> > > > +                obj.TYPE,
> > > > +                getattr(obj, "name", None) or "",
> > > > +                id(obj),
> > > > +            )
> > > > +
> > > > +        return sort_key(self) < sort_key(other)
> > > > +
> > > > +
> > > > +class SHACLExtensibleObject(object):
> > > > +    CLOSED =3D False
> > > > +
> > > > +    def __init__(self, typ=3DNone, **kwargs):
> > > > +        if typ:
> > > > +            self.__dict__["_obj_TYPE"] =3D (typ, None)
> > > > +        else:
> > > > +            self.__dict__["_obj_TYPE"] =3D (self._OBJ_TYPE, self._=
OBJ_COMPACT_TYPE)
> > > > +        super().__init__(**kwargs)
> > > > +
> > > > +    def _is_abstract(self):
> > > > +        # Unknown classes are assumed to not be abstract so that t=
hey can be
> > > > +        # deserialized
> > > > +        typ =3D self.__dict__["_obj_TYPE"][0]
> > > > +        if typ in self.__class__.CLASSES:
> > > > +            return self.__class__.CLASSES[typ].IS_ABSTRACT
> > > > +
> > > > +        return False
> > > > +
> > > > +    @classmethod
> > > > +    def _make_object(cls, typ):
> > > > +        # Check for a known type, and if so, deserialize as that i=
nstead
> > > > +        if typ in cls.CLASSES:
> > > > +            return cls.CLASSES[typ]()
> > > > +
> > > > +        obj =3D cls(typ)
> > > > +        return obj
> > > > +
> > > > +    def _decode_properties(self, decoder, objectset=3DNone):
> > > > +        def decode_value(d):
> > > > +            if not d.is_list():
> > > > +                return d.read_value()
> > > > +
> > > > +            return [decode_value(val_d) for val_d in d.read_list()]
> > > > +
> > > > +        if self.CLOSED:
> > > > +            super()._decode_properties(decoder, objectset=3Dobject=
set)
> > > > +            return
> > > > +
> > > > +        for key in decoder.object_keys():
> > > > +            if self._decode_prop(decoder, key, objectset=3Dobjects=
et):
> > > > +                continue
> > > > +
> > > > +            if not is_IRI(key):
> > > > +                raise KeyError(
> > > > +                    f"Extensible object properties must be IRIs. G=
ot '{key}'"
> > > > +                )
> > > > +
> > > > +            with decoder.read_property(key) as prop_d:
> > > > +                self.__dict__["_obj_data"][key] =3D decode_value(p=
rop_d)
> > > > +
> > > > +    def _encode_properties(self, encoder, state):
> > > > +        def encode_value(encoder, v):
> > > > +            if isinstance(v, bool):
> > > > +                encoder.write_bool(v)
> > > > +            elif isinstance(v, str):
> > > > +                encoder.write_string(v)
> > > > +            elif isinstance(v, int):
> > > > +                encoder.write_integer(v)
> > > > +            elif isinstance(v, float):
> > > > +                encoder.write_float(v)
> > > > +            elif isinstance(v, list):
> > > > +                with encoder.write_list() as list_s:
> > > > +                    for i in v:
> > > > +                        with list_s.write_list_item() as item_s:
> > > > +                            encode_value(item_s, i)
> > > > +            else:
> > > > +                raise TypeError(
> > > > +                    f"Unsupported serialized type {type(v)} with v=
alue '{v}'"
> > > > +                )
> > > > +
> > > > +        super()._encode_properties(encoder, state)
> > > > +        if self.CLOSED:
> > > > +            return
> > > > +
> > > > +        for iri, value in self.__dict__["_obj_data"].items():
> > > > +            if iri in self._OBJ_PROPERTIES:
> > > > +                continue
> > > > +
> > > > +            with encoder.write_property(iri) as prop_s:
> > > > +                encode_value(prop_s, value)
> > > > +
> > > > +    def __setitem__(self, iri, value):
> > > > +        try:
> > > > +            super().__setitem__(iri, value)
> > > > +        except KeyError:
> > > > +            if self.CLOSED:
> > > > +                raise
> > > > +
> > > > +            if not is_IRI(iri):
> > > > +                raise KeyError(f"Key '{iri}' must be an IRI")
> > > > +            self.__dict__["_obj_data"][iri] =3D value
> > > > +
> > > > +    def __delitem__(self, iri):
> > > > +        try:
> > > > +            super().__delitem__(iri)
> > > > +        except KeyError:
> > > > +            if self.CLOSED:
> > > > +                raise
> > > > +
> > > > +            if not is_IRI(iri):
> > > > +                raise KeyError(f"Key '{iri}' must be an IRI")
> > > > +            del self.__dict__["_obj_data"][iri]
> > > > +
> > > > +    def __getattr__(self, name):
> > > > +        if name =3D=3D "TYPE":
> > > > +            return self.__dict__["_obj_TYPE"][0]
> > > > +        if name =3D=3D "COMPACT_TYPE":
> > > > +            return self.__dict__["_obj_TYPE"][1]
> > > > +        return super().__getattr__(name)
> > > > +
> > > > +    def property_keys(self):
> > > > +        iris =3D set()
> > > > +        for pyname, iri, compact in super().property_keys():
> > > > +            iris.add(iri)
> > > > +            yield pyname, iri, compact
> > > > +
> > > > +        if self.CLOSED:
> > > > +            return
> > > > +
> > > > +        for iri in self.__dict__["_obj_data"].keys():
> > > > +            if iri not in iris:
> > > > +                yield None, iri, None
> > > > +
> > > > +
> > > > +class SHACLObjectSet(object):
> > > > +    def __init__(self, objects=3D[], *, link=3DFalse):
> > > > +        self.objects =3D set()
> > > > +        self.missing_ids =3D set()
> > > > +        for o in objects:
> > > > +            self.objects.add(o)
> > > > +        self.create_index()
> > > > +        if link:
> > > > +            self._link()
> > > > +
> > > > +    def create_index(self):
> > > > +        """
> > > > +        (re)Create object index
> > > > +
> > > > +        Creates or recreates the indices for the object set to ena=
ble fast
> > > > +        lookup. All objects and their children are walked and inde=
xed
> > > > +        """
> > > > +        self.obj_by_id =3D {}
> > > > +        self.obj_by_type =3D {}
> > > > +        for o in self.foreach():
> > > > +            self.add_index(o)
> > > > +
> > > > +    def add_index(self, obj):
> > > > +        """
> > > > +        Add object to index
> > > > +
> > > > +        Adds the object to all appropriate indices
> > > > +        """
> > > > +
> > > > +        def reg_type(typ, compact, o, exact):
> > > > +            self.obj_by_type.setdefault(typ, set()).add((exact, o))
> > > > +            if compact:
> > > > +                self.obj_by_type.setdefault(compact, set()).add((e=
xact, o))
> > > > +
> > > > +        if not isinstance(obj, SHACLObject):
> > > > +            raise TypeError("Object is not of type SHACLObject")
> > > > +
> > > > +        for typ in SHACLObject.CLASSES.values():
> > > > +            if isinstance(obj, typ):
> > > > +                reg_type(
> > > > +                    typ._OBJ_TYPE, typ._OBJ_COMPACT_TYPE, obj, obj=
=2E__class__ is typ
> > > > +                )
> > > > +
> > > > +        # This covers custom extensions
> > > > +        reg_type(obj.TYPE, obj.COMPACT_TYPE, obj, True)
> > > > +
> > > > +        if not obj._id:
> > > > +            return
> > > > +
> > > > +        self.missing_ids.discard(obj._id)
> > > > +
> > > > +        if obj._id in self.obj_by_id:
> > > > +            return
> > > > +
> > > > +        self.obj_by_id[obj._id] =3D obj
> > > > +
> > > > +    def add(self, obj):
> > > > +        """
> > > > +        Add object to object set
> > > > +
> > > > +        Adds a SHACLObject to the object set and index it.
> > > > +
> > > > +        NOTE: Child objects of the attached object are not indexes
> > > > +        """
> > > > +        if not isinstance(obj, SHACLObject):
> > > > +            raise TypeError("Object is not of type SHACLObject")
> > > > +
> > > > +        if obj not in self.objects:
> > > > +            self.objects.add(obj)
> > > > +            self.add_index(obj)
> > > > +        return obj
> > > > +
> > > > +    def update(self, *others):
> > > > +        """
> > > > +        Update object set adding all objects in each other iterable
> > > > +        """
> > > > +        for o in others:
> > > > +            for obj in o:
> > > > +                self.add(obj)
> > > > +
> > > > +    def __contains__(self, item):
> > > > +        """
> > > > +        Returns True if the item is in the object set
> > > > +        """
> > > > +        return item in self.objects
> > > > +
> > > > +    def link(self):
> > > > +        """
> > > > +        Link object set
> > > > +
> > > > +        Links the object in the object set by replacing string obj=
ect
> > > > +        references with references to the objects themselves. e.g.
> > > > +        a property that references object "https://foo/bar" by a s=
tring
> > > > +        reference will be replaced with an actual reference to the=
 object in
> > > > +        the object set with the same ID if it exists in the object=
 set
> > > > +
> > > > +        If multiple objects with the same ID are found, the duplic=
ates are
> > > > +        eliminated
> > > > +        """
> > > > +        self.create_index()
> > > > +        return self._link()
> > > > +
> > > > +    def _link(self):
> > > > +        global NAMED_INDIVIDUALS
> > > > +
> > > > +        self.missing_ids =3D set()
> > > > +        visited =3D set()
> > > > +
> > > > +        new_objects =3D set()
> > > > +
> > > > +        for o in self.objects:
> > > > +            if o._id:
> > > > +                o =3D self.find_by_id(o._id, o)
> > > > +            o.link_helper(self, self.missing_ids, visited)
> > > > +            new_objects.add(o)
> > > > +
> > > > +        self.objects =3D new_objects
> > > > +
> > > > +        # Remove blank nodes
> > > > +        obj_by_id =3D {}
> > > > +        for _id, obj in self.obj_by_id.items():
> > > > +            if _id.startswith("_:"):
> > > > +                del obj._id
> > > > +            else:
> > > > +                obj_by_id[_id] =3D obj
> > > > +        self.obj_by_id =3D obj_by_id
> > > > +
> > > > +        # Named individuals aren't considered missing
> > > > +        self.missing_ids -=3D NAMED_INDIVIDUALS
> > > > +
> > > > +        return self.missing_ids
> > > > +
> > > > +    def find_by_id(self, _id, default=3DNone):
> > > > +        """
> > > > +        Find object by ID
> > > > +
> > > > +        Returns objects that match the specified ID, or default if=
 there is no
> > > > +        object with the specified ID
> > > > +        """
> > > > +        if _id not in self.obj_by_id:
> > > > +            return default
> > > > +        return self.obj_by_id[_id]
> > > > +
> > > > +    def foreach(self):
> > > > +        """
> > > > +        Iterate over every object in the object set, and all child=
 objects
> > > > +        """
> > > > +        visited =3D set()
> > > > +        for o in self.objects:
> > > > +            if o not in visited:
> > > > +                yield o
> > > > +                visited.add(o)
> > > > +
> > > > +            for child in o.iter_objects(recursive=3DTrue, visited=
=3Dvisited):
> > > > +                yield child
> > > > +
> > > > +    def foreach_type(self, typ, *, match_subclass=3DTrue):
> > > > +        """
> > > > +        Iterate over each object of a specified type (or subclass =
there of)
> > > > +
> > > > +        If match_subclass is True, and class derived from typ will=
 also match
> > > > +        (similar to isinstance()). If False, only exact matches wi=
ll be
> > > > +        returned
> > > > +        """
> > > > +        if not isinstance(typ, str):
> > > > +            if not issubclass(typ, SHACLObject):
> > > > +                raise TypeError(f"Type must be derived from SHACLO=
bject, got {typ}")
> > > > +            typ =3D typ._OBJ_TYPE
> > > > +
> > > > +        if typ not in self.obj_by_type:
> > > > +            return
> > > > +
> > > > +        for exact, o in self.obj_by_type[typ]:
> > > > +            if match_subclass or exact:
> > > > +                yield o
> > > > +
> > > > +    def merge(self, *objectsets):
> > > > +        """
> > > > +        Merge object sets
> > > > +
> > > > +        Returns a new object set that is the combination of this o=
bject set and
> > > > +        all provided arguments
> > > > +        """
> > > > +        new_objects =3D set()
> > > > +        new_objects |=3D self.objects
> > > > +        for d in objectsets:
> > > > +            new_objects |=3D d.objects
> > > > +
> > > > +        return SHACLObjectSet(new_objects, link=3DTrue)
> > > > +
> > > > +    def encode(self, encoder, force_list=3DFalse, *, key=3DNone):
> > > > +        """
> > > > +        Serialize a list of objects to a serialization encoder
> > > > +
> > > > +        If force_list is true, a list will always be written using=
 the encoder.
> > > > +        """
> > > > +        ref_counts =3D {}
> > > > +        state =3D EncodeState()
> > > > +
> > > > +        def walk_callback(value, path):
> > > > +            nonlocal state
> > > > +            nonlocal ref_counts
> > > > +
> > > > +            if not isinstance(value, SHACLObject):
> > > > +                return True
> > > > +
> > > > +            # Remove blank node ID for re-assignment
> > > > +            if value._id and value._id.startswith("_:"):
> > > > +                del value._id
> > > > +
> > > > +            if value._id:
> > > > +                state.add_refed(value)
> > > > +
> > > > +            # If the object is referenced more than once, add it t=
o the set of
> > > > +            # referenced objects
> > > > +            ref_counts.setdefault(value, 0)
> > > > +            ref_counts[value] +=3D 1
> > > > +            if ref_counts[value] > 1:
> > > > +                state.add_refed(value)
> > > > +                return False
> > > > +
> > > > +            return True
> > > > +
> > > > +        for o in self.objects:
> > > > +            if o._id:
> > > > +                state.add_refed(o)
> > > > +            o.walk(walk_callback)
> > > > +
> > > > +        use_list =3D force_list or len(self.objects) > 1
> > > > +
> > > > +        if use_list:
> > > > +            # If we are making a list add all the objects referred=
 to by reference
> > > > +            # to the list
> > > > +            objects =3D list(self.objects | state.ref_objects)
> > > > +        else:
> > > > +            objects =3D list(self.objects)
> > > > +
> > > > +        objects.sort(key=3Dkey)
> > > > +
> > > > +        if use_list:
> > > > +            # Ensure top level objects are only written in the top=
 level graph
> > > > +            # node, and referenced by ID everywhere else. This is =
done by setting
> > > > +            # the flag that indicates this object has been written=
 for all the top
> > > > +            # level objects, then clearing it right before seriali=
zing the object.
> > > > +            #
> > > > +            # In this way, if an object is referenced before it is=
 supposed to be
> > > > +            # serialized into the @graph, it will serialize as a s=
tring instead of
> > > > +            # the actual object
> > > > +            for o in objects:
> > > > +                state.written_objects.add(o)
> > > > +
> > > > +            with encoder.write_list() as list_s:
> > > > +                for o in objects:
> > > > +                    # Allow this specific object to be written now
> > > > +                    state.written_objects.remove(o)
> > > > +                    with list_s.write_list_item() as item_s:
> > > > +                        o.encode(item_s, state)
> > > > +
> > > > +        elif objects:
> > > > +            objects[0].encode(encoder, state)
> > > > +
> > > > +    def decode(self, decoder):
> > > > +        self.create_index()
> > > > +
> > > > +        for obj_d in decoder.read_list():
> > > > +            o =3D SHACLObject.decode(obj_d, objectset=3Dself)
> > > > +            self.objects.add(o)
> > > > +
> > > > +        self._link()
> > > > +
> > > > +
> > > > +class EncodeState(object):
> > > > +    def __init__(self):
> > > > +        self.ref_objects =3D set()
> > > > +        self.written_objects =3D set()
> > > > +        self.blank_objects =3D {}
> > > > +
> > > > +    def get_object_id(self, o):
> > > > +        if o._id:
> > > > +            return o._id
> > > > +
> > > > +        if o not in self.blank_objects:
> > > > +            _id =3D f"_:{o.__class__.__name__}{len(self.blank_obje=
cts)}"
> > > > +            self.blank_objects[o] =3D _id
> > > > +
> > > > +        return self.blank_objects[o]
> > > > +
> > > > +    def is_refed(self, o):
> > > > +        return o in self.ref_objects
> > > > +
> > > > +    def add_refed(self, o):
> > > > +        self.ref_objects.add(o)
> > > > +
> > > > +    def is_written(self, o):
> > > > +        return o in self.written_objects
> > > > +
> > > > +    def add_written(self, o):
> > > > +        self.written_objects.add(o)
> > > > +
> > > > +
> > > > +class Decoder(ABC):
> > > > +    @abstractmethod
> > > > +    def read_value(self):
> > > > +        """
> > > > +        Consume next item
> > > > +
> > > > +        Consumes the next item of any type
> > > > +        """
> > > > +        pass
> > > > +
> > > > +    @abstractmethod
> > > > +    def read_string(self):
> > > > +        """
> > > > +        Consume the next item as a string.
> > > > +
> > > > +        Returns the string value of the next item, or `None` if th=
e next item
> > > > +        is not a string
> > > > +        """
> > > > +        pass
> > > > +
> > > > +    @abstractmethod
> > > > +    def read_datetime(self):
> > > > +        """
> > > > +        Consumes the next item as a date & time string
> > > > +
> > > > +        Returns the string value of the next item, if it is a ISO =
datetime, or
> > > > +        `None` if the next item is not a ISO datetime string.
> > > > +
> > > > +        Note that validation of the string is done by the caller, =
so a minimal
> > > > +        implementation can just check if the next item is a string=
 without
> > > > +        worrying about the format
> > > > +        """
> > > > +        pass
> > > > +
> > > > +    @abstractmethod
> > > > +    def read_integer(self):
> > > > +        """
> > > > +        Consumes the next item as an integer
> > > > +
> > > > +        Returns the integer value of the next item, or `None` if t=
he next item
> > > > +        is not an integer
> > > > +        """
> > > > +        pass
> > > > +
> > > > +    @abstractmethod
> > > > +    def read_iri(self):
> > > > +        """
> > > > +        Consumes the next item as an IRI string
> > > > +
> > > > +        Returns the string value of the next item an IRI, or `None=
` if the next
> > > > +        item is not an IRI.
> > > > +
> > > > +        The returned string should be either a fully-qualified IRI=
, or a blank
> > > > +        node ID
> > > > +        """
> > > > +        pass
> > > > +
> > > > +    @abstractmethod
> > > > +    def read_enum(self, e):
> > > > +        """
> > > > +        Consumes the next item as an Enum value string
> > > > +
> > > > +        Returns the fully qualified IRI of the next enum item, or =
`None` if the
> > > > +        next item is not an enum value.
> > > > +
> > > > +        The callee is responsible for validating that the returned=
 IRI is
> > > > +        actually a member of the specified Enum, so the `Decoder` =
does not need
> > > > +        to check that, but can if it wishes
> > > > +        """
> > > > +        pass
> > > > +
> > > > +    @abstractmethod
> > > > +    def read_bool(self):
> > > > +        """
> > > > +        Consume the next item as a boolean value
> > > > +
> > > > +        Returns the boolean value of the next item, or `None` if t=
he next item
> > > > +        is not a boolean
> > > > +        """
> > > > +        pass
> > > > +
> > > > +    @abstractmethod
> > > > +    def read_float(self):
> > > > +        """
> > > > +        Consume the next item as a float value
> > > > +
> > > > +        Returns the float value of the next item, or `None` if the=
 next item is
> > > > +        not a float
> > > > +        """
> > > > +        pass
> > > > +
> > > > +    @abstractmethod
> > > > +    def read_list(self):
> > > > +        """
> > > > +        Consume the next item as a list generator
> > > > +
> > > > +        This should generate a `Decoder` object for each item in t=
he list. The
> > > > +        generated `Decoder` can be used to read the corresponding =
item from the
> > > > +        list
> > > > +        """
> > > > +        pass
> > > > +
> > > > +    @abstractmethod
> > > > +    def is_list(self):
> > > > +        """
> > > > +        Checks if the next item is a list
> > > > +
> > > > +        Returns True if the next item is a list, or False if it is=
 a scalar
> > > > +        """
> > > > +        pass
> > > > +
> > > > +    @abstractmethod
> > > > +    def read_object(self):
> > > > +        """
> > > > +        Consume next item as an object
> > > > +
> > > > +        A context manager that "enters" the next item as a object =
and yields a
> > > > +        `Decoder` that can read properties from it. If the next it=
em is not an
> > > > +        object, yields `None`
> > > > +
> > > > +        Properties will be read out of the object using `read_prop=
erty` and
> > > > +        `read_object_id`
> > > > +        """
> > > > +        pass
> > > > +
> > > > +    @abstractmethod
> > > > +    @contextmanager
> > > > +    def read_property(self, key):
> > > > +        """
> > > > +        Read property from object
> > > > +
> > > > +        A context manager that yields a `Decoder` that can be used=
 to read the
> > > > +        value of the property with the given key in current object=
, or `None`
> > > > +        if the property does not exist in the current object.
> > > > +        """
> > > > +        pass
> > > > +
> > > > +    @abstractmethod
> > > > +    def object_keys(self):
> > > > +        """
> > > > +        Read property keys from an object
> > > > +
> > > > +        Iterates over all the serialized keys for the current obje=
ct
> > > > +        """
> > > > +        pass
> > > > +
> > > > +    @abstractmethod
> > > > +    def read_object_id(self, alias=3DNone):
> > > > +        """
> > > > +        Read current object ID property
> > > > +
> > > > +        Returns the ID of the current object if one is defined, or=
 `None` if
> > > > +        the current object has no ID.
> > > > +
> > > > +        The ID must be a fully qualified IRI or a blank node
> > > > +
> > > > +        If `alias` is provided, is is a hint as to another name by=
 which the ID
> > > > +        might be found, if the `Decoder` supports aliases for an ID
> > > > +        """
> > > > +        pass
> > > > +
> > > > +
> > > > +class JSONLDDecoder(Decoder):
> > > > +    def __init__(self, data, root=3DFalse):
> > > > +        self.data =3D data
> > > > +        self.root =3D root
> > > > +
> > > > +    def read_value(self):
> > > > +        if isinstance(self.data, str):
> > > > +            try:
> > > > +                return float(self.data)
> > > > +            except ValueError:
> > > > +                pass
> > > > +        return self.data
> > > > +
> > > > +    def read_string(self):
> > > > +        if isinstance(self.data, str):
> > > > +            return self.data
> > > > +        return None
> > > > +
> > > > +    def read_datetime(self):
> > > > +        return self.read_string()
> > > > +
> > > > +    def read_integer(self):
> > > > +        if isinstance(self.data, int):
> > > > +            return self.data
> > > > +        return None
> > > > +
> > > > +    def read_bool(self):
> > > > +        if isinstance(self.data, bool):
> > > > +            return self.data
> > > > +        return None
> > > > +
> > > > +    def read_float(self):
> > > > +        if isinstance(self.data, (int, float, str)):
> > > > +            return float(self.data)
> > > > +        return None
> > > > +
> > > > +    def read_iri(self):
> > > > +        if isinstance(self.data, str):
> > > > +            return self.data
> > > > +        return None
> > > > +
> > > > +    def read_enum(self, e):
> > > > +        if isinstance(self.data, str):
> > > > +            return self.data
> > > > +        return None
> > > > +
> > > > +    def read_list(self):
> > > > +        if self.is_list():
> > > > +            for v in self.data:
> > > > +                yield self.__class__(v)
> > > > +        else:
> > > > +            yield self
> > > > +
> > > > +    def is_list(self):
> > > > +        return isinstance(self.data, (list, tuple, set))
> > > > +
> > > > +    def __get_value(self, *keys):
> > > > +        for k in keys:
> > > > +            if k and k in self.data:
> > > > +                return self.data[k]
> > > > +        return None
> > > > +
> > > > +    @contextmanager
> > > > +    def read_property(self, key):
> > > > +        v =3D self.__get_value(key)
> > > > +        if v is not None:
> > > > +            yield self.__class__(v)
> > > > +        else:
> > > > +            yield None
> > > > +
> > > > +    def object_keys(self):
> > > > +        for key in self.data.keys():
> > > > +            if key in ("@type", "type"):
> > > > +                continue
> > > > +            if self.root and key =3D=3D "@context":
> > > > +                continue
> > > > +            yield key
> > > > +
> > > > +    def read_object(self):
> > > > +        typ =3D self.__get_value("@type", "type")
> > > > +        if typ is not None:
> > > > +            return typ, self
> > > > +
> > > > +        return None, self
> > > > +
> > > > +    def read_object_id(self, alias=3DNone):
> > > > +        return self.__get_value(alias, "@id")
> > > > +
> > > > +
> > > > +class JSONLDDeserializer(object):
> > > > +    def deserialize_data(self, data, objectset: SHACLObjectSet):
> > > > +        if "@graph" in data:
> > > > +            h =3D JSONLDDecoder(data["@graph"], True)
> > > > +        else:
> > > > +            h =3D JSONLDDecoder(data, True)
> > > > +
> > > > +        objectset.decode(h)
> > > > +
> > > > +    def read(self, f, objectset: SHACLObjectSet):
> > > > +        data =3D json.load(f)
> > > > +        self.deserialize_data(data, objectset)
> > > > +
> > > > +
> > > > +class Encoder(ABC):
> > > > +    @abstractmethod
> > > > +    def write_string(self, v):
> > > > +        """
> > > > +        Write a string value
> > > > +
> > > > +        Encodes the value as a string in the output
> > > > +        """
> > > > +        pass
> > > > +
> > > > +    @abstractmethod
> > > > +    def write_datetime(self, v):
> > > > +        """
> > > > +        Write a date & time string
> > > > +
> > > > +        Encodes the value as an ISO datetime string
> > > > +
> > > > +        Note: The provided string is already correctly encoded as =
an ISO datetime
> > > > +        """
> > > > +        pass
> > > > +
> > > > +    @abstractmethod
> > > > +    def write_integer(self, v):
> > > > +        """
> > > > +        Write an integer value
> > > > +
> > > > +        Encodes the value as an integer in the output
> > > > +        """
> > > > +        pass
> > > > +
> > > > +    @abstractmethod
> > > > +    def write_iri(self, v, compact=3DNone):
> > > > +        """
> > > > +        Write IRI
> > > > +
> > > > +        Encodes the string as an IRI. Note that the string will be=
 either a
> > > > +        fully qualified IRI or a blank node ID. If `compact` is pr=
ovided and
> > > > +        the serialization supports compacted IRIs, it should be pr=
eferred to
> > > > +        the full IRI
> > > > +        """
> > > > +        pass
> > > > +
> > > > +    @abstractmethod
> > > > +    def write_enum(self, v, e, compact=3DNone):
> > > > +        """
> > > > +        Write enum value IRI
> > > > +
> > > > +        Encodes the string enum value IRI. Note that the string wi=
ll be a fully
> > > > +        qualified IRI. If `compact` is provided and the serializat=
ion supports
> > > > +        compacted IRIs, it should be preferred to the full IRI.
> > > > +        """
> > > > +        pass
> > > > +
> > > > +    @abstractmethod
> > > > +    def write_bool(self, v):
> > > > +        """
> > > > +        Write boolean
> > > > +
> > > > +        Encodes the value as a boolean in the output
> > > > +        """
> > > > +        pass
> > > > +
> > > > +    @abstractmethod
> > > > +    def write_float(self, v):
> > > > +        """
> > > > +        Write float
> > > > +
> > > > +        Encodes the value as a floating point number in the output
> > > > +        """
> > > > +        pass
> > > > +
> > > > +    @abstractmethod
> > > > +    @contextmanager
> > > > +    def write_object(self, o, _id, needs_id):
> > > > +        """
> > > > +        Write object
> > > > +
> > > > +        A context manager that yields an `Encoder` that can be use=
d to encode
> > > > +        the given object properties.
> > > > +
> > > > +        The provided ID will always be a valid ID (even if o._id i=
s `None`), in
> > > > +        case the `Encoder` _must_ have an ID. `needs_id` is a hint=
 to indicate
> > > > +        to the `Encoder` if an ID must be written or not (if that =
is even an
> > > > +        option). If it is `True`, the `Encoder` must encode an ID =
for the
> > > > +        object. If `False`, the encoder is not required to encode =
an ID and may
> > > > +        omit it.
> > > > +
> > > > +        The ID will be either a fully qualified IRI, or a blank no=
de IRI.
> > > > +
> > > > +        Properties will be written the object using `write_propert=
y`
> > > > +        """
> > > > +        pass
> > > > +
> > > > +    @abstractmethod
> > > > +    @contextmanager
> > > > +    def write_property(self, iri, compact=3DNone):
> > > > +        """
> > > > +        Write object property
> > > > +
> > > > +        A context manager that yields an `Encoder` that can be use=
d to encode
> > > > +        the value for the property with the given IRI in the curre=
nt object
> > > > +
> > > > +        Note that the IRI will be fully qualified. If `compact` is=
 provided and
> > > > +        the serialization supports compacted IRIs, it should be pr=
eferred to
> > > > +        the full IRI.
> > > > +        """
> > > > +        pass
> > > > +
> > > > +    @abstractmethod
> > > > +    @contextmanager
> > > > +    def write_list(self):
> > > > +        """
> > > > +        Write list
> > > > +
> > > > +        A context manager that yields an `Encoder` that can be use=
d to encode a
> > > > +        list.
> > > > +
> > > > +        Each item of the list will be added using `write_list_item`
> > > > +        """
> > > > +        pass
> > > > +
> > > > +    @abstractmethod
> > > > +    @contextmanager
> > > > +    def write_list_item(self):
> > > > +        """
> > > > +        Write list item
> > > > +
> > > > +        A context manager that yields an `Encoder` that can be use=
d to encode
> > > > +        the value for a list item
> > > > +        """
> > > > +        pass
> > > > +
> > > > +
> > > > +class JSONLDEncoder(Encoder):
> > > > +    def __init__(self, data=3DNone):
> > > > +        self.data =3D data
> > > > +
> > > > +    def write_string(self, v):
> > > > +        self.data =3D v
> > > > +
> > > > +    def write_datetime(self, v):
> > > > +        self.data =3D v
> > > > +
> > > > +    def write_integer(self, v):
> > > > +        self.data =3D v
> > > > +
> > > > +    def write_iri(self, v, compact=3DNone):
> > > > +        self.write_string(compact or v)
> > > > +
> > > > +    def write_enum(self, v, e, compact=3DNone):
> > > > +        self.write_string(compact or v)
> > > > +
> > > > +    def write_bool(self, v):
> > > > +        self.data =3D v
> > > > +
> > > > +    def write_float(self, v):
> > > > +        self.data =3D str(v)
> > > > +
> > > > +    @contextmanager
> > > > +    def write_property(self, iri, compact=3DNone):
> > > > +        s =3D self.__class__(None)
> > > > +        yield s
> > > > +        if s.data is not None:
> > > > +            self.data[compact or iri] =3D s.data
> > > > +
> > > > +    @contextmanager
> > > > +    def write_object(self, o, _id, needs_id):
> > > > +        self.data =3D {
> > > > +            "type": o.COMPACT_TYPE or o.TYPE,
> > > > +        }
> > > > +        if needs_id:
> > > > +            self.data[o.ID_ALIAS or "@id"] =3D _id
> > > > +        yield self
> > > > +
> > > > +    @contextmanager
> > > > +    def write_list(self):
> > > > +        self.data =3D []
> > > > +        yield self
> > > > +        if not self.data:
> > > > +            self.data =3D None
> > > > +
> > > > +    @contextmanager
> > > > +    def write_list_item(self):
> > > > +        s =3D self.__class__(None)
> > > > +        yield s
> > > > +        if s.data is not None:
> > > > +            self.data.append(s.data)
> > > > +
> > > > +
> > > > +class JSONLDSerializer(object):
> > > > +    def __init__(self, **args):
> > > > +        self.args =3D args
> > > > +
> > > > +    def serialize_data(
> > > > +        self,
> > > > +        objectset: SHACLObjectSet,
> > > > +        force_at_graph=3DFalse,
> > > > +    ):
> > > > +        h =3D JSONLDEncoder()
> > > > +        objectset.encode(h, force_at_graph)
> > > > +        data =3D {}
> > > > +        if len(CONTEXT_URLS) =3D=3D 1:
> > > > +            data["@context"] =3D CONTEXT_URLS[0]
> > > > +        elif CONTEXT_URLS:
> > > > +            data["@context"] =3D CONTEXT_URLS
> > > > +
> > > > +        if isinstance(h.data, list):
> > > > +            data["@graph"] =3D h.data
> > > > +        else:
> > > > +            for k, v in h.data.items():
> > > > +                data[k] =3D v
> > > > +
> > > > +        return data
> > > > +
> > > > +    def write(
> > > > +        self,
> > > > +        objectset: SHACLObjectSet,
> > > > +        f,
> > > > +        force_at_graph=3DFalse,
> > > > +        **kwargs,
> > > > +    ):
> > > > +        """
> > > > +        Write a SHACLObjectSet to a JSON LD file
> > > > +
> > > > +        If force_at_graph is True, a @graph node will always be wr=
itten
> > > > +        """
> > > > +        data =3D self.serialize_data(objectset, force_at_graph)
> > > > +
> > > > +        args =3D {**self.args, **kwargs}
> > > > +
> > > > +        sha1 =3D hashlib.sha1()
> > > > +        for chunk in json.JSONEncoder(**args).iterencode(data):
> > > > +            chunk =3D chunk.encode("utf-8")
> > > > +            f.write(chunk)
> > > > +            sha1.update(chunk)
> > > > +
> > > > +        return sha1.hexdigest()
> > > > +
> > > > +
> > > > +class JSONLDInlineEncoder(Encoder):
> > > > +    def __init__(self, f, sha1):
> > > > +        self.f =3D f
> > > > +        self.comma =3D False
> > > > +        self.sha1 =3D sha1
> > > > +
> > > > +    def write(self, s):
> > > > +        s =3D s.encode("utf-8")
> > > > +        self.f.write(s)
> > > > +        self.sha1.update(s)
> > > > +
> > > > +    def _write_comma(self):
> > > > +        if self.comma:
> > > > +            self.write(",")
> > > > +            self.comma =3D False
> > > > +
> > > > +    def write_string(self, v):
> > > > +        self.write(json.dumps(v))
> > > > +
> > > > +    def write_datetime(self, v):
> > > > +        self.write_string(v)
> > > > +
> > > > +    def write_integer(self, v):
> > > > +        self.write(f"{v}")
> > > > +
> > > > +    def write_iri(self, v, compact=3DNone):
> > > > +        self.write_string(compact or v)
> > > > +
> > > > +    def write_enum(self, v, e, compact=3DNone):
> > > > +        self.write_iri(v, compact)
> > > > +
> > > > +    def write_bool(self, v):
> > > > +        if v:
> > > > +            self.write("true")
> > > > +        else:
> > > > +            self.write("false")
> > > > +
> > > > +    def write_float(self, v):
> > > > +        self.write(json.dumps(str(v)))
> > > > +
> > > > +    @contextmanager
> > > > +    def write_property(self, iri, compact=3DNone):
> > > > +        self._write_comma()
> > > > +        self.write_string(compact or iri)
> > > > +        self.write(":")
> > > > +        yield self
> > > > +        self.comma =3D True
> > > > +
> > > > +    @contextmanager
> > > > +    def write_object(self, o, _id, needs_id):
> > > > +        self._write_comma()
> > > > +
> > > > +        self.write("{")
> > > > +        self.write_string("type")
> > > > +        self.write(":")
> > > > +        self.write_string(o.COMPACT_TYPE or o.TYPE)
> > > > +        self.comma =3D True
> > > > +
> > > > +        if needs_id:
> > > > +            self._write_comma()
> > > > +            self.write_string(o.ID_ALIAS or "@id")
> > > > +            self.write(":")
> > > > +            self.write_string(_id)
> > > > +            self.comma =3D True
> > > > +
> > > > +        self.comma =3D True
> > > > +        yield self
> > > > +
> > > > +        self.write("}")
> > > > +        self.comma =3D True
> > > > +
> > > > +    @contextmanager
> > > > +    def write_list(self):
> > > > +        self._write_comma()
> > > > +        self.write("[")
> > > > +        yield self.__class__(self.f, self.sha1)
> > > > +        self.write("]")
> > > > +        self.comma =3D True
> > > > +
> > > > +    @contextmanager
> > > > +    def write_list_item(self):
> > > > +        self._write_comma()
> > > > +        yield self.__class__(self.f, self.sha1)
> > > > +        self.comma =3D True
> > > > +
> > > > +
> > > > +class JSONLDInlineSerializer(object):
> > > > +    def write(
> > > > +        self,
> > > > +        objectset: SHACLObjectSet,
> > > > +        f,
> > > > +        force_at_graph=3DFalse,
> > > > +    ):
> > > > +        """
> > > > +        Write a SHACLObjectSet to a JSON LD file
> > > > +
> > > > +        Note: force_at_graph is included for compatibility, but ig=
nored. This
> > > > +        serializer always writes out a graph
> > > > +        """
> > > > +        sha1 =3D hashlib.sha1()
> > > > +        h =3D JSONLDInlineEncoder(f, sha1)
> > > > +        h.write('{"@context":')
> > > > +        if len(CONTEXT_URLS) =3D=3D 1:
> > > > +            h.write(f'"{CONTEXT_URLS[0]}"')
> > > > +        elif CONTEXT_URLS:
> > > > +            h.write('["')
> > > > +            h.write('","'.join(CONTEXT_URLS))
> > > > +            h.write('"]')
> > > > +        h.write(",")
> > > > +
> > > > +        h.write('"@graph":')
> > > > +
> > > > +        objectset.encode(h, True)
> > > > +        h.write("}")
> > > > +        return sha1.hexdigest()
> > > > +
> > > > +
> > > > +def print_tree(objects, all_fields=3DFalse):
> > > > +    """
> > > > +    Print object tree
> > > > +    """
> > > > +    seen =3D set()
> > > > +
> > > > +    def callback(value, path):
> > > > +        nonlocal seen
> > > > +
> > > > +        s =3D ("  " * (len(path) - 1)) + f"{path[-1]}"
> > > > +        if isinstance(value, SHACLObject):
> > > > +            s +=3D f" {value} ({id(value)})"
> > > > +            is_empty =3D False
> > > > +        elif isinstance(value, ListProxy):
> > > > +            is_empty =3D len(value) =3D=3D 0
> > > > +            if is_empty:
> > > > +                s +=3D " []"
> > > > +        else:
> > > > +            s +=3D f" {value!r}"
> > > > +            is_empty =3D value is None
> > > > +
> > > > +        if all_fields or not is_empty:
> > > > +            print(s)
> > > > +
> > > > +        if isinstance(value, SHACLObject):
> > > > +            if value in seen:
> > > > +                return False
> > > > +            seen.add(value)
> > > > +            return True
> > > > +
> > > > +        return True
> > > > +
> > > > +    for o in objects:
> > > > +        o.walk(callback)
> > > > +
> > > > +
> > > > +# fmt: off
> > > > +"""Format Guard"""
> > > > +
> > > > +
> > > > +CONTEXT_URLS =3D [
> > > > +    "https://spdx.org/rdf/3.0.1/spdx-context.jsonld",
> > > > +]
> > > > +
> > > > +
> > > > +# CLASSES
> > > > +# A class for describing the energy consumption incurred by an AI =
model in
> > > > +# different stages of its lifecycle.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/AI/EnergyConsumption",=
 compact_type=3D"ai_EnergyConsumption", abstract=3DFalse)
> > > > +class ai_EnergyConsumption(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Specifies the amount of energy consumed when finetuning =
the AI model that is
> > > > +        # being used in the AI system.
> > > > +        cls._add_property(
> > > > +            "ai_finetuningEnergyConsumption",
> > > > +            ListProp(ObjectProp(ai_EnergyConsumptionDescription, F=
alse)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/finetuningE=
nergyConsumption",
> > > > +            compact=3D"ai_finetuningEnergyConsumption",
> > > > +        )
> > > > +        # Specifies the amount of energy consumed during inference=
 time by an AI model
> > > > +        # that is being used in the AI system.
> > > > +        cls._add_property(
> > > > +            "ai_inferenceEnergyConsumption",
> > > > +            ListProp(ObjectProp(ai_EnergyConsumptionDescription, F=
alse)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/inferenceEn=
ergyConsumption",
> > > > +            compact=3D"ai_inferenceEnergyConsumption",
> > > > +        )
> > > > +        # Specifies the amount of energy consumed when training th=
e AI model that is
> > > > +        # being used in the AI system.
> > > > +        cls._add_property(
> > > > +            "ai_trainingEnergyConsumption",
> > > > +            ListProp(ObjectProp(ai_EnergyConsumptionDescription, F=
alse)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/trainingEne=
rgyConsumption",
> > > > +            compact=3D"ai_trainingEnergyConsumption",
> > > > +        )
> > > > +
> > > > +
> > > > +# The class that helps note down the quantity of energy consumptio=
n and the unit
> > > > +# used for measurement.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/AI/EnergyConsumptionDe=
scription", compact_type=3D"ai_EnergyConsumptionDescription", abstract=3DFa=
lse)
> > > > +class ai_EnergyConsumptionDescription(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Represents the energy quantity.
> > > > +        cls._add_property(
> > > > +            "ai_energyQuantity",
> > > > +            FloatProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/energyQuant=
ity",
> > > > +            min_count=3D1,
> > > > +            compact=3D"ai_energyQuantity",
> > > > +        )
> > > > +        # Specifies the unit in which energy is measured.
> > > > +        cls._add_property(
> > > > +            "ai_energyUnit",
> > > > +            EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/AI/EnergyUn=
itType/kilowattHour", "kilowattHour"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/AI/EnergyUn=
itType/megajoule", "megajoule"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/AI/EnergyUn=
itType/other", "other"),
> > > > +                ]),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/energyUnit",
> > > > +            min_count=3D1,
> > > > +            compact=3D"ai_energyUnit",
> > > > +        )
> > > > +
> > > > +
> > > > +# Specifies the unit of energy consumption.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/AI/EnergyUnitType", co=
mpact_type=3D"ai_EnergyUnitType", abstract=3DFalse)
> > > > +class ai_EnergyUnitType(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "kilowattHour": "https://spdx.org/rdf/3.0.1/terms/AI/Energ=
yUnitType/kilowattHour",
> > > > +        "megajoule": "https://spdx.org/rdf/3.0.1/terms/AI/EnergyUn=
itType/megajoule",
> > > > +        "other": "https://spdx.org/rdf/3.0.1/terms/AI/EnergyUnitTy=
pe/other",
> > > > +    }
> > > > +    # Kilowatt-hour.
> > > > +    kilowattHour =3D "https://spdx.org/rdf/3.0.1/terms/AI/EnergyUn=
itType/kilowattHour"
> > > > +    # Megajoule.
> > > > +    megajoule =3D "https://spdx.org/rdf/3.0.1/terms/AI/EnergyUnitT=
ype/megajoule"
> > > > +    # Any other units of energy measurement.
> > > > +    other =3D "https://spdx.org/rdf/3.0.1/terms/AI/EnergyUnitType/=
other"
> > > > +
> > > > +
> > > > +# Specifies the safety risk level.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssessmen=
tType", compact_type=3D"ai_SafetyRiskAssessmentType", abstract=3DFalse)
> > > > +class ai_SafetyRiskAssessmentType(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "high": "https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAss=
essmentType/high",
> > > > +        "low": "https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAsse=
ssmentType/low",
> > > > +        "medium": "https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskA=
ssessmentType/medium",
> > > > +        "serious": "https://spdx.org/rdf/3.0.1/terms/AI/SafetyRisk=
AssessmentType/serious",
> > > > +    }
> > > > +    # The second-highest level of risk posed by an AI system.
> > > > +    high =3D "https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssess=
mentType/high"
> > > > +    # Low/no risk is posed by an AI system.
> > > > +    low =3D "https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssessm=
entType/low"
> > > > +    # The third-highest level of risk posed by an AI system.
> > > > +    medium =3D "https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAsse=
ssmentType/medium"
> > > > +    # The highest level of risk posed by an AI system.
> > > > +    serious =3D "https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAss=
essmentType/serious"
> > > > +
> > > > +
> > > > +# Specifies the type of an annotation.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/AnnotationType", =
compact_type=3D"AnnotationType", abstract=3DFalse)
> > > > +class AnnotationType(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "other": "https://spdx.org/rdf/3.0.1/terms/Core/Annotation=
Type/other",
> > > > +        "review": "https://spdx.org/rdf/3.0.1/terms/Core/Annotatio=
nType/review",
> > > > +    }
> > > > +    # Used to store extra information about an Element which is no=
t part of a review (e.g. extra information provided during the creation of =
the Element).
> > > > +    other =3D "https://spdx.org/rdf/3.0.1/terms/Core/AnnotationTyp=
e/other"
> > > > +    # Used when someone reviews the Element.
> > > > +    review =3D "https://spdx.org/rdf/3.0.1/terms/Core/AnnotationTy=
pe/review"
> > > > +
> > > > +
> > > > +# Provides information about the creation of the Element.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/CreationInfo", co=
mpact_type=3D"CreationInfo", abstract=3DFalse)
> > > > +class CreationInfo(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Provide consumers with comments by the creator of the El=
ement about the
> > > > +        # Element.
> > > > +        cls._add_property(
> > > > +            "comment",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/comment",
> > > > +            compact=3D"comment",
> > > > +        )
> > > > +        # Identifies when the Element was originally created.
> > > > +        cls._add_property(
> > > > +            "created",
> > > > +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d=
:\d\d:\d\dZ$",),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/created",
> > > > +            min_count=3D1,
> > > > +            compact=3D"created",
> > > > +        )
> > > > +        # Identifies who or what created the Element.
> > > > +        cls._add_property(
> > > > +            "createdBy",
> > > > +            ListProp(ObjectProp(Agent, False, context=3D[
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOr=
ganization", "SpdxOrganization"),
> > > > +                ],)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/createdBy=
",
> > > > +            min_count=3D1,
> > > > +            compact=3D"createdBy",
> > > > +        )
> > > > +        # Identifies the tooling that was used during the creation=
 of the Element.
> > > > +        cls._add_property(
> > > > +            "createdUsing",
> > > > +            ListProp(ObjectProp(Tool, False)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/createdUs=
ing",
> > > > +            compact=3D"createdUsing",
> > > > +        )
> > > > +        # Provides a reference number that can be used to understa=
nd how to parse and
> > > > +        # interpret an Element.
> > > > +        cls._add_property(
> > > > +            "specVersion",
> > > > +            StringProp(pattern=3Dr"^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0=
|[1-9]\d*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\=
d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$",=
),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/specVersi=
on",
> > > > +            min_count=3D1,
> > > > +            compact=3D"specVersion",
> > > > +        )
> > > > +
> > > > +
> > > > +# A key with an associated value.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/DictionaryEntry",=
 compact_type=3D"DictionaryEntry", abstract=3DFalse)
> > > > +class DictionaryEntry(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # A key used in a generic key-value pair.
> > > > +        cls._add_property(
> > > > +            "key",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/key",
> > > > +            min_count=3D1,
> > > > +            compact=3D"key",
> > > > +        )
> > > > +        # A value used in a generic key-value pair.
> > > > +        cls._add_property(
> > > > +            "value",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/value",
> > > > +            compact=3D"value",
> > > > +        )
> > > > +
> > > > +
> > > > +# Base domain class from which all other SPDX-3.0 domain classes d=
erive.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/Element", compact=
_type=3D"Element", abstract=3DTrue)
> > > > +class Element(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Provide consumers with comments by the creator of the El=
ement about the
> > > > +        # Element.
> > > > +        cls._add_property(
> > > > +            "comment",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/comment",
> > > > +            compact=3D"comment",
> > > > +        )
> > > > +        # Provides information about the creation of the Element.
> > > > +        cls._add_property(
> > > > +            "creationInfo",
> > > > +            ObjectProp(CreationInfo, True),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/creationI=
nfo",
> > > > +            min_count=3D1,
> > > > +            compact=3D"creationInfo",
> > > > +        )
> > > > +        # Provides a detailed description of the Element.
> > > > +        cls._add_property(
> > > > +            "description",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/descripti=
on",
> > > > +            compact=3D"description",
> > > > +        )
> > > > +        # Specifies an Extension characterization of some aspect o=
f an Element.
> > > > +        cls._add_property(
> > > > +            "extension",
> > > > +            ListProp(ObjectProp(extension_Extension, False)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/extension=
",
> > > > +            compact=3D"extension",
> > > > +        )
> > > > +        # Provides a reference to a resource outside the scope of =
SPDX-3.0 content
> > > > +        # that uniquely identifies an Element.
> > > > +        cls._add_property(
> > > > +            "externalIdentifier",
> > > > +            ListProp(ObjectProp(ExternalIdentifier, False)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/externalI=
dentifier",
> > > > +            compact=3D"externalIdentifier",
> > > > +        )
> > > > +        # Points to a resource outside the scope of the SPDX-3.0 c=
ontent
> > > > +        # that provides additional characteristics of an Element.
> > > > +        cls._add_property(
> > > > +            "externalRef",
> > > > +            ListProp(ObjectProp(ExternalRef, False)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/externalR=
ef",
> > > > +            compact=3D"externalRef",
> > > > +        )
> > > > +        # Identifies the name of an Element as designated by the c=
reator.
> > > > +        cls._add_property(
> > > > +            "name",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/name",
> > > > +            compact=3D"name",
> > > > +        )
> > > > +        # A short description of an Element.
> > > > +        cls._add_property(
> > > > +            "summary",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/summary",
> > > > +            compact=3D"summary",
> > > > +        )
> > > > +        # Provides an IntegrityMethod with which the integrity of =
an Element can be
> > > > +        # asserted.
> > > > +        cls._add_property(
> > > > +            "verifiedUsing",
> > > > +            ListProp(ObjectProp(IntegrityMethod, False)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/verifiedU=
sing",
> > > > +            compact=3D"verifiedUsing",
> > > > +        )
> > > > +
> > > > +
> > > > +# A collection of Elements, not necessarily with unifying context.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/ElementCollection=
", compact_type=3D"ElementCollection", abstract=3DTrue)
> > > > +class ElementCollection(Element):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Refers to one or more Elements that are part of an Eleme=
ntCollection.
> > > > +        cls._add_property(
> > > > +            "element",
> > > > +            ListProp(ObjectProp(Element, False, context=3D[
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoneEl=
ement", "NoneElement"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLic=
ensing/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLic=
ensing/NoneLicense", "expandedlicensing_NoneLicense"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOr=
ganization", "SpdxOrganization"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoAsse=
rtionElement", "NoAssertionElement"),
> > > > +                ],)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/element",
> > > > +            compact=3D"element",
> > > > +        )
> > > > +        # Describes one a profile which the creator of this Elemen=
tCollection intends to
> > > > +        # conform to.
> > > > +        cls._add_property(
> > > > +            "profileConformance",
> > > > +            ListProp(EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Profil=
eIdentifierType/ai", "ai"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Profil=
eIdentifierType/build", "build"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Profil=
eIdentifierType/core", "core"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Profil=
eIdentifierType/dataset", "dataset"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Profil=
eIdentifierType/expandedLicensing", "expandedLicensing"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Profil=
eIdentifierType/extension", "extension"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Profil=
eIdentifierType/lite", "lite"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Profil=
eIdentifierType/security", "security"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Profil=
eIdentifierType/simpleLicensing", "simpleLicensing"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Profil=
eIdentifierType/software", "software"),
> > > > +                ])),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/profileCo=
nformance",
> > > > +            compact=3D"profileConformance",
> > > > +        )
> > > > +        # This property is used to denote the root Element(s) of a=
 tree of elements contained in a BOM.
> > > > +        cls._add_property(
> > > > +            "rootElement",
> > > > +            ListProp(ObjectProp(Element, False, context=3D[
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoneEl=
ement", "NoneElement"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLic=
ensing/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLic=
ensing/NoneLicense", "expandedlicensing_NoneLicense"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOr=
ganization", "SpdxOrganization"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoAsse=
rtionElement", "NoAssertionElement"),
> > > > +                ],)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/rootEleme=
nt",
> > > > +            compact=3D"rootElement",
> > > > +        )
> > > > +
> > > > +
> > > > +# A reference to a resource identifier defined outside the scope o=
f SPDX-3.0 content that uniquely identifies an Element.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifie=
r", compact_type=3D"ExternalIdentifier", abstract=3DFalse)
> > > > +class ExternalIdentifier(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Provide consumers with comments by the creator of the El=
ement about the
> > > > +        # Element.
> > > > +        cls._add_property(
> > > > +            "comment",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/comment",
> > > > +            compact=3D"comment",
> > > > +        )
> > > > +        # Specifies the type of the external identifier.
> > > > +        cls._add_property(
> > > > +            "externalIdentifierType",
> > > > +            EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alIdentifierType/cpe22", "cpe22"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alIdentifierType/cpe23", "cpe23"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alIdentifierType/cve", "cve"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alIdentifierType/email", "email"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alIdentifierType/gitoid", "gitoid"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alIdentifierType/other", "other"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alIdentifierType/packageUrl", "packageUrl"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alIdentifierType/securityOther", "securityOther"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alIdentifierType/swhid", "swhid"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alIdentifierType/swid", "swid"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alIdentifierType/urlScheme", "urlScheme"),
> > > > +                ]),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/externalI=
dentifierType",
> > > > +            min_count=3D1,
> > > > +            compact=3D"externalIdentifierType",
> > > > +        )
> > > > +        # Uniquely identifies an external element.
> > > > +        cls._add_property(
> > > > +            "identifier",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/identifie=
r",
> > > > +            min_count=3D1,
> > > > +            compact=3D"identifier",
> > > > +        )
> > > > +        # Provides the location for more information regarding an =
external identifier.
> > > > +        cls._add_property(
> > > > +            "identifierLocator",
> > > > +            ListProp(AnyURIProp()),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/identifie=
rLocator",
> > > > +            compact=3D"identifierLocator",
> > > > +        )
> > > > +        # An entity that is authorized to issue identification cre=
dentials.
> > > > +        cls._add_property(
> > > > +            "issuingAuthority",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/issuingAu=
thority",
> > > > +            compact=3D"issuingAuthority",
> > > > +        )
> > > > +
> > > > +
> > > > +# Specifies the type of an external identifier.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifie=
rType", compact_type=3D"ExternalIdentifierType", abstract=3DFalse)
> > > > +class ExternalIdentifierType(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "cpe22": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalId=
entifierType/cpe22",
> > > > +        "cpe23": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalId=
entifierType/cpe23",
> > > > +        "cve": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIden=
tifierType/cve",
> > > > +        "email": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalId=
entifierType/email",
> > > > +        "gitoid": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalI=
dentifierType/gitoid",
> > > > +        "other": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalId=
entifierType/other",
> > > > +        "packageUrl": "https://spdx.org/rdf/3.0.1/terms/Core/Exter=
nalIdentifierType/packageUrl",
> > > > +        "securityOther": "https://spdx.org/rdf/3.0.1/terms/Core/Ex=
ternalIdentifierType/securityOther",
> > > > +        "swhid": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalId=
entifierType/swhid",
> > > > +        "swid": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIde=
ntifierType/swid",
> > > > +        "urlScheme": "https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alIdentifierType/urlScheme",
> > > > +    }
> > > > +    # [Common Platform Enumeration Specification 2.2](https://cpe.=
mitre.org/files/cpe-specification_2.2.pdf)
> > > > +    cpe22 =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdent=
ifierType/cpe22"
> > > > +    # [Common Platform Enumeration: Naming Specification Version 2=
=2E3](https://csrc.nist.gov/publications/detail/nistir/7695/final)
> > > > +    cpe23 =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdent=
ifierType/cpe23"
> > > > +    # Common Vulnerabilities and Exposures identifiers, an identif=
ier for a specific software flaw defined within the official CVE Dictionary=
 and that conforms to the [CVE specification](https://csrc.nist.gov/glossar=
y/term/cve_id).
> > > > +    cve =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentif=
ierType/cve"
> > > > +    # Email address, as defined in [RFC 3696](https://datatracker.=
ietf.org/doc/rfc3986/) Section 3.
> > > > +    email =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdent=
ifierType/email"
> > > > +    # [Gitoid](https://www.iana.org/assignments/uri-schemes/prov/g=
itoid), stands for [Git Object ID](https://git-scm.com/book/en/v2/Git-Inter=
nals-Git-Objects). A gitoid of type blob is a unique hash of a binary artif=
act. A gitoid may represent either an [Artifact Identifier](https://github.=
com/omnibor/spec/blob/eb1ee5c961c16215eb8709b2975d193a2007a35d/spec/SPEC.md=
#artifact-identifier-types) for the software artifact or an [Input Manifest=
 Identifier](https://github.com/omnibor/spec/blob/eb1ee5c961c16215eb8709b29=
75d193a2007a35d/spec/SPEC.md#input-manifest-identifier) for the software ar=
tifact's associated [Artifact Input Manifest](https://github.com/omnibor/sp=
ec/blob/eb1ee5c961c16215eb8709b2975d193a2007a35d/spec/SPEC.md#artifact-inpu=
t-manifest); this ambiguity exists because the Artifact Input Manifest is i=
tself an artifact, and the gitoid of that artifact is its valid identifier.=
 Gitoids calculated on software artifacts (Snippet, File, or Package Elemen=
ts) should be recorded in the SPDX 3.0 SoftwareArtifact's contentIdentifier=
 property. Gitoids calculated on the Artifact Input Manifest (Input Manifes=
t Identifier) should be recorded in the SPDX 3.0 Element's externalIdentifi=
er property. See [OmniBOR Specification](https://github.com/omnibor/spec/),=
 a minimalistic specification for describing software [Artifact Dependency =
Graphs](https://github.com/omnibor/spec/blob/eb1ee5c961c16215eb8709b2975d19=
3a2007a35d/spec/SPEC.md#artifact-dependency-graph-adg).
> > > > +    gitoid =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIden=
tifierType/gitoid"
> > > > +    # Used when the type does not match any of the other options.
> > > > +    other =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdent=
ifierType/other"
> > > > +    # Package URL, as defined in the corresponding [Annex](../../.=
=2E/annexes/pkg-url-specification.md) of this specification.
> > > > +    packageUrl =3D "https://spdx.org/rdf/3.0.1/terms/Core/External=
IdentifierType/packageUrl"
> > > > +    # Used when there is a security related identifier of unspecif=
ied type.
> > > > +    securityOther =3D "https://spdx.org/rdf/3.0.1/terms/Core/Exter=
nalIdentifierType/securityOther"
> > > > +    # SoftWare Hash IDentifier, a persistent intrinsic identifier =
for digital artifacts, such as files, trees (also known as directories or f=
olders), commits, and other objects typically found in version control syst=
ems. The format of the identifiers is defined in the [SWHID specification](=
https://www.swhid.org/specification/v1.1/4.Syntax) (ISO/IEC DIS 18670). The=
y typically look like `swh:1:cnt:94a9ed024d3859793618152ea559a168bbcbb5e2`.
> > > > +    swhid =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdent=
ifierType/swhid"
> > > > +    # Concise Software Identification (CoSWID) tag, as defined in =
[RFC 9393](https://datatracker.ietf.org/doc/rfc9393/) Section 2.3.
> > > > +    swid =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdenti=
fierType/swid"
> > > > +    # [Uniform Resource Identifier (URI) Schemes](https://www.iana=
=2Eorg/assignments/uri-schemes/uri-schemes.xhtml). The scheme used in order=
 to locate a resource.
> > > > +    urlScheme =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalI=
dentifierType/urlScheme"
> > > > +
> > > > +
> > > > +# A map of Element identifiers that are used within an SpdxDocumen=
t but defined
> > > > +# external to that SpdxDocument.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/ExternalMap", com=
pact_type=3D"ExternalMap", abstract=3DFalse)
> > > > +class ExternalMap(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Artifact representing a serialization instance of SPDX d=
ata containing the
> > > > +        # definition of a particular Element.
> > > > +        cls._add_property(
> > > > +            "definingArtifact",
> > > > +            ObjectProp(Artifact, False),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/definingA=
rtifact",
> > > > +            compact=3D"definingArtifact",
> > > > +        )
> > > > +        # Identifies an external Element used within an SpdxDocume=
nt but defined
> > > > +        # external to that SpdxDocument.
> > > > +        cls._add_property(
> > > > +            "externalSpdxId",
> > > > +            AnyURIProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/externalS=
pdxId",
> > > > +            min_count=3D1,
> > > > +            compact=3D"externalSpdxId",
> > > > +        )
> > > > +        # Provides an indication of where to retrieve an external =
Element.
> > > > +        cls._add_property(
> > > > +            "locationHint",
> > > > +            AnyURIProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/locationH=
int",
> > > > +            compact=3D"locationHint",
> > > > +        )
> > > > +        # Provides an IntegrityMethod with which the integrity of =
an Element can be
> > > > +        # asserted.
> > > > +        cls._add_property(
> > > > +            "verifiedUsing",
> > > > +            ListProp(ObjectProp(IntegrityMethod, False)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/verifiedU=
sing",
> > > > +            compact=3D"verifiedUsing",
> > > > +        )
> > > > +
> > > > +
> > > > +# A reference to a resource outside the scope of SPDX-3.0 content =
related to an Element.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRef", com=
pact_type=3D"ExternalRef", abstract=3DFalse)
> > > > +class ExternalRef(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Provide consumers with comments by the creator of the El=
ement about the
> > > > +        # Element.
> > > > +        cls._add_property(
> > > > +            "comment",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/comment",
> > > > +            compact=3D"comment",
> > > > +        )
> > > > +        # Provides information about the content type of an Elemen=
t or a Property.
> > > > +        cls._add_property(
> > > > +            "contentType",
> > > > +            StringProp(pattern=3Dr"^[^\/]+\/[^\/]+$",),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/contentTy=
pe",
> > > > +            compact=3D"contentType",
> > > > +        )
> > > > +        # Specifies the type of the external reference.
> > > > +        cls._add_property(
> > > > +            "externalRefType",
> > > > +            EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/altDownloadLocation", "altDownloadLocation"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/altWebPage", "altWebPage"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/binaryArtifact", "binaryArtifact"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/bower", "bower"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/buildMeta", "buildMeta"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/buildSystem", "buildSystem"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/certificationReport", "certificationReport"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/chat", "chat"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/componentAnalysisReport", "componentAnalysisReport"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/cwe", "cwe"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/documentation", "documentation"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/dynamicAnalysisReport", "dynamicAnalysisReport"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/eolNotice", "eolNotice"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/exportControlAssessment", "exportControlAssessment"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/funding", "funding"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/issueTracker", "issueTracker"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/license", "license"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/mailingList", "mailingList"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/mavenCentral", "mavenCentral"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/metrics", "metrics"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/npm", "npm"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/nuget", "nuget"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/other", "other"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/privacyAssessment", "privacyAssessment"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/productMetadata", "productMetadata"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/purchaseOrder", "purchaseOrder"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/qualityAssessmentReport", "qualityAssessmentReport"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/releaseHistory", "releaseHistory"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/releaseNotes", "releaseNotes"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/riskAssessment", "riskAssessment"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/runtimeAnalysisReport", "runtimeAnalysisReport"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/secureSoftwareAttestation", "secureSoftwareAttestation"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/securityAdversaryModel", "securityAdversaryModel"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/securityAdvisory", "securityAdvisory"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/securityFix", "securityFix"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/securityOther", "securityOther"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/securityPenTestReport", "securityPenTestReport"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/securityPolicy", "securityPolicy"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/securityThreatModel", "securityThreatModel"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/socialMedia", "socialMedia"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/sourceArtifact", "sourceArtifact"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/staticAnalysisReport", "staticAnalysisReport"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/support", "support"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/vcs", "vcs"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/vulnerabilityDisclosureReport", "vulnerabilityDisclosureReport"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/vulnerabilityExploitabilityAssessment", "vulnerabilityExploitabil=
ityAssessment"),
> > > > +                ]),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/externalR=
efType",
> > > > +            compact=3D"externalRefType",
> > > > +        )
> > > > +        # Provides the location of an external reference.
> > > > +        cls._add_property(
> > > > +            "locator",
> > > > +            ListProp(StringProp()),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/locator",
> > > > +            compact=3D"locator",
> > > > +        )
> > > > +
> > > > +
> > > > +# Specifies the type of an external reference.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType",=
 compact_type=3D"ExternalRefType", abstract=3DFalse)
> > > > +class ExternalRefType(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "altDownloadLocation": "https://spdx.org/rdf/3.0.1/terms/C=
ore/ExternalRefType/altDownloadLocation",
> > > > +        "altWebPage": "https://spdx.org/rdf/3.0.1/terms/Core/Exter=
nalRefType/altWebPage",
> > > > +        "binaryArtifact": "https://spdx.org/rdf/3.0.1/terms/Core/E=
xternalRefType/binaryArtifact",
> > > > +        "bower": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRe=
fType/bower",
> > > > +        "buildMeta": "https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/buildMeta",
> > > > +        "buildSystem": "https://spdx.org/rdf/3.0.1/terms/Core/Exte=
rnalRefType/buildSystem",
> > > > +        "certificationReport": "https://spdx.org/rdf/3.0.1/terms/C=
ore/ExternalRefType/certificationReport",
> > > > +        "chat": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRef=
Type/chat",
> > > > +        "componentAnalysisReport": "https://spdx.org/rdf/3.0.1/ter=
ms/Core/ExternalRefType/componentAnalysisReport",
> > > > +        "cwe": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/cwe",
> > > > +        "documentation": "https://spdx.org/rdf/3.0.1/terms/Core/Ex=
ternalRefType/documentation",
> > > > +        "dynamicAnalysisReport": "https://spdx.org/rdf/3.0.1/terms=
/Core/ExternalRefType/dynamicAnalysisReport",
> > > > +        "eolNotice": "https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/eolNotice",
> > > > +        "exportControlAssessment": "https://spdx.org/rdf/3.0.1/ter=
ms/Core/ExternalRefType/exportControlAssessment",
> > > > +        "funding": "https://spdx.org/rdf/3.0.1/terms/Core/External=
RefType/funding",
> > > > +        "issueTracker": "https://spdx.org/rdf/3.0.1/terms/Core/Ext=
ernalRefType/issueTracker",
> > > > +        "license": "https://spdx.org/rdf/3.0.1/terms/Core/External=
RefType/license",
> > > > +        "mailingList": "https://spdx.org/rdf/3.0.1/terms/Core/Exte=
rnalRefType/mailingList",
> > > > +        "mavenCentral": "https://spdx.org/rdf/3.0.1/terms/Core/Ext=
ernalRefType/mavenCentral",
> > > > +        "metrics": "https://spdx.org/rdf/3.0.1/terms/Core/External=
RefType/metrics",
> > > > +        "npm": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/npm",
> > > > +        "nuget": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRe=
fType/nuget",
> > > > +        "other": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRe=
fType/other",
> > > > +        "privacyAssessment": "https://spdx.org/rdf/3.0.1/terms/Cor=
e/ExternalRefType/privacyAssessment",
> > > > +        "productMetadata": "https://spdx.org/rdf/3.0.1/terms/Core/=
ExternalRefType/productMetadata",
> > > > +        "purchaseOrder": "https://spdx.org/rdf/3.0.1/terms/Core/Ex=
ternalRefType/purchaseOrder",
> > > > +        "qualityAssessmentReport": "https://spdx.org/rdf/3.0.1/ter=
ms/Core/ExternalRefType/qualityAssessmentReport",
> > > > +        "releaseHistory": "https://spdx.org/rdf/3.0.1/terms/Core/E=
xternalRefType/releaseHistory",
> > > > +        "releaseNotes": "https://spdx.org/rdf/3.0.1/terms/Core/Ext=
ernalRefType/releaseNotes",
> > > > +        "riskAssessment": "https://spdx.org/rdf/3.0.1/terms/Core/E=
xternalRefType/riskAssessment",
> > > > +        "runtimeAnalysisReport": "https://spdx.org/rdf/3.0.1/terms=
/Core/ExternalRefType/runtimeAnalysisReport",
> > > > +        "secureSoftwareAttestation": "https://spdx.org/rdf/3.0.1/t=
erms/Core/ExternalRefType/secureSoftwareAttestation",
> > > > +        "securityAdversaryModel": "https://spdx.org/rdf/3.0.1/term=
s/Core/ExternalRefType/securityAdversaryModel",
> > > > +        "securityAdvisory": "https://spdx.org/rdf/3.0.1/terms/Core=
/ExternalRefType/securityAdvisory",
> > > > +        "securityFix": "https://spdx.org/rdf/3.0.1/terms/Core/Exte=
rnalRefType/securityFix",
> > > > +        "securityOther": "https://spdx.org/rdf/3.0.1/terms/Core/Ex=
ternalRefType/securityOther",
> > > > +        "securityPenTestReport": "https://spdx.org/rdf/3.0.1/terms=
/Core/ExternalRefType/securityPenTestReport",
> > > > +        "securityPolicy": "https://spdx.org/rdf/3.0.1/terms/Core/E=
xternalRefType/securityPolicy",
> > > > +        "securityThreatModel": "https://spdx.org/rdf/3.0.1/terms/C=
ore/ExternalRefType/securityThreatModel",
> > > > +        "socialMedia": "https://spdx.org/rdf/3.0.1/terms/Core/Exte=
rnalRefType/socialMedia",
> > > > +        "sourceArtifact": "https://spdx.org/rdf/3.0.1/terms/Core/E=
xternalRefType/sourceArtifact",
> > > > +        "staticAnalysisReport": "https://spdx.org/rdf/3.0.1/terms/=
Core/ExternalRefType/staticAnalysisReport",
> > > > +        "support": "https://spdx.org/rdf/3.0.1/terms/Core/External=
RefType/support",
> > > > +        "vcs": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/vcs",
> > > > +        "vulnerabilityDisclosureReport": "https://spdx.org/rdf/3.0=
=2E1/terms/Core/ExternalRefType/vulnerabilityDisclosureReport",
> > > > +        "vulnerabilityExploitabilityAssessment": "https://spdx.org=
/rdf/3.0.1/terms/Core/ExternalRefType/vulnerabilityExploitabilityAssessment=
",
> > > > +    }
> > > > +    # A reference to an alternative download location.
> > > > +    altDownloadLocation =3D "https://spdx.org/rdf/3.0.1/terms/Core=
/ExternalRefType/altDownloadLocation"
> > > > +    # A reference to an alternative web page.
> > > > +    altWebPage =3D "https://spdx.org/rdf/3.0.1/terms/Core/External=
RefType/altWebPage"
> > > > +    # A reference to binary artifacts related to a package.
> > > > +    binaryArtifact =3D "https://spdx.org/rdf/3.0.1/terms/Core/Exte=
rnalRefType/binaryArtifact"
> > > > +    # A reference to a Bower package. The package locator format, =
looks like `package#version`, is defined in the "install" section of [Bower=
 API documentation](https://bower.io/docs/api/#install).
> > > > +    bower =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTy=
pe/bower"
> > > > +    # A reference build metadata related to a published package.
> > > > +    buildMeta =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalR=
efType/buildMeta"
> > > > +    # A reference build system used to create or publish the packa=
ge.
> > > > +    buildSystem =3D "https://spdx.org/rdf/3.0.1/terms/Core/Externa=
lRefType/buildSystem"
> > > > +    # A reference to a certification report for a package from an =
accredited/independent body.
> > > > +    certificationReport =3D "https://spdx.org/rdf/3.0.1/terms/Core=
/ExternalRefType/certificationReport"
> > > > +    # A reference to the instant messaging system used by the main=
tainer for a package.
> > > > +    chat =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/chat"
> > > > +    # A reference to a Software Composition Analysis (SCA) report.
> > > > +    componentAnalysisReport =3D "https://spdx.org/rdf/3.0.1/terms/=
Core/ExternalRefType/componentAnalysisReport"
> > > > +    # [Common Weakness Enumeration](https://csrc.nist.gov/glossary=
/term/common_weakness_enumeration). A reference to a source of software fla=
w defined within the official [CWE List](https://cwe.mitre.org/data/) that =
conforms to the [CWE specification](https://cwe.mitre.org/).
> > > > +    cwe =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType=
/cwe"
> > > > +    # A reference to the documentation for a package.
> > > > +    documentation =3D "https://spdx.org/rdf/3.0.1/terms/Core/Exter=
nalRefType/documentation"
> > > > +    # A reference to a dynamic analysis report for a package.
> > > > +    dynamicAnalysisReport =3D "https://spdx.org/rdf/3.0.1/terms/Co=
re/ExternalRefType/dynamicAnalysisReport"
> > > > +    # A reference to the End Of Sale (EOS) and/or End Of Life (EOL=
) information related to a package.
> > > > +    eolNotice =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalR=
efType/eolNotice"
> > > > +    # A reference to a export control assessment for a package.
> > > > +    exportControlAssessment =3D "https://spdx.org/rdf/3.0.1/terms/=
Core/ExternalRefType/exportControlAssessment"
> > > > +    # A reference to funding information related to a package.
> > > > +    funding =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRef=
Type/funding"
> > > > +    # A reference to the issue tracker for a package.
> > > > +    issueTracker =3D "https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/issueTracker"
> > > > +    # A reference to additional license information related to an =
artifact.
> > > > +    license =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRef=
Type/license"
> > > > +    # A reference to the mailing list used by the maintainer for a=
 package.
> > > > +    mailingList =3D "https://spdx.org/rdf/3.0.1/terms/Core/Externa=
lRefType/mailingList"
> > > > +    # A reference to a Maven repository artifact. The artifact loc=
ator format is defined in the [Maven documentation](https://maven.apache.or=
g/guides/mini/guide-naming-conventions.html) and looks like `groupId:artifa=
ctId[:version]`.
> > > > +    mavenCentral =3D "https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/mavenCentral"
> > > > +    # A reference to metrics related to package such as OpenSSF sc=
orecards.
> > > > +    metrics =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRef=
Type/metrics"
> > > > +    # A reference to an npm package. The package locator format is=
 defined in the [npm documentation](https://docs.npmjs.com/cli/v10/configur=
ing-npm/package-json) and looks like `package@version`.
> > > > +    npm =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType=
/npm"
> > > > +    # A reference to a NuGet package. The package locator format i=
s defined in the [NuGet documentation](https://docs.nuget.org) and looks li=
ke `package/version`.
> > > > +    nuget =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTy=
pe/nuget"
> > > > +    # Used when the type does not match any of the other options.
> > > > +    other =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTy=
pe/other"
> > > > +    # A reference to a privacy assessment for a package.
> > > > +    privacyAssessment =3D "https://spdx.org/rdf/3.0.1/terms/Core/E=
xternalRefType/privacyAssessment"
> > > > +    # A reference to additional product metadata such as reference=
 within organization's product catalog.
> > > > +    productMetadata =3D "https://spdx.org/rdf/3.0.1/terms/Core/Ext=
ernalRefType/productMetadata"
> > > > +    # A reference to a purchase order for a package.
> > > > +    purchaseOrder =3D "https://spdx.org/rdf/3.0.1/terms/Core/Exter=
nalRefType/purchaseOrder"
> > > > +    # A reference to a quality assessment for a package.
> > > > +    qualityAssessmentReport =3D "https://spdx.org/rdf/3.0.1/terms/=
Core/ExternalRefType/qualityAssessmentReport"
> > > > +    # A reference to a published list of releases for a package.
> > > > +    releaseHistory =3D "https://spdx.org/rdf/3.0.1/terms/Core/Exte=
rnalRefType/releaseHistory"
> > > > +    # A reference to the release notes for a package.
> > > > +    releaseNotes =3D "https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/releaseNotes"
> > > > +    # A reference to a risk assessment for a package.
> > > > +    riskAssessment =3D "https://spdx.org/rdf/3.0.1/terms/Core/Exte=
rnalRefType/riskAssessment"
> > > > +    # A reference to a runtime analysis report for a package.
> > > > +    runtimeAnalysisReport =3D "https://spdx.org/rdf/3.0.1/terms/Co=
re/ExternalRefType/runtimeAnalysisReport"
> > > > +    # A reference to information assuring that the software is dev=
eloped using security practices as defined by [NIST SP 800-218 Secure Softw=
are Development Framework (SSDF) Version 1.1](https://csrc.nist.gov/pubs/sp=
/800/218/final) or [CISA Secure Software Development Attestation Form](http=
s://www.cisa.gov/resources-tools/resources/secure-software-development-atte=
station-form).
> > > > +    secureSoftwareAttestation =3D "https://spdx.org/rdf/3.0.1/term=
s/Core/ExternalRefType/secureSoftwareAttestation"
> > > > +    # A reference to the security adversary model for a package.
> > > > +    securityAdversaryModel =3D "https://spdx.org/rdf/3.0.1/terms/C=
ore/ExternalRefType/securityAdversaryModel"
> > > > +    # A reference to a published security advisory (where advisory=
 as defined per [ISO 29147:2018](https://www.iso.org/standard/72311.html)) =
that may affect one or more elements, e.g., vendor advisories or specific N=
VD entries.
> > > > +    securityAdvisory =3D "https://spdx.org/rdf/3.0.1/terms/Core/Ex=
ternalRefType/securityAdvisory"
> > > > +    # A reference to the patch or source code that fixes a vulnera=
bility.
> > > > +    securityFix =3D "https://spdx.org/rdf/3.0.1/terms/Core/Externa=
lRefType/securityFix"
> > > > +    # A reference to related security information of unspecified t=
ype.
> > > > +    securityOther =3D "https://spdx.org/rdf/3.0.1/terms/Core/Exter=
nalRefType/securityOther"
> > > > +    # A reference to a [penetration test](https://en.wikipedia.org=
/wiki/Penetration_test) report for a package.
> > > > +    securityPenTestReport =3D "https://spdx.org/rdf/3.0.1/terms/Co=
re/ExternalRefType/securityPenTestReport"
> > > > +    # A reference to instructions for reporting newly discovered s=
ecurity vulnerabilities for a package.
> > > > +    securityPolicy =3D "https://spdx.org/rdf/3.0.1/terms/Core/Exte=
rnalRefType/securityPolicy"
> > > > +    # A reference the [security threat model](https://en.wikipedia=
=2Eorg/wiki/Threat_model) for a package.
> > > > +    securityThreatModel =3D "https://spdx.org/rdf/3.0.1/terms/Core=
/ExternalRefType/securityThreatModel"
> > > > +    # A reference to a social media channel for a package.
> > > > +    socialMedia =3D "https://spdx.org/rdf/3.0.1/terms/Core/Externa=
lRefType/socialMedia"
> > > > +    # A reference to an artifact containing the sources for a pack=
age.
> > > > +    sourceArtifact =3D "https://spdx.org/rdf/3.0.1/terms/Core/Exte=
rnalRefType/sourceArtifact"
> > > > +    # A reference to a static analysis report for a package.
> > > > +    staticAnalysisReport =3D "https://spdx.org/rdf/3.0.1/terms/Cor=
e/ExternalRefType/staticAnalysisReport"
> > > > +    # A reference to the software support channel or other support=
 information for a package.
> > > > +    support =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRef=
Type/support"
> > > > +    # A reference to a version control system related to a softwar=
e artifact.
> > > > +    vcs =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType=
/vcs"
> > > > +    # A reference to a Vulnerability Disclosure Report (VDR) which=
 provides the software supplier's analysis and findings describing the impa=
ct (or lack of impact) that reported vulnerabilities have on packages or pr=
oducts in the supplier's SBOM as defined in [NIST SP 800-161 Cybersecurity =
Supply Chain Risk Management Practices for Systems and Organizations](https=
://csrc.nist.gov/pubs/sp/800/161/r1/final).
> > > > +    vulnerabilityDisclosureReport =3D "https://spdx.org/rdf/3.0.1/=
terms/Core/ExternalRefType/vulnerabilityDisclosureReport"
> > > > +    # A reference to a Vulnerability Exploitability eXchange (VEX)=
 statement which provides information on whether a product is impacted by a=
 specific vulnerability in an included package and, if affected, whether th=
ere are actions recommended to remediate. See also [NTIA VEX one-page summa=
ry](https://ntia.gov/files/ntia/publications/vex_one-page_summary.pdf).
> > > > +    vulnerabilityExploitabilityAssessment =3D "https://spdx.org/rd=
f/3.0.1/terms/Core/ExternalRefType/vulnerabilityExploitabilityAssessment"
> > > > +
> > > > +
> > > > +# A mathematical algorithm that maps data of arbitrary size to a b=
it string.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm", c=
ompact_type=3D"HashAlgorithm", abstract=3DFalse)
> > > > +class HashAlgorithm(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "adler32": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgo=
rithm/adler32",
> > > > +        "blake2b256": "https://spdx.org/rdf/3.0.1/terms/Core/HashA=
lgorithm/blake2b256",
> > > > +        "blake2b384": "https://spdx.org/rdf/3.0.1/terms/Core/HashA=
lgorithm/blake2b384",
> > > > +        "blake2b512": "https://spdx.org/rdf/3.0.1/terms/Core/HashA=
lgorithm/blake2b512",
> > > > +        "blake3": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgor=
ithm/blake3",
> > > > +        "crystalsDilithium": "https://spdx.org/rdf/3.0.1/terms/Cor=
e/HashAlgorithm/crystalsDilithium",
> > > > +        "crystalsKyber": "https://spdx.org/rdf/3.0.1/terms/Core/Ha=
shAlgorithm/crystalsKyber",
> > > > +        "falcon": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgor=
ithm/falcon",
> > > > +        "md2": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/md2",
> > > > +        "md4": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/md4",
> > > > +        "md5": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/md5",
> > > > +        "md6": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/md6",
> > > > +        "other": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgori=
thm/other",
> > > > +        "sha1": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorit=
hm/sha1",
> > > > +        "sha224": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgor=
ithm/sha224",
> > > > +        "sha256": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgor=
ithm/sha256",
> > > > +        "sha384": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgor=
ithm/sha384",
> > > > +        "sha3_224": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlg=
orithm/sha3_224",
> > > > +        "sha3_256": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlg=
orithm/sha3_256",
> > > > +        "sha3_384": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlg=
orithm/sha3_384",
> > > > +        "sha3_512": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlg=
orithm/sha3_512",
> > > > +        "sha512": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgor=
ithm/sha512",
> > > > +    }
> > > > +    # Adler-32 checksum is part of the widely used zlib compressio=
n library as defined in [RFC 1950](https://datatracker.ietf.org/doc/rfc1950=
/) Section 2.3.
> > > > +    adler32 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorit=
hm/adler32"
> > > > +    # BLAKE2b algorithm with a digest size of 256, as defined in [=
RFC 7693](https://datatracker.ietf.org/doc/rfc7693/) Section 4.
> > > > +    blake2b256 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgo=
rithm/blake2b256"
> > > > +    # BLAKE2b algorithm with a digest size of 384, as defined in [=
RFC 7693](https://datatracker.ietf.org/doc/rfc7693/) Section 4.
> > > > +    blake2b384 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgo=
rithm/blake2b384"
> > > > +    # BLAKE2b algorithm with a digest size of 512, as defined in [=
RFC 7693](https://datatracker.ietf.org/doc/rfc7693/) Section 4.
> > > > +    blake2b512 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgo=
rithm/blake2b512"
> > > > +    # [BLAKE3](https://github.com/BLAKE3-team/BLAKE3-specs/blob/ma=
ster/blake3.pdf)
> > > > +    blake3 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/blake3"
> > > > +    # [Dilithium](https://pq-crystals.org/dilithium/)
> > > > +    crystalsDilithium =3D "https://spdx.org/rdf/3.0.1/terms/Core/H=
ashAlgorithm/crystalsDilithium"
> > > > +    # [Kyber](https://pq-crystals.org/kyber/)
> > > > +    crystalsKyber =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashA=
lgorithm/crystalsKyber"
> > > > +    # [FALCON](https://falcon-sign.info/falcon.pdf)
> > > > +    falcon =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/falcon"
> > > > +    # MD2 message-digest algorithm, as defined in [RFC 1319](https=
://datatracker.ietf.org/doc/rfc1319/).
> > > > +    md2 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/m=
d2"
> > > > +    # MD4 message-digest algorithm, as defined in [RFC 1186](https=
://datatracker.ietf.org/doc/rfc1186/).
> > > > +    md4 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/m=
d4"
> > > > +    # MD5 message-digest algorithm, as defined in [RFC 1321](https=
://datatracker.ietf.org/doc/rfc1321/).
> > > > +    md5 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/m=
d5"
> > > > +    # [MD6 hash function](https://people.csail.mit.edu/rivest/pubs=
/RABCx08.pdf)
> > > > +    md6 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/m=
d6"
> > > > +    # any hashing algorithm that does not exist in this list of en=
tries
> > > > +    other =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm=
/other"
> > > > +    # SHA-1, a secure hashing algorithm, as defined in [RFC 3174](=
https://datatracker.ietf.org/doc/rfc3174/).
> > > > +    sha1 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
sha1"
> > > > +    # SHA-2 with a digest length of 224, as defined in [RFC 3874](=
https://datatracker.ietf.org/doc/rfc3874/).
> > > > +    sha224 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/sha224"
> > > > +    # SHA-2 with a digest length of 256, as defined in [RFC 6234](=
https://datatracker.ietf.org/doc/rfc6234/).
> > > > +    sha256 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/sha256"
> > > > +    # SHA-2 with a digest length of 384, as defined in [RFC 6234](=
https://datatracker.ietf.org/doc/rfc6234/).
> > > > +    sha384 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/sha384"
> > > > +    # SHA-3 with a digest length of 224, as defined in [FIPS 202](=
https://csrc.nist.gov/pubs/fips/202/final).
> > > > +    sha3_224 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgori=
thm/sha3_224"
> > > > +    # SHA-3 with a digest length of 256, as defined in [FIPS 202](=
https://csrc.nist.gov/pubs/fips/202/final).
> > > > +    sha3_256 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgori=
thm/sha3_256"
> > > > +    # SHA-3 with a digest length of 384, as defined in [FIPS 202](=
https://csrc.nist.gov/pubs/fips/202/final).
> > > > +    sha3_384 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgori=
thm/sha3_384"
> > > > +    # SHA-3 with a digest length of 512, as defined in [FIPS 202](=
https://csrc.nist.gov/pubs/fips/202/final).
> > > > +    sha3_512 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgori=
thm/sha3_512"
> > > > +    # SHA-2 with a digest length of 512, as defined in [RFC 6234](=
https://datatracker.ietf.org/doc/rfc6234/).
> > > > +    sha512 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/sha512"
> > > > +
> > > > +
> > > > +# A concrete subclass of Element used by Individuals in the
> > > > +# Core profile.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/IndividualElement=
", compact_type=3D"IndividualElement", abstract=3DFalse)
> > > > +class IndividualElement(Element):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "NoAssertionElement": "https://spdx.org/rdf/3.0.1/terms/Co=
re/NoAssertionElement",
> > > > +        "NoneElement": "https://spdx.org/rdf/3.0.1/terms/Core/None=
Element",
> > > > +    }
> > > > +    # An Individual Value for Element representing a set of Elemen=
ts of unknown
> > > > +    # identify or cardinality (number).
> > > > +    NoAssertionElement =3D "https://spdx.org/rdf/3.0.1/terms/Core/=
NoAssertionElement"
> > > > +    # An Individual Value for Element representing a set of Elemen=
ts with
> > > > +    # cardinality (number/count) of zero.
> > > > +    NoneElement =3D "https://spdx.org/rdf/3.0.1/terms/Core/NoneEle=
ment"
> > > > +
> > > > +
> > > > +# Provides an independently reproducible mechanism that permits ve=
rification of a specific Element.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/IntegrityMethod",=
 compact_type=3D"IntegrityMethod", abstract=3DTrue)
> > > > +class IntegrityMethod(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Provide consumers with comments by the creator of the El=
ement about the
> > > > +        # Element.
> > > > +        cls._add_property(
> > > > +            "comment",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/comment",
> > > > +            compact=3D"comment",
> > > > +        )
> > > > +
> > > > +
> > > > +# Provide an enumerated set of lifecycle phases that can provide c=
ontext to relationships.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopeTyp=
e", compact_type=3D"LifecycleScopeType", abstract=3DFalse)
> > > > +class LifecycleScopeType(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "build": "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleS=
copeType/build",
> > > > +        "design": "https://spdx.org/rdf/3.0.1/terms/Core/Lifecycle=
ScopeType/design",
> > > > +        "development": "https://spdx.org/rdf/3.0.1/terms/Core/Life=
cycleScopeType/development",
> > > > +        "other": "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleS=
copeType/other",
> > > > +        "runtime": "https://spdx.org/rdf/3.0.1/terms/Core/Lifecycl=
eScopeType/runtime",
> > > > +        "test": "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleSc=
opeType/test",
> > > > +    }
> > > > +    # A relationship has specific context implications during an e=
lement's build phase, during development.
> > > > +    build =3D "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScop=
eType/build"
> > > > +    # A relationship has specific context implications during an e=
lement's design.
> > > > +    design =3D "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleSco=
peType/design"
> > > > +    # A relationship has specific context implications during deve=
lopment phase of an element.
> > > > +    development =3D "https://spdx.org/rdf/3.0.1/terms/Core/Lifecyc=
leScopeType/development"
> > > > +    # A relationship has other specific context information necess=
ary to capture that the above set of enumerations does not handle.
> > > > +    other =3D "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScop=
eType/other"
> > > > +    # A relationship has specific context implications during the =
execution phase of an element.
> > > > +    runtime =3D "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleSc=
opeType/runtime"
> > > > +    # A relationship has specific context implications during an e=
lement's testing phase, during development.
> > > > +    test =3D "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScope=
Type/test"
> > > > +
> > > > +
> > > > +# A mapping between prefixes and namespace partial URIs.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/NamespaceMap", co=
mpact_type=3D"NamespaceMap", abstract=3DFalse)
> > > > +class NamespaceMap(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Provides an unambiguous mechanism for conveying a URI fr=
agment portion of an
> > > > +        # Element ID.
> > > > +        cls._add_property(
> > > > +            "namespace",
> > > > +            AnyURIProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/namespace=
",
> > > > +            min_count=3D1,
> > > > +            compact=3D"namespace",
> > > > +        )
> > > > +        # A substitute for a URI.
> > > > +        cls._add_property(
> > > > +            "prefix",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/prefix",
> > > > +            min_count=3D1,
> > > > +            compact=3D"prefix",
> > > > +        )
> > > > +
> > > > +
> > > > +# An SPDX version 2.X compatible verification method for software =
packages.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/PackageVerificati=
onCode", compact_type=3D"PackageVerificationCode", abstract=3DFalse)
> > > > +class PackageVerificationCode(IntegrityMethod):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Specifies the algorithm used for calculating the hash va=
lue.
> > > > +        cls._add_property(
> > > > +            "algorithm",
> > > > +            EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/adler32", "adler32"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/blake2b256", "blake2b256"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/blake2b384", "blake2b384"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/blake2b512", "blake2b512"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/blake3", "blake3"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/crystalsDilithium", "crystalsDilithium"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/crystalsKyber", "crystalsKyber"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/falcon", "falcon"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/md2", "md2"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/md4", "md4"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/md5", "md5"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/md6", "md6"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/other", "other"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/sha1", "sha1"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/sha224", "sha224"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/sha256", "sha256"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/sha384", "sha384"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/sha3_224", "sha3_224"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/sha3_256", "sha3_256"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/sha3_384", "sha3_384"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/sha3_512", "sha3_512"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/sha512", "sha512"),
> > > > +                ]),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/algorithm=
",
> > > > +            min_count=3D1,
> > > > +            compact=3D"algorithm",
> > > > +        )
> > > > +        # The result of applying a hash algorithm to an Element.
> > > > +        cls._add_property(
> > > > +            "hashValue",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/hashValue=
",
> > > > +            min_count=3D1,
> > > > +            compact=3D"hashValue",
> > > > +        )
> > > > +        # The relative file name of a file to be excluded from the
> > > > +        # `PackageVerificationCode`.
> > > > +        cls._add_property(
> > > > +            "packageVerificationCodeExcludedFile",
> > > > +            ListProp(StringProp()),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/packageVe=
rificationCodeExcludedFile",
> > > > +            compact=3D"packageVerificationCodeExcludedFile",
> > > > +        )
> > > > +
> > > > +
> > > > +# A tuple of two positive integers that define a range.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/PositiveIntegerRa=
nge", compact_type=3D"PositiveIntegerRange", abstract=3DFalse)
> > > > +class PositiveIntegerRange(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Defines the beginning of a range.
> > > > +        cls._add_property(
> > > > +            "beginIntegerRange",
> > > > +            PositiveIntegerProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/beginInte=
gerRange",
> > > > +            min_count=3D1,
> > > > +            compact=3D"beginIntegerRange",
> > > > +        )
> > > > +        # Defines the end of a range.
> > > > +        cls._add_property(
> > > > +            "endIntegerRange",
> > > > +            PositiveIntegerProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/endIntege=
rRange",
> > > > +            min_count=3D1,
> > > > +            compact=3D"endIntegerRange",
> > > > +        )
> > > > +
> > > > +
> > > > +# Categories of presence or absence.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/PresenceType", co=
mpact_type=3D"PresenceType", abstract=3DFalse)
> > > > +class PresenceType(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "no": "https://spdx.org/rdf/3.0.1/terms/Core/PresenceType/=
no",
> > > > +        "noAssertion": "https://spdx.org/rdf/3.0.1/terms/Core/Pres=
enceType/noAssertion",
> > > > +        "yes": "https://spdx.org/rdf/3.0.1/terms/Core/PresenceType=
/yes",
> > > > +    }
> > > > +    # Indicates absence of the field.
> > > > +    no =3D "https://spdx.org/rdf/3.0.1/terms/Core/PresenceType/no"
> > > > +    # Makes no assertion about the field.
> > > > +    noAssertion =3D "https://spdx.org/rdf/3.0.1/terms/Core/Presenc=
eType/noAssertion"
> > > > +    # Indicates presence of the field.
> > > > +    yes =3D "https://spdx.org/rdf/3.0.1/terms/Core/PresenceType/ye=
s"
> > > > +
> > > > +
> > > > +# Enumeration of the valid profiles.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifier=
Type", compact_type=3D"ProfileIdentifierType", abstract=3DFalse)
> > > > +class ProfileIdentifierType(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "ai": "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdenti=
fierType/ai",
> > > > +        "build": "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIde=
ntifierType/build",
> > > > +        "core": "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIden=
tifierType/core",
> > > > +        "dataset": "https://spdx.org/rdf/3.0.1/terms/Core/ProfileI=
dentifierType/dataset",
> > > > +        "expandedLicensing": "https://spdx.org/rdf/3.0.1/terms/Cor=
e/ProfileIdentifierType/expandedLicensing",
> > > > +        "extension": "https://spdx.org/rdf/3.0.1/terms/Core/Profil=
eIdentifierType/extension",
> > > > +        "lite": "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIden=
tifierType/lite",
> > > > +        "security": "https://spdx.org/rdf/3.0.1/terms/Core/Profile=
IdentifierType/security",
> > > > +        "simpleLicensing": "https://spdx.org/rdf/3.0.1/terms/Core/=
ProfileIdentifierType/simpleLicensing",
> > > > +        "software": "https://spdx.org/rdf/3.0.1/terms/Core/Profile=
IdentifierType/software",
> > > > +    }
> > > > +    # the element follows the AI profile specification
> > > > +    ai =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifie=
rType/ai"
> > > > +    # the element follows the Build profile specification
> > > > +    build =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdenti=
fierType/build"
> > > > +    # the element follows the Core profile specification
> > > > +    core =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentif=
ierType/core"
> > > > +    # the element follows the Dataset profile specification
> > > > +    dataset =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIden=
tifierType/dataset"
> > > > +    # the element follows the ExpandedLicensing profile specificat=
ion
> > > > +    expandedLicensing =3D "https://spdx.org/rdf/3.0.1/terms/Core/P=
rofileIdentifierType/expandedLicensing"
> > > > +    # the element follows the Extension profile specification
> > > > +    extension =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileId=
entifierType/extension"
> > > > +    # the element follows the Lite profile specification
> > > > +    lite =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentif=
ierType/lite"
> > > > +    # the element follows the Security profile specification
> > > > +    security =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIde=
ntifierType/security"
> > > > +    # the element follows the SimpleLicensing profile specification
> > > > +    simpleLicensing =3D "https://spdx.org/rdf/3.0.1/terms/Core/Pro=
fileIdentifierType/simpleLicensing"
> > > > +    # the element follows the Software profile specification
> > > > +    software =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIde=
ntifierType/software"
> > > > +
> > > > +
> > > > +# Describes a relationship between one or more elements.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/Relationship", co=
mpact_type=3D"Relationship", abstract=3DFalse)
> > > > +class Relationship(Element):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Provides information about the completeness of relations=
hips.
> > > > +        cls._add_property(
> > > > +            "completeness",
> > > > +            EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipCompleteness/complete", "complete"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipCompleteness/incomplete", "incomplete"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipCompleteness/noAssertion", "noAssertion"),
> > > > +                ]),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/completen=
ess",
> > > > +            compact=3D"completeness",
> > > > +        )
> > > > +        # Specifies the time from which an element is no longer ap=
plicable / valid.
> > > > +        cls._add_property(
> > > > +            "endTime",
> > > > +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d=
:\d\d:\d\dZ$",),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/endTime",
> > > > +            compact=3D"endTime",
> > > > +        )
> > > > +        # References the Element on the left-hand side of a relati=
onship.
> > > > +        cls._add_property(
> > > > +            "from_",
> > > > +            ObjectProp(Element, True, context=3D[
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoneEl=
ement", "NoneElement"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLic=
ensing/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLic=
ensing/NoneLicense", "expandedlicensing_NoneLicense"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOr=
ganization", "SpdxOrganization"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoAsse=
rtionElement", "NoAssertionElement"),
> > > > +                ],),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/from",
> > > > +            min_count=3D1,
> > > > +            compact=3D"from",
> > > > +        )
> > > > +        # Information about the relationship between two Elements.
> > > > +        cls._add_property(
> > > > +            "relationshipType",
> > > > +            EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/affects", "affects"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/amendedBy", "amendedBy"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/ancestorOf", "ancestorOf"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/availableFrom", "availableFrom"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/configures", "configures"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/contains", "contains"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/coordinatedBy", "coordinatedBy"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/copiedTo", "copiedTo"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/delegatedTo", "delegatedTo"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/dependsOn", "dependsOn"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/descendantOf", "descendantOf"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/describes", "describes"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/doesNotAffect", "doesNotAffect"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/expandsTo", "expandsTo"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/exploitCreatedBy", "exploitCreatedBy"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/fixedBy", "fixedBy"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/fixedIn", "fixedIn"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/foundBy", "foundBy"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/generates", "generates"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasAddedFile", "hasAddedFile"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasAssessmentFor", "hasAssessmentFor"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasAssociatedVulnerability", "hasAssociatedVulnerability"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasConcludedLicense", "hasConcludedLicense"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasDataFile", "hasDataFile"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasDeclaredLicense", "hasDeclaredLicense"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasDeletedFile", "hasDeletedFile"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasDependencyManifest", "hasDependencyManifest"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasDistributionArtifact", "hasDistributionArtifact"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasDocumentation", "hasDocumentation"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasDynamicLink", "hasDynamicLink"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasEvidence", "hasEvidence"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasExample", "hasExample"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasHost", "hasHost"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasInput", "hasInput"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasMetadata", "hasMetadata"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasOptionalComponent", "hasOptionalComponent"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasOptionalDependency", "hasOptionalDependency"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasOutput", "hasOutput"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasPrerequisite", "hasPrerequisite"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasProvidedDependency", "hasProvidedDependency"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasRequirement", "hasRequirement"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasSpecification", "hasSpecification"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasStaticLink", "hasStaticLink"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasTest", "hasTest"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasTestCase", "hasTestCase"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasVariant", "hasVariant"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/invokedBy", "invokedBy"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/modifiedBy", "modifiedBy"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/other", "other"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/packagedBy", "packagedBy"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/patchedBy", "patchedBy"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/publishedBy", "publishedBy"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/reportedBy", "reportedBy"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/republishedBy", "republishedBy"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/serializedInArtifact", "serializedInArtifact"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/testedOn", "testedOn"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/trainedOn", "trainedOn"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/underInvestigationFor", "underInvestigationFor"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/usesTool", "usesTool"),
> > > > +                ]),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/relations=
hipType",
> > > > +            min_count=3D1,
> > > > +            compact=3D"relationshipType",
> > > > +        )
> > > > +        # Specifies the time from which an element is applicable /=
 valid.
> > > > +        cls._add_property(
> > > > +            "startTime",
> > > > +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d=
:\d\d:\d\dZ$",),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/startTime=
",
> > > > +            compact=3D"startTime",
> > > > +        )
> > > > +        # References an Element on the right-hand side of a relati=
onship.
> > > > +        cls._add_property(
> > > > +            "to",
> > > > +            ListProp(ObjectProp(Element, False, context=3D[
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoneEl=
ement", "NoneElement"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLic=
ensing/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLic=
ensing/NoneLicense", "expandedlicensing_NoneLicense"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOr=
ganization", "SpdxOrganization"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoAsse=
rtionElement", "NoAssertionElement"),
> > > > +                ],)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/to",
> > > > +            min_count=3D1,
> > > > +            compact=3D"to",
> > > > +        )
> > > > +
> > > > +
> > > > +# Indicates whether a relationship is known to be complete, incomp=
lete, or if no assertion is made with respect to relationship completeness.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipCompl=
eteness", compact_type=3D"RelationshipCompleteness", abstract=3DFalse)
> > > > +class RelationshipCompleteness(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "complete": "https://spdx.org/rdf/3.0.1/terms/Core/Relatio=
nshipCompleteness/complete",
> > > > +        "incomplete": "https://spdx.org/rdf/3.0.1/terms/Core/Relat=
ionshipCompleteness/incomplete",
> > > > +        "noAssertion": "https://spdx.org/rdf/3.0.1/terms/Core/Rela=
tionshipCompleteness/noAssertion",
> > > > +    }
> > > > +    # The relationship is known to be exhaustive.
> > > > +    complete =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipCompleteness/complete"
> > > > +    # The relationship is known not to be exhaustive.
> > > > +    incomplete =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipCompleteness/incomplete"
> > > > +    # No assertion can be made about the completeness of the relat=
ionship.
> > > > +    noAssertion =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relatio=
nshipCompleteness/noAssertion"
> > > > +
> > > > +
> > > > +# Information about the relationship between two Elements.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType"=
, compact_type=3D"RelationshipType", abstract=3DFalse)
> > > > +class RelationshipType(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "affects": "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipType/affects",
> > > > +        "amendedBy": "https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/amendedBy",
> > > > +        "ancestorOf": "https://spdx.org/rdf/3.0.1/terms/Core/Relat=
ionshipType/ancestorOf",
> > > > +        "availableFrom": "https://spdx.org/rdf/3.0.1/terms/Core/Re=
lationshipType/availableFrom",
> > > > +        "configures": "https://spdx.org/rdf/3.0.1/terms/Core/Relat=
ionshipType/configures",
> > > > +        "contains": "https://spdx.org/rdf/3.0.1/terms/Core/Relatio=
nshipType/contains",
> > > > +        "coordinatedBy": "https://spdx.org/rdf/3.0.1/terms/Core/Re=
lationshipType/coordinatedBy",
> > > > +        "copiedTo": "https://spdx.org/rdf/3.0.1/terms/Core/Relatio=
nshipType/copiedTo",
> > > > +        "delegatedTo": "https://spdx.org/rdf/3.0.1/terms/Core/Rela=
tionshipType/delegatedTo",
> > > > +        "dependsOn": "https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/dependsOn",
> > > > +        "descendantOf": "https://spdx.org/rdf/3.0.1/terms/Core/Rel=
ationshipType/descendantOf",
> > > > +        "describes": "https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/describes",
> > > > +        "doesNotAffect": "https://spdx.org/rdf/3.0.1/terms/Core/Re=
lationshipType/doesNotAffect",
> > > > +        "expandsTo": "https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/expandsTo",
> > > > +        "exploitCreatedBy": "https://spdx.org/rdf/3.0.1/terms/Core=
/RelationshipType/exploitCreatedBy",
> > > > +        "fixedBy": "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipType/fixedBy",
> > > > +        "fixedIn": "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipType/fixedIn",
> > > > +        "foundBy": "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipType/foundBy",
> > > > +        "generates": "https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/generates",
> > > > +        "hasAddedFile": "https://spdx.org/rdf/3.0.1/terms/Core/Rel=
ationshipType/hasAddedFile",
> > > > +        "hasAssessmentFor": "https://spdx.org/rdf/3.0.1/terms/Core=
/RelationshipType/hasAssessmentFor",
> > > > +        "hasAssociatedVulnerability": "https://spdx.org/rdf/3.0.1/=
terms/Core/RelationshipType/hasAssociatedVulnerability",
> > > > +        "hasConcludedLicense": "https://spdx.org/rdf/3.0.1/terms/C=
ore/RelationshipType/hasConcludedLicense",
> > > > +        "hasDataFile": "https://spdx.org/rdf/3.0.1/terms/Core/Rela=
tionshipType/hasDataFile",
> > > > +        "hasDeclaredLicense": "https://spdx.org/rdf/3.0.1/terms/Co=
re/RelationshipType/hasDeclaredLicense",
> > > > +        "hasDeletedFile": "https://spdx.org/rdf/3.0.1/terms/Core/R=
elationshipType/hasDeletedFile",
> > > > +        "hasDependencyManifest": "https://spdx.org/rdf/3.0.1/terms=
/Core/RelationshipType/hasDependencyManifest",
> > > > +        "hasDistributionArtifact": "https://spdx.org/rdf/3.0.1/ter=
ms/Core/RelationshipType/hasDistributionArtifact",
> > > > +        "hasDocumentation": "https://spdx.org/rdf/3.0.1/terms/Core=
/RelationshipType/hasDocumentation",
> > > > +        "hasDynamicLink": "https://spdx.org/rdf/3.0.1/terms/Core/R=
elationshipType/hasDynamicLink",
> > > > +        "hasEvidence": "https://spdx.org/rdf/3.0.1/terms/Core/Rela=
tionshipType/hasEvidence",
> > > > +        "hasExample": "https://spdx.org/rdf/3.0.1/terms/Core/Relat=
ionshipType/hasExample",
> > > > +        "hasHost": "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipType/hasHost",
> > > > +        "hasInput": "https://spdx.org/rdf/3.0.1/terms/Core/Relatio=
nshipType/hasInput",
> > > > +        "hasMetadata": "https://spdx.org/rdf/3.0.1/terms/Core/Rela=
tionshipType/hasMetadata",
> > > > +        "hasOptionalComponent": "https://spdx.org/rdf/3.0.1/terms/=
Core/RelationshipType/hasOptionalComponent",
> > > > +        "hasOptionalDependency": "https://spdx.org/rdf/3.0.1/terms=
/Core/RelationshipType/hasOptionalDependency",
> > > > +        "hasOutput": "https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasOutput",
> > > > +        "hasPrerequisite": "https://spdx.org/rdf/3.0.1/terms/Core/=
RelationshipType/hasPrerequisite",
> > > > +        "hasProvidedDependency": "https://spdx.org/rdf/3.0.1/terms=
/Core/RelationshipType/hasProvidedDependency",
> > > > +        "hasRequirement": "https://spdx.org/rdf/3.0.1/terms/Core/R=
elationshipType/hasRequirement",
> > > > +        "hasSpecification": "https://spdx.org/rdf/3.0.1/terms/Core=
/RelationshipType/hasSpecification",
> > > > +        "hasStaticLink": "https://spdx.org/rdf/3.0.1/terms/Core/Re=
lationshipType/hasStaticLink",
> > > > +        "hasTest": "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipType/hasTest",
> > > > +        "hasTestCase": "https://spdx.org/rdf/3.0.1/terms/Core/Rela=
tionshipType/hasTestCase",
> > > > +        "hasVariant": "https://spdx.org/rdf/3.0.1/terms/Core/Relat=
ionshipType/hasVariant",
> > > > +        "invokedBy": "https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/invokedBy",
> > > > +        "modifiedBy": "https://spdx.org/rdf/3.0.1/terms/Core/Relat=
ionshipType/modifiedBy",
> > > > +        "other": "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipType/other",
> > > > +        "packagedBy": "https://spdx.org/rdf/3.0.1/terms/Core/Relat=
ionshipType/packagedBy",
> > > > +        "patchedBy": "https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/patchedBy",
> > > > +        "publishedBy": "https://spdx.org/rdf/3.0.1/terms/Core/Rela=
tionshipType/publishedBy",
> > > > +        "reportedBy": "https://spdx.org/rdf/3.0.1/terms/Core/Relat=
ionshipType/reportedBy",
> > > > +        "republishedBy": "https://spdx.org/rdf/3.0.1/terms/Core/Re=
lationshipType/republishedBy",
> > > > +        "serializedInArtifact": "https://spdx.org/rdf/3.0.1/terms/=
Core/RelationshipType/serializedInArtifact",
> > > > +        "testedOn": "https://spdx.org/rdf/3.0.1/terms/Core/Relatio=
nshipType/testedOn",
> > > > +        "trainedOn": "https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/trainedOn",
> > > > +        "underInvestigationFor": "https://spdx.org/rdf/3.0.1/terms=
/Core/RelationshipType/underInvestigationFor",
> > > > +        "usesTool": "https://spdx.org/rdf/3.0.1/terms/Core/Relatio=
nshipType/usesTool",
> > > > +    }
> > > > +    # The `from` Vulnerability affects each `to` Element. The use =
of the `affects` type is constrained to `VexAffectedVulnAssessmentRelations=
hip` classed relationships.
> > > > +    affects =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationshi=
pType/affects"
> > > > +    # The `from` Element is amended by each `to` Element.
> > > > +    amendedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relations=
hipType/amendedBy"
> > > > +    # The `from` Element is an ancestor of each `to` Element.
> > > > +    ancestorOf =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipType/ancestorOf"
> > > > +    # The `from` Element is available from the additional supplier=
 described by each `to` Element.
> > > > +    availableFrom =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relat=
ionshipType/availableFrom"
> > > > +    # The `from` Element is a configuration applied to each `to` E=
lement, during a LifecycleScopeType period.
> > > > +    configures =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipType/configures"
> > > > +    # The `from` Element contains each `to` Element.
> > > > +    contains =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipType/contains"
> > > > +    # The `from` Vulnerability is coordinatedBy the `to` Agent(s) =
(vendor, researcher, or consumer agent).
> > > > +    coordinatedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relat=
ionshipType/coordinatedBy"
> > > > +    # The `from` Element has been copied to each `to` Element.
> > > > +    copiedTo =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipType/copiedTo"
> > > > +    # The `from` Agent is delegating an action to the Agent of the=
 `to` Relationship (which must be of type invokedBy), during a LifecycleSco=
peType (e.g. the `to` invokedBy Relationship is being done on behalf of `fr=
om`).
> > > > +    delegatedTo =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relatio=
nshipType/delegatedTo"
> > > > +    # The `from` Element depends on each `to` Element, during a Li=
fecycleScopeType period.
> > > > +    dependsOn =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relations=
hipType/dependsOn"
> > > > +    # The `from` Element is a descendant of each `to` Element.
> > > > +    descendantOf =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/descendantOf"
> > > > +    # The `from` Element describes each `to` Element. To denote th=
e root(s) of a tree of elements in a collection, the rootElement property s=
hould be used.
> > > > +    describes =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relations=
hipType/describes"
> > > > +    # The `from` Vulnerability has no impact on each `to` Element.=
 The use of the `doesNotAffect` is constrained to `VexNotAffectedVulnAssess=
mentRelationship` classed relationships.
> > > > +    doesNotAffect =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relat=
ionshipType/doesNotAffect"
> > > > +    # The `from` archive expands out as an artifact described by e=
ach `to` Element.
> > > > +    expandsTo =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relations=
hipType/expandsTo"
> > > > +    # The `from` Vulnerability has had an exploit created against =
it by each `to` Agent.
> > > > +    exploitCreatedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/Re=
lationshipType/exploitCreatedBy"
> > > > +    # Designates a `from` Vulnerability has been fixed by the `to`=
 Agent(s).
> > > > +    fixedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationshi=
pType/fixedBy"
> > > > +    # A `from` Vulnerability has been fixed in each `to` Element. =
The use of the `fixedIn` type is constrained to `VexFixedVulnAssessmentRela=
tionship` classed relationships.
> > > > +    fixedIn =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationshi=
pType/fixedIn"
> > > > +    # Designates a `from` Vulnerability was originally discovered =
by the `to` Agent(s).
> > > > +    foundBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationshi=
pType/foundBy"
> > > > +    # The `from` Element generates each `to` Element.
> > > > +    generates =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relations=
hipType/generates"
> > > > +    # Every `to` Element is a file added to the `from` Element (`f=
rom` hasAddedFile `to`).
> > > > +    hasAddedFile =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasAddedFile"
> > > > +    # Relates a `from` Vulnerability and each `to` Element with a =
security assessment. To be used with `VulnAssessmentRelationship` types.
> > > > +    hasAssessmentFor =3D "https://spdx.org/rdf/3.0.1/terms/Core/Re=
lationshipType/hasAssessmentFor"
> > > > +    # Used to associate a `from` Artifact with each `to` Vulnerabi=
lity.
> > > > +    hasAssociatedVulnerability =3D "https://spdx.org/rdf/3.0.1/ter=
ms/Core/RelationshipType/hasAssociatedVulnerability"
> > > > +    # The `from` SoftwareArtifact is concluded by the SPDX data cr=
eator to be governed by each `to` license.
> > > > +    hasConcludedLicense =3D "https://spdx.org/rdf/3.0.1/terms/Core=
/RelationshipType/hasConcludedLicense"
> > > > +    # The `from` Element treats each `to` Element as a data file. =
A data file is an artifact that stores data required or optional for the `f=
rom` Element's functionality. A data file can be a database file, an index =
file, a log file, an AI model file, a calibration data file, a temporary fi=
le, a backup file, and more. For AI training dataset, test dataset, test ar=
tifact, configuration data, build input data, and build output data, please=
 consider using the more specific relationship types: `trainedOn`, `testedO=
n`, `hasTest`, `configures`, `hasInput`, and `hasOutput`, respectively. Thi=
s relationship does not imply dependency.
> > > > +    hasDataFile =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relatio=
nshipType/hasDataFile"
> > > > +    # The `from` SoftwareArtifact was discovered to actually conta=
in each `to` license, for example as detected by use of automated tooling.
> > > > +    hasDeclaredLicense =3D "https://spdx.org/rdf/3.0.1/terms/Core/=
RelationshipType/hasDeclaredLicense"
> > > > +    # Every `to` Element is a file deleted from the `from` Element=
 (`from` hasDeletedFile `to`).
> > > > +    hasDeletedFile =3D "https://spdx.org/rdf/3.0.1/terms/Core/Rela=
tionshipType/hasDeletedFile"
> > > > +    # The `from` Element has manifest files that contain dependenc=
y information in each `to` Element.
> > > > +    hasDependencyManifest =3D "https://spdx.org/rdf/3.0.1/terms/Co=
re/RelationshipType/hasDependencyManifest"
> > > > +    # The `from` Element is distributed as an artifact in each `to=
` Element (e.g. an RPM or archive file).
> > > > +    hasDistributionArtifact =3D "https://spdx.org/rdf/3.0.1/terms/=
Core/RelationshipType/hasDistributionArtifact"
> > > > +    # The `from` Element is documented by each `to` Element.
> > > > +    hasDocumentation =3D "https://spdx.org/rdf/3.0.1/terms/Core/Re=
lationshipType/hasDocumentation"
> > > > +    # The `from` Element dynamically links in each `to` Element, d=
uring a LifecycleScopeType period.
> > > > +    hasDynamicLink =3D "https://spdx.org/rdf/3.0.1/terms/Core/Rela=
tionshipType/hasDynamicLink"
> > > > +    # Every `to` Element is considered as evidence for the `from` =
Element (`from` hasEvidence `to`).
> > > > +    hasEvidence =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relatio=
nshipType/hasEvidence"
> > > > +    # Every `to` Element is an example for the `from` Element (`fr=
om` hasExample `to`).
> > > > +    hasExample =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipType/hasExample"
> > > > +    # The `from` Build was run on the `to` Element during a Lifecy=
cleScopeType period (e.g. the host that the build runs on).
> > > > +    hasHost =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationshi=
pType/hasHost"
> > > > +    # The `from` Build has each `to` Element as an input, during a=
 LifecycleScopeType period.
> > > > +    hasInput =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipType/hasInput"
> > > > +    # Every `to` Element is metadata about the `from` Element (`fr=
om` hasMetadata `to`).
> > > > +    hasMetadata =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relatio=
nshipType/hasMetadata"
> > > > +    # Every `to` Element is an optional component of the `from` El=
ement (`from` hasOptionalComponent `to`).
> > > > +    hasOptionalComponent =3D "https://spdx.org/rdf/3.0.1/terms/Cor=
e/RelationshipType/hasOptionalComponent"
> > > > +    # The `from` Element optionally depends on each `to` Element, =
during a LifecycleScopeType period.
> > > > +    hasOptionalDependency =3D "https://spdx.org/rdf/3.0.1/terms/Co=
re/RelationshipType/hasOptionalDependency"
> > > > +    # The `from` Build element generates each `to` Element as an o=
utput, during a LifecycleScopeType period.
> > > > +    hasOutput =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relations=
hipType/hasOutput"
> > > > +    # The `from` Element has a prerequisite on each `to` Element, =
during a LifecycleScopeType period.
> > > > +    hasPrerequisite =3D "https://spdx.org/rdf/3.0.1/terms/Core/Rel=
ationshipType/hasPrerequisite"
> > > > +    # The `from` Element has a dependency on each `to` Element, de=
pendency is not in the distributed artifact, but assumed to be provided, du=
ring a LifecycleScopeType period.
> > > > +    hasProvidedDependency =3D "https://spdx.org/rdf/3.0.1/terms/Co=
re/RelationshipType/hasProvidedDependency"
> > > > +    # The `from` Element has a requirement on each `to` Element, d=
uring a LifecycleScopeType period.
> > > > +    hasRequirement =3D "https://spdx.org/rdf/3.0.1/terms/Core/Rela=
tionshipType/hasRequirement"
> > > > +    # Every `to` Element is a specification for the `from` Element=
 (`from` hasSpecification `to`), during a LifecycleScopeType period.
> > > > +    hasSpecification =3D "https://spdx.org/rdf/3.0.1/terms/Core/Re=
lationshipType/hasSpecification"
> > > > +    # The `from` Element statically links in each `to` Element, du=
ring a LifecycleScopeType period.
> > > > +    hasStaticLink =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relat=
ionshipType/hasStaticLink"
> > > > +    # Every `to` Element is a test artifact for the `from` Element=
 (`from` hasTest `to`), during a LifecycleScopeType period.
> > > > +    hasTest =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationshi=
pType/hasTest"
> > > > +    # Every `to` Element is a test case for the `from` Element (`f=
rom` hasTestCase `to`).
> > > > +    hasTestCase =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relatio=
nshipType/hasTestCase"
> > > > +    # Every `to` Element is a variant the `from` Element (`from` h=
asVariant `to`).
> > > > +    hasVariant =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipType/hasVariant"
> > > > +    # The `from` Element was invoked by the `to` Agent, during a L=
ifecycleScopeType period (for example, a Build element that describes a bui=
ld step).
> > > > +    invokedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relations=
hipType/invokedBy"
> > > > +    # The `from` Element is modified by each `to` Element.
> > > > +    modifiedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipType/modifiedBy"
> > > > +    # Every `to` Element is related to the `from` Element where th=
e relationship type is not described by any of the SPDX relationship types =
(this relationship is directionless).
> > > > +    other =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipT=
ype/other"
> > > > +    # Every `to` Element is a packaged instance of the `from` Elem=
ent (`from` packagedBy `to`).
> > > > +    packagedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipType/packagedBy"
> > > > +    # Every `to` Element is a patch for the `from` Element (`from`=
 patchedBy `to`).
> > > > +    patchedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relations=
hipType/patchedBy"
> > > > +    # Designates a `from` Vulnerability was made available for pub=
lic use or reference by each `to` Agent.
> > > > +    publishedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relatio=
nshipType/publishedBy"
> > > > +    # Designates a `from` Vulnerability was first reported to a pr=
oject, vendor, or tracking database for formal identification by each `to` =
Agent.
> > > > +    reportedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipType/reportedBy"
> > > > +    # Designates a `from` Vulnerability's details were tracked, ag=
gregated, and/or enriched to improve context (i.e. NVD) by each `to` Agent.
> > > > +    republishedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relat=
ionshipType/republishedBy"
> > > > +    # The `from` SpdxDocument can be found in a serialized form in=
 each `to` Artifact.
> > > > +    serializedInArtifact =3D "https://spdx.org/rdf/3.0.1/terms/Cor=
e/RelationshipType/serializedInArtifact"
> > > > +    # The `from` Element has been tested on the `to` Element(s).
> > > > +    testedOn =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipType/testedOn"
> > > > +    # The `from` Element has been trained on the `to` Element(s).
> > > > +    trainedOn =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relations=
hipType/trainedOn"
> > > > +    # The `from` Vulnerability impact is being investigated for ea=
ch `to` Element. The use of the `underInvestigationFor` type is constrained=
 to `VexUnderInvestigationVulnAssessmentRelationship` classed relationships.
> > > > +    underInvestigationFor =3D "https://spdx.org/rdf/3.0.1/terms/Co=
re/RelationshipType/underInvestigationFor"
> > > > +    # The `from` Element uses each `to` Element as a tool, during =
a LifecycleScopeType period.
> > > > +    usesTool =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipType/usesTool"
> > > > +
> > > > +
> > > > +# A collection of SPDX Elements that could potentially be serializ=
ed.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/SpdxDocument", co=
mpact_type=3D"SpdxDocument", abstract=3DFalse)
> > > > +class SpdxDocument(ElementCollection):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Provides the license under which the SPDX documentation =
of the Element can be
> > > > +        # used.
> > > > +        cls._add_property(
> > > > +            "dataLicense",
> > > > +            ObjectProp(simplelicensing_AnyLicenseInfo, False, cont=
ext=3D[
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLic=
ensing/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLic=
ensing/NoneLicense", "expandedlicensing_NoneLicense"),
> > > > +                ],),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/dataLicen=
se",
> > > > +            compact=3D"dataLicense",
> > > > +        )
> > > > +        # Provides an ExternalMap of Element identifiers.
> > > > +        cls._add_property(
> > > > +            "import_",
> > > > +            ListProp(ObjectProp(ExternalMap, False)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/import",
> > > > +            compact=3D"import",
> > > > +        )
> > > > +        # Provides a NamespaceMap of prefixes and associated names=
pace partial URIs applicable to an SpdxDocument and independent of any spec=
ific serialization format or instance.
> > > > +        cls._add_property(
> > > > +            "namespaceMap",
> > > > +            ListProp(ObjectProp(NamespaceMap, False)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/namespace=
Map",
> > > > +            compact=3D"namespaceMap",
> > > > +        )
> > > > +
> > > > +
> > > > +# Indicates the type of support that is associated with an artifac=
t.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/SupportType", com=
pact_type=3D"SupportType", abstract=3DFalse)
> > > > +class SupportType(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "deployed": "https://spdx.org/rdf/3.0.1/terms/Core/Support=
Type/deployed",
> > > > +        "development": "https://spdx.org/rdf/3.0.1/terms/Core/Supp=
ortType/development",
> > > > +        "endOfSupport": "https://spdx.org/rdf/3.0.1/terms/Core/Sup=
portType/endOfSupport",
> > > > +        "limitedSupport": "https://spdx.org/rdf/3.0.1/terms/Core/S=
upportType/limitedSupport",
> > > > +        "noAssertion": "https://spdx.org/rdf/3.0.1/terms/Core/Supp=
ortType/noAssertion",
> > > > +        "noSupport": "https://spdx.org/rdf/3.0.1/terms/Core/Suppor=
tType/noSupport",
> > > > +        "support": "https://spdx.org/rdf/3.0.1/terms/Core/SupportT=
ype/support",
> > > > +    }
> > > > +    # in addition to being supported by the supplier, the software=
 is known to have been deployed and is in use.  For a software as a service=
 provider, this implies the software is now available as a service.
> > > > +    deployed =3D "https://spdx.org/rdf/3.0.1/terms/Core/SupportTyp=
e/deployed"
> > > > +    # the artifact is in active development and is not considered =
ready for formal support from the supplier.
> > > > +    development =3D "https://spdx.org/rdf/3.0.1/terms/Core/Support=
Type/development"
> > > > +    # there is a defined end of support for the artifact from the =
supplier.  This may also be referred to as end of life. There is a validUnt=
ilDate that can be used to signal when support ends for the artifact.
> > > > +    endOfSupport =3D "https://spdx.org/rdf/3.0.1/terms/Core/Suppor=
tType/endOfSupport"
> > > > +    # the artifact has been released, and there is limited support=
 available from the supplier. There is a validUntilDate that can provide ad=
ditional information about the duration of support.
> > > > +    limitedSupport =3D "https://spdx.org/rdf/3.0.1/terms/Core/Supp=
ortType/limitedSupport"
> > > > +    # no assertion about the type of support is made.   This is co=
nsidered the default if no other support type is used.
> > > > +    noAssertion =3D "https://spdx.org/rdf/3.0.1/terms/Core/Support=
Type/noAssertion"
> > > > +    # there is no support for the artifact from the supplier, cons=
umer assumes any support obligations.
> > > > +    noSupport =3D "https://spdx.org/rdf/3.0.1/terms/Core/SupportTy=
pe/noSupport"
> > > > +    # the artifact has been released, and is supported from the su=
pplier.   There is a validUntilDate that can provide additional information=
 about the duration of support.
> > > > +    support =3D "https://spdx.org/rdf/3.0.1/terms/Core/SupportType=
/support"
> > > > +
> > > > +
> > > > +# An element of hardware and/or software utilized to carry out a p=
articular function.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/Tool", compact_ty=
pe=3D"Tool", abstract=3DFalse)
> > > > +class Tool(Element):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +
> > > > +# Categories of confidentiality level.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Dataset/Confidentialit=
yLevelType", compact_type=3D"dataset_ConfidentialityLevelType", abstract=3D=
False)
> > > > +class dataset_ConfidentialityLevelType(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "amber": "https://spdx.org/rdf/3.0.1/terms/Dataset/Confide=
ntialityLevelType/amber",
> > > > +        "clear": "https://spdx.org/rdf/3.0.1/terms/Dataset/Confide=
ntialityLevelType/clear",
> > > > +        "green": "https://spdx.org/rdf/3.0.1/terms/Dataset/Confide=
ntialityLevelType/green",
> > > > +        "red": "https://spdx.org/rdf/3.0.1/terms/Dataset/Confident=
ialityLevelType/red",
> > > > +    }
> > > > +    # Data points in the dataset can be shared only with specific =
organizations and their clients on a need to know basis.
> > > > +    amber =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/Confidenti=
alityLevelType/amber"
> > > > +    # Dataset may be distributed freely, without restriction.
> > > > +    clear =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/Confidenti=
alityLevelType/clear"
> > > > +    # Dataset can be shared within a community of peers and partne=
rs.
> > > > +    green =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/Confidenti=
alityLevelType/green"
> > > > +    # Data points in the dataset are highly confidential and can o=
nly be shared with named recipients.
> > > > +    red =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/Confidential=
ityLevelType/red"
> > > > +
> > > > +
> > > > +# Availability of dataset.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetAvailab=
ilityType", compact_type=3D"dataset_DatasetAvailabilityType", abstract=3DFa=
lse)
> > > > +class dataset_DatasetAvailabilityType(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "clickthrough": "https://spdx.org/rdf/3.0.1/terms/Dataset/=
DatasetAvailabilityType/clickthrough",
> > > > +        "directDownload": "https://spdx.org/rdf/3.0.1/terms/Datase=
t/DatasetAvailabilityType/directDownload",
> > > > +        "query": "https://spdx.org/rdf/3.0.1/terms/Dataset/Dataset=
AvailabilityType/query",
> > > > +        "registration": "https://spdx.org/rdf/3.0.1/terms/Dataset/=
DatasetAvailabilityType/registration",
> > > > +        "scrapingScript": "https://spdx.org/rdf/3.0.1/terms/Datase=
t/DatasetAvailabilityType/scrapingScript",
> > > > +    }
> > > > +    # the dataset is not publicly available and can only be access=
ed after affirmatively accepting terms on a clickthrough webpage.
> > > > +    clickthrough =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/Dat=
asetAvailabilityType/clickthrough"
> > > > +    # the dataset is publicly available and can be downloaded dire=
ctly.
> > > > +    directDownload =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/D=
atasetAvailabilityType/directDownload"
> > > > +    # the dataset is publicly available, but not all at once, and =
can only be accessed through queries which return parts of the dataset.
> > > > +    query =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetAva=
ilabilityType/query"
> > > > +    # the dataset is not publicly available and an email registrat=
ion is required before accessing the dataset, although without an affirmati=
ve acceptance of terms.
> > > > +    registration =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/Dat=
asetAvailabilityType/registration"
> > > > +    # the dataset provider is not making available the underlying =
data and the dataset must be reassembled, typically using the provided scri=
pt for scraping the data.
> > > > +    scrapingScript =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/D=
atasetAvailabilityType/scrapingScript"
> > > > +
> > > > +
> > > > +# Enumeration of dataset types.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType", =
compact_type=3D"dataset_DatasetType", abstract=3DFalse)
> > > > +class dataset_DatasetType(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "audio": "https://spdx.org/rdf/3.0.1/terms/Dataset/Dataset=
Type/audio",
> > > > +        "categorical": "https://spdx.org/rdf/3.0.1/terms/Dataset/D=
atasetType/categorical",
> > > > +        "graph": "https://spdx.org/rdf/3.0.1/terms/Dataset/Dataset=
Type/graph",
> > > > +        "image": "https://spdx.org/rdf/3.0.1/terms/Dataset/Dataset=
Type/image",
> > > > +        "noAssertion": "https://spdx.org/rdf/3.0.1/terms/Dataset/D=
atasetType/noAssertion",
> > > > +        "numeric": "https://spdx.org/rdf/3.0.1/terms/Dataset/Datas=
etType/numeric",
> > > > +        "other": "https://spdx.org/rdf/3.0.1/terms/Dataset/Dataset=
Type/other",
> > > > +        "sensor": "https://spdx.org/rdf/3.0.1/terms/Dataset/Datase=
tType/sensor",
> > > > +        "structured": "https://spdx.org/rdf/3.0.1/terms/Dataset/Da=
tasetType/structured",
> > > > +        "syntactic": "https://spdx.org/rdf/3.0.1/terms/Dataset/Dat=
asetType/syntactic",
> > > > +        "text": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetT=
ype/text",
> > > > +        "timeseries": "https://spdx.org/rdf/3.0.1/terms/Dataset/Da=
tasetType/timeseries",
> > > > +        "timestamp": "https://spdx.org/rdf/3.0.1/terms/Dataset/Dat=
asetType/timestamp",
> > > > +        "video": "https://spdx.org/rdf/3.0.1/terms/Dataset/Dataset=
Type/video",
> > > > +    }
> > > > +    # data is audio based, such as a collection of music from the =
80s.
> > > > +    audio =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTyp=
e/audio"
> > > > +    # data that is classified into a discrete number of categories=
, such as the eye color of a population of people.
> > > > +    categorical =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/Data=
setType/categorical"
> > > > +    # data is in the form of a graph where entries are somehow rel=
ated to each other through edges, such a social network of friends.
> > > > +    graph =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTyp=
e/graph"
> > > > +    # data is a collection of images such as pictures of animals.
> > > > +    image =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTyp=
e/image"
> > > > +    # data type is not known.
> > > > +    noAssertion =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/Data=
setType/noAssertion"
> > > > +    # data consists only of numeric entries.
> > > > +    numeric =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetT=
ype/numeric"
> > > > +    # data is of a type not included in this list.
> > > > +    other =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTyp=
e/other"
> > > > +    # data is recorded from a physical sensor, such as a thermomet=
er reading or biometric device.
> > > > +    sensor =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTy=
pe/sensor"
> > > > +    # data is stored in tabular format or retrieved from a relatio=
nal database.
> > > > +    structured =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/Datas=
etType/structured"
> > > > +    # data describes the syntax or semantics of a language or text=
, such as a parse tree used for natural language processing.
> > > > +    syntactic =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/Datase=
tType/syntactic"
> > > > +    # data consists of unstructured text, such as a book, Wikipedi=
a article (without images), or transcript.
> > > > +    text =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType=
/text"
> > > > +    # data is recorded in an ordered sequence of timestamped entri=
es, such as the price of a stock over the course of a day.
> > > > +    timeseries =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/Datas=
etType/timeseries"
> > > > +    # data is recorded with a timestamp for each entry, but not ne=
cessarily ordered or at specific intervals, such as when a taxi ride starts=
 and ends.
> > > > +    timestamp =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/Datase=
tType/timestamp"
> > > > +    # data is video based, such as a collection of movie clips fea=
turing Tom Hanks.
> > > > +    video =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTyp=
e/video"
> > > > +
> > > > +
> > > > +# Abstract class for additional text intended to be added to a Lic=
ense, but
> > > > +# which is not itself a standalone License.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/Lice=
nseAddition", compact_type=3D"expandedlicensing_LicenseAddition", abstract=
=3DTrue)
> > > > +class expandedlicensing_LicenseAddition(Element):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Identifies the full text of a LicenseAddition.
> > > > +        cls._add_property(
> > > > +            "expandedlicensing_additionText",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicens=
ing/additionText",
> > > > +            min_count=3D1,
> > > > +            compact=3D"expandedlicensing_additionText",
> > > > +        )
> > > > +        # Specifies whether an additional text identifier has been=
 marked as deprecated.
> > > > +        cls._add_property(
> > > > +            "expandedlicensing_isDeprecatedAdditionId",
> > > > +            BooleanProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicens=
ing/isDeprecatedAdditionId",
> > > > +            compact=3D"expandedlicensing_isDeprecatedAdditionId",
> > > > +        )
> > > > +        # Identifies all the text and metadata associated with a l=
icense in the license
> > > > +        # XML format.
> > > > +        cls._add_property(
> > > > +            "expandedlicensing_licenseXml",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicens=
ing/licenseXml",
> > > > +            compact=3D"expandedlicensing_licenseXml",
> > > > +        )
> > > > +        # Specifies the licenseId that is preferred to be used in =
place of a deprecated
> > > > +        # License or LicenseAddition.
> > > > +        cls._add_property(
> > > > +            "expandedlicensing_obsoletedBy",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicens=
ing/obsoletedBy",
> > > > +            compact=3D"expandedlicensing_obsoletedBy",
> > > > +        )
> > > > +        # Contains a URL where the License or LicenseAddition can =
be found in use.
> > > > +        cls._add_property(
> > > > +            "expandedlicensing_seeAlso",
> > > > +            ListProp(AnyURIProp()),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicens=
ing/seeAlso",
> > > > +            compact=3D"expandedlicensing_seeAlso",
> > > > +        )
> > > > +        # Identifies the full text of a LicenseAddition, in SPDX t=
emplating format.
> > > > +        cls._add_property(
> > > > +            "expandedlicensing_standardAdditionTemplate",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicens=
ing/standardAdditionTemplate",
> > > > +            compact=3D"expandedlicensing_standardAdditionTemplate",
> > > > +        )
> > > > +
> > > > +
> > > > +# A license exception that is listed on the SPDX Exceptions list.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/List=
edLicenseException", compact_type=3D"expandedlicensing_ListedLicenseExcepti=
on", abstract=3DFalse)
> > > > +class expandedlicensing_ListedLicenseException(expandedlicensing_L=
icenseAddition):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Specifies the SPDX License List version in which this li=
cense or exception
> > > > +        # identifier was deprecated.
> > > > +        cls._add_property(
> > > > +            "expandedlicensing_deprecatedVersion",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicens=
ing/deprecatedVersion",
> > > > +            compact=3D"expandedlicensing_deprecatedVersion",
> > > > +        )
> > > > +        # Specifies the SPDX License List version in which this Li=
stedLicense or
> > > > +        # ListedLicenseException identifier was first added.
> > > > +        cls._add_property(
> > > > +            "expandedlicensing_listVersionAdded",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicens=
ing/listVersionAdded",
> > > > +            compact=3D"expandedlicensing_listVersionAdded",
> > > > +        )
> > > > +
> > > > +
> > > > +# A property name with an associated value.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Extension/CdxPropertyE=
ntry", compact_type=3D"extension_CdxPropertyEntry", abstract=3DFalse)
> > > > +class extension_CdxPropertyEntry(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # A name used in a CdxPropertyEntry name-value pair.
> > > > +        cls._add_property(
> > > > +            "extension_cdxPropName",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Extension/cdxP=
ropName",
> > > > +            min_count=3D1,
> > > > +            compact=3D"extension_cdxPropName",
> > > > +        )
> > > > +        # A value used in a CdxPropertyEntry name-value pair.
> > > > +        cls._add_property(
> > > > +            "extension_cdxPropValue",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Extension/cdxP=
ropValue",
> > > > +            compact=3D"extension_cdxPropValue",
> > > > +        )
> > > > +
> > > > +
> > > > +# A characterization of some aspect of an Element that is associat=
ed with the Element in a generalized fashion.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Extension/Extension", =
compact_type=3D"extension_Extension", abstract=3DTrue)
> > > > +class extension_Extension(SHACLExtensibleObject, SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +
> > > > +# Specifies the CVSS base, temporal, threat, or environmental seve=
rity type.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Security/CvssSeverityT=
ype", compact_type=3D"security_CvssSeverityType", abstract=3DFalse)
> > > > +class security_CvssSeverityType(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "critical": "https://spdx.org/rdf/3.0.1/terms/Security/Cvs=
sSeverityType/critical",
> > > > +        "high": "https://spdx.org/rdf/3.0.1/terms/Security/CvssSev=
erityType/high",
> > > > +        "low": "https://spdx.org/rdf/3.0.1/terms/Security/CvssSeve=
rityType/low",
> > > > +        "medium": "https://spdx.org/rdf/3.0.1/terms/Security/CvssS=
everityType/medium",
> > > > +        "none": "https://spdx.org/rdf/3.0.1/terms/Security/CvssSev=
erityType/none",
> > > > +    }
> > > > +    # When a CVSS score is between 9.0 - 10.0
> > > > +    critical =3D "https://spdx.org/rdf/3.0.1/terms/Security/CvssSe=
verityType/critical"
> > > > +    # When a CVSS score is between 7.0 - 8.9
> > > > +    high =3D "https://spdx.org/rdf/3.0.1/terms/Security/CvssSeveri=
tyType/high"
> > > > +    # When a CVSS score is between 0.1 - 3.9
> > > > +    low =3D "https://spdx.org/rdf/3.0.1/terms/Security/CvssSeverit=
yType/low"
> > > > +    # When a CVSS score is between 4.0 - 6.9
> > > > +    medium =3D "https://spdx.org/rdf/3.0.1/terms/Security/CvssSeve=
rityType/medium"
> > > > +    # When a CVSS score is 0.0
> > > > +    none =3D "https://spdx.org/rdf/3.0.1/terms/Security/CvssSeveri=
tyType/none"
> > > > +
> > > > +
> > > > +# Specifies the exploit catalog type.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Security/ExploitCatalo=
gType", compact_type=3D"security_ExploitCatalogType", abstract=3DFalse)
> > > > +class security_ExploitCatalogType(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "kev": "https://spdx.org/rdf/3.0.1/terms/Security/ExploitC=
atalogType/kev",
> > > > +        "other": "https://spdx.org/rdf/3.0.1/terms/Security/Exploi=
tCatalogType/other",
> > > > +    }
> > > > +    # CISA's Known Exploited Vulnerability (KEV) Catalog
> > > > +    kev =3D "https://spdx.org/rdf/3.0.1/terms/Security/ExploitCata=
logType/kev"
> > > > +    # Other exploit catalogs
> > > > +    other =3D "https://spdx.org/rdf/3.0.1/terms/Security/ExploitCa=
talogType/other"
> > > > +
> > > > +
> > > > +# Specifies the SSVC decision type.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Security/SsvcDecisionT=
ype", compact_type=3D"security_SsvcDecisionType", abstract=3DFalse)
> > > > +class security_SsvcDecisionType(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "act": "https://spdx.org/rdf/3.0.1/terms/Security/SsvcDeci=
sionType/act",
> > > > +        "attend": "https://spdx.org/rdf/3.0.1/terms/Security/SsvcD=
ecisionType/attend",
> > > > +        "track": "https://spdx.org/rdf/3.0.1/terms/Security/SsvcDe=
cisionType/track",
> > > > +        "trackStar": "https://spdx.org/rdf/3.0.1/terms/Security/Ss=
vcDecisionType/trackStar",
> > > > +    }
> > > > +    # The vulnerability requires attention from the organization's=
 internal, supervisory-level and leadership-level individuals. Necessary ac=
tions include requesting assistance or information about the vulnerability,=
 as well as publishing a notification either internally and/or externally. =
Typically, internal groups would meet to determine the overall response and=
 then execute agreed upon actions. CISA recommends remediating Act vulnerab=
ilities as soon as possible.
> > > > +    act =3D "https://spdx.org/rdf/3.0.1/terms/Security/SsvcDecisio=
nType/act"
> > > > +    # The vulnerability requires attention from the organization's=
 internal, supervisory-level individuals. Necessary actions include request=
ing assistance or information about the vulnerability, and may involve publ=
ishing a notification either internally and/or externally. CISA recommends =
remediating Attend vulnerabilities sooner than standard update timelines.
> > > > +    attend =3D "https://spdx.org/rdf/3.0.1/terms/Security/SsvcDeci=
sionType/attend"
> > > > +    # The vulnerability does not require action at this time. The =
organization would continue to track the vulnerability and reassess it if n=
ew information becomes available. CISA recommends remediating Track vulnera=
bilities within standard update timelines.
> > > > +    track =3D "https://spdx.org/rdf/3.0.1/terms/Security/SsvcDecis=
ionType/track"
> > > > +    # ("Track\*" in the SSVC spec) The vulnerability contains spec=
ific characteristics that may require closer monitoring for changes. CISA r=
ecommends remediating Track\* vulnerabilities within standard update timeli=
nes.
> > > > +    trackStar =3D "https://spdx.org/rdf/3.0.1/terms/Security/SsvcD=
ecisionType/trackStar"
> > > > +
> > > > +
> > > > +# Specifies the VEX justification type.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Security/VexJustificat=
ionType", compact_type=3D"security_VexJustificationType", abstract=3DFalse)
> > > > +class security_VexJustificationType(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "componentNotPresent": "https://spdx.org/rdf/3.0.1/terms/S=
ecurity/VexJustificationType/componentNotPresent",
> > > > +        "inlineMitigationsAlreadyExist": "https://spdx.org/rdf/3.0=
=2E1/terms/Security/VexJustificationType/inlineMitigationsAlreadyExist",
> > > > +        "vulnerableCodeCannotBeControlledByAdversary": "https://sp=
dx.org/rdf/3.0.1/terms/Security/VexJustificationType/vulnerableCodeCannotBe=
ControlledByAdversary",
> > > > +        "vulnerableCodeNotInExecutePath": "https://spdx.org/rdf/3.=
0.1/terms/Security/VexJustificationType/vulnerableCodeNotInExecutePath",
> > > > +        "vulnerableCodeNotPresent": "https://spdx.org/rdf/3.0.1/te=
rms/Security/VexJustificationType/vulnerableCodeNotPresent",
> > > > +    }
> > > > +    # The software is not affected because the vulnerable componen=
t is not in the product.
> > > > +    componentNotPresent =3D "https://spdx.org/rdf/3.0.1/terms/Secu=
rity/VexJustificationType/componentNotPresent"
> > > > +    # Built-in inline controls or mitigations prevent an adversary=
 from leveraging the vulnerability.
> > > > +    inlineMitigationsAlreadyExist =3D "https://spdx.org/rdf/3.0.1/=
terms/Security/VexJustificationType/inlineMitigationsAlreadyExist"
> > > > +    # The vulnerable component is present, and the component conta=
ins the vulnerable code. However, vulnerable code is used in such a way tha=
t an attacker cannot mount any anticipated attack.
> > > > +    vulnerableCodeCannotBeControlledByAdversary =3D "https://spdx.=
org/rdf/3.0.1/terms/Security/VexJustificationType/vulnerableCodeCannotBeCon=
trolledByAdversary"
> > > > +    # The affected code is not reachable through the execution of =
the code, including non-anticipated states of the product.
> > > > +    vulnerableCodeNotInExecutePath =3D "https://spdx.org/rdf/3.0.1=
/terms/Security/VexJustificationType/vulnerableCodeNotInExecutePath"
> > > > +    # The product is not affected because the code underlying the =
vulnerability is not present in the product.
> > > > +    vulnerableCodeNotPresent =3D "https://spdx.org/rdf/3.0.1/terms=
/Security/VexJustificationType/vulnerableCodeNotPresent"
> > > > +
> > > > +
> > > > +# Abstract ancestor class for all vulnerability assessments
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Security/VulnAssessmen=
tRelationship", compact_type=3D"security_VulnAssessmentRelationship", abstr=
act=3DTrue)
> > > > +class security_VulnAssessmentRelationship(Relationship):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Identifies who or what supplied the artifact or VulnAsse=
ssmentRelationship
> > > > +        # referenced by the Element.
> > > > +        cls._add_property(
> > > > +            "suppliedBy",
> > > > +            ObjectProp(Agent, False, context=3D[
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOr=
ganization", "SpdxOrganization"),
> > > > +                ],),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/suppliedB=
y",
> > > > +            compact=3D"suppliedBy",
> > > > +        )
> > > > +        # Specifies an Element contained in a piece of software wh=
ere a vulnerability was
> > > > +        # found.
> > > > +        cls._add_property(
> > > > +            "security_assessedElement",
> > > > +            ObjectProp(software_SoftwareArtifact, False),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/asses=
sedElement",
> > > > +            compact=3D"security_assessedElement",
> > > > +        )
> > > > +        # Specifies a time when a vulnerability assessment was mod=
ified
> > > > +        cls._add_property(
> > > > +            "security_modifiedTime",
> > > > +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d=
:\d\d:\d\dZ$",),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/modif=
iedTime",
> > > > +            compact=3D"security_modifiedTime",
> > > > +        )
> > > > +        # Specifies the time when a vulnerability was published.
> > > > +        cls._add_property(
> > > > +            "security_publishedTime",
> > > > +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d=
:\d\d:\d\dZ$",),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/publi=
shedTime",
> > > > +            compact=3D"security_publishedTime",
> > > > +        )
> > > > +        # Specified the time and date when a vulnerability was wit=
hdrawn.
> > > > +        cls._add_property(
> > > > +            "security_withdrawnTime",
> > > > +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d=
:\d\d:\d\dZ$",),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/withd=
rawnTime",
> > > > +            compact=3D"security_withdrawnTime",
> > > > +        )
> > > > +
> > > > +
> > > > +# Abstract class representing a license combination consisting of =
one or more licenses.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/SimpleLicensing/AnyLic=
enseInfo", compact_type=3D"simplelicensing_AnyLicenseInfo", abstract=3DTrue)
> > > > +class simplelicensing_AnyLicenseInfo(Element):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +
> > > > +# An SPDX Element containing an SPDX license expression string.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/SimpleLicensing/Licens=
eExpression", compact_type=3D"simplelicensing_LicenseExpression", abstract=
=3DFalse)
> > > > +class simplelicensing_LicenseExpression(simplelicensing_AnyLicense=
Info):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Maps a LicenseRef or AdditionRef string for a Custom Lic=
ense or a Custom
> > > > +        # License Addition to its URI ID.
> > > > +        cls._add_property(
> > > > +            "simplelicensing_customIdToUri",
> > > > +            ListProp(ObjectProp(DictionaryEntry, False)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/SimpleLicensin=
g/customIdToUri",
> > > > +            compact=3D"simplelicensing_customIdToUri",
> > > > +        )
> > > > +        # A string in the license expression format.
> > > > +        cls._add_property(
> > > > +            "simplelicensing_licenseExpression",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/SimpleLicensin=
g/licenseExpression",
> > > > +            min_count=3D1,
> > > > +            compact=3D"simplelicensing_licenseExpression",
> > > > +        )
> > > > +        # The version of the SPDX License List used in the license=
 expression.
> > > > +        cls._add_property(
> > > > +            "simplelicensing_licenseListVersion",
> > > > +            StringProp(pattern=3Dr"^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0=
|[1-9]\d*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\=
d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$",=
),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/SimpleLicensin=
g/licenseListVersion",
> > > > +            compact=3D"simplelicensing_licenseListVersion",
> > > > +        )
> > > > +
> > > > +
> > > > +# A license or addition that is not listed on the SPDX License Lis=
t.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/SimpleLicensing/Simple=
LicensingText", compact_type=3D"simplelicensing_SimpleLicensingText", abstr=
act=3DFalse)
> > > > +class simplelicensing_SimpleLicensingText(Element):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Identifies the full text of a License or Addition.
> > > > +        cls._add_property(
> > > > +            "simplelicensing_licenseText",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/SimpleLicensin=
g/licenseText",
> > > > +            min_count=3D1,
> > > > +            compact=3D"simplelicensing_licenseText",
> > > > +        )
> > > > +
> > > > +
> > > > +# A canonical, unique, immutable identifier
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Software/ContentIdenti=
fier", compact_type=3D"software_ContentIdentifier", abstract=3DFalse)
> > > > +class software_ContentIdentifier(IntegrityMethod):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Specifies the type of the content identifier.
> > > > +        cls._add_property(
> > > > +            "software_contentIdentifierType",
> > > > +            EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Co=
ntentIdentifierType/gitoid", "gitoid"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Co=
ntentIdentifierType/swhid", "swhid"),
> > > > +                ]),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/conte=
ntIdentifierType",
> > > > +            min_count=3D1,
> > > > +            compact=3D"software_contentIdentifierType",
> > > > +        )
> > > > +        # Specifies the value of the content identifier.
> > > > +        cls._add_property(
> > > > +            "software_contentIdentifierValue",
> > > > +            AnyURIProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/conte=
ntIdentifierValue",
> > > > +            min_count=3D1,
> > > > +            compact=3D"software_contentIdentifierValue",
> > > > +        )
> > > > +
> > > > +
> > > > +# Specifies the type of a content identifier.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Software/ContentIdenti=
fierType", compact_type=3D"software_ContentIdentifierType", abstract=3DFals=
e)
> > > > +class software_ContentIdentifierType(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "gitoid": "https://spdx.org/rdf/3.0.1/terms/Software/Conte=
ntIdentifierType/gitoid",
> > > > +        "swhid": "https://spdx.org/rdf/3.0.1/terms/Software/Conten=
tIdentifierType/swhid",
> > > > +    }
> > > > +    # [Gitoid](https://www.iana.org/assignments/uri-schemes/prov/g=
itoid), stands for [Git Object ID](https://git-scm.com/book/en/v2/Git-Inter=
nals-Git-Objects). A gitoid of type blob is a unique hash of a binary artif=
act. A gitoid may represent either an [Artifact Identifier](https://github.=
com/omnibor/spec/blob/eb1ee5c961c16215eb8709b2975d193a2007a35d/spec/SPEC.md=
#artifact-identifier-types) for the software artifact or an [Input Manifest=
 Identifier](https://github.com/omnibor/spec/blob/eb1ee5c961c16215eb8709b29=
75d193a2007a35d/spec/SPEC.md#input-manifest-identifier) for the software ar=
tifact's associated [Artifact Input Manifest](https://github.com/omnibor/sp=
ec/blob/eb1ee5c961c16215eb8709b2975d193a2007a35d/spec/SPEC.md#artifact-inpu=
t-manifest); this ambiguity exists because the Artifact Input Manifest is i=
tself an artifact, and the gitoid of that artifact is its valid identifier.=
 Gitoids calculated on software artifacts (Snippet, File, or Package Elemen=
ts) should be recorded in the SPDX 3.0 SoftwareArtifact's contentIdentifier=
 property. Gitoids calculated on the Artifact Input Manifest (Input Manifes=
t Identifier) should be recorded in the SPDX 3.0 Element's externalIdentifi=
er property. See [OmniBOR Specification](https://github.com/omnibor/spec/),=
 a minimalistic specification for describing software [Artifact Dependency =
Graphs](https://github.com/omnibor/spec/blob/eb1ee5c961c16215eb8709b2975d19=
3a2007a35d/spec/SPEC.md#artifact-dependency-graph-adg).
> > > > +    gitoid =3D "https://spdx.org/rdf/3.0.1/terms/Software/ContentI=
dentifierType/gitoid"
> > > > +    # SoftWare Hash IDentifier, a persistent intrinsic identifier =
for digital artifacts, such as files, trees (also known as directories or f=
olders), commits, and other objects typically found in version control syst=
ems. The format of the identifiers is defined in the [SWHID specification](=
https://www.swhid.org/specification/v1.1/4.Syntax) (ISO/IEC DIS 18670). The=
y typically look like `swh:1:cnt:94a9ed024d3859793618152ea559a168bbcbb5e2`.
> > > > +    swhid =3D "https://spdx.org/rdf/3.0.1/terms/Software/ContentId=
entifierType/swhid"
> > > > +
> > > > +
> > > > +# Enumeration of the different kinds of SPDX file.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Software/FileKindType"=
, compact_type=3D"software_FileKindType", abstract=3DFalse)
> > > > +class software_FileKindType(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "directory": "https://spdx.org/rdf/3.0.1/terms/Software/Fi=
leKindType/directory",
> > > > +        "file": "https://spdx.org/rdf/3.0.1/terms/Software/FileKin=
dType/file",
> > > > +    }
> > > > +    # The file represents a directory and all content stored in th=
at directory.
> > > > +    directory =3D "https://spdx.org/rdf/3.0.1/terms/Software/FileK=
indType/directory"
> > > > +    # The file represents a single file (default).
> > > > +    file =3D "https://spdx.org/rdf/3.0.1/terms/Software/FileKindTy=
pe/file"
> > > > +
> > > > +
> > > > +# Provides a set of values to be used to describe the common types=
 of SBOMs that
> > > > +# tools may create.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Software/SbomType", co=
mpact_type=3D"software_SbomType", abstract=3DFalse)
> > > > +class software_SbomType(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "analyzed": "https://spdx.org/rdf/3.0.1/terms/Software/Sbo=
mType/analyzed",
> > > > +        "build": "https://spdx.org/rdf/3.0.1/terms/Software/SbomTy=
pe/build",
> > > > +        "deployed": "https://spdx.org/rdf/3.0.1/terms/Software/Sbo=
mType/deployed",
> > > > +        "design": "https://spdx.org/rdf/3.0.1/terms/Software/SbomT=
ype/design",
> > > > +        "runtime": "https://spdx.org/rdf/3.0.1/terms/Software/Sbom=
Type/runtime",
> > > > +        "source": "https://spdx.org/rdf/3.0.1/terms/Software/SbomT=
ype/source",
> > > > +    }
> > > > +    # SBOM generated through analysis of artifacts (e.g., executab=
les, packages, containers, and virtual machine images) after its build. Suc=
h analysis generally requires a variety of heuristics. In some contexts, th=
is may also be referred to as a "3rd party" SBOM.
> > > > +    analyzed =3D "https://spdx.org/rdf/3.0.1/terms/Software/SbomTy=
pe/analyzed"
> > > > +    # SBOM generated as part of the process of building the softwa=
re to create a releasable artifact (e.g., executable or package) from data =
such as source files, dependencies, built components, build process ephemer=
al data, and other SBOMs.
> > > > +    build =3D "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/=
build"
> > > > +    # SBOM provides an inventory of software that is present on a =
system. This may be an assembly of other SBOMs that combines analysis of co=
nfiguration options, and examination of execution behavior in a (potentiall=
y simulated) deployment environment.
> > > > +    deployed =3D "https://spdx.org/rdf/3.0.1/terms/Software/SbomTy=
pe/deployed"
> > > > +    # SBOM of intended, planned software project or product with i=
ncluded components (some of which may not yet exist) for a new software art=
ifact.
> > > > +    design =3D "https://spdx.org/rdf/3.0.1/terms/Software/SbomType=
/design"
> > > > +    # SBOM generated through instrumenting the system running the =
software, to capture only components present in the system, as well as exte=
rnal call-outs or dynamically loaded components. In some contexts, this may=
 also be referred to as an "Instrumented" or "Dynamic" SBOM.
> > > > +    runtime =3D "https://spdx.org/rdf/3.0.1/terms/Software/SbomTyp=
e/runtime"
> > > > +    # SBOM created directly from the development environment, sour=
ce files, and included dependencies used to build an product artifact.
> > > > +    source =3D "https://spdx.org/rdf/3.0.1/terms/Software/SbomType=
/source"
> > > > +
> > > > +
> > > > +# Provides information about the primary purpose of an Element.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpo=
se", compact_type=3D"software_SoftwarePurpose", abstract=3DFalse)
> > > > +class software_SoftwarePurpose(SHACLObject):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "application": "https://spdx.org/rdf/3.0.1/terms/Software/=
SoftwarePurpose/application",
> > > > +        "archive": "https://spdx.org/rdf/3.0.1/terms/Software/Soft=
warePurpose/archive",
> > > > +        "bom": "https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/bom",
> > > > +        "configuration": "https://spdx.org/rdf/3.0.1/terms/Softwar=
e/SoftwarePurpose/configuration",
> > > > +        "container": "https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/container",
> > > > +        "data": "https://spdx.org/rdf/3.0.1/terms/Software/Softwar=
ePurpose/data",
> > > > +        "device": "https://spdx.org/rdf/3.0.1/terms/Software/Softw=
arePurpose/device",
> > > > +        "deviceDriver": "https://spdx.org/rdf/3.0.1/terms/Software=
/SoftwarePurpose/deviceDriver",
> > > > +        "diskImage": "https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/diskImage",
> > > > +        "documentation": "https://spdx.org/rdf/3.0.1/terms/Softwar=
e/SoftwarePurpose/documentation",
> > > > +        "evidence": "https://spdx.org/rdf/3.0.1/terms/Software/Sof=
twarePurpose/evidence",
> > > > +        "executable": "https://spdx.org/rdf/3.0.1/terms/Software/S=
oftwarePurpose/executable",
> > > > +        "file": "https://spdx.org/rdf/3.0.1/terms/Software/Softwar=
ePurpose/file",
> > > > +        "filesystemImage": "https://spdx.org/rdf/3.0.1/terms/Softw=
are/SoftwarePurpose/filesystemImage",
> > > > +        "firmware": "https://spdx.org/rdf/3.0.1/terms/Software/Sof=
twarePurpose/firmware",
> > > > +        "framework": "https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/framework",
> > > > +        "install": "https://spdx.org/rdf/3.0.1/terms/Software/Soft=
warePurpose/install",
> > > > +        "library": "https://spdx.org/rdf/3.0.1/terms/Software/Soft=
warePurpose/library",
> > > > +        "manifest": "https://spdx.org/rdf/3.0.1/terms/Software/Sof=
twarePurpose/manifest",
> > > > +        "model": "https://spdx.org/rdf/3.0.1/terms/Software/Softwa=
rePurpose/model",
> > > > +        "module": "https://spdx.org/rdf/3.0.1/terms/Software/Softw=
arePurpose/module",
> > > > +        "operatingSystem": "https://spdx.org/rdf/3.0.1/terms/Softw=
are/SoftwarePurpose/operatingSystem",
> > > > +        "other": "https://spdx.org/rdf/3.0.1/terms/Software/Softwa=
rePurpose/other",
> > > > +        "patch": "https://spdx.org/rdf/3.0.1/terms/Software/Softwa=
rePurpose/patch",
> > > > +        "platform": "https://spdx.org/rdf/3.0.1/terms/Software/Sof=
twarePurpose/platform",
> > > > +        "requirement": "https://spdx.org/rdf/3.0.1/terms/Software/=
SoftwarePurpose/requirement",
> > > > +        "source": "https://spdx.org/rdf/3.0.1/terms/Software/Softw=
arePurpose/source",
> > > > +        "specification": "https://spdx.org/rdf/3.0.1/terms/Softwar=
e/SoftwarePurpose/specification",
> > > > +        "test": "https://spdx.org/rdf/3.0.1/terms/Software/Softwar=
ePurpose/test",
> > > > +    }
> > > > +    # The Element is a software application.
> > > > +    application =3D "https://spdx.org/rdf/3.0.1/terms/Software/Sof=
twarePurpose/application"
> > > > +    # The Element is an archived collection of one or more files (=
=2Etar, .zip, etc.).
> > > > +    archive =3D "https://spdx.org/rdf/3.0.1/terms/Software/Softwar=
ePurpose/archive"
> > > > +    # The Element is a bill of materials.
> > > > +    bom =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePur=
pose/bom"
> > > > +    # The Element is configuration data.
> > > > +    configuration =3D "https://spdx.org/rdf/3.0.1/terms/Software/S=
oftwarePurpose/configuration"
> > > > +    # The Element is a container image which can be used by a cont=
ainer runtime application.
> > > > +    container =3D "https://spdx.org/rdf/3.0.1/terms/Software/Softw=
arePurpose/container"
> > > > +    # The Element is data.
> > > > +    data =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/data"
> > > > +    # The Element refers to a chipset, processor, or electronic bo=
ard.
> > > > +    device =3D "https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/device"
> > > > +    # The Element represents software that controls hardware devic=
es.
> > > > +    deviceDriver =3D "https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/deviceDriver"
> > > > +    # The Element refers to a disk image that can be written to a =
disk, booted in a VM, etc. A disk image typically contains most or all of t=
he components necessary to boot, such as bootloaders, kernels, firmware, us=
erspace, etc.
> > > > +    diskImage =3D "https://spdx.org/rdf/3.0.1/terms/Software/Softw=
arePurpose/diskImage"
> > > > +    # The Element is documentation.
> > > > +    documentation =3D "https://spdx.org/rdf/3.0.1/terms/Software/S=
oftwarePurpose/documentation"
> > > > +    # The Element is the evidence that a specification or requirem=
ent has been fulfilled.
> > > > +    evidence =3D "https://spdx.org/rdf/3.0.1/terms/Software/Softwa=
rePurpose/evidence"
> > > > +    # The Element is an Artifact that can be run on a computer.
> > > > +    executable =3D "https://spdx.org/rdf/3.0.1/terms/Software/Soft=
warePurpose/executable"
> > > > +    # The Element is a single file which can be independently dist=
ributed (configuration file, statically linked binary, Kubernetes deploymen=
t, etc.).
> > > > +    file =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/file"
> > > > +    # The Element is a file system image that can be written to a =
disk (or virtual) partition.
> > > > +    filesystemImage =3D "https://spdx.org/rdf/3.0.1/terms/Software=
/SoftwarePurpose/filesystemImage"
> > > > +    # The Element provides low level control over a device's hardw=
are.
> > > > +    firmware =3D "https://spdx.org/rdf/3.0.1/terms/Software/Softwa=
rePurpose/firmware"
> > > > +    # The Element is a software framework.
> > > > +    framework =3D "https://spdx.org/rdf/3.0.1/terms/Software/Softw=
arePurpose/framework"
> > > > +    # The Element is used to install software on disk.
> > > > +    install =3D "https://spdx.org/rdf/3.0.1/terms/Software/Softwar=
ePurpose/install"
> > > > +    # The Element is a software library.
> > > > +    library =3D "https://spdx.org/rdf/3.0.1/terms/Software/Softwar=
ePurpose/library"
> > > > +    # The Element is a software manifest.
> > > > +    manifest =3D "https://spdx.org/rdf/3.0.1/terms/Software/Softwa=
rePurpose/manifest"
> > > > +    # The Element is a machine learning or artificial intelligence=
 model.
> > > > +    model =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwareP=
urpose/model"
> > > > +    # The Element is a module of a piece of software.
> > > > +    module =3D "https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/module"
> > > > +    # The Element is an operating system.
> > > > +    operatingSystem =3D "https://spdx.org/rdf/3.0.1/terms/Software=
/SoftwarePurpose/operatingSystem"
> > > > +    # The Element doesn't fit into any of the other categories.
> > > > +    other =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwareP=
urpose/other"
> > > > +    # The Element contains a set of changes to update, fix, or imp=
rove another Element.
> > > > +    patch =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwareP=
urpose/patch"
> > > > +    # The Element represents a runtime environment.
> > > > +    platform =3D "https://spdx.org/rdf/3.0.1/terms/Software/Softwa=
rePurpose/platform"
> > > > +    # The Element provides a requirement needed as input for anoth=
er Element.
> > > > +    requirement =3D "https://spdx.org/rdf/3.0.1/terms/Software/Sof=
twarePurpose/requirement"
> > > > +    # The Element is a single or a collection of source files.
> > > > +    source =3D "https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/source"
> > > > +    # The Element is a plan, guideline or strategy how to create, =
perform or analyze an application.
> > > > +    specification =3D "https://spdx.org/rdf/3.0.1/terms/Software/S=
oftwarePurpose/specification"
> > > > +    # The Element is a test used to verify functionality on an sof=
tware element.
> > > > +    test =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/test"
> > > > +
> > > > +
> > > > +# Class that describes a build instance of software/artifacts.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Build/Build", compact_=
type=3D"build_Build", abstract=3DFalse)
> > > > +class build_Build(Element):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Property that describes the time at which a build stops.
> > > > +        cls._add_property(
> > > > +            "build_buildEndTime",
> > > > +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d=
:\d\d:\d\dZ$",),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/buildEnd=
Time",
> > > > +            compact=3D"build_buildEndTime",
> > > > +        )
> > > > +        # A buildId is a locally unique identifier used by a build=
er to identify a unique
> > > > +        # instance of a build produced by it.
> > > > +        cls._add_property(
> > > > +            "build_buildId",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/buildId",
> > > > +            compact=3D"build_buildId",
> > > > +        )
> > > > +        # Property describing the start time of a build.
> > > > +        cls._add_property(
> > > > +            "build_buildStartTime",
> > > > +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d=
:\d\d:\d\dZ$",),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/buildSta=
rtTime",
> > > > +            compact=3D"build_buildStartTime",
> > > > +        )
> > > > +        # A buildType is a hint that is used to indicate the toolc=
hain, platform, or
> > > > +        # infrastructure that the build was invoked on.
> > > > +        cls._add_property(
> > > > +            "build_buildType",
> > > > +            AnyURIProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/buildTyp=
e",
> > > > +            min_count=3D1,
> > > > +            compact=3D"build_buildType",
> > > > +        )
> > > > +        # Property that describes the digest of the build configur=
ation file used to
> > > > +        # invoke a build.
> > > > +        cls._add_property(
> > > > +            "build_configSourceDigest",
> > > > +            ListProp(ObjectProp(Hash, False)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/configSo=
urceDigest",
> > > > +            compact=3D"build_configSourceDigest",
> > > > +        )
> > > > +        # Property describes the invocation entrypoint of a build.
> > > > +        cls._add_property(
> > > > +            "build_configSourceEntrypoint",
> > > > +            ListProp(StringProp()),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/configSo=
urceEntrypoint",
> > > > +            compact=3D"build_configSourceEntrypoint",
> > > > +        )
> > > > +        # Property that describes the URI of the build configurati=
on source file.
> > > > +        cls._add_property(
> > > > +            "build_configSourceUri",
> > > > +            ListProp(AnyURIProp()),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/configSo=
urceUri",
> > > > +            compact=3D"build_configSourceUri",
> > > > +        )
> > > > +        # Property describing the session in which a build is invo=
ked.
> > > > +        cls._add_property(
> > > > +            "build_environment",
> > > > +            ListProp(ObjectProp(DictionaryEntry, False)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/environm=
ent",
> > > > +            compact=3D"build_environment",
> > > > +        )
> > > > +        # Property describing a parameter used in an instance of a=
 build.
> > > > +        cls._add_property(
> > > > +            "build_parameter",
> > > > +            ListProp(ObjectProp(DictionaryEntry, False)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/paramete=
r",
> > > > +            compact=3D"build_parameter",
> > > > +        )
> > > > +
> > > > +
> > > > +# Agent represents anything with the potential to act on a system.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/Agent", compact_t=
ype=3D"Agent", abstract=3DFalse)
> > > > +class Agent(Element):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +
> > > > +# An assertion made in relation to one or more elements.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/Annotation", comp=
act_type=3D"Annotation", abstract=3DFalse)
> > > > +class Annotation(Element):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Describes the type of annotation.
> > > > +        cls._add_property(
> > > > +            "annotationType",
> > > > +            EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Annota=
tionType/other", "other"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Annota=
tionType/review", "review"),
> > > > +                ]),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/annotatio=
nType",
> > > > +            min_count=3D1,
> > > > +            compact=3D"annotationType",
> > > > +        )
> > > > +        # Provides information about the content type of an Elemen=
t or a Property.
> > > > +        cls._add_property(
> > > > +            "contentType",
> > > > +            StringProp(pattern=3Dr"^[^\/]+\/[^\/]+$",),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/contentTy=
pe",
> > > > +            compact=3D"contentType",
> > > > +        )
> > > > +        # Commentary on an assertion that an annotator has made.
> > > > +        cls._add_property(
> > > > +            "statement",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/statement=
",
> > > > +            compact=3D"statement",
> > > > +        )
> > > > +        # An Element an annotator has made an assertion about.
> > > > +        cls._add_property(
> > > > +            "subject",
> > > > +            ObjectProp(Element, True, context=3D[
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoneEl=
ement", "NoneElement"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLic=
ensing/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLic=
ensing/NoneLicense", "expandedlicensing_NoneLicense"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOr=
ganization", "SpdxOrganization"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoAsse=
rtionElement", "NoAssertionElement"),
> > > > +                ],),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/subject",
> > > > +            min_count=3D1,
> > > > +            compact=3D"subject",
> > > > +        )
> > > > +
> > > > +
> > > > +# A distinct article or unit within the digital domain.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/Artifact", compac=
t_type=3D"Artifact", abstract=3DTrue)
> > > > +class Artifact(Element):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Specifies the time an artifact was built.
> > > > +        cls._add_property(
> > > > +            "builtTime",
> > > > +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d=
:\d\d:\d\dZ$",),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/builtTime=
",
> > > > +            compact=3D"builtTime",
> > > > +        )
> > > > +        # Identifies from where or whom the Element originally cam=
e.
> > > > +        cls._add_property(
> > > > +            "originatedBy",
> > > > +            ListProp(ObjectProp(Agent, False, context=3D[
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOr=
ganization", "SpdxOrganization"),
> > > > +                ],)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/originate=
dBy",
> > > > +            compact=3D"originatedBy",
> > > > +        )
> > > > +        # Specifies the time an artifact was released.
> > > > +        cls._add_property(
> > > > +            "releaseTime",
> > > > +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d=
:\d\d:\d\dZ$",),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/releaseTi=
me",
> > > > +            compact=3D"releaseTime",
> > > > +        )
> > > > +        # The name of a relevant standard that may apply to an art=
ifact.
> > > > +        cls._add_property(
> > > > +            "standardName",
> > > > +            ListProp(StringProp()),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/standardN=
ame",
> > > > +            compact=3D"standardName",
> > > > +        )
> > > > +        # Identifies who or what supplied the artifact or VulnAsse=
ssmentRelationship
> > > > +        # referenced by the Element.
> > > > +        cls._add_property(
> > > > +            "suppliedBy",
> > > > +            ObjectProp(Agent, False, context=3D[
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOr=
ganization", "SpdxOrganization"),
> > > > +                ],),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/suppliedB=
y",
> > > > +            compact=3D"suppliedBy",
> > > > +        )
> > > > +        # Specifies the level of support associated with an artifa=
ct.
> > > > +        cls._add_property(
> > > > +            "supportLevel",
> > > > +            ListProp(EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Suppor=
tType/deployed", "deployed"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Suppor=
tType/development", "development"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Suppor=
tType/endOfSupport", "endOfSupport"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Suppor=
tType/limitedSupport", "limitedSupport"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Suppor=
tType/noAssertion", "noAssertion"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Suppor=
tType/noSupport", "noSupport"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Suppor=
tType/support", "support"),
> > > > +                ])),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/supportLe=
vel",
> > > > +            compact=3D"supportLevel",
> > > > +        )
> > > > +        # Specifies until when the artifact can be used before its=
 usage needs to be
> > > > +        # reassessed.
> > > > +        cls._add_property(
> > > > +            "validUntilTime",
> > > > +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d=
:\d\d:\d\dZ$",),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/validUnti=
lTime",
> > > > +            compact=3D"validUntilTime",
> > > > +        )
> > > > +
> > > > +
> > > > +# A collection of Elements that have a shared context.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/Bundle", compact_=
type=3D"Bundle", abstract=3DFalse)
> > > > +class Bundle(ElementCollection):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Gives information about the circumstances or unifying pr=
operties
> > > > +        # that Elements of the bundle have been assembled under.
> > > > +        cls._add_property(
> > > > +            "context",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/context",
> > > > +            compact=3D"context",
> > > > +        )
> > > > +
> > > > +
> > > > +# A mathematically calculated representation of a grouping of data.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/Hash", compact_ty=
pe=3D"Hash", abstract=3DFalse)
> > > > +class Hash(IntegrityMethod):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Specifies the algorithm used for calculating the hash va=
lue.
> > > > +        cls._add_property(
> > > > +            "algorithm",
> > > > +            EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/adler32", "adler32"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/blake2b256", "blake2b256"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/blake2b384", "blake2b384"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/blake2b512", "blake2b512"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/blake3", "blake3"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/crystalsDilithium", "crystalsDilithium"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/crystalsKyber", "crystalsKyber"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/falcon", "falcon"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/md2", "md2"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/md4", "md4"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/md5", "md5"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/md6", "md6"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/other", "other"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/sha1", "sha1"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/sha224", "sha224"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/sha256", "sha256"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/sha384", "sha384"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/sha3_224", "sha3_224"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/sha3_256", "sha3_256"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/sha3_384", "sha3_384"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/sha3_512", "sha3_512"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAl=
gorithm/sha512", "sha512"),
> > > > +                ]),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/algorithm=
",
> > > > +            min_count=3D1,
> > > > +            compact=3D"algorithm",
> > > > +        )
> > > > +        # The result of applying a hash algorithm to an Element.
> > > > +        cls._add_property(
> > > > +            "hashValue",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/hashValue=
",
> > > > +            min_count=3D1,
> > > > +            compact=3D"hashValue",
> > > > +        )
> > > > +
> > > > +
> > > > +# Provide context for a relationship that occurs in the lifecycle.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopedRe=
lationship", compact_type=3D"LifecycleScopedRelationship", abstract=3DFalse)
> > > > +class LifecycleScopedRelationship(Relationship):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Capture the scope of information about a specific relati=
onship between elements.
> > > > +        cls._add_property(
> > > > +            "scope",
> > > > +            EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Lifecy=
cleScopeType/build", "build"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Lifecy=
cleScopeType/design", "design"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Lifecy=
cleScopeType/development", "development"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Lifecy=
cleScopeType/other", "other"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Lifecy=
cleScopeType/runtime", "runtime"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Lifecy=
cleScopeType/test", "test"),
> > > > +                ]),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/scope",
> > > > +            compact=3D"scope",
> > > > +        )
> > > > +
> > > > +
> > > > +# A group of people who work together in an organized way for a sh=
ared purpose.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/Organization", co=
mpact_type=3D"Organization", abstract=3DFalse)
> > > > +class Organization(Agent):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "SpdxOrganization": "https://spdx.org/rdf/3.0.1/terms/Core=
/SpdxOrganization",
> > > > +    }
> > > > +    # An Organization representing the SPDX Project.
> > > > +    SpdxOrganization =3D "https://spdx.org/rdf/3.0.1/terms/Core/Sp=
dxOrganization"
> > > > +
> > > > +
> > > > +# An individual human being.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/Person", compact_=
type=3D"Person", abstract=3DFalse)
> > > > +class Person(Agent):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +
> > > > +# A software agent.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/SoftwareAgent", c=
ompact_type=3D"SoftwareAgent", abstract=3DFalse)
> > > > +class SoftwareAgent(Agent):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +
> > > > +# Portion of an AnyLicenseInfo representing a set of licensing inf=
ormation
> > > > +# where all elements apply.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/Conj=
unctiveLicenseSet", compact_type=3D"expandedlicensing_ConjunctiveLicenseSet=
", abstract=3DFalse)
> > > > +class expandedlicensing_ConjunctiveLicenseSet(simplelicensing_AnyL=
icenseInfo):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # A license expression participating in a license set.
> > > > +        cls._add_property(
> > > > +            "expandedlicensing_member",
> > > > +            ListProp(ObjectProp(simplelicensing_AnyLicenseInfo, Fa=
lse, context=3D[
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLic=
ensing/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLic=
ensing/NoneLicense", "expandedlicensing_NoneLicense"),
> > > > +                ],)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicens=
ing/member",
> > > > +            min_count=3D2,
> > > > +            compact=3D"expandedlicensing_member",
> > > > +        )
> > > > +
> > > > +
> > > > +# A license addition that is not listed on the SPDX Exceptions Lis=
t.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/Cust=
omLicenseAddition", compact_type=3D"expandedlicensing_CustomLicenseAddition=
", abstract=3DFalse)
> > > > +class expandedlicensing_CustomLicenseAddition(expandedlicensing_Li=
censeAddition):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +
> > > > +# Portion of an AnyLicenseInfo representing a set of licensing inf=
ormation where
> > > > +# only one of the elements applies.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/Disj=
unctiveLicenseSet", compact_type=3D"expandedlicensing_DisjunctiveLicenseSet=
", abstract=3DFalse)
> > > > +class expandedlicensing_DisjunctiveLicenseSet(simplelicensing_AnyL=
icenseInfo):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # A license expression participating in a license set.
> > > > +        cls._add_property(
> > > > +            "expandedlicensing_member",
> > > > +            ListProp(ObjectProp(simplelicensing_AnyLicenseInfo, Fa=
lse, context=3D[
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLic=
ensing/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLic=
ensing/NoneLicense", "expandedlicensing_NoneLicense"),
> > > > +                ],)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicens=
ing/member",
> > > > +            min_count=3D2,
> > > > +            compact=3D"expandedlicensing_member",
> > > > +        )
> > > > +
> > > > +
> > > > +# Abstract class representing a License or an OrLaterOperator.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/Exte=
ndableLicense", compact_type=3D"expandedlicensing_ExtendableLicense", abstr=
act=3DTrue)
> > > > +class expandedlicensing_ExtendableLicense(simplelicensing_AnyLicen=
seInfo):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +
> > > > +# A concrete subclass of AnyLicenseInfo used by Individuals in the
> > > > +# ExpandedLicensing profile.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/Indi=
vidualLicensingInfo", compact_type=3D"expandedlicensing_IndividualLicensing=
Info", abstract=3DFalse)
> > > > +class expandedlicensing_IndividualLicensingInfo(simplelicensing_An=
yLicenseInfo):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +        "NoAssertionLicense": "https://spdx.org/rdf/3.0.1/terms/Ex=
pandedLicensing/NoAssertionLicense",
> > > > +        "NoneLicense": "https://spdx.org/rdf/3.0.1/terms/ExpandedL=
icensing/NoneLicense",
> > > > +    }
> > > > +    # An Individual Value for License when no assertion can be mad=
e about its actual
> > > > +    # value.
> > > > +    NoAssertionLicense =3D "https://spdx.org/rdf/3.0.1/terms/Expan=
dedLicensing/NoAssertionLicense"
> > > > +    # An Individual Value for License where the SPDX data creator =
determines that no
> > > > +    # license is present.
> > > > +    NoneLicense =3D "https://spdx.org/rdf/3.0.1/terms/ExpandedLice=
nsing/NoneLicense"
> > > > +
> > > > +
> > > > +# Abstract class for the portion of an AnyLicenseInfo representing=
 a license.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/Lice=
nse", compact_type=3D"expandedlicensing_License", abstract=3DTrue)
> > > > +class expandedlicensing_License(expandedlicensing_ExtendableLicens=
e):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Specifies whether a license or additional text identifie=
r has been marked as
> > > > +        # deprecated.
> > > > +        cls._add_property(
> > > > +            "expandedlicensing_isDeprecatedLicenseId",
> > > > +            BooleanProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicens=
ing/isDeprecatedLicenseId",
> > > > +            compact=3D"expandedlicensing_isDeprecatedLicenseId",
> > > > +        )
> > > > +        # Specifies whether the License is listed as free by the
> > > > +        # Free Software Foundation (FSF).
> > > > +        cls._add_property(
> > > > +            "expandedlicensing_isFsfLibre",
> > > > +            BooleanProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicens=
ing/isFsfLibre",
> > > > +            compact=3D"expandedlicensing_isFsfLibre",
> > > > +        )
> > > > +        # Specifies whether the License is listed as approved by t=
he
> > > > +        # Open Source Initiative (OSI).
> > > > +        cls._add_property(
> > > > +            "expandedlicensing_isOsiApproved",
> > > > +            BooleanProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicens=
ing/isOsiApproved",
> > > > +            compact=3D"expandedlicensing_isOsiApproved",
> > > > +        )
> > > > +        # Identifies all the text and metadata associated with a l=
icense in the license
> > > > +        # XML format.
> > > > +        cls._add_property(
> > > > +            "expandedlicensing_licenseXml",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicens=
ing/licenseXml",
> > > > +            compact=3D"expandedlicensing_licenseXml",
> > > > +        )
> > > > +        # Specifies the licenseId that is preferred to be used in =
place of a deprecated
> > > > +        # License or LicenseAddition.
> > > > +        cls._add_property(
> > > > +            "expandedlicensing_obsoletedBy",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicens=
ing/obsoletedBy",
> > > > +            compact=3D"expandedlicensing_obsoletedBy",
> > > > +        )
> > > > +        # Contains a URL where the License or LicenseAddition can =
be found in use.
> > > > +        cls._add_property(
> > > > +            "expandedlicensing_seeAlso",
> > > > +            ListProp(AnyURIProp()),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicens=
ing/seeAlso",
> > > > +            compact=3D"expandedlicensing_seeAlso",
> > > > +        )
> > > > +        # Provides a License author's preferred text to indicate t=
hat a file is covered
> > > > +        # by the License.
> > > > +        cls._add_property(
> > > > +            "expandedlicensing_standardLicenseHeader",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicens=
ing/standardLicenseHeader",
> > > > +            compact=3D"expandedlicensing_standardLicenseHeader",
> > > > +        )
> > > > +        # Identifies the full text of a License, in SPDX templatin=
g format.
> > > > +        cls._add_property(
> > > > +            "expandedlicensing_standardLicenseTemplate",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicens=
ing/standardLicenseTemplate",
> > > > +            compact=3D"expandedlicensing_standardLicenseTemplate",
> > > > +        )
> > > > +        # Identifies the full text of a License or Addition.
> > > > +        cls._add_property(
> > > > +            "simplelicensing_licenseText",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/SimpleLicensin=
g/licenseText",
> > > > +            min_count=3D1,
> > > > +            compact=3D"simplelicensing_licenseText",
> > > > +        )
> > > > +
> > > > +
> > > > +# A license that is listed on the SPDX License List.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/List=
edLicense", compact_type=3D"expandedlicensing_ListedLicense", abstract=3DFa=
lse)
> > > > +class expandedlicensing_ListedLicense(expandedlicensing_License):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Specifies the SPDX License List version in which this li=
cense or exception
> > > > +        # identifier was deprecated.
> > > > +        cls._add_property(
> > > > +            "expandedlicensing_deprecatedVersion",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicens=
ing/deprecatedVersion",
> > > > +            compact=3D"expandedlicensing_deprecatedVersion",
> > > > +        )
> > > > +        # Specifies the SPDX License List version in which this Li=
stedLicense or
> > > > +        # ListedLicenseException identifier was first added.
> > > > +        cls._add_property(
> > > > +            "expandedlicensing_listVersionAdded",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicens=
ing/listVersionAdded",
> > > > +            compact=3D"expandedlicensing_listVersionAdded",
> > > > +        )
> > > > +
> > > > +
> > > > +# Portion of an AnyLicenseInfo representing this version, or any l=
ater version,
> > > > +# of the indicated License.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/OrLa=
terOperator", compact_type=3D"expandedlicensing_OrLaterOperator", abstract=
=3DFalse)
> > > > +class expandedlicensing_OrLaterOperator(expandedlicensing_Extendab=
leLicense):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # A License participating in an 'or later' model.
> > > > +        cls._add_property(
> > > > +            "expandedlicensing_subjectLicense",
> > > > +            ObjectProp(expandedlicensing_License, True),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicens=
ing/subjectLicense",
> > > > +            min_count=3D1,
> > > > +            compact=3D"expandedlicensing_subjectLicense",
> > > > +        )
> > > > +
> > > > +
> > > > +# Portion of an AnyLicenseInfo representing a License which has ad=
ditional
> > > > +# text applied to it.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/With=
AdditionOperator", compact_type=3D"expandedlicensing_WithAdditionOperator",=
 abstract=3DFalse)
> > > > +class expandedlicensing_WithAdditionOperator(simplelicensing_AnyLi=
censeInfo):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # A LicenseAddition participating in a 'with addition' mod=
el.
> > > > +        cls._add_property(
> > > > +            "expandedlicensing_subjectAddition",
> > > > +            ObjectProp(expandedlicensing_LicenseAddition, True),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicens=
ing/subjectAddition",
> > > > +            min_count=3D1,
> > > > +            compact=3D"expandedlicensing_subjectAddition",
> > > > +        )
> > > > +        # A License participating in a 'with addition' model.
> > > > +        cls._add_property(
> > > > +            "expandedlicensing_subjectExtendableLicense",
> > > > +            ObjectProp(expandedlicensing_ExtendableLicense, True),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicens=
ing/subjectExtendableLicense",
> > > > +            min_count=3D1,
> > > > +            compact=3D"expandedlicensing_subjectExtendableLicense",
> > > > +        )
> > > > +
> > > > +
> > > > +# A type of extension consisting of a list of name value pairs.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Extension/CdxPropertie=
sExtension", compact_type=3D"extension_CdxPropertiesExtension", abstract=3D=
False)
> > > > +class extension_CdxPropertiesExtension(extension_Extension):
> > > > +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Provides a map of a property names to a values.
> > > > +        cls._add_property(
> > > > +            "extension_cdxProperty",
> > > > +            ListProp(ObjectProp(extension_CdxPropertyEntry, False)=
),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Extension/cdxP=
roperty",
> > > > +            min_count=3D1,
> > > > +            compact=3D"extension_cdxProperty",
> > > > +        )
> > > > +
> > > > +
> > > > +# Provides a CVSS version 2.0 assessment for a vulnerability.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Security/CvssV2VulnAss=
essmentRelationship", compact_type=3D"security_CvssV2VulnAssessmentRelation=
ship", abstract=3DFalse)
> > > > +class security_CvssV2VulnAssessmentRelationship(security_VulnAsses=
smentRelationship):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Provides a numerical (0-10) representation of the severi=
ty of a vulnerability.
> > > > +        cls._add_property(
> > > > +            "security_score",
> > > > +            FloatProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/score=
",
> > > > +            min_count=3D1,
> > > > +            compact=3D"security_score",
> > > > +        )
> > > > +        # Specifies the CVSS vector string for a vulnerability.
> > > > +        cls._add_property(
> > > > +            "security_vectorString",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/vecto=
rString",
> > > > +            min_count=3D1,
> > > > +            compact=3D"security_vectorString",
> > > > +        )
> > > > +
> > > > +
> > > > +# Provides a CVSS version 3 assessment for a vulnerability.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Security/CvssV3VulnAss=
essmentRelationship", compact_type=3D"security_CvssV3VulnAssessmentRelation=
ship", abstract=3DFalse)
> > > > +class security_CvssV3VulnAssessmentRelationship(security_VulnAsses=
smentRelationship):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Provides a numerical (0-10) representation of the severi=
ty of a vulnerability.
> > > > +        cls._add_property(
> > > > +            "security_score",
> > > > +            FloatProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/score=
",
> > > > +            min_count=3D1,
> > > > +            compact=3D"security_score",
> > > > +        )
> > > > +        # Specifies the CVSS qualitative severity rating of a vuln=
erability in relation to a piece of software.
> > > > +        cls._add_property(
> > > > +            "security_severity",
> > > > +            EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Security/Cv=
ssSeverityType/critical", "critical"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Security/Cv=
ssSeverityType/high", "high"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Security/Cv=
ssSeverityType/low", "low"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Security/Cv=
ssSeverityType/medium", "medium"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Security/Cv=
ssSeverityType/none", "none"),
> > > > +                ]),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/sever=
ity",
> > > > +            min_count=3D1,
> > > > +            compact=3D"security_severity",
> > > > +        )
> > > > +        # Specifies the CVSS vector string for a vulnerability.
> > > > +        cls._add_property(
> > > > +            "security_vectorString",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/vecto=
rString",
> > > > +            min_count=3D1,
> > > > +            compact=3D"security_vectorString",
> > > > +        )
> > > > +
> > > > +
> > > > +# Provides a CVSS version 4 assessment for a vulnerability.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Security/CvssV4VulnAss=
essmentRelationship", compact_type=3D"security_CvssV4VulnAssessmentRelation=
ship", abstract=3DFalse)
> > > > +class security_CvssV4VulnAssessmentRelationship(security_VulnAsses=
smentRelationship):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Provides a numerical (0-10) representation of the severi=
ty of a vulnerability.
> > > > +        cls._add_property(
> > > > +            "security_score",
> > > > +            FloatProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/score=
",
> > > > +            min_count=3D1,
> > > > +            compact=3D"security_score",
> > > > +        )
> > > > +        # Specifies the CVSS qualitative severity rating of a vuln=
erability in relation to a piece of software.
> > > > +        cls._add_property(
> > > > +            "security_severity",
> > > > +            EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Security/Cv=
ssSeverityType/critical", "critical"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Security/Cv=
ssSeverityType/high", "high"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Security/Cv=
ssSeverityType/low", "low"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Security/Cv=
ssSeverityType/medium", "medium"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Security/Cv=
ssSeverityType/none", "none"),
> > > > +                ]),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/sever=
ity",
> > > > +            min_count=3D1,
> > > > +            compact=3D"security_severity",
> > > > +        )
> > > > +        # Specifies the CVSS vector string for a vulnerability.
> > > > +        cls._add_property(
> > > > +            "security_vectorString",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/vecto=
rString",
> > > > +            min_count=3D1,
> > > > +            compact=3D"security_vectorString",
> > > > +        )
> > > > +
> > > > +
> > > > +# Provides an EPSS assessment for a vulnerability.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Security/EpssVulnAsses=
smentRelationship", compact_type=3D"security_EpssVulnAssessmentRelationship=
", abstract=3DFalse)
> > > > +class security_EpssVulnAssessmentRelationship(security_VulnAssessm=
entRelationship):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # The percentile of the current probability score.
> > > > +        cls._add_property(
> > > > +            "security_percentile",
> > > > +            FloatProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/perce=
ntile",
> > > > +            min_count=3D1,
> > > > +            compact=3D"security_percentile",
> > > > +        )
> > > > +        # A probability score between 0 and 1 of a vulnerability b=
eing exploited.
> > > > +        cls._add_property(
> > > > +            "security_probability",
> > > > +            FloatProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/proba=
bility",
> > > > +            min_count=3D1,
> > > > +            compact=3D"security_probability",
> > > > +        )
> > > > +
> > > > +
> > > > +# Provides an exploit assessment of a vulnerability.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Security/ExploitCatalo=
gVulnAssessmentRelationship", compact_type=3D"security_ExploitCatalogVulnAs=
sessmentRelationship", abstract=3DFalse)
> > > > +class security_ExploitCatalogVulnAssessmentRelationship(security_V=
ulnAssessmentRelationship):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Specifies the exploit catalog type.
> > > > +        cls._add_property(
> > > > +            "security_catalogType",
> > > > +            EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Security/Ex=
ploitCatalogType/kev", "kev"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Security/Ex=
ploitCatalogType/other", "other"),
> > > > +                ]),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/catal=
ogType",
> > > > +            min_count=3D1,
> > > > +            compact=3D"security_catalogType",
> > > > +        )
> > > > +        # Describe that a CVE is known to have an exploit because =
it's been listed in an exploit catalog.
> > > > +        cls._add_property(
> > > > +            "security_exploited",
> > > > +            BooleanProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/explo=
ited",
> > > > +            min_count=3D1,
> > > > +            compact=3D"security_exploited",
> > > > +        )
> > > > +        # Provides the location of an exploit catalog.
> > > > +        cls._add_property(
> > > > +            "security_locator",
> > > > +            AnyURIProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/locat=
or",
> > > > +            min_count=3D1,
> > > > +            compact=3D"security_locator",
> > > > +        )
> > > > +
> > > > +
> > > > +# Provides an SSVC assessment for a vulnerability.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Security/SsvcVulnAsses=
smentRelationship", compact_type=3D"security_SsvcVulnAssessmentRelationship=
", abstract=3DFalse)
> > > > +class security_SsvcVulnAssessmentRelationship(security_VulnAssessm=
entRelationship):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Provide the enumeration of possible decisions in the
> > > > +        # [Stakeholder-Specific Vulnerability Categorization (SSVC=
) decision tree](https://www.cisa.gov/stakeholder-specific-vulnerability-ca=
tegorization-ssvc).
> > > > +        cls._add_property(
> > > > +            "security_decisionType",
> > > > +            EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Security/Ss=
vcDecisionType/act", "act"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Security/Ss=
vcDecisionType/attend", "attend"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Security/Ss=
vcDecisionType/track", "track"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Security/Ss=
vcDecisionType/trackStar", "trackStar"),
> > > > +                ]),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/decis=
ionType",
> > > > +            min_count=3D1,
> > > > +            compact=3D"security_decisionType",
> > > > +        )
> > > > +
> > > > +
> > > > +# Abstract ancestor class for all VEX relationships
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Security/VexVulnAssess=
mentRelationship", compact_type=3D"security_VexVulnAssessmentRelationship",=
 abstract=3DTrue)
> > > > +class security_VexVulnAssessmentRelationship(security_VulnAssessme=
ntRelationship):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Conveys information about how VEX status was determined.
> > > > +        cls._add_property(
> > > > +            "security_statusNotes",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/statu=
sNotes",
> > > > +            compact=3D"security_statusNotes",
> > > > +        )
> > > > +        # Specifies the version of a VEX statement.
> > > > +        cls._add_property(
> > > > +            "security_vexVersion",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/vexVe=
rsion",
> > > > +            compact=3D"security_vexVersion",
> > > > +        )
> > > > +
> > > > +
> > > > +# Specifies a vulnerability and its associated information.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Security/Vulnerability=
", compact_type=3D"security_Vulnerability", abstract=3DFalse)
> > > > +class security_Vulnerability(Artifact):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Specifies a time when a vulnerability assessment was mod=
ified
> > > > +        cls._add_property(
> > > > +            "security_modifiedTime",
> > > > +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d=
:\d\d:\d\dZ$",),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/modif=
iedTime",
> > > > +            compact=3D"security_modifiedTime",
> > > > +        )
> > > > +        # Specifies the time when a vulnerability was published.
> > > > +        cls._add_property(
> > > > +            "security_publishedTime",
> > > > +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d=
:\d\d:\d\dZ$",),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/publi=
shedTime",
> > > > +            compact=3D"security_publishedTime",
> > > > +        )
> > > > +        # Specified the time and date when a vulnerability was wit=
hdrawn.
> > > > +        cls._add_property(
> > > > +            "security_withdrawnTime",
> > > > +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d=
:\d\d:\d\dZ$",),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/withd=
rawnTime",
> > > > +            compact=3D"security_withdrawnTime",
> > > > +        )
> > > > +
> > > > +
> > > > +# A distinct article or unit related to Software.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Software/SoftwareArtif=
act", compact_type=3D"software_SoftwareArtifact", abstract=3DTrue)
> > > > +class software_SoftwareArtifact(Artifact):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Provides additional purpose information of the software =
artifact.
> > > > +        cls._add_property(
> > > > +            "software_additionalPurpose",
> > > > +            ListProp(EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/application", "application"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/archive", "archive"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/bom", "bom"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/configuration", "configuration"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/container", "container"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/data", "data"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/device", "device"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/deviceDriver", "deviceDriver"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/diskImage", "diskImage"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/documentation", "documentation"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/evidence", "evidence"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/executable", "executable"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/file", "file"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/filesystemImage", "filesystemImage"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/firmware", "firmware"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/framework", "framework"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/install", "install"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/library", "library"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/manifest", "manifest"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/model", "model"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/module", "module"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/operatingSystem", "operatingSystem"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/other", "other"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/patch", "patch"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/platform", "platform"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/requirement", "requirement"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/source", "source"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/specification", "specification"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/test", "test"),
> > > > +                ])),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/addit=
ionalPurpose",
> > > > +            compact=3D"software_additionalPurpose",
> > > > +        )
> > > > +        # Provides a place for the SPDX data creator to record ack=
nowledgement text for
> > > > +        # a software Package, File or Snippet.
> > > > +        cls._add_property(
> > > > +            "software_attributionText",
> > > > +            ListProp(StringProp()),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/attri=
butionText",
> > > > +            compact=3D"software_attributionText",
> > > > +        )
> > > > +        # A canonical, unique, immutable identifier of the artifac=
t content, that may be
> > > > +        # used for verifying its identity and/or integrity.
> > > > +        cls._add_property(
> > > > +            "software_contentIdentifier",
> > > > +            ListProp(ObjectProp(software_ContentIdentifier, False)=
),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/conte=
ntIdentifier",
> > > > +            compact=3D"software_contentIdentifier",
> > > > +        )
> > > > +        # Identifies the text of one or more copyright notices for=
 a software Package,
> > > > +        # File or Snippet, if any.
> > > > +        cls._add_property(
> > > > +            "software_copyrightText",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/copyr=
ightText",
> > > > +            compact=3D"software_copyrightText",
> > > > +        )
> > > > +        # Provides information about the primary purpose of the so=
ftware artifact.
> > > > +        cls._add_property(
> > > > +            "software_primaryPurpose",
> > > > +            EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/application", "application"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/archive", "archive"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/bom", "bom"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/configuration", "configuration"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/container", "container"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/data", "data"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/device", "device"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/deviceDriver", "deviceDriver"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/diskImage", "diskImage"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/documentation", "documentation"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/evidence", "evidence"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/executable", "executable"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/file", "file"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/filesystemImage", "filesystemImage"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/firmware", "firmware"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/framework", "framework"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/install", "install"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/library", "library"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/manifest", "manifest"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/model", "model"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/module", "module"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/operatingSystem", "operatingSystem"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/other", "other"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/patch", "patch"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/platform", "platform"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/requirement", "requirement"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/source", "source"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/specification", "specification"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/test", "test"),
> > > > +                ]),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/prima=
ryPurpose",
> > > > +            compact=3D"software_primaryPurpose",
> > > > +        )
> > > > +
> > > > +
> > > > +# A container for a grouping of SPDX-3.0 content characterizing de=
tails
> > > > +# (provenence, composition, licensing, etc.) about a product.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Core/Bom", compact_typ=
e=3D"Bom", abstract=3DFalse)
> > > > +class Bom(Bundle):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +
> > > > +# A license that is not listed on the SPDX License List.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/Cust=
omLicense", compact_type=3D"expandedlicensing_CustomLicense", abstract=3DFa=
lse)
> > > > +class expandedlicensing_CustomLicense(expandedlicensing_License):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +
> > > > +# Connects a vulnerability and an element designating the element =
as a product
> > > > +# affected by the vulnerability.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Security/VexAffectedVu=
lnAssessmentRelationship", compact_type=3D"security_VexAffectedVulnAssessme=
ntRelationship", abstract=3DFalse)
> > > > +class security_VexAffectedVulnAssessmentRelationship(security_VexV=
ulnAssessmentRelationship):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Provides advise on how to mitigate or remediate a vulner=
ability when a VEX product
> > > > +        # is affected by it.
> > > > +        cls._add_property(
> > > > +            "security_actionStatement",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/actio=
nStatement",
> > > > +            min_count=3D1,
> > > > +            compact=3D"security_actionStatement",
> > > > +        )
> > > > +        # Records the time when a recommended action was communica=
ted in a VEX statement
> > > > +        # to mitigate a vulnerability.
> > > > +        cls._add_property(
> > > > +            "security_actionStatementTime",
> > > > +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d=
:\d\d:\d\dZ$",),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/actio=
nStatementTime",
> > > > +            compact=3D"security_actionStatementTime",
> > > > +        )
> > > > +
> > > > +
> > > > +# Links a vulnerability and elements representing products (in the=
 VEX sense) where
> > > > +# a fix has been applied and are no longer affected.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Security/VexFixedVulnA=
ssessmentRelationship", compact_type=3D"security_VexFixedVulnAssessmentRela=
tionship", abstract=3DFalse)
> > > > +class security_VexFixedVulnAssessmentRelationship(security_VexVuln=
AssessmentRelationship):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +
> > > > +# Links a vulnerability and one or more elements designating the l=
atter as products
> > > > +# not affected by the vulnerability.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Security/VexNotAffecte=
dVulnAssessmentRelationship", compact_type=3D"security_VexNotAffectedVulnAs=
sessmentRelationship", abstract=3DFalse)
> > > > +class security_VexNotAffectedVulnAssessmentRelationship(security_V=
exVulnAssessmentRelationship):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Explains why a VEX product is not affected by a vulnerab=
ility. It is an
> > > > +        # alternative in VexNotAffectedVulnAssessmentRelationship =
to the machine-readable
> > > > +        # justification label.
> > > > +        cls._add_property(
> > > > +            "security_impactStatement",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/impac=
tStatement",
> > > > +            compact=3D"security_impactStatement",
> > > > +        )
> > > > +        # Timestamp of impact statement.
> > > > +        cls._add_property(
> > > > +            "security_impactStatementTime",
> > > > +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d=
:\d\d:\d\dZ$",),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/impac=
tStatementTime",
> > > > +            compact=3D"security_impactStatementTime",
> > > > +        )
> > > > +        # Impact justification label to be used when linking a vul=
nerability to an element
> > > > +        # representing a VEX product with a VexNotAffectedVulnAsse=
ssmentRelationship
> > > > +        # relationship.
> > > > +        cls._add_property(
> > > > +            "security_justificationType",
> > > > +            EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Security/Ve=
xJustificationType/componentNotPresent", "componentNotPresent"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Security/Ve=
xJustificationType/inlineMitigationsAlreadyExist", "inlineMitigationsAlread=
yExist"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Security/Ve=
xJustificationType/vulnerableCodeCannotBeControlledByAdversary", "vulnerabl=
eCodeCannotBeControlledByAdversary"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Security/Ve=
xJustificationType/vulnerableCodeNotInExecutePath", "vulnerableCodeNotInExe=
cutePath"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Security/Ve=
xJustificationType/vulnerableCodeNotPresent", "vulnerableCodeNotPresent"),
> > > > +                ]),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/justi=
ficationType",
> > > > +            compact=3D"security_justificationType",
> > > > +        )
> > > > +
> > > > +
> > > > +# Designates elements as products where the impact of a vulnerabil=
ity is being
> > > > +# investigated.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Security/VexUnderInves=
tigationVulnAssessmentRelationship", compact_type=3D"security_VexUnderInves=
tigationVulnAssessmentRelationship", abstract=3DFalse)
> > > > +class security_VexUnderInvestigationVulnAssessmentRelationship(sec=
urity_VexVulnAssessmentRelationship):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +
> > > > +# Refers to any object that stores content on a computer.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Software/File", compac=
t_type=3D"software_File", abstract=3DFalse)
> > > > +class software_File(software_SoftwareArtifact):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Provides information about the content type of an Elemen=
t or a Property.
> > > > +        cls._add_property(
> > > > +            "contentType",
> > > > +            StringProp(pattern=3Dr"^[^\/]+\/[^\/]+$",),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/contentTy=
pe",
> > > > +            compact=3D"contentType",
> > > > +        )
> > > > +        # Describes if a given file is a directory or non-director=
y kind of file.
> > > > +        cls._add_property(
> > > > +            "software_fileKind",
> > > > +            EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Fi=
leKindType/directory", "directory"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Fi=
leKindType/file", "file"),
> > > > +                ]),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/fileK=
ind",
> > > > +            compact=3D"software_fileKind",
> > > > +        )
> > > > +
> > > > +
> > > > +# Refers to any unit of content that can be associated with a dist=
ribution of
> > > > +# software.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Software/Package", com=
pact_type=3D"software_Package", abstract=3DFalse)
> > > > +class software_Package(software_SoftwareArtifact):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Identifies the download Uniform Resource Identifier for =
the package at the time
> > > > +        # that the document was created.
> > > > +        cls._add_property(
> > > > +            "software_downloadLocation",
> > > > +            AnyURIProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/downl=
oadLocation",
> > > > +            compact=3D"software_downloadLocation",
> > > > +        )
> > > > +        # A place for the SPDX document creator to record a websit=
e that serves as the
> > > > +        # package's home page.
> > > > +        cls._add_property(
> > > > +            "software_homePage",
> > > > +            AnyURIProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/homeP=
age",
> > > > +            compact=3D"software_homePage",
> > > > +        )
> > > > +        # Provides a place for the SPDX data creator to record the=
 package URL string
> > > > +        # (in accordance with the Package URL specification) for a=
 software Package.
> > > > +        cls._add_property(
> > > > +            "software_packageUrl",
> > > > +            AnyURIProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/packa=
geUrl",
> > > > +            compact=3D"software_packageUrl",
> > > > +        )
> > > > +        # Identify the version of a package.
> > > > +        cls._add_property(
> > > > +            "software_packageVersion",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/packa=
geVersion",
> > > > +            compact=3D"software_packageVersion",
> > > > +        )
> > > > +        # Records any relevant background information or additiona=
l comments
> > > > +        # about the origin of the package.
> > > > +        cls._add_property(
> > > > +            "software_sourceInfo",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/sourc=
eInfo",
> > > > +            compact=3D"software_sourceInfo",
> > > > +        )
> > > > +
> > > > +
> > > > +# A collection of SPDX Elements describing a single package.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Software/Sbom", compac=
t_type=3D"software_Sbom", abstract=3DFalse)
> > > > +class software_Sbom(Bom):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Provides information about the type of an SBOM.
> > > > +        cls._add_property(
> > > > +            "software_sbomType",
> > > > +            ListProp(EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Sb=
omType/analyzed", "analyzed"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Sb=
omType/build", "build"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Sb=
omType/deployed", "deployed"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Sb=
omType/design", "design"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Sb=
omType/runtime", "runtime"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Sb=
omType/source", "source"),
> > > > +                ])),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/sbomT=
ype",
> > > > +            compact=3D"software_sbomType",
> > > > +        )
> > > > +
> > > > +
> > > > +# Describes a certain part of a file.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Software/Snippet", com=
pact_type=3D"software_Snippet", abstract=3DFalse)
> > > > +class software_Snippet(software_SoftwareArtifact):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Defines the byte range in the original host file that th=
e snippet information
> > > > +        # applies to.
> > > > +        cls._add_property(
> > > > +            "software_byteRange",
> > > > +            ObjectProp(PositiveIntegerRange, False),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/byteR=
ange",
> > > > +            compact=3D"software_byteRange",
> > > > +        )
> > > > +        # Defines the line range in the original host file that th=
e snippet information
> > > > +        # applies to.
> > > > +        cls._add_property(
> > > > +            "software_lineRange",
> > > > +            ObjectProp(PositiveIntegerRange, False),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/lineR=
ange",
> > > > +            compact=3D"software_lineRange",
> > > > +        )
> > > > +        # Defines the original host file that the snippet informat=
ion applies to.
> > > > +        cls._add_property(
> > > > +            "software_snippetFromFile",
> > > > +            ObjectProp(software_File, True),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/snipp=
etFromFile",
> > > > +            min_count=3D1,
> > > > +            compact=3D"software_snippetFromFile",
> > > > +        )
> > > > +
> > > > +
> > > > +# Specifies an AI package and its associated information.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/AI/AIPackage", compact=
_type=3D"ai_AIPackage", abstract=3DFalse)
> > > > +class ai_AIPackage(software_Package):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Indicates whether the system can perform a decision or a=
ction without human
> > > > +        # involvement or guidance.
> > > > +        cls._add_property(
> > > > +            "ai_autonomyType",
> > > > +            EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Presen=
ceType/no", "no"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Presen=
ceType/noAssertion", "noAssertion"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Presen=
ceType/yes", "yes"),
> > > > +                ]),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/autonomyTyp=
e",
> > > > +            compact=3D"ai_autonomyType",
> > > > +        )
> > > > +        # Captures the domain in which the AI package can be used.
> > > > +        cls._add_property(
> > > > +            "ai_domain",
> > > > +            ListProp(StringProp()),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/domain",
> > > > +            compact=3D"ai_domain",
> > > > +        )
> > > > +        # Indicates the amount of energy consumption incurred by a=
n AI model.
> > > > +        cls._add_property(
> > > > +            "ai_energyConsumption",
> > > > +            ObjectProp(ai_EnergyConsumption, False),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/energyConsu=
mption",
> > > > +            compact=3D"ai_energyConsumption",
> > > > +        )
> > > > +        # Records a hyperparameter used to build the AI model cont=
ained in the AI
> > > > +        # package.
> > > > +        cls._add_property(
> > > > +            "ai_hyperparameter",
> > > > +            ListProp(ObjectProp(DictionaryEntry, False)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/hyperparame=
ter",
> > > > +            compact=3D"ai_hyperparameter",
> > > > +        )
> > > > +        # Provides relevant information about the AI software, not=
 including the model
> > > > +        # description.
> > > > +        cls._add_property(
> > > > +            "ai_informationAboutApplication",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/information=
AboutApplication",
> > > > +            compact=3D"ai_informationAboutApplication",
> > > > +        )
> > > > +        # Describes relevant information about different steps of =
the training process.
> > > > +        cls._add_property(
> > > > +            "ai_informationAboutTraining",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/information=
AboutTraining",
> > > > +            compact=3D"ai_informationAboutTraining",
> > > > +        )
> > > > +        # Captures a limitation of the AI software.
> > > > +        cls._add_property(
> > > > +            "ai_limitation",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/limitation",
> > > > +            compact=3D"ai_limitation",
> > > > +        )
> > > > +        # Records the measurement of prediction quality of the AI =
model.
> > > > +        cls._add_property(
> > > > +            "ai_metric",
> > > > +            ListProp(ObjectProp(DictionaryEntry, False)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/metric",
> > > > +            compact=3D"ai_metric",
> > > > +        )
> > > > +        # Captures the threshold that was used for computation of =
a metric described in
> > > > +        # the metric field.
> > > > +        cls._add_property(
> > > > +            "ai_metricDecisionThreshold",
> > > > +            ListProp(ObjectProp(DictionaryEntry, False)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/metricDecis=
ionThreshold",
> > > > +            compact=3D"ai_metricDecisionThreshold",
> > > > +        )
> > > > +        # Describes all the preprocessing steps applied to the tra=
ining data before the
> > > > +        # model training.
> > > > +        cls._add_property(
> > > > +            "ai_modelDataPreprocessing",
> > > > +            ListProp(StringProp()),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/modelDataPr=
eprocessing",
> > > > +            compact=3D"ai_modelDataPreprocessing",
> > > > +        )
> > > > +        # Describes methods that can be used to explain the result=
s from the AI model.
> > > > +        cls._add_property(
> > > > +            "ai_modelExplainability",
> > > > +            ListProp(StringProp()),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/modelExplai=
nability",
> > > > +            compact=3D"ai_modelExplainability",
> > > > +        )
> > > > +        # Records the results of general safety risk assessment of=
 the AI system.
> > > > +        cls._add_property(
> > > > +            "ai_safetyRiskAssessment",
> > > > +            EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/AI/SafetyRi=
skAssessmentType/high", "high"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/AI/SafetyRi=
skAssessmentType/low", "low"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/AI/SafetyRi=
skAssessmentType/medium", "medium"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/AI/SafetyRi=
skAssessmentType/serious", "serious"),
> > > > +                ]),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/safetyRiskA=
ssessment",
> > > > +            compact=3D"ai_safetyRiskAssessment",
> > > > +        )
> > > > +        # Captures a standard that is being complied with.
> > > > +        cls._add_property(
> > > > +            "ai_standardCompliance",
> > > > +            ListProp(StringProp()),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/standardCom=
pliance",
> > > > +            compact=3D"ai_standardCompliance",
> > > > +        )
> > > > +        # Records the type of the model used in the AI software.
> > > > +        cls._add_property(
> > > > +            "ai_typeOfModel",
> > > > +            ListProp(StringProp()),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/typeOfModel=
",
> > > > +            compact=3D"ai_typeOfModel",
> > > > +        )
> > > > +        # Records if sensitive personal information is used during=
 model training or
> > > > +        # could be used during the inference.
> > > > +        cls._add_property(
> > > > +            "ai_useSensitivePersonalInformation",
> > > > +            EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Presen=
ceType/no", "no"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Presen=
ceType/noAssertion", "noAssertion"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Presen=
ceType/yes", "yes"),
> > > > +                ]),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/useSensitiv=
ePersonalInformation",
> > > > +            compact=3D"ai_useSensitivePersonalInformation",
> > > > +        )
> > > > +
> > > > +
> > > > +# Specifies a data package and its associated information.
> > > > +@register("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetPackage=
", compact_type=3D"dataset_DatasetPackage", abstract=3DFalse)
> > > > +class dataset_DatasetPackage(software_Package):
> > > > +    NODE_KIND =3D NodeKind.IRI
> > > > +    ID_ALIAS =3D "spdxId"
> > > > +    NAMED_INDIVIDUALS =3D {
> > > > +    }
> > > > +
> > > > +    @classmethod
> > > > +    def _register_props(cls):
> > > > +        super()._register_props()
> > > > +        # Describes the anonymization methods used.
> > > > +        cls._add_property(
> > > > +            "dataset_anonymizationMethodUsed",
> > > > +            ListProp(StringProp()),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/anonym=
izationMethodUsed",
> > > > +            compact=3D"dataset_anonymizationMethodUsed",
> > > > +        )
> > > > +        # Describes the confidentiality level of the data points c=
ontained in the dataset.
> > > > +        cls._add_property(
> > > > +            "dataset_confidentialityLevel",
> > > > +            EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Con=
fidentialityLevelType/amber", "amber"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Con=
fidentialityLevelType/clear", "clear"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Con=
fidentialityLevelType/green", "green"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Con=
fidentialityLevelType/red", "red"),
> > > > +                ]),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/confid=
entialityLevel",
> > > > +            compact=3D"dataset_confidentialityLevel",
> > > > +        )
> > > > +        # Describes how the dataset was collected.
> > > > +        cls._add_property(
> > > > +            "dataset_dataCollectionProcess",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/dataCo=
llectionProcess",
> > > > +            compact=3D"dataset_dataCollectionProcess",
> > > > +        )
> > > > +        # Describes the preprocessing steps that were applied to t=
he raw data to create the given dataset.
> > > > +        cls._add_property(
> > > > +            "dataset_dataPreprocessing",
> > > > +            ListProp(StringProp()),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/dataPr=
eprocessing",
> > > > +            compact=3D"dataset_dataPreprocessing",
> > > > +        )
> > > > +        # The field describes the availability of a dataset.
> > > > +        cls._add_property(
> > > > +            "dataset_datasetAvailability",
> > > > +            EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Dat=
asetAvailabilityType/clickthrough", "clickthrough"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Dat=
asetAvailabilityType/directDownload", "directDownload"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Dat=
asetAvailabilityType/query", "query"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Dat=
asetAvailabilityType/registration", "registration"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Dat=
asetAvailabilityType/scrapingScript", "scrapingScript"),
> > > > +                ]),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/datase=
tAvailability",
> > > > +            compact=3D"dataset_datasetAvailability",
> > > > +        )
> > > > +        # Describes potentially noisy elements of the dataset.
> > > > +        cls._add_property(
> > > > +            "dataset_datasetNoise",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/datase=
tNoise",
> > > > +            compact=3D"dataset_datasetNoise",
> > > > +        )
> > > > +        # Captures the size of the dataset.
> > > > +        cls._add_property(
> > > > +            "dataset_datasetSize",
> > > > +            NonNegativeIntegerProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/datase=
tSize",
> > > > +            compact=3D"dataset_datasetSize",
> > > > +        )
> > > > +        # Describes the type of the given dataset.
> > > > +        cls._add_property(
> > > > +            "dataset_datasetType",
> > > > +            ListProp(EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Dat=
asetType/audio", "audio"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Dat=
asetType/categorical", "categorical"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Dat=
asetType/graph", "graph"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Dat=
asetType/image", "image"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Dat=
asetType/noAssertion", "noAssertion"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Dat=
asetType/numeric", "numeric"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Dat=
asetType/other", "other"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Dat=
asetType/sensor", "sensor"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Dat=
asetType/structured", "structured"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Dat=
asetType/syntactic", "syntactic"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Dat=
asetType/text", "text"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Dat=
asetType/timeseries", "timeseries"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Dat=
asetType/timestamp", "timestamp"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Dat=
asetType/video", "video"),
> > > > +                ])),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/datase=
tType",
> > > > +            min_count=3D1,
> > > > +            compact=3D"dataset_datasetType",
> > > > +        )
> > > > +        # Describes a mechanism to update the dataset.
> > > > +        cls._add_property(
> > > > +            "dataset_datasetUpdateMechanism",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/datase=
tUpdateMechanism",
> > > > +            compact=3D"dataset_datasetUpdateMechanism",
> > > > +        )
> > > > +        # Describes if any sensitive personal information is prese=
nt in the dataset.
> > > > +        cls._add_property(
> > > > +            "dataset_hasSensitivePersonalInformation",
> > > > +            EnumProp([
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Presen=
ceType/no", "no"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Presen=
ceType/noAssertion", "noAssertion"),
> > > > +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Presen=
ceType/yes", "yes"),
> > > > +                ]),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/hasSen=
sitivePersonalInformation",
> > > > +            compact=3D"dataset_hasSensitivePersonalInformation",
> > > > +        )
> > > > +        # Describes what the given dataset should be used for.
> > > > +        cls._add_property(
> > > > +            "dataset_intendedUse",
> > > > +            StringProp(),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/intend=
edUse",
> > > > +            compact=3D"dataset_intendedUse",
> > > > +        )
> > > > +        # Records the biases that the dataset is known to encompas=
s.
> > > > +        cls._add_property(
> > > > +            "dataset_knownBias",
> > > > +            ListProp(StringProp()),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/knownB=
ias",
> > > > +            compact=3D"dataset_knownBias",
> > > > +        )
> > > > +        # Describes a sensor used for collecting the data.
> > > > +        cls._add_property(
> > > > +            "dataset_sensor",
> > > > +            ListProp(ObjectProp(DictionaryEntry, False)),
> > > > +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/sensor=
",
> > > > +            compact=3D"dataset_sensor",
> > > > +        )
> > > > +
> > > > +
> > > > +"""Format Guard"""
> > > > +# fmt: on
> > > > +
> > > > +
> > > > +def main():
> > > > +    import argparse
> > > > +    from pathlib import Path
> > > > +
> > > > +    parser =3D argparse.ArgumentParser(description=3D"Python SHACL=
 model test")
> > > > +    parser.add_argument("infile", type=3DPath, help=3D"Input file")
> > > > +    parser.add_argument("--print", action=3D"store_true", help=3D"=
Print object tree")
> > > > +    parser.add_argument("--outfile", type=3DPath, help=3D"Output f=
ile")
> > > > +
> > > > +    args =3D parser.parse_args()
> > > > +
> > > > +    objectset =3D SHACLObjectSet()
> > > > +    with args.infile.open("r") as f:
> > > > +        d =3D JSONLDDeserializer()
> > > > +        d.read(f, objectset)
> > > > +
> > > > +    if args.print:
> > > > +        print_tree(objectset.objects)
> > > > +
> > > > +    if args.outfile:
> > > > +        with args.outfile.open("wb") as f:
> > > > +            s =3D JSONLDSerializer()
> > > > +            s.write(objectset, f)
> > > > +
> > > > +    return 0
> > > > +
> > > > +
> > > > +if __name__ =3D=3D "__main__":
> > > > +    sys.exit(main())
> > > > diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks=
=2Epy
> > > > new file mode 100644
> > > > index 0000000000..52329760b6
> > > > --- /dev/null
> > > > +++ b/meta/lib/oe/spdx30_tasks.py
> > > > @@ -0,0 +1,1348 @@
> > > > +#
> > > > +# Copyright OpenEmbedded Contributors
> > > > +#
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > +#
> > > > +
> > > > +import json
> > > > +import oe.cve_check
> > > > +import oe.packagedata
> > > > +import oe.patch
> > > > +import oe.sbom30
> > > > +import oe.spdx30
> > > > +import oe.spdx_common
> > > > +import oe.sdk
> > > > +import os
> > > > +
> > > > +from contextlib import contextmanager
> > > > +from datetime import datetime, timezone
> > > > +from pathlib import Path
> > > > +
> > > > +
> > > > +def walk_error(err):
> > > > +    bb.error(f"ERROR walking {err.filename}: {err}")
> > > > +
> > > > +
> > > > +def set_timestamp_now(d, o, prop):
> > > > +    if d.getVar("SPDX_INCLUDE_TIMESTAMPS") =3D=3D "1":
> > > > +        setattr(o, prop, datetime.now(timezone.utc))
> > > > +    else:
> > > > +        # Doing this helps to validated that the property actually=
 exists, and
> > > > +        # also that it is not mandatory
> > > > +        delattr(o, prop)
> > > > +
> > > > +
> > > > +def add_license_expression(d, objset, license_expression, license_=
data):
> > > > +    simple_license_text =3D {}
> > > > +    license_text_map =3D {}
> > > > +    license_ref_idx =3D 0
> > > > +
> > > > +    def add_license_text(name):
> > > > +        nonlocal objset
> > > > +        nonlocal simple_license_text
> > > > +
> > > > +        if name in simple_license_text:
> > > > +            return simple_license_text[name]
> > > > +
> > > > +        lic =3D objset.find_filter(
> > > > +            oe.spdx30.simplelicensing_SimpleLicensingText,
> > > > +            name=3Dname,
> > > > +        )
> > > > +
> > > > +        if lic is not None:
> > > > +            simple_license_text[name] =3D lic
> > > > +            return lic
> > > > +
> > > > +        lic =3D objset.add(
> > > > +            oe.spdx30.simplelicensing_SimpleLicensingText(
> > > > +                _id=3Dobjset.new_spdxid("license-text", name),
> > > > +                creationInfo=3Dobjset.doc.creationInfo,
> > > > +                name=3Dname,
> > > > +            )
> > > > +        )
> > > > +        objset.set_element_alias(lic)
> > > > +        simple_license_text[name] =3D lic
> > > > +
> > > > +        if name =3D=3D "PD":
> > > > +            lic.simplelicensing_licenseText =3D "Software released=
 to the public domain"
> > > > +            return lic
> > > > +
> > > > +        # Seach for the license in COMMON_LICENSE_DIR and LICENSE_=
PATH
> > > > +        for directory in [d.getVar("COMMON_LICENSE_DIR")] + (
> > > > +            d.getVar("LICENSE_PATH") or ""
> > > > +        ).split():
> > > > +            try:
> > > > +                with (Path(directory) / name).open(errors=3D"repla=
ce") as f:
> > > > +                    lic.simplelicensing_licenseText =3D f.read()
> > > > +                    return lic
> > > > +
> > > > +            except FileNotFoundError:
> > > > +                pass
> > > > +
> > > > +        # If it's not SPDX or PD, then NO_GENERIC_LICENSE must be =
set
> > > > +        filename =3D d.getVarFlag("NO_GENERIC_LICENSE", name)
> > > > +        if filename:
> > > > +            filename =3D d.expand("${S}/" + filename)
> > > > +            with open(filename, errors=3D"replace") as f:
> > > > +                lic.simplelicensing_licenseText =3D f.read()
> > > > +                return lic
> > > > +        else:
> > > > +            bb.fatal("Cannot find any text for license %s" % name)
> > > > +
> > > > +    def convert(l):
> > > > +        nonlocal license_text_map
> > > > +        nonlocal license_ref_idx
> > > > +
> > > > +        if l =3D=3D "(" or l =3D=3D ")":
> > > > +            return l
> > > > +
> > > > +        if l =3D=3D "&":
> > > > +            return "AND"
> > > > +
> > > > +        if l =3D=3D "|":
> > > > +            return "OR"
> > > > +
> > > > +        if l =3D=3D "CLOSED":
> > > > +            return "NONE"
> > > > +
> > > > +        spdx_license =3D d.getVarFlag("SPDXLICENSEMAP", l) or l
> > > > +        if spdx_license in license_data["licenses"]:
> > > > +            return spdx_license
> > > > +
> > > > +        spdx_license =3D "LicenseRef-" + l
> > > > +        if spdx_license not in license_text_map:
> > > > +            license_text_map[spdx_license] =3D oe.sbom30.get_eleme=
nt_link_id(
> > > > +                add_license_text(l)
> > > > +            )
> > > > +
> > > > +        return spdx_license
> > > > +
> > > > +    lic_split =3D (
> > > > +        license_expression.replace("(", " ( ")
> > > > +        .replace(")", " ) ")
> > > > +        .replace("|", " | ")
> > > > +        .replace("&", " & ")
> > > > +        .split()
> > > > +    )
> > > > +    spdx_license_expression =3D " ".join(convert(l) for l in lic_s=
plit)
> > > > +
> > > > +    o =3D objset.new_license_expression(
> > > > +        spdx_license_expression, license_data, license_text_map
> > > > +    )
> > > > +    objset.set_element_alias(o)
> > > > +    return o
> > > > +
> > > > +
> > > > +def add_package_files(
> > > > +    d,
> > > > +    objset,
> > > > +    topdir,
> > > > +    get_spdxid,
> > > > +    get_purposes,
> > > > +    license_data=3DNone,
> > > > +    *,
> > > > +    archive=3DNone,
> > > > +    ignore_dirs=3D[],
> > > > +    ignore_top_level_dirs=3D[],
> > > > +):
> > > > +    source_date_epoch =3D d.getVar("SOURCE_DATE_EPOCH")
> > > > +    if source_date_epoch:
> > > > +        source_date_epoch =3D int(source_date_epoch)
> > > > +
> > > > +    spdx_files =3D set()
> > > > +
> > > > +    file_counter =3D 1
> > > > +    if not os.path.exists(topdir):
> > > > +        bb.note(f"Skip {topdir}")
> > > > +        return spdx_files
> > > > +
> > > > +    for subdir, dirs, files in os.walk(topdir, onerror=3Dwalk_erro=
r):
> > > > +        dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
> > > > +        if subdir =3D=3D str(topdir):
> > > > +            dirs[:] =3D [d for d in dirs if d not in ignore_top_le=
vel_dirs]
> > > > +
> > > > +        dirs.sort()
> > > > +        files.sort()
> > > > +        for file in files:
> > > > +            filepath =3D Path(subdir) / file
> > > > +            if filepath.is_symlink() or not filepath.is_file():
> > > > +                continue
> > > > +
> > > > +            filename =3D str(filepath.relative_to(topdir))
> > > > +            file_purposes =3D get_purposes(filepath)
> > > > +
> > > > +            spdx_file =3D objset.new_file(
> > > > +                get_spdxid(file_counter),
> > > > +                filename,
> > > > +                filepath,
> > > > +                purposes=3Dfile_purposes,
> > > > +            )
> > > > +            spdx_files.add(spdx_file)
> > > > +
> > > > +            if (
> > > > +                oe.spdx30.software_SoftwarePurpose.source in file_=
purposes
> > > > +                and license_data is not None
> > > > +            ):
> > > > +                objset.scan_declared_licenses(spdx_file, filepath,=
 license_data)
> > > > +
> > > > +            if archive is not None:
> > > > +                with filepath.open("rb") as f:
> > > > +                    info =3D archive.gettarinfo(fileobj=3Df)
> > > > +                    info.name =3D filename
> > > > +                    info.uid =3D 0
> > > > +                    info.gid =3D 0
> > > > +                    info.uname =3D "root"
> > > > +                    info.gname =3D "root"
> > > > +
> > > > +                    if source_date_epoch is not None and info.mtim=
e > source_date_epoch:
> > > > +                        info.mtime =3D source_date_epoch
> > > > +
> > > > +                    archive.addfile(info, f)
> > > > +
> > > > +            file_counter +=3D 1
> > > > +
> > > > +    bb.debug(1, "Added %d files to %s" % (len(spdx_files), objset.=
doc._id))
> > > > +
> > > > +    return spdx_files
> > > > +
> > > > +
> > > > +def get_package_sources_from_debug(
> > > > +    d, package, package_files, sources, source_hash_cache
> > > > +):
> > > > +    def file_path_match(file_path, pkg_file):
> > > > +        if file_path.lstrip("/") =3D=3D pkg_file.name.lstrip("/"):
> > > > +            return True
> > > > +
> > > > +        for e in pkg_file.extension:
> > > > +            if isinstance(e, oe.sbom30.OEFileNameAliasExtension):
> > > > +                for a in e.aliases:
> > > > +                    if file_path.lstrip("/") =3D=3D a.lstrip("/"):
> > > > +                        return True
> > > > +
> > > > +        return False
> > > > +
> > > > +    debug_search_paths =3D [
> > > > +        Path(d.getVar("SPDXWORK")),
> > > > +        Path(d.getVar("PKGD")),
> > > > +        Path(d.getVar("STAGING_DIR_TARGET")),
> > > > +        Path(d.getVar("STAGING_DIR_NATIVE")),
> > > > +        Path(d.getVar("STAGING_KERNEL_DIR")),
> > > > +    ]
> > > > +
> > > > +    pkg_data =3D oe.packagedata.read_subpkgdata_extended(package, =
d)
> > > > +
> > > > +    if pkg_data is None:
> > > > +        return
> > > > +
> > > > +    dep_source_files =3D set()
> > > > +
> > > > +    for file_path, file_data in pkg_data["files_info"].items():
> > > > +        if not "debugsrc" in file_data:
> > > > +            continue
> > > > +
> > > > +        if not any(file_path_match(file_path, pkg_file) for pkg_fi=
le in package_files):
> > > > +            bb.fatal(
> > > > +                "No package file found for %s in %s; SPDX found: %=
s"
> > > > +                % (str(file_path), package, " ".join(p.name for p =
in package_files))
> > > > +            )
> > > > +            continue
> > > > +
> > > > +        for debugsrc in file_data["debugsrc"]:
> > > > +            for search in debug_search_paths:
> > > > +                if debugsrc.startswith("/usr/src/kernel"):
> > > > +                    debugsrc_path =3D search / debugsrc.replace("/=
usr/src/kernel/", "")
> > > > +                else:
> > > > +                    debugsrc_path =3D search / debugsrc.lstrip("/")
> > > > +
> > > > +                if debugsrc_path in source_hash_cache:
> > > > +                    file_sha256 =3D source_hash_cache[debugsrc_pat=
h]
> > > > +                    if file_sha256 is None:
> > > > +                        continue
> > > > +                else:
> > > > +                    # We can only hash files below, skip directori=
es, links, etc.
> > > > +                    if not debugsrc_path.is_file():
> > > > +                        source_hash_cache[debugsrc_path] =3D None
> > > > +                        continue
> > > > +
> > > > +                    file_sha256 =3D bb.utils.sha256_file(debugsrc_=
path)
> > > > +                    source_hash_cache[debugsrc_path] =3D file_sha2=
56
> > > > +
> > > > +                if file_sha256 in sources:
> > > > +                    source_file =3D sources[file_sha256]
> > > > +                    dep_source_files.add(source_file)
> > > > +                else:
> > > > +                    bb.debug(
> > > > +                        1,
> > > > +                        "Debug source %s with SHA256 %s not found =
in any dependency"
> > > > +                        % (str(debugsrc_path), file_sha256),
> > > > +                    )
> > > > +                break
> > > > +            else:
> > > > +                bb.debug(1, "Debug source %s not found" % debugsrc)
> > > > +
> > > > +    return dep_source_files
> > > > +
> > > > +
> > > > +def collect_dep_objsets(d, build):
> > > > +    deps =3D oe.spdx_common.get_spdx_deps(d)
> > > > +
> > > > +    dep_objsets =3D []
> > > > +    dep_builds =3D set()
> > > > +
> > > > +    dep_build_spdxids =3D set()
> > > > +    for dep in deps:
> > > > +        bb.debug(1, "Fetching SPDX for dependency %s" % (dep.pn))
> > > > +        dep_build, dep_objset =3D oe.sbom30.find_root_obj_in_jsonl=
d(
> > > > +            d, "recipes", "recipe-" + dep.pn, oe.spdx30.build_Build
> > > > +        )
> > > > +        # If the dependency is part of the taskhash, return it to =
be linked
> > > > +        # against. Otherwise, it cannot be linked against because =
this recipe
> > > > +        # will not rebuilt if dependency changes
> > > > +        if dep.in_taskhash:
> > > > +            dep_objsets.append(dep_objset)
> > > > +
> > > > +        # The build _can_ be linked against (by alias)
> > > > +        dep_builds.add(dep_build)
> > > > +
> > > > +    return dep_objsets, dep_builds
> > > > +
> > > > +
> > > > +def index_sources_by_hash(sources, dest):
> > > > +    for s in sources:
> > > > +        if not isinstance(s, oe.spdx30.software_File):
> > > > +            continue
> > > > +
> > > > +        if s.software_primaryPurpose !=3D oe.spdx30.software_Softw=
arePurpose.source:
> > > > +            continue
> > > > +
> > > > +        for v in s.verifiedUsing:
> > > > +            if v.algorithm =3D=3D oe.spdx30.HashAlgorithm.sha256:
> > > > +                if not v.hashValue in dest:
> > > > +                    dest[v.hashValue] =3D s
> > > > +                break
> > > > +        else:
> > > > +            bb.fatal(f"No SHA256 found for {s.name}")
> > > > +
> > > > +
> > > > +def collect_dep_sources(dep_objsets, dest):
> > > > +    for objset in dep_objsets:
> > > > +        # Don't collect sources from native recipes as they
> > > > +        # match non-native sources also.
> > > > +        if objset.is_native():
> > > > +            continue
> > > > +
> > > > +        bb.debug(1, "Fetching Sources for dependency %s" % (objset=
=2Edoc.name))
> > > > +
> > > > +        dep_build =3D objset.find_root(oe.spdx30.build_Build)
> > > > +        if not dep_build:
> > > > +            bb.fatal("Unable to find a build")
> > > > +
> > > > +        for e in objset.foreach_type(oe.spdx30.Relationship):
> > > > +            if dep_build is not e.from_:
> > > > +                continue
> > > > +
> > > > +            if e.relationshipType !=3D oe.spdx30.RelationshipType.=
hasInput:
> > > > +                continue
> > > > +
> > > > +            index_sources_by_hash(e.to, dest)
> > > > +
> > > > +
> > > > +def add_download_files(d, objset):
> > > > +    inputs =3D set()
> > > > +
> > > > +    urls =3D d.getVar("SRC_URI").split()
> > > > +    fetch =3D bb.fetch2.Fetch(urls, d)
> > > > +
> > > > +    for download_idx, src_uri in enumerate(urls):
> > > > +        fd =3D fetch.ud[src_uri]
> > > > +
> > > > +        file_name =3D os.path.basename(fetch.localpath(src_uri))
> > > > +        if oe.patch.patch_path(src_uri, fetch, "", expand=3DFalse):
> > > > +            primary_purpose =3D oe.spdx30.software_SoftwarePurpose=
=2Epatch
> > > > +        else:
> > > > +            primary_purpose =3D oe.spdx30.software_SoftwarePurpose=
=2Esource
> > > > +
> > > > +        if fd.type =3D=3D "file":
> > > > +            if os.path.isdir(fd.localpath):
> > > > +                walk_idx =3D 1
> > > > +                for root, dirs, files in os.walk(fd.localpath, one=
rror=3Dwalk_error):
> > > > +                    dirs.sort()
> > > > +                    files.sort()
> > > > +                    for f in files:
> > > > +                        f_path =3D os.path.join(root, f)
> > > > +                        if os.path.islink(f_path):
> > > > +                            # TODO: SPDX doesn't support symlinks =
yet
> > > > +                            continue
> > > > +
> > > > +                        file =3D objset.new_file(
> > > > +                            objset.new_spdxid(
> > > > +                                "source", str(download_idx + 1), s=
tr(walk_idx)
> > > > +                            ),
> > > > +                            os.path.join(
> > > > +                                file_name, os.path.relpath(f_path,=
 fd.localpath)
> > > > +                            ),
> > > > +                            f_path,
> > > > +                            purposes=3D[primary_purpose],
> > > > +                        )
> > > > +
> > > > +                        inputs.add(file)
> > > > +                        walk_idx +=3D 1
> > > > +
> > > > +            else:
> > > > +                file =3D objset.new_file(
> > > > +                    objset.new_spdxid("source", str(download_idx +=
 1)),
> > > > +                    file_name,
> > > > +                    fd.localpath,
> > > > +                    purposes=3D[primary_purpose],
> > > > +                )
> > > > +                inputs.add(file)
> > > > +
> > > > +        else:
> > > > +            dl =3D objset.add(
> > > > +                oe.spdx30.software_Package(
> > > > +                    _id=3Dobjset.new_spdxid("source", str(download=
_idx + 1)),
> > > > +                    creationInfo=3Dobjset.doc.creationInfo,
> > > > +                    name=3Dfile_name,
> > > > +                    software_primaryPurpose=3Dprimary_purpose,
> > > > +                    software_downloadLocation=3Doe.spdx_common.fet=
ch_data_to_uri(
> > > > +                        fd, fd.name
> > > > +                    ),
> > > > +                )
> > > > +            )
> > > > +
> > > > +            if fd.method.supports_checksum(fd):
> > > > +                # TODO Need something better than hard coding this
> > > > +                for checksum_id in ["sha256", "sha1"]:
> > > > +                    expected_checksum =3D getattr(
> > > > +                        fd, "%s_expected" % checksum_id, None
> > > > +                    )
> > > > +                    if expected_checksum is None:
> > > > +                        continue
> > > > +
> > > > +                    dl.verifiedUsing.append(
> > > > +                        oe.spdx30.Hash(
> > > > +                            algorithm=3Dgetattr(oe.spdx30.HashAlgo=
rithm, checksum_id),
> > > > +                            hashValue=3Dexpected_checksum,
> > > > +                        )
> > > > +                    )
> > > > +
> > > > +            inputs.add(dl)
> > > > +
> > > > +    return inputs
> > > > +
> > > > +
> > > > +def set_purposes(d, element, *var_names, force_purposes=3D[]):
> > > > +    purposes =3D force_purposes[:]
> > > > +
> > > > +    for var_name in var_names:
> > > > +        val =3D d.getVar(var_name)
> > > > +        if val:
> > > > +            purposes.extend(val.split())
> > > > +            break
> > > > +
> > > > +    if not purposes:
> > > > +        bb.warn("No SPDX purposes found in %s" % " ".join(var_name=
s))
> > > > +        return
> > > > +
> > > > +    element.software_primaryPurpose =3D getattr(
> > > > +        oe.spdx30.software_SoftwarePurpose, purposes[0]
> > > > +    )
> > > > +    element.software_additionalPurpose =3D [
> > > > +        getattr(oe.spdx30.software_SoftwarePurpose, p) for p in pu=
rposes[1:]
> > > > +    ]
> > > > +
> > > > +
> > > > +def create_spdx(d):
> > > > +    def set_var_field(var, obj, name, package=3DNone):
> > > > +        val =3D None
> > > > +        if package:
> > > > +            val =3D d.getVar("%s:%s" % (var, package))
> > > > +
> > > > +        if not val:
> > > > +            val =3D d.getVar(var)
> > > > +
> > > > +        if val:
> > > > +            setattr(obj, name, val)
> > > > +
> > > > +    license_data =3D oe.spdx_common.load_spdx_license_data(d)
> > > > +
> > > > +    deploydir =3D Path(d.getVar("SPDXDEPLOY"))
> > > > +    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
> > > > +    spdx_workdir =3D Path(d.getVar("SPDXWORK"))
> > > > +    include_sources =3D d.getVar("SPDX_INCLUDE_SOURCES") =3D=3D "1"
> > > > +    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
> > > > +    is_native =3D bb.data.inherits_class("native", d) or bb.data.i=
nherits_class(
> > > > +        "cross", d
> > > > +    )
> > > > +    include_vex =3D d.getVar("SPDX_INCLUDE_VEX")
> > > > +    if not include_vex in ("none", "current", "all"):
> > > > +        bb.fatal("SPDX_INCLUDE_VEX must be one of 'none', 'current=
', 'all'")
> > > > +
> > > > +    build_objset =3D oe.sbom30.ObjectSet.new_objset(d, "recipe-" +=
 d.getVar("PN"))
> > > > +
> > > > +    build =3D build_objset.new_task_build("recipe", "recipe")
> > > > +    build_objset.set_element_alias(build)
> > > > +
> > > > +    build_objset.doc.rootElement.append(build)
> > > > +
> > > > +    build_objset.set_is_native(is_native)
> > > > +
> > > > +    for var in (d.getVar("SPDX_CUSTOM_ANNOTATION_VARS") or "").spl=
it():
> > > > +        new_annotation(
> > > > +            d,
> > > > +            build_objset,
> > > > +            build,
> > > > +            "%s=3D%s" % (var, d.getVar(var)),
> > > > +            oe.spdx30.AnnotationType.other,
> > > > +        )
> > > > +
> > > > +    build_inputs =3D set()
> > > > +
> > > > +    # Add CVEs
> > > > +    cve_by_status =3D {}
> > > > +    if include_vex !=3D "none":
> > > > +        patched_cves =3D oe.cve_check.get_patched_cves(d)
> > > > +        for cve, patched_cve in patched_cves.items():
> > > > +            decoded_status =3D {
> > > > +                "mapping": patched_cve["abbrev-status"],
> > > > +                "detail": patched_cve["status"],
> > > > +                "description": patched_cve.get("justification", No=
ne)
> > > > +            }
> > > > +
> > > > +            # If this CVE is fixed upstream, skip it unless all CV=
Es are
> > > > +            # specified.
> > > > +            if (
> > > > +                include_vex !=3D "all"
> > > > +                and "detail" in decoded_status
> > > > +                and decoded_status["detail"]
> > > > +                in (
> > > > +                    "fixed-version",
> > > > +                    "cpe-stable-backport",
> > > > +                )
> > > > +            ):
> > > > +                bb.debug(1, "Skipping %s since it is already fixed=
 upstream" % cve)
> > > > +                continue
> > > > +
> > > > +            spdx_cve =3D build_objset.new_cve_vuln(cve)
> > > > +            build_objset.set_element_alias(spdx_cve)
> > > > +
> > > > +            cve_by_status.setdefault(decoded_status["mapping"], {}=
)[cve] =3D (
> > > > +                spdx_cve,
> > > > +                decoded_status["detail"],
> > > > +                decoded_status["description"],
> > > > +            )
> > > > +
> > > > +    cpe_ids =3D oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"), =
d.getVar("CVE_VERSION"))
> > > > +
> > > > +    source_files =3D add_download_files(d, build_objset)
> > > > +    build_inputs |=3D source_files
> > > > +
> > > > +    recipe_spdx_license =3D add_license_expression(
> > > > +        d, build_objset, d.getVar("LICENSE"), license_data
> > > > +    )
> > > > +    build_objset.new_relationship(
> > > > +        source_files,
> > > > +        oe.spdx30.RelationshipType.hasConcludedLicense,
> > > > +        [oe.sbom30.get_element_link_id(recipe_spdx_license)],
> > > > +    )
> > > > +
> > > > +    dep_sources =3D {}
> > > > +    if oe.spdx_common.process_sources(d) and include_sources:
> > > > +        bb.debug(1, "Adding source files to SPDX")
> > > > +        oe.spdx_common.get_patched_src(d)
> > > > +
> > > > +        files =3D add_package_files(
> > > > +            d,
> > > > +            build_objset,
> > > > +            spdx_workdir,
> > > > +            lambda file_counter: build_objset.new_spdxid(
> > > > +                "sourcefile", str(file_counter)
> > > > +            ),
> > > > +            lambda filepath: [oe.spdx30.software_SoftwarePurpose.s=
ource],
> > > > +            license_data,
> > > > +            ignore_dirs=3D[".git"],
> > > > +            ignore_top_level_dirs=3D["temp"],
> > > > +            archive=3DNone,
> > > > +        )
> > > > +        build_inputs |=3D files
> > > > +        index_sources_by_hash(files, dep_sources)
> > > > +
> > > > +    dep_objsets, dep_builds =3D collect_dep_objsets(d, build)
> > > > +    if dep_builds:
> > > > +        build_objset.new_scoped_relationship(
> > > > +            [build],
> > > > +            oe.spdx30.RelationshipType.dependsOn,
> > > > +            oe.spdx30.LifecycleScopeType.build,
> > > > +            sorted(oe.sbom30.get_element_link_id(b) for b in dep_b=
uilds),
> > > > +        )
> > > > +
> > > > +    debug_source_ids =3D set()
> > > > +    source_hash_cache =3D {}
> > > > +
> > > > +    # Write out the package SPDX data now. It is not complete as w=
e cannot
> > > > +    # write the runtime data, so write it to a staging area and a =
later task
> > > > +    # will write out the final collection
> > > > +
> > > > +    # TODO: Handle native recipe output
> > > > +    if not is_native:
> > > > +        bb.debug(1, "Collecting Dependency sources files")
> > > > +        collect_dep_sources(dep_objsets, dep_sources)
> > > > +
> > > > +        bb.build.exec_func("read_subpackage_metadata", d)
> > > > +
> > > > +        pkgdest =3D Path(d.getVar("PKGDEST"))
> > > > +        for package in d.getVar("PACKAGES").split():
> > > > +            if not oe.packagedata.packaged(package, d):
> > > > +                continue
> > > > +
> > > > +            pkg_name =3D d.getVar("PKG:%s" % package) or package
> > > > +
> > > > +            bb.debug(1, "Creating SPDX for package %s" % pkg_name)
> > > > +
> > > > +            pkg_objset =3D oe.sbom30.ObjectSet.new_objset(d, "pack=
age-" + pkg_name)
> > > > +
> > > > +            spdx_package =3D pkg_objset.add_root(
> > > > +                oe.spdx30.software_Package(
> > > > +                    _id=3Dpkg_objset.new_spdxid("package", pkg_nam=
e),
> > > > +                    creationInfo=3Dpkg_objset.doc.creationInfo,
> > > > +                    name=3Dpkg_name,
> > > > +                    software_packageVersion=3Dd.getVar("SPDX_PACKA=
GE_VERSION"),
> > > > +                )
> > > > +            )
> > > > +            set_timestamp_now(d, spdx_package, "builtTime")
> > > > +
> > > > +            set_purposes(
> > > > +                d,
> > > > +                spdx_package,
> > > > +                "SPDX_PACKAGE_ADDITIONAL_PURPOSE:%s" % package,
> > > > +                "SPDX_PACKAGE_ADDITIONAL_PURPOSE",
> > > > +                force_purposes=3D["install"],
> > > > +            )
> > > > +
> > > > +            supplier =3D build_objset.new_agent("SPDX_PACKAGE_SUPP=
LIER")
> > > > +            if supplier is not None:
> > > > +                spdx_package.suppliedBy =3D (
> > > > +                    supplier if isinstance(supplier, str) else sup=
plier._id
> > > > +                )
> > > > +
> > > > +            set_var_field(
> > > > +                "HOMEPAGE", spdx_package, "software_homePage", pac=
kage=3Dpackage
> > > > +            )
> > > > +            set_var_field("SUMMARY", spdx_package, "summary", pack=
age=3Dpackage)
> > > > +            set_var_field("DESCRIPTION", spdx_package, "descriptio=
n", package=3Dpackage)
> > > > +
> > > > +            pkg_objset.new_scoped_relationship(
> > > > +                [oe.sbom30.get_element_link_id(build)],
> > > > +                oe.spdx30.RelationshipType.hasOutput,
> > > > +                oe.spdx30.LifecycleScopeType.build,
> > > > +                [spdx_package],
> > > > +            )
> > > > +
> > > > +            for cpe_id in cpe_ids:
> > > > +                spdx_package.externalIdentifier.append(
> > > > +                    oe.spdx30.ExternalIdentifier(
> > > > +                        externalIdentifierType=3Doe.spdx30.Externa=
lIdentifierType.cpe23,
> > > > +                        identifier=3Dcpe_id,
> > > > +                    )
> > > > +                )
> > > > +
> > > > +            # TODO: Generate a file for each actual IPK/DEB/RPM/TG=
Z file
> > > > +            # generated and link it to the package
> > > > +            # spdx_package_file =3D pkg_objset.add(oe.spdx30.softw=
are_File(
> > > > +            #    _id=3Dpkg_objset.new_spdxid("distribution", pkg_n=
ame),
> > > > +            #    creationInfo=3Dpkg_objset.doc.creationInfo,
> > > > +            #    name=3Dpkg_name,
> > > > +            #    software_primaryPurpose=3Dspdx_package.software_p=
rimaryPurpose,
> > > > +            #    software_additionalPurpose=3Dspdx_package.softwar=
e_additionalPurpose,
> > > > +            # ))
> > > > +            # set_timestamp_now(d, spdx_package_file, "builtTime")
> > > > +
> > > > +            ## TODO add hashes
> > > > +            # pkg_objset.new_relationship(
> > > > +            #    [spdx_package],
> > > > +            #    oe.spdx30.RelationshipType.hasDistributionArtifac=
t,
> > > > +            #    [spdx_package_file],
> > > > +            # )
> > > > +
> > > > +            # NOTE: licenses live in the recipe collection and are=
 referenced
> > > > +            # by ID in the package collection(s). This helps reduc=
e duplication
> > > > +            # (since a lot of packages will have the same license)=
, and also
> > > > +            # prevents duplicate license SPDX IDs in the packages
> > > > +            package_license =3D d.getVar("LICENSE:%s" % package)
> > > > +            if package_license and package_license !=3D d.getVar("=
LICENSE"):
> > > > +                package_spdx_license =3D add_license_expression(
> > > > +                    d, build_objset, package_license, license_data
> > > > +                )
> > > > +            else:
> > > > +                package_spdx_license =3D recipe_spdx_license
> > > > +
> > > > +            pkg_objset.new_relationship(
> > > > +                [spdx_package],
> > > > +                oe.spdx30.RelationshipType.hasConcludedLicense,
> > > > +                [oe.sbom30.get_element_link_id(package_spdx_licens=
e)],
> > > > +            )
> > > > +
> > > > +            # NOTE: CVE Elements live in the recipe collection
> > > > +            all_cves =3D set()
> > > > +            for status, cves in cve_by_status.items():
> > > > +                for cve, items in cves.items():
> > > > +                    spdx_cve, detail, description =3D items
> > > > +                    spdx_cve_id =3D oe.sbom30.get_element_link_id(=
spdx_cve)
> > > > +
> > > > +                    all_cves.add(spdx_cve_id)
> > > > +
> > > > +                    if status =3D=3D "Patched":
> > > > +                        pkg_objset.new_vex_patched_relationship(
> > > > +                            [spdx_cve_id], [spdx_package]
> > > > +                        )
> > > > +                    elif status =3D=3D "Unpatched":
> > > > +                        pkg_objset.new_vex_unpatched_relationship(
> > > > +                            [spdx_cve_id], [spdx_package]
> > > > +                        )
> > > > +                    elif status =3D=3D "Ignored":
> > > > +                        spdx_vex =3D pkg_objset.new_vex_ignored_re=
lationship(
> > > > +                            [spdx_cve_id],
> > > > +                            [spdx_package],
> > > > +                            impact_statement=3Ddescription,
> > > > +                        )
> > > > +
> > > > +                        if detail in (
> > > > +                            "ignored",
> > > > +                            "cpe-incorrect",
> > > > +                            "disputed",
> > > > +                            "upstream-wontfix",
> > > > +                        ):
> > > > +                            # VEX doesn't have justifications for =
this
> > > > +                            pass
> > > > +                        elif detail in (
> > > > +                            "not-applicable-config",
> > > > +                            "not-applicable-platform",
> > > > +                        ):
> > > > +                            for v in spdx_vex:
> > > > +                                v.security_justificationType =3D (
> > > > +                                    oe.spdx30.security_VexJustific=
ationType.vulnerableCodeNotPresent
> > > > +                                )
> > > > +                        else:
> > > > +                            bb.fatal(f"Unknown detail '{detail}' f=
or ignored {cve}")
> > > > +                    else:
> > > > +                        bb.fatal(f"Unknown {cve} status '{status}'=
")
> > > > +
> > > > +            if all_cves:
> > > > +                pkg_objset.new_relationship(
> > > > +                    [spdx_package],
> > > > +                    oe.spdx30.RelationshipType.hasAssociatedVulner=
ability,
> > > > +                    sorted(list(all_cves)),
> > > > +                )
> > > > +
> > > > +            bb.debug(1, "Adding package files to SPDX for package =
%s" % pkg_name)
> > > > +            package_files =3D add_package_files(
> > > > +                d,
> > > > +                pkg_objset,
> > > > +                pkgdest / package,
> > > > +                lambda file_counter: pkg_objset.new_spdxid(
> > > > +                    "package", pkg_name, "file", str(file_counter)
> > > > +                ),
> > > > +                # TODO: Can we know the purpose here?
> > > > +                lambda filepath: [],
> > > > +                license_data,
> > > > +                ignore_top_level_dirs=3D["CONTROL", "DEBIAN"],
> > > > +                archive=3DNone,
> > > > +            )
> > > > +
> > > > +            if package_files:
> > > > +                pkg_objset.new_relationship(
> > > > +                    [spdx_package],
> > > > +                    oe.spdx30.RelationshipType.contains,
> > > > +                    sorted(list(package_files)),
> > > > +                )
> > > > +
> > > > +            if include_sources:
> > > > +                debug_sources =3D get_package_sources_from_debug(
> > > > +                    d, package, package_files, dep_sources, source=
_hash_cache
> > > > +                )
> > > > +                debug_source_ids |=3D set(
> > > > +                    oe.sbom30.get_element_link_id(d) for d in debu=
g_sources
> > > > +                )
> > > > +
> > > > +            oe.sbom30.write_recipe_jsonld_doc(
> > > > +                d, pkg_objset, "packages-staging", deploydir, crea=
te_spdx_id_links=3DFalse
> > > > +            )
> > > > +
> > > > +    if include_sources:
> > > > +        bb.debug(1, "Adding sysroot files to SPDX")
> > > > +        sysroot_files =3D add_package_files(
> > > > +            d,
> > > > +            build_objset,
> > > > +            d.expand("${COMPONENTS_DIR}/${PACKAGE_ARCH}/${PN}"),
> > > > +            lambda file_counter: build_objset.new_spdxid("sysroot"=
, str(file_counter)),
> > > > +            lambda filepath: [],
> > > > +            license_data,
> > > > +            archive=3DNone,
> > > > +        )
> > > > +
> > > > +        if sysroot_files:
> > > > +            build_objset.new_scoped_relationship(
> > > > +                [build],
> > > > +                oe.spdx30.RelationshipType.hasOutput,
> > > > +                oe.spdx30.LifecycleScopeType.build,
> > > > +                sorted(list(sysroot_files)),
> > > > +            )
> > > > +
> > > > +    if build_inputs or debug_source_ids:
> > > > +        build_objset.new_scoped_relationship(
> > > > +            [build],
> > > > +            oe.spdx30.RelationshipType.hasInput,
> > > > +            oe.spdx30.LifecycleScopeType.build,
> > > > +            sorted(list(build_inputs)) + sorted(list(debug_source_=
ids)),
> > > > +        )
> > > > +
> > > > +    oe.sbom30.write_recipe_jsonld_doc(d, build_objset, "recipes", =
deploydir)
> > > > +
> > > > +
> > > > +def create_package_spdx(d):
> > > > +    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
> > > > +    deploydir =3D Path(d.getVar("SPDXRUNTIMEDEPLOY"))
> > > > +    is_native =3D bb.data.inherits_class("native", d) or bb.data.i=
nherits_class(
> > > > +        "cross", d
> > > > +    )
> > > > +
> > > > +    providers =3D oe.spdx_common.collect_package_providers(d)
> > > > +    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
> > > > +
> > > > +    if is_native:
> > > > +        return
> > > > +
> > > > +    bb.build.exec_func("read_subpackage_metadata", d)
> > > > +
> > > > +    dep_package_cache =3D {}
> > > > +
> > > > +    # Any element common to all packages that need to be reference=
d by ID
> > > > +    # should be written into this objset set
> > > > +    common_objset =3D oe.sbom30.ObjectSet.new_objset(
> > > > +        d, "%s-package-common" % d.getVar("PN")
> > > > +    )
> > > > +
> > > > +    pkgdest =3D Path(d.getVar("PKGDEST"))
> > > > +    for package in d.getVar("PACKAGES").split():
> > > > +        localdata =3D bb.data.createCopy(d)
> > > > +        pkg_name =3D d.getVar("PKG:%s" % package) or package
> > > > +        localdata.setVar("PKG", pkg_name)
> > > > +        localdata.setVar("OVERRIDES", d.getVar("OVERRIDES", False)=
 + ":" + package)
> > > > +
> > > > +        if not oe.packagedata.packaged(package, localdata):
> > > > +            continue
> > > > +
> > > > +        spdx_package, pkg_objset =3D oe.sbom30.load_obj_in_jsonld(
> > > > +            d,
> > > > +            pkg_arch,
> > > > +            "packages-staging",
> > > > +            "package-" + pkg_name,
> > > > +            oe.spdx30.software_Package,
> > > > +            software_primaryPurpose=3Doe.spdx30.software_SoftwareP=
urpose.install,
> > > > +        )
> > > > +
> > > > +        # We will write out a new collection, so link it to the new
> > > > +        # creation info in the common package data. The old creati=
on info
> > > > +        # should still exist and be referenced by all the existing=
 elements
> > > > +        # in the package
> > > > +        pkg_objset.creationInfo =3D pkg_objset.copy_creation_info(
> > > > +            common_objset.doc.creationInfo
> > > > +        )
> > > > +
> > > > +        runtime_spdx_deps =3D set()
> > > > +
> > > > +        deps =3D bb.utils.explode_dep_versions2(localdata.getVar("=
RDEPENDS") or "")
> > > > +        seen_deps =3D set()
> > > > +        for dep, _ in deps.items():
> > > > +            if dep in seen_deps:
> > > > +                continue
> > > > +
> > > > +            if dep not in providers:
> > > > +                continue
> > > > +
> > > > +            (dep, _) =3D providers[dep]
> > > > +
> > > > +            if not oe.packagedata.packaged(dep, localdata):
> > > > +                continue
> > > > +
> > > > +            dep_pkg_data =3D oe.packagedata.read_subpkgdata_dict(d=
ep, d)
> > > > +            dep_pkg =3D dep_pkg_data["PKG"]
> > > > +
> > > > +            if dep in dep_package_cache:
> > > > +                dep_spdx_package =3D dep_package_cache[dep]
> > > > +            else:
> > > > +                bb.debug(1, "Searching for %s" % dep_pkg)
> > > > +                dep_spdx_package, _ =3D oe.sbom30.find_root_obj_in=
_jsonld(
> > > > +                    d,
> > > > +                    "packages-staging",
> > > > +                    "package-" + dep_pkg,
> > > > +                    oe.spdx30.software_Package,
> > > > +                    software_primaryPurpose=3Doe.spdx30.software_S=
oftwarePurpose.install,
> > > > +                )
> > > > +                dep_package_cache[dep] =3D dep_spdx_package
> > > > +
> > > > +            runtime_spdx_deps.add(dep_spdx_package)
> > > > +            seen_deps.add(dep)
> > > > +
> > > > +        if runtime_spdx_deps:
> > > > +            pkg_objset.new_scoped_relationship(
> > > > +                [spdx_package],
> > > > +                oe.spdx30.RelationshipType.dependsOn,
> > > > +                oe.spdx30.LifecycleScopeType.runtime,
> > > > +                [oe.sbom30.get_element_link_id(dep) for dep in run=
time_spdx_deps],
> > > > +            )
> > > > +
> > > > +        oe.sbom30.write_recipe_jsonld_doc(d, pkg_objset, "packages=
", deploydir)
> > > > +
> > > > +    oe.sbom30.write_recipe_jsonld_doc(d, common_objset, "common-pa=
ckage", deploydir)
> > > > +
> > > > +
> > > > +def write_bitbake_spdx(d):
> > > > +    # Set PN to "bitbake" so that SPDX IDs can be generated
> > > > +    d.setVar("PN", "bitbake")
> > > > +    d.setVar("BB_TASKHASH", "bitbake")
> > > > +    oe.spdx_common.load_spdx_license_data(d)
> > > > +
> > > > +    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
> > > > +
> > > > +    objset =3D oe.sbom30.ObjectSet.new_objset(d, "bitbake", False)
> > > > +
> > > > +    host_import_key =3D d.getVar("SPDX_BUILD_HOST")
> > > > +    invoked_by =3D objset.new_agent("SPDX_INVOKED_BY", add=3DFalse)
> > > > +    on_behalf_of =3D objset.new_agent("SPDX_ON_BEHALF_OF", add=3DF=
alse)
> > > > +
> > > > +    if d.getVar("SPDX_INCLUDE_BITBAKE_PARENT_BUILD") =3D=3D "1":
> > > > +        # Since the Build objects are unique, we may as well set t=
he creation
> > > > +        # time to the current time instead of the fallback SDE
> > > > +        objset.doc.creationInfo.created =3D datetime.now(timezone.=
utc)
> > > > +
> > > > +        # Each invocation of bitbake should have a unique ID since=
 it is a
> > > > +        # unique build
> > > > +        nonce =3D os.urandom(16).hex()
> > > > +
> > > > +        build =3D objset.add_root(
> > > > +            oe.spdx30.build_Build(
> > > > +                _id=3Dobjset.new_spdxid(nonce, include_unihash=3DF=
alse),
> > > > +                creationInfo=3Dobjset.doc.creationInfo,
> > > > +                build_buildType=3Doe.sbom30.SPDX_BUILD_TYPE,
> > > > +            )
> > > > +        )
> > > > +        set_timestamp_now(d, build, "build_buildStartTime")
> > > > +
> > > > +        if host_import_key:
> > > > +            objset.new_scoped_relationship(
> > > > +                [build],
> > > > +                oe.spdx30.RelationshipType.hasHost,
> > > > +                oe.spdx30.LifecycleScopeType.build,
> > > > +                [objset.new_import(host_import_key)],
> > > > +            )
> > > > +
> > > > +        if invoked_by:
> > > > +            objset.add(invoked_by)
> > > > +            invoked_by_spdx =3D objset.new_scoped_relationship(
> > > > +                [build],
> > > > +                oe.spdx30.RelationshipType.invokedBy,
> > > > +                oe.spdx30.LifecycleScopeType.build,
> > > > +                [invoked_by],
> > > > +            )
> > > > +
> > > > +            if on_behalf_of:
> > > > +                objset.add(on_behalf_of)
> > > > +                objset.new_scoped_relationship(
> > > > +                    [on_behalf_of],
> > > > +                    oe.spdx30.RelationshipType.delegatedTo,
> > > > +                    oe.spdx30.LifecycleScopeType.build,
> > > > +                    invoked_by_spdx,
> > > > +                )
> > > > +
> > > > +        elif on_behalf_of:
> > > > +            bb.warn("SPDX_ON_BEHALF_OF has no effect if SPDX_INVOK=
ED_BY is not set")
> > > > +
> > > > +    else:
> > > > +        if host_import_key:
> > > > +            bb.warn(
> > > > +                "SPDX_BUILD_HOST has no effect if SPDX_INCLUDE_BIT=
BAKE_PARENT_BUILD is not set"
> > > > +            )
> > > > +
> > > > +        if invoked_by:
> > > > +            bb.warn(
> > > > +                "SPDX_INVOKED_BY has no effect if SPDX_INCLUDE_BIT=
BAKE_PARENT_BUILD is not set"
> > > > +            )
> > > > +
> > > > +        if on_behalf_of:
> > > > +            bb.warn(
> > > > +                "SPDX_ON_BEHALF_OF has no effect if SPDX_INCLUDE_B=
ITBAKE_PARENT_BUILD is not set"
> > > > +            )
> > > > +
> > > > +    for obj in objset.foreach_type(oe.spdx30.Element):
> > > > +        obj.extension.append(oe.sbom30.OEIdAliasExtension())
> > > > +
> > > > +    oe.sbom30.write_jsonld_doc(d, objset, deploy_dir_spdx / "bitba=
ke.spdx.json")
> > > > +
> > > > +
> > > > +def collect_build_package_inputs(d, objset, build, packages, files=
_by_hash=3DNone):
> > > > +    import oe.sbom30
> > > > +
> > > > +    providers =3D oe.spdx_common.collect_package_providers(d)
> > > > +
> > > > +    build_deps =3D set()
> > > > +    missing_providers =3D set()
> > > > +
> > > > +    for name in sorted(packages.keys()):
> > > > +        if name not in providers:
> > > > +            missing_providers.add(name)
> > > > +            continue
> > > > +
> > > > +        pkg_name, pkg_hashfn =3D providers[name]
> > > > +
> > > > +        # Copy all of the package SPDX files into the Sbom elements
> > > > +        pkg_spdx, pkg_objset =3D oe.sbom30.find_root_obj_in_jsonld(
> > > > +            d,
> > > > +            "packages",
> > > > +            "package-" + pkg_name,
> > > > +            oe.spdx30.software_Package,
> > > > +            software_primaryPurpose=3Doe.spdx30.software_SoftwareP=
urpose.install,
> > > > +        )
> > > > +        build_deps.add(oe.sbom30.get_element_link_id(pkg_spdx))
> > > > +
> > > > +        if files_by_hash is not None:
> > > > +            for h, f in pkg_objset.by_sha256_hash.items():
> > > > +                files_by_hash.setdefault(h, set()).update(f)
> > > > +
> > > > +    if missing_providers:
> > > > +        bb.fatal(
> > > > +            f"Unable to find SPDX provider(s) for: {', '.join(sort=
ed(missing_providers))}"
> > > > +        )
> > > > +
> > > > +    if build_deps:
> > > > +        objset.new_scoped_relationship(
> > > > +            [build],
> > > > +            oe.spdx30.RelationshipType.hasInput,
> > > > +            oe.spdx30.LifecycleScopeType.build,
> > > > +            sorted(list(build_deps)),
> > > > +        )
> > > > +
> > > > +
> > > > +def create_rootfs_spdx(d):
> > > > +    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
> > > > +    deploydir =3D Path(d.getVar("SPDXROOTFSDEPLOY"))
> > > > +    root_packages_file =3D Path(d.getVar("SPDX_ROOTFS_PACKAGES"))
> > > > +    image_basename =3D d.getVar("IMAGE_BASENAME")
> > > > +    image_rootfs =3D d.getVar("IMAGE_ROOTFS")
> > > > +    machine =3D d.getVar("MACHINE")
> > > > +
> > > > +    with root_packages_file.open("r") as f:
> > > > +        packages =3D json.load(f)
> > > > +
> > > > +    objset =3D oe.sbom30.ObjectSet.new_objset(
> > > > +        d, "%s-%s-rootfs" % (image_basename, machine)
> > > > +    )
> > > > +
> > > > +    rootfs =3D objset.add_root(
> > > > +        oe.spdx30.software_Package(
> > > > +            _id=3Dobjset.new_spdxid("rootfs", image_basename),
> > > > +            creationInfo=3Dobjset.doc.creationInfo,
> > > > +            name=3Dimage_basename,
> > > > +            software_primaryPurpose=3Doe.spdx30.software_SoftwareP=
urpose.archive,
> > > > +        )
> > > > +    )
> > > > +    set_timestamp_now(d, rootfs, "builtTime")
> > > > +
> > > > +    rootfs_build =3D objset.add_root(objset.new_task_build("rootfs=
", "rootfs"))
> > > > +    set_timestamp_now(d, rootfs_build, "build_buildEndTime")
> > > > +
> > > > +    objset.new_scoped_relationship(
> > > > +        [rootfs_build],
> > > > +        oe.spdx30.RelationshipType.hasOutput,
> > > > +        oe.spdx30.LifecycleScopeType.build,
> > > > +        [rootfs],
> > > > +    )
> > > > +
> > > > +    files_by_hash =3D {}
> > > > +    collect_build_package_inputs(d, objset, rootfs_build, packages=
, files_by_hash)
> > > > +
> > > > +    files =3D set()
> > > > +    for dirpath, dirnames, filenames in os.walk(image_rootfs, oner=
ror=3Dwalk_error):
> > > > +        dirnames.sort()
> > > > +        filenames.sort()
> > > > +        for fn in filenames:
> > > > +            fpath =3D Path(dirpath) / fn
> > > > +            if fpath.is_symlink() or not fpath.is_file():
> > > > +                continue
> > > > +
> > > > +            relpath =3D str(fpath.relative_to(image_rootfs))
> > > > +            h =3D bb.utils.sha256_file(fpath)
> > > > +
> > > > +            found =3D False
> > > > +            if h in files_by_hash:
> > > > +                for f in files_by_hash[h]:
> > > > +                    if isinstance(f, oe.spdx30.software_File) and =
f.name =3D=3D relpath:
> > > > +                        files.add(oe.sbom30.get_element_link_id(f))
> > > > +                        found =3D True
> > > > +                        break
> > > > +
> > > > +            if not found:
> > > > +                files.add(
> > > > +                    objset.new_file(
> > > > +                        objset.new_spdxid("rootfs-file", relpath),
> > > > +                        relpath,
> > > > +                        fpath,
> > > > +                    )
> > > > +                )
> > > > +
> > > > +    if files:
> > > > +        objset.new_relationship(
> > > > +            [rootfs],
> > > > +            oe.spdx30.RelationshipType.contains,
> > > > +            sorted(list(files)),
> > > > +        )
> > > > +
> > > > +    oe.sbom30.write_recipe_jsonld_doc(d, objset, "rootfs", deployd=
ir)
> > > > +
> > > > +
> > > > +def create_image_spdx(d):
> > > > +    import oe.sbom30
> > > > +
> > > > +    image_deploy_dir =3D Path(d.getVar("IMGDEPLOYDIR"))
> > > > +    manifest_path =3D Path(d.getVar("IMAGE_OUTPUT_MANIFEST"))
> > > > +    spdx_work_dir =3D Path(d.getVar("SPDXIMAGEWORK"))
> > > > +
> > > > +    image_basename =3D d.getVar("IMAGE_BASENAME")
> > > > +    machine =3D d.getVar("MACHINE")
> > > > +
> > > > +    objset =3D oe.sbom30.ObjectSet.new_objset(
> > > > +        d, "%s-%s-image" % (image_basename, machine)
> > > > +    )
> > > > +
> > > > +    with manifest_path.open("r") as f:
> > > > +        manifest =3D json.load(f)
> > > > +
> > > > +    builds =3D []
> > > > +    for task in manifest:
> > > > +        imagetype =3D task["imagetype"]
> > > > +        taskname =3D task["taskname"]
> > > > +
> > > > +        image_build =3D objset.add_root(
> > > > +            objset.new_task_build(taskname, "image/%s" % imagetype)
> > > > +        )
> > > > +        set_timestamp_now(d, image_build, "build_buildEndTime")
> > > > +        builds.append(image_build)
> > > > +
> > > > +        artifacts =3D []
> > > > +
> > > > +        for image in task["images"]:
> > > > +            image_filename =3D image["filename"]
> > > > +            image_path =3D image_deploy_dir / image_filename
> > > > +            if os.path.isdir(image_path):
> > > > +                a =3D add_package_files(
> > > > +                        d,
> > > > +                        objset,
> > > > +                        image_path,
> > > > +                        lambda file_counter: objset.new_spdxid(
> > > > +                            "imagefile", str(file_counter)
> > > > +                        ),
> > > > +                        lambda filepath: [],
> > > > +                        license_data=3DNone,
> > > > +                        ignore_dirs=3D[],
> > > > +                        ignore_top_level_dirs=3D[],
> > > > +                        archive=3DNone,
> > > > +                )
> > > > +                artifacts.extend(a)
> > > > +            else:
> > > > +                a =3D objset.add_root(
> > > > +                    oe.spdx30.software_File(
> > > > +                        _id=3Dobjset.new_spdxid("image", image_fil=
ename),
> > > > +                        creationInfo=3Dobjset.doc.creationInfo,
> > > > +                        name=3Dimage_filename,
> > > > +                        verifiedUsing=3D[
> > > > +                            oe.spdx30.Hash(
> > > > +                                algorithm=3Doe.spdx30.HashAlgorith=
m.sha256,
> > > > +                                hashValue=3Dbb.utils.sha256_file(i=
mage_path),
> > > > +                            )
> > > > +                        ],
> > > > +                    )
> > > > +                )
> > > > +
> > > > +                artifacts.append(a)
> > > > +
> > > > +            for a in artifacts:
> > > > +                set_purposes(
> > > > +                    d, a, "SPDX_IMAGE_PURPOSE:%s" % imagetype, "SP=
DX_IMAGE_PURPOSE"
> > > > +                )
> > > > +
> > > > +                set_timestamp_now(d, a, "builtTime")
> > > > +
> > > > +
> > > > +        if artifacts:
> > > > +            objset.new_scoped_relationship(
> > > > +                [image_build],
> > > > +                oe.spdx30.RelationshipType.hasOutput,
> > > > +                oe.spdx30.LifecycleScopeType.build,
> > > > +                artifacts,
> > > > +            )
> > > > +
> > > > +    if builds:
> > > > +        rootfs_image, _ =3D oe.sbom30.find_root_obj_in_jsonld(
> > > > +            d,
> > > > +            "rootfs",
> > > > +            "%s-%s-rootfs" % (image_basename, machine),
> > > > +            oe.spdx30.software_Package,
> > > > +            # TODO: Should use a purpose to filter here?
> > > > +        )
> > > > +        objset.new_scoped_relationship(
> > > > +            builds,
> > > > +            oe.spdx30.RelationshipType.hasInput,
> > > > +            oe.spdx30.LifecycleScopeType.build,
> > > > +            [oe.sbom30.get_element_link_id(rootfs_image)],
> > > > +        )
> > > > +
> > > > +    objset.add_aliases()
> > > > +    objset.link()
> > > > +    oe.sbom30.write_recipe_jsonld_doc(d, objset, "image", spdx_wor=
k_dir)
> > > > +
> > > > +
> > > > +def create_image_sbom_spdx(d):
> > > > +    import oe.sbom30
> > > > +
> > > > +    image_name =3D d.getVar("IMAGE_NAME")
> > > > +    image_basename =3D d.getVar("IMAGE_BASENAME")
> > > > +    image_link_name =3D d.getVar("IMAGE_LINK_NAME")
> > > > +    imgdeploydir =3D Path(d.getVar("SPDXIMAGEDEPLOYDIR"))
> > > > +    machine =3D d.getVar("MACHINE")
> > > > +
> > > > +    spdx_path =3D imgdeploydir / (image_name + ".spdx.json")
> > > > +
> > > > +    root_elements =3D []
> > > > +
> > > > +    # TODO: Do we need to add the rootfs or are the image files su=
fficient?
> > > > +    rootfs_image, _ =3D oe.sbom30.find_root_obj_in_jsonld(
> > > > +        d,
> > > > +        "rootfs",
> > > > +        "%s-%s-rootfs" % (image_basename, machine),
> > > > +        oe.spdx30.software_Package,
> > > > +        # TODO: Should use a purpose here?
> > > > +    )
> > > > +    root_elements.append(oe.sbom30.get_element_link_id(rootfs_imag=
e))
> > > > +
> > > > +    image_objset, _ =3D oe.sbom30.find_jsonld(
> > > > +        d, "image", "%s-%s-image" % (image_basename, machine), req=
uired=3DTrue
> > > > +    )
> > > > +    for o in image_objset.foreach_root(oe.spdx30.software_File):
> > > > +        root_elements.append(oe.sbom30.get_element_link_id(o))
> > > > +
> > > > +    objset, sbom =3D oe.sbom30.create_sbom(d, image_name, root_ele=
ments)
> > > > +
> > > > +    oe.sbom30.write_jsonld_doc(d, objset, spdx_path)
> > > > +
> > > > +    def make_image_link(target_path, suffix):
> > > > +        if image_link_name:
> > > > +            link =3D imgdeploydir / (image_link_name + suffix)
> > > > +            if link !=3D target_path:
> > > > +                link.symlink_to(os.path.relpath(target_path, link.=
parent))
> > > > +
> > > > +    make_image_link(spdx_path, ".spdx.json")
> > > > +
> > > > +
> > > > +def sdk_create_spdx(d, sdk_type, spdx_work_dir, toolchain_outputna=
me):
> > > > +    sdk_name =3D toolchain_outputname + "-" + sdk_type
> > > > +    sdk_packages =3D oe.sdk.sdk_list_installed_packages(d, sdk_typ=
e =3D=3D "target")
> > > > +
> > > > +    objset =3D oe.sbom30.ObjectSet.new_objset(d, sdk_name)
> > > > +
> > > > +    sdk_rootfs =3D objset.add_root(
> > > > +        oe.spdx30.software_Package(
> > > > +            _id=3Dobjset.new_spdxid("sdk-rootfs", sdk_name),
> > > > +            creationInfo=3Dobjset.doc.creationInfo,
> > > > +            name=3Dsdk_name,
> > > > +            software_primaryPurpose=3Doe.spdx30.software_SoftwareP=
urpose.archive,
> > > > +        )
> > > > +    )
> > > > +    set_timestamp_now(d, sdk_rootfs, "builtTime")
> > > > +
> > > > +    sdk_build =3D objset.add_root(objset.new_task_build("sdk-rootf=
s", "sdk-rootfs"))
> > > > +    set_timestamp_now(d, sdk_build, "build_buildEndTime")
> > > > +
> > > > +    objset.new_scoped_relationship(
> > > > +        [sdk_build],
> > > > +        oe.spdx30.RelationshipType.hasOutput,
> > > > +        oe.spdx30.LifecycleScopeType.build,
> > > > +        [sdk_rootfs],
> > > > +    )
> > > > +
> > > > +    collect_build_package_inputs(d, objset, sdk_build, sdk_package=
s)
> > > > +
> > > > +    objset.add_aliases()
> > > > +    oe.sbom30.write_jsonld_doc(d, objset, spdx_work_dir / "sdk-roo=
tfs.spdx.json")
> > > > +
> > > > +
> > > > +def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, toolchain_out=
putname):
> > > > +    # Load the document written earlier
> > > > +    rootfs_objset =3D oe.sbom30.load_jsonld(
> > > > +        d, spdx_work_dir / "sdk-rootfs.spdx.json", required=3DTrue
> > > > +    )
> > > > +
> > > > +    # Create a new build for the SDK installer
> > > > +    sdk_build =3D rootfs_objset.new_task_build("sdk-populate", "sd=
k-populate")
> > > > +    set_timestamp_now(d, sdk_build, "build_buildEndTime")
> > > > +
> > > > +    rootfs =3D rootfs_objset.find_root(oe.spdx30.software_Package)
> > > > +    if rootfs is None:
> > > > +        bb.fatal("Unable to find rootfs artifact")
> > > > +
> > > > +    rootfs_objset.new_scoped_relationship(
> > > > +        [sdk_build],
> > > > +        oe.spdx30.RelationshipType.hasInput,
> > > > +        oe.spdx30.LifecycleScopeType.build,
> > > > +        [rootfs],
> > > > +    )
> > > > +
> > > > +    files =3D set()
> > > > +    root_files =3D []
> > > > +
> > > > +    # NOTE: os.walk() doesn't return symlinks
> > > > +    for dirpath, dirnames, filenames in os.walk(sdk_deploydir, one=
rror=3Dwalk_error):
> > > > +        dirnames.sort()
> > > > +        filenames.sort()
> > > > +        for fn in filenames:
> > > > +            fpath =3D Path(dirpath) / fn
> > > > +            if not fpath.is_file() or fpath.is_symlink():
> > > > +                continue
> > > > +
> > > > +            relpath =3D str(fpath.relative_to(sdk_deploydir))
> > > > +
> > > > +            f =3D rootfs_objset.new_file(
> > > > +                rootfs_objset.new_spdxid("sdk-installer", relpath),
> > > > +                relpath,
> > > > +                fpath,
> > > > +            )
> > > > +            set_timestamp_now(d, f, "builtTime")
> > > > +
> > > > +            if fn.endswith(".manifest"):
> > > > +                f.software_primaryPurpose =3D oe.spdx30.software_S=
oftwarePurpose.manifest
> > > > +            elif fn.endswith(".testdata.json"):
> > > > +                f.software_primaryPurpose =3D (
> > > > +                    oe.spdx30.software_SoftwarePurpose.configurati=
on
> > > > +                )
> > > > +            else:
> > > > +                set_purposes(d, f, "SPDX_SDK_PURPOSE")
> > > > +                root_files.append(f)
> > > > +
> > > > +            files.add(f)
> > > > +
> > > > +    if files:
> > > > +        rootfs_objset.new_scoped_relationship(
> > > > +            [sdk_build],
> > > > +            oe.spdx30.RelationshipType.hasOutput,
> > > > +            oe.spdx30.LifecycleScopeType.build,
> > > > +            files,
> > > > +        )
> > > > +    else:
> > > > +        bb.warn(f"No SDK output files found in {sdk_deploydir}")
> > > > +
> > > > +    objset, sbom =3D oe.sbom30.create_sbom(
> > > > +        d, toolchain_outputname, sorted(list(files)), [rootfs_objs=
et]
> > > > +    )
> > > > +
> > > > +    oe.sbom30.write_jsonld_doc(
> > > > +        d, objset, sdk_deploydir / (toolchain_outputname + ".spdx.=
json")
> > > > +    )
> > > > diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
> > > > new file mode 100644
> > > > index 0000000000..4caefc7673
> > > > --- /dev/null
> > > > +++ b/meta/lib/oe/spdx_common.py
> > > > @@ -0,0 +1,244 @@
> > > > +#
> > > > +# Copyright OpenEmbedded Contributors
> > > > +#
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > +#
> > > > +
> > > > +import bb
> > > > +import collections
> > > > +import json
> > > > +import oe.packagedata
> > > > +import re
> > > > +import shutil
> > > > +
> > > > +from pathlib import Path
> > > > +from dataclasses import dataclass
> > > > +
> > > > +LIC_REGEX =3D re.compile(
> > > > +    rb"^\W*SPDX-License-Identifier:\s*([ \w\d.()+-]+?)(?:\s+\W*)?$=
",
> > > > +    re.MULTILINE,
> > > > +)
> > > > +
> > > > +
> > > > +def extract_licenses(filename):
> > > > +    """
> > > > +    Extract SPDX License identifiers from a file
> > > > +    """
> > > > +    try:
> > > > +        with open(filename, "rb") as f:
> > > > +            size =3D min(15000, os.stat(filename).st_size)
> > > > +            txt =3D f.read(size)
> > > > +            licenses =3D re.findall(LIC_REGEX, txt)
> > > > +            if licenses:
> > > > +                ascii_licenses =3D [lic.decode("ascii") for lic in=
 licenses]
> > > > +                return ascii_licenses
> > > > +    except Exception as e:
> > > > +        bb.warn(f"Exception reading {filename}: {e}")
> > > > +    return []
> > > > +
> > > > +
> > > > +def is_work_shared_spdx(d):
> > > > +    return '/work-shared/' in d.getVar('S')
> > > > +
> > > > +
> > > > +def load_spdx_license_data(d):
> > > > +    with open(d.getVar("SPDX_LICENSES"), "r") as f:
> > > > +        data =3D json.load(f)
> > > > +        # Transform the license array to a dictionary
> > > > +        data["licenses"] =3D {l["licenseId"]: l for l in data["lic=
enses"]}
> > > > +
> > > > +    return data
> > > > +
> > > > +
> > > > +def process_sources(d):
> > > > +    """
> > > > +    Returns True if the sources for this recipe should be included=
 in the SPDX
> > > > +    or False if not
> > > > +    """
> > > > +    pn =3D d.getVar("PN")
> > > > +    assume_provided =3D (d.getVar("ASSUME_PROVIDED") or "").split()
> > > > +    if pn in assume_provided:
> > > > +        for p in d.getVar("PROVIDES").split():
> > > > +            if p !=3D pn:
> > > > +                pn =3D p
> > > > +                break
> > > > +
> > > > +    # glibc-locale: do_fetch, do_unpack and do_patch tasks have be=
en deleted,
> > > > +    # so avoid archiving source here.
> > > > +    if pn.startswith("glibc-locale"):
> > > > +        return False
> > > > +    if d.getVar("PN") =3D=3D "libtool-cross":
> > > > +        return False
> > > > +    if d.getVar("PN") =3D=3D "libgcc-initial":
> > > > +        return False
> > > > +    if d.getVar("PN") =3D=3D "shadow-sysroot":
> > > > +        return False
> > > > +
> > > > +    return True
> > > > +
> > > > +
> > > > +@dataclass(frozen=3DTrue)
> > > > +class Dep(object):
> > > > +    pn: str
> > > > +    hashfn: str
> > > > +    in_taskhash: bool
> > > > +
> > > > +
> > > > +def collect_direct_deps(d, dep_task):
> > > > +    """
> > > > +    Find direct dependencies of current task
> > > > +
> > > > +    Returns the list of recipes that have a dep_task that the curr=
ent task
> > > > +    depends on
> > > > +    """
> > > > +    current_task =3D "do_" + d.getVar("BB_CURRENTTASK")
> > > > +    pn =3D d.getVar("PN")
> > > > +
> > > > +    taskdepdata =3D d.getVar("BB_TASKDEPDATA", False)
> > > > +
> > > > +    for this_dep in taskdepdata.values():
> > > > +        if this_dep[0] =3D=3D pn and this_dep[1] =3D=3D current_ta=
sk:
> > > > +            break
> > > > +    else:
> > > > +        bb.fatal(f"Unable to find this {pn}:{current_task} in task=
depdata")
> > > > +
> > > > +    deps =3D set()
> > > > +
> > > > +    for dep_name in this_dep.deps:
> > > > +        dep_data =3D taskdepdata[dep_name]
> > > > +        if dep_data.taskname =3D=3D dep_task and dep_data.pn !=3D =
pn:
> > > > +            deps.add((dep_data.pn, dep_data.hashfn, dep_name in th=
is_dep.taskhash_deps))
> > > > +
> > > > +    return sorted(deps)
> > > > +
> > > > +
> > > > +def get_spdx_deps(d):
> > > > +    """
> > > > +    Reads the SPDX dependencies JSON file and returns the data
> > > > +    """
> > > > +    spdx_deps_file =3D Path(d.getVar("SPDXDEPS"))
> > > > +
> > > > +    deps =3D []
> > > > +    with spdx_deps_file.open("r") as f:
> > > > +        for d in json.load(f):
> > > > +            deps.append(Dep(*d))
> > > > +    return deps
> > > > +
> > > > +
> > > > +def collect_package_providers(d):
> > > > +    """
> > > > +    Returns a dictionary where each RPROVIDES is mapped to the pac=
kage that
> > > > +    provides it
> > > > +    """
> > > > +    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
> > > > +
> > > > +    providers =3D {}
> > > > +
> > > > +    deps =3D collect_direct_deps(d, "do_create_spdx")
> > > > +    deps.append((d.getVar("PN"), d.getVar("BB_HASHFILENAME"), True=
))
> > > > +
> > > > +    for dep_pn, dep_hashfn, _ in deps:
> > > > +        localdata =3D d
> > > > +        recipe_data =3D oe.packagedata.read_pkgdata(dep_pn, locald=
ata)
> > > > +        if not recipe_data:
> > > > +            localdata =3D bb.data.createCopy(d)
> > > > +            localdata.setVar("PKGDATA_DIR", "${PKGDATA_DIR_SDK}")
> > > > +            recipe_data =3D oe.packagedata.read_pkgdata(dep_pn, lo=
caldata)
> > > > +
> > > > +        for pkg in recipe_data.get("PACKAGES", "").split():
> > > > +            pkg_data =3D oe.packagedata.read_subpkgdata_dict(pkg, =
localdata)
> > > > +            rprovides =3D set(
> > > > +                n
> > > > +                for n, _ in bb.utils.explode_dep_versions2(
> > > > +                    pkg_data.get("RPROVIDES", "")
> > > > +                ).items()
> > > > +            )
> > > > +            rprovides.add(pkg)
> > > > +
> > > > +            if "PKG" in pkg_data:
> > > > +                pkg =3D pkg_data["PKG"]
> > > > +                rprovides.add(pkg)
> > > > +
> > > > +            for r in rprovides:
> > > > +                providers[r] =3D (pkg, dep_hashfn)
> > > > +
> > > > +    return providers
> > > > +
> > > > +
> > > > +def get_patched_src(d):
> > > > +    """
> > > > +    Save patched source of the recipe in SPDX_WORKDIR.
> > > > +    """
> > > > +    spdx_workdir =3D d.getVar("SPDXWORK")
> > > > +    spdx_sysroot_native =3D d.getVar("STAGING_DIR_NATIVE")
> > > > +    pn =3D d.getVar("PN")
> > > > +
> > > > +    workdir =3D d.getVar("WORKDIR")
> > > > +
> > > > +    try:
> > > > +        # The kernel class functions require it to be on work-shar=
ed, so we dont change WORKDIR
> > > > +        if not is_work_shared_spdx(d):
> > > > +            # Change the WORKDIR to make do_unpack do_patch run in=
 another dir.
> > > > +            d.setVar("WORKDIR", spdx_workdir)
> > > > +            # Restore the original path to recipe's native sysroot=
 (it's relative to WORKDIR).
> > > > +            d.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
> > > > +
> > > > +            # The changed 'WORKDIR' also caused 'B' changed, creat=
e dir 'B' for the
> > > > +            # possibly requiring of the following tasks (such as s=
ome recipes's
> > > > +            # do_patch required 'B' existed).
> > > > +            bb.utils.mkdirhier(d.getVar("B"))
> > > > +
> > > > +            bb.build.exec_func("do_unpack", d)
> > > > +
> > > > +            if d.getVar("SRC_URI") !=3D "":
> > > > +                if bb.data.inherits_class('dos2unix', d):
> > > > +                    bb.build.exec_func('do_convert_crlf_to_lf', d)
> > > > +                bb.build.exec_func("do_patch", d)
> > > > +
> > > > +        # Copy source from work-share to spdx_workdir
> > > > +        if is_work_shared_spdx(d):
> > > > +            share_src =3D d.getVar('S')
> > > > +            d.setVar("WORKDIR", spdx_workdir)
> > > > +            d.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
> > > > +            # Copy source to ${SPDXWORK}, same basename dir of ${S=
};
> > > > +            src_dir =3D (
> > > > +                spdx_workdir
> > > > +                + "/"
> > > > +                + os.path.basename(share_src)
> > > > +            )
> > > > +            # For kernel souce, rename suffix dir 'kernel-source'
> > > > +            # to ${BP} (${BPN}-${PV})
> > > > +            if bb.data.inherits_class("kernel", d):
> > > > +                src_dir =3D spdx_workdir + "/" + d.getVar('BP')
> > > > +
> > > > +            bb.note(f"copyhardlinktree {share_src} to {src_dir}")
> > > > +            oe.path.copyhardlinktree(share_src, src_dir)
> > > > +
> > > > +        # Some userland has no source.
> > > > +        if not os.path.exists(spdx_workdir):
> > > > +            bb.utils.mkdirhier(spdx_workdir)
> > > > +    finally:
> > > > +        d.setVar("WORKDIR", workdir)
> > > > +
> > > > +
> > > > +def has_task(d, task):
> > > > +    return bool(d.getVarFlag(task, "task", False)) and not bool(d.=
getVarFlag(task, "noexec", False))
> > > > +
> > > > +
> > > > +def fetch_data_to_uri(fd, name):
> > > > +    """
> > > > +    Translates a bitbake FetchData to a string URI
> > > > +    """
> > > > +    uri =3D fd.type
> > > > +    # Map gitsm to git, since gitsm:// is not a valid URI protocol
> > > > +    if uri =3D=3D "gitsm":
> > > > +        uri =3D "git"
> > > > +    proto =3D getattr(fd, "proto", None)
> > > > +    if proto is not None:
> > > > +        uri =3D uri + "+" + proto
> > > > +    uri =3D uri + "://" + fd.host + fd.path
> > > > +
> > > > +    if fd.method.supports_srcrev():
> > > > +        uri =3D uri + "@" + fd.revision
> > > > +
> > > > +    return uri
> > > > --
> > > > 2.43.0
> > > >
> >
> > --
> > Kamel Bouhara, Bootlin
> > Embedded Linux and kernel engineering
> > https://bootlin.com

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

