Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0227FEB64DC
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 16:30:05 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.3610.1689352202355587586
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 09:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=DtzC+i9/;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.180, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-bd61dd9a346so1976399276.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 09:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689352201; x=1691944201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Es/JSccVOvo4mosrtCLgrTcnR8n/ROJrkPJMFooco1w=;
        b=DtzC+i9/sGU3T+L/+cc45vMjELf0NXO60GUjuZ8EXDdFwaqzmHdTnjd/soqVY7oBAn
         H9V6jxZHT345GGje9APZg4X2OgtyMOejy3MeHZW4WFl1TSlpUOsLmMRarVSDr3qOHe/C
         b8bf0utlQIStcNw7JAucSNg0eT2oulZpFR6y6hMHXLXOqwVi800+OC0vbzZhIVdI1GGB
         DvIxPYbwWGW2IXwL+4fHEbndV5RRbqZ9EC8II84fJzZ/kyK4ZWQhS+IBW/f+64oQ2BuB
         aX30O2YPZIPCceqqjP1ZNdItrw99KyjGGfz+IUoA1TAQks1He+ssnixa76CDk+0gsQP+
         1dsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689352201; x=1691944201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Es/JSccVOvo4mosrtCLgrTcnR8n/ROJrkPJMFooco1w=;
        b=TnXuBPgYhDCNiLp5ozh75HDtmrsu+3L/9NPi6nT2JUYcnUjoBNMDwHgnKfbXzDWrTG
         D875qOuL5HIl73AHGzt1IzD9Jz8C+ZapP/fsZ8jJQPA/6pRbjUPCcTG+vpy7bezpKchX
         GAq2Y68iGfnqotpk9J77BoL3r3fFBVUQTCju5+Wm/RsQ2Slr3+gnQfmaKZztZyC02u5f
         6NiSGi2kh5tZ7GDQYjfHRtWZpPmx6DwyCRdyEb/d9nFZw8fvYZ83fJDs7b+g+LKZqCzI
         a2dMVAuJD++NkUxP1zdhgClNtTbQkwArbVlmTyL/V5LKidWkKzPn/ZUfErS8bMYJrMAj
         dUkA==
X-Gm-Message-State: ABy/qLY3tZkfOy9qX20O8VG8KW9hfude8PgUwptTn2czDMSz9jRS1U8v
	4+XtKVOIJsJf7LI/V61QXPA2N1BYJZG9BRheEnMIvQ==
X-Google-Smtp-Source: APBJJlFHfzVylItz84kBx5xyBxCCExsrFCs0h66IqJ30oskFljREUqfJGcmHrgfktaCxSQSmpcKCdx/rH+j5lNWlLh4=
X-Received: by 2002:a25:b9cf:0:b0:c8e:2fc8:5dee with SMTP id
 y15-20020a25b9cf000000b00c8e2fc85deemr3929068ybj.54.1689352201472; Fri, 14
 Jul 2023 09:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <jSoT.1689308930141918532.7s80@lists.openembedded.org>
In-Reply-To: <jSoT.1689308930141918532.7s80@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 14 Jul 2023 06:29:50 -1000
Message-ID: <CAOSpxdbCqM0RzQ-8D5E+X07yaCGJbLzgZ8XC4TmFtA-212mZrQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] wic: Add dependencies for erofs-utils
To: Heiko <heiko.thole@entwicklung.eq-3.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 16:30:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184275

I am not able to apply this patch, something is broken in the formatting.

Please see below link for info on creating and submitting a patch:

https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

Steve

On Thu, Jul 13, 2023 at 6:28=E2=80=AFPM Heiko <heiko.thole@entwicklung.eq-3=
.de> wrote:
>
> From 2d8164ac97277c344bc7c9e11f0ed78235726bda Mon Sep 17 00:00:00 2001
> From: Heiko Thole <heiko.thole@entwicklung.eq-3.de>
> Date: Wed, 12 Jul 2023 07:41:59 +0200
> Subject: [kirkstone][PATCH] wic: Add dependencies for erofs-utils
>
> In order to build erofs filesystems, wic must have the erofs-utils packag=
e installed into its sysroot.
>
> Signed-off-by: Heiko Thole <heiko.thole@entwicklung.eq-3.de>
> ---
>  meta/classes/image_types_wic.bbclass | 2 +-
>  meta/recipes-core/meta/wic-tools.bb  | 2 +-
>  scripts/lib/wic/misc.py              | 1 +
>  3 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_ty=
pes_wic.bbclass
> index 6453dd1b74..8497916d48 100644
> --- a/meta/classes/image_types_wic.bbclass
> +++ b/meta/classes/image_types_wic.bbclass
> @@ -83,7 +83,7 @@ do_image_wic[recrdeptask] +=3D "do_deploy"
>  do_image_wic[deptask] +=3D "do_image_complete"
>
>  WKS_FILE_DEPENDS_DEFAULT =3D '${@bb.utils.contains_any("BUILD_ARCH", [ '=
x86_64', 'i686' ], "syslinux-native", "",d)}'
> -WKS_FILE_DEPENDS_DEFAULT +=3D "bmap-tools-native cdrtools-native btrfs-t=
ools-native squashfs-tools-native e2fsprogs-native"
> +WKS_FILE_DEPENDS_DEFAULT +=3D "bmap-tools-native cdrtools-native btrfs-t=
ools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
>  # Unified kernel images need objcopy
>  WKS_FILE_DEPENDS_DEFAULT +=3D "virtual/${MLPREFIX}${TARGET_PREFIX}binuti=
ls"
>  WKS_FILE_DEPENDS_BOOTLOADERS =3D ""
> diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta=
/wic-tools.bb
> index daaf3ea576..9282d36a4d 100644
> --- a/meta/recipes-core/meta/wic-tools.bb
> +++ b/meta/recipes-core/meta/wic-tools.bb
> @@ -6,7 +6,7 @@ DEPENDS =3D "\
>             parted-native gptfdisk-native dosfstools-native \
>             mtools-native bmap-tools-native grub-native cdrtools-native \
>             btrfs-tools-native squashfs-tools-native pseudo-native \
> -           e2fsprogs-native util-linux-native tar-native \
> +           e2fsprogs-native util-linux-native tar-native erofs-utils-nat=
ive \
>             virtual/${TARGET_PREFIX}binutils \
>             "
>  DEPENDS:append:x86 =3D " syslinux-native syslinux grub-efi systemd-boot"
> diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
> index a8aab6c524..2b90821b30 100644
> --- a/scripts/lib/wic/misc.py
> +++ b/scripts/lib/wic/misc.py
> @@ -36,6 +36,7 @@ NATIVE_RECIPES =3D {"bmaptool": "bmap-tools",
>                    "mkdosfs": "dosfstools",
>                    "mkisofs": "cdrtools",
>                    "mkfs.btrfs": "btrfs-tools",
> +                  "mkfs.erofs": "erofs-utils",
>                    "mkfs.ext2": "e2fsprogs",
>                    "mkfs.ext3": "e2fsprogs",
>                    "mkfs.ext4": "e2fsprogs",
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184251): https://lists.openembedded.org/g/openembedde=
d-core/message/184251
> Mute This Topic: https://lists.openembedded.org/mt/100135410/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

