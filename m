Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9B8CCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 22:36:19 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.5364.1759790168788449498
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 15:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wq7w4+Cz;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-73b4e3d0756so61132187b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 15:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759790168; x=1760394968; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2Z4PPfUaj5duvHyDANrfT/9nte+Oz3HdkRdaAC7H6Y=;
        b=Wq7w4+Czs3j11eOSHwcOhqIrYNAKqFZkipYuvUHC0jCByD9Nwhiyq5bKbWtfuMaxiL
         N37KSzrRNpiBLI6e517V/05ATnJNjdQUrpKwuHwRvGa3D4QJg1xURGYjkLrMxoy0oizr
         BTd6rXdUamtPjPiuKQdshflXnPTz2lc74B8bdDsTVddVl0ihKdtJPLKxX/Q2NMRZ2/8s
         099IhfMGImKWWV5wjS+FtUa56KNdAGkAt1zTsL0Yf1cDHv0bgIFpufBiGHG+v9nAL9Vp
         viG13QYkoZOkVA5CXKgSs4KGDUjS7Cnrqub+Prt5QR0TAOPbwFP62Kv3CI5b4TzCZCK2
         lR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759790168; x=1760394968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2Z4PPfUaj5duvHyDANrfT/9nte+Oz3HdkRdaAC7H6Y=;
        b=sv4JDqiP+6TgrF6TmXukIfEVMEA5VqKhn23th8x39aKrcMXiPdNdSsi3chf4FiwJyy
         Az6lzbRAZmHRN9l3FVPBR7ihnJeZpAy08rqXDuDYN8W6EX3EaP7q4AEoArAft7xF05o5
         pxckST7+rxghpBlamffIM/BFDEuC1/eHYchWBFL8Mp2rofKry2neru8858hkB1wltQlY
         SuRtYLXHSCguvK5DcEQSg0wJvrVkEsolIZcaSd42SC/4n72HSBrg2jnTtTQUnTO/wT/s
         yn12C21+FBk02FwsnLK2flEA52zBn+ULNiyNforsX8O8v9Gsux0TnZFY8ZryPJrmlBxd
         7LWg==
X-Gm-Message-State: AOJu0YxzjiGJlv8SNVdHcHjXLBDCSLs7Mx/OmhOSDt6I8gPkltWK4lUD
	K7SHELCdN1hjQj3O/PNXEknwt0ynvI2vV9svcEosF/2wdrdN5eHbZeIT1jukus8Klmui61vDynx
	cFw+xMn126JiaIlruV90wUIU6SMH7f6g=
X-Gm-Gg: ASbGncuEY87KLW06uqtJQtMNCQNd7bGFbugbD6RKIan681l/SM1qwh3R6QeNt4cubqm
	mnJovoWnX7nvPLBQTedf7p/8gI7YOwDB10HZvEGzeUzsJ/pKCirYZ2ro5IZP8VikAOz506nlhTH
	X54mwpgS37I4u54pGPciJFRx7IxKmYlqbIscT2Ej8KpMda7mHN9R1yaD/H8/xCXaXRcbCZE3xcC
	jbf/H0iu6YsNvPps7RwxFS6W6gv0hHgZud89vi5ArzUbBQGZRDUB+ah
X-Google-Smtp-Source: AGHT+IHJhX9qcSUUF5/WqFCnN6dZKkSe/1LvSV0hdoe+k0PzLWg1YJaCzlCYcqg7Pn/44D/tee2LF88i6kUmSwzfF38=
X-Received: by 2002:a53:b6cd:0:b0:63b:919b:32c1 with SMTP id
 956f58d0204a3-63b9a0f29cemr9353809d50.38.1759790166886; Mon, 06 Oct 2025
 15:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250905171154.182825-1-kamel.bouhara@bootlin.com> <20250905171154.182825-2-kamel.bouhara@bootlin.com>
In-Reply-To: <20250905171154.182825-2-kamel.bouhara@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 6 Oct 2025 16:35:55 -0600
X-Gm-Features: AS18NWAmsnb0HNDWcJFORfVA5l_70hIBRYrTEu3f8qMEfAP9X0rL7l6YWk7-0ks
Message-ID: <CAJdd5GaQvU03EXRgCybsy9wvJA4X=xGj6f3XULEtoL4DUPapAw@mail.gmail.com>
Subject: Re: [PATCH 1/6] backport: SPDX 3.0 fixes and tasks from upstream
 version Walnascar
To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com, 
	Miquel Raynal <miquel.raynal@bootlin.com>, mathieu.dubois-briand@bootlin.com, 
	antonin.godard@bootlin.com, Pascal Eberhard <pascal.eberhard@se.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 22:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224509

I reviewed this and the code that is here LGTM. The Yocto TSC approved
it on the condition that the test code is implemented.

On Fri, Sep 5, 2025 at 11:11=E2=80=AFAM Kamel Bouhara <kamel.bouhara@bootli=
n.com> wrote:
>
> From: "Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>
>
> Backports the SPDX 3.0 support and fixes from upstream walnascar
> commit 49f47169953b807d430461ca33f3a2b076119712 into upstream
> scarthgap.
>
> Signed-off-by: Kamel Bouhara (Schneider Electric) <kamel.bouhara@bootlin.=
com>
> ---
>  .../create-spdx-image-3.0.bbclass             |   85 +
>  .../create-spdx-sdk-3.0.bbclass               |   74 +
>  meta/classes-recipe/nospdx.bbclass            |   13 +
>  meta/classes/create-spdx-3.0.bbclass          |  200 +
>  meta/classes/spdx-common.bbclass              |   99 +
>  meta/lib/oe/__init__.py                       |    2 +-
>  meta/lib/oe/sbom30.py                         | 1096 ++++
>  meta/lib/oe/spdx30.py                         | 5593 +++++++++++++++++
>  meta/lib/oe/spdx30_tasks.py                   | 1348 ++++
>  meta/lib/oe/spdx_common.py                    |  244 +
>  10 files changed, 8753 insertions(+), 1 deletion(-)
>  create mode 100644 meta/classes-recipe/create-spdx-image-3.0.bbclass
>  create mode 100644 meta/classes-recipe/create-spdx-sdk-3.0.bbclass
>  create mode 100644 meta/classes-recipe/nospdx.bbclass
>  create mode 100644 meta/classes/create-spdx-3.0.bbclass
>  create mode 100644 meta/classes/spdx-common.bbclass
>  create mode 100644 meta/lib/oe/sbom30.py
>  create mode 100644 meta/lib/oe/spdx30.py
>  create mode 100644 meta/lib/oe/spdx30_tasks.py
>  create mode 100644 meta/lib/oe/spdx_common.py
>
> diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/cla=
sses-recipe/create-spdx-image-3.0.bbclass
> new file mode 100644
> index 0000000000..e0f1766bb7
> --- /dev/null
> +++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
> @@ -0,0 +1,85 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# SPDX image tasks
> +
> +SPDX_ROOTFS_PACKAGES =3D "${SPDXDIR}/rootfs-packages.json"
> +SPDXIMAGEDEPLOYDIR =3D "${SPDXDIR}/image-deploy"
> +SPDXROOTFSDEPLOY =3D "${SPDXDIR}/rootfs-deploy"
> +
> +python spdx_collect_rootfs_packages() {
> +    import json
> +    from pathlib import Path
> +    from oe.rootfs import image_list_installed_packages
> +
> +    root_packages_file =3D Path(d.getVar("SPDX_ROOTFS_PACKAGES"))
> +
> +    packages =3D image_list_installed_packages(d)
> +    if not packages:
> +        packages =3D {}
> +
> +    root_packages_file.parent.mkdir(parents=3DTrue, exist_ok=3DTrue)
> +    with root_packages_file.open("w") as f:
> +        json.dump(packages, f)
> +}
> +ROOTFS_POSTUNINSTALL_COMMAND =3D+ "spdx_collect_rootfs_packages"
> +
> +python do_create_rootfs_spdx() {
> +    import oe.spdx30_tasks
> +    oe.spdx30_tasks.create_rootfs_spdx(d)
> +}
> +addtask do_create_rootfs_spdx after do_rootfs before do_image
> +SSTATETASKS +=3D "do_create_rootfs_spdx"
> +do_create_rootfs_spdx[sstate-inputdirs] =3D "${SPDXROOTFSDEPLOY}"
> +do_create_rootfs_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
> +do_create_rootfs_spdx[recrdeptask] +=3D "do_create_spdx do_create_packag=
e_spdx"
> +do_create_rootfs_spdx[cleandirs] +=3D "${SPDXROOTFSDEPLOY}"
> +do_create_rootfs_spdx[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> +
> +python do_create_rootfs_spdx_setscene() {
> +    sstate_setscene(d)
> +}
> +addtask do_create_rootfs_spdx_setscene
> +
> +python do_create_image_spdx() {
> +    import oe.spdx30_tasks
> +    oe.spdx30_tasks.create_image_spdx(d)
> +}
> +addtask do_create_image_spdx after do_image_complete do_create_rootfs_sp=
dx before do_build
> +SSTATETASKS +=3D "do_create_image_spdx"
> +SSTATE_SKIP_CREATION:task-create-image-spdx =3D "1"
> +do_create_image_spdx[sstate-inputdirs] =3D "${SPDXIMAGEWORK}"
> +do_create_image_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
> +do_create_image_spdx[cleandirs] =3D "${SPDXIMAGEWORK}"
> +do_create_image_spdx[dirs] =3D "${SPDXIMAGEWORK}"
> +do_create_image_spdx[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> +do_create_image_spdx[vardeps] +=3D "\
> +    SPDX_IMAGE_PURPOSE \
> +    "
> +
> +python do_create_image_spdx_setscene() {
> +    sstate_setscene(d)
> +}
> +addtask do_create_image_spdx_setscene
> +
> +
> +python do_create_image_sbom_spdx() {
> +    import oe.spdx30_tasks
> +    oe.spdx30_tasks.create_image_sbom_spdx(d)
> +}
> +addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_=
image_spdx before do_build
> +SSTATETASKS +=3D "do_create_image_sbom_spdx"
> +SSTATE_SKIP_CREATION:task-create-image-sbom =3D "1"
> +do_create_image_sbom_spdx[sstate-inputdirs] =3D "${SPDXIMAGEDEPLOYDIR}"
> +do_create_image_sbom_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_IMAGE}"
> +do_create_image_sbom_spdx[stamp-extra-info] =3D "${MACHINE_ARCH}"
> +do_create_image_sbom_spdx[cleandirs] =3D "${SPDXIMAGEDEPLOYDIR}"
> +do_create_image_sbom_spdx[recrdeptask] +=3D "do_create_spdx do_create_pa=
ckage_spdx"
> +do_create_image_sbom_spdx[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> +
> +python do_create_image_sbom_spdx_setscene() {
> +    sstate_setscene(d)
> +}
> +addtask do_create_image_sbom_spdx_setscene
> diff --git a/meta/classes-recipe/create-spdx-sdk-3.0.bbclass b/meta/class=
es-recipe/create-spdx-sdk-3.0.bbclass
> new file mode 100644
> index 0000000000..855fb3d09f
> --- /dev/null
> +++ b/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
> @@ -0,0 +1,74 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# SPDX SDK tasks
> +
> +do_populate_sdk[recrdeptask] +=3D "do_create_spdx do_create_package_spdx=
"
> +do_populate_sdk[cleandirs] +=3D "${SPDXSDKWORK}"
> +do_populate_sdk[postfuncs] +=3D "sdk_create_sbom"
> +do_populate_sdk[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> +POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk =3D " sdk_host_c=
reate_spdx"
> +POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk =3D " sdk_targ=
et_create_spdx"
> +
> +do_populate_sdk_ext[recrdeptask] +=3D "do_create_spdx do_create_package_=
spdx"
> +do_populate_sdk_ext[cleandirs] +=3D "${SPDXSDKEXTWORK}"
> +do_populate_sdk_ext[postfuncs] +=3D "sdk_ext_create_sbom"
> +do_populate_sdk_ext[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> +POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk-ext =3D " sdk_ex=
t_host_create_spdx"
> +POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk-ext =3D " sdk_=
ext_target_create_spdx"
> +
> +python sdk_host_create_spdx() {
> +    from pathlib import Path
> +    import oe.spdx30_tasks
> +    spdx_work_dir =3D Path(d.getVar('SPDXSDKWORK'))
> +
> +    oe.spdx30_tasks.sdk_create_spdx(d, "host", spdx_work_dir, d.getVar("=
TOOLCHAIN_OUTPUTNAME"))
> +}
> +
> +python sdk_target_create_spdx() {
> +    from pathlib import Path
> +    import oe.spdx30_tasks
> +    spdx_work_dir =3D Path(d.getVar('SPDXSDKWORK'))
> +
> +    oe.spdx30_tasks.sdk_create_spdx(d, "target", spdx_work_dir, d.getVar=
("TOOLCHAIN_OUTPUTNAME"))
> +}
> +
> +python sdk_ext_host_create_spdx() {
> +    from pathlib import Path
> +    import oe.spdx30_tasks
> +    spdx_work_dir =3D Path(d.getVar('SPDXSDKEXTWORK'))
> +
> +    # TODO: This doesn't seem to work
> +    oe.spdx30_tasks.sdk_create_spdx(d, "host", spdx_work_dir, d.getVar("=
TOOLCHAINEXT_OUTPUTNAME"))
> +}
> +
> +python sdk_ext_target_create_spdx() {
> +    from pathlib import Path
> +    import oe.spdx30_tasks
> +    spdx_work_dir =3D Path(d.getVar('SPDXSDKEXTWORK'))
> +
> +    # TODO: This doesn't seem to work
> +    oe.spdx30_tasks.sdk_create_spdx(d, "target", spdx_work_dir, d.getVar=
("TOOLCHAINEXT_OUTPUTNAME"))
> +}
> +
> +
> +python sdk_create_sbom() {
> +    from pathlib import Path
> +    import oe.spdx30_tasks
> +    sdk_deploydir =3D Path(d.getVar("SDKDEPLOYDIR"))
> +    spdx_work_dir =3D Path(d.getVar('SPDXSDKWORK'))
> +
> +    oe.spdx30_tasks.create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, d.g=
etVar("TOOLCHAIN_OUTPUTNAME"))
> +}
> +
> +python sdk_ext_create_sbom() {
> +    from pathlib import Path
> +    import oe.spdx30_tasks
> +    sdk_deploydir =3D Path(d.getVar("SDKEXTDEPLOYDIR"))
> +    spdx_work_dir =3D Path(d.getVar('SPDXSDKEXTWORK'))
> +
> +    oe.spdx30_tasks.create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, d.g=
etVar("TOOLCHAINEXT_OUTPUTNAME"))
> +}
> +
> diff --git a/meta/classes-recipe/nospdx.bbclass b/meta/classes-recipe/nos=
pdx.bbclass
> new file mode 100644
> index 0000000000..b20e28218b
> --- /dev/null
> +++ b/meta/classes-recipe/nospdx.bbclass
> @@ -0,0 +1,13 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +deltask do_collect_spdx_deps
> +deltask do_create_spdx
> +deltask do_create_spdx_runtime
> +deltask do_create_package_spdx
> +deltask do_create_rootfs_spdx
> +deltask do_create_image_spdx
> +deltask do_create_image_sbom
> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
> new file mode 100644
> index 0000000000..044517d9f7
> --- /dev/null
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -0,0 +1,200 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +
> +inherit spdx-common
> +
> +SPDX_VERSION =3D "3.0.1"
> +
> +# The list of SPDX profiles generated documents will conform to
> +SPDX_PROFILES ?=3D "core build software simpleLicensing security"
> +
> +SPDX_INCLUDE_BUILD_VARIABLES ??=3D "0"
> +SPDX_INCLUDE_BUILD_VARIABLES[doc] =3D "If set to '1', the bitbake variab=
les for a \
> +    recipe will be included in the Build object. This will most likely r=
esult \
> +    in non-reproducible SPDX output"
> +
> +SPDX_INCLUDE_BITBAKE_PARENT_BUILD ??=3D "0"
> +SPDX_INCLUDE_BITBAKE_PARENT_BUILD[doc] =3D "Report the parent invocation=
 of bitbake \
> +    for each Build object. This allows you to know who invoked bitbake t=
o perform \
> +    a build, but will result in non-reproducible SPDX output."
> +
> +SPDX_PACKAGE_ADDITIONAL_PURPOSE ?=3D ""
> +SPDX_PACKAGE_ADDITIONAL_PURPOSE[doc] =3D "The list of additional purpose=
s to assign to \
> +    the generated packages for a recipe. The primary purpose is always `=
install`. \
> +    Packages overrides are allowed to override the additional purposes f=
or \
> +    individual packages."
> +
> +SPDX_IMAGE_PURPOSE ?=3D "filesystemImage"
> +SPDX_IMAGE_PURPOSE[doc] =3D "The list of purposes to assign to the gener=
ated images. \
> +    The first listed item will be the Primary Purpose and all additional=
 items will \
> +    be added as additional purposes"
> +
> +SPDX_SDK_PURPOSE ?=3D "install"
> +SPDX_SDK_PURPOSE[doc] =3D "The list of purposes to assign to the generat=
e SDK installer. \
> +    The first listed item will be the Primary Purpose and all additional=
 items will \
> +    be added as additional purposes"
> +
> +SPDX_INCLUDE_VEX ??=3D "current"
> +SPDX_INCLUDE_VEX[doc] =3D "Controls what VEX information is in the outpu=
t. Set to \
> +    'none' to disable all VEX data. Set to 'current' to only include VEX=
 data \
> +    for vulnerabilities not already fixed in the upstream source code \
> +    (recommended). Set  to 'all' to get all known historical vulnerabili=
ties, \
> +    including those already fixed upstream (warning: This can be large a=
nd \
> +    slow)."
> +
> +SPDX_INCLUDE_TIMESTAMPS ?=3D "0"
> +SPDX_INCLUDE_TIMESTAMPS[doc] =3D "Include time stamps in SPDX output. Th=
is is \
> +    useful if you want to know when artifacts were produced and when bui=
lds \
> +    occurred, but will result in non-reproducible SPDX output"
> +
> +SPDX_IMPORTS ??=3D ""
> +SPDX_IMPORTS[doc] =3D "SPDX_IMPORTS is the base variable that describes =
how to \
> +    reference external SPDX ids. Each import is defined as a key in this=
 \
> +    variable with a suffix to describe to as a suffix to look up more \
> +    information about the import. Each key can have the following variab=
les: \
> +        SPDX_IMPORTS_<key>_spdxid: The Fully qualified SPDX ID of the ob=
ject \
> +        SPDX_IMPORTS_<key>_uri: The URI where the SPDX Document that con=
tains \
> +            the external object can be found. Optional but recommended \
> +        SPDX_IMPORTS_<key>_hash_<hash>: The Checksum of the SPDX Documen=
t that \
> +            contains the External ID. <hash> must be one the valid SPDX =
hashing \
> +            algorithms, as described by the HashAlgorithm vocabulary in =
the\
> +            SPDX 3 spec. Optional but recommended"
> +
> +# Agents
> +#   Bitbake variables can be used to describe an SPDX Agent that may be =
used
> +#   during the build. An Agent is specified using a set of variables whi=
ch all
> +#   start with some common base name:
> +#
> +#   <BASE>_name: The name of the Agent (required)
> +#   <BASE>_type: The type of Agent. Must be one of "person", "organizati=
on",
> +#       "software", or "agent" (the default if not specified)
> +#   <BASE>_comment: The comment for the Agent (optional)
> +#   <BASE>_id_<ID>: And External Identifier for the Agent. <ID> must be =
a valid
> +#       ExternalIdentifierType from the SPDX 3 spec. Commonly, an E-mail=
 address
> +#       can be specified with <BASE>_id_email
> +#
> +#   Alternatively, an Agent can be an external reference by referencing =
a key
> +#   in SPDX_IMPORTS like so:
> +#
> +#   <BASE>_import =3D "<key>"
> +#
> +#   Finally, the same agent described by another set of agent variables =
can be
> +#   referenced by specifying the basename of the variable that should be
> +#   referenced:
> +#
> +#   SPDX_PACKAGE_SUPPLIER_ref =3D "SPDX_AUTHORS_openembedded"
> +
> +SPDX_AUTHORS ??=3D "openembedded"
> +SPDX_AUTHORS[doc] =3D "A space separated list of the document authors. E=
ach item \
> +    is used to name a base variable like SPDX_AUTHORS_<AUTHOR> that \
> +    describes the author."
> +
> +SPDX_AUTHORS_openembedded_name =3D "OpenEmbedded"
> +SPDX_AUTHORS_openembedded_type =3D "organization"
> +
> +SPDX_BUILD_HOST[doc] =3D "The base variable name to describe the build h=
ost on \
> +    which a build is running. Must be an SPDX_IMPORTS key. Requires \
> +    SPDX_INCLUDE_BITBAKE_PARENT_BUILD. NOTE: Setting this will result in=
 \
> +    non-reproducible SPDX output"
> +
> +SPDX_INVOKED_BY[doc] =3D "The base variable name to describe the Agent t=
hat \
> +    invoked the build, which builds will link to if specified. Requires =
\
> +    SPDX_INCLUDE_BITBAKE_PARENT_BUILD. NOTE: Setting this will likely re=
sult in \
> +    non-reproducible SPDX output"
> +
> +SPDX_ON_BEHALF_OF[doc] =3D "The base variable name to describe the Agent=
 on who's \
> +    behalf the invoking Agent (SPDX_INVOKED_BY) is running the build. Re=
quires \
> +    SPDX_INCLUDE_BITBAKE_PARENT_BUILD. NOTE: Setting this will likely re=
sult in \
> +    non-reproducible SPDX output"
> +
> +SPDX_PACKAGE_SUPPLIER[doc] =3D "The base variable name to describe the A=
gent who \
> +    is supplying artifacts produced by the build"
> +
> +SPDX_PACKAGE_VERSION ??=3D "${PV}"
> +SPDX_PACKAGE_VERSION[doc] =3D "The version of a package, software_packag=
eVersion \
> +    in software_Package"
> +
> +IMAGE_CLASSES:append =3D " create-spdx-image-3.0"
> +SDK_CLASSES +=3D "create-spdx-sdk-3.0"
> +
> +oe.spdx30_tasks.set_timestamp_now[vardepsexclude] =3D "SPDX_INCLUDE_TIME=
STAMPS"
> +oe.spdx30_tasks.get_package_sources_from_debug[vardepsexclude] +=3D "STA=
GING_KERNEL_DIR"
> +oe.spdx30_tasks.collect_dep_objsets[vardepsexclude] =3D "SPDX_MULTILIB_S=
STATE_ARCHS"
> +
> +
> +# SPDX library code makes heavy use of classes, which bitbake cannot eas=
ily
> +# parse out dependencies. As such, the library code files that make use =
of
> +# classes are explicitly added as file checksum dependencies.
> +SPDX3_LIB_DEP_FILES =3D "\
> +    ${COREBASE}/meta/lib/oe/sbom30.py:True \
> +    ${COREBASE}/meta/lib/oe/spdx30.py:True \
> +    "
> +
> +python do_create_spdx() {
> +    import oe.spdx30_tasks
> +    oe.spdx30_tasks.create_spdx(d)
> +}
> +do_create_spdx[vardeps] +=3D "\
> +    SPDX_INCLUDE_BITBAKE_PARENT_BUILD \
> +    SPDX_PACKAGE_ADDITIONAL_PURPOSE \
> +    SPDX_PROFILES \
> +    SPDX_NAMESPACE_PREFIX \
> +    SPDX_UUID_NAMESPACE \
> +    "
> +
> +addtask do_create_spdx after \
> +    do_collect_spdx_deps \
> +    do_deploy_source_date_epoch \
> +    do_populate_sysroot do_package do_packagedata \
> +    before do_populate_sdk do_populate_sdk_ext do_build do_rm_work
> +
> +SSTATETASKS +=3D "do_create_spdx"
> +do_create_spdx[sstate-inputdirs] =3D "${SPDXDEPLOY}"
> +do_create_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
> +do_create_spdx[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> +
> +python do_create_spdx_setscene () {
> +    sstate_setscene(d)
> +}
> +addtask do_create_spdx_setscene
> +
> +do_create_spdx[dirs] =3D "${SPDXWORK}"
> +do_create_spdx[cleandirs] =3D "${SPDXDEPLOY} ${SPDXWORK}"
> +do_create_spdx[depends] +=3D " \
> +    ${PATCHDEPENDENCY} \
> +    ${@create_spdx_source_deps(d)} \
> +"
> +
> +python do_create_package_spdx() {
> +    import oe.spdx30_tasks
> +    oe.spdx30_tasks.create_package_spdx(d)
> +}
> +oe.spdx30_tasks.create_package_spdx[vardepsexclude] =3D "OVERRIDES"
> +
> +addtask do_create_package_spdx after do_create_spdx before do_build do_r=
m_work
> +SSTATETASKS +=3D "do_create_package_spdx"
> +do_create_package_spdx[sstate-inputdirs] =3D "${SPDXRUNTIMEDEPLOY}"
> +do_create_package_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
> +do_create_package_spdx[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> +
> +python do_create_package_spdx_setscene () {
> +    sstate_setscene(d)
> +}
> +addtask do_create_package_spdx_setscene
> +
> +do_create_package_spdx[dirs] =3D "${SPDXRUNTIMEDEPLOY}"
> +do_create_package_spdx[cleandirs] =3D "${SPDXRUNTIMEDEPLOY}"
> +do_create_package_spdx[rdeptask] =3D "do_create_spdx"
> +
> +python spdx30_build_started_handler () {
> +    import oe.spdx30_tasks
> +    d =3D e.data.createCopy()
> +    oe.spdx30_tasks.write_bitbake_spdx(d)
> +}
> +
> +addhandler spdx30_build_started_handler
> +spdx30_build_started_handler[eventmask] =3D "bb.event.BuildStarted"
> +
> diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.=
bbclass
> new file mode 100644
> index 0000000000..36feb56807
> --- /dev/null
> +++ b/meta/classes/spdx-common.bbclass
> @@ -0,0 +1,99 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +
> +SPDX_VERSION ??=3D ""
> +DEPLOY_DIR_SPDX ??=3D "${DEPLOY_DIR}/spdx/${SPDX_VERSION}"
> +
> +# The product name that the CVE database uses.  Defaults to BPN, but may=
 need to
> +# be overriden per recipe (for example tiff.bb sets CVE_PRODUCT=3Dlibtif=
f).
> +CVE_PRODUCT ??=3D "${BPN}"
> +CVE_VERSION ??=3D "${PV}"
> +
> +SPDXDIR ??=3D "${WORKDIR}/spdx/${SPDX_VERSION}"
> +SPDXDEPLOY =3D "${SPDXDIR}/deploy"
> +SPDXWORK =3D "${SPDXDIR}/work"
> +SPDXIMAGEWORK =3D "${SPDXDIR}/image-work"
> +SPDXSDKWORK =3D "${SPDXDIR}/sdk-work"
> +SPDXSDKEXTWORK =3D "${SPDXDIR}/sdk-ext-work"
> +SPDXDEPS =3D "${SPDXDIR}/deps.json"
> +
> +SPDX_TOOL_NAME ??=3D "oe-spdx-creator"
> +SPDX_TOOL_VERSION ??=3D "1.0"
> +
> +SPDXRUNTIMEDEPLOY =3D "${SPDXDIR}/runtime-deploy"
> +
> +SPDX_INCLUDE_SOURCES ??=3D "0"
> +
> +SPDX_UUID_NAMESPACE ??=3D "sbom.openembedded.org"
> +SPDX_NAMESPACE_PREFIX ??=3D "http://spdx.org/spdxdocs"
> +SPDX_PRETTY ??=3D "0"
> +
> +SPDX_LICENSES ??=3D "${COREBASE}/meta/files/spdx-licenses.json"
> +
> +SPDX_CUSTOM_ANNOTATION_VARS ??=3D ""
> +
> +SPDX_MULTILIB_SSTATE_ARCHS ??=3D "${SSTATE_ARCHS}"
> +
> +def create_spdx_source_deps(d):
> +    import oe.spdx_common
> +
> +    deps =3D []
> +    if d.getVar("SPDX_INCLUDE_SOURCES") =3D=3D "1":
> +        pn =3D d.getVar('PN')
> +        # do_unpack is a hack for now; we only need it to get the
> +        # dependencies do_unpack already has so we can extract the sourc=
e
> +        # ourselves
> +        if oe.spdx_common.has_task(d, "do_unpack"):
> +            deps.append("%s:do_unpack" % pn)
> +
> +        if oe.spdx_common.is_work_shared_spdx(d) and \
> +           oe.spdx_common.process_sources(d):
> +            # For kernel source code
> +            if oe.spdx_common.has_task(d, "do_shared_workdir"):
> +                deps.append("%s:do_shared_workdir" % pn)
> +            elif d.getVar('S') =3D=3D d.getVar('STAGING_KERNEL_DIR'):
> +                deps.append("virtual/kernel:do_shared_workdir")
> +
> +            # For gcc-source-${PV} source code
> +            if oe.spdx_common.has_task(d, "do_preconfigure"):
> +                deps.append("%s:do_preconfigure" % pn)
> +            elif oe.spdx_common.has_task(d, "do_patch"):
> +                deps.append("%s:do_patch" % pn)
> +            # For gcc-cross-x86_64 source code
> +            elif oe.spdx_common.has_task(d, "do_configure"):
> +                deps.append("%s:do_configure" % pn)
> +
> +    return " ".join(deps)
> +
> +
> +python do_collect_spdx_deps() {
> +    # This task calculates the build time dependencies of the recipe, an=
d is
> +    # required because while a task can deptask on itself, those depende=
ncies
> +    # do not show up in BB_TASKDEPDATA. To work around that, this task d=
oes the
> +    # deptask on do_create_spdx and writes out the dependencies it finds=
, then
> +    # do_create_spdx reads in the found dependencies when writing the ac=
tual
> +    # SPDX document
> +    import json
> +    import oe.spdx_common
> +    from pathlib import Path
> +
> +    spdx_deps_file =3D Path(d.getVar("SPDXDEPS"))
> +
> +    deps =3D oe.spdx_common.collect_direct_deps(d, "do_create_spdx")
> +
> +    with spdx_deps_file.open("w") as f:
> +        json.dump(deps, f)
> +}
> +# NOTE: depending on do_unpack is a hack that is necessary to get it's d=
ependencies for archive the source
> +addtask do_collect_spdx_deps after do_unpack
> +do_collect_spdx_deps[depends] +=3D "${PATCHDEPENDENCY}"
> +do_collect_spdx_deps[deptask] =3D "do_create_spdx"
> +do_collect_spdx_deps[dirs] =3D "${SPDXDIR}"
> +
> +oe.spdx_common.collect_direct_deps[vardepsexclude] +=3D "BB_TASKDEPDATA"
> +oe.spdx_common.collect_direct_deps[vardeps] +=3D "DEPENDS"
> +oe.spdx_common.collect_package_providers[vardepsexclude] +=3D "BB_TASKDE=
PDATA"
> +oe.spdx_common.get_patched_src[vardepsexclude] +=3D "STAGING_KERNEL_DIR"
> diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
> index 6eb536ad28..dd9338ec2c 100644
> --- a/meta/lib/oe/__init__.py
> +++ b/meta/lib/oe/__init__.py
> @@ -9,4 +9,4 @@ __path__ =3D extend_path(__path__, __name__)
>
>  BBIMPORTS =3D ["data", "path", "utils", "types", "package", "packagedata=
", \
>               "packagegroup", "sstatesig", "lsb", "cachedpath", "license"=
, \
> -             "qa", "reproducible", "rust", "buildcfg", "go"]
> +             "qa", "reproducible", "rust", "buildcfg", "go", "spdx30_tas=
ks", "spdx_common"]
> diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> new file mode 100644
> index 0000000000..227ac51877
> --- /dev/null
> +++ b/meta/lib/oe/sbom30.py
> @@ -0,0 +1,1096 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +
> +from pathlib import Path
> +
> +import oe.spdx30
> +import bb
> +import re
> +import hashlib
> +import uuid
> +import os
> +import oe.spdx_common
> +from datetime import datetime, timezone
> +
> +OE_SPDX_BASE =3D "https://rdf.openembedded.org/spdx/3.0/"
> +
> +VEX_VERSION =3D "1.0.0"
> +
> +SPDX_BUILD_TYPE =3D "http://openembedded.org/bitbake"
> +
> +OE_ALIAS_PREFIX =3D "http://spdxdocs.org/openembedded-alias/by-doc-hash/=
"
> +OE_DOC_ALIAS_PREFIX =3D "http://spdxdocs.org/openembedded-alias/doc/"
> +
> +
> +@oe.spdx30.register(OE_SPDX_BASE + "id-alias")
> +class OEIdAliasExtension(oe.spdx30.extension_Extension):
> +    """
> +    This extension allows an Element to provide an internal alias for th=
e SPDX
> +    ID. Since SPDX requires unique URIs for each SPDX ID, most of the ob=
jects
> +    created have a unique UUID namespace and the unihash of the task enc=
oded in
> +    their SPDX ID. However, this causes a problem for referencing docume=
nts
> +    across recipes, since the taskhash of a dependency may not factor in=
to the
> +    taskhash of the current task and thus the current task won't rebuild=
 and
> +    see the new SPDX ID when the dependency changes (e.g. ABI safe recip=
es and
> +    tasks).
> +
> +    To help work around this, this extension provides a non-unique alias=
 for an
> +    Element by which it can be referenced from other tasks/recipes. When=
 a
> +    final SBoM is created, references to these aliases will be replaced =
with
> +    the actual unique SPDX ID.
> +
> +    Most Elements will automatically get an alias created when they are =
written
> +    out if they do not already have one. To suppress the creation of an =
alias,
> +    add an extension with a blank `alias` property.
> +
> +
> +    It is in internal extension that should be removed when writing out =
a final
> +    SBoM
> +    """
> +
> +    CLOSED =3D True
> +    INTERNAL =3D True
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        cls._add_property(
> +            "alias",
> +            oe.spdx30.StringProp(),
> +            OE_SPDX_BASE + "alias",
> +            max_count=3D1,
> +        )
> +
> +        cls._add_property(
> +            "link_name",
> +            oe.spdx30.StringProp(),
> +            OE_SPDX_BASE + "link-name",
> +            max_count=3D1,
> +        )
> +
> +
> +@oe.spdx30.register(OE_SPDX_BASE + "file-name-alias")
> +class OEFileNameAliasExtension(oe.spdx30.extension_Extension):
> +    CLOSED =3D True
> +    INTERNAL =3D True
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        cls._add_property(
> +            "aliases",
> +            oe.spdx30.ListProp(oe.spdx30.StringProp()),
> +            OE_SPDX_BASE + "filename-alias",
> +        )
> +
> +
> +@oe.spdx30.register(OE_SPDX_BASE + "license-scanned")
> +class OELicenseScannedExtension(oe.spdx30.extension_Extension):
> +    """
> +    The presence of this extension means the file has already been scann=
ed for
> +    license information
> +    """
> +
> +    CLOSED =3D True
> +    INTERNAL =3D True
> +
> +
> +@oe.spdx30.register(OE_SPDX_BASE + "document-extension")
> +class OEDocumentExtension(oe.spdx30.extension_Extension):
> +    """
> +    This extension is added to a SpdxDocument to indicate various useful=
 bits
> +    of information about its contents
> +    """
> +
> +    CLOSED =3D True
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        cls._add_property(
> +            "is_native",
> +            oe.spdx30.BooleanProp(),
> +            OE_SPDX_BASE + "is-native",
> +            max_count=3D1,
> +        )
> +
> +
> +def spdxid_hash(*items):
> +    h =3D hashlib.md5()
> +    for i in items:
> +        if isinstance(i, oe.spdx30.Element):
> +            h.update(i._id.encode("utf-8"))
> +        else:
> +            h.update(i.encode("utf-8"))
> +    return h.hexdigest()
> +
> +
> +def spdx_sde(d):
> +    sde =3D d.getVar("SOURCE_DATE_EPOCH")
> +    if not sde:
> +        return datetime.now(timezone.utc)
> +
> +    return datetime.fromtimestamp(int(sde), timezone.utc)
> +
> +
> +def get_element_link_id(e):
> +    """
> +    Get the string ID which should be used to link to an Element. If the
> +    element has an alias, that will be preferred, otherwise its SPDX ID =
will be
> +    used.
> +    """
> +    ext =3D get_alias(e)
> +    if ext is not None and ext.alias:
> +        return ext.alias
> +    return e._id
> +
> +
> +def get_alias(obj):
> +    for ext in obj.extension:
> +        if not isinstance(ext, OEIdAliasExtension):
> +            continue
> +        return ext
> +
> +    return None
> +
> +
> +def hash_id(_id):
> +    return hashlib.sha256(_id.encode("utf-8")).hexdigest()
> +
> +
> +def to_list(l):
> +    if isinstance(l, set):
> +        l =3D sorted(list(l))
> +
> +    if not isinstance(l, (list, tuple)):
> +        raise TypeError("Must be a list or tuple. Got %s" % type(l))
> +
> +    return l
> +
> +
> +class ObjectSet(oe.spdx30.SHACLObjectSet):
> +    def __init__(self, d):
> +        super().__init__()
> +        self.d =3D d
> +        self.alias_prefix =3D None
> +
> +    def create_index(self):
> +        self.by_sha256_hash =3D {}
> +        super().create_index()
> +
> +    def add_index(self, obj):
> +        # Check that all elements are given an ID before being inserted
> +        if isinstance(obj, oe.spdx30.Element):
> +            if not obj._id:
> +                raise ValueError("Element missing ID")
> +
> +            alias_ext =3D get_alias(obj)
> +            if alias_ext is not None and alias_ext.alias:
> +                self.obj_by_id[alias_ext.alias] =3D obj
> +
> +            for v in obj.verifiedUsing:
> +                if not isinstance(v, oe.spdx30.Hash):
> +                    continue
> +
> +                if v.algorithm !=3D oe.spdx30.HashAlgorithm.sha256:
> +                    continue
> +
> +                self.by_sha256_hash.setdefault(v.hashValue, set()).add(o=
bj)
> +
> +        super().add_index(obj)
> +        if isinstance(obj, oe.spdx30.SpdxDocument):
> +            self.doc =3D obj
> +            alias_ext =3D get_alias(obj)
> +            if alias_ext is not None and alias_ext.alias:
> +                self.alias_prefix =3D OE_ALIAS_PREFIX + hash_id(alias_ex=
t.alias) + "/"
> +
> +    def __filter_obj(self, obj, attr_filter):
> +        return all(getattr(obj, k) =3D=3D v for k, v in attr_filter.item=
s())
> +
> +    def foreach_filter(self, typ, *, match_subclass=3DTrue, **attr_filte=
r):
> +        for obj in self.foreach_type(typ, match_subclass=3Dmatch_subclas=
s):
> +            if self.__filter_obj(obj, attr_filter):
> +                yield obj
> +
> +    def find_filter(self, typ, *, match_subclass=3DTrue, **attr_filter):
> +        for obj in self.foreach_filter(
> +            typ, match_subclass=3Dmatch_subclass, **attr_filter
> +        ):
> +            return obj
> +        return None
> +
> +    def foreach_root(self, typ, **attr_filter):
> +        for obj in self.doc.rootElement:
> +            if not isinstance(obj, typ):
> +                continue
> +
> +            if self.__filter_obj(obj, attr_filter):
> +                yield obj
> +
> +    def find_root(self, typ, **attr_filter):
> +        for obj in self.foreach_root(typ, **attr_filter):
> +            return obj
> +        return None
> +
> +    def add_root(self, obj):
> +        self.add(obj)
> +        self.doc.rootElement.append(obj)
> +        return obj
> +
> +    def is_native(self):
> +        for e in self.doc.extension:
> +            if not isinstance(e, oe.sbom30.OEDocumentExtension):
> +                continue
> +
> +            if e.is_native is not None:
> +                return e.is_native
> +
> +        return False
> +
> +    def set_is_native(self, is_native):
> +        for e in self.doc.extension:
> +            if not isinstance(e, oe.sbom30.OEDocumentExtension):
> +                continue
> +
> +            e.is_native =3D is_native
> +            return
> +
> +        if is_native:
> +            self.doc.extension.append(oe.sbom30.OEDocumentExtension(is_n=
ative=3DTrue))
> +
> +    def add_aliases(self):
> +        for o in self.foreach_type(oe.spdx30.Element):
> +            self.set_element_alias(o)
> +
> +    def new_alias_id(self, obj, replace):
> +        unihash =3D self.d.getVar("BB_UNIHASH")
> +        namespace =3D self.get_namespace()
> +        if unihash not in obj._id:
> +            bb.warn(f"Unihash {unihash} not found in {obj._id}")
> +            return None
> +
> +        if namespace not in obj._id:
> +            bb.warn(f"Namespace {namespace} not found in {obj._id}")
> +            return None
> +
> +        return obj._id.replace(unihash, "UNIHASH").replace(
> +            namespace, replace + self.d.getVar("PN")
> +        )
> +
> +    def remove_internal_extensions(self):
> +        def remove(o):
> +            o.extension =3D [e for e in o.extension if not getattr(e, "I=
NTERNAL", False)]
> +
> +        for o in self.foreach_type(oe.spdx30.Element):
> +            remove(o)
> +
> +        if self.doc:
> +            remove(self.doc)
> +
> +    def get_namespace(self):
> +        namespace_uuid =3D uuid.uuid5(
> +            uuid.NAMESPACE_DNS, self.d.getVar("SPDX_UUID_NAMESPACE")
> +        )
> +        pn =3D self.d.getVar("PN")
> +        return "%s/%s-%s" % (
> +            self.d.getVar("SPDX_NAMESPACE_PREFIX"),
> +            pn,
> +            str(uuid.uuid5(namespace_uuid, pn)),
> +        )
> +
> +    def set_element_alias(self, e):
> +        if not e._id or e._id.startswith("_:"):
> +            return
> +
> +        alias_ext =3D get_alias(e)
> +        if alias_ext is None:
> +            alias_id =3D self.new_alias_id(e, self.alias_prefix)
> +            if alias_id is not None:
> +                e.extension.append(OEIdAliasExtension(alias=3Dalias_id))
> +        elif (
> +            alias_ext.alias
> +            and not isinstance(e, oe.spdx30.SpdxDocument)
> +            and not alias_ext.alias.startswith(self.alias_prefix)
> +        ):
> +            bb.warn(
> +                f"Element {e._id} has alias {alias_ext.alias}, but it sh=
ould have prefix {self.alias_prefix}"
> +            )
> +
> +    def new_spdxid(self, *suffix, include_unihash=3DTrue):
> +        items =3D [self.get_namespace()]
> +        if include_unihash:
> +            unihash =3D self.d.getVar("BB_UNIHASH")
> +            items.append(unihash)
> +        items.extend(re.sub(r"[^a-zA-Z0-9_-]", "_", s) for s in suffix)
> +        return "/".join(items)
> +
> +    def new_import(self, key):
> +        base =3D f"SPDX_IMPORTS_{key}"
> +        spdxid =3D self.d.getVar(f"{base}_spdxid")
> +        if not spdxid:
> +            bb.fatal(f"{key} is not a valid SPDX_IMPORTS key")
> +
> +        for i in self.doc.import_:
> +            if i.externalSpdxId =3D=3D spdxid:
> +                # Already imported
> +                return spdxid
> +
> +        m =3D oe.spdx30.ExternalMap(externalSpdxId=3Dspdxid)
> +
> +        uri =3D self.d.getVar(f"{base}_uri")
> +        if uri:
> +            m.locationHint =3D uri
> +
> +        for pyname, algorithm in oe.spdx30.HashAlgorithm.NAMED_INDIVIDUA=
LS.items():
> +            value =3D self.d.getVar(f"{base}_hash_{pyname}")
> +            if value:
> +                m.verifiedUsing.append(
> +                    oe.spdx30.Hash(
> +                        algorithm=3Dalgorithm,
> +                        hashValue=3Dvalue,
> +                    )
> +                )
> +
> +        self.doc.import_.append(m)
> +        return spdxid
> +
> +    def new_agent(self, varname, *, creation_info=3DNone, add=3DTrue):
> +        ref_varname =3D self.d.getVar(f"{varname}_ref")
> +        if ref_varname:
> +            if ref_varname =3D=3D varname:
> +                bb.fatal(f"{varname} cannot reference itself")
> +            return self.new_agent(ref_varname, creation_info=3Dcreation_=
info)
> +
> +        import_key =3D self.d.getVar(f"{varname}_import")
> +        if import_key:
> +            return self.new_import(import_key)
> +
> +        name =3D self.d.getVar(f"{varname}_name")
> +        if not name:
> +            return None
> +
> +        spdxid =3D self.new_spdxid("agent", name)
> +        agent =3D self.find_by_id(spdxid)
> +        if agent is not None:
> +            return agent
> +
> +        agent_type =3D self.d.getVar("%s_type" % varname)
> +        if agent_type =3D=3D "person":
> +            agent =3D oe.spdx30.Person()
> +        elif agent_type =3D=3D "software":
> +            agent =3D oe.spdx30.SoftwareAgent()
> +        elif agent_type =3D=3D "organization":
> +            agent =3D oe.spdx30.Organization()
> +        elif not agent_type or agent_type =3D=3D "agent":
> +            agent =3D oe.spdx30.Agent()
> +        else:
> +            bb.fatal("Unknown agent type '%s' in %s_type" % (agent_type,=
 varname))
> +
> +        agent._id =3D spdxid
> +        agent.creationInfo =3D creation_info or self.doc.creationInfo
> +        agent.name =3D name
> +
> +        comment =3D self.d.getVar("%s_comment" % varname)
> +        if comment:
> +            agent.comment =3D comment
> +
> +        for (
> +            pyname,
> +            idtype,
> +        ) in oe.spdx30.ExternalIdentifierType.NAMED_INDIVIDUALS.items():
> +            value =3D self.d.getVar("%s_id_%s" % (varname, pyname))
> +            if value:
> +                agent.externalIdentifier.append(
> +                    oe.spdx30.ExternalIdentifier(
> +                        externalIdentifierType=3Didtype,
> +                        identifier=3Dvalue,
> +                    )
> +                )
> +
> +        if add:
> +            self.add(agent)
> +
> +        return agent
> +
> +    def new_creation_info(self):
> +        creation_info =3D oe.spdx30.CreationInfo()
> +
> +        name =3D "%s %s" % (
> +            self.d.getVar("SPDX_TOOL_NAME"),
> +            self.d.getVar("SPDX_TOOL_VERSION"),
> +        )
> +        tool =3D self.add(
> +            oe.spdx30.Tool(
> +                _id=3Dself.new_spdxid("tool", name),
> +                creationInfo=3Dcreation_info,
> +                name=3Dname,
> +            )
> +        )
> +
> +        authors =3D []
> +        for a in self.d.getVar("SPDX_AUTHORS").split():
> +            varname =3D "SPDX_AUTHORS_%s" % a
> +            author =3D self.new_agent(varname, creation_info=3Dcreation_=
info)
> +
> +            if not author:
> +                bb.fatal("Unable to find or create author %s" % a)
> +
> +            authors.append(author)
> +
> +        creation_info.created =3D spdx_sde(self.d)
> +        creation_info.specVersion =3D self.d.getVar("SPDX_VERSION")
> +        creation_info.createdBy =3D authors
> +        creation_info.createdUsing =3D [tool]
> +
> +        return creation_info
> +
> +    def copy_creation_info(self, copy):
> +        c =3D oe.spdx30.CreationInfo(
> +            created=3Dspdx_sde(self.d),
> +            specVersion=3Dself.d.getVar("SPDX_VERSION"),
> +        )
> +
> +        for author in copy.createdBy:
> +            if isinstance(author, str):
> +                c.createdBy.append(author)
> +            else:
> +                c.createdBy.append(author._id)
> +
> +        for tool in copy.createdUsing:
> +            if isinstance(tool, str):
> +                c.createdUsing.append(tool)
> +            else:
> +                c.createdUsing.append(tool._id)
> +
> +        return c
> +
> +    def new_annotation(self, subject, comment, typ):
> +        return self.add(
> +            oe.spdx30.Annotation(
> +                _id=3Dself.new_spdxid("annotation", spdxid_hash(comment,=
 typ)),
> +                creationInfo=3Dself.doc.creationInfo,
> +                annotationType=3Dtyp,
> +                subject=3Dsubject,
> +                statement=3Dcomment,
> +            )
> +        )
> +
> +    def _new_relationship(
> +        self,
> +        cls,
> +        from_,
> +        typ,
> +        to,
> +        *,
> +        spdxid_name=3D"relationship",
> +        **props,
> +    ):
> +        from_ =3D to_list(from_)
> +        to =3D to_list(to)
> +
> +        if not from_:
> +            return []
> +
> +        if not to:
> +            to =3D [oe.spdx30.IndividualElement.NoneElement]
> +
> +        ret =3D []
> +
> +        for f in from_:
> +            hash_args =3D [typ, f]
> +            for k in sorted(props.keys()):
> +                hash_args.append(props[k])
> +            hash_args.extend(to)
> +
> +            relationship =3D self.add(
> +                cls(
> +                    _id=3Dself.new_spdxid(spdxid_name, spdxid_hash(*hash=
_args)),
> +                    creationInfo=3Dself.doc.creationInfo,
> +                    from_=3Df,
> +                    relationshipType=3Dtyp,
> +                    to=3Dto,
> +                    **props,
> +                )
> +            )
> +            ret.append(relationship)
> +
> +        return ret
> +
> +    def new_relationship(self, from_, typ, to):
> +        return self._new_relationship(oe.spdx30.Relationship, from_, typ=
, to)
> +
> +    def new_scoped_relationship(self, from_, typ, scope, to):
> +        return self._new_relationship(
> +            oe.spdx30.LifecycleScopedRelationship,
> +            from_,
> +            typ,
> +            to,
> +            scope=3Dscope,
> +        )
> +
> +    def new_license_expression(
> +        self, license_expression, license_data, license_text_map=3D{}
> +    ):
> +        license_list_version =3D license_data["licenseListVersion"]
> +        # SPDX 3 requires that the license list version be a semver
> +        # MAJOR.MINOR.MICRO, but the actual license version might be
> +        # MAJOR.MINOR on some older versions. As such, manually append a=
 .0
> +        # micro version if its missing to keep SPDX happy
> +        if license_list_version.count(".") < 2:
> +            license_list_version +=3D ".0"
> +
> +        spdxid =3D [
> +            "license",
> +            license_list_version,
> +            re.sub(r"[^a-zA-Z0-9_-]", "_", license_expression),
> +        ]
> +
> +        license_text =3D [
> +            (k, license_text_map[k]) for k in sorted(license_text_map.ke=
ys())
> +        ]
> +
> +        if not license_text:
> +            lic =3D self.find_filter(
> +                oe.spdx30.simplelicensing_LicenseExpression,
> +                simplelicensing_licenseExpression=3Dlicense_expression,
> +                simplelicensing_licenseListVersion=3Dlicense_list_versio=
n,
> +            )
> +            if lic is not None:
> +                return lic
> +        else:
> +            spdxid.append(spdxid_hash(*(v for _, v in license_text)))
> +            lic =3D self.find_by_id(self.new_spdxid(*spdxid))
> +            if lic is not None:
> +                return lic
> +
> +        lic =3D self.add(
> +            oe.spdx30.simplelicensing_LicenseExpression(
> +                _id=3Dself.new_spdxid(*spdxid),
> +                creationInfo=3Dself.doc.creationInfo,
> +                simplelicensing_licenseExpression=3Dlicense_expression,
> +                simplelicensing_licenseListVersion=3Dlicense_list_versio=
n,
> +            )
> +        )
> +
> +        for key, value in license_text:
> +            lic.simplelicensing_customIdToUri.append(
> +                oe.spdx30.DictionaryEntry(key=3Dkey, value=3Dvalue)
> +            )
> +
> +        return lic
> +
> +    def scan_declared_licenses(self, spdx_file, filepath, license_data):
> +        for e in spdx_file.extension:
> +            if isinstance(e, OELicenseScannedExtension):
> +                return
> +
> +        file_licenses =3D set()
> +        for extracted_lic in oe.spdx_common.extract_licenses(filepath):
> +            lic =3D self.new_license_expression(extracted_lic, license_d=
ata)
> +            self.set_element_alias(lic)
> +            file_licenses.add(lic)
> +
> +        self.new_relationship(
> +            [spdx_file],
> +            oe.spdx30.RelationshipType.hasDeclaredLicense,
> +            [oe.sbom30.get_element_link_id(lic_alias) for lic_alias in f=
ile_licenses],
> +        )
> +        spdx_file.extension.append(OELicenseScannedExtension())
> +
> +    def new_file(self, _id, name, path, *, purposes=3D[]):
> +        sha256_hash =3D bb.utils.sha256_file(path)
> +
> +        for f in self.by_sha256_hash.get(sha256_hash, []):
> +            if not isinstance(f, oe.spdx30.software_File):
> +                continue
> +
> +            if purposes:
> +                new_primary =3D purposes[0]
> +                new_additional =3D []
> +
> +                if f.software_primaryPurpose:
> +                    new_additional.append(f.software_primaryPurpose)
> +                new_additional.extend(f.software_additionalPurpose)
> +
> +                new_additional =3D sorted(
> +                    list(set(p for p in new_additional if p !=3D new_pri=
mary))
> +                )
> +
> +                f.software_primaryPurpose =3D new_primary
> +                f.software_additionalPurpose =3D new_additional
> +
> +            if f.name !=3D name:
> +                for e in f.extension:
> +                    if isinstance(e, OEFileNameAliasExtension):
> +                        e.aliases.append(name)
> +                        break
> +                else:
> +                    f.extension.append(OEFileNameAliasExtension(aliases=
=3D[name]))
> +
> +            return f
> +
> +        spdx_file =3D oe.spdx30.software_File(
> +            _id=3D_id,
> +            creationInfo=3Dself.doc.creationInfo,
> +            name=3Dname,
> +        )
> +        if purposes:
> +            spdx_file.software_primaryPurpose =3D purposes[0]
> +            spdx_file.software_additionalPurpose =3D purposes[1:]
> +
> +        spdx_file.verifiedUsing.append(
> +            oe.spdx30.Hash(
> +                algorithm=3Doe.spdx30.HashAlgorithm.sha256,
> +                hashValue=3Dsha256_hash,
> +            )
> +        )
> +
> +        return self.add(spdx_file)
> +
> +    def new_cve_vuln(self, cve):
> +        v =3D oe.spdx30.security_Vulnerability()
> +        v._id =3D self.new_spdxid("vulnerability", cve)
> +        v.creationInfo =3D self.doc.creationInfo
> +
> +        v.externalIdentifier.append(
> +            oe.spdx30.ExternalIdentifier(
> +                externalIdentifierType=3Doe.spdx30.ExternalIdentifierTyp=
e.cve,
> +                identifier=3Dcve,
> +                identifierLocator=3D[
> +                    f"https://cveawg.mitre.org/api/cve/{cve}",
> +                    f"https://www.cve.org/CVERecord?id=3D{cve}",
> +                ],
> +            )
> +        )
> +        return self.add(v)
> +
> +    def new_vex_patched_relationship(self, from_, to):
> +        return self._new_relationship(
> +            oe.spdx30.security_VexFixedVulnAssessmentRelationship,
> +            from_,
> +            oe.spdx30.RelationshipType.fixedIn,
> +            to,
> +            spdxid_name=3D"vex-fixed",
> +            security_vexVersion=3DVEX_VERSION,
> +        )
> +
> +    def new_vex_unpatched_relationship(self, from_, to):
> +        return self._new_relationship(
> +            oe.spdx30.security_VexAffectedVulnAssessmentRelationship,
> +            from_,
> +            oe.spdx30.RelationshipType.affects,
> +            to,
> +            spdxid_name=3D"vex-affected",
> +            security_vexVersion=3DVEX_VERSION,
> +            security_actionStatement=3D"Mitigation action unknown",
> +        )
> +
> +    def new_vex_ignored_relationship(self, from_, to, *, impact_statemen=
t):
> +        return self._new_relationship(
> +            oe.spdx30.security_VexNotAffectedVulnAssessmentRelationship,
> +            from_,
> +            oe.spdx30.RelationshipType.doesNotAffect,
> +            to,
> +            spdxid_name=3D"vex-not-affected",
> +            security_vexVersion=3DVEX_VERSION,
> +            security_impactStatement=3Dimpact_statement,
> +        )
> +
> +    def import_bitbake_build_objset(self):
> +        deploy_dir_spdx =3D Path(self.d.getVar("DEPLOY_DIR_SPDX"))
> +        bb_objset =3D load_jsonld(
> +            self.d, deploy_dir_spdx / "bitbake.spdx.json", required=3DTr=
ue
> +        )
> +        self.doc.import_.extend(bb_objset.doc.import_)
> +        self.update(bb_objset.objects)
> +
> +        return bb_objset
> +
> +    def import_bitbake_build(self):
> +        def find_bitbake_build(objset):
> +            return objset.find_filter(
> +                oe.spdx30.build_Build,
> +                build_buildType=3DSPDX_BUILD_TYPE,
> +            )
> +
> +        build =3D find_bitbake_build(self)
> +        if build:
> +            return build
> +
> +        bb_objset =3D self.import_bitbake_build_objset()
> +        build =3D find_bitbake_build(bb_objset)
> +        if build is None:
> +            bb.fatal(f"No build found in {deploy_dir_spdx}")
> +
> +        return build
> +
> +    def new_task_build(self, name, typ):
> +        current_task =3D self.d.getVar("BB_CURRENTTASK")
> +        pn =3D self.d.getVar("PN")
> +
> +        build =3D self.add(
> +            oe.spdx30.build_Build(
> +                _id=3Dself.new_spdxid("build", name),
> +                creationInfo=3Dself.doc.creationInfo,
> +                name=3Df"{pn}:do_{current_task}:{name}",
> +                build_buildType=3Df"{SPDX_BUILD_TYPE}/do_{current_task}/=
{typ}",
> +            )
> +        )
> +
> +        if self.d.getVar("SPDX_INCLUDE_BITBAKE_PARENT_BUILD") =3D=3D "1"=
:
> +            bitbake_build =3D self.import_bitbake_build()
> +
> +            self.new_relationship(
> +                [bitbake_build],
> +                oe.spdx30.RelationshipType.ancestorOf,
> +                [build],
> +            )
> +
> +        if self.d.getVar("SPDX_INCLUDE_BUILD_VARIABLES") =3D=3D "1":
> +            for varname in sorted(self.d.keys()):
> +                if varname.startswith("__"):
> +                    continue
> +
> +                value =3D self.d.getVar(varname, expand=3DFalse)
> +
> +                # TODO: Deal with non-string values
> +                if not isinstance(value, str):
> +                    continue
> +
> +                build.build_parameter.append(
> +                    oe.spdx30.DictionaryEntry(key=3Dvarname, value=3Dval=
ue)
> +                )
> +
> +        return build
> +
> +    def new_archive(self, archive_name):
> +        return self.add(
> +            oe.spdx30.software_File(
> +                _id=3Dself.new_spdxid("archive", str(archive_name)),
> +                creationInfo=3Dself.doc.creationInfo,
> +                name=3Dstr(archive_name),
> +                software_primaryPurpose=3Doe.spdx30.software_SoftwarePur=
pose.archive,
> +            )
> +        )
> +
> +    @classmethod
> +    def new_objset(cls, d, name, copy_from_bitbake_doc=3DTrue):
> +        objset =3D cls(d)
> +
> +        document =3D oe.spdx30.SpdxDocument(
> +            _id=3Dobjset.new_spdxid("document", name),
> +            name=3Dname,
> +        )
> +
> +        document.extension.append(
> +            OEIdAliasExtension(
> +                alias=3Dobjset.new_alias_id(
> +                    document,
> +                    OE_DOC_ALIAS_PREFIX + d.getVar("PN") + "/" + name + =
"/",
> +                ),
> +            )
> +        )
> +        objset.doc =3D document
> +        objset.add_index(document)
> +
> +        if copy_from_bitbake_doc:
> +            bb_objset =3D objset.import_bitbake_build_objset()
> +            document.creationInfo =3D objset.copy_creation_info(
> +                bb_objset.doc.creationInfo
> +            )
> +        else:
> +            document.creationInfo =3D objset.new_creation_info()
> +
> +        return objset
> +
> +    def expand_collection(self, *, add_objectsets=3D[]):
> +        """
> +        Expands a collection to pull in all missing elements
> +
> +        Returns the set of ids that could not be found to link into the =
document
> +        """
> +        missing_spdxids =3D set()
> +        imports =3D {e.externalSpdxId: e for e in self.doc.import_}
> +
> +        def merge_doc(other):
> +            nonlocal imports
> +
> +            for e in other.doc.import_:
> +                if not e.externalSpdxId in imports:
> +                    imports[e.externalSpdxId] =3D e
> +
> +            self.objects |=3D other.objects
> +
> +        for o in add_objectsets:
> +            merge_doc(o)
> +
> +        needed_spdxids =3D self.link()
> +        provided_spdxids =3D set(self.obj_by_id.keys())
> +
> +        while True:
> +            import_spdxids =3D set(imports.keys())
> +            searching_spdxids =3D (
> +                needed_spdxids - provided_spdxids - missing_spdxids - im=
port_spdxids
> +            )
> +            if not searching_spdxids:
> +                break
> +
> +            spdxid =3D searching_spdxids.pop()
> +            bb.debug(
> +                1,
> +                f"Searching for {spdxid}. Remaining: {len(searching_spdx=
ids)}, Total: {len(provided_spdxids)}, Missing: {len(missing_spdxids)}, Imp=
orts: {len(import_spdxids)}",
> +            )
> +            dep_objset, dep_path =3D find_by_spdxid(self.d, spdxid)
> +
> +            if dep_objset:
> +                dep_provided =3D set(dep_objset.obj_by_id.keys())
> +                if spdxid not in dep_provided:
> +                    bb.fatal(f"{spdxid} not found in {dep_path}")
> +                provided_spdxids |=3D dep_provided
> +                needed_spdxids |=3D dep_objset.missing_ids
> +                merge_doc(dep_objset)
> +            else:
> +                missing_spdxids.add(spdxid)
> +
> +        self.doc.import_ =3D sorted(imports.values(), key=3Dlambda e: e.=
externalSpdxId)
> +        bb.debug(1, "Linking...")
> +        self.link()
> +
> +        # Manually go through all of the simplelicensing_customIdToUri D=
ictionaryEntry
> +        # items and resolve any aliases to actual objects.
> +        for lic in self.foreach_type(oe.spdx30.simplelicensing_LicenseEx=
pression):
> +            for d in lic.simplelicensing_customIdToUri:
> +                if d.value.startswith(OE_ALIAS_PREFIX):
> +                    obj =3D self.find_by_id(d.value)
> +                    if obj is not None:
> +                        d.value =3D obj._id
> +                    else:
> +                        self.missing_ids.add(d.value)
> +
> +        self.missing_ids -=3D set(imports.keys())
> +        return self.missing_ids
> +
> +
> +def load_jsonld(d, path, required=3DFalse):
> +    deserializer =3D oe.spdx30.JSONLDDeserializer()
> +    objset =3D ObjectSet(d)
> +    try:
> +        with path.open("rb") as f:
> +            deserializer.read(f, objset)
> +    except FileNotFoundError:
> +        if required:
> +            bb.fatal("No SPDX document named %s found" % path)
> +        return None
> +
> +    if not objset.doc:
> +        bb.fatal("SPDX Document %s has no SPDXDocument element" % path)
> +        return None
> +
> +    objset.objects.remove(objset.doc)
> +    return objset
> +
> +
> +def jsonld_arch_path(d, arch, subdir, name, deploydir=3DNone):
> +    if deploydir is None:
> +        deploydir =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
> +    return deploydir / arch / subdir / (name + ".spdx.json")
> +
> +
> +def jsonld_hash_path(h):
> +    return Path("by-spdxid-hash") / h[:2], h
> +
> +
> +def load_jsonld_by_arch(d, arch, subdir, name, *, required=3DFalse):
> +    path =3D jsonld_arch_path(d, arch, subdir, name)
> +    objset =3D load_jsonld(d, path, required=3Drequired)
> +    if objset is not None:
> +        return (objset, path)
> +    return (None, None)
> +
> +
> +def find_jsonld(d, subdir, name, *, required=3DFalse):
> +    package_archs =3D d.getVar("SPDX_MULTILIB_SSTATE_ARCHS").split()
> +    package_archs.reverse()
> +
> +    for arch in package_archs:
> +        objset, path =3D load_jsonld_by_arch(d, arch, subdir, name)
> +        if objset is not None:
> +            return (objset, path)
> +
> +    if required:
> +        bb.fatal("Could not find a %s SPDX document named %s" % (subdir,=
 name))
> +
> +    return (None, None)
> +
> +
> +def write_jsonld_doc(d, objset, dest):
> +    if not isinstance(objset, ObjectSet):
> +        bb.fatal("Only an ObjsetSet can be serialized")
> +        return
> +
> +    if not objset.doc:
> +        bb.fatal("ObjectSet is missing a SpdxDocument")
> +        return
> +
> +    objset.doc.rootElement =3D sorted(list(set(objset.doc.rootElement)))
> +    objset.doc.profileConformance =3D sorted(
> +        list(
> +            getattr(oe.spdx30.ProfileIdentifierType, p)
> +            for p in d.getVar("SPDX_PROFILES").split()
> +        )
> +    )
> +
> +    dest.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)
> +
> +    if d.getVar("SPDX_PRETTY") =3D=3D "1":
> +        serializer =3D oe.spdx30.JSONLDSerializer(
> +            indent=3D2,
> +        )
> +    else:
> +        serializer =3D oe.spdx30.JSONLDInlineSerializer()
> +
> +    objset.objects.add(objset.doc)
> +    with dest.open("wb") as f:
> +        serializer.write(objset, f, force_at_graph=3DTrue)
> +    objset.objects.remove(objset.doc)
> +
> +
> +def write_recipe_jsonld_doc(
> +    d,
> +    objset,
> +    subdir,
> +    deploydir,
> +    *,
> +    create_spdx_id_links=3DTrue,
> +):
> +    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
> +
> +    dest =3D jsonld_arch_path(d, pkg_arch, subdir, objset.doc.name, depl=
oydir=3Ddeploydir)
> +
> +    def link_id(_id):
> +        hash_path =3D jsonld_hash_path(hash_id(_id))
> +
> +        link_name =3D jsonld_arch_path(
> +            d,
> +            pkg_arch,
> +            *hash_path,
> +            deploydir=3Ddeploydir,
> +        )
> +        try:
> +            link_name.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)
> +            link_name.symlink_to(os.path.relpath(dest, link_name.parent)=
)
> +        except:
> +            target =3D link_name.readlink()
> +            bb.warn(
> +                f"Unable to link {_id} in {dest} as {link_name}. Already=
 points to {target}"
> +            )
> +            raise
> +
> +        return hash_path[-1]
> +
> +    objset.add_aliases()
> +
> +    try:
> +        if create_spdx_id_links:
> +            alias_ext =3D get_alias(objset.doc)
> +            if alias_ext is not None and alias_ext.alias:
> +                alias_ext.link_name =3D link_id(alias_ext.alias)
> +
> +    finally:
> +        # It is really helpful for debugging if the JSON document is wri=
tten
> +        # out, so always do that even if there is an error making the li=
nks
> +        write_jsonld_doc(d, objset, dest)
> +
> +
> +def find_root_obj_in_jsonld(d, subdir, fn_name, obj_type, **attr_filter)=
:
> +    objset, fn =3D find_jsonld(d, subdir, fn_name, required=3DTrue)
> +
> +    spdx_obj =3D objset.find_root(obj_type, **attr_filter)
> +    if not spdx_obj:
> +        bb.fatal("No root %s found in %s" % (obj_type.__name__, fn))
> +
> +    return spdx_obj, objset
> +
> +
> +def load_obj_in_jsonld(d, arch, subdir, fn_name, obj_type, **attr_filter=
):
> +    objset, fn =3D load_jsonld_by_arch(d, arch, subdir, fn_name, require=
d=3DTrue)
> +
> +    spdx_obj =3D objset.find_filter(obj_type, **attr_filter)
> +    if not spdx_obj:
> +        bb.fatal("No %s found in %s" % (obj_type.__name__, fn))
> +
> +    return spdx_obj, objset
> +
> +
> +def find_by_spdxid(d, spdxid, *, required=3DFalse):
> +    if spdxid.startswith(OE_ALIAS_PREFIX):
> +        h =3D spdxid[len(OE_ALIAS_PREFIX) :].split("/", 1)[0]
> +        return find_jsonld(d, *jsonld_hash_path(h), required=3Drequired)
> +    return find_jsonld(d, *jsonld_hash_path(hash_id(spdxid)), required=
=3Drequired)
> +
> +
> +def create_sbom(d, name, root_elements, add_objectsets=3D[]):
> +    objset =3D ObjectSet.new_objset(d, name)
> +
> +    sbom =3D objset.add(
> +        oe.spdx30.software_Sbom(
> +            _id=3Dobjset.new_spdxid("sbom", name),
> +            name=3Dname,
> +            creationInfo=3Dobjset.doc.creationInfo,
> +            software_sbomType=3D[oe.spdx30.software_SbomType.build],
> +            rootElement=3Droot_elements,
> +        )
> +    )
> +
> +    missing_spdxids =3D objset.expand_collection(add_objectsets=3Dadd_ob=
jectsets)
> +    if missing_spdxids:
> +        bb.warn(
> +            "The following SPDX IDs were unable to be resolved:\n  "
> +            + "\n  ".join(sorted(list(missing_spdxids)))
> +        )
> +
> +    # Filter out internal extensions from final SBoMs
> +    objset.remove_internal_extensions()
> +
> +    # SBoM should be the only root element of the document
> +    objset.doc.rootElement =3D [sbom]
> +
> +    # De-duplicate licenses
> +    unique =3D set()
> +    dedup =3D {}
> +    for lic in objset.foreach_type(oe.spdx30.simplelicensing_LicenseExpr=
ession):
> +        for u in unique:
> +            if (
> +                u.simplelicensing_licenseExpression
> +                =3D=3D lic.simplelicensing_licenseExpression
> +                and u.simplelicensing_licenseListVersion
> +                =3D=3D lic.simplelicensing_licenseListVersion
> +            ):
> +                dedup[lic] =3D u
> +                break
> +        else:
> +            unique.add(lic)
> +
> +    if dedup:
> +        for rel in objset.foreach_filter(
> +            oe.spdx30.Relationship,
> +            relationshipType=3Doe.spdx30.RelationshipType.hasDeclaredLic=
ense,
> +        ):
> +            rel.to =3D [dedup.get(to, to) for to in rel.to]
> +
> +        for rel in objset.foreach_filter(
> +            oe.spdx30.Relationship,
> +            relationshipType=3Doe.spdx30.RelationshipType.hasConcludedLi=
cense,
> +        ):
> +            rel.to =3D [dedup.get(to, to) for to in rel.to]
> +
> +        for k, v in dedup.items():
> +            bb.debug(1, f"Removing duplicate License {k._id} -> {v._id}"=
)
> +            objset.objects.remove(k)
> +
> +        objset.create_index()
> +
> +    return objset, sbom
> diff --git a/meta/lib/oe/spdx30.py b/meta/lib/oe/spdx30.py
> new file mode 100644
> index 0000000000..cd97eebd18
> --- /dev/null
> +++ b/meta/lib/oe/spdx30.py
> @@ -0,0 +1,5593 @@
> +#! /usr/bin/env python3
> +#
> +# Generated Python bindings from a SHACL model
> +#
> +# This file was automatically generated by shacl2code. DO NOT MANUALLY M=
ODIFY IT
> +#
> +# SPDX-License-Identifier: MIT
> +
> +import functools
> +import hashlib
> +import json
> +import re
> +import sys
> +import threading
> +import time
> +from contextlib import contextmanager
> +from datetime import datetime, timezone, timedelta
> +from enum import Enum
> +from abc import ABC, abstractmethod
> +
> +
> +def check_type(obj, types):
> +    if not isinstance(obj, types):
> +        if isinstance(types, (list, tuple)):
> +            raise TypeError(
> +                f"Value must be one of type: {', '.join(t.__name__ for t=
 in types)}. Got {type(obj)}"
> +            )
> +        raise TypeError(f"Value must be of type {types.__name__}. Got {t=
ype(obj)}")
> +
> +
> +class Property(ABC):
> +    """
> +    A generic SHACL object property. The different types will derive fro=
m this
> +    class
> +    """
> +
> +    def __init__(self, *, pattern=3DNone):
> +        self.pattern =3D pattern
> +
> +    def init(self):
> +        return None
> +
> +    def validate(self, value):
> +        check_type(value, self.VALID_TYPES)
> +        if self.pattern is not None and not re.search(
> +            self.pattern, self.to_string(value)
> +        ):
> +            raise ValueError(
> +                f"Value is not correctly formatted. Got '{self.to_string=
(value)}'"
> +            )
> +
> +    def set(self, value):
> +        return value
> +
> +    def check_min_count(self, value, min_count):
> +        return min_count =3D=3D 1
> +
> +    def check_max_count(self, value, max_count):
> +        return max_count =3D=3D 1
> +
> +    def elide(self, value):
> +        return value is None
> +
> +    def walk(self, value, callback, path):
> +        callback(value, path)
> +
> +    def iter_objects(self, value, recursive, visited):
> +        return []
> +
> +    def link_prop(self, value, objectset, missing, visited):
> +        return value
> +
> +    def to_string(self, value):
> +        return str(value)
> +
> +    @abstractmethod
> +    def encode(self, encoder, value, state):
> +        pass
> +
> +    @abstractmethod
> +    def decode(self, decoder, *, objectset=3DNone):
> +        pass
> +
> +
> +class StringProp(Property):
> +    """
> +    A scalar string property for an SHACL object
> +    """
> +
> +    VALID_TYPES =3D str
> +
> +    def set(self, value):
> +        return str(value)
> +
> +    def encode(self, encoder, value, state):
> +        encoder.write_string(value)
> +
> +    def decode(self, decoder, *, objectset=3DNone):
> +        return decoder.read_string()
> +
> +
> +class AnyURIProp(StringProp):
> +    def encode(self, encoder, value, state):
> +        encoder.write_iri(value)
> +
> +    def decode(self, decoder, *, objectset=3DNone):
> +        return decoder.read_iri()
> +
> +
> +class DateTimeProp(Property):
> +    """
> +    A Date/Time Object with optional timezone
> +    """
> +
> +    VALID_TYPES =3D datetime
> +    UTC_FORMAT_STR =3D "%Y-%m-%dT%H:%M:%SZ"
> +    REGEX =3D r"^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(Z|[+-]\d{2}:\d{2})?=
$"
> +
> +    def set(self, value):
> +        return self._normalize(value)
> +
> +    def encode(self, encoder, value, state):
> +        encoder.write_datetime(self.to_string(value))
> +
> +    def decode(self, decoder, *, objectset=3DNone):
> +        s =3D decoder.read_datetime()
> +        if s is None:
> +            return None
> +        v =3D self.from_string(s)
> +        return self._normalize(v)
> +
> +    def _normalize(self, value):
> +        if value.utcoffset() is None:
> +            value =3D value.astimezone()
> +        offset =3D value.utcoffset()
> +        seconds =3D offset % timedelta(minutes=3D-1 if offset.total_seco=
nds() < 0 else 1)
> +        if seconds:
> +            offset =3D offset - seconds
> +            value =3D value.replace(tzinfo=3Dtimezone(offset))
> +        value =3D value.replace(microsecond=3D0)
> +        return value
> +
> +    def to_string(self, value):
> +        value =3D self._normalize(value)
> +        if value.tzinfo =3D=3D timezone.utc:
> +            return value.strftime(self.UTC_FORMAT_STR)
> +        return value.isoformat()
> +
> +    def from_string(self, value):
> +        if not re.match(self.REGEX, value):
> +            raise ValueError(f"'{value}' is not a correctly formatted da=
tetime")
> +        if "Z" in value:
> +            d =3D datetime(
> +                *(time.strptime(value, self.UTC_FORMAT_STR)[0:6]),
> +                tzinfo=3Dtimezone.utc,
> +            )
> +        else:
> +            d =3D datetime.fromisoformat(value)
> +
> +        return self._normalize(d)
> +
> +
> +class DateTimeStampProp(DateTimeProp):
> +    """
> +    A Date/Time Object with required timestamp
> +    """
> +
> +    REGEX =3D r"^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(Z|[+-]\d{2}:\d{2})$=
"
> +
> +
> +class IntegerProp(Property):
> +    VALID_TYPES =3D int
> +
> +    def set(self, value):
> +        return int(value)
> +
> +    def encode(self, encoder, value, state):
> +        encoder.write_integer(value)
> +
> +    def decode(self, decoder, *, objectset=3DNone):
> +        return decoder.read_integer()
> +
> +
> +class PositiveIntegerProp(IntegerProp):
> +    def validate(self, value):
> +        super().validate(value)
> +        if value < 1:
> +            raise ValueError(f"Value must be >=3D1. Got {value}")
> +
> +
> +class NonNegativeIntegerProp(IntegerProp):
> +    def validate(self, value):
> +        super().validate(value)
> +        if value < 0:
> +            raise ValueError(f"Value must be >=3D 0. Got {value}")
> +
> +
> +class BooleanProp(Property):
> +    VALID_TYPES =3D bool
> +
> +    def set(self, value):
> +        return bool(value)
> +
> +    def encode(self, encoder, value, state):
> +        encoder.write_bool(value)
> +
> +    def decode(self, decoder, *, objectset=3DNone):
> +        return decoder.read_bool()
> +
> +
> +class FloatProp(Property):
> +    VALID_TYPES =3D (float, int)
> +
> +    def set(self, value):
> +        return float(value)
> +
> +    def encode(self, encoder, value, state):
> +        encoder.write_float(value)
> +
> +    def decode(self, decoder, *, objectset=3DNone):
> +        return decoder.read_float()
> +
> +
> +class IRIProp(Property):
> +    def __init__(self, context=3D[], *, pattern=3DNone):
> +        super().__init__(pattern=3Dpattern)
> +        self.context =3D context
> +
> +    def compact(self, value):
> +        for iri, compact in self.context:
> +            if value =3D=3D iri:
> +                return compact
> +        return None
> +
> +    def expand(self, value):
> +        for iri, compact in self.context:
> +            if value =3D=3D compact:
> +                return iri
> +        return None
> +
> +    def iri_values(self):
> +        return (iri for iri, _ in self.context)
> +
> +
> +class ObjectProp(IRIProp):
> +    """
> +    A scalar SHACL object property of a SHACL object
> +    """
> +
> +    def __init__(self, cls, required, context=3D[]):
> +        super().__init__(context)
> +        self.cls =3D cls
> +        self.required =3D required
> +
> +    def init(self):
> +        if self.required and not self.cls.IS_ABSTRACT:
> +            return self.cls()
> +        return None
> +
> +    def validate(self, value):
> +        check_type(value, (self.cls, str))
> +
> +    def walk(self, value, callback, path):
> +        if value is None:
> +            return
> +
> +        if not isinstance(value, str):
> +            value.walk(callback, path)
> +        else:
> +            callback(value, path)
> +
> +    def iter_objects(self, value, recursive, visited):
> +        if value is None or isinstance(value, str):
> +            return
> +
> +        if value not in visited:
> +            visited.add(value)
> +            yield value
> +
> +            if recursive:
> +                for c in value.iter_objects(recursive=3DTrue, visited=3D=
visited):
> +                    yield c
> +
> +    def encode(self, encoder, value, state):
> +        if value is None:
> +            raise ValueError("Object cannot be None")
> +
> +        if isinstance(value, str):
> +            encoder.write_iri(value, self.compact(value))
> +            return
> +
> +        return value.encode(encoder, state)
> +
> +    def decode(self, decoder, *, objectset=3DNone):
> +        iri =3D decoder.read_iri()
> +        if iri is None:
> +            return self.cls.decode(decoder, objectset=3Dobjectset)
> +
> +        iri =3D self.expand(iri) or iri
> +
> +        if objectset is None:
> +            return iri
> +
> +        obj =3D objectset.find_by_id(iri)
> +        if obj is None:
> +            return iri
> +
> +        self.validate(obj)
> +        return obj
> +
> +    def link_prop(self, value, objectset, missing, visited):
> +        if value is None:
> +            return value
> +
> +        if isinstance(value, str):
> +            o =3D objectset.find_by_id(value)
> +            if o is not None:
> +                self.validate(o)
> +                return o
> +
> +            if missing is not None:
> +                missing.add(value)
> +
> +            return value
> +
> +        # De-duplicate IDs
> +        if value._id:
> +            value =3D objectset.find_by_id(value._id, value)
> +            self.validate(value)
> +
> +        value.link_helper(objectset, missing, visited)
> +        return value
> +
> +
> +class ListProxy(object):
> +    def __init__(self, prop, data=3DNone):
> +        if data is None:
> +            self.__data =3D []
> +        else:
> +            self.__data =3D data
> +        self.__prop =3D prop
> +
> +    def append(self, value):
> +        self.__prop.validate(value)
> +        self.__data.append(self.__prop.set(value))
> +
> +    def insert(self, idx, value):
> +        self.__prop.validate(value)
> +        self.__data.insert(idx, self.__prop.set(value))
> +
> +    def extend(self, items):
> +        for i in items:
> +            self.append(i)
> +
> +    def sort(self, *args, **kwargs):
> +        self.__data.sort(*args, **kwargs)
> +
> +    def __getitem__(self, key):
> +        return self.__data[key]
> +
> +    def __setitem__(self, key, value):
> +        if isinstance(key, slice):
> +            for v in value:
> +                self.__prop.validate(v)
> +            self.__data[key] =3D [self.__prop.set(v) for v in value]
> +        else:
> +            self.__prop.validate(value)
> +            self.__data[key] =3D self.__prop.set(value)
> +
> +    def __delitem__(self, key):
> +        del self.__data[key]
> +
> +    def __contains__(self, item):
> +        return item in self.__data
> +
> +    def __iter__(self):
> +        return iter(self.__data)
> +
> +    def __len__(self):
> +        return len(self.__data)
> +
> +    def __str__(self):
> +        return str(self.__data)
> +
> +    def __repr__(self):
> +        return repr(self.__data)
> +
> +    def __eq__(self, other):
> +        if isinstance(other, ListProxy):
> +            return self.__data =3D=3D other.__data
> +
> +        return self.__data =3D=3D other
> +
> +
> +class ListProp(Property):
> +    """
> +    A list of SHACL properties
> +    """
> +
> +    VALID_TYPES =3D (list, ListProxy)
> +
> +    def __init__(self, prop):
> +        super().__init__()
> +        self.prop =3D prop
> +
> +    def init(self):
> +        return ListProxy(self.prop)
> +
> +    def validate(self, value):
> +        super().validate(value)
> +
> +        for i in value:
> +            self.prop.validate(i)
> +
> +    def set(self, value):
> +        if isinstance(value, ListProxy):
> +            return value
> +
> +        return ListProxy(self.prop, [self.prop.set(d) for d in value])
> +
> +    def check_min_count(self, value, min_count):
> +        check_type(value, ListProxy)
> +        return len(value) >=3D min_count
> +
> +    def check_max_count(self, value, max_count):
> +        check_type(value, ListProxy)
> +        return len(value) <=3D max_count
> +
> +    def elide(self, value):
> +        check_type(value, ListProxy)
> +        return len(value) =3D=3D 0
> +
> +    def walk(self, value, callback, path):
> +        callback(value, path)
> +        for idx, v in enumerate(value):
> +            self.prop.walk(v, callback, path + [f"[{idx}]"])
> +
> +    def iter_objects(self, value, recursive, visited):
> +        for v in value:
> +            for c in self.prop.iter_objects(v, recursive, visited):
> +                yield c
> +
> +    def link_prop(self, value, objectset, missing, visited):
> +        if isinstance(value, ListProxy):
> +            data =3D [self.prop.link_prop(v, objectset, missing, visited=
) for v in value]
> +        else:
> +            data =3D [self.prop.link_prop(v, objectset, missing, visited=
) for v in value]
> +
> +        return ListProxy(self.prop, data=3Ddata)
> +
> +    def encode(self, encoder, value, state):
> +        check_type(value, ListProxy)
> +
> +        with encoder.write_list() as list_s:
> +            for v in value:
> +                with list_s.write_list_item() as item_s:
> +                    self.prop.encode(item_s, v, state)
> +
> +    def decode(self, decoder, *, objectset=3DNone):
> +        data =3D []
> +        for val_d in decoder.read_list():
> +            v =3D self.prop.decode(val_d, objectset=3Dobjectset)
> +            self.prop.validate(v)
> +            data.append(v)
> +
> +        return ListProxy(self.prop, data=3Ddata)
> +
> +
> +class EnumProp(IRIProp):
> +    VALID_TYPES =3D str
> +
> +    def __init__(self, values, *, pattern=3DNone):
> +        super().__init__(values, pattern=3Dpattern)
> +
> +    def validate(self, value):
> +        super().validate(value)
> +
> +        valid_values =3D self.iri_values()
> +        if value not in valid_values:
> +            raise ValueError(
> +                f"'{value}' is not a valid value. Choose one of {' '.joi=
n(valid_values)}"
> +            )
> +
> +    def encode(self, encoder, value, state):
> +        encoder.write_enum(value, self, self.compact(value))
> +
> +    def decode(self, decoder, *, objectset=3DNone):
> +        v =3D decoder.read_enum(self)
> +        return self.expand(v) or v
> +
> +
> +class NodeKind(Enum):
> +    BlankNode =3D 1
> +    IRI =3D 2
> +    BlankNodeOrIRI =3D 3
> +
> +
> +def is_IRI(s):
> +    if not isinstance(s, str):
> +        return False
> +    if s.startswith("_:"):
> +        return False
> +    if ":" not in s:
> +        return False
> +    return True
> +
> +
> +def is_blank_node(s):
> +    if not isinstance(s, str):
> +        return False
> +    if not s.startswith("_:"):
> +        return False
> +    return True
> +
> +
> +def register(type_iri, *, compact_type=3DNone, abstract=3DFalse):
> +    def add_class(key, c):
> +        assert (
> +            key not in SHACLObject.CLASSES
> +        ), f"{key} already registered to {SHACLObject.CLASSES[key].__nam=
e__}"
> +        SHACLObject.CLASSES[key] =3D c
> +
> +    def decorator(c):
> +        global NAMED_INDIVIDUALS
> +
> +        assert issubclass(
> +            c, SHACLObject
> +        ), f"{c.__name__} is not derived from SHACLObject"
> +
> +        c._OBJ_TYPE =3D type_iri
> +        c.IS_ABSTRACT =3D abstract
> +        add_class(type_iri, c)
> +
> +        c._OBJ_COMPACT_TYPE =3D compact_type
> +        if compact_type:
> +            add_class(compact_type, c)
> +
> +        NAMED_INDIVIDUALS |=3D set(c.NAMED_INDIVIDUALS.values())
> +
> +        # Registration is deferred until the first instance of class is =
created
> +        # so that it has access to any other defined class
> +        c._NEEDS_REG =3D True
> +        return c
> +
> +    return decorator
> +
> +
> +register_lock =3D threading.Lock()
> +NAMED_INDIVIDUALS =3D set()
> +
> +
> +@functools.total_ordering
> +class SHACLObject(object):
> +    CLASSES =3D {}
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    ID_ALIAS =3D None
> +    IS_ABSTRACT =3D True
> +
> +    def __init__(self, **kwargs):
> +        if self._is_abstract():
> +            raise NotImplementedError(
> +                f"{self.__class__.__name__} is abstract and cannot be im=
plemented"
> +            )
> +
> +        with register_lock:
> +            cls =3D self.__class__
> +            if cls._NEEDS_REG:
> +                cls._OBJ_PROPERTIES =3D {}
> +                cls._OBJ_IRIS =3D {}
> +                cls._register_props()
> +                cls._NEEDS_REG =3D False
> +
> +        self.__dict__["_obj_data"] =3D {}
> +        self.__dict__["_obj_metadata"] =3D {}
> +
> +        for iri, prop, _, _, _, _ in self.__iter_props():
> +            self.__dict__["_obj_data"][iri] =3D prop.init()
> +
> +        for k, v in kwargs.items():
> +            setattr(self, k, v)
> +
> +    def _is_abstract(self):
> +        return self.__class__.IS_ABSTRACT
> +
> +    @classmethod
> +    def _register_props(cls):
> +        cls._add_property("_id", StringProp(), iri=3D"@id")
> +
> +    @classmethod
> +    def _add_property(
> +        cls,
> +        pyname,
> +        prop,
> +        iri,
> +        min_count=3DNone,
> +        max_count=3DNone,
> +        compact=3DNone,
> +    ):
> +        if pyname in cls._OBJ_IRIS:
> +            raise KeyError(f"'{pyname}' is already defined for '{cls.__n=
ame__}'")
> +        if iri in cls._OBJ_PROPERTIES:
> +            raise KeyError(f"'{iri}' is already defined for '{cls.__name=
__}'")
> +
> +        while hasattr(cls, pyname):
> +            pyname =3D pyname + "_"
> +
> +        pyname =3D sys.intern(pyname)
> +        iri =3D sys.intern(iri)
> +
> +        cls._OBJ_IRIS[pyname] =3D iri
> +        cls._OBJ_PROPERTIES[iri] =3D (prop, min_count, max_count, pyname=
, compact)
> +
> +    def __setattr__(self, name, value):
> +        if name =3D=3D self.ID_ALIAS:
> +            self["@id"] =3D value
> +            return
> +
> +        try:
> +            iri =3D self._OBJ_IRIS[name]
> +            self[iri] =3D value
> +        except KeyError:
> +            raise AttributeError(
> +                f"'{name}' is not a valid property of {self.__class__.__=
name__}"
> +            )
> +
> +    def __getattr__(self, name):
> +        if name in self._OBJ_IRIS:
> +            return self.__dict__["_obj_data"][self._OBJ_IRIS[name]]
> +
> +        if name =3D=3D self.ID_ALIAS:
> +            return self.__dict__["_obj_data"]["@id"]
> +
> +        if name =3D=3D "_metadata":
> +            return self.__dict__["_obj_metadata"]
> +
> +        if name =3D=3D "_IRI":
> +            return self._OBJ_IRIS
> +
> +        if name =3D=3D "TYPE":
> +            return self.__class__._OBJ_TYPE
> +
> +        if name =3D=3D "COMPACT_TYPE":
> +            return self.__class__._OBJ_COMPACT_TYPE
> +
> +        raise AttributeError(
> +            f"'{name}' is not a valid property of {self.__class__.__name=
__}"
> +        )
> +
> +    def __delattr__(self, name):
> +        if name =3D=3D self.ID_ALIAS:
> +            del self["@id"]
> +            return
> +
> +        try:
> +            iri =3D self._OBJ_IRIS[name]
> +            del self[iri]
> +        except KeyError:
> +            raise AttributeError(
> +                f"'{name}' is not a valid property of {self.__class__.__=
name__}"
> +            )
> +
> +    def __get_prop(self, iri):
> +        if iri not in self._OBJ_PROPERTIES:
> +            raise KeyError(
> +                f"'{iri}' is not a valid property of {self.__class__.__n=
ame__}"
> +            )
> +
> +        return self._OBJ_PROPERTIES[iri]
> +
> +    def __iter_props(self):
> +        for iri, v in self._OBJ_PROPERTIES.items():
> +            yield iri, *v
> +
> +    def __getitem__(self, iri):
> +        return self.__dict__["_obj_data"][iri]
> +
> +    def __setitem__(self, iri, value):
> +        if iri =3D=3D "@id":
> +            if self.NODE_KIND =3D=3D NodeKind.BlankNode:
> +                if not is_blank_node(value):
> +                    raise ValueError(
> +                        f"{self.__class__.__name__} ({id(self)}) can onl=
y have local reference. Property '{iri}' cannot be set to '{value}' and mus=
t start with '_:'"
> +                    )
> +            elif self.NODE_KIND =3D=3D NodeKind.IRI:
> +                if not is_IRI(value):
> +                    raise ValueError(
> +                        f"{self.__class__.__name__} ({id(self)}) can onl=
y have an IRI value. Property '{iri}' cannot be set to '{value}'"
> +                    )
> +            else:
> +                if not is_blank_node(value) and not is_IRI(value):
> +                    raise ValueError(
> +                        f"{self.__class__.__name__} ({id(self)}) Has inv=
alid Property '{iri}' '{value}'. Must be a blank node or IRI"
> +                    )
> +
> +        prop, _, _, _, _ =3D self.__get_prop(iri)
> +        prop.validate(value)
> +        self.__dict__["_obj_data"][iri] =3D prop.set(value)
> +
> +    def __delitem__(self, iri):
> +        prop, _, _, _, _ =3D self.__get_prop(iri)
> +        self.__dict__["_obj_data"][iri] =3D prop.init()
> +
> +    def __iter__(self):
> +        return self._OBJ_PROPERTIES.keys()
> +
> +    def walk(self, callback, path=3DNone):
> +        """
> +        Walk object tree, invoking the callback for each item
> +
> +        Callback has the form:
> +
> +        def callback(object, path):
> +        """
> +        if path is None:
> +            path =3D ["."]
> +
> +        if callback(self, path):
> +            for iri, prop, _, _, _, _ in self.__iter_props():
> +                prop.walk(self.__dict__["_obj_data"][iri], callback, pat=
h + [f".{iri}"])
> +
> +    def property_keys(self):
> +        for iri, _, _, _, pyname, compact in self.__iter_props():
> +            if iri =3D=3D "@id":
> +                compact =3D self.ID_ALIAS
> +            yield pyname, iri, compact
> +
> +    def iter_objects(self, *, recursive=3DFalse, visited=3DNone):
> +        """
> +        Iterate of all objects that are a child of this one
> +        """
> +        if visited is None:
> +            visited =3D set()
> +
> +        for iri, prop, _, _, _, _ in self.__iter_props():
> +            for c in prop.iter_objects(
> +                self.__dict__["_obj_data"][iri], recursive=3Drecursive, =
visited=3Dvisited
> +            ):
> +                yield c
> +
> +    def encode(self, encoder, state):
> +        idname =3D self.ID_ALIAS or self._OBJ_IRIS["_id"]
> +        if not self._id and self.NODE_KIND =3D=3D NodeKind.IRI:
> +            raise ValueError(
> +                f"{self.__class__.__name__} ({id(self)}) must have a IRI=
 for property '{idname}'"
> +            )
> +
> +        if state.is_written(self):
> +            encoder.write_iri(state.get_object_id(self))
> +            return
> +
> +        state.add_written(self)
> +
> +        with encoder.write_object(
> +            self,
> +            state.get_object_id(self),
> +            bool(self._id) or state.is_refed(self),
> +        ) as obj_s:
> +            self._encode_properties(obj_s, state)
> +
> +    def _encode_properties(self, encoder, state):
> +        for iri, prop, min_count, max_count, pyname, compact in self.__i=
ter_props():
> +            value =3D self.__dict__["_obj_data"][iri]
> +            if prop.elide(value):
> +                if min_count:
> +                    raise ValueError(
> +                        f"Property '{pyname}' in {self.__class__.__name_=
_} ({id(self)}) is required (currently {value!r})"
> +                    )
> +                continue
> +
> +            if min_count is not None:
> +                if not prop.check_min_count(value, min_count):
> +                    raise ValueError(
> +                        f"Property '{pyname}' in {self.__class__.__name_=
_} ({id(self)}) requires a minimum of {min_count} elements"
> +                    )
> +
> +            if max_count is not None:
> +                if not prop.check_max_count(value, max_count):
> +                    raise ValueError(
> +                        f"Property '{pyname}' in {self.__class__.__name_=
_} ({id(self)}) requires a maximum of {max_count} elements"
> +                    )
> +
> +            if iri =3D=3D self._OBJ_IRIS["_id"]:
> +                continue
> +
> +            with encoder.write_property(iri, compact) as prop_s:
> +                prop.encode(prop_s, value, state)
> +
> +    @classmethod
> +    def _make_object(cls, typ):
> +        if typ not in cls.CLASSES:
> +            raise TypeError(f"Unknown type {typ}")
> +
> +        return cls.CLASSES[typ]()
> +
> +    @classmethod
> +    def decode(cls, decoder, *, objectset=3DNone):
> +        typ, obj_d =3D decoder.read_object()
> +        if typ is None:
> +            raise TypeError("Unable to determine type for object")
> +
> +        obj =3D cls._make_object(typ)
> +        for key in (obj.ID_ALIAS, obj._OBJ_IRIS["_id"]):
> +            with obj_d.read_property(key) as prop_d:
> +                if prop_d is None:
> +                    continue
> +
> +                _id =3D prop_d.read_iri()
> +                if _id is None:
> +                    raise TypeError(f"Object key '{key}' is the wrong ty=
pe")
> +
> +                obj._id =3D _id
> +                break
> +
> +        if obj.NODE_KIND =3D=3D NodeKind.IRI and not obj._id:
> +            raise ValueError("Object is missing required IRI")
> +
> +        if objectset is not None:
> +            if obj._id:
> +                v =3D objectset.find_by_id(_id)
> +                if v is not None:
> +                    return v
> +
> +        obj._decode_properties(obj_d, objectset=3Dobjectset)
> +
> +        if objectset is not None:
> +            objectset.add_index(obj)
> +        return obj
> +
> +    def _decode_properties(self, decoder, objectset=3DNone):
> +        for key in decoder.object_keys():
> +            if not self._decode_prop(decoder, key, objectset=3Dobjectset=
):
> +                raise KeyError(f"Unknown property '{key}'")
> +
> +    def _decode_prop(self, decoder, key, objectset=3DNone):
> +        if key in (self._OBJ_IRIS["_id"], self.ID_ALIAS):
> +            return True
> +
> +        for iri, prop, _, _, _, compact in self.__iter_props():
> +            if compact =3D=3D key:
> +                read_key =3D compact
> +            elif iri =3D=3D key:
> +                read_key =3D iri
> +            else:
> +                continue
> +
> +            with decoder.read_property(read_key) as prop_d:
> +                v =3D prop.decode(prop_d, objectset=3Dobjectset)
> +                prop.validate(v)
> +                self.__dict__["_obj_data"][iri] =3D v
> +            return True
> +
> +        return False
> +
> +    def link_helper(self, objectset, missing, visited):
> +        if self in visited:
> +            return
> +
> +        visited.add(self)
> +
> +        for iri, prop, _, _, _, _ in self.__iter_props():
> +            self.__dict__["_obj_data"][iri] =3D prop.link_prop(
> +                self.__dict__["_obj_data"][iri],
> +                objectset,
> +                missing,
> +                visited,
> +            )
> +
> +    def __str__(self):
> +        parts =3D [
> +            f"{self.__class__.__name__}(",
> +        ]
> +        if self._id:
> +            parts.append(f"@id=3D'{self._id}'")
> +        parts.append(")")
> +        return "".join(parts)
> +
> +    def __hash__(self):
> +        return super().__hash__()
> +
> +    def __eq__(self, other):
> +        return super().__eq__(other)
> +
> +    def __lt__(self, other):
> +        def sort_key(obj):
> +            if isinstance(obj, str):
> +                return (obj, "", "", "")
> +            return (
> +                obj._id or "",
> +                obj.TYPE,
> +                getattr(obj, "name", None) or "",
> +                id(obj),
> +            )
> +
> +        return sort_key(self) < sort_key(other)
> +
> +
> +class SHACLExtensibleObject(object):
> +    CLOSED =3D False
> +
> +    def __init__(self, typ=3DNone, **kwargs):
> +        if typ:
> +            self.__dict__["_obj_TYPE"] =3D (typ, None)
> +        else:
> +            self.__dict__["_obj_TYPE"] =3D (self._OBJ_TYPE, self._OBJ_CO=
MPACT_TYPE)
> +        super().__init__(**kwargs)
> +
> +    def _is_abstract(self):
> +        # Unknown classes are assumed to not be abstract so that they ca=
n be
> +        # deserialized
> +        typ =3D self.__dict__["_obj_TYPE"][0]
> +        if typ in self.__class__.CLASSES:
> +            return self.__class__.CLASSES[typ].IS_ABSTRACT
> +
> +        return False
> +
> +    @classmethod
> +    def _make_object(cls, typ):
> +        # Check for a known type, and if so, deserialize as that instead
> +        if typ in cls.CLASSES:
> +            return cls.CLASSES[typ]()
> +
> +        obj =3D cls(typ)
> +        return obj
> +
> +    def _decode_properties(self, decoder, objectset=3DNone):
> +        def decode_value(d):
> +            if not d.is_list():
> +                return d.read_value()
> +
> +            return [decode_value(val_d) for val_d in d.read_list()]
> +
> +        if self.CLOSED:
> +            super()._decode_properties(decoder, objectset=3Dobjectset)
> +            return
> +
> +        for key in decoder.object_keys():
> +            if self._decode_prop(decoder, key, objectset=3Dobjectset):
> +                continue
> +
> +            if not is_IRI(key):
> +                raise KeyError(
> +                    f"Extensible object properties must be IRIs. Got '{k=
ey}'"
> +                )
> +
> +            with decoder.read_property(key) as prop_d:
> +                self.__dict__["_obj_data"][key] =3D decode_value(prop_d)
> +
> +    def _encode_properties(self, encoder, state):
> +        def encode_value(encoder, v):
> +            if isinstance(v, bool):
> +                encoder.write_bool(v)
> +            elif isinstance(v, str):
> +                encoder.write_string(v)
> +            elif isinstance(v, int):
> +                encoder.write_integer(v)
> +            elif isinstance(v, float):
> +                encoder.write_float(v)
> +            elif isinstance(v, list):
> +                with encoder.write_list() as list_s:
> +                    for i in v:
> +                        with list_s.write_list_item() as item_s:
> +                            encode_value(item_s, i)
> +            else:
> +                raise TypeError(
> +                    f"Unsupported serialized type {type(v)} with value '=
{v}'"
> +                )
> +
> +        super()._encode_properties(encoder, state)
> +        if self.CLOSED:
> +            return
> +
> +        for iri, value in self.__dict__["_obj_data"].items():
> +            if iri in self._OBJ_PROPERTIES:
> +                continue
> +
> +            with encoder.write_property(iri) as prop_s:
> +                encode_value(prop_s, value)
> +
> +    def __setitem__(self, iri, value):
> +        try:
> +            super().__setitem__(iri, value)
> +        except KeyError:
> +            if self.CLOSED:
> +                raise
> +
> +            if not is_IRI(iri):
> +                raise KeyError(f"Key '{iri}' must be an IRI")
> +            self.__dict__["_obj_data"][iri] =3D value
> +
> +    def __delitem__(self, iri):
> +        try:
> +            super().__delitem__(iri)
> +        except KeyError:
> +            if self.CLOSED:
> +                raise
> +
> +            if not is_IRI(iri):
> +                raise KeyError(f"Key '{iri}' must be an IRI")
> +            del self.__dict__["_obj_data"][iri]
> +
> +    def __getattr__(self, name):
> +        if name =3D=3D "TYPE":
> +            return self.__dict__["_obj_TYPE"][0]
> +        if name =3D=3D "COMPACT_TYPE":
> +            return self.__dict__["_obj_TYPE"][1]
> +        return super().__getattr__(name)
> +
> +    def property_keys(self):
> +        iris =3D set()
> +        for pyname, iri, compact in super().property_keys():
> +            iris.add(iri)
> +            yield pyname, iri, compact
> +
> +        if self.CLOSED:
> +            return
> +
> +        for iri in self.__dict__["_obj_data"].keys():
> +            if iri not in iris:
> +                yield None, iri, None
> +
> +
> +class SHACLObjectSet(object):
> +    def __init__(self, objects=3D[], *, link=3DFalse):
> +        self.objects =3D set()
> +        self.missing_ids =3D set()
> +        for o in objects:
> +            self.objects.add(o)
> +        self.create_index()
> +        if link:
> +            self._link()
> +
> +    def create_index(self):
> +        """
> +        (re)Create object index
> +
> +        Creates or recreates the indices for the object set to enable fa=
st
> +        lookup. All objects and their children are walked and indexed
> +        """
> +        self.obj_by_id =3D {}
> +        self.obj_by_type =3D {}
> +        for o in self.foreach():
> +            self.add_index(o)
> +
> +    def add_index(self, obj):
> +        """
> +        Add object to index
> +
> +        Adds the object to all appropriate indices
> +        """
> +
> +        def reg_type(typ, compact, o, exact):
> +            self.obj_by_type.setdefault(typ, set()).add((exact, o))
> +            if compact:
> +                self.obj_by_type.setdefault(compact, set()).add((exact, =
o))
> +
> +        if not isinstance(obj, SHACLObject):
> +            raise TypeError("Object is not of type SHACLObject")
> +
> +        for typ in SHACLObject.CLASSES.values():
> +            if isinstance(obj, typ):
> +                reg_type(
> +                    typ._OBJ_TYPE, typ._OBJ_COMPACT_TYPE, obj, obj.__cla=
ss__ is typ
> +                )
> +
> +        # This covers custom extensions
> +        reg_type(obj.TYPE, obj.COMPACT_TYPE, obj, True)
> +
> +        if not obj._id:
> +            return
> +
> +        self.missing_ids.discard(obj._id)
> +
> +        if obj._id in self.obj_by_id:
> +            return
> +
> +        self.obj_by_id[obj._id] =3D obj
> +
> +    def add(self, obj):
> +        """
> +        Add object to object set
> +
> +        Adds a SHACLObject to the object set and index it.
> +
> +        NOTE: Child objects of the attached object are not indexes
> +        """
> +        if not isinstance(obj, SHACLObject):
> +            raise TypeError("Object is not of type SHACLObject")
> +
> +        if obj not in self.objects:
> +            self.objects.add(obj)
> +            self.add_index(obj)
> +        return obj
> +
> +    def update(self, *others):
> +        """
> +        Update object set adding all objects in each other iterable
> +        """
> +        for o in others:
> +            for obj in o:
> +                self.add(obj)
> +
> +    def __contains__(self, item):
> +        """
> +        Returns True if the item is in the object set
> +        """
> +        return item in self.objects
> +
> +    def link(self):
> +        """
> +        Link object set
> +
> +        Links the object in the object set by replacing string object
> +        references with references to the objects themselves. e.g.
> +        a property that references object "https://foo/bar" by a string
> +        reference will be replaced with an actual reference to the objec=
t in
> +        the object set with the same ID if it exists in the object set
> +
> +        If multiple objects with the same ID are found, the duplicates a=
re
> +        eliminated
> +        """
> +        self.create_index()
> +        return self._link()
> +
> +    def _link(self):
> +        global NAMED_INDIVIDUALS
> +
> +        self.missing_ids =3D set()
> +        visited =3D set()
> +
> +        new_objects =3D set()
> +
> +        for o in self.objects:
> +            if o._id:
> +                o =3D self.find_by_id(o._id, o)
> +            o.link_helper(self, self.missing_ids, visited)
> +            new_objects.add(o)
> +
> +        self.objects =3D new_objects
> +
> +        # Remove blank nodes
> +        obj_by_id =3D {}
> +        for _id, obj in self.obj_by_id.items():
> +            if _id.startswith("_:"):
> +                del obj._id
> +            else:
> +                obj_by_id[_id] =3D obj
> +        self.obj_by_id =3D obj_by_id
> +
> +        # Named individuals aren't considered missing
> +        self.missing_ids -=3D NAMED_INDIVIDUALS
> +
> +        return self.missing_ids
> +
> +    def find_by_id(self, _id, default=3DNone):
> +        """
> +        Find object by ID
> +
> +        Returns objects that match the specified ID, or default if there=
 is no
> +        object with the specified ID
> +        """
> +        if _id not in self.obj_by_id:
> +            return default
> +        return self.obj_by_id[_id]
> +
> +    def foreach(self):
> +        """
> +        Iterate over every object in the object set, and all child objec=
ts
> +        """
> +        visited =3D set()
> +        for o in self.objects:
> +            if o not in visited:
> +                yield o
> +                visited.add(o)
> +
> +            for child in o.iter_objects(recursive=3DTrue, visited=3Dvisi=
ted):
> +                yield child
> +
> +    def foreach_type(self, typ, *, match_subclass=3DTrue):
> +        """
> +        Iterate over each object of a specified type (or subclass there =
of)
> +
> +        If match_subclass is True, and class derived from typ will also =
match
> +        (similar to isinstance()). If False, only exact matches will be
> +        returned
> +        """
> +        if not isinstance(typ, str):
> +            if not issubclass(typ, SHACLObject):
> +                raise TypeError(f"Type must be derived from SHACLObject,=
 got {typ}")
> +            typ =3D typ._OBJ_TYPE
> +
> +        if typ not in self.obj_by_type:
> +            return
> +
> +        for exact, o in self.obj_by_type[typ]:
> +            if match_subclass or exact:
> +                yield o
> +
> +    def merge(self, *objectsets):
> +        """
> +        Merge object sets
> +
> +        Returns a new object set that is the combination of this object =
set and
> +        all provided arguments
> +        """
> +        new_objects =3D set()
> +        new_objects |=3D self.objects
> +        for d in objectsets:
> +            new_objects |=3D d.objects
> +
> +        return SHACLObjectSet(new_objects, link=3DTrue)
> +
> +    def encode(self, encoder, force_list=3DFalse, *, key=3DNone):
> +        """
> +        Serialize a list of objects to a serialization encoder
> +
> +        If force_list is true, a list will always be written using the e=
ncoder.
> +        """
> +        ref_counts =3D {}
> +        state =3D EncodeState()
> +
> +        def walk_callback(value, path):
> +            nonlocal state
> +            nonlocal ref_counts
> +
> +            if not isinstance(value, SHACLObject):
> +                return True
> +
> +            # Remove blank node ID for re-assignment
> +            if value._id and value._id.startswith("_:"):
> +                del value._id
> +
> +            if value._id:
> +                state.add_refed(value)
> +
> +            # If the object is referenced more than once, add it to the =
set of
> +            # referenced objects
> +            ref_counts.setdefault(value, 0)
> +            ref_counts[value] +=3D 1
> +            if ref_counts[value] > 1:
> +                state.add_refed(value)
> +                return False
> +
> +            return True
> +
> +        for o in self.objects:
> +            if o._id:
> +                state.add_refed(o)
> +            o.walk(walk_callback)
> +
> +        use_list =3D force_list or len(self.objects) > 1
> +
> +        if use_list:
> +            # If we are making a list add all the objects referred to by=
 reference
> +            # to the list
> +            objects =3D list(self.objects | state.ref_objects)
> +        else:
> +            objects =3D list(self.objects)
> +
> +        objects.sort(key=3Dkey)
> +
> +        if use_list:
> +            # Ensure top level objects are only written in the top level=
 graph
> +            # node, and referenced by ID everywhere else. This is done b=
y setting
> +            # the flag that indicates this object has been written for a=
ll the top
> +            # level objects, then clearing it right before serializing t=
he object.
> +            #
> +            # In this way, if an object is referenced before it is suppo=
sed to be
> +            # serialized into the @graph, it will serialize as a string =
instead of
> +            # the actual object
> +            for o in objects:
> +                state.written_objects.add(o)
> +
> +            with encoder.write_list() as list_s:
> +                for o in objects:
> +                    # Allow this specific object to be written now
> +                    state.written_objects.remove(o)
> +                    with list_s.write_list_item() as item_s:
> +                        o.encode(item_s, state)
> +
> +        elif objects:
> +            objects[0].encode(encoder, state)
> +
> +    def decode(self, decoder):
> +        self.create_index()
> +
> +        for obj_d in decoder.read_list():
> +            o =3D SHACLObject.decode(obj_d, objectset=3Dself)
> +            self.objects.add(o)
> +
> +        self._link()
> +
> +
> +class EncodeState(object):
> +    def __init__(self):
> +        self.ref_objects =3D set()
> +        self.written_objects =3D set()
> +        self.blank_objects =3D {}
> +
> +    def get_object_id(self, o):
> +        if o._id:
> +            return o._id
> +
> +        if o not in self.blank_objects:
> +            _id =3D f"_:{o.__class__.__name__}{len(self.blank_objects)}"
> +            self.blank_objects[o] =3D _id
> +
> +        return self.blank_objects[o]
> +
> +    def is_refed(self, o):
> +        return o in self.ref_objects
> +
> +    def add_refed(self, o):
> +        self.ref_objects.add(o)
> +
> +    def is_written(self, o):
> +        return o in self.written_objects
> +
> +    def add_written(self, o):
> +        self.written_objects.add(o)
> +
> +
> +class Decoder(ABC):
> +    @abstractmethod
> +    def read_value(self):
> +        """
> +        Consume next item
> +
> +        Consumes the next item of any type
> +        """
> +        pass
> +
> +    @abstractmethod
> +    def read_string(self):
> +        """
> +        Consume the next item as a string.
> +
> +        Returns the string value of the next item, or `None` if the next=
 item
> +        is not a string
> +        """
> +        pass
> +
> +    @abstractmethod
> +    def read_datetime(self):
> +        """
> +        Consumes the next item as a date & time string
> +
> +        Returns the string value of the next item, if it is a ISO dateti=
me, or
> +        `None` if the next item is not a ISO datetime string.
> +
> +        Note that validation of the string is done by the caller, so a m=
inimal
> +        implementation can just check if the next item is a string witho=
ut
> +        worrying about the format
> +        """
> +        pass
> +
> +    @abstractmethod
> +    def read_integer(self):
> +        """
> +        Consumes the next item as an integer
> +
> +        Returns the integer value of the next item, or `None` if the nex=
t item
> +        is not an integer
> +        """
> +        pass
> +
> +    @abstractmethod
> +    def read_iri(self):
> +        """
> +        Consumes the next item as an IRI string
> +
> +        Returns the string value of the next item an IRI, or `None` if t=
he next
> +        item is not an IRI.
> +
> +        The returned string should be either a fully-qualified IRI, or a=
 blank
> +        node ID
> +        """
> +        pass
> +
> +    @abstractmethod
> +    def read_enum(self, e):
> +        """
> +        Consumes the next item as an Enum value string
> +
> +        Returns the fully qualified IRI of the next enum item, or `None`=
 if the
> +        next item is not an enum value.
> +
> +        The callee is responsible for validating that the returned IRI i=
s
> +        actually a member of the specified Enum, so the `Decoder` does n=
ot need
> +        to check that, but can if it wishes
> +        """
> +        pass
> +
> +    @abstractmethod
> +    def read_bool(self):
> +        """
> +        Consume the next item as a boolean value
> +
> +        Returns the boolean value of the next item, or `None` if the nex=
t item
> +        is not a boolean
> +        """
> +        pass
> +
> +    @abstractmethod
> +    def read_float(self):
> +        """
> +        Consume the next item as a float value
> +
> +        Returns the float value of the next item, or `None` if the next =
item is
> +        not a float
> +        """
> +        pass
> +
> +    @abstractmethod
> +    def read_list(self):
> +        """
> +        Consume the next item as a list generator
> +
> +        This should generate a `Decoder` object for each item in the lis=
t. The
> +        generated `Decoder` can be used to read the corresponding item f=
rom the
> +        list
> +        """
> +        pass
> +
> +    @abstractmethod
> +    def is_list(self):
> +        """
> +        Checks if the next item is a list
> +
> +        Returns True if the next item is a list, or False if it is a sca=
lar
> +        """
> +        pass
> +
> +    @abstractmethod
> +    def read_object(self):
> +        """
> +        Consume next item as an object
> +
> +        A context manager that "enters" the next item as a object and yi=
elds a
> +        `Decoder` that can read properties from it. If the next item is =
not an
> +        object, yields `None`
> +
> +        Properties will be read out of the object using `read_property` =
and
> +        `read_object_id`
> +        """
> +        pass
> +
> +    @abstractmethod
> +    @contextmanager
> +    def read_property(self, key):
> +        """
> +        Read property from object
> +
> +        A context manager that yields a `Decoder` that can be used to re=
ad the
> +        value of the property with the given key in current object, or `=
None`
> +        if the property does not exist in the current object.
> +        """
> +        pass
> +
> +    @abstractmethod
> +    def object_keys(self):
> +        """
> +        Read property keys from an object
> +
> +        Iterates over all the serialized keys for the current object
> +        """
> +        pass
> +
> +    @abstractmethod
> +    def read_object_id(self, alias=3DNone):
> +        """
> +        Read current object ID property
> +
> +        Returns the ID of the current object if one is defined, or `None=
` if
> +        the current object has no ID.
> +
> +        The ID must be a fully qualified IRI or a blank node
> +
> +        If `alias` is provided, is is a hint as to another name by which=
 the ID
> +        might be found, if the `Decoder` supports aliases for an ID
> +        """
> +        pass
> +
> +
> +class JSONLDDecoder(Decoder):
> +    def __init__(self, data, root=3DFalse):
> +        self.data =3D data
> +        self.root =3D root
> +
> +    def read_value(self):
> +        if isinstance(self.data, str):
> +            try:
> +                return float(self.data)
> +            except ValueError:
> +                pass
> +        return self.data
> +
> +    def read_string(self):
> +        if isinstance(self.data, str):
> +            return self.data
> +        return None
> +
> +    def read_datetime(self):
> +        return self.read_string()
> +
> +    def read_integer(self):
> +        if isinstance(self.data, int):
> +            return self.data
> +        return None
> +
> +    def read_bool(self):
> +        if isinstance(self.data, bool):
> +            return self.data
> +        return None
> +
> +    def read_float(self):
> +        if isinstance(self.data, (int, float, str)):
> +            return float(self.data)
> +        return None
> +
> +    def read_iri(self):
> +        if isinstance(self.data, str):
> +            return self.data
> +        return None
> +
> +    def read_enum(self, e):
> +        if isinstance(self.data, str):
> +            return self.data
> +        return None
> +
> +    def read_list(self):
> +        if self.is_list():
> +            for v in self.data:
> +                yield self.__class__(v)
> +        else:
> +            yield self
> +
> +    def is_list(self):
> +        return isinstance(self.data, (list, tuple, set))
> +
> +    def __get_value(self, *keys):
> +        for k in keys:
> +            if k and k in self.data:
> +                return self.data[k]
> +        return None
> +
> +    @contextmanager
> +    def read_property(self, key):
> +        v =3D self.__get_value(key)
> +        if v is not None:
> +            yield self.__class__(v)
> +        else:
> +            yield None
> +
> +    def object_keys(self):
> +        for key in self.data.keys():
> +            if key in ("@type", "type"):
> +                continue
> +            if self.root and key =3D=3D "@context":
> +                continue
> +            yield key
> +
> +    def read_object(self):
> +        typ =3D self.__get_value("@type", "type")
> +        if typ is not None:
> +            return typ, self
> +
> +        return None, self
> +
> +    def read_object_id(self, alias=3DNone):
> +        return self.__get_value(alias, "@id")
> +
> +
> +class JSONLDDeserializer(object):
> +    def deserialize_data(self, data, objectset: SHACLObjectSet):
> +        if "@graph" in data:
> +            h =3D JSONLDDecoder(data["@graph"], True)
> +        else:
> +            h =3D JSONLDDecoder(data, True)
> +
> +        objectset.decode(h)
> +
> +    def read(self, f, objectset: SHACLObjectSet):
> +        data =3D json.load(f)
> +        self.deserialize_data(data, objectset)
> +
> +
> +class Encoder(ABC):
> +    @abstractmethod
> +    def write_string(self, v):
> +        """
> +        Write a string value
> +
> +        Encodes the value as a string in the output
> +        """
> +        pass
> +
> +    @abstractmethod
> +    def write_datetime(self, v):
> +        """
> +        Write a date & time string
> +
> +        Encodes the value as an ISO datetime string
> +
> +        Note: The provided string is already correctly encoded as an ISO=
 datetime
> +        """
> +        pass
> +
> +    @abstractmethod
> +    def write_integer(self, v):
> +        """
> +        Write an integer value
> +
> +        Encodes the value as an integer in the output
> +        """
> +        pass
> +
> +    @abstractmethod
> +    def write_iri(self, v, compact=3DNone):
> +        """
> +        Write IRI
> +
> +        Encodes the string as an IRI. Note that the string will be eithe=
r a
> +        fully qualified IRI or a blank node ID. If `compact` is provided=
 and
> +        the serialization supports compacted IRIs, it should be preferre=
d to
> +        the full IRI
> +        """
> +        pass
> +
> +    @abstractmethod
> +    def write_enum(self, v, e, compact=3DNone):
> +        """
> +        Write enum value IRI
> +
> +        Encodes the string enum value IRI. Note that the string will be =
a fully
> +        qualified IRI. If `compact` is provided and the serialization su=
pports
> +        compacted IRIs, it should be preferred to the full IRI.
> +        """
> +        pass
> +
> +    @abstractmethod
> +    def write_bool(self, v):
> +        """
> +        Write boolean
> +
> +        Encodes the value as a boolean in the output
> +        """
> +        pass
> +
> +    @abstractmethod
> +    def write_float(self, v):
> +        """
> +        Write float
> +
> +        Encodes the value as a floating point number in the output
> +        """
> +        pass
> +
> +    @abstractmethod
> +    @contextmanager
> +    def write_object(self, o, _id, needs_id):
> +        """
> +        Write object
> +
> +        A context manager that yields an `Encoder` that can be used to e=
ncode
> +        the given object properties.
> +
> +        The provided ID will always be a valid ID (even if o._id is `Non=
e`), in
> +        case the `Encoder` _must_ have an ID. `needs_id` is a hint to in=
dicate
> +        to the `Encoder` if an ID must be written or not (if that is eve=
n an
> +        option). If it is `True`, the `Encoder` must encode an ID for th=
e
> +        object. If `False`, the encoder is not required to encode an ID =
and may
> +        omit it.
> +
> +        The ID will be either a fully qualified IRI, or a blank node IRI=
.
> +
> +        Properties will be written the object using `write_property`
> +        """
> +        pass
> +
> +    @abstractmethod
> +    @contextmanager
> +    def write_property(self, iri, compact=3DNone):
> +        """
> +        Write object property
> +
> +        A context manager that yields an `Encoder` that can be used to e=
ncode
> +        the value for the property with the given IRI in the current obj=
ect
> +
> +        Note that the IRI will be fully qualified. If `compact` is provi=
ded and
> +        the serialization supports compacted IRIs, it should be preferre=
d to
> +        the full IRI.
> +        """
> +        pass
> +
> +    @abstractmethod
> +    @contextmanager
> +    def write_list(self):
> +        """
> +        Write list
> +
> +        A context manager that yields an `Encoder` that can be used to e=
ncode a
> +        list.
> +
> +        Each item of the list will be added using `write_list_item`
> +        """
> +        pass
> +
> +    @abstractmethod
> +    @contextmanager
> +    def write_list_item(self):
> +        """
> +        Write list item
> +
> +        A context manager that yields an `Encoder` that can be used to e=
ncode
> +        the value for a list item
> +        """
> +        pass
> +
> +
> +class JSONLDEncoder(Encoder):
> +    def __init__(self, data=3DNone):
> +        self.data =3D data
> +
> +    def write_string(self, v):
> +        self.data =3D v
> +
> +    def write_datetime(self, v):
> +        self.data =3D v
> +
> +    def write_integer(self, v):
> +        self.data =3D v
> +
> +    def write_iri(self, v, compact=3DNone):
> +        self.write_string(compact or v)
> +
> +    def write_enum(self, v, e, compact=3DNone):
> +        self.write_string(compact or v)
> +
> +    def write_bool(self, v):
> +        self.data =3D v
> +
> +    def write_float(self, v):
> +        self.data =3D str(v)
> +
> +    @contextmanager
> +    def write_property(self, iri, compact=3DNone):
> +        s =3D self.__class__(None)
> +        yield s
> +        if s.data is not None:
> +            self.data[compact or iri] =3D s.data
> +
> +    @contextmanager
> +    def write_object(self, o, _id, needs_id):
> +        self.data =3D {
> +            "type": o.COMPACT_TYPE or o.TYPE,
> +        }
> +        if needs_id:
> +            self.data[o.ID_ALIAS or "@id"] =3D _id
> +        yield self
> +
> +    @contextmanager
> +    def write_list(self):
> +        self.data =3D []
> +        yield self
> +        if not self.data:
> +            self.data =3D None
> +
> +    @contextmanager
> +    def write_list_item(self):
> +        s =3D self.__class__(None)
> +        yield s
> +        if s.data is not None:
> +            self.data.append(s.data)
> +
> +
> +class JSONLDSerializer(object):
> +    def __init__(self, **args):
> +        self.args =3D args
> +
> +    def serialize_data(
> +        self,
> +        objectset: SHACLObjectSet,
> +        force_at_graph=3DFalse,
> +    ):
> +        h =3D JSONLDEncoder()
> +        objectset.encode(h, force_at_graph)
> +        data =3D {}
> +        if len(CONTEXT_URLS) =3D=3D 1:
> +            data["@context"] =3D CONTEXT_URLS[0]
> +        elif CONTEXT_URLS:
> +            data["@context"] =3D CONTEXT_URLS
> +
> +        if isinstance(h.data, list):
> +            data["@graph"] =3D h.data
> +        else:
> +            for k, v in h.data.items():
> +                data[k] =3D v
> +
> +        return data
> +
> +    def write(
> +        self,
> +        objectset: SHACLObjectSet,
> +        f,
> +        force_at_graph=3DFalse,
> +        **kwargs,
> +    ):
> +        """
> +        Write a SHACLObjectSet to a JSON LD file
> +
> +        If force_at_graph is True, a @graph node will always be written
> +        """
> +        data =3D self.serialize_data(objectset, force_at_graph)
> +
> +        args =3D {**self.args, **kwargs}
> +
> +        sha1 =3D hashlib.sha1()
> +        for chunk in json.JSONEncoder(**args).iterencode(data):
> +            chunk =3D chunk.encode("utf-8")
> +            f.write(chunk)
> +            sha1.update(chunk)
> +
> +        return sha1.hexdigest()
> +
> +
> +class JSONLDInlineEncoder(Encoder):
> +    def __init__(self, f, sha1):
> +        self.f =3D f
> +        self.comma =3D False
> +        self.sha1 =3D sha1
> +
> +    def write(self, s):
> +        s =3D s.encode("utf-8")
> +        self.f.write(s)
> +        self.sha1.update(s)
> +
> +    def _write_comma(self):
> +        if self.comma:
> +            self.write(",")
> +            self.comma =3D False
> +
> +    def write_string(self, v):
> +        self.write(json.dumps(v))
> +
> +    def write_datetime(self, v):
> +        self.write_string(v)
> +
> +    def write_integer(self, v):
> +        self.write(f"{v}")
> +
> +    def write_iri(self, v, compact=3DNone):
> +        self.write_string(compact or v)
> +
> +    def write_enum(self, v, e, compact=3DNone):
> +        self.write_iri(v, compact)
> +
> +    def write_bool(self, v):
> +        if v:
> +            self.write("true")
> +        else:
> +            self.write("false")
> +
> +    def write_float(self, v):
> +        self.write(json.dumps(str(v)))
> +
> +    @contextmanager
> +    def write_property(self, iri, compact=3DNone):
> +        self._write_comma()
> +        self.write_string(compact or iri)
> +        self.write(":")
> +        yield self
> +        self.comma =3D True
> +
> +    @contextmanager
> +    def write_object(self, o, _id, needs_id):
> +        self._write_comma()
> +
> +        self.write("{")
> +        self.write_string("type")
> +        self.write(":")
> +        self.write_string(o.COMPACT_TYPE or o.TYPE)
> +        self.comma =3D True
> +
> +        if needs_id:
> +            self._write_comma()
> +            self.write_string(o.ID_ALIAS or "@id")
> +            self.write(":")
> +            self.write_string(_id)
> +            self.comma =3D True
> +
> +        self.comma =3D True
> +        yield self
> +
> +        self.write("}")
> +        self.comma =3D True
> +
> +    @contextmanager
> +    def write_list(self):
> +        self._write_comma()
> +        self.write("[")
> +        yield self.__class__(self.f, self.sha1)
> +        self.write("]")
> +        self.comma =3D True
> +
> +    @contextmanager
> +    def write_list_item(self):
> +        self._write_comma()
> +        yield self.__class__(self.f, self.sha1)
> +        self.comma =3D True
> +
> +
> +class JSONLDInlineSerializer(object):
> +    def write(
> +        self,
> +        objectset: SHACLObjectSet,
> +        f,
> +        force_at_graph=3DFalse,
> +    ):
> +        """
> +        Write a SHACLObjectSet to a JSON LD file
> +
> +        Note: force_at_graph is included for compatibility, but ignored.=
 This
> +        serializer always writes out a graph
> +        """
> +        sha1 =3D hashlib.sha1()
> +        h =3D JSONLDInlineEncoder(f, sha1)
> +        h.write('{"@context":')
> +        if len(CONTEXT_URLS) =3D=3D 1:
> +            h.write(f'"{CONTEXT_URLS[0]}"')
> +        elif CONTEXT_URLS:
> +            h.write('["')
> +            h.write('","'.join(CONTEXT_URLS))
> +            h.write('"]')
> +        h.write(",")
> +
> +        h.write('"@graph":')
> +
> +        objectset.encode(h, True)
> +        h.write("}")
> +        return sha1.hexdigest()
> +
> +
> +def print_tree(objects, all_fields=3DFalse):
> +    """
> +    Print object tree
> +    """
> +    seen =3D set()
> +
> +    def callback(value, path):
> +        nonlocal seen
> +
> +        s =3D ("  " * (len(path) - 1)) + f"{path[-1]}"
> +        if isinstance(value, SHACLObject):
> +            s +=3D f" {value} ({id(value)})"
> +            is_empty =3D False
> +        elif isinstance(value, ListProxy):
> +            is_empty =3D len(value) =3D=3D 0
> +            if is_empty:
> +                s +=3D " []"
> +        else:
> +            s +=3D f" {value!r}"
> +            is_empty =3D value is None
> +
> +        if all_fields or not is_empty:
> +            print(s)
> +
> +        if isinstance(value, SHACLObject):
> +            if value in seen:
> +                return False
> +            seen.add(value)
> +            return True
> +
> +        return True
> +
> +    for o in objects:
> +        o.walk(callback)
> +
> +
> +# fmt: off
> +"""Format Guard"""
> +
> +
> +CONTEXT_URLS =3D [
> +    "https://spdx.org/rdf/3.0.1/spdx-context.jsonld",
> +]
> +
> +
> +# CLASSES
> +# A class for describing the energy consumption incurred by an AI model =
in
> +# different stages of its lifecycle.
> +@register("https://spdx.org/rdf/3.0.1/terms/AI/EnergyConsumption", compa=
ct_type=3D"ai_EnergyConsumption", abstract=3DFalse)
> +class ai_EnergyConsumption(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Specifies the amount of energy consumed when finetuning the AI=
 model that is
> +        # being used in the AI system.
> +        cls._add_property(
> +            "ai_finetuningEnergyConsumption",
> +            ListProp(ObjectProp(ai_EnergyConsumptionDescription, False))=
,
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/finetuningEnergyC=
onsumption",
> +            compact=3D"ai_finetuningEnergyConsumption",
> +        )
> +        # Specifies the amount of energy consumed during inference time =
by an AI model
> +        # that is being used in the AI system.
> +        cls._add_property(
> +            "ai_inferenceEnergyConsumption",
> +            ListProp(ObjectProp(ai_EnergyConsumptionDescription, False))=
,
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/inferenceEnergyCo=
nsumption",
> +            compact=3D"ai_inferenceEnergyConsumption",
> +        )
> +        # Specifies the amount of energy consumed when training the AI m=
odel that is
> +        # being used in the AI system.
> +        cls._add_property(
> +            "ai_trainingEnergyConsumption",
> +            ListProp(ObjectProp(ai_EnergyConsumptionDescription, False))=
,
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/trainingEnergyCon=
sumption",
> +            compact=3D"ai_trainingEnergyConsumption",
> +        )
> +
> +
> +# The class that helps note down the quantity of energy consumption and =
the unit
> +# used for measurement.
> +@register("https://spdx.org/rdf/3.0.1/terms/AI/EnergyConsumptionDescript=
ion", compact_type=3D"ai_EnergyConsumptionDescription", abstract=3DFalse)
> +class ai_EnergyConsumptionDescription(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Represents the energy quantity.
> +        cls._add_property(
> +            "ai_energyQuantity",
> +            FloatProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/energyQuantity",
> +            min_count=3D1,
> +            compact=3D"ai_energyQuantity",
> +        )
> +        # Specifies the unit in which energy is measured.
> +        cls._add_property(
> +            "ai_energyUnit",
> +            EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/AI/EnergyUnitType=
/kilowattHour", "kilowattHour"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/AI/EnergyUnitType=
/megajoule", "megajoule"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/AI/EnergyUnitType=
/other", "other"),
> +                ]),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/energyUnit",
> +            min_count=3D1,
> +            compact=3D"ai_energyUnit",
> +        )
> +
> +
> +# Specifies the unit of energy consumption.
> +@register("https://spdx.org/rdf/3.0.1/terms/AI/EnergyUnitType", compact_=
type=3D"ai_EnergyUnitType", abstract=3DFalse)
> +class ai_EnergyUnitType(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +        "kilowattHour": "https://spdx.org/rdf/3.0.1/terms/AI/EnergyUnitT=
ype/kilowattHour",
> +        "megajoule": "https://spdx.org/rdf/3.0.1/terms/AI/EnergyUnitType=
/megajoule",
> +        "other": "https://spdx.org/rdf/3.0.1/terms/AI/EnergyUnitType/oth=
er",
> +    }
> +    # Kilowatt-hour.
> +    kilowattHour =3D "https://spdx.org/rdf/3.0.1/terms/AI/EnergyUnitType=
/kilowattHour"
> +    # Megajoule.
> +    megajoule =3D "https://spdx.org/rdf/3.0.1/terms/AI/EnergyUnitType/me=
gajoule"
> +    # Any other units of energy measurement.
> +    other =3D "https://spdx.org/rdf/3.0.1/terms/AI/EnergyUnitType/other"
> +
> +
> +# Specifies the safety risk level.
> +@register("https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssessmentType"=
, compact_type=3D"ai_SafetyRiskAssessmentType", abstract=3DFalse)
> +class ai_SafetyRiskAssessmentType(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +        "high": "https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssessmen=
tType/high",
> +        "low": "https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssessment=
Type/low",
> +        "medium": "https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssessm=
entType/medium",
> +        "serious": "https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssess=
mentType/serious",
> +    }
> +    # The second-highest level of risk posed by an AI system.
> +    high =3D "https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssessmentTy=
pe/high"
> +    # Low/no risk is posed by an AI system.
> +    low =3D "https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssessmentTyp=
e/low"
> +    # The third-highest level of risk posed by an AI system.
> +    medium =3D "https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssessment=
Type/medium"
> +    # The highest level of risk posed by an AI system.
> +    serious =3D "https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAssessmen=
tType/serious"
> +
> +
> +# Specifies the type of an annotation.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/AnnotationType", compac=
t_type=3D"AnnotationType", abstract=3DFalse)
> +class AnnotationType(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +        "other": "https://spdx.org/rdf/3.0.1/terms/Core/AnnotationType/o=
ther",
> +        "review": "https://spdx.org/rdf/3.0.1/terms/Core/AnnotationType/=
review",
> +    }
> +    # Used to store extra information about an Element which is not part=
 of a review (e.g. extra information provided during the creation of the El=
ement).
> +    other =3D "https://spdx.org/rdf/3.0.1/terms/Core/AnnotationType/othe=
r"
> +    # Used when someone reviews the Element.
> +    review =3D "https://spdx.org/rdf/3.0.1/terms/Core/AnnotationType/rev=
iew"
> +
> +
> +# Provides information about the creation of the Element.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/CreationInfo", compact_=
type=3D"CreationInfo", abstract=3DFalse)
> +class CreationInfo(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Provide consumers with comments by the creator of the Element =
about the
> +        # Element.
> +        cls._add_property(
> +            "comment",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/comment",
> +            compact=3D"comment",
> +        )
> +        # Identifies when the Element was originally created.
> +        cls._add_property(
> +            "created",
> +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:=
\d\dZ$",),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/created",
> +            min_count=3D1,
> +            compact=3D"created",
> +        )
> +        # Identifies who or what created the Element.
> +        cls._add_property(
> +            "createdBy",
> +            ListProp(ObjectProp(Agent, False, context=3D[
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganiza=
tion", "SpdxOrganization"),
> +                ],)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/createdBy",
> +            min_count=3D1,
> +            compact=3D"createdBy",
> +        )
> +        # Identifies the tooling that was used during the creation of th=
e Element.
> +        cls._add_property(
> +            "createdUsing",
> +            ListProp(ObjectProp(Tool, False)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/createdUsing",
> +            compact=3D"createdUsing",
> +        )
> +        # Provides a reference number that can be used to understand how=
 to parse and
> +        # interpret an Element.
> +        cls._add_property(
> +            "specVersion",
> +            StringProp(pattern=3Dr"^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]=
\d*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-z=
A-Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$",),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/specVersion",
> +            min_count=3D1,
> +            compact=3D"specVersion",
> +        )
> +
> +
> +# A key with an associated value.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/DictionaryEntry", compa=
ct_type=3D"DictionaryEntry", abstract=3DFalse)
> +class DictionaryEntry(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # A key used in a generic key-value pair.
> +        cls._add_property(
> +            "key",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/key",
> +            min_count=3D1,
> +            compact=3D"key",
> +        )
> +        # A value used in a generic key-value pair.
> +        cls._add_property(
> +            "value",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/value",
> +            compact=3D"value",
> +        )
> +
> +
> +# Base domain class from which all other SPDX-3.0 domain classes derive.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/Element", compact_type=
=3D"Element", abstract=3DTrue)
> +class Element(SHACLObject):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Provide consumers with comments by the creator of the Element =
about the
> +        # Element.
> +        cls._add_property(
> +            "comment",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/comment",
> +            compact=3D"comment",
> +        )
> +        # Provides information about the creation of the Element.
> +        cls._add_property(
> +            "creationInfo",
> +            ObjectProp(CreationInfo, True),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/creationInfo",
> +            min_count=3D1,
> +            compact=3D"creationInfo",
> +        )
> +        # Provides a detailed description of the Element.
> +        cls._add_property(
> +            "description",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/description",
> +            compact=3D"description",
> +        )
> +        # Specifies an Extension characterization of some aspect of an E=
lement.
> +        cls._add_property(
> +            "extension",
> +            ListProp(ObjectProp(extension_Extension, False)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/extension",
> +            compact=3D"extension",
> +        )
> +        # Provides a reference to a resource outside the scope of SPDX-3=
.0 content
> +        # that uniquely identifies an Element.
> +        cls._add_property(
> +            "externalIdentifier",
> +            ListProp(ObjectProp(ExternalIdentifier, False)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/externalIdentif=
ier",
> +            compact=3D"externalIdentifier",
> +        )
> +        # Points to a resource outside the scope of the SPDX-3.0 content
> +        # that provides additional characteristics of an Element.
> +        cls._add_property(
> +            "externalRef",
> +            ListProp(ObjectProp(ExternalRef, False)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/externalRef",
> +            compact=3D"externalRef",
> +        )
> +        # Identifies the name of an Element as designated by the creator=
.
> +        cls._add_property(
> +            "name",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/name",
> +            compact=3D"name",
> +        )
> +        # A short description of an Element.
> +        cls._add_property(
> +            "summary",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/summary",
> +            compact=3D"summary",
> +        )
> +        # Provides an IntegrityMethod with which the integrity of an Ele=
ment can be
> +        # asserted.
> +        cls._add_property(
> +            "verifiedUsing",
> +            ListProp(ObjectProp(IntegrityMethod, False)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/verifiedUsing",
> +            compact=3D"verifiedUsing",
> +        )
> +
> +
> +# A collection of Elements, not necessarily with unifying context.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/ElementCollection", com=
pact_type=3D"ElementCollection", abstract=3DTrue)
> +class ElementCollection(Element):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Refers to one or more Elements that are part of an ElementColl=
ection.
> +        cls._add_property(
> +            "element",
> +            ListProp(ObjectProp(Element, False, context=3D[
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoneElement"=
, "NoneElement"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing=
/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing=
/NoneLicense", "expandedlicensing_NoneLicense"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganiza=
tion", "SpdxOrganization"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoAssertionE=
lement", "NoAssertionElement"),
> +                ],)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/element",
> +            compact=3D"element",
> +        )
> +        # Describes one a profile which the creator of this ElementColle=
ction intends to
> +        # conform to.
> +        cls._add_property(
> +            "profileConformance",
> +            ListProp(EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdent=
ifierType/ai", "ai"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdent=
ifierType/build", "build"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdent=
ifierType/core", "core"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdent=
ifierType/dataset", "dataset"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdent=
ifierType/expandedLicensing", "expandedLicensing"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdent=
ifierType/extension", "extension"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdent=
ifierType/lite", "lite"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdent=
ifierType/security", "security"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdent=
ifierType/simpleLicensing", "simpleLicensing"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdent=
ifierType/software", "software"),
> +                ])),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/profileConforma=
nce",
> +            compact=3D"profileConformance",
> +        )
> +        # This property is used to denote the root Element(s) of a tree =
of elements contained in a BOM.
> +        cls._add_property(
> +            "rootElement",
> +            ListProp(ObjectProp(Element, False, context=3D[
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoneElement"=
, "NoneElement"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing=
/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing=
/NoneLicense", "expandedlicensing_NoneLicense"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganiza=
tion", "SpdxOrganization"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoAssertionE=
lement", "NoAssertionElement"),
> +                ],)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/rootElement",
> +            compact=3D"rootElement",
> +        )
> +
> +
> +# A reference to a resource identifier defined outside the scope of SPDX=
-3.0 content that uniquely identifies an Element.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifier", co=
mpact_type=3D"ExternalIdentifier", abstract=3DFalse)
> +class ExternalIdentifier(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Provide consumers with comments by the creator of the Element =
about the
> +        # Element.
> +        cls._add_property(
> +            "comment",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/comment",
> +            compact=3D"comment",
> +        )
> +        # Specifies the type of the external identifier.
> +        cls._add_property(
> +            "externalIdentifierType",
> +            EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIden=
tifierType/cpe22", "cpe22"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIden=
tifierType/cpe23", "cpe23"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIden=
tifierType/cve", "cve"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIden=
tifierType/email", "email"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIden=
tifierType/gitoid", "gitoid"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIden=
tifierType/other", "other"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIden=
tifierType/packageUrl", "packageUrl"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIden=
tifierType/securityOther", "securityOther"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIden=
tifierType/swhid", "swhid"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIden=
tifierType/swid", "swid"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIden=
tifierType/urlScheme", "urlScheme"),
> +                ]),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/externalIdentif=
ierType",
> +            min_count=3D1,
> +            compact=3D"externalIdentifierType",
> +        )
> +        # Uniquely identifies an external element.
> +        cls._add_property(
> +            "identifier",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/identifier",
> +            min_count=3D1,
> +            compact=3D"identifier",
> +        )
> +        # Provides the location for more information regarding an extern=
al identifier.
> +        cls._add_property(
> +            "identifierLocator",
> +            ListProp(AnyURIProp()),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/identifierLocat=
or",
> +            compact=3D"identifierLocator",
> +        )
> +        # An entity that is authorized to issue identification credentia=
ls.
> +        cls._add_property(
> +            "issuingAuthority",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/issuingAuthorit=
y",
> +            compact=3D"issuingAuthority",
> +        )
> +
> +
> +# Specifies the type of an external identifier.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifierType"=
, compact_type=3D"ExternalIdentifierType", abstract=3DFalse)
> +class ExternalIdentifierType(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +        "cpe22": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifi=
erType/cpe22",
> +        "cpe23": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifi=
erType/cpe23",
> +        "cve": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifier=
Type/cve",
> +        "email": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifi=
erType/email",
> +        "gitoid": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentif=
ierType/gitoid",
> +        "other": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifi=
erType/other",
> +        "packageUrl": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIde=
ntifierType/packageUrl",
> +        "securityOther": "https://spdx.org/rdf/3.0.1/terms/Core/External=
IdentifierType/securityOther",
> +        "swhid": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifi=
erType/swhid",
> +        "swid": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifie=
rType/swid",
> +        "urlScheme": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIden=
tifierType/urlScheme",
> +    }
> +    # [Common Platform Enumeration Specification 2.2](https://cpe.mitre.=
org/files/cpe-specification_2.2.pdf)
> +    cpe22 =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifierT=
ype/cpe22"
> +    # [Common Platform Enumeration: Naming Specification Version 2.3](ht=
tps://csrc.nist.gov/publications/detail/nistir/7695/final)
> +    cpe23 =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifierT=
ype/cpe23"
> +    # Common Vulnerabilities and Exposures identifiers, an identifier fo=
r a specific software flaw defined within the official CVE Dictionary and t=
hat conforms to the [CVE specification](https://csrc.nist.gov/glossary/term=
/cve_id).
> +    cve =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifierTyp=
e/cve"
> +    # Email address, as defined in [RFC 3696](https://datatracker.ietf.o=
rg/doc/rfc3986/) Section 3.
> +    email =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifierT=
ype/email"
> +    # [Gitoid](https://www.iana.org/assignments/uri-schemes/prov/gitoid)=
, stands for [Git Object ID](https://git-scm.com/book/en/v2/Git-Internals-G=
it-Objects). A gitoid of type blob is a unique hash of a binary artifact. A=
 gitoid may represent either an [Artifact Identifier](https://github.com/om=
nibor/spec/blob/eb1ee5c961c16215eb8709b2975d193a2007a35d/spec/SPEC.md#artif=
act-identifier-types) for the software artifact or an [Input Manifest Ident=
ifier](https://github.com/omnibor/spec/blob/eb1ee5c961c16215eb8709b2975d193=
a2007a35d/spec/SPEC.md#input-manifest-identifier) for the software artifact=
's associated [Artifact Input Manifest](https://github.com/omnibor/spec/blo=
b/eb1ee5c961c16215eb8709b2975d193a2007a35d/spec/SPEC.md#artifact-input-mani=
fest); this ambiguity exists because the Artifact Input Manifest is itself =
an artifact, and the gitoid of that artifact is its valid identifier. Gitoi=
ds calculated on software artifacts (Snippet, File, or Package Elements) sh=
ould be recorded in the SPDX 3.0 SoftwareArtifact's contentIdentifier prope=
rty. Gitoids calculated on the Artifact Input Manifest (Input Manifest Iden=
tifier) should be recorded in the SPDX 3.0 Element's externalIdentifier pro=
perty. See [OmniBOR Specification](https://github.com/omnibor/spec/), a min=
imalistic specification for describing software [Artifact Dependency Graphs=
](https://github.com/omnibor/spec/blob/eb1ee5c961c16215eb8709b2975d193a2007=
a35d/spec/SPEC.md#artifact-dependency-graph-adg).
> +    gitoid =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifier=
Type/gitoid"
> +    # Used when the type does not match any of the other options.
> +    other =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifierT=
ype/other"
> +    # Package URL, as defined in the corresponding [Annex](../../../anne=
xes/pkg-url-specification.md) of this specification.
> +    packageUrl =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdenti=
fierType/packageUrl"
> +    # Used when there is a security related identifier of unspecified ty=
pe.
> +    securityOther =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIde=
ntifierType/securityOther"
> +    # SoftWare Hash IDentifier, a persistent intrinsic identifier for di=
gital artifacts, such as files, trees (also known as directories or folders=
), commits, and other objects typically found in version control systems. T=
he format of the identifiers is defined in the [SWHID specification](https:=
//www.swhid.org/specification/v1.1/4.Syntax) (ISO/IEC DIS 18670). They typi=
cally look like `swh:1:cnt:94a9ed024d3859793618152ea559a168bbcbb5e2`.
> +    swhid =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifierT=
ype/swhid"
> +    # Concise Software Identification (CoSWID) tag, as defined in [RFC 9=
393](https://datatracker.ietf.org/doc/rfc9393/) Section 2.3.
> +    swid =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentifierTy=
pe/swid"
> +    # [Uniform Resource Identifier (URI) Schemes](https://www.iana.org/a=
ssignments/uri-schemes/uri-schemes.xhtml). The scheme used in order to loca=
te a resource.
> +    urlScheme =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalIdentif=
ierType/urlScheme"
> +
> +
> +# A map of Element identifiers that are used within an SpdxDocument but =
defined
> +# external to that SpdxDocument.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/ExternalMap", compact_t=
ype=3D"ExternalMap", abstract=3DFalse)
> +class ExternalMap(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Artifact representing a serialization instance of SPDX data co=
ntaining the
> +        # definition of a particular Element.
> +        cls._add_property(
> +            "definingArtifact",
> +            ObjectProp(Artifact, False),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/definingArtifac=
t",
> +            compact=3D"definingArtifact",
> +        )
> +        # Identifies an external Element used within an SpdxDocument but=
 defined
> +        # external to that SpdxDocument.
> +        cls._add_property(
> +            "externalSpdxId",
> +            AnyURIProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/externalSpdxId"=
,
> +            min_count=3D1,
> +            compact=3D"externalSpdxId",
> +        )
> +        # Provides an indication of where to retrieve an external Elemen=
t.
> +        cls._add_property(
> +            "locationHint",
> +            AnyURIProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/locationHint",
> +            compact=3D"locationHint",
> +        )
> +        # Provides an IntegrityMethod with which the integrity of an Ele=
ment can be
> +        # asserted.
> +        cls._add_property(
> +            "verifiedUsing",
> +            ListProp(ObjectProp(IntegrityMethod, False)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/verifiedUsing",
> +            compact=3D"verifiedUsing",
> +        )
> +
> +
> +# A reference to a resource outside the scope of SPDX-3.0 content relate=
d to an Element.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRef", compact_t=
ype=3D"ExternalRef", abstract=3DFalse)
> +class ExternalRef(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Provide consumers with comments by the creator of the Element =
about the
> +        # Element.
> +        cls._add_property(
> +            "comment",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/comment",
> +            compact=3D"comment",
> +        )
> +        # Provides information about the content type of an Element or a=
 Property.
> +        cls._add_property(
> +            "contentType",
> +            StringProp(pattern=3Dr"^[^\/]+\/[^\/]+$",),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/contentType",
> +            compact=3D"contentType",
> +        )
> +        # Specifies the type of the external reference.
> +        cls._add_property(
> +            "externalRefType",
> +            EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/altDownloadLocation", "altDownloadLocation"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/altWebPage", "altWebPage"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/binaryArtifact", "binaryArtifact"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/bower", "bower"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/buildMeta", "buildMeta"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/buildSystem", "buildSystem"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/certificationReport", "certificationReport"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/chat", "chat"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/componentAnalysisReport", "componentAnalysisReport"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/cwe", "cwe"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/documentation", "documentation"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/dynamicAnalysisReport", "dynamicAnalysisReport"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/eolNotice", "eolNotice"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/exportControlAssessment", "exportControlAssessment"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/funding", "funding"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/issueTracker", "issueTracker"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/license", "license"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/mailingList", "mailingList"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/mavenCentral", "mavenCentral"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/metrics", "metrics"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/npm", "npm"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/nuget", "nuget"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/other", "other"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/privacyAssessment", "privacyAssessment"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/productMetadata", "productMetadata"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/purchaseOrder", "purchaseOrder"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/qualityAssessmentReport", "qualityAssessmentReport"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/releaseHistory", "releaseHistory"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/releaseNotes", "releaseNotes"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/riskAssessment", "riskAssessment"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/runtimeAnalysisReport", "runtimeAnalysisReport"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/secureSoftwareAttestation", "secureSoftwareAttestation"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/securityAdversaryModel", "securityAdversaryModel"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/securityAdvisory", "securityAdvisory"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/securityFix", "securityFix"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/securityOther", "securityOther"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/securityPenTestReport", "securityPenTestReport"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/securityPolicy", "securityPolicy"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/securityThreatModel", "securityThreatModel"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/socialMedia", "socialMedia"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/sourceArtifact", "sourceArtifact"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/staticAnalysisReport", "staticAnalysisReport"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/support", "support"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/vcs", "vcs"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/vulnerabilityDisclosureReport", "vulnerabilityDisclosureReport"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/vulnerabilityExploitabilityAssessment", "vulnerabilityExploitabilityAss=
essment"),
> +                ]),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/externalRefType=
",
> +            compact=3D"externalRefType",
> +        )
> +        # Provides the location of an external reference.
> +        cls._add_property(
> +            "locator",
> +            ListProp(StringProp()),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/locator",
> +            compact=3D"locator",
> +        )
> +
> +
> +# Specifies the type of an external reference.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType", compa=
ct_type=3D"ExternalRefType", abstract=3DFalse)
> +class ExternalRefType(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +        "altDownloadLocation": "https://spdx.org/rdf/3.0.1/terms/Core/Ex=
ternalRefType/altDownloadLocation",
> +        "altWebPage": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRef=
Type/altWebPage",
> +        "binaryArtifact": "https://spdx.org/rdf/3.0.1/terms/Core/Externa=
lRefType/binaryArtifact",
> +        "bower": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/=
bower",
> +        "buildMeta": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/buildMeta",
> +        "buildSystem": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRe=
fType/buildSystem",
> +        "certificationReport": "https://spdx.org/rdf/3.0.1/terms/Core/Ex=
ternalRefType/certificationReport",
> +        "chat": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/c=
hat",
> +        "componentAnalysisReport": "https://spdx.org/rdf/3.0.1/terms/Cor=
e/ExternalRefType/componentAnalysisReport",
> +        "cwe": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/cw=
e",
> +        "documentation": "https://spdx.org/rdf/3.0.1/terms/Core/External=
RefType/documentation",
> +        "dynamicAnalysisReport": "https://spdx.org/rdf/3.0.1/terms/Core/=
ExternalRefType/dynamicAnalysisReport",
> +        "eolNotice": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/eolNotice",
> +        "exportControlAssessment": "https://spdx.org/rdf/3.0.1/terms/Cor=
e/ExternalRefType/exportControlAssessment",
> +        "funding": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/funding",
> +        "issueTracker": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalR=
efType/issueTracker",
> +        "license": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/license",
> +        "mailingList": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRe=
fType/mailingList",
> +        "mavenCentral": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalR=
efType/mavenCentral",
> +        "metrics": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/metrics",
> +        "npm": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/np=
m",
> +        "nuget": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/=
nuget",
> +        "other": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/=
other",
> +        "privacyAssessment": "https://spdx.org/rdf/3.0.1/terms/Core/Exte=
rnalRefType/privacyAssessment",
> +        "productMetadata": "https://spdx.org/rdf/3.0.1/terms/Core/Extern=
alRefType/productMetadata",
> +        "purchaseOrder": "https://spdx.org/rdf/3.0.1/terms/Core/External=
RefType/purchaseOrder",
> +        "qualityAssessmentReport": "https://spdx.org/rdf/3.0.1/terms/Cor=
e/ExternalRefType/qualityAssessmentReport",
> +        "releaseHistory": "https://spdx.org/rdf/3.0.1/terms/Core/Externa=
lRefType/releaseHistory",
> +        "releaseNotes": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalR=
efType/releaseNotes",
> +        "riskAssessment": "https://spdx.org/rdf/3.0.1/terms/Core/Externa=
lRefType/riskAssessment",
> +        "runtimeAnalysisReport": "https://spdx.org/rdf/3.0.1/terms/Core/=
ExternalRefType/runtimeAnalysisReport",
> +        "secureSoftwareAttestation": "https://spdx.org/rdf/3.0.1/terms/C=
ore/ExternalRefType/secureSoftwareAttestation",
> +        "securityAdversaryModel": "https://spdx.org/rdf/3.0.1/terms/Core=
/ExternalRefType/securityAdversaryModel",
> +        "securityAdvisory": "https://spdx.org/rdf/3.0.1/terms/Core/Exter=
nalRefType/securityAdvisory",
> +        "securityFix": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRe=
fType/securityFix",
> +        "securityOther": "https://spdx.org/rdf/3.0.1/terms/Core/External=
RefType/securityOther",
> +        "securityPenTestReport": "https://spdx.org/rdf/3.0.1/terms/Core/=
ExternalRefType/securityPenTestReport",
> +        "securityPolicy": "https://spdx.org/rdf/3.0.1/terms/Core/Externa=
lRefType/securityPolicy",
> +        "securityThreatModel": "https://spdx.org/rdf/3.0.1/terms/Core/Ex=
ternalRefType/securityThreatModel",
> +        "socialMedia": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRe=
fType/socialMedia",
> +        "sourceArtifact": "https://spdx.org/rdf/3.0.1/terms/Core/Externa=
lRefType/sourceArtifact",
> +        "staticAnalysisReport": "https://spdx.org/rdf/3.0.1/terms/Core/E=
xternalRefType/staticAnalysisReport",
> +        "support": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/support",
> +        "vcs": "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/vc=
s",
> +        "vulnerabilityDisclosureReport": "https://spdx.org/rdf/3.0.1/ter=
ms/Core/ExternalRefType/vulnerabilityDisclosureReport",
> +        "vulnerabilityExploitabilityAssessment": "https://spdx.org/rdf/3=
.0.1/terms/Core/ExternalRefType/vulnerabilityExploitabilityAssessment",
> +    }
> +    # A reference to an alternative download location.
> +    altDownloadLocation =3D "https://spdx.org/rdf/3.0.1/terms/Core/Exter=
nalRefType/altDownloadLocation"
> +    # A reference to an alternative web page.
> +    altWebPage =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTyp=
e/altWebPage"
> +    # A reference to binary artifacts related to a package.
> +    binaryArtifact =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRe=
fType/binaryArtifact"
> +    # A reference to a Bower package. The package locator format, looks =
like `package#version`, is defined in the "install" section of [Bower API d=
ocumentation](https://bower.io/docs/api/#install).
> +    bower =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/bow=
er"
> +    # A reference build metadata related to a published package.
> +    buildMeta =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType=
/buildMeta"
> +    # A reference build system used to create or publish the package.
> +    buildSystem =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTy=
pe/buildSystem"
> +    # A reference to a certification report for a package from an accred=
ited/independent body.
> +    certificationReport =3D "https://spdx.org/rdf/3.0.1/terms/Core/Exter=
nalRefType/certificationReport"
> +    # A reference to the instant messaging system used by the maintainer=
 for a package.
> +    chat =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/chat=
"
> +    # A reference to a Software Composition Analysis (SCA) report.
> +    componentAnalysisReport =3D "https://spdx.org/rdf/3.0.1/terms/Core/E=
xternalRefType/componentAnalysisReport"
> +    # [Common Weakness Enumeration](https://csrc.nist.gov/glossary/term/=
common_weakness_enumeration). A reference to a source of software flaw defi=
ned within the official [CWE List](https://cwe.mitre.org/data/) that confor=
ms to the [CWE specification](https://cwe.mitre.org/).
> +    cwe =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/cwe"
> +    # A reference to the documentation for a package.
> +    documentation =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRef=
Type/documentation"
> +    # A reference to a dynamic analysis report for a package.
> +    dynamicAnalysisReport =3D "https://spdx.org/rdf/3.0.1/terms/Core/Ext=
ernalRefType/dynamicAnalysisReport"
> +    # A reference to the End Of Sale (EOS) and/or End Of Life (EOL) info=
rmation related to a package.
> +    eolNotice =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType=
/eolNotice"
> +    # A reference to a export control assessment for a package.
> +    exportControlAssessment =3D "https://spdx.org/rdf/3.0.1/terms/Core/E=
xternalRefType/exportControlAssessment"
> +    # A reference to funding information related to a package.
> +    funding =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/f=
unding"
> +    # A reference to the issue tracker for a package.
> +    issueTracker =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/issueTracker"
> +    # A reference to additional license information related to an artifa=
ct.
> +    license =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/l=
icense"
> +    # A reference to the mailing list used by the maintainer for a packa=
ge.
> +    mailingList =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTy=
pe/mailingList"
> +    # A reference to a Maven repository artifact. The artifact locator f=
ormat is defined in the [Maven documentation](https://maven.apache.org/guid=
es/mini/guide-naming-conventions.html) and looks like `groupId:artifactId[:=
version]`.
> +    mavenCentral =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/mavenCentral"
> +    # A reference to metrics related to package such as OpenSSF scorecar=
ds.
> +    metrics =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/m=
etrics"
> +    # A reference to an npm package. The package locator format is defin=
ed in the [npm documentation](https://docs.npmjs.com/cli/v10/configuring-np=
m/package-json) and looks like `package@version`.
> +    npm =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/npm"
> +    # A reference to a NuGet package. The package locator format is defi=
ned in the [NuGet documentation](https://docs.nuget.org) and looks like `pa=
ckage/version`.
> +    nuget =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/nug=
et"
> +    # Used when the type does not match any of the other options.
> +    other =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/oth=
er"
> +    # A reference to a privacy assessment for a package.
> +    privacyAssessment =3D "https://spdx.org/rdf/3.0.1/terms/Core/Externa=
lRefType/privacyAssessment"
> +    # A reference to additional product metadata such as reference withi=
n organization's product catalog.
> +    productMetadata =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalR=
efType/productMetadata"
> +    # A reference to a purchase order for a package.
> +    purchaseOrder =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRef=
Type/purchaseOrder"
> +    # A reference to a quality assessment for a package.
> +    qualityAssessmentReport =3D "https://spdx.org/rdf/3.0.1/terms/Core/E=
xternalRefType/qualityAssessmentReport"
> +    # A reference to a published list of releases for a package.
> +    releaseHistory =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRe=
fType/releaseHistory"
> +    # A reference to the release notes for a package.
> +    releaseNotes =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefT=
ype/releaseNotes"
> +    # A reference to a risk assessment for a package.
> +    riskAssessment =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRe=
fType/riskAssessment"
> +    # A reference to a runtime analysis report for a package.
> +    runtimeAnalysisReport =3D "https://spdx.org/rdf/3.0.1/terms/Core/Ext=
ernalRefType/runtimeAnalysisReport"
> +    # A reference to information assuring that the software is developed=
 using security practices as defined by [NIST SP 800-218 Secure Software De=
velopment Framework (SSDF) Version 1.1](https://csrc.nist.gov/pubs/sp/800/2=
18/final) or [CISA Secure Software Development Attestation Form](https://ww=
w.cisa.gov/resources-tools/resources/secure-software-development-attestatio=
n-form).
> +    secureSoftwareAttestation =3D "https://spdx.org/rdf/3.0.1/terms/Core=
/ExternalRefType/secureSoftwareAttestation"
> +    # A reference to the security adversary model for a package.
> +    securityAdversaryModel =3D "https://spdx.org/rdf/3.0.1/terms/Core/Ex=
ternalRefType/securityAdversaryModel"
> +    # A reference to a published security advisory (where advisory as de=
fined per [ISO 29147:2018](https://www.iso.org/standard/72311.html)) that m=
ay affect one or more elements, e.g., vendor advisories or specific NVD ent=
ries.
> +    securityAdvisory =3D "https://spdx.org/rdf/3.0.1/terms/Core/External=
RefType/securityAdvisory"
> +    # A reference to the patch or source code that fixes a vulnerability=
.
> +    securityFix =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTy=
pe/securityFix"
> +    # A reference to related security information of unspecified type.
> +    securityOther =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRef=
Type/securityOther"
> +    # A reference to a [penetration test](https://en.wikipedia.org/wiki/=
Penetration_test) report for a package.
> +    securityPenTestReport =3D "https://spdx.org/rdf/3.0.1/terms/Core/Ext=
ernalRefType/securityPenTestReport"
> +    # A reference to instructions for reporting newly discovered securit=
y vulnerabilities for a package.
> +    securityPolicy =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRe=
fType/securityPolicy"
> +    # A reference the [security threat model](https://en.wikipedia.org/w=
iki/Threat_model) for a package.
> +    securityThreatModel =3D "https://spdx.org/rdf/3.0.1/terms/Core/Exter=
nalRefType/securityThreatModel"
> +    # A reference to a social media channel for a package.
> +    socialMedia =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefTy=
pe/socialMedia"
> +    # A reference to an artifact containing the sources for a package.
> +    sourceArtifact =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRe=
fType/sourceArtifact"
> +    # A reference to a static analysis report for a package.
> +    staticAnalysisReport =3D "https://spdx.org/rdf/3.0.1/terms/Core/Exte=
rnalRefType/staticAnalysisReport"
> +    # A reference to the software support channel or other support infor=
mation for a package.
> +    support =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/s=
upport"
> +    # A reference to a version control system related to a software arti=
fact.
> +    vcs =3D "https://spdx.org/rdf/3.0.1/terms/Core/ExternalRefType/vcs"
> +    # A reference to a Vulnerability Disclosure Report (VDR) which provi=
des the software supplier's analysis and findings describing the impact (or=
 lack of impact) that reported vulnerabilities have on packages or products=
 in the supplier's SBOM as defined in [NIST SP 800-161 Cybersecurity Supply=
 Chain Risk Management Practices for Systems and Organizations](https://csr=
c.nist.gov/pubs/sp/800/161/r1/final).
> +    vulnerabilityDisclosureReport =3D "https://spdx.org/rdf/3.0.1/terms/=
Core/ExternalRefType/vulnerabilityDisclosureReport"
> +    # A reference to a Vulnerability Exploitability eXchange (VEX) state=
ment which provides information on whether a product is impacted by a speci=
fic vulnerability in an included package and, if affected, whether there ar=
e actions recommended to remediate. See also [NTIA VEX one-page summary](ht=
tps://ntia.gov/files/ntia/publications/vex_one-page_summary.pdf).
> +    vulnerabilityExploitabilityAssessment =3D "https://spdx.org/rdf/3.0.=
1/terms/Core/ExternalRefType/vulnerabilityExploitabilityAssessment"
> +
> +
> +# A mathematical algorithm that maps data of arbitrary size to a bit str=
ing.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm", compact=
_type=3D"HashAlgorithm", abstract=3DFalse)
> +class HashAlgorithm(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +        "adler32": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
adler32",
> +        "blake2b256": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorit=
hm/blake2b256",
> +        "blake2b384": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorit=
hm/blake2b384",
> +        "blake2b512": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorit=
hm/blake2b512",
> +        "blake3": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/b=
lake3",
> +        "crystalsDilithium": "https://spdx.org/rdf/3.0.1/terms/Core/Hash=
Algorithm/crystalsDilithium",
> +        "crystalsKyber": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgo=
rithm/crystalsKyber",
> +        "falcon": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/f=
alcon",
> +        "md2": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/md2"=
,
> +        "md4": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/md4"=
,
> +        "md5": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/md5"=
,
> +        "md6": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/md6"=
,
> +        "other": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/ot=
her",
> +        "sha1": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sha=
1",
> +        "sha224": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/s=
ha224",
> +        "sha256": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/s=
ha256",
> +        "sha384": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/s=
ha384",
> +        "sha3_224": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm=
/sha3_224",
> +        "sha3_256": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm=
/sha3_256",
> +        "sha3_384": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm=
/sha3_384",
> +        "sha3_512": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm=
/sha3_512",
> +        "sha512": "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/s=
ha512",
> +    }
> +    # Adler-32 checksum is part of the widely used zlib compression libr=
ary as defined in [RFC 1950](https://datatracker.ietf.org/doc/rfc1950/) Sec=
tion 2.3.
> +    adler32 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/adl=
er32"
> +    # BLAKE2b algorithm with a digest size of 256, as defined in [RFC 76=
93](https://datatracker.ietf.org/doc/rfc7693/) Section 4.
> +    blake2b256 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
blake2b256"
> +    # BLAKE2b algorithm with a digest size of 384, as defined in [RFC 76=
93](https://datatracker.ietf.org/doc/rfc7693/) Section 4.
> +    blake2b384 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
blake2b384"
> +    # BLAKE2b algorithm with a digest size of 512, as defined in [RFC 76=
93](https://datatracker.ietf.org/doc/rfc7693/) Section 4.
> +    blake2b512 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/=
blake2b512"
> +    # [BLAKE3](https://github.com/BLAKE3-team/BLAKE3-specs/blob/master/b=
lake3.pdf)
> +    blake3 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/blak=
e3"
> +    # [Dilithium](https://pq-crystals.org/dilithium/)
> +    crystalsDilithium =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlg=
orithm/crystalsDilithium"
> +    # [Kyber](https://pq-crystals.org/kyber/)
> +    crystalsKyber =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorit=
hm/crystalsKyber"
> +    # [FALCON](https://falcon-sign.info/falcon.pdf)
> +    falcon =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/falc=
on"
> +    # MD2 message-digest algorithm, as defined in [RFC 1319](https://dat=
atracker.ietf.org/doc/rfc1319/).
> +    md2 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/md2"
> +    # MD4 message-digest algorithm, as defined in [RFC 1186](https://dat=
atracker.ietf.org/doc/rfc1186/).
> +    md4 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/md4"
> +    # MD5 message-digest algorithm, as defined in [RFC 1321](https://dat=
atracker.ietf.org/doc/rfc1321/).
> +    md5 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/md5"
> +    # [MD6 hash function](https://people.csail.mit.edu/rivest/pubs/RABCx=
08.pdf)
> +    md6 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/md6"
> +    # any hashing algorithm that does not exist in this list of entries
> +    other =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/other=
"
> +    # SHA-1, a secure hashing algorithm, as defined in [RFC 3174](https:=
//datatracker.ietf.org/doc/rfc3174/).
> +    sha1 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sha1"
> +    # SHA-2 with a digest length of 224, as defined in [RFC 3874](https:=
//datatracker.ietf.org/doc/rfc3874/).
> +    sha224 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sha2=
24"
> +    # SHA-2 with a digest length of 256, as defined in [RFC 6234](https:=
//datatracker.ietf.org/doc/rfc6234/).
> +    sha256 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sha2=
56"
> +    # SHA-2 with a digest length of 384, as defined in [RFC 6234](https:=
//datatracker.ietf.org/doc/rfc6234/).
> +    sha384 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sha3=
84"
> +    # SHA-3 with a digest length of 224, as defined in [FIPS 202](https:=
//csrc.nist.gov/pubs/fips/202/final).
> +    sha3_224 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sh=
a3_224"
> +    # SHA-3 with a digest length of 256, as defined in [FIPS 202](https:=
//csrc.nist.gov/pubs/fips/202/final).
> +    sha3_256 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sh=
a3_256"
> +    # SHA-3 with a digest length of 384, as defined in [FIPS 202](https:=
//csrc.nist.gov/pubs/fips/202/final).
> +    sha3_384 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sh=
a3_384"
> +    # SHA-3 with a digest length of 512, as defined in [FIPS 202](https:=
//csrc.nist.gov/pubs/fips/202/final).
> +    sha3_512 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sh=
a3_512"
> +    # SHA-2 with a digest length of 512, as defined in [RFC 6234](https:=
//datatracker.ietf.org/doc/rfc6234/).
> +    sha512 =3D "https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorithm/sha5=
12"
> +
> +
> +# A concrete subclass of Element used by Individuals in the
> +# Core profile.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/IndividualElement", com=
pact_type=3D"IndividualElement", abstract=3DFalse)
> +class IndividualElement(Element):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +        "NoAssertionElement": "https://spdx.org/rdf/3.0.1/terms/Core/NoA=
ssertionElement",
> +        "NoneElement": "https://spdx.org/rdf/3.0.1/terms/Core/NoneElemen=
t",
> +    }
> +    # An Individual Value for Element representing a set of Elements of =
unknown
> +    # identify or cardinality (number).
> +    NoAssertionElement =3D "https://spdx.org/rdf/3.0.1/terms/Core/NoAsse=
rtionElement"
> +    # An Individual Value for Element representing a set of Elements wit=
h
> +    # cardinality (number/count) of zero.
> +    NoneElement =3D "https://spdx.org/rdf/3.0.1/terms/Core/NoneElement"
> +
> +
> +# Provides an independently reproducible mechanism that permits verifica=
tion of a specific Element.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/IntegrityMethod", compa=
ct_type=3D"IntegrityMethod", abstract=3DTrue)
> +class IntegrityMethod(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Provide consumers with comments by the creator of the Element =
about the
> +        # Element.
> +        cls._add_property(
> +            "comment",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/comment",
> +            compact=3D"comment",
> +        )
> +
> +
> +# Provide an enumerated set of lifecycle phases that can provide context=
 to relationships.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopeType", co=
mpact_type=3D"LifecycleScopeType", abstract=3DFalse)
> +class LifecycleScopeType(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +        "build": "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopeTy=
pe/build",
> +        "design": "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopeT=
ype/design",
> +        "development": "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleS=
copeType/development",
> +        "other": "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopeTy=
pe/other",
> +        "runtime": "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScope=
Type/runtime",
> +        "test": "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopeTyp=
e/test",
> +    }
> +    # A relationship has specific context implications during an element=
's build phase, during development.
> +    build =3D "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopeType/=
build"
> +    # A relationship has specific context implications during an element=
's design.
> +    design =3D "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopeType=
/design"
> +    # A relationship has specific context implications during developmen=
t phase of an element.
> +    development =3D "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScop=
eType/development"
> +    # A relationship has other specific context information necessary to=
 capture that the above set of enumerations does not handle.
> +    other =3D "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopeType/=
other"
> +    # A relationship has specific context implications during the execut=
ion phase of an element.
> +    runtime =3D "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopeTyp=
e/runtime"
> +    # A relationship has specific context implications during an element=
's testing phase, during development.
> +    test =3D "https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopeType/t=
est"
> +
> +
> +# A mapping between prefixes and namespace partial URIs.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/NamespaceMap", compact_=
type=3D"NamespaceMap", abstract=3DFalse)
> +class NamespaceMap(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Provides an unambiguous mechanism for conveying a URI fragment=
 portion of an
> +        # Element ID.
> +        cls._add_property(
> +            "namespace",
> +            AnyURIProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/namespace",
> +            min_count=3D1,
> +            compact=3D"namespace",
> +        )
> +        # A substitute for a URI.
> +        cls._add_property(
> +            "prefix",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/prefix",
> +            min_count=3D1,
> +            compact=3D"prefix",
> +        )
> +
> +
> +# An SPDX version 2.X compatible verification method for software packag=
es.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/PackageVerificationCode=
", compact_type=3D"PackageVerificationCode", abstract=3DFalse)
> +class PackageVerificationCode(IntegrityMethod):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Specifies the algorithm used for calculating the hash value.
> +        cls._add_property(
> +            "algorithm",
> +            EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/adler32", "adler32"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/blake2b256", "blake2b256"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/blake2b384", "blake2b384"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/blake2b512", "blake2b512"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/blake3", "blake3"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/crystalsDilithium", "crystalsDilithium"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/crystalsKyber", "crystalsKyber"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/falcon", "falcon"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/md2", "md2"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/md4", "md4"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/md5", "md5"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/md6", "md6"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/other", "other"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/sha1", "sha1"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/sha224", "sha224"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/sha256", "sha256"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/sha384", "sha384"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/sha3_224", "sha3_224"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/sha3_256", "sha3_256"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/sha3_384", "sha3_384"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/sha3_512", "sha3_512"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/sha512", "sha512"),
> +                ]),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/algorithm",
> +            min_count=3D1,
> +            compact=3D"algorithm",
> +        )
> +        # The result of applying a hash algorithm to an Element.
> +        cls._add_property(
> +            "hashValue",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/hashValue",
> +            min_count=3D1,
> +            compact=3D"hashValue",
> +        )
> +        # The relative file name of a file to be excluded from the
> +        # `PackageVerificationCode`.
> +        cls._add_property(
> +            "packageVerificationCodeExcludedFile",
> +            ListProp(StringProp()),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/packageVerifica=
tionCodeExcludedFile",
> +            compact=3D"packageVerificationCodeExcludedFile",
> +        )
> +
> +
> +# A tuple of two positive integers that define a range.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/PositiveIntegerRange", =
compact_type=3D"PositiveIntegerRange", abstract=3DFalse)
> +class PositiveIntegerRange(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Defines the beginning of a range.
> +        cls._add_property(
> +            "beginIntegerRange",
> +            PositiveIntegerProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/beginIntegerRan=
ge",
> +            min_count=3D1,
> +            compact=3D"beginIntegerRange",
> +        )
> +        # Defines the end of a range.
> +        cls._add_property(
> +            "endIntegerRange",
> +            PositiveIntegerProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/endIntegerRange=
",
> +            min_count=3D1,
> +            compact=3D"endIntegerRange",
> +        )
> +
> +
> +# Categories of presence or absence.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/PresenceType", compact_=
type=3D"PresenceType", abstract=3DFalse)
> +class PresenceType(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +        "no": "https://spdx.org/rdf/3.0.1/terms/Core/PresenceType/no",
> +        "noAssertion": "https://spdx.org/rdf/3.0.1/terms/Core/PresenceTy=
pe/noAssertion",
> +        "yes": "https://spdx.org/rdf/3.0.1/terms/Core/PresenceType/yes",
> +    }
> +    # Indicates absence of the field.
> +    no =3D "https://spdx.org/rdf/3.0.1/terms/Core/PresenceType/no"
> +    # Makes no assertion about the field.
> +    noAssertion =3D "https://spdx.org/rdf/3.0.1/terms/Core/PresenceType/=
noAssertion"
> +    # Indicates presence of the field.
> +    yes =3D "https://spdx.org/rdf/3.0.1/terms/Core/PresenceType/yes"
> +
> +
> +# Enumeration of the valid profiles.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierType",=
 compact_type=3D"ProfileIdentifierType", abstract=3DFalse)
> +class ProfileIdentifierType(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +        "ai": "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierTy=
pe/ai",
> +        "build": "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifie=
rType/build",
> +        "core": "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifier=
Type/core",
> +        "dataset": "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentif=
ierType/dataset",
> +        "expandedLicensing": "https://spdx.org/rdf/3.0.1/terms/Core/Prof=
ileIdentifierType/expandedLicensing",
> +        "extension": "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdent=
ifierType/extension",
> +        "lite": "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifier=
Type/lite",
> +        "security": "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdenti=
fierType/security",
> +        "simpleLicensing": "https://spdx.org/rdf/3.0.1/terms/Core/Profil=
eIdentifierType/simpleLicensing",
> +        "software": "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdenti=
fierType/software",
> +    }
> +    # the element follows the AI profile specification
> +    ai =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierType/=
ai"
> +    # the element follows the Build profile specification
> +    build =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierTy=
pe/build"
> +    # the element follows the Core profile specification
> +    core =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierTyp=
e/core"
> +    # the element follows the Dataset profile specification
> +    dataset =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifier=
Type/dataset"
> +    # the element follows the ExpandedLicensing profile specification
> +    expandedLicensing =3D "https://spdx.org/rdf/3.0.1/terms/Core/Profile=
IdentifierType/expandedLicensing"
> +    # the element follows the Extension profile specification
> +    extension =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifi=
erType/extension"
> +    # the element follows the Lite profile specification
> +    lite =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifierTyp=
e/lite"
> +    # the element follows the Security profile specification
> +    security =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifie=
rType/security"
> +    # the element follows the SimpleLicensing profile specification
> +    simpleLicensing =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileId=
entifierType/simpleLicensing"
> +    # the element follows the Software profile specification
> +    software =3D "https://spdx.org/rdf/3.0.1/terms/Core/ProfileIdentifie=
rType/software"
> +
> +
> +# Describes a relationship between one or more elements.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/Relationship", compact_=
type=3D"Relationship", abstract=3DFalse)
> +class Relationship(Element):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Provides information about the completeness of relationships.
> +        cls._add_property(
> +            "completeness",
> +            EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Completeness/complete", "complete"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Completeness/incomplete", "incomplete"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Completeness/noAssertion", "noAssertion"),
> +                ]),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/completeness",
> +            compact=3D"completeness",
> +        )
> +        # Specifies the time from which an element is no longer applicab=
le / valid.
> +        cls._add_property(
> +            "endTime",
> +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:=
\d\dZ$",),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/endTime",
> +            compact=3D"endTime",
> +        )
> +        # References the Element on the left-hand side of a relationship=
.
> +        cls._add_property(
> +            "from_",
> +            ObjectProp(Element, True, context=3D[
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoneElement"=
, "NoneElement"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing=
/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing=
/NoneLicense", "expandedlicensing_NoneLicense"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganiza=
tion", "SpdxOrganization"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoAssertionE=
lement", "NoAssertionElement"),
> +                ],),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/from",
> +            min_count=3D1,
> +            compact=3D"from",
> +        )
> +        # Information about the relationship between two Elements.
> +        cls._add_property(
> +            "relationshipType",
> +            EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/affects", "affects"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/amendedBy", "amendedBy"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/ancestorOf", "ancestorOf"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/availableFrom", "availableFrom"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/configures", "configures"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/contains", "contains"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/coordinatedBy", "coordinatedBy"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/copiedTo", "copiedTo"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/delegatedTo", "delegatedTo"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/dependsOn", "dependsOn"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/descendantOf", "descendantOf"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/describes", "describes"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/doesNotAffect", "doesNotAffect"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/expandsTo", "expandsTo"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/exploitCreatedBy", "exploitCreatedBy"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/fixedBy", "fixedBy"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/fixedIn", "fixedIn"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/foundBy", "foundBy"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/generates", "generates"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasAddedFile", "hasAddedFile"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasAssessmentFor", "hasAssessmentFor"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasAssociatedVulnerability", "hasAssociatedVulnerability"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasConcludedLicense", "hasConcludedLicense"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasDataFile", "hasDataFile"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasDeclaredLicense", "hasDeclaredLicense"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasDeletedFile", "hasDeletedFile"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasDependencyManifest", "hasDependencyManifest"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasDistributionArtifact", "hasDistributionArtifact"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasDocumentation", "hasDocumentation"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasDynamicLink", "hasDynamicLink"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasEvidence", "hasEvidence"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasExample", "hasExample"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasHost", "hasHost"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasInput", "hasInput"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasMetadata", "hasMetadata"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasOptionalComponent", "hasOptionalComponent"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasOptionalDependency", "hasOptionalDependency"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasOutput", "hasOutput"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasPrerequisite", "hasPrerequisite"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasProvidedDependency", "hasProvidedDependency"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasRequirement", "hasRequirement"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasSpecification", "hasSpecification"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasStaticLink", "hasStaticLink"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasTest", "hasTest"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasTestCase", "hasTestCase"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasVariant", "hasVariant"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/invokedBy", "invokedBy"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/modifiedBy", "modifiedBy"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/other", "other"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/packagedBy", "packagedBy"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/patchedBy", "patchedBy"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/publishedBy", "publishedBy"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/reportedBy", "reportedBy"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/republishedBy", "republishedBy"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/serializedInArtifact", "serializedInArtifact"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/testedOn", "testedOn"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/trainedOn", "trainedOn"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/underInvestigationFor", "underInvestigationFor"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/usesTool", "usesTool"),
> +                ]),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/relationshipTyp=
e",
> +            min_count=3D1,
> +            compact=3D"relationshipType",
> +        )
> +        # Specifies the time from which an element is applicable / valid=
.
> +        cls._add_property(
> +            "startTime",
> +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:=
\d\dZ$",),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/startTime",
> +            compact=3D"startTime",
> +        )
> +        # References an Element on the right-hand side of a relationship=
.
> +        cls._add_property(
> +            "to",
> +            ListProp(ObjectProp(Element, False, context=3D[
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoneElement"=
, "NoneElement"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing=
/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing=
/NoneLicense", "expandedlicensing_NoneLicense"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganiza=
tion", "SpdxOrganization"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoAssertionE=
lement", "NoAssertionElement"),
> +                ],)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/to",
> +            min_count=3D1,
> +            compact=3D"to",
> +        )
> +
> +
> +# Indicates whether a relationship is known to be complete, incomplete, =
or if no assertion is made with respect to relationship completeness.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipCompletenes=
s", compact_type=3D"RelationshipCompleteness", abstract=3DFalse)
> +class RelationshipCompleteness(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +        "complete": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipC=
ompleteness/complete",
> +        "incomplete": "https://spdx.org/rdf/3.0.1/terms/Core/Relationshi=
pCompleteness/incomplete",
> +        "noAssertion": "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipCompleteness/noAssertion",
> +    }
> +    # The relationship is known to be exhaustive.
> +    complete =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipComp=
leteness/complete"
> +    # The relationship is known not to be exhaustive.
> +    incomplete =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipCo=
mpleteness/incomplete"
> +    # No assertion can be made about the completeness of the relationshi=
p.
> +    noAssertion =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipC=
ompleteness/noAssertion"
> +
> +
> +# Information about the relationship between two Elements.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType", comp=
act_type=3D"RelationshipType", abstract=3DFalse)
> +class RelationshipType(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +        "affects": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/affects",
> +        "amendedBy": "https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/amendedBy",
> +        "ancestorOf": "https://spdx.org/rdf/3.0.1/terms/Core/Relationshi=
pType/ancestorOf",
> +        "availableFrom": "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipType/availableFrom",
> +        "configures": "https://spdx.org/rdf/3.0.1/terms/Core/Relationshi=
pType/configures",
> +        "contains": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipT=
ype/contains",
> +        "coordinatedBy": "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipType/coordinatedBy",
> +        "copiedTo": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipT=
ype/copiedTo",
> +        "delegatedTo": "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipType/delegatedTo",
> +        "dependsOn": "https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/dependsOn",
> +        "descendantOf": "https://spdx.org/rdf/3.0.1/terms/Core/Relations=
hipType/descendantOf",
> +        "describes": "https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/describes",
> +        "doesNotAffect": "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipType/doesNotAffect",
> +        "expandsTo": "https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/expandsTo",
> +        "exploitCreatedBy": "https://spdx.org/rdf/3.0.1/terms/Core/Relat=
ionshipType/exploitCreatedBy",
> +        "fixedBy": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/fixedBy",
> +        "fixedIn": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/fixedIn",
> +        "foundBy": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/foundBy",
> +        "generates": "https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/generates",
> +        "hasAddedFile": "https://spdx.org/rdf/3.0.1/terms/Core/Relations=
hipType/hasAddedFile",
> +        "hasAssessmentFor": "https://spdx.org/rdf/3.0.1/terms/Core/Relat=
ionshipType/hasAssessmentFor",
> +        "hasAssociatedVulnerability": "https://spdx.org/rdf/3.0.1/terms/=
Core/RelationshipType/hasAssociatedVulnerability",
> +        "hasConcludedLicense": "https://spdx.org/rdf/3.0.1/terms/Core/Re=
lationshipType/hasConcludedLicense",
> +        "hasDataFile": "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipType/hasDataFile",
> +        "hasDeclaredLicense": "https://spdx.org/rdf/3.0.1/terms/Core/Rel=
ationshipType/hasDeclaredLicense",
> +        "hasDeletedFile": "https://spdx.org/rdf/3.0.1/terms/Core/Relatio=
nshipType/hasDeletedFile",
> +        "hasDependencyManifest": "https://spdx.org/rdf/3.0.1/terms/Core/=
RelationshipType/hasDependencyManifest",
> +        "hasDistributionArtifact": "https://spdx.org/rdf/3.0.1/terms/Cor=
e/RelationshipType/hasDistributionArtifact",
> +        "hasDocumentation": "https://spdx.org/rdf/3.0.1/terms/Core/Relat=
ionshipType/hasDocumentation",
> +        "hasDynamicLink": "https://spdx.org/rdf/3.0.1/terms/Core/Relatio=
nshipType/hasDynamicLink",
> +        "hasEvidence": "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipType/hasEvidence",
> +        "hasExample": "https://spdx.org/rdf/3.0.1/terms/Core/Relationshi=
pType/hasExample",
> +        "hasHost": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasHost",
> +        "hasInput": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipT=
ype/hasInput",
> +        "hasMetadata": "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipType/hasMetadata",
> +        "hasOptionalComponent": "https://spdx.org/rdf/3.0.1/terms/Core/R=
elationshipType/hasOptionalComponent",
> +        "hasOptionalDependency": "https://spdx.org/rdf/3.0.1/terms/Core/=
RelationshipType/hasOptionalDependency",
> +        "hasOutput": "https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasOutput",
> +        "hasPrerequisite": "https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasPrerequisite",
> +        "hasProvidedDependency": "https://spdx.org/rdf/3.0.1/terms/Core/=
RelationshipType/hasProvidedDependency",
> +        "hasRequirement": "https://spdx.org/rdf/3.0.1/terms/Core/Relatio=
nshipType/hasRequirement",
> +        "hasSpecification": "https://spdx.org/rdf/3.0.1/terms/Core/Relat=
ionshipType/hasSpecification",
> +        "hasStaticLink": "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipType/hasStaticLink",
> +        "hasTest": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasTest",
> +        "hasTestCase": "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipType/hasTestCase",
> +        "hasVariant": "https://spdx.org/rdf/3.0.1/terms/Core/Relationshi=
pType/hasVariant",
> +        "invokedBy": "https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/invokedBy",
> +        "modifiedBy": "https://spdx.org/rdf/3.0.1/terms/Core/Relationshi=
pType/modifiedBy",
> +        "other": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType=
/other",
> +        "packagedBy": "https://spdx.org/rdf/3.0.1/terms/Core/Relationshi=
pType/packagedBy",
> +        "patchedBy": "https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/patchedBy",
> +        "publishedBy": "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipType/publishedBy",
> +        "reportedBy": "https://spdx.org/rdf/3.0.1/terms/Core/Relationshi=
pType/reportedBy",
> +        "republishedBy": "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipType/republishedBy",
> +        "serializedInArtifact": "https://spdx.org/rdf/3.0.1/terms/Core/R=
elationshipType/serializedInArtifact",
> +        "testedOn": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipT=
ype/testedOn",
> +        "trainedOn": "https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/trainedOn",
> +        "underInvestigationFor": "https://spdx.org/rdf/3.0.1/terms/Core/=
RelationshipType/underInvestigationFor",
> +        "usesTool": "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipT=
ype/usesTool",
> +    }
> +    # The `from` Vulnerability affects each `to` Element. The use of the=
 `affects` type is constrained to `VexAffectedVulnAssessmentRelationship` c=
lassed relationships.
> +    affects =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/=
affects"
> +    # The `from` Element is amended by each `to` Element.
> +    amendedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTyp=
e/amendedBy"
> +    # The `from` Element is an ancestor of each `to` Element.
> +    ancestorOf =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/ancestorOf"
> +    # The `from` Element is available from the additional supplier descr=
ibed by each `to` Element.
> +    availableFrom =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationshi=
pType/availableFrom"
> +    # The `from` Element is a configuration applied to each `to` Element=
, during a LifecycleScopeType period.
> +    configures =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/configures"
> +    # The `from` Element contains each `to` Element.
> +    contains =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType=
/contains"
> +    # The `from` Vulnerability is coordinatedBy the `to` Agent(s) (vendo=
r, researcher, or consumer agent).
> +    coordinatedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationshi=
pType/coordinatedBy"
> +    # The `from` Element has been copied to each `to` Element.
> +    copiedTo =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType=
/copiedTo"
> +    # The `from` Agent is delegating an action to the Agent of the `to` =
Relationship (which must be of type invokedBy), during a LifecycleScopeType=
 (e.g. the `to` invokedBy Relationship is being done on behalf of `from`).
> +    delegatedTo =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipT=
ype/delegatedTo"
> +    # The `from` Element depends on each `to` Element, during a Lifecycl=
eScopeType period.
> +    dependsOn =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTyp=
e/dependsOn"
> +    # The `from` Element is a descendant of each `to` Element.
> +    descendantOf =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/descendantOf"
> +    # The `from` Element describes each `to` Element. To denote the root=
(s) of a tree of elements in a collection, the rootElement property should =
be used.
> +    describes =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTyp=
e/describes"
> +    # The `from` Vulnerability has no impact on each `to` Element. The u=
se of the `doesNotAffect` is constrained to `VexNotAffectedVulnAssessmentRe=
lationship` classed relationships.
> +    doesNotAffect =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationshi=
pType/doesNotAffect"
> +    # The `from` archive expands out as an artifact described by each `t=
o` Element.
> +    expandsTo =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTyp=
e/expandsTo"
> +    # The `from` Vulnerability has had an exploit created against it by =
each `to` Agent.
> +    exploitCreatedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipType/exploitCreatedBy"
> +    # Designates a `from` Vulnerability has been fixed by the `to` Agent=
(s).
> +    fixedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/=
fixedBy"
> +    # A `from` Vulnerability has been fixed in each `to` Element. The us=
e of the `fixedIn` type is constrained to `VexFixedVulnAssessmentRelationsh=
ip` classed relationships.
> +    fixedIn =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/=
fixedIn"
> +    # Designates a `from` Vulnerability was originally discovered by the=
 `to` Agent(s).
> +    foundBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/=
foundBy"
> +    # The `from` Element generates each `to` Element.
> +    generates =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTyp=
e/generates"
> +    # Every `to` Element is a file added to the `from` Element (`from` h=
asAddedFile `to`).
> +    hasAddedFile =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationship=
Type/hasAddedFile"
> +    # Relates a `from` Vulnerability and each `to` Element with a securi=
ty assessment. To be used with `VulnAssessmentRelationship` types.
> +    hasAssessmentFor =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipType/hasAssessmentFor"
> +    # Used to associate a `from` Artifact with each `to` Vulnerability.
> +    hasAssociatedVulnerability =3D "https://spdx.org/rdf/3.0.1/terms/Cor=
e/RelationshipType/hasAssociatedVulnerability"
> +    # The `from` SoftwareArtifact is concluded by the SPDX data creator =
to be governed by each `to` license.
> +    hasConcludedLicense =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relat=
ionshipType/hasConcludedLicense"
> +    # The `from` Element treats each `to` Element as a data file. A data=
 file is an artifact that stores data required or optional for the `from` E=
lement's functionality. A data file can be a database file, an index file, =
a log file, an AI model file, a calibration data file, a temporary file, a =
backup file, and more. For AI training dataset, test dataset, test artifact=
, configuration data, build input data, and build output data, please consi=
der using the more specific relationship types: `trainedOn`, `testedOn`, `h=
asTest`, `configures`, `hasInput`, and `hasOutput`, respectively. This rela=
tionship does not imply dependency.
> +    hasDataFile =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipT=
ype/hasDataFile"
> +    # The `from` SoftwareArtifact was discovered to actually contain eac=
h `to` license, for example as detected by use of automated tooling.
> +    hasDeclaredLicense =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relati=
onshipType/hasDeclaredLicense"
> +    # Every `to` Element is a file deleted from the `from` Element (`fro=
m` hasDeletedFile `to`).
> +    hasDeletedFile =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipType/hasDeletedFile"
> +    # The `from` Element has manifest files that contain dependency info=
rmation in each `to` Element.
> +    hasDependencyManifest =3D "https://spdx.org/rdf/3.0.1/terms/Core/Rel=
ationshipType/hasDependencyManifest"
> +    # The `from` Element is distributed as an artifact in each `to` Elem=
ent (e.g. an RPM or archive file).
> +    hasDistributionArtifact =3D "https://spdx.org/rdf/3.0.1/terms/Core/R=
elationshipType/hasDistributionArtifact"
> +    # The `from` Element is documented by each `to` Element.
> +    hasDocumentation =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipType/hasDocumentation"
> +    # The `from` Element dynamically links in each `to` Element, during =
a LifecycleScopeType period.
> +    hasDynamicLink =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipType/hasDynamicLink"
> +    # Every `to` Element is considered as evidence for the `from` Elemen=
t (`from` hasEvidence `to`).
> +    hasEvidence =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipT=
ype/hasEvidence"
> +    # Every `to` Element is an example for the `from` Element (`from` ha=
sExample `to`).
> +    hasExample =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasExample"
> +    # The `from` Build was run on the `to` Element during a LifecycleSco=
peType period (e.g. the host that the build runs on).
> +    hasHost =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/=
hasHost"
> +    # The `from` Build has each `to` Element as an input, during a Lifec=
ycleScopeType period.
> +    hasInput =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType=
/hasInput"
> +    # Every `to` Element is metadata about the `from` Element (`from` ha=
sMetadata `to`).
> +    hasMetadata =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipT=
ype/hasMetadata"
> +    # Every `to` Element is an optional component of the `from` Element =
(`from` hasOptionalComponent `to`).
> +    hasOptionalComponent =3D "https://spdx.org/rdf/3.0.1/terms/Core/Rela=
tionshipType/hasOptionalComponent"
> +    # The `from` Element optionally depends on each `to` Element, during=
 a LifecycleScopeType period.
> +    hasOptionalDependency =3D "https://spdx.org/rdf/3.0.1/terms/Core/Rel=
ationshipType/hasOptionalDependency"
> +    # The `from` Build element generates each `to` Element as an output,=
 during a LifecycleScopeType period.
> +    hasOutput =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTyp=
e/hasOutput"
> +    # The `from` Element has a prerequisite on each `to` Element, during=
 a LifecycleScopeType period.
> +    hasPrerequisite =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relations=
hipType/hasPrerequisite"
> +    # The `from` Element has a dependency on each `to` Element, dependen=
cy is not in the distributed artifact, but assumed to be provided, during a=
 LifecycleScopeType period.
> +    hasProvidedDependency =3D "https://spdx.org/rdf/3.0.1/terms/Core/Rel=
ationshipType/hasProvidedDependency"
> +    # The `from` Element has a requirement on each `to` Element, during =
a LifecycleScopeType period.
> +    hasRequirement =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationsh=
ipType/hasRequirement"
> +    # Every `to` Element is a specification for the `from` Element (`fro=
m` hasSpecification `to`), during a LifecycleScopeType period.
> +    hasSpecification =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relation=
shipType/hasSpecification"
> +    # The `from` Element statically links in each `to` Element, during a=
 LifecycleScopeType period.
> +    hasStaticLink =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationshi=
pType/hasStaticLink"
> +    # Every `to` Element is a test artifact for the `from` Element (`fro=
m` hasTest `to`), during a LifecycleScopeType period.
> +    hasTest =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/=
hasTest"
> +    # Every `to` Element is a test case for the `from` Element (`from` h=
asTestCase `to`).
> +    hasTestCase =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipT=
ype/hasTestCase"
> +    # Every `to` Element is a variant the `from` Element (`from` hasVari=
ant `to`).
> +    hasVariant =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/hasVariant"
> +    # The `from` Element was invoked by the `to` Agent, during a Lifecyc=
leScopeType period (for example, a Build element that describes a build ste=
p).
> +    invokedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTyp=
e/invokedBy"
> +    # The `from` Element is modified by each `to` Element.
> +    modifiedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/modifiedBy"
> +    # Every `to` Element is related to the `from` Element where the rela=
tionship type is not described by any of the SPDX relationship types (this =
relationship is directionless).
> +    other =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType/ot=
her"
> +    # Every `to` Element is a packaged instance of the `from` Element (`=
from` packagedBy `to`).
> +    packagedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/packagedBy"
> +    # Every `to` Element is a patch for the `from` Element (`from` patch=
edBy `to`).
> +    patchedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTyp=
e/patchedBy"
> +    # Designates a `from` Vulnerability was made available for public us=
e or reference by each `to` Agent.
> +    publishedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipT=
ype/publishedBy"
> +    # Designates a `from` Vulnerability was first reported to a project,=
 vendor, or tracking database for formal identification by each `to` Agent.
> +    reportedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTy=
pe/reportedBy"
> +    # Designates a `from` Vulnerability's details were tracked, aggregat=
ed, and/or enriched to improve context (i.e. NVD) by each `to` Agent.
> +    republishedBy =3D "https://spdx.org/rdf/3.0.1/terms/Core/Relationshi=
pType/republishedBy"
> +    # The `from` SpdxDocument can be found in a serialized form in each =
`to` Artifact.
> +    serializedInArtifact =3D "https://spdx.org/rdf/3.0.1/terms/Core/Rela=
tionshipType/serializedInArtifact"
> +    # The `from` Element has been tested on the `to` Element(s).
> +    testedOn =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType=
/testedOn"
> +    # The `from` Element has been trained on the `to` Element(s).
> +    trainedOn =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipTyp=
e/trainedOn"
> +    # The `from` Vulnerability impact is being investigated for each `to=
` Element. The use of the `underInvestigationFor` type is constrained to `V=
exUnderInvestigationVulnAssessmentRelationship` classed relationships.
> +    underInvestigationFor =3D "https://spdx.org/rdf/3.0.1/terms/Core/Rel=
ationshipType/underInvestigationFor"
> +    # The `from` Element uses each `to` Element as a tool, during a Life=
cycleScopeType period.
> +    usesTool =3D "https://spdx.org/rdf/3.0.1/terms/Core/RelationshipType=
/usesTool"
> +
> +
> +# A collection of SPDX Elements that could potentially be serialized.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/SpdxDocument", compact_=
type=3D"SpdxDocument", abstract=3DFalse)
> +class SpdxDocument(ElementCollection):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Provides the license under which the SPDX documentation of the=
 Element can be
> +        # used.
> +        cls._add_property(
> +            "dataLicense",
> +            ObjectProp(simplelicensing_AnyLicenseInfo, False, context=3D=
[
> +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing=
/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing=
/NoneLicense", "expandedlicensing_NoneLicense"),
> +                ],),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/dataLicense",
> +            compact=3D"dataLicense",
> +        )
> +        # Provides an ExternalMap of Element identifiers.
> +        cls._add_property(
> +            "import_",
> +            ListProp(ObjectProp(ExternalMap, False)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/import",
> +            compact=3D"import",
> +        )
> +        # Provides a NamespaceMap of prefixes and associated namespace p=
artial URIs applicable to an SpdxDocument and independent of any specific s=
erialization format or instance.
> +        cls._add_property(
> +            "namespaceMap",
> +            ListProp(ObjectProp(NamespaceMap, False)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/namespaceMap",
> +            compact=3D"namespaceMap",
> +        )
> +
> +
> +# Indicates the type of support that is associated with an artifact.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/SupportType", compact_t=
ype=3D"SupportType", abstract=3DFalse)
> +class SupportType(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +        "deployed": "https://spdx.org/rdf/3.0.1/terms/Core/SupportType/d=
eployed",
> +        "development": "https://spdx.org/rdf/3.0.1/terms/Core/SupportTyp=
e/development",
> +        "endOfSupport": "https://spdx.org/rdf/3.0.1/terms/Core/SupportTy=
pe/endOfSupport",
> +        "limitedSupport": "https://spdx.org/rdf/3.0.1/terms/Core/Support=
Type/limitedSupport",
> +        "noAssertion": "https://spdx.org/rdf/3.0.1/terms/Core/SupportTyp=
e/noAssertion",
> +        "noSupport": "https://spdx.org/rdf/3.0.1/terms/Core/SupportType/=
noSupport",
> +        "support": "https://spdx.org/rdf/3.0.1/terms/Core/SupportType/su=
pport",
> +    }
> +    # in addition to being supported by the supplier, the software is kn=
own to have been deployed and is in use.  For a software as a service provi=
der, this implies the software is now available as a service.
> +    deployed =3D "https://spdx.org/rdf/3.0.1/terms/Core/SupportType/depl=
oyed"
> +    # the artifact is in active development and is not considered ready =
for formal support from the supplier.
> +    development =3D "https://spdx.org/rdf/3.0.1/terms/Core/SupportType/d=
evelopment"
> +    # there is a defined end of support for the artifact from the suppli=
er.  This may also be referred to as end of life. There is a validUntilDate=
 that can be used to signal when support ends for the artifact.
> +    endOfSupport =3D "https://spdx.org/rdf/3.0.1/terms/Core/SupportType/=
endOfSupport"
> +    # the artifact has been released, and there is limited support avail=
able from the supplier. There is a validUntilDate that can provide addition=
al information about the duration of support.
> +    limitedSupport =3D "https://spdx.org/rdf/3.0.1/terms/Core/SupportTyp=
e/limitedSupport"
> +    # no assertion about the type of support is made.   This is consider=
ed the default if no other support type is used.
> +    noAssertion =3D "https://spdx.org/rdf/3.0.1/terms/Core/SupportType/n=
oAssertion"
> +    # there is no support for the artifact from the supplier, consumer a=
ssumes any support obligations.
> +    noSupport =3D "https://spdx.org/rdf/3.0.1/terms/Core/SupportType/noS=
upport"
> +    # the artifact has been released, and is supported from the supplier=
.   There is a validUntilDate that can provide additional information about=
 the duration of support.
> +    support =3D "https://spdx.org/rdf/3.0.1/terms/Core/SupportType/suppo=
rt"
> +
> +
> +# An element of hardware and/or software utilized to carry out a particu=
lar function.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/Tool", compact_type=3D"=
Tool", abstract=3DFalse)
> +class Tool(Element):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +
> +# Categories of confidentiality level.
> +@register("https://spdx.org/rdf/3.0.1/terms/Dataset/ConfidentialityLevel=
Type", compact_type=3D"dataset_ConfidentialityLevelType", abstract=3DFalse)
> +class dataset_ConfidentialityLevelType(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +        "amber": "https://spdx.org/rdf/3.0.1/terms/Dataset/Confidentiali=
tyLevelType/amber",
> +        "clear": "https://spdx.org/rdf/3.0.1/terms/Dataset/Confidentiali=
tyLevelType/clear",
> +        "green": "https://spdx.org/rdf/3.0.1/terms/Dataset/Confidentiali=
tyLevelType/green",
> +        "red": "https://spdx.org/rdf/3.0.1/terms/Dataset/Confidentiality=
LevelType/red",
> +    }
> +    # Data points in the dataset can be shared only with specific organi=
zations and their clients on a need to know basis.
> +    amber =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/ConfidentialityL=
evelType/amber"
> +    # Dataset may be distributed freely, without restriction.
> +    clear =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/ConfidentialityL=
evelType/clear"
> +    # Dataset can be shared within a community of peers and partners.
> +    green =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/ConfidentialityL=
evelType/green"
> +    # Data points in the dataset are highly confidential and can only be=
 shared with named recipients.
> +    red =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/ConfidentialityLev=
elType/red"
> +
> +
> +# Availability of dataset.
> +@register("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetAvailabilityT=
ype", compact_type=3D"dataset_DatasetAvailabilityType", abstract=3DFalse)
> +class dataset_DatasetAvailabilityType(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +        "clickthrough": "https://spdx.org/rdf/3.0.1/terms/Dataset/Datase=
tAvailabilityType/clickthrough",
> +        "directDownload": "https://spdx.org/rdf/3.0.1/terms/Dataset/Data=
setAvailabilityType/directDownload",
> +        "query": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetAvaila=
bilityType/query",
> +        "registration": "https://spdx.org/rdf/3.0.1/terms/Dataset/Datase=
tAvailabilityType/registration",
> +        "scrapingScript": "https://spdx.org/rdf/3.0.1/terms/Dataset/Data=
setAvailabilityType/scrapingScript",
> +    }
> +    # the dataset is not publicly available and can only be accessed aft=
er affirmatively accepting terms on a clickthrough webpage.
> +    clickthrough =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetAv=
ailabilityType/clickthrough"
> +    # the dataset is publicly available and can be downloaded directly.
> +    directDownload =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/Dataset=
AvailabilityType/directDownload"
> +    # the dataset is publicly available, but not all at once, and can on=
ly be accessed through queries which return parts of the dataset.
> +    query =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetAvailabil=
ityType/query"
> +    # the dataset is not publicly available and an email registration is=
 required before accessing the dataset, although without an affirmative acc=
eptance of terms.
> +    registration =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetAv=
ailabilityType/registration"
> +    # the dataset provider is not making available the underlying data a=
nd the dataset must be reassembled, typically using the provided script for=
 scraping the data.
> +    scrapingScript =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/Dataset=
AvailabilityType/scrapingScript"
> +
> +
> +# Enumeration of dataset types.
> +@register("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType", compac=
t_type=3D"dataset_DatasetType", abstract=3DFalse)
> +class dataset_DatasetType(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +        "audio": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/a=
udio",
> +        "categorical": "https://spdx.org/rdf/3.0.1/terms/Dataset/Dataset=
Type/categorical",
> +        "graph": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/g=
raph",
> +        "image": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/i=
mage",
> +        "noAssertion": "https://spdx.org/rdf/3.0.1/terms/Dataset/Dataset=
Type/noAssertion",
> +        "numeric": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType=
/numeric",
> +        "other": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/o=
ther",
> +        "sensor": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/=
sensor",
> +        "structured": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetT=
ype/structured",
> +        "syntactic": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTy=
pe/syntactic",
> +        "text": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/te=
xt",
> +        "timeseries": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetT=
ype/timeseries",
> +        "timestamp": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTy=
pe/timestamp",
> +        "video": "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/v=
ideo",
> +    }
> +    # data is audio based, such as a collection of music from the 80s.
> +    audio =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/audi=
o"
> +    # data that is classified into a discrete number of categories, such=
 as the eye color of a population of people.
> +    categorical =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTyp=
e/categorical"
> +    # data is in the form of a graph where entries are somehow related t=
o each other through edges, such a social network of friends.
> +    graph =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/grap=
h"
> +    # data is a collection of images such as pictures of animals.
> +    image =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/imag=
e"
> +    # data type is not known.
> +    noAssertion =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTyp=
e/noAssertion"
> +    # data consists only of numeric entries.
> +    numeric =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/nu=
meric"
> +    # data is of a type not included in this list.
> +    other =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/othe=
r"
> +    # data is recorded from a physical sensor, such as a thermometer rea=
ding or biometric device.
> +    sensor =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/sen=
sor"
> +    # data is stored in tabular format or retrieved from a relational da=
tabase.
> +    structured =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType=
/structured"
> +    # data describes the syntax or semantics of a language or text, such=
 as a parse tree used for natural language processing.
> +    syntactic =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/=
syntactic"
> +    # data consists of unstructured text, such as a book, Wikipedia arti=
cle (without images), or transcript.
> +    text =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/text"
> +    # data is recorded in an ordered sequence of timestamped entries, su=
ch as the price of a stock over the course of a day.
> +    timeseries =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType=
/timeseries"
> +    # data is recorded with a timestamp for each entry, but not necessar=
ily ordered or at specific intervals, such as when a taxi ride starts and e=
nds.
> +    timestamp =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/=
timestamp"
> +    # data is video based, such as a collection of movie clips featuring=
 Tom Hanks.
> +    video =3D "https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetType/vide=
o"
> +
> +
> +# Abstract class for additional text intended to be added to a License, =
but
> +# which is not itself a standalone License.
> +@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/LicenseAdd=
ition", compact_type=3D"expandedlicensing_LicenseAddition", abstract=3DTrue=
)
> +class expandedlicensing_LicenseAddition(Element):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Identifies the full text of a LicenseAddition.
> +        cls._add_property(
> +            "expandedlicensing_additionText",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/ad=
ditionText",
> +            min_count=3D1,
> +            compact=3D"expandedlicensing_additionText",
> +        )
> +        # Specifies whether an additional text identifier has been marke=
d as deprecated.
> +        cls._add_property(
> +            "expandedlicensing_isDeprecatedAdditionId",
> +            BooleanProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/is=
DeprecatedAdditionId",
> +            compact=3D"expandedlicensing_isDeprecatedAdditionId",
> +        )
> +        # Identifies all the text and metadata associated with a license=
 in the license
> +        # XML format.
> +        cls._add_property(
> +            "expandedlicensing_licenseXml",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/li=
censeXml",
> +            compact=3D"expandedlicensing_licenseXml",
> +        )
> +        # Specifies the licenseId that is preferred to be used in place =
of a deprecated
> +        # License or LicenseAddition.
> +        cls._add_property(
> +            "expandedlicensing_obsoletedBy",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/ob=
soletedBy",
> +            compact=3D"expandedlicensing_obsoletedBy",
> +        )
> +        # Contains a URL where the License or LicenseAddition can be fou=
nd in use.
> +        cls._add_property(
> +            "expandedlicensing_seeAlso",
> +            ListProp(AnyURIProp()),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/se=
eAlso",
> +            compact=3D"expandedlicensing_seeAlso",
> +        )
> +        # Identifies the full text of a LicenseAddition, in SPDX templat=
ing format.
> +        cls._add_property(
> +            "expandedlicensing_standardAdditionTemplate",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/st=
andardAdditionTemplate",
> +            compact=3D"expandedlicensing_standardAdditionTemplate",
> +        )
> +
> +
> +# A license exception that is listed on the SPDX Exceptions list.
> +@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/ListedLice=
nseException", compact_type=3D"expandedlicensing_ListedLicenseException", a=
bstract=3DFalse)
> +class expandedlicensing_ListedLicenseException(expandedlicensing_License=
Addition):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Specifies the SPDX License List version in which this license =
or exception
> +        # identifier was deprecated.
> +        cls._add_property(
> +            "expandedlicensing_deprecatedVersion",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/de=
precatedVersion",
> +            compact=3D"expandedlicensing_deprecatedVersion",
> +        )
> +        # Specifies the SPDX License List version in which this ListedLi=
cense or
> +        # ListedLicenseException identifier was first added.
> +        cls._add_property(
> +            "expandedlicensing_listVersionAdded",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/li=
stVersionAdded",
> +            compact=3D"expandedlicensing_listVersionAdded",
> +        )
> +
> +
> +# A property name with an associated value.
> +@register("https://spdx.org/rdf/3.0.1/terms/Extension/CdxPropertyEntry",=
 compact_type=3D"extension_CdxPropertyEntry", abstract=3DFalse)
> +class extension_CdxPropertyEntry(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # A name used in a CdxPropertyEntry name-value pair.
> +        cls._add_property(
> +            "extension_cdxPropName",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Extension/cdxPropNam=
e",
> +            min_count=3D1,
> +            compact=3D"extension_cdxPropName",
> +        )
> +        # A value used in a CdxPropertyEntry name-value pair.
> +        cls._add_property(
> +            "extension_cdxPropValue",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Extension/cdxPropVal=
ue",
> +            compact=3D"extension_cdxPropValue",
> +        )
> +
> +
> +# A characterization of some aspect of an Element that is associated wit=
h the Element in a generalized fashion.
> +@register("https://spdx.org/rdf/3.0.1/terms/Extension/Extension", compac=
t_type=3D"extension_Extension", abstract=3DTrue)
> +class extension_Extension(SHACLExtensibleObject, SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +
> +# Specifies the CVSS base, temporal, threat, or environmental severity t=
ype.
> +@register("https://spdx.org/rdf/3.0.1/terms/Security/CvssSeverityType", =
compact_type=3D"security_CvssSeverityType", abstract=3DFalse)
> +class security_CvssSeverityType(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +        "critical": "https://spdx.org/rdf/3.0.1/terms/Security/CvssSever=
ityType/critical",
> +        "high": "https://spdx.org/rdf/3.0.1/terms/Security/CvssSeverityT=
ype/high",
> +        "low": "https://spdx.org/rdf/3.0.1/terms/Security/CvssSeverityTy=
pe/low",
> +        "medium": "https://spdx.org/rdf/3.0.1/terms/Security/CvssSeverit=
yType/medium",
> +        "none": "https://spdx.org/rdf/3.0.1/terms/Security/CvssSeverityT=
ype/none",
> +    }
> +    # When a CVSS score is between 9.0 - 10.0
> +    critical =3D "https://spdx.org/rdf/3.0.1/terms/Security/CvssSeverity=
Type/critical"
> +    # When a CVSS score is between 7.0 - 8.9
> +    high =3D "https://spdx.org/rdf/3.0.1/terms/Security/CvssSeverityType=
/high"
> +    # When a CVSS score is between 0.1 - 3.9
> +    low =3D "https://spdx.org/rdf/3.0.1/terms/Security/CvssSeverityType/=
low"
> +    # When a CVSS score is between 4.0 - 6.9
> +    medium =3D "https://spdx.org/rdf/3.0.1/terms/Security/CvssSeverityTy=
pe/medium"
> +    # When a CVSS score is 0.0
> +    none =3D "https://spdx.org/rdf/3.0.1/terms/Security/CvssSeverityType=
/none"
> +
> +
> +# Specifies the exploit catalog type.
> +@register("https://spdx.org/rdf/3.0.1/terms/Security/ExploitCatalogType"=
, compact_type=3D"security_ExploitCatalogType", abstract=3DFalse)
> +class security_ExploitCatalogType(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +        "kev": "https://spdx.org/rdf/3.0.1/terms/Security/ExploitCatalog=
Type/kev",
> +        "other": "https://spdx.org/rdf/3.0.1/terms/Security/ExploitCatal=
ogType/other",
> +    }
> +    # CISA's Known Exploited Vulnerability (KEV) Catalog
> +    kev =3D "https://spdx.org/rdf/3.0.1/terms/Security/ExploitCatalogTyp=
e/kev"
> +    # Other exploit catalogs
> +    other =3D "https://spdx.org/rdf/3.0.1/terms/Security/ExploitCatalogT=
ype/other"
> +
> +
> +# Specifies the SSVC decision type.
> +@register("https://spdx.org/rdf/3.0.1/terms/Security/SsvcDecisionType", =
compact_type=3D"security_SsvcDecisionType", abstract=3DFalse)
> +class security_SsvcDecisionType(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +        "act": "https://spdx.org/rdf/3.0.1/terms/Security/SsvcDecisionTy=
pe/act",
> +        "attend": "https://spdx.org/rdf/3.0.1/terms/Security/SsvcDecisio=
nType/attend",
> +        "track": "https://spdx.org/rdf/3.0.1/terms/Security/SsvcDecision=
Type/track",
> +        "trackStar": "https://spdx.org/rdf/3.0.1/terms/Security/SsvcDeci=
sionType/trackStar",
> +    }
> +    # The vulnerability requires attention from the organization's inter=
nal, supervisory-level and leadership-level individuals. Necessary actions =
include requesting assistance or information about the vulnerability, as we=
ll as publishing a notification either internally and/or externally. Typica=
lly, internal groups would meet to determine the overall response and then =
execute agreed upon actions. CISA recommends remediating Act vulnerabilitie=
s as soon as possible.
> +    act =3D "https://spdx.org/rdf/3.0.1/terms/Security/SsvcDecisionType/=
act"
> +    # The vulnerability requires attention from the organization's inter=
nal, supervisory-level individuals. Necessary actions include requesting as=
sistance or information about the vulnerability, and may involve publishing=
 a notification either internally and/or externally. CISA recommends remedi=
ating Attend vulnerabilities sooner than standard update timelines.
> +    attend =3D "https://spdx.org/rdf/3.0.1/terms/Security/SsvcDecisionTy=
pe/attend"
> +    # The vulnerability does not require action at this time. The organi=
zation would continue to track the vulnerability and reassess it if new inf=
ormation becomes available. CISA recommends remediating Track vulnerabiliti=
es within standard update timelines.
> +    track =3D "https://spdx.org/rdf/3.0.1/terms/Security/SsvcDecisionTyp=
e/track"
> +    # ("Track\*" in the SSVC spec) The vulnerability contains specific c=
haracteristics that may require closer monitoring for changes. CISA recomme=
nds remediating Track\* vulnerabilities within standard update timelines.
> +    trackStar =3D "https://spdx.org/rdf/3.0.1/terms/Security/SsvcDecisio=
nType/trackStar"
> +
> +
> +# Specifies the VEX justification type.
> +@register("https://spdx.org/rdf/3.0.1/terms/Security/VexJustificationTyp=
e", compact_type=3D"security_VexJustificationType", abstract=3DFalse)
> +class security_VexJustificationType(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +        "componentNotPresent": "https://spdx.org/rdf/3.0.1/terms/Securit=
y/VexJustificationType/componentNotPresent",
> +        "inlineMitigationsAlreadyExist": "https://spdx.org/rdf/3.0.1/ter=
ms/Security/VexJustificationType/inlineMitigationsAlreadyExist",
> +        "vulnerableCodeCannotBeControlledByAdversary": "https://spdx.org=
/rdf/3.0.1/terms/Security/VexJustificationType/vulnerableCodeCannotBeContro=
lledByAdversary",
> +        "vulnerableCodeNotInExecutePath": "https://spdx.org/rdf/3.0.1/te=
rms/Security/VexJustificationType/vulnerableCodeNotInExecutePath",
> +        "vulnerableCodeNotPresent": "https://spdx.org/rdf/3.0.1/terms/Se=
curity/VexJustificationType/vulnerableCodeNotPresent",
> +    }
> +    # The software is not affected because the vulnerable component is n=
ot in the product.
> +    componentNotPresent =3D "https://spdx.org/rdf/3.0.1/terms/Security/V=
exJustificationType/componentNotPresent"
> +    # Built-in inline controls or mitigations prevent an adversary from =
leveraging the vulnerability.
> +    inlineMitigationsAlreadyExist =3D "https://spdx.org/rdf/3.0.1/terms/=
Security/VexJustificationType/inlineMitigationsAlreadyExist"
> +    # The vulnerable component is present, and the component contains th=
e vulnerable code. However, vulnerable code is used in such a way that an a=
ttacker cannot mount any anticipated attack.
> +    vulnerableCodeCannotBeControlledByAdversary =3D "https://spdx.org/rd=
f/3.0.1/terms/Security/VexJustificationType/vulnerableCodeCannotBeControlle=
dByAdversary"
> +    # The affected code is not reachable through the execution of the co=
de, including non-anticipated states of the product.
> +    vulnerableCodeNotInExecutePath =3D "https://spdx.org/rdf/3.0.1/terms=
/Security/VexJustificationType/vulnerableCodeNotInExecutePath"
> +    # The product is not affected because the code underlying the vulner=
ability is not present in the product.
> +    vulnerableCodeNotPresent =3D "https://spdx.org/rdf/3.0.1/terms/Secur=
ity/VexJustificationType/vulnerableCodeNotPresent"
> +
> +
> +# Abstract ancestor class for all vulnerability assessments
> +@register("https://spdx.org/rdf/3.0.1/terms/Security/VulnAssessmentRelat=
ionship", compact_type=3D"security_VulnAssessmentRelationship", abstract=3D=
True)
> +class security_VulnAssessmentRelationship(Relationship):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Identifies who or what supplied the artifact or VulnAssessment=
Relationship
> +        # referenced by the Element.
> +        cls._add_property(
> +            "suppliedBy",
> +            ObjectProp(Agent, False, context=3D[
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganiza=
tion", "SpdxOrganization"),
> +                ],),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/suppliedBy",
> +            compact=3D"suppliedBy",
> +        )
> +        # Specifies an Element contained in a piece of software where a =
vulnerability was
> +        # found.
> +        cls._add_property(
> +            "security_assessedElement",
> +            ObjectProp(software_SoftwareArtifact, False),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/assessedEle=
ment",
> +            compact=3D"security_assessedElement",
> +        )
> +        # Specifies a time when a vulnerability assessment was modified
> +        cls._add_property(
> +            "security_modifiedTime",
> +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:=
\d\dZ$",),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/modifiedTim=
e",
> +            compact=3D"security_modifiedTime",
> +        )
> +        # Specifies the time when a vulnerability was published.
> +        cls._add_property(
> +            "security_publishedTime",
> +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:=
\d\dZ$",),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/publishedTi=
me",
> +            compact=3D"security_publishedTime",
> +        )
> +        # Specified the time and date when a vulnerability was withdrawn=
.
> +        cls._add_property(
> +            "security_withdrawnTime",
> +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:=
\d\dZ$",),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/withdrawnTi=
me",
> +            compact=3D"security_withdrawnTime",
> +        )
> +
> +
> +# Abstract class representing a license combination consisting of one or=
 more licenses.
> +@register("https://spdx.org/rdf/3.0.1/terms/SimpleLicensing/AnyLicenseIn=
fo", compact_type=3D"simplelicensing_AnyLicenseInfo", abstract=3DTrue)
> +class simplelicensing_AnyLicenseInfo(Element):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +
> +# An SPDX Element containing an SPDX license expression string.
> +@register("https://spdx.org/rdf/3.0.1/terms/SimpleLicensing/LicenseExpre=
ssion", compact_type=3D"simplelicensing_LicenseExpression", abstract=3DFals=
e)
> +class simplelicensing_LicenseExpression(simplelicensing_AnyLicenseInfo):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Maps a LicenseRef or AdditionRef string for a Custom License o=
r a Custom
> +        # License Addition to its URI ID.
> +        cls._add_property(
> +            "simplelicensing_customIdToUri",
> +            ListProp(ObjectProp(DictionaryEntry, False)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/SimpleLicensing/cust=
omIdToUri",
> +            compact=3D"simplelicensing_customIdToUri",
> +        )
> +        # A string in the license expression format.
> +        cls._add_property(
> +            "simplelicensing_licenseExpression",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/SimpleLicensing/lice=
nseExpression",
> +            min_count=3D1,
> +            compact=3D"simplelicensing_licenseExpression",
> +        )
> +        # The version of the SPDX License List used in the license expre=
ssion.
> +        cls._add_property(
> +            "simplelicensing_licenseListVersion",
> +            StringProp(pattern=3Dr"^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]=
\d*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-z=
A-Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$",),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/SimpleLicensing/lice=
nseListVersion",
> +            compact=3D"simplelicensing_licenseListVersion",
> +        )
> +
> +
> +# A license or addition that is not listed on the SPDX License List.
> +@register("https://spdx.org/rdf/3.0.1/terms/SimpleLicensing/SimpleLicens=
ingText", compact_type=3D"simplelicensing_SimpleLicensingText", abstract=3D=
False)
> +class simplelicensing_SimpleLicensingText(Element):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Identifies the full text of a License or Addition.
> +        cls._add_property(
> +            "simplelicensing_licenseText",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/SimpleLicensing/lice=
nseText",
> +            min_count=3D1,
> +            compact=3D"simplelicensing_licenseText",
> +        )
> +
> +
> +# A canonical, unique, immutable identifier
> +@register("https://spdx.org/rdf/3.0.1/terms/Software/ContentIdentifier",=
 compact_type=3D"software_ContentIdentifier", abstract=3DFalse)
> +class software_ContentIdentifier(IntegrityMethod):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Specifies the type of the content identifier.
> +        cls._add_property(
> +            "software_contentIdentifierType",
> +            EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/ContentI=
dentifierType/gitoid", "gitoid"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/ContentI=
dentifierType/swhid", "swhid"),
> +                ]),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/contentIden=
tifierType",
> +            min_count=3D1,
> +            compact=3D"software_contentIdentifierType",
> +        )
> +        # Specifies the value of the content identifier.
> +        cls._add_property(
> +            "software_contentIdentifierValue",
> +            AnyURIProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/contentIden=
tifierValue",
> +            min_count=3D1,
> +            compact=3D"software_contentIdentifierValue",
> +        )
> +
> +
> +# Specifies the type of a content identifier.
> +@register("https://spdx.org/rdf/3.0.1/terms/Software/ContentIdentifierTy=
pe", compact_type=3D"software_ContentIdentifierType", abstract=3DFalse)
> +class software_ContentIdentifierType(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +        "gitoid": "https://spdx.org/rdf/3.0.1/terms/Software/ContentIden=
tifierType/gitoid",
> +        "swhid": "https://spdx.org/rdf/3.0.1/terms/Software/ContentIdent=
ifierType/swhid",
> +    }
> +    # [Gitoid](https://www.iana.org/assignments/uri-schemes/prov/gitoid)=
, stands for [Git Object ID](https://git-scm.com/book/en/v2/Git-Internals-G=
it-Objects). A gitoid of type blob is a unique hash of a binary artifact. A=
 gitoid may represent either an [Artifact Identifier](https://github.com/om=
nibor/spec/blob/eb1ee5c961c16215eb8709b2975d193a2007a35d/spec/SPEC.md#artif=
act-identifier-types) for the software artifact or an [Input Manifest Ident=
ifier](https://github.com/omnibor/spec/blob/eb1ee5c961c16215eb8709b2975d193=
a2007a35d/spec/SPEC.md#input-manifest-identifier) for the software artifact=
's associated [Artifact Input Manifest](https://github.com/omnibor/spec/blo=
b/eb1ee5c961c16215eb8709b2975d193a2007a35d/spec/SPEC.md#artifact-input-mani=
fest); this ambiguity exists because the Artifact Input Manifest is itself =
an artifact, and the gitoid of that artifact is its valid identifier. Gitoi=
ds calculated on software artifacts (Snippet, File, or Package Elements) sh=
ould be recorded in the SPDX 3.0 SoftwareArtifact's contentIdentifier prope=
rty. Gitoids calculated on the Artifact Input Manifest (Input Manifest Iden=
tifier) should be recorded in the SPDX 3.0 Element's externalIdentifier pro=
perty. See [OmniBOR Specification](https://github.com/omnibor/spec/), a min=
imalistic specification for describing software [Artifact Dependency Graphs=
](https://github.com/omnibor/spec/blob/eb1ee5c961c16215eb8709b2975d193a2007=
a35d/spec/SPEC.md#artifact-dependency-graph-adg).
> +    gitoid =3D "https://spdx.org/rdf/3.0.1/terms/Software/ContentIdentif=
ierType/gitoid"
> +    # SoftWare Hash IDentifier, a persistent intrinsic identifier for di=
gital artifacts, such as files, trees (also known as directories or folders=
), commits, and other objects typically found in version control systems. T=
he format of the identifiers is defined in the [SWHID specification](https:=
//www.swhid.org/specification/v1.1/4.Syntax) (ISO/IEC DIS 18670). They typi=
cally look like `swh:1:cnt:94a9ed024d3859793618152ea559a168bbcbb5e2`.
> +    swhid =3D "https://spdx.org/rdf/3.0.1/terms/Software/ContentIdentifi=
erType/swhid"
> +
> +
> +# Enumeration of the different kinds of SPDX file.
> +@register("https://spdx.org/rdf/3.0.1/terms/Software/FileKindType", comp=
act_type=3D"software_FileKindType", abstract=3DFalse)
> +class software_FileKindType(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +        "directory": "https://spdx.org/rdf/3.0.1/terms/Software/FileKind=
Type/directory",
> +        "file": "https://spdx.org/rdf/3.0.1/terms/Software/FileKindType/=
file",
> +    }
> +    # The file represents a directory and all content stored in that dir=
ectory.
> +    directory =3D "https://spdx.org/rdf/3.0.1/terms/Software/FileKindTyp=
e/directory"
> +    # The file represents a single file (default).
> +    file =3D "https://spdx.org/rdf/3.0.1/terms/Software/FileKindType/fil=
e"
> +
> +
> +# Provides a set of values to be used to describe the common types of SB=
OMs that
> +# tools may create.
> +@register("https://spdx.org/rdf/3.0.1/terms/Software/SbomType", compact_=
type=3D"software_SbomType", abstract=3DFalse)
> +class software_SbomType(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +        "analyzed": "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/=
analyzed",
> +        "build": "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/bui=
ld",
> +        "deployed": "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/=
deployed",
> +        "design": "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/de=
sign",
> +        "runtime": "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/r=
untime",
> +        "source": "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/so=
urce",
> +    }
> +    # SBOM generated through analysis of artifacts (e.g., executables, p=
ackages, containers, and virtual machine images) after its build. Such anal=
ysis generally requires a variety of heuristics. In some contexts, this may=
 also be referred to as a "3rd party" SBOM.
> +    analyzed =3D "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/ana=
lyzed"
> +    # SBOM generated as part of the process of building the software to =
create a releasable artifact (e.g., executable or package) from data such a=
s source files, dependencies, built components, build process ephemeral dat=
a, and other SBOMs.
> +    build =3D "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/build"
> +    # SBOM provides an inventory of software that is present on a system=
. This may be an assembly of other SBOMs that combines analysis of configur=
ation options, and examination of execution behavior in a (potentially simu=
lated) deployment environment.
> +    deployed =3D "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/dep=
loyed"
> +    # SBOM of intended, planned software project or product with include=
d components (some of which may not yet exist) for a new software artifact.
> +    design =3D "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/desig=
n"
> +    # SBOM generated through instrumenting the system running the softwa=
re, to capture only components present in the system, as well as external c=
all-outs or dynamically loaded components. In some contexts, this may also =
be referred to as an "Instrumented" or "Dynamic" SBOM.
> +    runtime =3D "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/runt=
ime"
> +    # SBOM created directly from the development environment, source fil=
es, and included dependencies used to build an product artifact.
> +    source =3D "https://spdx.org/rdf/3.0.1/terms/Software/SbomType/sourc=
e"
> +
> +
> +# Provides information about the primary purpose of an Element.
> +@register("https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose", c=
ompact_type=3D"software_SoftwarePurpose", abstract=3DFalse)
> +class software_SoftwarePurpose(SHACLObject):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +        "application": "https://spdx.org/rdf/3.0.1/terms/Software/Softwa=
rePurpose/application",
> +        "archive": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/archive",
> +        "bom": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpos=
e/bom",
> +        "configuration": "https://spdx.org/rdf/3.0.1/terms/Software/Soft=
warePurpose/configuration",
> +        "container": "https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/container",
> +        "data": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpo=
se/data",
> +        "device": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePur=
pose/device",
> +        "deviceDriver": "https://spdx.org/rdf/3.0.1/terms/Software/Softw=
arePurpose/deviceDriver",
> +        "diskImage": "https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/diskImage",
> +        "documentation": "https://spdx.org/rdf/3.0.1/terms/Software/Soft=
warePurpose/documentation",
> +        "evidence": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwareP=
urpose/evidence",
> +        "executable": "https://spdx.org/rdf/3.0.1/terms/Software/Softwar=
ePurpose/executable",
> +        "file": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpo=
se/file",
> +        "filesystemImage": "https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/filesystemImage",
> +        "firmware": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwareP=
urpose/firmware",
> +        "framework": "https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/framework",
> +        "install": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/install",
> +        "library": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/library",
> +        "manifest": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwareP=
urpose/manifest",
> +        "model": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurp=
ose/model",
> +        "module": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePur=
pose/module",
> +        "operatingSystem": "https://spdx.org/rdf/3.0.1/terms/Software/So=
ftwarePurpose/operatingSystem",
> +        "other": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurp=
ose/other",
> +        "patch": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurp=
ose/patch",
> +        "platform": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwareP=
urpose/platform",
> +        "requirement": "https://spdx.org/rdf/3.0.1/terms/Software/Softwa=
rePurpose/requirement",
> +        "source": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePur=
pose/source",
> +        "specification": "https://spdx.org/rdf/3.0.1/terms/Software/Soft=
warePurpose/specification",
> +        "test": "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpo=
se/test",
> +    }
> +    # The Element is a software application.
> +    application =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwareP=
urpose/application"
> +    # The Element is an archived collection of one or more files (.tar, =
.zip, etc.).
> +    archive =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpo=
se/archive"
> +    # The Element is a bill of materials.
> +    bom =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose/b=
om"
> +    # The Element is configuration data.
> +    configuration =3D "https://spdx.org/rdf/3.0.1/terms/Software/Softwar=
ePurpose/configuration"
> +    # The Element is a container image which can be used by a container =
runtime application.
> +    container =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePur=
pose/container"
> +    # The Element is data.
> +    data =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose/=
data"
> +    # The Element refers to a chipset, processor, or electronic board.
> +    device =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpos=
e/device"
> +    # The Element represents software that controls hardware devices.
> +    deviceDriver =3D "https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/deviceDriver"
> +    # The Element refers to a disk image that can be written to a disk, =
booted in a VM, etc. A disk image typically contains most or all of the com=
ponents necessary to boot, such as bootloaders, kernels, firmware, userspac=
e, etc.
> +    diskImage =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePur=
pose/diskImage"
> +    # The Element is documentation.
> +    documentation =3D "https://spdx.org/rdf/3.0.1/terms/Software/Softwar=
ePurpose/documentation"
> +    # The Element is the evidence that a specification or requirement ha=
s been fulfilled.
> +    evidence =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurp=
ose/evidence"
> +    # The Element is an Artifact that can be run on a computer.
> +    executable =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePu=
rpose/executable"
> +    # The Element is a single file which can be independently distribute=
d (configuration file, statically linked binary, Kubernetes deployment, etc=
.).
> +    file =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose/=
file"
> +    # The Element is a file system image that can be written to a disk (=
or virtual) partition.
> +    filesystemImage =3D "https://spdx.org/rdf/3.0.1/terms/Software/Softw=
arePurpose/filesystemImage"
> +    # The Element provides low level control over a device's hardware.
> +    firmware =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurp=
ose/firmware"
> +    # The Element is a software framework.
> +    framework =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePur=
pose/framework"
> +    # The Element is used to install software on disk.
> +    install =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpo=
se/install"
> +    # The Element is a software library.
> +    library =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpo=
se/library"
> +    # The Element is a software manifest.
> +    manifest =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurp=
ose/manifest"
> +    # The Element is a machine learning or artificial intelligence model=
.
> +    model =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose=
/model"
> +    # The Element is a module of a piece of software.
> +    module =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpos=
e/module"
> +    # The Element is an operating system.
> +    operatingSystem =3D "https://spdx.org/rdf/3.0.1/terms/Software/Softw=
arePurpose/operatingSystem"
> +    # The Element doesn't fit into any of the other categories.
> +    other =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose=
/other"
> +    # The Element contains a set of changes to update, fix, or improve a=
nother Element.
> +    patch =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose=
/patch"
> +    # The Element represents a runtime environment.
> +    platform =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurp=
ose/platform"
> +    # The Element provides a requirement needed as input for another Ele=
ment.
> +    requirement =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwareP=
urpose/requirement"
> +    # The Element is a single or a collection of source files.
> +    source =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpos=
e/source"
> +    # The Element is a plan, guideline or strategy how to create, perfor=
m or analyze an application.
> +    specification =3D "https://spdx.org/rdf/3.0.1/terms/Software/Softwar=
ePurpose/specification"
> +    # The Element is a test used to verify functionality on an software =
element.
> +    test =3D "https://spdx.org/rdf/3.0.1/terms/Software/SoftwarePurpose/=
test"
> +
> +
> +# Class that describes a build instance of software/artifacts.
> +@register("https://spdx.org/rdf/3.0.1/terms/Build/Build", compact_type=
=3D"build_Build", abstract=3DFalse)
> +class build_Build(Element):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Property that describes the time at which a build stops.
> +        cls._add_property(
> +            "build_buildEndTime",
> +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:=
\d\dZ$",),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/buildEndTime",
> +            compact=3D"build_buildEndTime",
> +        )
> +        # A buildId is a locally unique identifier used by a builder to =
identify a unique
> +        # instance of a build produced by it.
> +        cls._add_property(
> +            "build_buildId",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/buildId",
> +            compact=3D"build_buildId",
> +        )
> +        # Property describing the start time of a build.
> +        cls._add_property(
> +            "build_buildStartTime",
> +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:=
\d\dZ$",),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/buildStartTime=
",
> +            compact=3D"build_buildStartTime",
> +        )
> +        # A buildType is a hint that is used to indicate the toolchain, =
platform, or
> +        # infrastructure that the build was invoked on.
> +        cls._add_property(
> +            "build_buildType",
> +            AnyURIProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/buildType",
> +            min_count=3D1,
> +            compact=3D"build_buildType",
> +        )
> +        # Property that describes the digest of the build configuration =
file used to
> +        # invoke a build.
> +        cls._add_property(
> +            "build_configSourceDigest",
> +            ListProp(ObjectProp(Hash, False)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/configSourceDi=
gest",
> +            compact=3D"build_configSourceDigest",
> +        )
> +        # Property describes the invocation entrypoint of a build.
> +        cls._add_property(
> +            "build_configSourceEntrypoint",
> +            ListProp(StringProp()),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/configSourceEn=
trypoint",
> +            compact=3D"build_configSourceEntrypoint",
> +        )
> +        # Property that describes the URI of the build configuration sou=
rce file.
> +        cls._add_property(
> +            "build_configSourceUri",
> +            ListProp(AnyURIProp()),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/configSourceUr=
i",
> +            compact=3D"build_configSourceUri",
> +        )
> +        # Property describing the session in which a build is invoked.
> +        cls._add_property(
> +            "build_environment",
> +            ListProp(ObjectProp(DictionaryEntry, False)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/environment",
> +            compact=3D"build_environment",
> +        )
> +        # Property describing a parameter used in an instance of a build=
.
> +        cls._add_property(
> +            "build_parameter",
> +            ListProp(ObjectProp(DictionaryEntry, False)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Build/parameter",
> +            compact=3D"build_parameter",
> +        )
> +
> +
> +# Agent represents anything with the potential to act on a system.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/Agent", compact_type=3D=
"Agent", abstract=3DFalse)
> +class Agent(Element):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +
> +# An assertion made in relation to one or more elements.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/Annotation", compact_ty=
pe=3D"Annotation", abstract=3DFalse)
> +class Annotation(Element):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Describes the type of annotation.
> +        cls._add_property(
> +            "annotationType",
> +            EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/AnnotationTy=
pe/other", "other"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/AnnotationTy=
pe/review", "review"),
> +                ]),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/annotationType"=
,
> +            min_count=3D1,
> +            compact=3D"annotationType",
> +        )
> +        # Provides information about the content type of an Element or a=
 Property.
> +        cls._add_property(
> +            "contentType",
> +            StringProp(pattern=3Dr"^[^\/]+\/[^\/]+$",),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/contentType",
> +            compact=3D"contentType",
> +        )
> +        # Commentary on an assertion that an annotator has made.
> +        cls._add_property(
> +            "statement",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/statement",
> +            compact=3D"statement",
> +        )
> +        # An Element an annotator has made an assertion about.
> +        cls._add_property(
> +            "subject",
> +            ObjectProp(Element, True, context=3D[
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoneElement"=
, "NoneElement"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing=
/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing=
/NoneLicense", "expandedlicensing_NoneLicense"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganiza=
tion", "SpdxOrganization"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/NoAssertionE=
lement", "NoAssertionElement"),
> +                ],),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/subject",
> +            min_count=3D1,
> +            compact=3D"subject",
> +        )
> +
> +
> +# A distinct article or unit within the digital domain.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/Artifact", compact_type=
=3D"Artifact", abstract=3DTrue)
> +class Artifact(Element):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Specifies the time an artifact was built.
> +        cls._add_property(
> +            "builtTime",
> +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:=
\d\dZ$",),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/builtTime",
> +            compact=3D"builtTime",
> +        )
> +        # Identifies from where or whom the Element originally came.
> +        cls._add_property(
> +            "originatedBy",
> +            ListProp(ObjectProp(Agent, False, context=3D[
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganiza=
tion", "SpdxOrganization"),
> +                ],)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/originatedBy",
> +            compact=3D"originatedBy",
> +        )
> +        # Specifies the time an artifact was released.
> +        cls._add_property(
> +            "releaseTime",
> +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:=
\d\dZ$",),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/releaseTime",
> +            compact=3D"releaseTime",
> +        )
> +        # The name of a relevant standard that may apply to an artifact.
> +        cls._add_property(
> +            "standardName",
> +            ListProp(StringProp()),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/standardName",
> +            compact=3D"standardName",
> +        )
> +        # Identifies who or what supplied the artifact or VulnAssessment=
Relationship
> +        # referenced by the Element.
> +        cls._add_property(
> +            "suppliedBy",
> +            ObjectProp(Agent, False, context=3D[
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrganiza=
tion", "SpdxOrganization"),
> +                ],),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/suppliedBy",
> +            compact=3D"suppliedBy",
> +        )
> +        # Specifies the level of support associated with an artifact.
> +        cls._add_property(
> +            "supportLevel",
> +            ListProp(EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SupportType/=
deployed", "deployed"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SupportType/=
development", "development"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SupportType/=
endOfSupport", "endOfSupport"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SupportType/=
limitedSupport", "limitedSupport"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SupportType/=
noAssertion", "noAssertion"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SupportType/=
noSupport", "noSupport"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/SupportType/=
support", "support"),
> +                ])),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/supportLevel",
> +            compact=3D"supportLevel",
> +        )
> +        # Specifies until when the artifact can be used before its usage=
 needs to be
> +        # reassessed.
> +        cls._add_property(
> +            "validUntilTime",
> +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:=
\d\dZ$",),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/validUntilTime"=
,
> +            compact=3D"validUntilTime",
> +        )
> +
> +
> +# A collection of Elements that have a shared context.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/Bundle", compact_type=
=3D"Bundle", abstract=3DFalse)
> +class Bundle(ElementCollection):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Gives information about the circumstances or unifying properti=
es
> +        # that Elements of the bundle have been assembled under.
> +        cls._add_property(
> +            "context",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/context",
> +            compact=3D"context",
> +        )
> +
> +
> +# A mathematically calculated representation of a grouping of data.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/Hash", compact_type=3D"=
Hash", abstract=3DFalse)
> +class Hash(IntegrityMethod):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Specifies the algorithm used for calculating the hash value.
> +        cls._add_property(
> +            "algorithm",
> +            EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/adler32", "adler32"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/blake2b256", "blake2b256"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/blake2b384", "blake2b384"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/blake2b512", "blake2b512"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/blake3", "blake3"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/crystalsDilithium", "crystalsDilithium"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/crystalsKyber", "crystalsKyber"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/falcon", "falcon"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/md2", "md2"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/md4", "md4"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/md5", "md5"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/md6", "md6"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/other", "other"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/sha1", "sha1"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/sha224", "sha224"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/sha256", "sha256"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/sha384", "sha384"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/sha3_224", "sha3_224"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/sha3_256", "sha3_256"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/sha3_384", "sha3_384"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/sha3_512", "sha3_512"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/HashAlgorith=
m/sha512", "sha512"),
> +                ]),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/algorithm",
> +            min_count=3D1,
> +            compact=3D"algorithm",
> +        )
> +        # The result of applying a hash algorithm to an Element.
> +        cls._add_property(
> +            "hashValue",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/hashValue",
> +            min_count=3D1,
> +            compact=3D"hashValue",
> +        )
> +
> +
> +# Provide context for a relationship that occurs in the lifecycle.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/LifecycleScopedRelation=
ship", compact_type=3D"LifecycleScopedRelationship", abstract=3DFalse)
> +class LifecycleScopedRelationship(Relationship):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Capture the scope of information about a specific relationship=
 between elements.
> +        cls._add_property(
> +            "scope",
> +            EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/LifecycleSco=
peType/build", "build"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/LifecycleSco=
peType/design", "design"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/LifecycleSco=
peType/development", "development"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/LifecycleSco=
peType/other", "other"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/LifecycleSco=
peType/runtime", "runtime"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/LifecycleSco=
peType/test", "test"),
> +                ]),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/scope",
> +            compact=3D"scope",
> +        )
> +
> +
> +# A group of people who work together in an organized way for a shared p=
urpose.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/Organization", compact_=
type=3D"Organization", abstract=3DFalse)
> +class Organization(Agent):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +        "SpdxOrganization": "https://spdx.org/rdf/3.0.1/terms/Core/SpdxO=
rganization",
> +    }
> +    # An Organization representing the SPDX Project.
> +    SpdxOrganization =3D "https://spdx.org/rdf/3.0.1/terms/Core/SpdxOrga=
nization"
> +
> +
> +# An individual human being.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/Person", compact_type=
=3D"Person", abstract=3DFalse)
> +class Person(Agent):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +
> +# A software agent.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/SoftwareAgent", compact=
_type=3D"SoftwareAgent", abstract=3DFalse)
> +class SoftwareAgent(Agent):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +
> +# Portion of an AnyLicenseInfo representing a set of licensing informati=
on
> +# where all elements apply.
> +@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/Conjunctiv=
eLicenseSet", compact_type=3D"expandedlicensing_ConjunctiveLicenseSet", abs=
tract=3DFalse)
> +class expandedlicensing_ConjunctiveLicenseSet(simplelicensing_AnyLicense=
Info):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # A license expression participating in a license set.
> +        cls._add_property(
> +            "expandedlicensing_member",
> +            ListProp(ObjectProp(simplelicensing_AnyLicenseInfo, False, c=
ontext=3D[
> +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing=
/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing=
/NoneLicense", "expandedlicensing_NoneLicense"),
> +                ],)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/me=
mber",
> +            min_count=3D2,
> +            compact=3D"expandedlicensing_member",
> +        )
> +
> +
> +# A license addition that is not listed on the SPDX Exceptions List.
> +@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/CustomLice=
nseAddition", compact_type=3D"expandedlicensing_CustomLicenseAddition", abs=
tract=3DFalse)
> +class expandedlicensing_CustomLicenseAddition(expandedlicensing_LicenseA=
ddition):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +
> +# Portion of an AnyLicenseInfo representing a set of licensing informati=
on where
> +# only one of the elements applies.
> +@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/Disjunctiv=
eLicenseSet", compact_type=3D"expandedlicensing_DisjunctiveLicenseSet", abs=
tract=3DFalse)
> +class expandedlicensing_DisjunctiveLicenseSet(simplelicensing_AnyLicense=
Info):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # A license expression participating in a license set.
> +        cls._add_property(
> +            "expandedlicensing_member",
> +            ListProp(ObjectProp(simplelicensing_AnyLicenseInfo, False, c=
ontext=3D[
> +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing=
/NoAssertionLicense", "expandedlicensing_NoAssertionLicense"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing=
/NoneLicense", "expandedlicensing_NoneLicense"),
> +                ],)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/me=
mber",
> +            min_count=3D2,
> +            compact=3D"expandedlicensing_member",
> +        )
> +
> +
> +# Abstract class representing a License or an OrLaterOperator.
> +@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/Extendable=
License", compact_type=3D"expandedlicensing_ExtendableLicense", abstract=3D=
True)
> +class expandedlicensing_ExtendableLicense(simplelicensing_AnyLicenseInfo=
):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +
> +# A concrete subclass of AnyLicenseInfo used by Individuals in the
> +# ExpandedLicensing profile.
> +@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/Individual=
LicensingInfo", compact_type=3D"expandedlicensing_IndividualLicensingInfo",=
 abstract=3DFalse)
> +class expandedlicensing_IndividualLicensingInfo(simplelicensing_AnyLicen=
seInfo):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +        "NoAssertionLicense": "https://spdx.org/rdf/3.0.1/terms/Expanded=
Licensing/NoAssertionLicense",
> +        "NoneLicense": "https://spdx.org/rdf/3.0.1/terms/ExpandedLicensi=
ng/NoneLicense",
> +    }
> +    # An Individual Value for License when no assertion can be made abou=
t its actual
> +    # value.
> +    NoAssertionLicense =3D "https://spdx.org/rdf/3.0.1/terms/ExpandedLic=
ensing/NoAssertionLicense"
> +    # An Individual Value for License where the SPDX data creator determ=
ines that no
> +    # license is present.
> +    NoneLicense =3D "https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/=
NoneLicense"
> +
> +
> +# Abstract class for the portion of an AnyLicenseInfo representing a lic=
ense.
> +@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/License", =
compact_type=3D"expandedlicensing_License", abstract=3DTrue)
> +class expandedlicensing_License(expandedlicensing_ExtendableLicense):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Specifies whether a license or additional text identifier has =
been marked as
> +        # deprecated.
> +        cls._add_property(
> +            "expandedlicensing_isDeprecatedLicenseId",
> +            BooleanProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/is=
DeprecatedLicenseId",
> +            compact=3D"expandedlicensing_isDeprecatedLicenseId",
> +        )
> +        # Specifies whether the License is listed as free by the
> +        # Free Software Foundation (FSF).
> +        cls._add_property(
> +            "expandedlicensing_isFsfLibre",
> +            BooleanProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/is=
FsfLibre",
> +            compact=3D"expandedlicensing_isFsfLibre",
> +        )
> +        # Specifies whether the License is listed as approved by the
> +        # Open Source Initiative (OSI).
> +        cls._add_property(
> +            "expandedlicensing_isOsiApproved",
> +            BooleanProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/is=
OsiApproved",
> +            compact=3D"expandedlicensing_isOsiApproved",
> +        )
> +        # Identifies all the text and metadata associated with a license=
 in the license
> +        # XML format.
> +        cls._add_property(
> +            "expandedlicensing_licenseXml",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/li=
censeXml",
> +            compact=3D"expandedlicensing_licenseXml",
> +        )
> +        # Specifies the licenseId that is preferred to be used in place =
of a deprecated
> +        # License or LicenseAddition.
> +        cls._add_property(
> +            "expandedlicensing_obsoletedBy",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/ob=
soletedBy",
> +            compact=3D"expandedlicensing_obsoletedBy",
> +        )
> +        # Contains a URL where the License or LicenseAddition can be fou=
nd in use.
> +        cls._add_property(
> +            "expandedlicensing_seeAlso",
> +            ListProp(AnyURIProp()),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/se=
eAlso",
> +            compact=3D"expandedlicensing_seeAlso",
> +        )
> +        # Provides a License author's preferred text to indicate that a =
file is covered
> +        # by the License.
> +        cls._add_property(
> +            "expandedlicensing_standardLicenseHeader",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/st=
andardLicenseHeader",
> +            compact=3D"expandedlicensing_standardLicenseHeader",
> +        )
> +        # Identifies the full text of a License, in SPDX templating form=
at.
> +        cls._add_property(
> +            "expandedlicensing_standardLicenseTemplate",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/st=
andardLicenseTemplate",
> +            compact=3D"expandedlicensing_standardLicenseTemplate",
> +        )
> +        # Identifies the full text of a License or Addition.
> +        cls._add_property(
> +            "simplelicensing_licenseText",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/SimpleLicensing/lice=
nseText",
> +            min_count=3D1,
> +            compact=3D"simplelicensing_licenseText",
> +        )
> +
> +
> +# A license that is listed on the SPDX License List.
> +@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/ListedLice=
nse", compact_type=3D"expandedlicensing_ListedLicense", abstract=3DFalse)
> +class expandedlicensing_ListedLicense(expandedlicensing_License):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Specifies the SPDX License List version in which this license =
or exception
> +        # identifier was deprecated.
> +        cls._add_property(
> +            "expandedlicensing_deprecatedVersion",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/de=
precatedVersion",
> +            compact=3D"expandedlicensing_deprecatedVersion",
> +        )
> +        # Specifies the SPDX License List version in which this ListedLi=
cense or
> +        # ListedLicenseException identifier was first added.
> +        cls._add_property(
> +            "expandedlicensing_listVersionAdded",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/li=
stVersionAdded",
> +            compact=3D"expandedlicensing_listVersionAdded",
> +        )
> +
> +
> +# Portion of an AnyLicenseInfo representing this version, or any later v=
ersion,
> +# of the indicated License.
> +@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/OrLaterOpe=
rator", compact_type=3D"expandedlicensing_OrLaterOperator", abstract=3DFals=
e)
> +class expandedlicensing_OrLaterOperator(expandedlicensing_ExtendableLice=
nse):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # A License participating in an 'or later' model.
> +        cls._add_property(
> +            "expandedlicensing_subjectLicense",
> +            ObjectProp(expandedlicensing_License, True),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/su=
bjectLicense",
> +            min_count=3D1,
> +            compact=3D"expandedlicensing_subjectLicense",
> +        )
> +
> +
> +# Portion of an AnyLicenseInfo representing a License which has addition=
al
> +# text applied to it.
> +@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/WithAdditi=
onOperator", compact_type=3D"expandedlicensing_WithAdditionOperator", abstr=
act=3DFalse)
> +class expandedlicensing_WithAdditionOperator(simplelicensing_AnyLicenseI=
nfo):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # A LicenseAddition participating in a 'with addition' model.
> +        cls._add_property(
> +            "expandedlicensing_subjectAddition",
> +            ObjectProp(expandedlicensing_LicenseAddition, True),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/su=
bjectAddition",
> +            min_count=3D1,
> +            compact=3D"expandedlicensing_subjectAddition",
> +        )
> +        # A License participating in a 'with addition' model.
> +        cls._add_property(
> +            "expandedlicensing_subjectExtendableLicense",
> +            ObjectProp(expandedlicensing_ExtendableLicense, True),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/su=
bjectExtendableLicense",
> +            min_count=3D1,
> +            compact=3D"expandedlicensing_subjectExtendableLicense",
> +        )
> +
> +
> +# A type of extension consisting of a list of name value pairs.
> +@register("https://spdx.org/rdf/3.0.1/terms/Extension/CdxPropertiesExten=
sion", compact_type=3D"extension_CdxPropertiesExtension", abstract=3DFalse)
> +class extension_CdxPropertiesExtension(extension_Extension):
> +    NODE_KIND =3D NodeKind.BlankNodeOrIRI
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Provides a map of a property names to a values.
> +        cls._add_property(
> +            "extension_cdxProperty",
> +            ListProp(ObjectProp(extension_CdxPropertyEntry, False)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Extension/cdxPropert=
y",
> +            min_count=3D1,
> +            compact=3D"extension_cdxProperty",
> +        )
> +
> +
> +# Provides a CVSS version 2.0 assessment for a vulnerability.
> +@register("https://spdx.org/rdf/3.0.1/terms/Security/CvssV2VulnAssessmen=
tRelationship", compact_type=3D"security_CvssV2VulnAssessmentRelationship",=
 abstract=3DFalse)
> +class security_CvssV2VulnAssessmentRelationship(security_VulnAssessmentR=
elationship):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Provides a numerical (0-10) representation of the severity of =
a vulnerability.
> +        cls._add_property(
> +            "security_score",
> +            FloatProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/score",
> +            min_count=3D1,
> +            compact=3D"security_score",
> +        )
> +        # Specifies the CVSS vector string for a vulnerability.
> +        cls._add_property(
> +            "security_vectorString",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/vectorStrin=
g",
> +            min_count=3D1,
> +            compact=3D"security_vectorString",
> +        )
> +
> +
> +# Provides a CVSS version 3 assessment for a vulnerability.
> +@register("https://spdx.org/rdf/3.0.1/terms/Security/CvssV3VulnAssessmen=
tRelationship", compact_type=3D"security_CvssV3VulnAssessmentRelationship",=
 abstract=3DFalse)
> +class security_CvssV3VulnAssessmentRelationship(security_VulnAssessmentR=
elationship):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Provides a numerical (0-10) representation of the severity of =
a vulnerability.
> +        cls._add_property(
> +            "security_score",
> +            FloatProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/score",
> +            min_count=3D1,
> +            compact=3D"security_score",
> +        )
> +        # Specifies the CVSS qualitative severity rating of a vulnerabil=
ity in relation to a piece of software.
> +        cls._add_property(
> +            "security_severity",
> +            EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Security/CvssSeve=
rityType/critical", "critical"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Security/CvssSeve=
rityType/high", "high"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Security/CvssSeve=
rityType/low", "low"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Security/CvssSeve=
rityType/medium", "medium"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Security/CvssSeve=
rityType/none", "none"),
> +                ]),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/severity",
> +            min_count=3D1,
> +            compact=3D"security_severity",
> +        )
> +        # Specifies the CVSS vector string for a vulnerability.
> +        cls._add_property(
> +            "security_vectorString",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/vectorStrin=
g",
> +            min_count=3D1,
> +            compact=3D"security_vectorString",
> +        )
> +
> +
> +# Provides a CVSS version 4 assessment for a vulnerability.
> +@register("https://spdx.org/rdf/3.0.1/terms/Security/CvssV4VulnAssessmen=
tRelationship", compact_type=3D"security_CvssV4VulnAssessmentRelationship",=
 abstract=3DFalse)
> +class security_CvssV4VulnAssessmentRelationship(security_VulnAssessmentR=
elationship):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Provides a numerical (0-10) representation of the severity of =
a vulnerability.
> +        cls._add_property(
> +            "security_score",
> +            FloatProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/score",
> +            min_count=3D1,
> +            compact=3D"security_score",
> +        )
> +        # Specifies the CVSS qualitative severity rating of a vulnerabil=
ity in relation to a piece of software.
> +        cls._add_property(
> +            "security_severity",
> +            EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Security/CvssSeve=
rityType/critical", "critical"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Security/CvssSeve=
rityType/high", "high"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Security/CvssSeve=
rityType/low", "low"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Security/CvssSeve=
rityType/medium", "medium"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Security/CvssSeve=
rityType/none", "none"),
> +                ]),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/severity",
> +            min_count=3D1,
> +            compact=3D"security_severity",
> +        )
> +        # Specifies the CVSS vector string for a vulnerability.
> +        cls._add_property(
> +            "security_vectorString",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/vectorStrin=
g",
> +            min_count=3D1,
> +            compact=3D"security_vectorString",
> +        )
> +
> +
> +# Provides an EPSS assessment for a vulnerability.
> +@register("https://spdx.org/rdf/3.0.1/terms/Security/EpssVulnAssessmentR=
elationship", compact_type=3D"security_EpssVulnAssessmentRelationship", abs=
tract=3DFalse)
> +class security_EpssVulnAssessmentRelationship(security_VulnAssessmentRel=
ationship):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # The percentile of the current probability score.
> +        cls._add_property(
> +            "security_percentile",
> +            FloatProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/percentile"=
,
> +            min_count=3D1,
> +            compact=3D"security_percentile",
> +        )
> +        # A probability score between 0 and 1 of a vulnerability being e=
xploited.
> +        cls._add_property(
> +            "security_probability",
> +            FloatProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/probability=
",
> +            min_count=3D1,
> +            compact=3D"security_probability",
> +        )
> +
> +
> +# Provides an exploit assessment of a vulnerability.
> +@register("https://spdx.org/rdf/3.0.1/terms/Security/ExploitCatalogVulnA=
ssessmentRelationship", compact_type=3D"security_ExploitCatalogVulnAssessme=
ntRelationship", abstract=3DFalse)
> +class security_ExploitCatalogVulnAssessmentRelationship(security_VulnAss=
essmentRelationship):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Specifies the exploit catalog type.
> +        cls._add_property(
> +            "security_catalogType",
> +            EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Security/ExploitC=
atalogType/kev", "kev"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Security/ExploitC=
atalogType/other", "other"),
> +                ]),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/catalogType=
",
> +            min_count=3D1,
> +            compact=3D"security_catalogType",
> +        )
> +        # Describe that a CVE is known to have an exploit because it's b=
een listed in an exploit catalog.
> +        cls._add_property(
> +            "security_exploited",
> +            BooleanProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/exploited",
> +            min_count=3D1,
> +            compact=3D"security_exploited",
> +        )
> +        # Provides the location of an exploit catalog.
> +        cls._add_property(
> +            "security_locator",
> +            AnyURIProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/locator",
> +            min_count=3D1,
> +            compact=3D"security_locator",
> +        )
> +
> +
> +# Provides an SSVC assessment for a vulnerability.
> +@register("https://spdx.org/rdf/3.0.1/terms/Security/SsvcVulnAssessmentR=
elationship", compact_type=3D"security_SsvcVulnAssessmentRelationship", abs=
tract=3DFalse)
> +class security_SsvcVulnAssessmentRelationship(security_VulnAssessmentRel=
ationship):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Provide the enumeration of possible decisions in the
> +        # [Stakeholder-Specific Vulnerability Categorization (SSVC) deci=
sion tree](https://www.cisa.gov/stakeholder-specific-vulnerability-categori=
zation-ssvc).
> +        cls._add_property(
> +            "security_decisionType",
> +            EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Security/SsvcDeci=
sionType/act", "act"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Security/SsvcDeci=
sionType/attend", "attend"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Security/SsvcDeci=
sionType/track", "track"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Security/SsvcDeci=
sionType/trackStar", "trackStar"),
> +                ]),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/decisionTyp=
e",
> +            min_count=3D1,
> +            compact=3D"security_decisionType",
> +        )
> +
> +
> +# Abstract ancestor class for all VEX relationships
> +@register("https://spdx.org/rdf/3.0.1/terms/Security/VexVulnAssessmentRe=
lationship", compact_type=3D"security_VexVulnAssessmentRelationship", abstr=
act=3DTrue)
> +class security_VexVulnAssessmentRelationship(security_VulnAssessmentRela=
tionship):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Conveys information about how VEX status was determined.
> +        cls._add_property(
> +            "security_statusNotes",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/statusNotes=
",
> +            compact=3D"security_statusNotes",
> +        )
> +        # Specifies the version of a VEX statement.
> +        cls._add_property(
> +            "security_vexVersion",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/vexVersion"=
,
> +            compact=3D"security_vexVersion",
> +        )
> +
> +
> +# Specifies a vulnerability and its associated information.
> +@register("https://spdx.org/rdf/3.0.1/terms/Security/Vulnerability", com=
pact_type=3D"security_Vulnerability", abstract=3DFalse)
> +class security_Vulnerability(Artifact):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Specifies a time when a vulnerability assessment was modified
> +        cls._add_property(
> +            "security_modifiedTime",
> +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:=
\d\dZ$",),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/modifiedTim=
e",
> +            compact=3D"security_modifiedTime",
> +        )
> +        # Specifies the time when a vulnerability was published.
> +        cls._add_property(
> +            "security_publishedTime",
> +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:=
\d\dZ$",),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/publishedTi=
me",
> +            compact=3D"security_publishedTime",
> +        )
> +        # Specified the time and date when a vulnerability was withdrawn=
.
> +        cls._add_property(
> +            "security_withdrawnTime",
> +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:=
\d\dZ$",),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/withdrawnTi=
me",
> +            compact=3D"security_withdrawnTime",
> +        )
> +
> +
> +# A distinct article or unit related to Software.
> +@register("https://spdx.org/rdf/3.0.1/terms/Software/SoftwareArtifact", =
compact_type=3D"software_SoftwareArtifact", abstract=3DTrue)
> +class software_SoftwareArtifact(Artifact):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Provides additional purpose information of the software artifa=
ct.
> +        cls._add_property(
> +            "software_additionalPurpose",
> +            ListProp(EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/application", "application"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/archive", "archive"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/bom", "bom"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/configuration", "configuration"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/container", "container"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/data", "data"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/device", "device"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/deviceDriver", "deviceDriver"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/diskImage", "diskImage"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/documentation", "documentation"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/evidence", "evidence"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/executable", "executable"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/file", "file"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/filesystemImage", "filesystemImage"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/firmware", "firmware"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/framework", "framework"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/install", "install"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/library", "library"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/manifest", "manifest"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/model", "model"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/module", "module"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/operatingSystem", "operatingSystem"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/other", "other"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/patch", "patch"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/platform", "platform"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/requirement", "requirement"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/source", "source"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/specification", "specification"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/test", "test"),
> +                ])),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/additionalP=
urpose",
> +            compact=3D"software_additionalPurpose",
> +        )
> +        # Provides a place for the SPDX data creator to record acknowled=
gement text for
> +        # a software Package, File or Snippet.
> +        cls._add_property(
> +            "software_attributionText",
> +            ListProp(StringProp()),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/attribution=
Text",
> +            compact=3D"software_attributionText",
> +        )
> +        # A canonical, unique, immutable identifier of the artifact cont=
ent, that may be
> +        # used for verifying its identity and/or integrity.
> +        cls._add_property(
> +            "software_contentIdentifier",
> +            ListProp(ObjectProp(software_ContentIdentifier, False)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/contentIden=
tifier",
> +            compact=3D"software_contentIdentifier",
> +        )
> +        # Identifies the text of one or more copyright notices for a sof=
tware Package,
> +        # File or Snippet, if any.
> +        cls._add_property(
> +            "software_copyrightText",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/copyrightTe=
xt",
> +            compact=3D"software_copyrightText",
> +        )
> +        # Provides information about the primary purpose of the software=
 artifact.
> +        cls._add_property(
> +            "software_primaryPurpose",
> +            EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/application", "application"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/archive", "archive"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/bom", "bom"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/configuration", "configuration"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/container", "container"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/data", "data"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/device", "device"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/deviceDriver", "deviceDriver"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/diskImage", "diskImage"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/documentation", "documentation"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/evidence", "evidence"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/executable", "executable"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/file", "file"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/filesystemImage", "filesystemImage"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/firmware", "firmware"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/framework", "framework"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/install", "install"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/library", "library"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/manifest", "manifest"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/model", "model"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/module", "module"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/operatingSystem", "operatingSystem"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/other", "other"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/patch", "patch"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/platform", "platform"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/requirement", "requirement"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/source", "source"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/specification", "specification"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/Software=
Purpose/test", "test"),
> +                ]),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/primaryPurp=
ose",
> +            compact=3D"software_primaryPurpose",
> +        )
> +
> +
> +# A container for a grouping of SPDX-3.0 content characterizing details
> +# (provenence, composition, licensing, etc.) about a product.
> +@register("https://spdx.org/rdf/3.0.1/terms/Core/Bom", compact_type=3D"B=
om", abstract=3DFalse)
> +class Bom(Bundle):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +
> +# A license that is not listed on the SPDX License List.
> +@register("https://spdx.org/rdf/3.0.1/terms/ExpandedLicensing/CustomLice=
nse", compact_type=3D"expandedlicensing_CustomLicense", abstract=3DFalse)
> +class expandedlicensing_CustomLicense(expandedlicensing_License):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +
> +# Connects a vulnerability and an element designating the element as a p=
roduct
> +# affected by the vulnerability.
> +@register("https://spdx.org/rdf/3.0.1/terms/Security/VexAffectedVulnAsse=
ssmentRelationship", compact_type=3D"security_VexAffectedVulnAssessmentRela=
tionship", abstract=3DFalse)
> +class security_VexAffectedVulnAssessmentRelationship(security_VexVulnAss=
essmentRelationship):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Provides advise on how to mitigate or remediate a vulnerabilit=
y when a VEX product
> +        # is affected by it.
> +        cls._add_property(
> +            "security_actionStatement",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/actionState=
ment",
> +            min_count=3D1,
> +            compact=3D"security_actionStatement",
> +        )
> +        # Records the time when a recommended action was communicated in=
 a VEX statement
> +        # to mitigate a vulnerability.
> +        cls._add_property(
> +            "security_actionStatementTime",
> +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:=
\d\dZ$",),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/actionState=
mentTime",
> +            compact=3D"security_actionStatementTime",
> +        )
> +
> +
> +# Links a vulnerability and elements representing products (in the VEX s=
ense) where
> +# a fix has been applied and are no longer affected.
> +@register("https://spdx.org/rdf/3.0.1/terms/Security/VexFixedVulnAssessm=
entRelationship", compact_type=3D"security_VexFixedVulnAssessmentRelationsh=
ip", abstract=3DFalse)
> +class security_VexFixedVulnAssessmentRelationship(security_VexVulnAssess=
mentRelationship):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +
> +# Links a vulnerability and one or more elements designating the latter =
as products
> +# not affected by the vulnerability.
> +@register("https://spdx.org/rdf/3.0.1/terms/Security/VexNotAffectedVulnA=
ssessmentRelationship", compact_type=3D"security_VexNotAffectedVulnAssessme=
ntRelationship", abstract=3DFalse)
> +class security_VexNotAffectedVulnAssessmentRelationship(security_VexVuln=
AssessmentRelationship):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Explains why a VEX product is not affected by a vulnerability.=
 It is an
> +        # alternative in VexNotAffectedVulnAssessmentRelationship to the=
 machine-readable
> +        # justification label.
> +        cls._add_property(
> +            "security_impactStatement",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/impactState=
ment",
> +            compact=3D"security_impactStatement",
> +        )
> +        # Timestamp of impact statement.
> +        cls._add_property(
> +            "security_impactStatementTime",
> +            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:=
\d\dZ$",),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/impactState=
mentTime",
> +            compact=3D"security_impactStatementTime",
> +        )
> +        # Impact justification label to be used when linking a vulnerabi=
lity to an element
> +        # representing a VEX product with a VexNotAffectedVulnAssessment=
Relationship
> +        # relationship.
> +        cls._add_property(
> +            "security_justificationType",
> +            EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Security/VexJusti=
ficationType/componentNotPresent", "componentNotPresent"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Security/VexJusti=
ficationType/inlineMitigationsAlreadyExist", "inlineMitigationsAlreadyExist=
"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Security/VexJusti=
ficationType/vulnerableCodeCannotBeControlledByAdversary", "vulnerableCodeC=
annotBeControlledByAdversary"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Security/VexJusti=
ficationType/vulnerableCodeNotInExecutePath", "vulnerableCodeNotInExecutePa=
th"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Security/VexJusti=
ficationType/vulnerableCodeNotPresent", "vulnerableCodeNotPresent"),
> +                ]),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Security/justificati=
onType",
> +            compact=3D"security_justificationType",
> +        )
> +
> +
> +# Designates elements as products where the impact of a vulnerability is=
 being
> +# investigated.
> +@register("https://spdx.org/rdf/3.0.1/terms/Security/VexUnderInvestigati=
onVulnAssessmentRelationship", compact_type=3D"security_VexUnderInvestigati=
onVulnAssessmentRelationship", abstract=3DFalse)
> +class security_VexUnderInvestigationVulnAssessmentRelationship(security_=
VexVulnAssessmentRelationship):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +
> +# Refers to any object that stores content on a computer.
> +@register("https://spdx.org/rdf/3.0.1/terms/Software/File", compact_type=
=3D"software_File", abstract=3DFalse)
> +class software_File(software_SoftwareArtifact):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Provides information about the content type of an Element or a=
 Property.
> +        cls._add_property(
> +            "contentType",
> +            StringProp(pattern=3Dr"^[^\/]+\/[^\/]+$",),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Core/contentType",
> +            compact=3D"contentType",
> +        )
> +        # Describes if a given file is a directory or non-directory kind=
 of file.
> +        cls._add_property(
> +            "software_fileKind",
> +            EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/FileKind=
Type/directory", "directory"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/FileKind=
Type/file", "file"),
> +                ]),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/fileKind",
> +            compact=3D"software_fileKind",
> +        )
> +
> +
> +# Refers to any unit of content that can be associated with a distributi=
on of
> +# software.
> +@register("https://spdx.org/rdf/3.0.1/terms/Software/Package", compact_t=
ype=3D"software_Package", abstract=3DFalse)
> +class software_Package(software_SoftwareArtifact):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Identifies the download Uniform Resource Identifier for the pa=
ckage at the time
> +        # that the document was created.
> +        cls._add_property(
> +            "software_downloadLocation",
> +            AnyURIProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/downloadLoc=
ation",
> +            compact=3D"software_downloadLocation",
> +        )
> +        # A place for the SPDX document creator to record a website that=
 serves as the
> +        # package's home page.
> +        cls._add_property(
> +            "software_homePage",
> +            AnyURIProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/homePage",
> +            compact=3D"software_homePage",
> +        )
> +        # Provides a place for the SPDX data creator to record the packa=
ge URL string
> +        # (in accordance with the Package URL specification) for a softw=
are Package.
> +        cls._add_property(
> +            "software_packageUrl",
> +            AnyURIProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/packageUrl"=
,
> +            compact=3D"software_packageUrl",
> +        )
> +        # Identify the version of a package.
> +        cls._add_property(
> +            "software_packageVersion",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/packageVers=
ion",
> +            compact=3D"software_packageVersion",
> +        )
> +        # Records any relevant background information or additional comm=
ents
> +        # about the origin of the package.
> +        cls._add_property(
> +            "software_sourceInfo",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/sourceInfo"=
,
> +            compact=3D"software_sourceInfo",
> +        )
> +
> +
> +# A collection of SPDX Elements describing a single package.
> +@register("https://spdx.org/rdf/3.0.1/terms/Software/Sbom", compact_type=
=3D"software_Sbom", abstract=3DFalse)
> +class software_Sbom(Bom):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Provides information about the type of an SBOM.
> +        cls._add_property(
> +            "software_sbomType",
> +            ListProp(EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/SbomType=
/analyzed", "analyzed"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/SbomType=
/build", "build"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/SbomType=
/deployed", "deployed"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/SbomType=
/design", "design"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/SbomType=
/runtime", "runtime"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Software/SbomType=
/source", "source"),
> +                ])),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/sbomType",
> +            compact=3D"software_sbomType",
> +        )
> +
> +
> +# Describes a certain part of a file.
> +@register("https://spdx.org/rdf/3.0.1/terms/Software/Snippet", compact_t=
ype=3D"software_Snippet", abstract=3DFalse)
> +class software_Snippet(software_SoftwareArtifact):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Defines the byte range in the original host file that the snip=
pet information
> +        # applies to.
> +        cls._add_property(
> +            "software_byteRange",
> +            ObjectProp(PositiveIntegerRange, False),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/byteRange",
> +            compact=3D"software_byteRange",
> +        )
> +        # Defines the line range in the original host file that the snip=
pet information
> +        # applies to.
> +        cls._add_property(
> +            "software_lineRange",
> +            ObjectProp(PositiveIntegerRange, False),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/lineRange",
> +            compact=3D"software_lineRange",
> +        )
> +        # Defines the original host file that the snippet information ap=
plies to.
> +        cls._add_property(
> +            "software_snippetFromFile",
> +            ObjectProp(software_File, True),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Software/snippetFrom=
File",
> +            min_count=3D1,
> +            compact=3D"software_snippetFromFile",
> +        )
> +
> +
> +# Specifies an AI package and its associated information.
> +@register("https://spdx.org/rdf/3.0.1/terms/AI/AIPackage", compact_type=
=3D"ai_AIPackage", abstract=3DFalse)
> +class ai_AIPackage(software_Package):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Indicates whether the system can perform a decision or action =
without human
> +        # involvement or guidance.
> +        cls._add_property(
> +            "ai_autonomyType",
> +            EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/PresenceType=
/no", "no"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/PresenceType=
/noAssertion", "noAssertion"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/PresenceType=
/yes", "yes"),
> +                ]),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/autonomyType",
> +            compact=3D"ai_autonomyType",
> +        )
> +        # Captures the domain in which the AI package can be used.
> +        cls._add_property(
> +            "ai_domain",
> +            ListProp(StringProp()),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/domain",
> +            compact=3D"ai_domain",
> +        )
> +        # Indicates the amount of energy consumption incurred by an AI m=
odel.
> +        cls._add_property(
> +            "ai_energyConsumption",
> +            ObjectProp(ai_EnergyConsumption, False),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/energyConsumption=
",
> +            compact=3D"ai_energyConsumption",
> +        )
> +        # Records a hyperparameter used to build the AI model contained =
in the AI
> +        # package.
> +        cls._add_property(
> +            "ai_hyperparameter",
> +            ListProp(ObjectProp(DictionaryEntry, False)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/hyperparameter",
> +            compact=3D"ai_hyperparameter",
> +        )
> +        # Provides relevant information about the AI software, not inclu=
ding the model
> +        # description.
> +        cls._add_property(
> +            "ai_informationAboutApplication",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/informationAboutA=
pplication",
> +            compact=3D"ai_informationAboutApplication",
> +        )
> +        # Describes relevant information about different steps of the tr=
aining process.
> +        cls._add_property(
> +            "ai_informationAboutTraining",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/informationAboutT=
raining",
> +            compact=3D"ai_informationAboutTraining",
> +        )
> +        # Captures a limitation of the AI software.
> +        cls._add_property(
> +            "ai_limitation",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/limitation",
> +            compact=3D"ai_limitation",
> +        )
> +        # Records the measurement of prediction quality of the AI model.
> +        cls._add_property(
> +            "ai_metric",
> +            ListProp(ObjectProp(DictionaryEntry, False)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/metric",
> +            compact=3D"ai_metric",
> +        )
> +        # Captures the threshold that was used for computation of a metr=
ic described in
> +        # the metric field.
> +        cls._add_property(
> +            "ai_metricDecisionThreshold",
> +            ListProp(ObjectProp(DictionaryEntry, False)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/metricDecisionThr=
eshold",
> +            compact=3D"ai_metricDecisionThreshold",
> +        )
> +        # Describes all the preprocessing steps applied to the training =
data before the
> +        # model training.
> +        cls._add_property(
> +            "ai_modelDataPreprocessing",
> +            ListProp(StringProp()),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/modelDataPreproce=
ssing",
> +            compact=3D"ai_modelDataPreprocessing",
> +        )
> +        # Describes methods that can be used to explain the results from=
 the AI model.
> +        cls._add_property(
> +            "ai_modelExplainability",
> +            ListProp(StringProp()),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/modelExplainabili=
ty",
> +            compact=3D"ai_modelExplainability",
> +        )
> +        # Records the results of general safety risk assessment of the A=
I system.
> +        cls._add_property(
> +            "ai_safetyRiskAssessment",
> +            EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAsse=
ssmentType/high", "high"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAsse=
ssmentType/low", "low"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAsse=
ssmentType/medium", "medium"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/AI/SafetyRiskAsse=
ssmentType/serious", "serious"),
> +                ]),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/safetyRiskAssessm=
ent",
> +            compact=3D"ai_safetyRiskAssessment",
> +        )
> +        # Captures a standard that is being complied with.
> +        cls._add_property(
> +            "ai_standardCompliance",
> +            ListProp(StringProp()),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/standardComplianc=
e",
> +            compact=3D"ai_standardCompliance",
> +        )
> +        # Records the type of the model used in the AI software.
> +        cls._add_property(
> +            "ai_typeOfModel",
> +            ListProp(StringProp()),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/typeOfModel",
> +            compact=3D"ai_typeOfModel",
> +        )
> +        # Records if sensitive personal information is used during model=
 training or
> +        # could be used during the inference.
> +        cls._add_property(
> +            "ai_useSensitivePersonalInformation",
> +            EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/PresenceType=
/no", "no"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/PresenceType=
/noAssertion", "noAssertion"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/PresenceType=
/yes", "yes"),
> +                ]),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/AI/useSensitivePerso=
nalInformation",
> +            compact=3D"ai_useSensitivePersonalInformation",
> +        )
> +
> +
> +# Specifies a data package and its associated information.
> +@register("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetPackage", com=
pact_type=3D"dataset_DatasetPackage", abstract=3DFalse)
> +class dataset_DatasetPackage(software_Package):
> +    NODE_KIND =3D NodeKind.IRI
> +    ID_ALIAS =3D "spdxId"
> +    NAMED_INDIVIDUALS =3D {
> +    }
> +
> +    @classmethod
> +    def _register_props(cls):
> +        super()._register_props()
> +        # Describes the anonymization methods used.
> +        cls._add_property(
> +            "dataset_anonymizationMethodUsed",
> +            ListProp(StringProp()),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/anonymizatio=
nMethodUsed",
> +            compact=3D"dataset_anonymizationMethodUsed",
> +        )
> +        # Describes the confidentiality level of the data points contain=
ed in the dataset.
> +        cls._add_property(
> +            "dataset_confidentialityLevel",
> +            EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Confident=
ialityLevelType/amber", "amber"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Confident=
ialityLevelType/clear", "clear"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Confident=
ialityLevelType/green", "green"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/Confident=
ialityLevelType/red", "red"),
> +                ]),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/confidential=
ityLevel",
> +            compact=3D"dataset_confidentialityLevel",
> +        )
> +        # Describes how the dataset was collected.
> +        cls._add_property(
> +            "dataset_dataCollectionProcess",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/dataCollecti=
onProcess",
> +            compact=3D"dataset_dataCollectionProcess",
> +        )
> +        # Describes the preprocessing steps that were applied to the raw=
 data to create the given dataset.
> +        cls._add_property(
> +            "dataset_dataPreprocessing",
> +            ListProp(StringProp()),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/dataPreproce=
ssing",
> +            compact=3D"dataset_dataPreprocessing",
> +        )
> +        # The field describes the availability of a dataset.
> +        cls._add_property(
> +            "dataset_datasetAvailability",
> +            EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetAv=
ailabilityType/clickthrough", "clickthrough"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetAv=
ailabilityType/directDownload", "directDownload"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetAv=
ailabilityType/query", "query"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetAv=
ailabilityType/registration", "registration"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetAv=
ailabilityType/scrapingScript", "scrapingScript"),
> +                ]),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/datasetAvail=
ability",
> +            compact=3D"dataset_datasetAvailability",
> +        )
> +        # Describes potentially noisy elements of the dataset.
> +        cls._add_property(
> +            "dataset_datasetNoise",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/datasetNoise=
",
> +            compact=3D"dataset_datasetNoise",
> +        )
> +        # Captures the size of the dataset.
> +        cls._add_property(
> +            "dataset_datasetSize",
> +            NonNegativeIntegerProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/datasetSize"=
,
> +            compact=3D"dataset_datasetSize",
> +        )
> +        # Describes the type of the given dataset.
> +        cls._add_property(
> +            "dataset_datasetType",
> +            ListProp(EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTy=
pe/audio", "audio"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTy=
pe/categorical", "categorical"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTy=
pe/graph", "graph"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTy=
pe/image", "image"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTy=
pe/noAssertion", "noAssertion"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTy=
pe/numeric", "numeric"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTy=
pe/other", "other"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTy=
pe/sensor", "sensor"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTy=
pe/structured", "structured"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTy=
pe/syntactic", "syntactic"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTy=
pe/text", "text"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTy=
pe/timeseries", "timeseries"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTy=
pe/timestamp", "timestamp"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Dataset/DatasetTy=
pe/video", "video"),
> +                ])),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/datasetType"=
,
> +            min_count=3D1,
> +            compact=3D"dataset_datasetType",
> +        )
> +        # Describes a mechanism to update the dataset.
> +        cls._add_property(
> +            "dataset_datasetUpdateMechanism",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/datasetUpdat=
eMechanism",
> +            compact=3D"dataset_datasetUpdateMechanism",
> +        )
> +        # Describes if any sensitive personal information is present in =
the dataset.
> +        cls._add_property(
> +            "dataset_hasSensitivePersonalInformation",
> +            EnumProp([
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/PresenceType=
/no", "no"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/PresenceType=
/noAssertion", "noAssertion"),
> +                    ("https://spdx.org/rdf/3.0.1/terms/Core/PresenceType=
/yes", "yes"),
> +                ]),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/hasSensitive=
PersonalInformation",
> +            compact=3D"dataset_hasSensitivePersonalInformation",
> +        )
> +        # Describes what the given dataset should be used for.
> +        cls._add_property(
> +            "dataset_intendedUse",
> +            StringProp(),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/intendedUse"=
,
> +            compact=3D"dataset_intendedUse",
> +        )
> +        # Records the biases that the dataset is known to encompass.
> +        cls._add_property(
> +            "dataset_knownBias",
> +            ListProp(StringProp()),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/knownBias",
> +            compact=3D"dataset_knownBias",
> +        )
> +        # Describes a sensor used for collecting the data.
> +        cls._add_property(
> +            "dataset_sensor",
> +            ListProp(ObjectProp(DictionaryEntry, False)),
> +            iri=3D"https://spdx.org/rdf/3.0.1/terms/Dataset/sensor",
> +            compact=3D"dataset_sensor",
> +        )
> +
> +
> +"""Format Guard"""
> +# fmt: on
> +
> +
> +def main():
> +    import argparse
> +    from pathlib import Path
> +
> +    parser =3D argparse.ArgumentParser(description=3D"Python SHACL model=
 test")
> +    parser.add_argument("infile", type=3DPath, help=3D"Input file")
> +    parser.add_argument("--print", action=3D"store_true", help=3D"Print =
object tree")
> +    parser.add_argument("--outfile", type=3DPath, help=3D"Output file")
> +
> +    args =3D parser.parse_args()
> +
> +    objectset =3D SHACLObjectSet()
> +    with args.infile.open("r") as f:
> +        d =3D JSONLDDeserializer()
> +        d.read(f, objectset)
> +
> +    if args.print:
> +        print_tree(objectset.objects)
> +
> +    if args.outfile:
> +        with args.outfile.open("wb") as f:
> +            s =3D JSONLDSerializer()
> +            s.write(objectset, f)
> +
> +    return 0
> +
> +
> +if __name__ =3D=3D "__main__":
> +    sys.exit(main())
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> new file mode 100644
> index 0000000000..52329760b6
> --- /dev/null
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -0,0 +1,1348 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +
> +import json
> +import oe.cve_check
> +import oe.packagedata
> +import oe.patch
> +import oe.sbom30
> +import oe.spdx30
> +import oe.spdx_common
> +import oe.sdk
> +import os
> +
> +from contextlib import contextmanager
> +from datetime import datetime, timezone
> +from pathlib import Path
> +
> +
> +def walk_error(err):
> +    bb.error(f"ERROR walking {err.filename}: {err}")
> +
> +
> +def set_timestamp_now(d, o, prop):
> +    if d.getVar("SPDX_INCLUDE_TIMESTAMPS") =3D=3D "1":
> +        setattr(o, prop, datetime.now(timezone.utc))
> +    else:
> +        # Doing this helps to validated that the property actually exist=
s, and
> +        # also that it is not mandatory
> +        delattr(o, prop)
> +
> +
> +def add_license_expression(d, objset, license_expression, license_data):
> +    simple_license_text =3D {}
> +    license_text_map =3D {}
> +    license_ref_idx =3D 0
> +
> +    def add_license_text(name):
> +        nonlocal objset
> +        nonlocal simple_license_text
> +
> +        if name in simple_license_text:
> +            return simple_license_text[name]
> +
> +        lic =3D objset.find_filter(
> +            oe.spdx30.simplelicensing_SimpleLicensingText,
> +            name=3Dname,
> +        )
> +
> +        if lic is not None:
> +            simple_license_text[name] =3D lic
> +            return lic
> +
> +        lic =3D objset.add(
> +            oe.spdx30.simplelicensing_SimpleLicensingText(
> +                _id=3Dobjset.new_spdxid("license-text", name),
> +                creationInfo=3Dobjset.doc.creationInfo,
> +                name=3Dname,
> +            )
> +        )
> +        objset.set_element_alias(lic)
> +        simple_license_text[name] =3D lic
> +
> +        if name =3D=3D "PD":
> +            lic.simplelicensing_licenseText =3D "Software released to th=
e public domain"
> +            return lic
> +
> +        # Seach for the license in COMMON_LICENSE_DIR and LICENSE_PATH
> +        for directory in [d.getVar("COMMON_LICENSE_DIR")] + (
> +            d.getVar("LICENSE_PATH") or ""
> +        ).split():
> +            try:
> +                with (Path(directory) / name).open(errors=3D"replace") a=
s f:
> +                    lic.simplelicensing_licenseText =3D f.read()
> +                    return lic
> +
> +            except FileNotFoundError:
> +                pass
> +
> +        # If it's not SPDX or PD, then NO_GENERIC_LICENSE must be set
> +        filename =3D d.getVarFlag("NO_GENERIC_LICENSE", name)
> +        if filename:
> +            filename =3D d.expand("${S}/" + filename)
> +            with open(filename, errors=3D"replace") as f:
> +                lic.simplelicensing_licenseText =3D f.read()
> +                return lic
> +        else:
> +            bb.fatal("Cannot find any text for license %s" % name)
> +
> +    def convert(l):
> +        nonlocal license_text_map
> +        nonlocal license_ref_idx
> +
> +        if l =3D=3D "(" or l =3D=3D ")":
> +            return l
> +
> +        if l =3D=3D "&":
> +            return "AND"
> +
> +        if l =3D=3D "|":
> +            return "OR"
> +
> +        if l =3D=3D "CLOSED":
> +            return "NONE"
> +
> +        spdx_license =3D d.getVarFlag("SPDXLICENSEMAP", l) or l
> +        if spdx_license in license_data["licenses"]:
> +            return spdx_license
> +
> +        spdx_license =3D "LicenseRef-" + l
> +        if spdx_license not in license_text_map:
> +            license_text_map[spdx_license] =3D oe.sbom30.get_element_lin=
k_id(
> +                add_license_text(l)
> +            )
> +
> +        return spdx_license
> +
> +    lic_split =3D (
> +        license_expression.replace("(", " ( ")
> +        .replace(")", " ) ")
> +        .replace("|", " | ")
> +        .replace("&", " & ")
> +        .split()
> +    )
> +    spdx_license_expression =3D " ".join(convert(l) for l in lic_split)
> +
> +    o =3D objset.new_license_expression(
> +        spdx_license_expression, license_data, license_text_map
> +    )
> +    objset.set_element_alias(o)
> +    return o
> +
> +
> +def add_package_files(
> +    d,
> +    objset,
> +    topdir,
> +    get_spdxid,
> +    get_purposes,
> +    license_data=3DNone,
> +    *,
> +    archive=3DNone,
> +    ignore_dirs=3D[],
> +    ignore_top_level_dirs=3D[],
> +):
> +    source_date_epoch =3D d.getVar("SOURCE_DATE_EPOCH")
> +    if source_date_epoch:
> +        source_date_epoch =3D int(source_date_epoch)
> +
> +    spdx_files =3D set()
> +
> +    file_counter =3D 1
> +    if not os.path.exists(topdir):
> +        bb.note(f"Skip {topdir}")
> +        return spdx_files
> +
> +    for subdir, dirs, files in os.walk(topdir, onerror=3Dwalk_error):
> +        dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
> +        if subdir =3D=3D str(topdir):
> +            dirs[:] =3D [d for d in dirs if d not in ignore_top_level_di=
rs]
> +
> +        dirs.sort()
> +        files.sort()
> +        for file in files:
> +            filepath =3D Path(subdir) / file
> +            if filepath.is_symlink() or not filepath.is_file():
> +                continue
> +
> +            filename =3D str(filepath.relative_to(topdir))
> +            file_purposes =3D get_purposes(filepath)
> +
> +            spdx_file =3D objset.new_file(
> +                get_spdxid(file_counter),
> +                filename,
> +                filepath,
> +                purposes=3Dfile_purposes,
> +            )
> +            spdx_files.add(spdx_file)
> +
> +            if (
> +                oe.spdx30.software_SoftwarePurpose.source in file_purpos=
es
> +                and license_data is not None
> +            ):
> +                objset.scan_declared_licenses(spdx_file, filepath, licen=
se_data)
> +
> +            if archive is not None:
> +                with filepath.open("rb") as f:
> +                    info =3D archive.gettarinfo(fileobj=3Df)
> +                    info.name =3D filename
> +                    info.uid =3D 0
> +                    info.gid =3D 0
> +                    info.uname =3D "root"
> +                    info.gname =3D "root"
> +
> +                    if source_date_epoch is not None and info.mtime > so=
urce_date_epoch:
> +                        info.mtime =3D source_date_epoch
> +
> +                    archive.addfile(info, f)
> +
> +            file_counter +=3D 1
> +
> +    bb.debug(1, "Added %d files to %s" % (len(spdx_files), objset.doc._i=
d))
> +
> +    return spdx_files
> +
> +
> +def get_package_sources_from_debug(
> +    d, package, package_files, sources, source_hash_cache
> +):
> +    def file_path_match(file_path, pkg_file):
> +        if file_path.lstrip("/") =3D=3D pkg_file.name.lstrip("/"):
> +            return True
> +
> +        for e in pkg_file.extension:
> +            if isinstance(e, oe.sbom30.OEFileNameAliasExtension):
> +                for a in e.aliases:
> +                    if file_path.lstrip("/") =3D=3D a.lstrip("/"):
> +                        return True
> +
> +        return False
> +
> +    debug_search_paths =3D [
> +        Path(d.getVar("SPDXWORK")),
> +        Path(d.getVar("PKGD")),
> +        Path(d.getVar("STAGING_DIR_TARGET")),
> +        Path(d.getVar("STAGING_DIR_NATIVE")),
> +        Path(d.getVar("STAGING_KERNEL_DIR")),
> +    ]
> +
> +    pkg_data =3D oe.packagedata.read_subpkgdata_extended(package, d)
> +
> +    if pkg_data is None:
> +        return
> +
> +    dep_source_files =3D set()
> +
> +    for file_path, file_data in pkg_data["files_info"].items():
> +        if not "debugsrc" in file_data:
> +            continue
> +
> +        if not any(file_path_match(file_path, pkg_file) for pkg_file in =
package_files):
> +            bb.fatal(
> +                "No package file found for %s in %s; SPDX found: %s"
> +                % (str(file_path), package, " ".join(p.name for p in pac=
kage_files))
> +            )
> +            continue
> +
> +        for debugsrc in file_data["debugsrc"]:
> +            for search in debug_search_paths:
> +                if debugsrc.startswith("/usr/src/kernel"):
> +                    debugsrc_path =3D search / debugsrc.replace("/usr/sr=
c/kernel/", "")
> +                else:
> +                    debugsrc_path =3D search / debugsrc.lstrip("/")
> +
> +                if debugsrc_path in source_hash_cache:
> +                    file_sha256 =3D source_hash_cache[debugsrc_path]
> +                    if file_sha256 is None:
> +                        continue
> +                else:
> +                    # We can only hash files below, skip directories, li=
nks, etc.
> +                    if not debugsrc_path.is_file():
> +                        source_hash_cache[debugsrc_path] =3D None
> +                        continue
> +
> +                    file_sha256 =3D bb.utils.sha256_file(debugsrc_path)
> +                    source_hash_cache[debugsrc_path] =3D file_sha256
> +
> +                if file_sha256 in sources:
> +                    source_file =3D sources[file_sha256]
> +                    dep_source_files.add(source_file)
> +                else:
> +                    bb.debug(
> +                        1,
> +                        "Debug source %s with SHA256 %s not found in any=
 dependency"
> +                        % (str(debugsrc_path), file_sha256),
> +                    )
> +                break
> +            else:
> +                bb.debug(1, "Debug source %s not found" % debugsrc)
> +
> +    return dep_source_files
> +
> +
> +def collect_dep_objsets(d, build):
> +    deps =3D oe.spdx_common.get_spdx_deps(d)
> +
> +    dep_objsets =3D []
> +    dep_builds =3D set()
> +
> +    dep_build_spdxids =3D set()
> +    for dep in deps:
> +        bb.debug(1, "Fetching SPDX for dependency %s" % (dep.pn))
> +        dep_build, dep_objset =3D oe.sbom30.find_root_obj_in_jsonld(
> +            d, "recipes", "recipe-" + dep.pn, oe.spdx30.build_Build
> +        )
> +        # If the dependency is part of the taskhash, return it to be lin=
ked
> +        # against. Otherwise, it cannot be linked against because this r=
ecipe
> +        # will not rebuilt if dependency changes
> +        if dep.in_taskhash:
> +            dep_objsets.append(dep_objset)
> +
> +        # The build _can_ be linked against (by alias)
> +        dep_builds.add(dep_build)
> +
> +    return dep_objsets, dep_builds
> +
> +
> +def index_sources_by_hash(sources, dest):
> +    for s in sources:
> +        if not isinstance(s, oe.spdx30.software_File):
> +            continue
> +
> +        if s.software_primaryPurpose !=3D oe.spdx30.software_SoftwarePur=
pose.source:
> +            continue
> +
> +        for v in s.verifiedUsing:
> +            if v.algorithm =3D=3D oe.spdx30.HashAlgorithm.sha256:
> +                if not v.hashValue in dest:
> +                    dest[v.hashValue] =3D s
> +                break
> +        else:
> +            bb.fatal(f"No SHA256 found for {s.name}")
> +
> +
> +def collect_dep_sources(dep_objsets, dest):
> +    for objset in dep_objsets:
> +        # Don't collect sources from native recipes as they
> +        # match non-native sources also.
> +        if objset.is_native():
> +            continue
> +
> +        bb.debug(1, "Fetching Sources for dependency %s" % (objset.doc.n=
ame))
> +
> +        dep_build =3D objset.find_root(oe.spdx30.build_Build)
> +        if not dep_build:
> +            bb.fatal("Unable to find a build")
> +
> +        for e in objset.foreach_type(oe.spdx30.Relationship):
> +            if dep_build is not e.from_:
> +                continue
> +
> +            if e.relationshipType !=3D oe.spdx30.RelationshipType.hasInp=
ut:
> +                continue
> +
> +            index_sources_by_hash(e.to, dest)
> +
> +
> +def add_download_files(d, objset):
> +    inputs =3D set()
> +
> +    urls =3D d.getVar("SRC_URI").split()
> +    fetch =3D bb.fetch2.Fetch(urls, d)
> +
> +    for download_idx, src_uri in enumerate(urls):
> +        fd =3D fetch.ud[src_uri]
> +
> +        file_name =3D os.path.basename(fetch.localpath(src_uri))
> +        if oe.patch.patch_path(src_uri, fetch, "", expand=3DFalse):
> +            primary_purpose =3D oe.spdx30.software_SoftwarePurpose.patch
> +        else:
> +            primary_purpose =3D oe.spdx30.software_SoftwarePurpose.sourc=
e
> +
> +        if fd.type =3D=3D "file":
> +            if os.path.isdir(fd.localpath):
> +                walk_idx =3D 1
> +                for root, dirs, files in os.walk(fd.localpath, onerror=
=3Dwalk_error):
> +                    dirs.sort()
> +                    files.sort()
> +                    for f in files:
> +                        f_path =3D os.path.join(root, f)
> +                        if os.path.islink(f_path):
> +                            # TODO: SPDX doesn't support symlinks yet
> +                            continue
> +
> +                        file =3D objset.new_file(
> +                            objset.new_spdxid(
> +                                "source", str(download_idx + 1), str(wal=
k_idx)
> +                            ),
> +                            os.path.join(
> +                                file_name, os.path.relpath(f_path, fd.lo=
calpath)
> +                            ),
> +                            f_path,
> +                            purposes=3D[primary_purpose],
> +                        )
> +
> +                        inputs.add(file)
> +                        walk_idx +=3D 1
> +
> +            else:
> +                file =3D objset.new_file(
> +                    objset.new_spdxid("source", str(download_idx + 1)),
> +                    file_name,
> +                    fd.localpath,
> +                    purposes=3D[primary_purpose],
> +                )
> +                inputs.add(file)
> +
> +        else:
> +            dl =3D objset.add(
> +                oe.spdx30.software_Package(
> +                    _id=3Dobjset.new_spdxid("source", str(download_idx +=
 1)),
> +                    creationInfo=3Dobjset.doc.creationInfo,
> +                    name=3Dfile_name,
> +                    software_primaryPurpose=3Dprimary_purpose,
> +                    software_downloadLocation=3Doe.spdx_common.fetch_dat=
a_to_uri(
> +                        fd, fd.name
> +                    ),
> +                )
> +            )
> +
> +            if fd.method.supports_checksum(fd):
> +                # TODO Need something better than hard coding this
> +                for checksum_id in ["sha256", "sha1"]:
> +                    expected_checksum =3D getattr(
> +                        fd, "%s_expected" % checksum_id, None
> +                    )
> +                    if expected_checksum is None:
> +                        continue
> +
> +                    dl.verifiedUsing.append(
> +                        oe.spdx30.Hash(
> +                            algorithm=3Dgetattr(oe.spdx30.HashAlgorithm,=
 checksum_id),
> +                            hashValue=3Dexpected_checksum,
> +                        )
> +                    )
> +
> +            inputs.add(dl)
> +
> +    return inputs
> +
> +
> +def set_purposes(d, element, *var_names, force_purposes=3D[]):
> +    purposes =3D force_purposes[:]
> +
> +    for var_name in var_names:
> +        val =3D d.getVar(var_name)
> +        if val:
> +            purposes.extend(val.split())
> +            break
> +
> +    if not purposes:
> +        bb.warn("No SPDX purposes found in %s" % " ".join(var_names))
> +        return
> +
> +    element.software_primaryPurpose =3D getattr(
> +        oe.spdx30.software_SoftwarePurpose, purposes[0]
> +    )
> +    element.software_additionalPurpose =3D [
> +        getattr(oe.spdx30.software_SoftwarePurpose, p) for p in purposes=
[1:]
> +    ]
> +
> +
> +def create_spdx(d):
> +    def set_var_field(var, obj, name, package=3DNone):
> +        val =3D None
> +        if package:
> +            val =3D d.getVar("%s:%s" % (var, package))
> +
> +        if not val:
> +            val =3D d.getVar(var)
> +
> +        if val:
> +            setattr(obj, name, val)
> +
> +    license_data =3D oe.spdx_common.load_spdx_license_data(d)
> +
> +    deploydir =3D Path(d.getVar("SPDXDEPLOY"))
> +    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
> +    spdx_workdir =3D Path(d.getVar("SPDXWORK"))
> +    include_sources =3D d.getVar("SPDX_INCLUDE_SOURCES") =3D=3D "1"
> +    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
> +    is_native =3D bb.data.inherits_class("native", d) or bb.data.inherit=
s_class(
> +        "cross", d
> +    )
> +    include_vex =3D d.getVar("SPDX_INCLUDE_VEX")
> +    if not include_vex in ("none", "current", "all"):
> +        bb.fatal("SPDX_INCLUDE_VEX must be one of 'none', 'current', 'al=
l'")
> +
> +    build_objset =3D oe.sbom30.ObjectSet.new_objset(d, "recipe-" + d.get=
Var("PN"))
> +
> +    build =3D build_objset.new_task_build("recipe", "recipe")
> +    build_objset.set_element_alias(build)
> +
> +    build_objset.doc.rootElement.append(build)
> +
> +    build_objset.set_is_native(is_native)
> +
> +    for var in (d.getVar("SPDX_CUSTOM_ANNOTATION_VARS") or "").split():
> +        new_annotation(
> +            d,
> +            build_objset,
> +            build,
> +            "%s=3D%s" % (var, d.getVar(var)),
> +            oe.spdx30.AnnotationType.other,
> +        )
> +
> +    build_inputs =3D set()
> +
> +    # Add CVEs
> +    cve_by_status =3D {}
> +    if include_vex !=3D "none":
> +        patched_cves =3D oe.cve_check.get_patched_cves(d)
> +        for cve, patched_cve in patched_cves.items():
> +            decoded_status =3D {
> +                "mapping": patched_cve["abbrev-status"],
> +                "detail": patched_cve["status"],
> +                "description": patched_cve.get("justification", None)
> +            }
> +
> +            # If this CVE is fixed upstream, skip it unless all CVEs are
> +            # specified.
> +            if (
> +                include_vex !=3D "all"
> +                and "detail" in decoded_status
> +                and decoded_status["detail"]
> +                in (
> +                    "fixed-version",
> +                    "cpe-stable-backport",
> +                )
> +            ):
> +                bb.debug(1, "Skipping %s since it is already fixed upstr=
eam" % cve)
> +                continue
> +
> +            spdx_cve =3D build_objset.new_cve_vuln(cve)
> +            build_objset.set_element_alias(spdx_cve)
> +
> +            cve_by_status.setdefault(decoded_status["mapping"], {})[cve]=
 =3D (
> +                spdx_cve,
> +                decoded_status["detail"],
> +                decoded_status["description"],
> +            )
> +
> +    cpe_ids =3D oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"), d.getV=
ar("CVE_VERSION"))
> +
> +    source_files =3D add_download_files(d, build_objset)
> +    build_inputs |=3D source_files
> +
> +    recipe_spdx_license =3D add_license_expression(
> +        d, build_objset, d.getVar("LICENSE"), license_data
> +    )
> +    build_objset.new_relationship(
> +        source_files,
> +        oe.spdx30.RelationshipType.hasConcludedLicense,
> +        [oe.sbom30.get_element_link_id(recipe_spdx_license)],
> +    )
> +
> +    dep_sources =3D {}
> +    if oe.spdx_common.process_sources(d) and include_sources:
> +        bb.debug(1, "Adding source files to SPDX")
> +        oe.spdx_common.get_patched_src(d)
> +
> +        files =3D add_package_files(
> +            d,
> +            build_objset,
> +            spdx_workdir,
> +            lambda file_counter: build_objset.new_spdxid(
> +                "sourcefile", str(file_counter)
> +            ),
> +            lambda filepath: [oe.spdx30.software_SoftwarePurpose.source]=
,
> +            license_data,
> +            ignore_dirs=3D[".git"],
> +            ignore_top_level_dirs=3D["temp"],
> +            archive=3DNone,
> +        )
> +        build_inputs |=3D files
> +        index_sources_by_hash(files, dep_sources)
> +
> +    dep_objsets, dep_builds =3D collect_dep_objsets(d, build)
> +    if dep_builds:
> +        build_objset.new_scoped_relationship(
> +            [build],
> +            oe.spdx30.RelationshipType.dependsOn,
> +            oe.spdx30.LifecycleScopeType.build,
> +            sorted(oe.sbom30.get_element_link_id(b) for b in dep_builds)=
,
> +        )
> +
> +    debug_source_ids =3D set()
> +    source_hash_cache =3D {}
> +
> +    # Write out the package SPDX data now. It is not complete as we cann=
ot
> +    # write the runtime data, so write it to a staging area and a later =
task
> +    # will write out the final collection
> +
> +    # TODO: Handle native recipe output
> +    if not is_native:
> +        bb.debug(1, "Collecting Dependency sources files")
> +        collect_dep_sources(dep_objsets, dep_sources)
> +
> +        bb.build.exec_func("read_subpackage_metadata", d)
> +
> +        pkgdest =3D Path(d.getVar("PKGDEST"))
> +        for package in d.getVar("PACKAGES").split():
> +            if not oe.packagedata.packaged(package, d):
> +                continue
> +
> +            pkg_name =3D d.getVar("PKG:%s" % package) or package
> +
> +            bb.debug(1, "Creating SPDX for package %s" % pkg_name)
> +
> +            pkg_objset =3D oe.sbom30.ObjectSet.new_objset(d, "package-" =
+ pkg_name)
> +
> +            spdx_package =3D pkg_objset.add_root(
> +                oe.spdx30.software_Package(
> +                    _id=3Dpkg_objset.new_spdxid("package", pkg_name),
> +                    creationInfo=3Dpkg_objset.doc.creationInfo,
> +                    name=3Dpkg_name,
> +                    software_packageVersion=3Dd.getVar("SPDX_PACKAGE_VER=
SION"),
> +                )
> +            )
> +            set_timestamp_now(d, spdx_package, "builtTime")
> +
> +            set_purposes(
> +                d,
> +                spdx_package,
> +                "SPDX_PACKAGE_ADDITIONAL_PURPOSE:%s" % package,
> +                "SPDX_PACKAGE_ADDITIONAL_PURPOSE",
> +                force_purposes=3D["install"],
> +            )
> +
> +            supplier =3D build_objset.new_agent("SPDX_PACKAGE_SUPPLIER")
> +            if supplier is not None:
> +                spdx_package.suppliedBy =3D (
> +                    supplier if isinstance(supplier, str) else supplier.=
_id
> +                )
> +
> +            set_var_field(
> +                "HOMEPAGE", spdx_package, "software_homePage", package=
=3Dpackage
> +            )
> +            set_var_field("SUMMARY", spdx_package, "summary", package=3D=
package)
> +            set_var_field("DESCRIPTION", spdx_package, "description", pa=
ckage=3Dpackage)
> +
> +            pkg_objset.new_scoped_relationship(
> +                [oe.sbom30.get_element_link_id(build)],
> +                oe.spdx30.RelationshipType.hasOutput,
> +                oe.spdx30.LifecycleScopeType.build,
> +                [spdx_package],
> +            )
> +
> +            for cpe_id in cpe_ids:
> +                spdx_package.externalIdentifier.append(
> +                    oe.spdx30.ExternalIdentifier(
> +                        externalIdentifierType=3Doe.spdx30.ExternalIdent=
ifierType.cpe23,
> +                        identifier=3Dcpe_id,
> +                    )
> +                )
> +
> +            # TODO: Generate a file for each actual IPK/DEB/RPM/TGZ file
> +            # generated and link it to the package
> +            # spdx_package_file =3D pkg_objset.add(oe.spdx30.software_Fi=
le(
> +            #    _id=3Dpkg_objset.new_spdxid("distribution", pkg_name),
> +            #    creationInfo=3Dpkg_objset.doc.creationInfo,
> +            #    name=3Dpkg_name,
> +            #    software_primaryPurpose=3Dspdx_package.software_primary=
Purpose,
> +            #    software_additionalPurpose=3Dspdx_package.software_addi=
tionalPurpose,
> +            # ))
> +            # set_timestamp_now(d, spdx_package_file, "builtTime")
> +
> +            ## TODO add hashes
> +            # pkg_objset.new_relationship(
> +            #    [spdx_package],
> +            #    oe.spdx30.RelationshipType.hasDistributionArtifact,
> +            #    [spdx_package_file],
> +            # )
> +
> +            # NOTE: licenses live in the recipe collection and are refer=
enced
> +            # by ID in the package collection(s). This helps reduce dupl=
ication
> +            # (since a lot of packages will have the same license), and =
also
> +            # prevents duplicate license SPDX IDs in the packages
> +            package_license =3D d.getVar("LICENSE:%s" % package)
> +            if package_license and package_license !=3D d.getVar("LICENS=
E"):
> +                package_spdx_license =3D add_license_expression(
> +                    d, build_objset, package_license, license_data
> +                )
> +            else:
> +                package_spdx_license =3D recipe_spdx_license
> +
> +            pkg_objset.new_relationship(
> +                [spdx_package],
> +                oe.spdx30.RelationshipType.hasConcludedLicense,
> +                [oe.sbom30.get_element_link_id(package_spdx_license)],
> +            )
> +
> +            # NOTE: CVE Elements live in the recipe collection
> +            all_cves =3D set()
> +            for status, cves in cve_by_status.items():
> +                for cve, items in cves.items():
> +                    spdx_cve, detail, description =3D items
> +                    spdx_cve_id =3D oe.sbom30.get_element_link_id(spdx_c=
ve)
> +
> +                    all_cves.add(spdx_cve_id)
> +
> +                    if status =3D=3D "Patched":
> +                        pkg_objset.new_vex_patched_relationship(
> +                            [spdx_cve_id], [spdx_package]
> +                        )
> +                    elif status =3D=3D "Unpatched":
> +                        pkg_objset.new_vex_unpatched_relationship(
> +                            [spdx_cve_id], [spdx_package]
> +                        )
> +                    elif status =3D=3D "Ignored":
> +                        spdx_vex =3D pkg_objset.new_vex_ignored_relation=
ship(
> +                            [spdx_cve_id],
> +                            [spdx_package],
> +                            impact_statement=3Ddescription,
> +                        )
> +
> +                        if detail in (
> +                            "ignored",
> +                            "cpe-incorrect",
> +                            "disputed",
> +                            "upstream-wontfix",
> +                        ):
> +                            # VEX doesn't have justifications for this
> +                            pass
> +                        elif detail in (
> +                            "not-applicable-config",
> +                            "not-applicable-platform",
> +                        ):
> +                            for v in spdx_vex:
> +                                v.security_justificationType =3D (
> +                                    oe.spdx30.security_VexJustificationT=
ype.vulnerableCodeNotPresent
> +                                )
> +                        else:
> +                            bb.fatal(f"Unknown detail '{detail}' for ign=
ored {cve}")
> +                    else:
> +                        bb.fatal(f"Unknown {cve} status '{status}'")
> +
> +            if all_cves:
> +                pkg_objset.new_relationship(
> +                    [spdx_package],
> +                    oe.spdx30.RelationshipType.hasAssociatedVulnerabilit=
y,
> +                    sorted(list(all_cves)),
> +                )
> +
> +            bb.debug(1, "Adding package files to SPDX for package %s" % =
pkg_name)
> +            package_files =3D add_package_files(
> +                d,
> +                pkg_objset,
> +                pkgdest / package,
> +                lambda file_counter: pkg_objset.new_spdxid(
> +                    "package", pkg_name, "file", str(file_counter)
> +                ),
> +                # TODO: Can we know the purpose here?
> +                lambda filepath: [],
> +                license_data,
> +                ignore_top_level_dirs=3D["CONTROL", "DEBIAN"],
> +                archive=3DNone,
> +            )
> +
> +            if package_files:
> +                pkg_objset.new_relationship(
> +                    [spdx_package],
> +                    oe.spdx30.RelationshipType.contains,
> +                    sorted(list(package_files)),
> +                )
> +
> +            if include_sources:
> +                debug_sources =3D get_package_sources_from_debug(
> +                    d, package, package_files, dep_sources, source_hash_=
cache
> +                )
> +                debug_source_ids |=3D set(
> +                    oe.sbom30.get_element_link_id(d) for d in debug_sour=
ces
> +                )
> +
> +            oe.sbom30.write_recipe_jsonld_doc(
> +                d, pkg_objset, "packages-staging", deploydir, create_spd=
x_id_links=3DFalse
> +            )
> +
> +    if include_sources:
> +        bb.debug(1, "Adding sysroot files to SPDX")
> +        sysroot_files =3D add_package_files(
> +            d,
> +            build_objset,
> +            d.expand("${COMPONENTS_DIR}/${PACKAGE_ARCH}/${PN}"),
> +            lambda file_counter: build_objset.new_spdxid("sysroot", str(=
file_counter)),
> +            lambda filepath: [],
> +            license_data,
> +            archive=3DNone,
> +        )
> +
> +        if sysroot_files:
> +            build_objset.new_scoped_relationship(
> +                [build],
> +                oe.spdx30.RelationshipType.hasOutput,
> +                oe.spdx30.LifecycleScopeType.build,
> +                sorted(list(sysroot_files)),
> +            )
> +
> +    if build_inputs or debug_source_ids:
> +        build_objset.new_scoped_relationship(
> +            [build],
> +            oe.spdx30.RelationshipType.hasInput,
> +            oe.spdx30.LifecycleScopeType.build,
> +            sorted(list(build_inputs)) + sorted(list(debug_source_ids)),
> +        )
> +
> +    oe.sbom30.write_recipe_jsonld_doc(d, build_objset, "recipes", deploy=
dir)
> +
> +
> +def create_package_spdx(d):
> +    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
> +    deploydir =3D Path(d.getVar("SPDXRUNTIMEDEPLOY"))
> +    is_native =3D bb.data.inherits_class("native", d) or bb.data.inherit=
s_class(
> +        "cross", d
> +    )
> +
> +    providers =3D oe.spdx_common.collect_package_providers(d)
> +    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
> +
> +    if is_native:
> +        return
> +
> +    bb.build.exec_func("read_subpackage_metadata", d)
> +
> +    dep_package_cache =3D {}
> +
> +    # Any element common to all packages that need to be referenced by I=
D
> +    # should be written into this objset set
> +    common_objset =3D oe.sbom30.ObjectSet.new_objset(
> +        d, "%s-package-common" % d.getVar("PN")
> +    )
> +
> +    pkgdest =3D Path(d.getVar("PKGDEST"))
> +    for package in d.getVar("PACKAGES").split():
> +        localdata =3D bb.data.createCopy(d)
> +        pkg_name =3D d.getVar("PKG:%s" % package) or package
> +        localdata.setVar("PKG", pkg_name)
> +        localdata.setVar("OVERRIDES", d.getVar("OVERRIDES", False) + ":"=
 + package)
> +
> +        if not oe.packagedata.packaged(package, localdata):
> +            continue
> +
> +        spdx_package, pkg_objset =3D oe.sbom30.load_obj_in_jsonld(
> +            d,
> +            pkg_arch,
> +            "packages-staging",
> +            "package-" + pkg_name,
> +            oe.spdx30.software_Package,
> +            software_primaryPurpose=3Doe.spdx30.software_SoftwarePurpose=
.install,
> +        )
> +
> +        # We will write out a new collection, so link it to the new
> +        # creation info in the common package data. The old creation inf=
o
> +        # should still exist and be referenced by all the existing eleme=
nts
> +        # in the package
> +        pkg_objset.creationInfo =3D pkg_objset.copy_creation_info(
> +            common_objset.doc.creationInfo
> +        )
> +
> +        runtime_spdx_deps =3D set()
> +
> +        deps =3D bb.utils.explode_dep_versions2(localdata.getVar("RDEPEN=
DS") or "")
> +        seen_deps =3D set()
> +        for dep, _ in deps.items():
> +            if dep in seen_deps:
> +                continue
> +
> +            if dep not in providers:
> +                continue
> +
> +            (dep, _) =3D providers[dep]
> +
> +            if not oe.packagedata.packaged(dep, localdata):
> +                continue
> +
> +            dep_pkg_data =3D oe.packagedata.read_subpkgdata_dict(dep, d)
> +            dep_pkg =3D dep_pkg_data["PKG"]
> +
> +            if dep in dep_package_cache:
> +                dep_spdx_package =3D dep_package_cache[dep]
> +            else:
> +                bb.debug(1, "Searching for %s" % dep_pkg)
> +                dep_spdx_package, _ =3D oe.sbom30.find_root_obj_in_jsonl=
d(
> +                    d,
> +                    "packages-staging",
> +                    "package-" + dep_pkg,
> +                    oe.spdx30.software_Package,
> +                    software_primaryPurpose=3Doe.spdx30.software_Softwar=
ePurpose.install,
> +                )
> +                dep_package_cache[dep] =3D dep_spdx_package
> +
> +            runtime_spdx_deps.add(dep_spdx_package)
> +            seen_deps.add(dep)
> +
> +        if runtime_spdx_deps:
> +            pkg_objset.new_scoped_relationship(
> +                [spdx_package],
> +                oe.spdx30.RelationshipType.dependsOn,
> +                oe.spdx30.LifecycleScopeType.runtime,
> +                [oe.sbom30.get_element_link_id(dep) for dep in runtime_s=
pdx_deps],
> +            )
> +
> +        oe.sbom30.write_recipe_jsonld_doc(d, pkg_objset, "packages", dep=
loydir)
> +
> +    oe.sbom30.write_recipe_jsonld_doc(d, common_objset, "common-package"=
, deploydir)
> +
> +
> +def write_bitbake_spdx(d):
> +    # Set PN to "bitbake" so that SPDX IDs can be generated
> +    d.setVar("PN", "bitbake")
> +    d.setVar("BB_TASKHASH", "bitbake")
> +    oe.spdx_common.load_spdx_license_data(d)
> +
> +    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
> +
> +    objset =3D oe.sbom30.ObjectSet.new_objset(d, "bitbake", False)
> +
> +    host_import_key =3D d.getVar("SPDX_BUILD_HOST")
> +    invoked_by =3D objset.new_agent("SPDX_INVOKED_BY", add=3DFalse)
> +    on_behalf_of =3D objset.new_agent("SPDX_ON_BEHALF_OF", add=3DFalse)
> +
> +    if d.getVar("SPDX_INCLUDE_BITBAKE_PARENT_BUILD") =3D=3D "1":
> +        # Since the Build objects are unique, we may as well set the cre=
ation
> +        # time to the current time instead of the fallback SDE
> +        objset.doc.creationInfo.created =3D datetime.now(timezone.utc)
> +
> +        # Each invocation of bitbake should have a unique ID since it is=
 a
> +        # unique build
> +        nonce =3D os.urandom(16).hex()
> +
> +        build =3D objset.add_root(
> +            oe.spdx30.build_Build(
> +                _id=3Dobjset.new_spdxid(nonce, include_unihash=3DFalse),
> +                creationInfo=3Dobjset.doc.creationInfo,
> +                build_buildType=3Doe.sbom30.SPDX_BUILD_TYPE,
> +            )
> +        )
> +        set_timestamp_now(d, build, "build_buildStartTime")
> +
> +        if host_import_key:
> +            objset.new_scoped_relationship(
> +                [build],
> +                oe.spdx30.RelationshipType.hasHost,
> +                oe.spdx30.LifecycleScopeType.build,
> +                [objset.new_import(host_import_key)],
> +            )
> +
> +        if invoked_by:
> +            objset.add(invoked_by)
> +            invoked_by_spdx =3D objset.new_scoped_relationship(
> +                [build],
> +                oe.spdx30.RelationshipType.invokedBy,
> +                oe.spdx30.LifecycleScopeType.build,
> +                [invoked_by],
> +            )
> +
> +            if on_behalf_of:
> +                objset.add(on_behalf_of)
> +                objset.new_scoped_relationship(
> +                    [on_behalf_of],
> +                    oe.spdx30.RelationshipType.delegatedTo,
> +                    oe.spdx30.LifecycleScopeType.build,
> +                    invoked_by_spdx,
> +                )
> +
> +        elif on_behalf_of:
> +            bb.warn("SPDX_ON_BEHALF_OF has no effect if SPDX_INVOKED_BY =
is not set")
> +
> +    else:
> +        if host_import_key:
> +            bb.warn(
> +                "SPDX_BUILD_HOST has no effect if SPDX_INCLUDE_BITBAKE_P=
ARENT_BUILD is not set"
> +            )
> +
> +        if invoked_by:
> +            bb.warn(
> +                "SPDX_INVOKED_BY has no effect if SPDX_INCLUDE_BITBAKE_P=
ARENT_BUILD is not set"
> +            )
> +
> +        if on_behalf_of:
> +            bb.warn(
> +                "SPDX_ON_BEHALF_OF has no effect if SPDX_INCLUDE_BITBAKE=
_PARENT_BUILD is not set"
> +            )
> +
> +    for obj in objset.foreach_type(oe.spdx30.Element):
> +        obj.extension.append(oe.sbom30.OEIdAliasExtension())
> +
> +    oe.sbom30.write_jsonld_doc(d, objset, deploy_dir_spdx / "bitbake.spd=
x.json")
> +
> +
> +def collect_build_package_inputs(d, objset, build, packages, files_by_ha=
sh=3DNone):
> +    import oe.sbom30
> +
> +    providers =3D oe.spdx_common.collect_package_providers(d)
> +
> +    build_deps =3D set()
> +    missing_providers =3D set()
> +
> +    for name in sorted(packages.keys()):
> +        if name not in providers:
> +            missing_providers.add(name)
> +            continue
> +
> +        pkg_name, pkg_hashfn =3D providers[name]
> +
> +        # Copy all of the package SPDX files into the Sbom elements
> +        pkg_spdx, pkg_objset =3D oe.sbom30.find_root_obj_in_jsonld(
> +            d,
> +            "packages",
> +            "package-" + pkg_name,
> +            oe.spdx30.software_Package,
> +            software_primaryPurpose=3Doe.spdx30.software_SoftwarePurpose=
.install,
> +        )
> +        build_deps.add(oe.sbom30.get_element_link_id(pkg_spdx))
> +
> +        if files_by_hash is not None:
> +            for h, f in pkg_objset.by_sha256_hash.items():
> +                files_by_hash.setdefault(h, set()).update(f)
> +
> +    if missing_providers:
> +        bb.fatal(
> +            f"Unable to find SPDX provider(s) for: {', '.join(sorted(mis=
sing_providers))}"
> +        )
> +
> +    if build_deps:
> +        objset.new_scoped_relationship(
> +            [build],
> +            oe.spdx30.RelationshipType.hasInput,
> +            oe.spdx30.LifecycleScopeType.build,
> +            sorted(list(build_deps)),
> +        )
> +
> +
> +def create_rootfs_spdx(d):
> +    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
> +    deploydir =3D Path(d.getVar("SPDXROOTFSDEPLOY"))
> +    root_packages_file =3D Path(d.getVar("SPDX_ROOTFS_PACKAGES"))
> +    image_basename =3D d.getVar("IMAGE_BASENAME")
> +    image_rootfs =3D d.getVar("IMAGE_ROOTFS")
> +    machine =3D d.getVar("MACHINE")
> +
> +    with root_packages_file.open("r") as f:
> +        packages =3D json.load(f)
> +
> +    objset =3D oe.sbom30.ObjectSet.new_objset(
> +        d, "%s-%s-rootfs" % (image_basename, machine)
> +    )
> +
> +    rootfs =3D objset.add_root(
> +        oe.spdx30.software_Package(
> +            _id=3Dobjset.new_spdxid("rootfs", image_basename),
> +            creationInfo=3Dobjset.doc.creationInfo,
> +            name=3Dimage_basename,
> +            software_primaryPurpose=3Doe.spdx30.software_SoftwarePurpose=
.archive,
> +        )
> +    )
> +    set_timestamp_now(d, rootfs, "builtTime")
> +
> +    rootfs_build =3D objset.add_root(objset.new_task_build("rootfs", "ro=
otfs"))
> +    set_timestamp_now(d, rootfs_build, "build_buildEndTime")
> +
> +    objset.new_scoped_relationship(
> +        [rootfs_build],
> +        oe.spdx30.RelationshipType.hasOutput,
> +        oe.spdx30.LifecycleScopeType.build,
> +        [rootfs],
> +    )
> +
> +    files_by_hash =3D {}
> +    collect_build_package_inputs(d, objset, rootfs_build, packages, file=
s_by_hash)
> +
> +    files =3D set()
> +    for dirpath, dirnames, filenames in os.walk(image_rootfs, onerror=3D=
walk_error):
> +        dirnames.sort()
> +        filenames.sort()
> +        for fn in filenames:
> +            fpath =3D Path(dirpath) / fn
> +            if fpath.is_symlink() or not fpath.is_file():
> +                continue
> +
> +            relpath =3D str(fpath.relative_to(image_rootfs))
> +            h =3D bb.utils.sha256_file(fpath)
> +
> +            found =3D False
> +            if h in files_by_hash:
> +                for f in files_by_hash[h]:
> +                    if isinstance(f, oe.spdx30.software_File) and f.name=
 =3D=3D relpath:
> +                        files.add(oe.sbom30.get_element_link_id(f))
> +                        found =3D True
> +                        break
> +
> +            if not found:
> +                files.add(
> +                    objset.new_file(
> +                        objset.new_spdxid("rootfs-file", relpath),
> +                        relpath,
> +                        fpath,
> +                    )
> +                )
> +
> +    if files:
> +        objset.new_relationship(
> +            [rootfs],
> +            oe.spdx30.RelationshipType.contains,
> +            sorted(list(files)),
> +        )
> +
> +    oe.sbom30.write_recipe_jsonld_doc(d, objset, "rootfs", deploydir)
> +
> +
> +def create_image_spdx(d):
> +    import oe.sbom30
> +
> +    image_deploy_dir =3D Path(d.getVar("IMGDEPLOYDIR"))
> +    manifest_path =3D Path(d.getVar("IMAGE_OUTPUT_MANIFEST"))
> +    spdx_work_dir =3D Path(d.getVar("SPDXIMAGEWORK"))
> +
> +    image_basename =3D d.getVar("IMAGE_BASENAME")
> +    machine =3D d.getVar("MACHINE")
> +
> +    objset =3D oe.sbom30.ObjectSet.new_objset(
> +        d, "%s-%s-image" % (image_basename, machine)
> +    )
> +
> +    with manifest_path.open("r") as f:
> +        manifest =3D json.load(f)
> +
> +    builds =3D []
> +    for task in manifest:
> +        imagetype =3D task["imagetype"]
> +        taskname =3D task["taskname"]
> +
> +        image_build =3D objset.add_root(
> +            objset.new_task_build(taskname, "image/%s" % imagetype)
> +        )
> +        set_timestamp_now(d, image_build, "build_buildEndTime")
> +        builds.append(image_build)
> +
> +        artifacts =3D []
> +
> +        for image in task["images"]:
> +            image_filename =3D image["filename"]
> +            image_path =3D image_deploy_dir / image_filename
> +            if os.path.isdir(image_path):
> +                a =3D add_package_files(
> +                        d,
> +                        objset,
> +                        image_path,
> +                        lambda file_counter: objset.new_spdxid(
> +                            "imagefile", str(file_counter)
> +                        ),
> +                        lambda filepath: [],
> +                        license_data=3DNone,
> +                        ignore_dirs=3D[],
> +                        ignore_top_level_dirs=3D[],
> +                        archive=3DNone,
> +                )
> +                artifacts.extend(a)
> +            else:
> +                a =3D objset.add_root(
> +                    oe.spdx30.software_File(
> +                        _id=3Dobjset.new_spdxid("image", image_filename)=
,
> +                        creationInfo=3Dobjset.doc.creationInfo,
> +                        name=3Dimage_filename,
> +                        verifiedUsing=3D[
> +                            oe.spdx30.Hash(
> +                                algorithm=3Doe.spdx30.HashAlgorithm.sha2=
56,
> +                                hashValue=3Dbb.utils.sha256_file(image_p=
ath),
> +                            )
> +                        ],
> +                    )
> +                )
> +
> +                artifacts.append(a)
> +
> +            for a in artifacts:
> +                set_purposes(
> +                    d, a, "SPDX_IMAGE_PURPOSE:%s" % imagetype, "SPDX_IMA=
GE_PURPOSE"
> +                )
> +
> +                set_timestamp_now(d, a, "builtTime")
> +
> +
> +        if artifacts:
> +            objset.new_scoped_relationship(
> +                [image_build],
> +                oe.spdx30.RelationshipType.hasOutput,
> +                oe.spdx30.LifecycleScopeType.build,
> +                artifacts,
> +            )
> +
> +    if builds:
> +        rootfs_image, _ =3D oe.sbom30.find_root_obj_in_jsonld(
> +            d,
> +            "rootfs",
> +            "%s-%s-rootfs" % (image_basename, machine),
> +            oe.spdx30.software_Package,
> +            # TODO: Should use a purpose to filter here?
> +        )
> +        objset.new_scoped_relationship(
> +            builds,
> +            oe.spdx30.RelationshipType.hasInput,
> +            oe.spdx30.LifecycleScopeType.build,
> +            [oe.sbom30.get_element_link_id(rootfs_image)],
> +        )
> +
> +    objset.add_aliases()
> +    objset.link()
> +    oe.sbom30.write_recipe_jsonld_doc(d, objset, "image", spdx_work_dir)
> +
> +
> +def create_image_sbom_spdx(d):
> +    import oe.sbom30
> +
> +    image_name =3D d.getVar("IMAGE_NAME")
> +    image_basename =3D d.getVar("IMAGE_BASENAME")
> +    image_link_name =3D d.getVar("IMAGE_LINK_NAME")
> +    imgdeploydir =3D Path(d.getVar("SPDXIMAGEDEPLOYDIR"))
> +    machine =3D d.getVar("MACHINE")
> +
> +    spdx_path =3D imgdeploydir / (image_name + ".spdx.json")
> +
> +    root_elements =3D []
> +
> +    # TODO: Do we need to add the rootfs or are the image files sufficie=
nt?
> +    rootfs_image, _ =3D oe.sbom30.find_root_obj_in_jsonld(
> +        d,
> +        "rootfs",
> +        "%s-%s-rootfs" % (image_basename, machine),
> +        oe.spdx30.software_Package,
> +        # TODO: Should use a purpose here?
> +    )
> +    root_elements.append(oe.sbom30.get_element_link_id(rootfs_image))
> +
> +    image_objset, _ =3D oe.sbom30.find_jsonld(
> +        d, "image", "%s-%s-image" % (image_basename, machine), required=
=3DTrue
> +    )
> +    for o in image_objset.foreach_root(oe.spdx30.software_File):
> +        root_elements.append(oe.sbom30.get_element_link_id(o))
> +
> +    objset, sbom =3D oe.sbom30.create_sbom(d, image_name, root_elements)
> +
> +    oe.sbom30.write_jsonld_doc(d, objset, spdx_path)
> +
> +    def make_image_link(target_path, suffix):
> +        if image_link_name:
> +            link =3D imgdeploydir / (image_link_name + suffix)
> +            if link !=3D target_path:
> +                link.symlink_to(os.path.relpath(target_path, link.parent=
))
> +
> +    make_image_link(spdx_path, ".spdx.json")
> +
> +
> +def sdk_create_spdx(d, sdk_type, spdx_work_dir, toolchain_outputname):
> +    sdk_name =3D toolchain_outputname + "-" + sdk_type
> +    sdk_packages =3D oe.sdk.sdk_list_installed_packages(d, sdk_type =3D=
=3D "target")
> +
> +    objset =3D oe.sbom30.ObjectSet.new_objset(d, sdk_name)
> +
> +    sdk_rootfs =3D objset.add_root(
> +        oe.spdx30.software_Package(
> +            _id=3Dobjset.new_spdxid("sdk-rootfs", sdk_name),
> +            creationInfo=3Dobjset.doc.creationInfo,
> +            name=3Dsdk_name,
> +            software_primaryPurpose=3Doe.spdx30.software_SoftwarePurpose=
.archive,
> +        )
> +    )
> +    set_timestamp_now(d, sdk_rootfs, "builtTime")
> +
> +    sdk_build =3D objset.add_root(objset.new_task_build("sdk-rootfs", "s=
dk-rootfs"))
> +    set_timestamp_now(d, sdk_build, "build_buildEndTime")
> +
> +    objset.new_scoped_relationship(
> +        [sdk_build],
> +        oe.spdx30.RelationshipType.hasOutput,
> +        oe.spdx30.LifecycleScopeType.build,
> +        [sdk_rootfs],
> +    )
> +
> +    collect_build_package_inputs(d, objset, sdk_build, sdk_packages)
> +
> +    objset.add_aliases()
> +    oe.sbom30.write_jsonld_doc(d, objset, spdx_work_dir / "sdk-rootfs.sp=
dx.json")
> +
> +
> +def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, toolchain_outputnam=
e):
> +    # Load the document written earlier
> +    rootfs_objset =3D oe.sbom30.load_jsonld(
> +        d, spdx_work_dir / "sdk-rootfs.spdx.json", required=3DTrue
> +    )
> +
> +    # Create a new build for the SDK installer
> +    sdk_build =3D rootfs_objset.new_task_build("sdk-populate", "sdk-popu=
late")
> +    set_timestamp_now(d, sdk_build, "build_buildEndTime")
> +
> +    rootfs =3D rootfs_objset.find_root(oe.spdx30.software_Package)
> +    if rootfs is None:
> +        bb.fatal("Unable to find rootfs artifact")
> +
> +    rootfs_objset.new_scoped_relationship(
> +        [sdk_build],
> +        oe.spdx30.RelationshipType.hasInput,
> +        oe.spdx30.LifecycleScopeType.build,
> +        [rootfs],
> +    )
> +
> +    files =3D set()
> +    root_files =3D []
> +
> +    # NOTE: os.walk() doesn't return symlinks
> +    for dirpath, dirnames, filenames in os.walk(sdk_deploydir, onerror=
=3Dwalk_error):
> +        dirnames.sort()
> +        filenames.sort()
> +        for fn in filenames:
> +            fpath =3D Path(dirpath) / fn
> +            if not fpath.is_file() or fpath.is_symlink():
> +                continue
> +
> +            relpath =3D str(fpath.relative_to(sdk_deploydir))
> +
> +            f =3D rootfs_objset.new_file(
> +                rootfs_objset.new_spdxid("sdk-installer", relpath),
> +                relpath,
> +                fpath,
> +            )
> +            set_timestamp_now(d, f, "builtTime")
> +
> +            if fn.endswith(".manifest"):
> +                f.software_primaryPurpose =3D oe.spdx30.software_Softwar=
ePurpose.manifest
> +            elif fn.endswith(".testdata.json"):
> +                f.software_primaryPurpose =3D (
> +                    oe.spdx30.software_SoftwarePurpose.configuration
> +                )
> +            else:
> +                set_purposes(d, f, "SPDX_SDK_PURPOSE")
> +                root_files.append(f)
> +
> +            files.add(f)
> +
> +    if files:
> +        rootfs_objset.new_scoped_relationship(
> +            [sdk_build],
> +            oe.spdx30.RelationshipType.hasOutput,
> +            oe.spdx30.LifecycleScopeType.build,
> +            files,
> +        )
> +    else:
> +        bb.warn(f"No SDK output files found in {sdk_deploydir}")
> +
> +    objset, sbom =3D oe.sbom30.create_sbom(
> +        d, toolchain_outputname, sorted(list(files)), [rootfs_objset]
> +    )
> +
> +    oe.sbom30.write_jsonld_doc(
> +        d, objset, sdk_deploydir / (toolchain_outputname + ".spdx.json")
> +    )
> diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
> new file mode 100644
> index 0000000000..4caefc7673
> --- /dev/null
> +++ b/meta/lib/oe/spdx_common.py
> @@ -0,0 +1,244 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +
> +import bb
> +import collections
> +import json
> +import oe.packagedata
> +import re
> +import shutil
> +
> +from pathlib import Path
> +from dataclasses import dataclass
> +
> +LIC_REGEX =3D re.compile(
> +    rb"^\W*SPDX-License-Identifier:\s*([ \w\d.()+-]+?)(?:\s+\W*)?$",
> +    re.MULTILINE,
> +)
> +
> +
> +def extract_licenses(filename):
> +    """
> +    Extract SPDX License identifiers from a file
> +    """
> +    try:
> +        with open(filename, "rb") as f:
> +            size =3D min(15000, os.stat(filename).st_size)
> +            txt =3D f.read(size)
> +            licenses =3D re.findall(LIC_REGEX, txt)
> +            if licenses:
> +                ascii_licenses =3D [lic.decode("ascii") for lic in licen=
ses]
> +                return ascii_licenses
> +    except Exception as e:
> +        bb.warn(f"Exception reading {filename}: {e}")
> +    return []
> +
> +
> +def is_work_shared_spdx(d):
> +    return '/work-shared/' in d.getVar('S')
> +
> +
> +def load_spdx_license_data(d):
> +    with open(d.getVar("SPDX_LICENSES"), "r") as f:
> +        data =3D json.load(f)
> +        # Transform the license array to a dictionary
> +        data["licenses"] =3D {l["licenseId"]: l for l in data["licenses"=
]}
> +
> +    return data
> +
> +
> +def process_sources(d):
> +    """
> +    Returns True if the sources for this recipe should be included in th=
e SPDX
> +    or False if not
> +    """
> +    pn =3D d.getVar("PN")
> +    assume_provided =3D (d.getVar("ASSUME_PROVIDED") or "").split()
> +    if pn in assume_provided:
> +        for p in d.getVar("PROVIDES").split():
> +            if p !=3D pn:
> +                pn =3D p
> +                break
> +
> +    # glibc-locale: do_fetch, do_unpack and do_patch tasks have been del=
eted,
> +    # so avoid archiving source here.
> +    if pn.startswith("glibc-locale"):
> +        return False
> +    if d.getVar("PN") =3D=3D "libtool-cross":
> +        return False
> +    if d.getVar("PN") =3D=3D "libgcc-initial":
> +        return False
> +    if d.getVar("PN") =3D=3D "shadow-sysroot":
> +        return False
> +
> +    return True
> +
> +
> +@dataclass(frozen=3DTrue)
> +class Dep(object):
> +    pn: str
> +    hashfn: str
> +    in_taskhash: bool
> +
> +
> +def collect_direct_deps(d, dep_task):
> +    """
> +    Find direct dependencies of current task
> +
> +    Returns the list of recipes that have a dep_task that the current ta=
sk
> +    depends on
> +    """
> +    current_task =3D "do_" + d.getVar("BB_CURRENTTASK")
> +    pn =3D d.getVar("PN")
> +
> +    taskdepdata =3D d.getVar("BB_TASKDEPDATA", False)
> +
> +    for this_dep in taskdepdata.values():
> +        if this_dep[0] =3D=3D pn and this_dep[1] =3D=3D current_task:
> +            break
> +    else:
> +        bb.fatal(f"Unable to find this {pn}:{current_task} in taskdepdat=
a")
> +
> +    deps =3D set()
> +
> +    for dep_name in this_dep.deps:
> +        dep_data =3D taskdepdata[dep_name]
> +        if dep_data.taskname =3D=3D dep_task and dep_data.pn !=3D pn:
> +            deps.add((dep_data.pn, dep_data.hashfn, dep_name in this_dep=
.taskhash_deps))
> +
> +    return sorted(deps)
> +
> +
> +def get_spdx_deps(d):
> +    """
> +    Reads the SPDX dependencies JSON file and returns the data
> +    """
> +    spdx_deps_file =3D Path(d.getVar("SPDXDEPS"))
> +
> +    deps =3D []
> +    with spdx_deps_file.open("r") as f:
> +        for d in json.load(f):
> +            deps.append(Dep(*d))
> +    return deps
> +
> +
> +def collect_package_providers(d):
> +    """
> +    Returns a dictionary where each RPROVIDES is mapped to the package t=
hat
> +    provides it
> +    """
> +    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
> +
> +    providers =3D {}
> +
> +    deps =3D collect_direct_deps(d, "do_create_spdx")
> +    deps.append((d.getVar("PN"), d.getVar("BB_HASHFILENAME"), True))
> +
> +    for dep_pn, dep_hashfn, _ in deps:
> +        localdata =3D d
> +        recipe_data =3D oe.packagedata.read_pkgdata(dep_pn, localdata)
> +        if not recipe_data:
> +            localdata =3D bb.data.createCopy(d)
> +            localdata.setVar("PKGDATA_DIR", "${PKGDATA_DIR_SDK}")
> +            recipe_data =3D oe.packagedata.read_pkgdata(dep_pn, localdat=
a)
> +
> +        for pkg in recipe_data.get("PACKAGES", "").split():
> +            pkg_data =3D oe.packagedata.read_subpkgdata_dict(pkg, locald=
ata)
> +            rprovides =3D set(
> +                n
> +                for n, _ in bb.utils.explode_dep_versions2(
> +                    pkg_data.get("RPROVIDES", "")
> +                ).items()
> +            )
> +            rprovides.add(pkg)
> +
> +            if "PKG" in pkg_data:
> +                pkg =3D pkg_data["PKG"]
> +                rprovides.add(pkg)
> +
> +            for r in rprovides:
> +                providers[r] =3D (pkg, dep_hashfn)
> +
> +    return providers
> +
> +
> +def get_patched_src(d):
> +    """
> +    Save patched source of the recipe in SPDX_WORKDIR.
> +    """
> +    spdx_workdir =3D d.getVar("SPDXWORK")
> +    spdx_sysroot_native =3D d.getVar("STAGING_DIR_NATIVE")
> +    pn =3D d.getVar("PN")
> +
> +    workdir =3D d.getVar("WORKDIR")
> +
> +    try:
> +        # The kernel class functions require it to be on work-shared, so=
 we dont change WORKDIR
> +        if not is_work_shared_spdx(d):
> +            # Change the WORKDIR to make do_unpack do_patch run in anoth=
er dir.
> +            d.setVar("WORKDIR", spdx_workdir)
> +            # Restore the original path to recipe's native sysroot (it's=
 relative to WORKDIR).
> +            d.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
> +
> +            # The changed 'WORKDIR' also caused 'B' changed, create dir =
'B' for the
> +            # possibly requiring of the following tasks (such as some re=
cipes's
> +            # do_patch required 'B' existed).
> +            bb.utils.mkdirhier(d.getVar("B"))
> +
> +            bb.build.exec_func("do_unpack", d)
> +
> +            if d.getVar("SRC_URI") !=3D "":
> +                if bb.data.inherits_class('dos2unix', d):
> +                    bb.build.exec_func('do_convert_crlf_to_lf', d)
> +                bb.build.exec_func("do_patch", d)
> +
> +        # Copy source from work-share to spdx_workdir
> +        if is_work_shared_spdx(d):
> +            share_src =3D d.getVar('S')
> +            d.setVar("WORKDIR", spdx_workdir)
> +            d.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
> +            # Copy source to ${SPDXWORK}, same basename dir of ${S};
> +            src_dir =3D (
> +                spdx_workdir
> +                + "/"
> +                + os.path.basename(share_src)
> +            )
> +            # For kernel souce, rename suffix dir 'kernel-source'
> +            # to ${BP} (${BPN}-${PV})
> +            if bb.data.inherits_class("kernel", d):
> +                src_dir =3D spdx_workdir + "/" + d.getVar('BP')
> +
> +            bb.note(f"copyhardlinktree {share_src} to {src_dir}")
> +            oe.path.copyhardlinktree(share_src, src_dir)
> +
> +        # Some userland has no source.
> +        if not os.path.exists(spdx_workdir):
> +            bb.utils.mkdirhier(spdx_workdir)
> +    finally:
> +        d.setVar("WORKDIR", workdir)
> +
> +
> +def has_task(d, task):
> +    return bool(d.getVarFlag(task, "task", False)) and not bool(d.getVar=
Flag(task, "noexec", False))
> +
> +
> +def fetch_data_to_uri(fd, name):
> +    """
> +    Translates a bitbake FetchData to a string URI
> +    """
> +    uri =3D fd.type
> +    # Map gitsm to git, since gitsm:// is not a valid URI protocol
> +    if uri =3D=3D "gitsm":
> +        uri =3D "git"
> +    proto =3D getattr(fd, "proto", None)
> +    if proto is not None:
> +        uri =3D uri + "+" + proto
> +    uri =3D uri + "://" + fd.host + fd.path
> +
> +    if fd.method.supports_srcrev():
> +        uri =3D uri + "@" + fd.revision
> +
> +    return uri
> --
> 2.43.0
>

