Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4980DC369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 14:58:46 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.759.1746025125457967502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 07:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ULMj+bDx;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-401f0e4c851so2639b6e.0;
        Wed, 30 Apr 2025 07:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746025125; x=1746629925; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCe2ULgLjSrlIEuc4s80z4CrDFSxp+bj2QXsdfoWxxk=;
        b=ULMj+bDxpmJ2Rw/CEdRpAHfoa0o7xvCczYS3Gv6SqKO85mJOvaIpEa76Uzl8jUyKcu
         Mm3/r781rBOIgbODfRxmUgLcus2HQWWuu8D4kVCIYTe1dtlLP7ciCXFxSSamBBxy05EV
         bjuJU3bJ9edhv39uhZDmKG7rd+sDd/sk3KFM2vPkeah3UylmVEqmNfhqvgfJ6TzLw1pX
         Bf1I95OwWPMyh5nBDWge0iah2afIcLjAxm9WVi0RlfBkZRLhWOyw5uP3pR63tBEHG5mU
         imqnT1XRoNF6mx0CTPP8x/EqHDM0Pyejv7Iq1mVymr9TDGCyQGOBHiDMDF12LBVZOMm2
         mNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025125; x=1746629925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCe2ULgLjSrlIEuc4s80z4CrDFSxp+bj2QXsdfoWxxk=;
        b=KEGb5IMMxhHGhuT9QNEYPKtqfFGJWAZ1Kkt52BoXg3xWeQJESOCAFQ0Wl03G4hfqwb
         WGgFFcGJ9kkCaiSIWfPElphFz6P3+92KxlayMw2a/pvnZ1TnXUuMmHsPjE/H4KVzMxgC
         YMbuoK9Nb3ias3+Q7nC7cJwUAum83KNgklSRwaVXA4nwb2/lszQRarcKNol24sTvzuZQ
         5ej4lhoV17F6eYsKa1Ej+xtKhd68VIKqYbb1Ha/ybbAANd6TDGjxqvYqMa8K2VY/yPOQ
         3u0QYoa9bXkxMvAPWQzEXV2iXJXLI7P1EVdhjO1MUzLCLT90ITkFleEqbARWQ7R/mYpm
         A+Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXcPBO7Ce4j3MXhN9g8d9B2ft/Vw/tYqMr1sROJHCAy5OqYcYdIZnBKkJycOq0h60cd9e4ZkH7J9f33pYLR9fEMQBE=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxqsqg2uLmN838A2le/3Nheclsa8Qq3mhgbDDukwDlMtO1yYElP
	+Ttd1Cf6BrVFHZw0WqcRQlItRAT6Bl4Ydp7JLEGn4qD4Pnq6UHefwodFP0yzmiBoCikyYdDqepR
	vX/Vc3jgVlUMosNrWFUCqNCPqDS/5U/8k
X-Gm-Gg: ASbGnct+fTx/r6OXqTxia2M4Ptln/e74h+TnF861gPD7MgICpHFVwF3jie97YvDEEJW
	XWVj2aJluxywJoFR5kgF8n3+OyDtJLvAroVOEXRPopLwE2fuV6MnFlE45rF/nfZTTLZ+xvpzrRD
	2hN49NThzHVFqnaS8t1fHeVSwGPpXUjy0Qh1aW
X-Google-Smtp-Source: AGHT+IGEt//FycZf/JKFkVfrB8i7ee4bz5/hx+Eq/32aLIqFgd8fp5eXww9hFUy1nyg7uo6ckhFD3k6Ck8rKNquZfdo=
X-Received: by 2002:a05:6808:319b:b0:401:16e:b692 with SMTP id
 5614622812f47-4024396400cmr2033336b6e.26.1746025124649; Wed, 30 Apr 2025
 07:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250430053825.9782-1-wen.yang@linux.dev>
In-Reply-To: <20250430053825.9782-1-wen.yang@linux.dev>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Apr 2025 07:58:18 -0700
X-Gm-Features: ATxdqUH9cTXZ41tp-FZyvAE8Yz3sI43mnQjoVdzLERUYj7v5u0_RKKt1Fka-MvA
Message-ID: <CAMKF1srcK3Y3W-sf9d0QknWfyqJF2P9jw_xQKZhC5POBATuA5g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] testdisk: add recipe
To: wen.yang@linux.dev
Cc: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 14:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215750

On Wed, Apr 30, 2025 at 5:44=E2=80=AFAM Wen Yang via lists.openembedded.org
<wen.yang=3Dlinux.dev@lists.openembedded.org> wrote:
>
> From: Yang Wen <wen.yang@linux.dev>
>
> testdisk is a free data recovery software primarily designed to help
> recover lost partitions and/or make non-booting disks bootable again
> when these symptoms are caused by faulty software.
>
> Signed-off-by: Wen Yang <wen.yang@linux.dev>
> ---
>  .../recipes-support/testdisk/testdisk_7.2.bb   | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-support/testdisk/testdisk_7.2.bb
>
> diff --git a/meta-oe/recipes-support/testdisk/testdisk_7.2.bb b/meta-oe/r=
ecipes-support/testdisk/testdisk_7.2.bb
> new file mode 100644
> index 0000000000..3edc97f607
> --- /dev/null
> +++ b/meta-oe/recipes-support/testdisk/testdisk_7.2.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION =3D "TestDisk is a free data recovery software primarily des=
igned to help recover lost partitions and/or make non-booting disks bootabl=
e again when these symptoms are caused by faulty software, certain types of=
 viruses or human error (such as accidentally deleting your Partition Table=
)."
> +LICENSE =3D "GPL-2.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> +
> +DEPENDS =3D "jpeg ncurses e2fsprogs"
> +
> +SRC_URI =3D "https://www.cgsecurity.org/testdisk-7.2.tar.bz2"

Use ${BP}.tar.bz2 instead of hardcoding tarball name

> +S =3D "${WORKDIR}/testdisk-7.2"
> +

That's the implicit value of S as well.  Remove it.

> +inherit autotools pkgconfig
> +
> +PACKAGES =3D+ "${PN}-photorec"
> +
> +DESCRIPTION:${PN}-photorec =3D "Photorec is file data recovery software =
designed to recover lost files including video, documents and archives from=
 Hard Disks and CDRom and lost pictures (Photo Recovery) from digital camer=
a memory."
> +FILES:${PN}-photorec =3D "${sbindir}/photorec"
> +
> +SRC_URI[md5sum] =3D "c6809b6fd06b5022467c8faa32d49a27"

Please drop md5sum. We do not use them anymore.

> +SRC_URI[sha256sum] =3D "f8343be20cb4001c5d91a2e3bcd918398f00ae6d8310894a=
5a9f2feb813c283f"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117253): https://lists.openembedded.org/g/openembedde=
d-devel/message/117253
> Mute This Topic: https://lists.openembedded.org/mt/112537787/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

