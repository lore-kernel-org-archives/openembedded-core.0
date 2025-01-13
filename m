Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE99C02183
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 14:58:27 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.18724.1736780305207622200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 06:58:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lzOwaVV2;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54252789365so5208324e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 06:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736780303; x=1737385103; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDFcRCNI+BvoQ4uphDI1bz94wIhE0rFQCrDg6wNqMHg=;
        b=lzOwaVV2Ep2p7gh6jDhMidNbbGr0lA5hemdxqRR8xoywOgje5zOtuX446iQuM2N9fv
         ZOFHMHtwkUThs6m00EDKsykmIZj2361AexkIPcWWAmmSUtvUTvNyBlm/9PLi5M8Jxg1K
         BIR2eWruzVc1FHgXP7ktN9yjuHQZtE8yziHit+lxHNos3yEOsGRvYpX6sLGFQxAjyIsI
         xRh0ZHLV+/kFIvVKbkw8QN3G4IR8xY9HsR9ONwz2fBVNCEETYyNMELOnRcM0O582Jd5G
         62K2Z2PP8+Uaq0qOaHbRNua8Rwmj6C4amlcVKLcOFW0U9HoLva4If508H+wyr2XYiETj
         0AKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736780303; x=1737385103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDFcRCNI+BvoQ4uphDI1bz94wIhE0rFQCrDg6wNqMHg=;
        b=FRMlRYvHN7TvGG1DVuNrht7HzmaXMf8N3ovsfuA0Incy1FEj3Fi6iQFrSmU4dbXnnd
         WbqQNH/H3aGABj6ouRQneTldvqIlS9vn6R9Y66fB2QlFfYvgCUYHPVTqGcdKTjQTo/oJ
         jJusvr+Svw2e7X7YE2DQqPkBMPuEX/UdfdkYNLkc+LesFhow1B0pK2R9VEgtaclAQ1ql
         hT9smwsgryElsAS3hZvVtKeazxIZOruGad8XqIMfDTNkRvOErzrIrYh9xPWC8YkDl1JZ
         cpdjtQ6SuuQj6F+o5zF+xeMGAo2xo7BFlkReD9DwgvMTdiXe8G7fj81CLzFjpD9pIP3/
         k5yA==
X-Gm-Message-State: AOJu0YxkN+se+bajVduUiiEZhfgmjQRfzkE7epevZlo191iK/5awMKvs
	YccLo3v34dbbIRcCcY2ssPQKoPqjaHDWGDJ/x/j21v/TqvjQRrej4RmTgqW1EbfEL3GhFBb5tJl
	TGc6w2WqP3PgnmUupeCYdAZyXUck=
X-Gm-Gg: ASbGncuN1w4/VKfszcKR68uj/aNnE9S97vJ7W2jQr/WTZswaqHbpxJ4shpo5BzT4/dn
	rzshTAP/tWiRdDSF1I3DhoBoLuMEBf4tg/A2XAwpo3MBX02S5+WUT
X-Google-Smtp-Source: AGHT+IEK/83oMm2DVUsE2OlLBSEY5QD2sUPsqYZTOnuAe6XR1cMe8F2VCDet5+6PbQ4FPdJsZfUdwd1tycYKq6GO2qM=
X-Received: by 2002:a05:6512:110e:b0:542:2990:5d61 with SMTP id
 2adb3069b0e04-542845d6d6emr5579410e87.25.1736780302834; Mon, 13 Jan 2025
 06:58:22 -0800 (PST)
MIME-Version: 1.0
References: <20250113123432.649645-1-igor.opaniuk@foundries.io>
In-Reply-To: <20250113123432.649645-1-igor.opaniuk@foundries.io>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 13 Jan 2025 07:58:09 -0700
X-Gm-Features: AbW1kvZ_bquwCL_8RMABiirWNW3THWtZoxu6oPjSlbZd0ykqY1bXQ17aUY2BrCQ
Message-ID: <CAJdd5GbCGLNmZT7jsN3x72Mw2gk4Q8Kafm=u=b7L3s_6-7GxTA@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] lib/spdx30_tasks: support directories
 deployed by image recipes
To: igor.opaniuk@foundries.io
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 14:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209734

On Mon, Jan 13, 2025 at 5:34=E2=80=AFAM Igor Opaniuk via
lists.openembedded.org
<igor.opaniuk=3Dfoundries.io@lists.openembedded.org> wrote:
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
>  meta/lib/oe/spdx30_tasks.py | 33 +++++++++++++++++++++------------
>  1 file changed, 21 insertions(+), 12 deletions(-)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index c60c97896c..20fb5644e3 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -1072,19 +1072,28 @@ def create_image_spdx(d):
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
> +                a =3D objset.add_root(
> +                    oe.spdx30.software_Package(
> +                        _id=3Dobjset.new_spdxid("image-files", image_fil=
ename),
> +                        creationInfo=3Dobjset.doc.creationInfo,
> +                        name=3Dimage_filename,
> +                    )

A "package" is not the correct thing to use here. It should
recursively add all the files (with their checksums). I think reusing
add_package_files() would be best, do you have an example of a recipe
that does this?

> +                )
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
>                  )
> -            )
>              set_purposes(
>                  d, a, "SPDX_IMAGE_PURPOSE:%s" % imagetype, "SPDX_IMAGE_P=
URPOSE"
>              )
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209717): https://lists.openembedded.org/g/openembedde=
d-core/message/209717
> Mute This Topic: https://lists.openembedded.org/mt/110585648/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

