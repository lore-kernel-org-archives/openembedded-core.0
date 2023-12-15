Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B456C35274
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 23:20:55 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.2027.1702682451296151050
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 15:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q5AGgQm4;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1fa1c3755afso494437fac.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 15:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702682450; x=1703287250; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsYhktkuTkWi6/bblwEZTR0W2jmsSn7Vk6O2BEnYCKc=;
        b=Q5AGgQm48a2+y2ldkzdjSsvZPILn5wur27AXYgEAbGWqT5BRPXkrYWc0rmFu+bWa8/
         gWrplvilUGzZBAPMhl55sLWE7GuZsNIJWsgfRiZEYmfP3yWEcUyzMkazTB06XcvwJEIV
         ag0rtE5kLEF3zy70n1hAjoBHDrNQvOmncR0A9jFzUxwoSy6FVRTSt2nkmKdXo0xJd08v
         GDjy3MpiAsUoRwJj400xEisMoroY6PMAq/+aU2TJMqTAEfNV185omISsPQoEJWR31G7P
         TA1j3VPldR1kog7SmhcF3daY8UDOdM96Ew+IiIK2665BRtK+oUSH3AcCUjif1lgBPQKH
         70yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702682450; x=1703287250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VsYhktkuTkWi6/bblwEZTR0W2jmsSn7Vk6O2BEnYCKc=;
        b=YD0doK1geBjNZq9XPq3r1ldcwVK86PsIBwMaCiVqTYFxXm6dGYoh5HNBXHYV9w2kJK
         LmIPJ3Tzr2IbwjirEHokMDTl5fcPaoO9/Y0EUF6L3Q1VwvwYW8l1W4hLi/uQmRBPm/z+
         s+Rhbrnj2dzpq3PYqaizpHe162juRfMPSjzobD+bz7OwoUC5swQYesTMj1hzRbPu8c0p
         0sTMGmkLuUbJA5raQvboRi3xjsEmsitoXJ6TlUZ+AUeTtltI6dIcAmjZyN5py1i3lljp
         yD5qdPolhreqUUNGqhv3YAHJEdBYDgsuoMzkDfnmqX3f5QcaCj5UlzLbal6eI5dbyiH6
         bDRg==
X-Gm-Message-State: AOJu0YwFPayCJfncaRSlM8ivL0RoadlsSRW5dgjrpo6LsdIk4Ell2dFM
	SKZf980HSYYdHk3RZIPqxgRT7ZMjLQUkuv0h3O/F2BKTHB0=
X-Google-Smtp-Source: AGHT+IHWexw3nP2ntxaJhnf0w5nH19VXccUHYlyO4McmDY4/QejQQGXzjsjEiVE1DZBuoIzX36TSUI+ScG/NkK8vcnU=
X-Received: by 2002:a05:6870:b148:b0:1fa:e02d:a14c with SMTP id
 a8-20020a056870b14800b001fae02da14cmr5177364oal.4.1702682450200; Fri, 15 Dec
 2023 15:20:50 -0800 (PST)
MIME-Version: 1.0
References: <20231212135628.9595-1-venkata.pyla@toshiba-tsip.com>
In-Reply-To: <20231212135628.9595-1-venkata.pyla@toshiba-tsip.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Dec 2023 15:20:24 -0800
Message-ID: <CAMKF1spHz3zSOnop326y65A_1MPGqeZJJ2AnvTj=87VqFKbh=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wic: use E2FSPROGS_FAKE_TIME and hash_seed to
 generate reproducible ext4 images
To: Venkata Pyla <venkata.pyla@toshiba-tsip.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 23:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192551

I think a space is needed at the end of the string. We get into string
concatenation forning different element

| ERROR: _exec_cmd: export
PATH=3D/mnt/b/yoe/master/build/tmp/work/imx8qm_var_som-yoe-linux/yoe-kiosk-=
image/1.0/recipe-sysroot-native/sbin:/mnt/b/yoe/master/build/tmp/work/imx8q=
m_var_som-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-native/usr/sbin:/mnt=
/b/yoe/master/build/tmp/work/imx8qm_var_som-yoe-linux/yoe-kiosk-image/1.0/r=
ecipe-sysroot-native/usr/bin:/mnt/b/yoe/master/build/tmp/work/imx8qm_var_so=
m-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-native/usr/bin/aarch64-yoe-l=
inux:/mnt/b/yoe/master/build/tmp/work/imx8qm_var_som-yoe-linux/yoe-kiosk-im=
age/1.0/recipe-sysroot-native/bin:/mnt/b/yoe/master/build/tmp/hosttools:$PA=
TH;export
E2FSPROGS_FAKE_TIME=3D1302044400;Nonemkfs.ext4 -F -i 8192 -E
hash_seed=3Da97814bc-a858-50e1-bb19-ddcf990c9d6e
/mnt/b/yoe/master/build/tmp/work/imx8qm_var_som-yoe-linux/yoe-kiosk-image/1=
.0/tmp-wic/rootfs_boot.2.ext4
-L boot -U fc518f34-5d93-4088-98a4-0ec0bff70335 -d
/mnt/b/yoe/master/build/tmp/work/imx8qm_var_som-yoe-linux/yoe-kiosk-image/1=
.0/tmp-wic/boot.2
returned '127' instead of 0
| output: /bin/sh: line 1: Nonemkfs.ext4: command not found


On Tue, Dec 12, 2023 at 5:56=E2=80=AFAM Venkata Pyla
<venkata.pyla@toshiba-tsip.com> wrote:
>
> From: venkata pyla <venkata.pyla@toshiba-tsip.com>
>
> E2FSPROGS_FAKE_TIME: sets fixed times for the inodes in the file system.
> hash_seed: creates reproducible directory indexes in the file system.
>
> Reference commit in e2fsprogs: e1f7100643a46456be107b33098f6034b0835e6d
>
> Signed-off-by: venkata pyla <venkata.pyla@toshiba-tsip.com>
> ---
>  scripts/lib/wic/partition.py | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index b1a2306dd1..8e2273ca2f 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -284,6 +284,17 @@ class Partition():
>
>          extraopts =3D self.mkfs_extraopts or "-F -i 8192"
>
> +        if os.getenv('SOURCE_DATE_EPOCH'):
> +            sde_time =3D int(os.getenv('SOURCE_DATE_EPOCH'))
> +            pseudo =3D "export E2FSPROGS_FAKE_TIME=3D%s;%s" % (sde_time,=
 pseudo)
> +
> +            # Set hash_seed to generate deterministic directory indexes
> +            namespace =3D uuid.UUID("e7429877-e7b3-4a68-a5c9-2f2fdf33d46=
0")
> +            if self.fsuuid:
> +                namespace =3D uuid.UUID(self.fsuuid)
> +            hash_seed =3D str(uuid.uuid5(namespace, str(sde_time)))
> +            extraopts +=3D " -E hash_seed=3D%s" % hash_seed
> +
>          label_str =3D ""
>          if self.label:
>              label_str =3D "-L %s" % self.label
> --
> 2.20.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192192): https://lists.openembedded.org/g/openembedde=
d-core/message/192192
> Mute This Topic: https://lists.openembedded.org/mt/103129684/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

