Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077B2CA0ED1
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 16:37:43 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.112.1755535055889965589
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 09:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IJ7F4ukv;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e934c8f9657so1239805276.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 09:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755535055; x=1756139855; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+96cJu94ppMMSTzrPLwzbz+IfdR7Qwa/JOaocwmhx3w=;
        b=IJ7F4ukvNOSg8ZKDh4lbwv6BGuVb07NTKFTDt6VEkDx+xyQOgk64wpGV260/ntuyrj
         8IOONmhu6MMKnT4TAqOJ3JJ7l7ybJBorPO0wfPGijocQW5ScL5Ez+B+5Y85DMK4T2vFl
         aMeXHyoK/khqUtbq2ys4U4XX+uemcLrSTBcENcGVSucrXLfnLzh50EL2gYdyTM+NCbnL
         kip5tLEgBWDnVFzb37flkImjpHQvC7aCADeRmo1vclxL4+qxx05Vvw/+tKOesIKCHcHo
         p6eGgp7iP3/f9wpbM7S1cZnK6mwW6vcuiVcJ860fQigilyMfXd1NO3vIatmJhkqNz4+w
         Lvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755535055; x=1756139855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+96cJu94ppMMSTzrPLwzbz+IfdR7Qwa/JOaocwmhx3w=;
        b=Fjn2RGywRUogKN/epDqkfplyHKHyeDcpNgDzIcMZ0Oi5R5TqQCWrqWhMRB3165XBEa
         7p32bKUQi1YOd4oZzH42X1FAWznJG5XghhFnlwS7A56uUeyT5fPeSebOjkYuNl0ovcko
         veVg2aN3wb7OTin6v2FYq4C5pA3/J6pM3gjEiLu/Ev9qI3R8u660dh9Hg567WHcC2OXP
         Cp/idL+6qTmiFcE9v/LwRUmmARu8RoIkoGou+IYnjMHW3rvgfk+gW32kwWUue1dQYONL
         XDDqZIYytMRaytD58AtsqJ5xSpTQD2bF06NxzSkpCNXYs7Ga+KGY43GwecK+jHXi0lt2
         NZVg==
X-Gm-Message-State: AOJu0Yxvrb9eW9ttoT7j6fMK8B1RfKU3OEPh8izTrpQpNzT9fOXK+ofe
	fv1UA1gAKDnFs2HgSyS009yXT/mnSR3L5h2/hV70dt011o6b/HEw7ZwUzloLZVJg8lvxXRZrcG+
	eWPXNh5MMOtL/0BhGlPEWhkDHM2KaHX8=
X-Gm-Gg: ASbGnct3h8Krl26HJ653Msa1mO+oxvWM41UGmpsxlIM4DF82+qxxPDKSfAflBzVtSnM
	p729FC4yg4735ZadvyIlauizqmp8Q985T58R3cIVYtMFm7AmzT9IsxPvd+BuHzcOjkVI7KA+HO5
	hyw5J07ziuJYQT4OMSyxmb/NrDY+cJtQqv7Gi0NLJqSJWAkFZYrHHkY/2u/3oAWuAwqaQpmwf3a
	Q0TZv8he0z1j8z/2QYgZHzec+trpPDEPGXaGEFB
X-Google-Smtp-Source: AGHT+IHZkDSKNwdJVldwIrb2DM1XrTipv5/RJoyXFI2FJpvAQ3I23B9wTVS5qW1z0YA8ubdgzgQcF5B1HkdBWulba9Y=
X-Received: by 2002:a05:6902:2010:b0:e90:6c17:7e03 with SMTP id
 3f1490d57ef6-e933df07298mr11379725276.31.1755535054777; Mon, 18 Aug 2025
 09:37:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250817164908.88234-1-mroj4n@gmail.com>
In-Reply-To: <20250817164908.88234-1-mroj4n@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Aug 2025 09:37:08 -0700
X-Gm-Features: Ac12FXwSpvbPeBhdBP8lR1GToJqsCUzVSLuxEaG86peRja30FSH-7fnq7Ymkm5w
Message-ID: <CAMKF1soEqqU7GLCsQtm4RUAjy4ptVVbBaA+FQ2FesO1UpJ87YA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wic: add attribute parameter to parted
To: mroj4n@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 16:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222040

On Sun, Aug 17, 2025 at 10:06=E2=80=AFAM Mohammed via lists.openembedded.or=
g
<mroj4n=3Dgmail.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Mohammed <mroj4n@gmail.com>
> ---
>  scripts/lib/wic/help.py                  | 3 +++
>  scripts/lib/wic/ksparser.py              | 1 +
>  scripts/lib/wic/partition.py             | 1 +
>  scripts/lib/wic/plugins/imager/direct.py | 5 +++++
>  4 files changed, 10 insertions(+)
>
> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> index 2e3061f343..fef856dbbb 100644
> --- a/scripts/lib/wic/help.py
> +++ b/scripts/lib/wic/help.py
> @@ -1070,6 +1070,9 @@ DESCRIPTION
>                  an MBR header. Partitions with this flag will be include=
d in
>                  this MBR header.
>
> +        --attribute: This option is specific to wic. This option is used=
 to set
> +                      the partition attribute.
> +

There is no point of mentioning its specific to wic, the help message is
coming out of wic help.

>      * bootloader
>
>        This command allows the user to specify various bootloader
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index 7ef3dc83dd..af4fb91d58 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -189,6 +189,7 @@ class KickStart():
>          part.add_argument('--fsuuid')
>          part.add_argument('--no-fstab-update', action=3D'store_true')
>          part.add_argument('--mbr', action=3D'store_true')
> +        part.add_argument('--attribute')

Tabs/Spaces, use the existing formatting.

>
>          bootloader =3D subparsers.add_parser('bootloader')
>          bootloader.add_argument('--append')
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index b34691d313..cf5c51f105 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -61,6 +61,7 @@ class Partition():
>          self.update_fstab_in_rootfs =3D False
>          self.hidden =3D args.hidden
>          self.mbr =3D args.mbr
> +        self.attribute =3D args.attribute
>
>          self.lineno =3D lineno
>          self.source_file =3D ""
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/p=
lugins/imager/direct.py
> index 6e1f1c8cba..877a5d2a97 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -664,6 +664,11 @@ class PartitionedImage():
>                  exec_native_cmd("sfdisk --sector-size %s --part-attrs %s=
 %s RequiredPartition" % \
>                                  (self.sector_size, self.path, part.num),
>                                  self.native_sysroot)
> +
> +            if part.attribute:
> +                logger.debug("Set attribute:'%s' for partition '%s' on d=
isk '%s'", part.attribute ,part.num, self.path)
> +                exec_native_cmd("sgdisk -A %s:=3D:%s %s" % (part.num, pa=
rt.attribute, self.path), \
> +                self.native_sysroot)
>

It would be good to add a testcase for this as well.

>          if self.ptable_format =3D=3D "gpt-hybrid":
>              # Write a protective GPT partition
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222005): https://lists.openembedded.org/g/openembedde=
d-core/message/222005
> Mute This Topic: https://lists.openembedded.org/mt/114750349/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

