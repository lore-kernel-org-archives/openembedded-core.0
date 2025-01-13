Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E03BC02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 19:30:48 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.26857.1736796644207037176
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 11:30:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=USeWDL5X;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53e3a37ae07so4689190e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 11:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736796642; x=1737401442; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ja5whdv7U6qzKlM9CqLzLur2e7DvRad9n93W5xVbJE0=;
        b=USeWDL5X9sHCjufjLv/rxIz2wTrxKoM/tTMKYZTEQq+8ktmmHkv9MwWcPCbumYFMpF
         J0HSJsMhM8nu1MawPqebxzAVZbMqX3JAxJyN1iEfnlY3FGV6JCmLJYZuHvVah3b6Evz6
         3GOgszXqu4fGrJ5lbdSjq9TJTCWa7EvOTW42lVTxJFTp//GO8ArpF8tbiI12PRnx3xVm
         At3iTR4+R1dFb20KzH99Q6iNuQGlesrzypgsEYqPIThDDahtkK022rHENd7+YO1lSHrc
         ICwVbhWTNVFWTmOb5FoDMq/lG/YyiZlOOyF31q0YwK9I4vlbNxYcU85he6UjwO/30Blh
         3qJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736796642; x=1737401442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ja5whdv7U6qzKlM9CqLzLur2e7DvRad9n93W5xVbJE0=;
        b=cFmGZvo5qWIOteW0H1VOu5fw/kCuUFuOPpVSk9LNyWhHVnF5kSE4ElC4y/QEzpdOGW
         Kw8sd/xGGEDWSJ9dopo+lupYxUsY30dh9H8W7dZCWhdTn3rUcl9kbqPne+4UC2hngoeR
         8obhyrCjiZQvQlLRljUtiirsEe3aMM6NPZlmlIRNOG0kfHC3jIVqk4L/AeSfWKnmfDYw
         CrYWYeAepk+gpkAXDNbgjI2JBszhuv2jyWm1Jhzg3Ne20/yW+JMNx0zj+r1WHeZa3iws
         kWWNw1dIIxT2DkO3Zv+iVuRFnHXeTj8Ebf5YBceLKb8YcVK+GeqQQIgxriVqQpLi1P57
         cVnw==
X-Gm-Message-State: AOJu0YyV1RMIGs7WHH9qNnGbfe72fKz0BJcxV93AxcPTuErOW/gMl1s6
	B5c5DRNRt6QgsERO2UtSC8AJELBHCs6bSpEsy0aw4Ac0OF9YO/rhRS8f+6ewp8uttFr+AtPHKL/
	D0Hd3o6ZFfR+tbtWojD14Yogg4x5khm+B
X-Gm-Gg: ASbGncvl2K8RJF6dngQg2oHfocWTN/h1VMlwe/7tq8WdHx7KPyqiBE6TI1wWOEnzFmV
	eu1ipaFv9D8+kj2MQf7PDxRpLll27gt0EJici6uDf2flQzhmYO6Sl
X-Google-Smtp-Source: AGHT+IGVb3OWE2ZAnIijucFirH5z89wW+1pKlG/PasW1QBhOyIFZtHD4qdA11zMU4R9LHsoBeO2FDo/Ztgln3ui50IY=
X-Received: by 2002:a05:6512:281e:b0:541:3182:4578 with SMTP id
 2adb3069b0e04-542845befe4mr7279758e87.15.1736796641901; Mon, 13 Jan 2025
 11:30:41 -0800 (PST)
MIME-Version: 1.0
References: <20250113175051.1173919-1-igor.opaniuk@foundries.io>
In-Reply-To: <20250113175051.1173919-1-igor.opaniuk@foundries.io>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 13 Jan 2025 12:30:29 -0700
X-Gm-Features: AbW1kvbYNrDMMJ8dWGnJjpU6IX-GES35AEAAGUrNjxpATX25rFetdBbx94Ey8no
Message-ID: <CAJdd5GYhVtLUFzakUJbq0t7XoUEoi0qJ-RjyfX10KjfcNqzEyQ@mail.gmail.com>
Subject: Re: [PATCH v2] lib/spdx30_tasks: support directories deployed by
 image recipes
To: igor.opaniuk@foundries.io
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 19:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209741

On Mon, Jan 13, 2025 at 10:51=E2=80=AFAM <igor.opaniuk@foundries.io> wrote:
>
> From: Igor Opaniuk <igor.opaniuk@foundries.io>
>
> create_image_spdx() implementation assumes that image is indeed a file.
> If image recipe deploys a directory (for example, which contains an
> hierarchy of flash artifacts, that is used by SoC vendor-specific
> flashing tool) which follows ${IMAGE_NAME}.${IMAGE_TYPE} naming scheme,
> create_image_spdx() function will fail after trying to hash a directory:
>
> *** 0002:do_create_image_spdx(d)
>      0003:
> File: '.../meta/classes-recipe/create-spdx-image-3.0.bbclass', lineno: 48=
, function: do_create_image_spdx
>      0044:addtask do_create_rootfs_spdx_setscene
>      0045:
>      0046:python do_create_image_spdx() {
>      0047:    import oe.spdx30_tasks
>  *** 0048:    oe.spdx30_tasks.create_image_spdx(d)
>      0049:}
>      0050:addtask do_create_image_spdx after do_image_complete do_create_=
rootfs_spdx before do_build
>      0051:SSTATETASKS +=3D "do_create_image_spdx"
> ...
> File: '.../bitbake/lib/bb/utils.py', lineno: 536, function: _hasher
>      0532:
>      0533:def _hasher(method, filename):
>      0534:    import mmap
>      0535:
>  *** 0536:    with open(filename, "rb") as f:
>      0537:        try:
>      0538:            with mmap.mmap(f.fileno(), 0, access=3Dmmap.ACCESS_=
READ) as mm:
>      0539:                for chunk in iter(lambda: mm.read(8192), b''):
>      0540:                    method.update(chunk)
> Exception: IsADirectoryError: [Errno 21] Is a directory: '...'
>
> Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
> ---
>  meta/lib/oe/spdx30_tasks.py | 51 ++++++++++++++++++++++++-------------
>  1 file changed, 34 insertions(+), 17 deletions(-)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index c60c97896c..d1a7df5b64 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -1068,29 +1068,46 @@ def create_image_spdx(d):
>          builds.append(image_build)
>
>          artifacts =3D []
> +        license_data =3D oe.spdx_common.load_spdx_license_data(d)
>
>          for image in task["images"]:
>              image_filename =3D image["filename"]
>              image_path =3D image_deploy_dir / image_filename
> -            a =3D objset.add_root(
> -                oe.spdx30.software_File(
> -                    _id=3Dobjset.new_spdxid("image", image_filename),
> -                    creationInfo=3Dobjset.doc.creationInfo,
> -                    name=3Dimage_filename,
> -                    verifiedUsing=3D[
> -                        oe.spdx30.Hash(
> -                            algorithm=3Doe.spdx30.HashAlgorithm.sha256,
> -                            hashValue=3Dbb.utils.sha256_file(image_path)=
,
> -                        )
> -                    ],
> +            if os.path.isdir(image_path):
> +                a =3D add_package_files(
> +                        d,
> +                        objset,
> +                        image_path,
> +                        lambda file_counter: objset.new_spdxid(
> +                            "imagefile", str(file_counter)
> +                        ),
> +                        lambda filepath: [oe.spdx30.software_SoftwarePur=
pose.file],

Don't set the purpose here (e.g. just do `lambda filepath: []`), and
set it later (see below)

> +                        license_data,

For now, lets just have add_package_files skip license scanning if
license_data is None (specifically check for `None`), that way it
matches the single image file below (which doesn't scan for licenses
either).

> +                        ignore_dirs=3DNone,
> +                        ignore_top_level_dirs=3DNone,
> +                        archive=3DNone,
>                  )



> -            )
> -            set_purposes(
> -                d, a, "SPDX_IMAGE_PURPOSE:%s" % imagetype, "SPDX_IMAGE_P=
URPOSE"
> -            )
> -            set_timestamp_now(d, a, "builtTime")
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
> +                set_purposes(
> +                    d, a, "SPDX_IMAGE_PURPOSE:%s" % imagetype, "SPDX_IMA=
GE_PURPOSE"
> +                )
> +                set_timestamp_now(d, a, "builtTime")
>
> -            artifacts.append(a)
> +                artifacts.append(a)

Looks like you are not setting the builtTime timestamps in the case of
a directory. However, I think this code can be simplifed to cover both
cases with:

 for a in artifacts:
     set_purposes(d, a, "SPDX_IMAGE_PURPOSE:%s" % imagetype,
"SPDX_IMAGE_PURPOSE")
     set_timestamp_now(d, a, "builtTime")

which will do both the purpose and the timestamp for all artifact files.

>
>          if artifacts:
>              objset.new_scoped_relationship(
> --
> 2.43.0
>

