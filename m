Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F058C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 15:52:07 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.15632.1738165924310717948
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 07:52:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TGgASrSD;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5401c68b89eso846506e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 07:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738165922; x=1738770722; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZHzz0RnBRxXGhkX61vJ9/KKYSqnfLdT8vuuzaqZlgk=;
        b=TGgASrSDtfvPJZ68Zk8Vufn4exmKoXgGSl8BQg2NzHNe39dsQE+UujY7zLpO8uUynu
         fYC0H0gBCZSWwN1gKxSAJk/YIwfGii8XFi4OBwqkL8xioQAaBui9EJCvQUxeuNpDnhpL
         HHJi8y9zhVUGT9LarFoXFSi1s7aEABmYfFaNSIsnUlhVYrpPFiXl/2V+SqUggpIQyoN9
         ZbuXahByNbFZCSJm2aEdRxnk0JBMOef/pul+GErVK9qp3S6O+voAQvvYhVT/H1ou6UOo
         oG1Z7oOerYLLdmTwZEQdarBf4mkfmYm+iLctGuWP2Ur0N3ibzHl+P9i6Qerw9IUSs6C6
         Wp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738165922; x=1738770722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ZHzz0RnBRxXGhkX61vJ9/KKYSqnfLdT8vuuzaqZlgk=;
        b=sLLektGK+wOK2ZaV58eBPnTV9nxnfJfJz8/3JDvG/GvPbia/Td9FCThrKrgQW4w6oS
         rxqkVzE0S0y6pOR6Vc8lgiIp1H3OFAFPlCn+jYe23QkiQVlsVm/hhO/87BdjxV3Z/Cda
         CqgmU122OJj+WJCAoBzUYwPKxx7UK4u2Zs7SnDME/ZtLeE1M8UMa/XUj+7/TdCC4K3Vv
         D1xnmXbtJOuU/Z/sDMfONfnbBPU5N6GDbN9Nxm3Y5qGRT2rsPborgUWQqnqy9qCDoGjG
         kxezUKQOtjL1PE7kRvgfE72KJ+eAX3CofvkhlDoIiZsygTGoBmyTGAAfjcKRN4WSofsZ
         dKzA==
X-Gm-Message-State: AOJu0YyWXn2CAoBF8BSTnyIS/FxcoszU0HN1dTKDCBT+qwwdU+pWghOp
	xNA4PnN+dIc6AJ3G2j4khBFqLnlAmbl8UpU1qz2+cpwssHIQTbjO+DQA1NaHu9hH6PvFzTSpPLd
	cmCZcfIU505031XLtPC7DCJNrw8Q=
X-Gm-Gg: ASbGncvqLCz7R/g6AwSVF6vMho0+hWze6Ie1ANcrtNdJbBWJ0bTfRBujuEyqmN1E823
	u/ta7ojNn+WV2r79bfdkppJNY+aqa1+d5yBpdhtFIPeqoT3Tg+jjOsh+lAqtlbW9shr6F6lXcK1
	o=
X-Google-Smtp-Source: AGHT+IGqdBCysf9X3uN98bhnT6BcIvQKreoaXL/Ck5H0zSpGWr0kMvto9OWYtY6meBPhOpvyDCY7zKhpo180suAuGh8=
X-Received: by 2002:a05:6512:3183:b0:543:bb69:c635 with SMTP id
 2adb3069b0e04-543e4a7a430mr1521703e87.15.1738165922137; Wed, 29 Jan 2025
 07:52:02 -0800 (PST)
MIME-Version: 1.0
References: <20250113123432.649645-1-igor.opaniuk@foundries.io>
In-Reply-To: <20250113123432.649645-1-igor.opaniuk@foundries.io>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 29 Jan 2025 08:51:50 -0700
X-Gm-Features: AWEUYZmTxDRkHScSx65V3x8Va5i9aLl5DQl6PBwTeS9eIvmD03a9XeYmBrxCzIM
Message-ID: <CAJdd5GZoZqUnE3r5TVhbxNWt+sRt2VcW_vii2OAYCnK=u5X-mQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] lib/spdx30_tasks: support directories
 deployed by image recipes
To: igor.opaniuk@foundries.io
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 15:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210386

LGTM

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

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

