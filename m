Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FBECCD1BE
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 14:28:33 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.web11.22711.1761229709391376722
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 07:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YdNFE2sb;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-63e3a7a67a4so1021715d50.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 07:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761229708; x=1761834508; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrFtShgNgKvULbALvzL3Klbr0Neu0eHBtx/YUjM0j8Q=;
        b=YdNFE2sb2CM7pfGygCkQxxVeoAoIKAM4cTP5Y3I2Um+NNkQSb7GEtd7PO7yPM6e/wW
         tso4AZe8WlKcWk3smQDBMvXnJVV4od+FuxY0ShBIYAbhmFKDpVu0A6sBB3yLfNoYRrDR
         bl0NM8ln511wb/uPEDiJGYi6xgpPyc9ar8oTbriCBqf+ikEfjbviXMO4g2lY30zEXi2b
         65dtnGHgjW9uhGtRd6d/BB4DjT62OrdUXP5zWD0Z/i04VUaUjEzruHRa6RpQOhAeEl3v
         lRfpH4RQ89vIY+wHb91m7plk76SmhMn2tgcyeG0Eae45jralxDwQwYOE6eBTfyT2Gp0i
         IzuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761229708; x=1761834508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrFtShgNgKvULbALvzL3Klbr0Neu0eHBtx/YUjM0j8Q=;
        b=krAW8OqsG/tBlix/F44emucGNi/4FDJHGzD7qU4slcVP/LvCB/DsGo3EF+lz3oVj+T
         77dYH8DdQsCYt3XQl/nlw2Oy9x49RDFrwYrO9xyA3X+Dp1jwzJP5YHdBlKzDa2uPDR/k
         uADvmaKta0OG9VGE8p4xIcTRzlFnQ06D15laL2C1DglasotS4dyC3OjlLBPxYalN4mmb
         TQTpRsfnQUnsdlQIlxJzgHy7yeBIFnU77DwaQ89v32YOFxyCO4N5bsuErlJxQMAiEgfd
         aHRKqPyQgTd+Be6k+NhRjBL2gPTWSdJCLEvvoeKZ0IAfhY99ZXDzR5Us+fjLQVCPJhbR
         U8+A==
X-Gm-Message-State: AOJu0YwbI6xlRocDviDma0ZUFU6ai0f4TKNLa9g7mlmVXw3RAPJkZjIZ
	hBQfJlaQaQkZ5pA3ERPuKitXw+qB/Gcri+SZquqTTPG+RBcPuQ4ftwyG7iqwIiVKpMV6Gfv71k/
	XshtmHG8PA4k1kwYQ694YHFnaOqRLiMY=
X-Gm-Gg: ASbGncvi+rz/phq5Q8p3aA2hdEcpjiGQOS48XWOePW5iQY6M/QqdinSRCDfwK9KFRB0
	ajVCQYlGrtjF0K+1lTdK8GLkwlB9hXNzIrNpSEAwEqMJhcFjSMBtCOdfOVN4KXR542uH29cPcYA
	BUUbUPo4Xm/o6oZxSKyPrg8ztB66yrBS/o9bAbLepvZg9sc4UcQIpN6toEzsw+NbVs2/Mh+o0h/
	ItxqekXkQ2s1FiVs5mEwTbYhJuSI24x/Rk3mEwUcJabNtBNr6m1EW72sXseGK5tmKX+L3iwsq8=
X-Google-Smtp-Source: AGHT+IHuxzYdE+9EWT+KqNBZV3AOto7f4dHsa2Geq37uXqX777TyTIiVk1dAk8o1jJ8cMrZida1BRp6agWWzamia/PE=
X-Received: by 2002:a53:b747:0:b0:63c:e90c:a6d8 with SMTP id
 956f58d0204a3-63f378a4e92mr1770610d50.44.1761229708284; Thu, 23 Oct 2025
 07:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20251022090647.419543-2-jose.quaresma@foundries.io>
In-Reply-To: <20251022090647.419543-2-jose.quaresma@foundries.io>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 23 Oct 2025 08:28:16 -0600
X-Gm-Features: AS18NWALyxmGspiRNPo96vxm4U9N2sqgHZonSHXMadDv7Q184r66eTKNQlYhgEo
Message-ID: <CAJdd5GZ3S2ZRXtjE1ZhvLZHta_qbe1x4+wXPObG165oa4o=S_g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] spdx-3.0: replace SPDX3_LIB_DEP_FILES
 with SPDX3_DEP_FILES
To: quaresma.jose@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 14:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225265

On Wed, Oct 22, 2025 at 3:07=E2=80=AFAM Jose Quaresma via
lists.openembedded.org
<quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
>
> We can have more files types in the chain of dependencies and not just li=
bs.

LGTM to me

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

>
> Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
> ---
>  meta/classes-recipe/create-spdx-image-3.0.bbclass | 6 +++---
>  meta/classes-recipe/create-spdx-sdk-3.0.bbclass   | 4 ++--
>  meta/classes/create-spdx-3.0.bbclass              | 6 +++---
>  3 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/cla=
sses-recipe/create-spdx-image-3.0.bbclass
> index e0f1766bb7..636ab14eb0 100644
> --- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
> +++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
> @@ -36,7 +36,7 @@ do_create_rootfs_spdx[sstate-inputdirs] =3D "${SPDXROOT=
FSDEPLOY}"
>  do_create_rootfs_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
>  do_create_rootfs_spdx[recrdeptask] +=3D "do_create_spdx do_create_packag=
e_spdx"
>  do_create_rootfs_spdx[cleandirs] +=3D "${SPDXROOTFSDEPLOY}"
> -do_create_rootfs_spdx[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> +do_create_rootfs_spdx[file-checksums] +=3D "${SPDX3_DEP_FILES}"
>
>  python do_create_rootfs_spdx_setscene() {
>      sstate_setscene(d)
> @@ -54,7 +54,7 @@ do_create_image_spdx[sstate-inputdirs] =3D "${SPDXIMAGE=
WORK}"
>  do_create_image_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
>  do_create_image_spdx[cleandirs] =3D "${SPDXIMAGEWORK}"
>  do_create_image_spdx[dirs] =3D "${SPDXIMAGEWORK}"
> -do_create_image_spdx[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> +do_create_image_spdx[file-checksums] +=3D "${SPDX3_DEP_FILES}"
>  do_create_image_spdx[vardeps] +=3D "\
>      SPDX_IMAGE_PURPOSE \
>      "
> @@ -77,7 +77,7 @@ do_create_image_sbom_spdx[sstate-outputdirs] =3D "${DEP=
LOY_DIR_IMAGE}"
>  do_create_image_sbom_spdx[stamp-extra-info] =3D "${MACHINE_ARCH}"
>  do_create_image_sbom_spdx[cleandirs] =3D "${SPDXIMAGEDEPLOYDIR}"
>  do_create_image_sbom_spdx[recrdeptask] +=3D "do_create_spdx do_create_pa=
ckage_spdx"
> -do_create_image_sbom_spdx[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> +do_create_image_sbom_spdx[file-checksums] +=3D "${SPDX3_DEP_FILES}"
>
>  python do_create_image_sbom_spdx_setscene() {
>      sstate_setscene(d)
> diff --git a/meta/classes-recipe/create-spdx-sdk-3.0.bbclass b/meta/class=
es-recipe/create-spdx-sdk-3.0.bbclass
> index 855fb3d09f..e5f220cdfa 100644
> --- a/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
> +++ b/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
> @@ -8,14 +8,14 @@
>  do_populate_sdk[recrdeptask] +=3D "do_create_spdx do_create_package_spdx=
"
>  do_populate_sdk[cleandirs] +=3D "${SPDXSDKWORK}"
>  do_populate_sdk[postfuncs] +=3D "sdk_create_sbom"
> -do_populate_sdk[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> +do_populate_sdk[file-checksums] +=3D "${SPDX3_DEP_FILES}"
>  POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk =3D " sdk_host_c=
reate_spdx"
>  POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk =3D " sdk_targ=
et_create_spdx"
>
>  do_populate_sdk_ext[recrdeptask] +=3D "do_create_spdx do_create_package_=
spdx"
>  do_populate_sdk_ext[cleandirs] +=3D "${SPDXSDKEXTWORK}"
>  do_populate_sdk_ext[postfuncs] +=3D "sdk_ext_create_sbom"
> -do_populate_sdk_ext[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> +do_populate_sdk_ext[file-checksums] +=3D "${SPDX3_DEP_FILES}"
>  POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk-ext =3D " sdk_ex=
t_host_create_spdx"
>  POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk-ext =3D " sdk_=
ext_target_create_spdx"
>
> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
> index c0a5436ad6..3a8a97eca4 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -133,7 +133,7 @@ oe.spdx30_tasks.collect_dep_objsets[vardepsexclude] =
=3D "SPDX_MULTILIB_SSTATE_ARCH
>  # SPDX library code makes heavy use of classes, which bitbake cannot eas=
ily
>  # parse out dependencies. As such, the library code files that make use =
of
>  # classes are explicitly added as file checksum dependencies.
> -SPDX3_LIB_DEP_FILES =3D "\
> +SPDX3_DEP_FILES =3D "\
>      ${COREBASE}/meta/lib/oe/sbom30.py:True \
>      ${COREBASE}/meta/lib/oe/spdx30.py:True \
>      "
> @@ -159,7 +159,7 @@ addtask do_create_spdx after \
>  SSTATETASKS +=3D "do_create_spdx"
>  do_create_spdx[sstate-inputdirs] =3D "${SPDXDEPLOY}"
>  do_create_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
> -do_create_spdx[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> +do_create_spdx[file-checksums] +=3D "${SPDX3_DEP_FILES}"
>
>  python do_create_spdx_setscene () {
>      sstate_setscene(d)
> @@ -183,7 +183,7 @@ addtask do_create_package_spdx after do_create_spdx b=
efore do_build do_rm_work
>  SSTATETASKS +=3D "do_create_package_spdx"
>  do_create_package_spdx[sstate-inputdirs] =3D "${SPDXRUNTIMEDEPLOY}"
>  do_create_package_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
> -do_create_package_spdx[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> +do_create_package_spdx[file-checksums] +=3D "${SPDX3_DEP_FILES}"
>
>  python do_create_package_spdx_setscene () {
>      sstate_setscene(d)
> --
> 2.51.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225179): https://lists.openembedded.org/g/openembedde=
d-core/message/225179
> Mute This Topic: https://lists.openembedded.org/mt/115889315/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

