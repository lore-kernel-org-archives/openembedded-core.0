Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8010EC02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 16:15:37 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.21035.1736784928554408551
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 08:15:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=FGhDyUfS;
 spf=pass (domain: foundries.io, ip: 209.85.167.50, mailfrom: igor.opaniuk@foundries.io)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53e3a37ae07so4481208e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 08:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1736784926; x=1737389726; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kt9XzCpStkmbcYr78zUoJN/QJb0GNFX8jxw7ohQe76o=;
        b=FGhDyUfST2dUccjM0a3UWCuG7qGAMnNWIAKT7nDUZvh4m2GZFxVHPdgXfCWtWmpSAz
         ttDWxQ9RX5tnlUQMtHqEjcIRQfJTwfXR/buk1je55ZAJSMe13b/J69k6yOKxCqJ8xvcW
         Qx4foyzQFPTFbwhrT85R5XbtMO1DhSain57qQzDfQYLE5+koTEIlqHR84XVebLmwKKwP
         evlt/v0emSqpzM31Tks1E2VLfMJD2LjLLlAazzpKuM2oK+Q0tkrFoT5VL9R0KCRSCaqm
         zqIvCGvEEKjK0XIEfbRO3zXILHh5ZCNPbW8CxNZqUgamtdiSg1FEYOrQCcQrz5U4n93h
         6R7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736784926; x=1737389726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kt9XzCpStkmbcYr78zUoJN/QJb0GNFX8jxw7ohQe76o=;
        b=l+wagzKGi4ww6vMoVQVkSbq0+hUSbxrbVVd74EowwxCcDkxdb+ObV6z4W08YOjo9+c
         6cMCTbZaxa/hNxS87ZoT33K04AdePN4p+u+7RfPGVW1G+JGL1vuaC7e6hhmf0Cel/e+M
         UIvdbSfDwhKyj76nKg5aIVYG3DpcW5ydso17IThrn3Cn6WtCa/2Y8dIixJq5r/oLSJaH
         RucoQXdf4g1UItRwLd2FvIujGM7SdiEIMlTo+SrzLX6TN9MMmnf5aPpTaKg1kihCkrPe
         VW5yjiOpEtDQNC0p/bfONdFALW5FxhzlhUQRcVgRo3uSjHtVpYRXjwcLhPYIxdsPjKGt
         CDWA==
X-Gm-Message-State: AOJu0YwoJqce+FRHCM9ShSIEVRcakt7RoOF13ozYbVKnBPpgOZuma8w6
	SaVq+YU/GRUWWewEIC0Y1NPGlLnvWlGzNy61ytkdzHCX2v0JhiP+HLh53Xn3QGT31DqTj9Nastd
	msu470kTCDSmfTcd5pbV85fNbyCKS6f4ziZNtOw==
X-Gm-Gg: ASbGnctPWIB8yLkVI3e0n5Y+4j1/X7JePMD0PgUdaMUE36eLI+1qssTAdAV5dcoIRGd
	cSYo1jsAoHRtsaKLHJbT65hnk0tfMnDnCSSA2dZGE
X-Google-Smtp-Source: AGHT+IGd9a4CZRR9sPxLfI8PFGl026OXOHnHWIFn8WgfEIrlf7B+drq8WnHtNM4MTw2EQT7qPr47a5uTOdh2S2UVOag=
X-Received: by 2002:a05:6512:220e:b0:542:1b63:141b with SMTP id
 2adb3069b0e04-542845d9e07mr7188869e87.32.1736784926428; Mon, 13 Jan 2025
 08:15:26 -0800 (PST)
MIME-Version: 1.0
References: <20250113123432.649645-1-igor.opaniuk@foundries.io> <CAJdd5GbCGLNmZT7jsN3x72Mw2gk4Q8Kafm=u=b7L3s_6-7GxTA@mail.gmail.com>
In-Reply-To: <CAJdd5GbCGLNmZT7jsN3x72Mw2gk4Q8Kafm=u=b7L3s_6-7GxTA@mail.gmail.com>
From: Igor Opaniuk <igor.opaniuk@foundries.io>
Date: Mon, 13 Jan 2025 17:15:15 +0100
X-Gm-Features: AbW1kvbLJ8plSSIMGt7du-SfTyx8SX7xJoLwQVV03D3_ZRW2XnjheQjTu9jKe6I
Message-ID: <CAL6CDMHkrq+fEjxZkXOUzoJjvHuNoUvF9zXeUhZ7Xq3kRkrQ3w@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] lib/spdx30_tasks: support directories
 deployed by image recipes
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 16:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209736

Hello Joshua,

On Mon, Jan 13, 2025 at 3:58=E2=80=AFPM Joshua Watt <jpewhacker@gmail.com> =
wrote:
>
> On Mon, Jan 13, 2025 at 5:34=E2=80=AFAM Igor Opaniuk via
> lists.openembedded.org
> <igor.opaniuk=3Dfoundries.io@lists.openembedded.org> wrote:
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
> >  meta/lib/oe/spdx30_tasks.py | 33 +++++++++++++++++++++------------
> >  1 file changed, 21 insertions(+), 12 deletions(-)
> >
> > diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> > index c60c97896c..20fb5644e3 100644
> > --- a/meta/lib/oe/spdx30_tasks.py
> > +++ b/meta/lib/oe/spdx30_tasks.py
> > @@ -1072,19 +1072,28 @@ def create_image_spdx(d):
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
> > +                a =3D objset.add_root(
> > +                    oe.spdx30.software_Package(
> > +                        _id=3Dobjset.new_spdxid("image-files", image_f=
ilename),
> > +                        creationInfo=3Dobjset.doc.creationInfo,
> > +                        name=3Dimage_filename,
> > +                    )
>
> A "package" is not the correct thing to use here. It should
> recursively add all the files (with their checksums). I think reusing
> add_package_files() would be best, do you have an example of a recipe
> that does this?
Thanks for looking into this. Will rework with add_package_files() and send=
 v2.

I stumbled upon this issue when I was reworking custom fstype implementatio=
n
in [1] meta-qcom-hwe layer, which creates a tarball with all boot
artifacts that are
"consumed" by QDL tool [2] for flashing a target board.

The idea was to create folder with all ready-to-flash
artifacts besides a tarball, so we can test local builds right away
avoiding the additional "unpack the tarball" step. I'm still not sure
if it's the right approach, as
the fundamental question is if image recipe output can be a directory
(is it even legit?).

[1] https://github.com/qualcomm-linux/meta-qcom-hwe/pull/122
[2] https://github.com/linux-msm/qdl

>
> > +                )
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
> >                  )
> > -            )
> >              set_purposes(
> >                  d, a, "SPDX_IMAGE_PURPOSE:%s" % imagetype, "SPDX_IMAGE=
_PURPOSE"
> >              )
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#209717): https://lists.openembedded.org/g/openembed=
ded-core/message/209717
> > Mute This Topic: https://lists.openembedded.org/mt/110585648/3616693
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
JPEWhacker@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
Best regards - Freundliche Gr=C3=BCsse - Meilleures salutations

Igor Opaniuk
Senior Software Engineer, Embedded & Security
E: igor.opaniuk@foundries.io
W: www.foundries.io

