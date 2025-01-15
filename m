Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C683C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 12:25:33 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.19875.1736943928318197900
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 04:25:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=Kn1kVZRa;
 spf=pass (domain: foundries.io, ip: 209.85.167.54, mailfrom: igor.opaniuk@foundries.io)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54026562221so6880404e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 04:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1736943926; x=1737548726; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMxiTw5MXqSNe9Ztwx6ZJODy+HXsGEfX5nnu0DkL0eY=;
        b=Kn1kVZRa2wL6DTpANcnz+gpmQHVRHOgB46oVFVsrkEO0RgCMZ/WvREAEZ7HDweT7nO
         n1C5urftzE/FhNR/0RmRXINpBEnzZs3Ll2IHbiF8fEs/4FXw1vPwkw3pLUQmi3YLOtDy
         k+F1VXwWWF9cZMJZGOnOJLeKGogjt5vSNf236+WhTdO6JWIP2zF3jRetac0ktXSjNPh3
         cximtSlkitQk2aup6TTwxOnCAyq89ofbTT/XYCmRujpfoAAoSmERaXOznLwiozXBqisx
         BpZR4/C4bnZcoiOX+uzk/Rf/RDVtGFXAuvzlWf3FhD2kfmfdgc/AT61QzJ+jlsTjwIdM
         p0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736943926; x=1737548726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMxiTw5MXqSNe9Ztwx6ZJODy+HXsGEfX5nnu0DkL0eY=;
        b=sXRNvcdJ4+58R2fnC2qkjpCUPF/GG1kxHApYrllG/Ubmx5jqcDuN3CT7/dpe8KJu/w
         vp6dgANo1GALPEo/WQyuwjai4JdDeItZ81mHEi6HUwJHdTg6Kk5Vo/0hxYKY/WEPWC7h
         Ow6JcL5l8JBfflAdofnTCYK0t4kp0TQ8ya9OjyicKI0qHlbAfuIwT153606vlgJn3LMs
         ZC2rgNYGk8aWG/9ACodd/0qc8cI8W88gb8h6pqGGJbUqf6hGPm3NQXHhA20w034xDZaF
         1lhh+PtRTtP9niepShCMTT4k61OkWwpZqjlOTAG1mSXwSdDwf3xe/pzXJHB8eaRUuLW4
         fagA==
X-Gm-Message-State: AOJu0Yw+PJxmIg6pJYt0sOXyEoq0UNlxE2LbpC7ILqjd/4/fdEQ9cevC
	HIEe79/mbNVV5HTJ5JyxZzznwE0zFZDpceuleFgzv3m/nX5LtpNvP+j1jQCEPYvgtzSaC7bteHn
	eM2sMG0OxpEFAqT0K0lCg1oLxRb1ZwNxZziEeBQ==
X-Gm-Gg: ASbGncuXhHvFxZNZonVm6b8r+V6jWtVw887+P7xAbaBZh375MascnxapMKDghXX2f1F
	kvrmo/cWzidrnusirRRotpKfqCu+iASZ8fB6N4JD7
X-Google-Smtp-Source: AGHT+IHQMCGEVrRo3qOSSKq80A2HHhbwXIEzhkdn87nNvo/8DSAoAdysqapA6ygcRqbQ+NGIsjuORkAeik6WgEIf0do=
X-Received: by 2002:a05:6512:3b0d:b0:542:6f2a:946a with SMTP id
 2adb3069b0e04-542845070a2mr7952635e87.6.1736943926254; Wed, 15 Jan 2025
 04:25:26 -0800 (PST)
MIME-Version: 1.0
References: <20250113175051.1173919-1-igor.opaniuk@foundries.io> <CAJdd5GYhVtLUFzakUJbq0t7XoUEoi0qJ-RjyfX10KjfcNqzEyQ@mail.gmail.com>
In-Reply-To: <CAJdd5GYhVtLUFzakUJbq0t7XoUEoi0qJ-RjyfX10KjfcNqzEyQ@mail.gmail.com>
From: Igor Opaniuk <igor.opaniuk@foundries.io>
Date: Wed, 15 Jan 2025 13:25:14 +0100
X-Gm-Features: AbW1kvYNljdYmrl5K0MsFAszLyxdbGWGs66Ul1TdAR3TG7xMycRg5z5OY7_ve2c
Message-ID: <CAL6CDMEpvLPuNd_oFc45c8yMS+YjSD0XF8esvi-0KNwtaahXDA@mail.gmail.com>
Subject: Re: [PATCH v2] lib/spdx30_tasks: support directories deployed by
 image recipes
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 12:25:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209897

On Mon, Jan 13, 2025 at 8:30=E2=80=AFPM Joshua Watt <jpewhacker@gmail.com> =
wrote:
>
> On Mon, Jan 13, 2025 at 10:51=E2=80=AFAM <igor.opaniuk@foundries.io> wrot=
e:
> >
> > From: Igor Opaniuk <igor.opaniuk@foundries.io>
> >
> > create_image_spdx() implementation assumes that image is indeed a file.
> > If image recipe deploys a directory (for example, which contains an
> > hierarchy of flash artifacts, that is used by SoC vendor-specific
> > flashing tool) which follows ${IMAGE_NAME}.${IMAGE_TYPE} naming scheme,
> > create_image_spdx() function will fail after trying to hash a directory=
:
> >
> > *** 0002:do_create_image_spdx(d)
> >      0003:
> > File: '.../meta/classes-recipe/create-spdx-image-3.0.bbclass', lineno: =
48, function: do_create_image_spdx
> >      0044:addtask do_create_rootfs_spdx_setscene
> >      0045:
> >      0046:python do_create_image_spdx() {
> >      0047:    import oe.spdx30_tasks
> >  *** 0048:    oe.spdx30_tasks.create_image_spdx(d)
> >      0049:}
> >      0050:addtask do_create_image_spdx after do_image_complete do_creat=
e_rootfs_spdx before do_build
> >      0051:SSTATETASKS +=3D "do_create_image_spdx"
> > ...
> > File: '.../bitbake/lib/bb/utils.py', lineno: 536, function: _hasher
> >      0532:
> >      0533:def _hasher(method, filename):
> >      0534:    import mmap
> >      0535:
> >  *** 0536:    with open(filename, "rb") as f:
> >      0537:        try:
> >      0538:            with mmap.mmap(f.fileno(), 0, access=3Dmmap.ACCES=
S_READ) as mm:
> >      0539:                for chunk in iter(lambda: mm.read(8192), b'')=
:
> >      0540:                    method.update(chunk)
> > Exception: IsADirectoryError: [Errno 21] Is a directory: '...'
> >
> > Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
> > ---
> >  meta/lib/oe/spdx30_tasks.py | 51 ++++++++++++++++++++++++-------------
> >  1 file changed, 34 insertions(+), 17 deletions(-)
> >
> > diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> > index c60c97896c..d1a7df5b64 100644
> > --- a/meta/lib/oe/spdx30_tasks.py
> > +++ b/meta/lib/oe/spdx30_tasks.py
> > @@ -1068,29 +1068,46 @@ def create_image_spdx(d):
> >          builds.append(image_build)
> >
> >          artifacts =3D []
> > +        license_data =3D oe.spdx_common.load_spdx_license_data(d)
> >
> >          for image in task["images"]:
> >              image_filename =3D image["filename"]
> >              image_path =3D image_deploy_dir / image_filename
> > -            a =3D objset.add_root(
> > -                oe.spdx30.software_File(
> > -                    _id=3Dobjset.new_spdxid("image", image_filename),
> > -                    creationInfo=3Dobjset.doc.creationInfo,
> > -                    name=3Dimage_filename,
> > -                    verifiedUsing=3D[
> > -                        oe.spdx30.Hash(
> > -                            algorithm=3Doe.spdx30.HashAlgorithm.sha256=
,
> > -                            hashValue=3Dbb.utils.sha256_file(image_pat=
h),
> > -                        )
> > -                    ],
> > +            if os.path.isdir(image_path):
> > +                a =3D add_package_files(
> > +                        d,
> > +                        objset,
> > +                        image_path,
> > +                        lambda file_counter: objset.new_spdxid(
> > +                            "imagefile", str(file_counter)
> > +                        ),
> > +                        lambda filepath: [oe.spdx30.software_SoftwareP=
urpose.file],
>
> Don't set the purpose here (e.g. just do `lambda filepath: []`), and
> set it later (see below)
>
> > +                        license_data,
>
> For now, lets just have add_package_files skip license scanning if
> license_data is None (specifically check for `None`), that way it
> matches the single image file below (which doesn't scan for licenses
> either).
>
> > +                        ignore_dirs=3DNone,
> > +                        ignore_top_level_dirs=3DNone,
> > +                        archive=3DNone,
> >                  )
>
>
>
> > -            )
> > -            set_purposes(
> > -                d, a, "SPDX_IMAGE_PURPOSE:%s" % imagetype, "SPDX_IMAGE=
_PURPOSE"
> > -            )
> > -            set_timestamp_now(d, a, "builtTime")
> > +                artifacts.extend(a)
> > +            else:
> > +                a =3D objset.add_root(
> > +                    oe.spdx30.software_File(
> > +                        _id=3Dobjset.new_spdxid("image", image_filenam=
e),
> > +                        creationInfo=3Dobjset.doc.creationInfo,
> > +                        name=3Dimage_filename,
> > +                        verifiedUsing=3D[
> > +                            oe.spdx30.Hash(
> > +                                algorithm=3Doe.spdx30.HashAlgorithm.sh=
a256,
> > +                                hashValue=3Dbb.utils.sha256_file(image=
_path),
> > +                            )
> > +                        ],
> > +                    )
> > +                )
> > +                set_purposes(
> > +                    d, a, "SPDX_IMAGE_PURPOSE:%s" % imagetype, "SPDX_I=
MAGE_PURPOSE"
> > +                )
> > +                set_timestamp_now(d, a, "builtTime")
> >
> > -            artifacts.append(a)
> > +                artifacts.append(a)
>
> Looks like you are not setting the builtTime timestamps in the case of
> a directory. However, I think this code can be simplifed to cover both
> cases with:
>
>  for a in artifacts:
>      set_purposes(d, a, "SPDX_IMAGE_PURPOSE:%s" % imagetype,
> "SPDX_IMAGE_PURPOSE")
>      set_timestamp_now(d, a, "builtTime")
>
> which will do both the purpose and the timestamp for all artifact files.
>
> >
> >          if artifacts:
> >              objset.new_scoped_relationship(
> > --
> > 2.43.0
> >

Thanks a lot for all suggestions, will send v3 soon.

--=20
Best regards - Freundliche Gr=C3=BCsse - Meilleures salutations

Igor Opaniuk
Senior Software Engineer, Embedded & Security
E: igor.opaniuk@foundries.io
W: www.foundries.io

