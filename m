Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53CFFC54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 19:17:40 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.1729.1709666257543450988
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 11:17:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dOAD+A7N;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5a122beaa1dso1719577eaf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 11:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709666257; x=1710271057; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfshbp+oIys5/uD1de3OQVVV2KQ6g9czbF10eGJBseI=;
        b=dOAD+A7N82h3Rl4m38VbJK9ackjo76DTmzGROOzifqj3ztZPFXzr96Tx9wbwgd8gjU
         YBYPwjBabgpRQ0OSgO5Y4w+lAaqYyVIsLatO+DGyw9HoY7Y71Jf89ZkYD+IuQRSP6C+B
         J5HXTUcRA3zosuvGEmtoBWcwTruqEqC4jX3rLoMrXmLWEVMGxpCRdigzYUlUAtBKFGXJ
         XJHGvgtu9ZgIfSq6cb9DGXGq4gwpou8W76QGzIfI11U5n8y5VgsVEtHAmpRAFq9FxBHr
         y26ufmx5MCw4r39oS7+8kSAu8MHJI4OnQSm4DBvXOK14n6ZH5o/MVgIpUs56VWHmaEo5
         GBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709666257; x=1710271057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfshbp+oIys5/uD1de3OQVVV2KQ6g9czbF10eGJBseI=;
        b=Knyp17H1ngp4wMQ/F3UjJ/rkbkxLMUGVJlxmdjyHpQKKk2XGgC4JLqlUN5WpVDTOn3
         MQ1EgCOGXzCiUvo4vQl5aD3XR8qPspeHrUS7aCgMDUwmyXoKGobNomkhvxjEkNSAUID0
         evcmslyK4K/jq6jgGDbt1m1g5F6ox1u9J41bCvRyFFy5cbCOmIL4qePepTq9jr5Pvg2X
         h27whHEi++l/Cg/Xc9sZB4Yr+IcsniROXFXfeDpq8VjaiAM1PDEnmS94aHDyMxVsCHHN
         KgokqDRNqxOkREc0PMRxMW6o80Q/FDMJslubGQgI/ql5HiiE7wCSQ2Mp37lpl6NV/MMV
         6N3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUG8HmMsThEbYkLMR0eZfphXxRvczYAMi1RZTqB+pxnAunyUowtE4hHf4/VJgPrWYFMJeFEHnknSDSw6p8ci02DBFfNzR5RwWvCSSAtwANFzGt0O7KsOWgE
X-Gm-Message-State: AOJu0YwS6zD/p9o3By4i69PUSOWHKQFtlQHG5fXjydM2dspO/NJagLYj
	qmKuWNNEPtyAvj1RQRylEZ0r5LJUI7T98t9qxBF2rsDHjgL8s3USJoNJudga7RVMS0Q3bw7DPEn
	fSgJYakwpzXAhrHuCyUz5878DPEvX4ZSG
X-Google-Smtp-Source: AGHT+IFYu+pc8WDVVnLAKBLzu2bNdtxxXEYTXgNVHt6QO3+k3S6gH+6pB2vIC2fX9bbTGp7lJPfmttt71hUwS/FV9t4=
X-Received: by 2002:a05:6870:93ca:b0:21f:cb2e:de41 with SMTP id
 c10-20020a05687093ca00b0021fcb2ede41mr2870747oal.0.1709666256841; Tue, 05 Mar
 2024 11:17:36 -0800 (PST)
MIME-Version: 1.0
References: <20240304192558.27575-1-twoerner@gmail.com> <0e8ffac6e98c84bf7665acbbe33eef05742e8109.camel@linuxfoundation.org>
 <20240305125245.GA2252@localhost>
In-Reply-To: <20240305125245.GA2252@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Mar 2024 11:17:11 -0800
Message-ID: <CAMKF1spYMU14aDBDJfRynLZNg0p6a5jTcdriutAMOZXa=ffDwg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bmaptool: now part of Yocto Project
To: Trevor Woerner <twoerner@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 19:17:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196644

This also needs to reflect in docs.

On Tue, Mar 5, 2024 at 4:52=E2=80=AFAM Trevor Woerner <twoerner@gmail.com> =
wrote:
>
> On Tue 2024-03-05 @ 11:59:17 AM, Richard Purdie wrote:
> > On Mon, 2024-03-04 at 14:25 -0500, Trevor Woerner wrote:
> > > The bmaptool (previously: bmap-tools, bmap-tool, bmaptool) has been m=
oved
> > > to be under the Yocto Project umbrella and is now hosted at:
> > >
> > >     github.com/yoctoproject/bmaptool
> > >
> > > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > > ---
> > >  meta/classes-recipe/image_types.bbclass                   | 2 +-
> > >  meta/classes-recipe/image_types_wic.bbclass               | 2 +-
> > >  meta/conf/distro/include/maintainers.inc                  | 2 +-
> > >  .../bmap-tools_git.bb =3D> bmaptool/bmaptool_git.bb}        | 8 ++++=
----
> > >  .../files/0001-BmapCopy.py-fix-error-message.patch        | 0
> > >  ...0002-CLI.py-fix-block-device-udev-race-condition.patch | 0
> > >  .../0003-BmapCopy.py-tweak-suggested-udev-rule.patch      | 0
> > >  7 files changed, 7 insertions(+), 7 deletions(-)
> > >  rename meta/recipes-support/{bmap-tools/bmap-tools_git.bb =3D> bmapt=
ool/bmaptool_git.bb} (78%)
> > >  rename meta/recipes-support/{bmap-tools =3D> bmaptool}/files/0001-Bm=
apCopy.py-fix-error-message.patch (100%)
> > >  rename meta/recipes-support/{bmap-tools =3D> bmaptool}/files/0002-CL=
I.py-fix-block-device-udev-race-condition.patch (100%)
> > >  rename meta/recipes-support/{bmap-tools =3D> bmaptool}/files/0003-Bm=
apCopy.py-tweak-suggested-udev-rule.patch (100%)
> >
> > Thanks. Unfortunately this wasn't quite enough and caused a ton of
> > build failures, it also needs:
>
> Oops! Sorry about that.
>
> > diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/me=
ta/wic-tools.bb
> > index 9282d36a4dc..76494e7fca4 100644
> > --- a/meta/recipes-core/meta/wic-tools.bb
> > +++ b/meta/recipes-core/meta/wic-tools.bb
> > @@ -4,7 +4,7 @@ LICENSE =3D "MIT"
> >
> >  DEPENDS =3D "\
> >             parted-native gptfdisk-native dosfstools-native \
> > -           mtools-native bmap-tools-native grub-native cdrtools-native=
 \
> > +           mtools-native bmaptool-native grub-native cdrtools-native \
> >             btrfs-tools-native squashfs-tools-native pseudo-native \
> >             e2fsprogs-native util-linux-native tar-native erofs-utils-n=
ative \
> >             virtual/${TARGET_PREFIX}binutils \
> > diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
> > index 2b90821b305..1a7c140fa6c 100644
> > --- a/scripts/lib/wic/misc.py
> > +++ b/scripts/lib/wic/misc.py
> > @@ -25,7 +25,7 @@ from wic import WicError
> >  logger =3D logging.getLogger('wic')
> >
> >  # executable -> recipe pairs for exec_native_cmd
> > -NATIVE_RECIPES =3D {"bmaptool": "bmap-tools",
> > +NATIVE_RECIPES =3D {"bmaptool": "bmaptool",
> >                    "dumpe2fs": "e2fsprogs",
> >                    "grub-mkimage": "grub-efi",
> >                    "isohybrid": "syslinux",
> >
> > but I'll squash that into the patch.
>
> Great, thanks!
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196631): https://lists.openembedded.org/g/openembedde=
d-core/message/196631
> Mute This Topic: https://lists.openembedded.org/mt/104729497/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

