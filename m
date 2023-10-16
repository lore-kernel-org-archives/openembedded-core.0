Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826CCCDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 13:41:50 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.125961.1697463707774730634
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 06:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TTAbHQp0;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2c514cbbe7eso25156921fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 06:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697463706; x=1698068506; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKygD1enHGawu5G2mcKfT/eqWIeduSUx2AfWXdVleAM=;
        b=TTAbHQp0Blj2g3Dqa5Xaz5RnCnFjqa9N6Q7m7Yc+JRgzEpeP84sdxoFmDT0yCPelDb
         4ZJ3g8Iumvjze7mkbpmNUE+NAzxnFAwH8Ifmg+6sxkjZop2vM2Xj239/xIzOkftEQkPO
         hLo4BTnnspyCe1kDJ0xrwChdYmkL9aC7IlgfsDRRPeKLYY5FSbp1MMSbHYJmMfDWgNcu
         ywodPzknEWe4Q02lDgms0je5pB12aQ6yVhuV9C+pcUcWa1DDIG5kSJpLIe/0Vtb2bBor
         VmkyH/TSMeU0kHRsA+Yssd5X95E66AvBEOaDSNUlLFk/BebshGiH8P3qKrfBceScjuJY
         dAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697463706; x=1698068506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKygD1enHGawu5G2mcKfT/eqWIeduSUx2AfWXdVleAM=;
        b=mqLVBFnijH07Hef9FWwRI+4bWHv3l+Rqt7U8Bt32/CXCU4avvVFu+eEI9tuywfRxxa
         k9ErI2snLYG0myx1qTi/QSwxF+i7QzzsyoTZ1leY3cgfHx92EGb58LycrjmI6XDNVyWz
         xk6vnCM3iFW+L6EhpDiLqjyyWRE0WQFjqoZnziPRUi9TTaKBC0Y+n3jHFQHnkwmIT5IJ
         QzyrGC79CZJIqUReaJfBOEbYAuOXtB8zeafj5dHX5++MZTKC06RwOvOdoDqHEpXWcO/P
         gb97Qx5CcBQRaiuCt2wQMMijh9TqPK81JO3926Mns+TYRfoPkwyrec8qJGqBq70J5XDV
         6pMQ==
X-Gm-Message-State: AOJu0Ywi1z3Jm9h+tMQOsfRc63ijS+2c30FoYga9n0X+t8/dJnZrxqDg
	uoDgQ5sOlOXc223gkKVY1rJuVWZXvAuglfpND0g=
X-Google-Smtp-Source: AGHT+IGKyiJ5w1EM9jicEYF7qgFrw7kKG8TCtjGFT60ERCdSca9uLJuUMYWvP7Baaj08lG3lAMCLy/xs6RB3Lp7bQws=
X-Received: by 2002:a2e:7e06:0:b0:2c0:52e:eafa with SMTP id
 z6-20020a2e7e06000000b002c0052eeafamr29375468ljc.29.1697463705678; Mon, 16
 Oct 2023 06:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <90ECC4F9-39B9-4C5E-A2EB-BAAC45DFC28F@getmailspring.com>
In-Reply-To: <90ECC4F9-39B9-4C5E-A2EB-BAAC45DFC28F@getmailspring.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 16 Oct 2023 15:41:34 +0200
Message-ID: <CANNYZj-MH8MMbUT5PAKyyH9xMwYpYD8aqa4Q3QkjyCcPqT0LHw@mail.gmail.com>
Subject: Re: [OE-core] Feature request: Add btop resource monitor
To: =?UTF-8?B?SmFuIENsYXXDn2Vu?= <jan.claussen10@web.de>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 13:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189293

Non-essential utilities like this should be going to one of the layers
in meta-openembedded.

Alex


On Sat, 14 Oct 2023 at 23:07, Jan Clau=C3=9Fen <jan.claussen10@web.de> wrot=
e:
>
> Hi guys,
>
> I would like to add btop to the openembedded-core. The package does now s=
upport cmake, which eases the maintenance effort.
> Before it would have involved a lot of patching as seen here. The Cmake s=
upport is listed as community maintained though, if that is a show stopper.
>
> tree 7370f6d34c4f1a7d3aed8ef4dc334de1e271e4b3
> parent d59f6c752927f7846dc11c4aa00a2d0c9860e75c
> author Jan Clau=C3=9Fen <jan.claussen10@web.de> Sat Oct 14 22:56:45 2023 =
+0200
> committer Jan Clau=C3=9Fen <jan.claussen10@web.de> Sat Oct 14 22:56:45 20=
23 +0200
>
> recipes-support: Add btop
>
>
> diff --git a/meta-oe/recipes-support/btop/btop_1.2.13.bb b/meta-oe/recipe=
s-support/btop/btop_1.2.13.bb
> new file mode 100644
> index 000000000..f780a993a
> --- /dev/null
> +++ b/meta-oe/recipes-support/btop/btop_1.2.13.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "Resource monitor that shows usage and stats for processor, =
memory, disks, network and processes."
> +HOMEPAGE =3D "https://github.com/aristocratos/btop"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
> +SECTION =3D "console/utils"
> +
> +SRC_URI =3D "git://github.com/aristocratos/btop.git;protocol=3Dhttps;bra=
nch=3Dmain"
> +SRCREV =3D "2a864f6f2ea60df16b3f015885eb3c18a48b9b78"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +FILES:${PN} +=3D " \
> +    /usr/share/icons \
> +    /usr/share/icons/hicolor \
> +    /usr/share/icons/hicolor/48x48 \
> +    /usr/share/icons/hicolor/scalable \
> +    /usr/share/icons/hicolor/48x48/apps \
> +    /usr/share/icons/hicolor/48x48/apps/btop.png \
> +    /usr/share/icons/hicolor/scalable/apps \
> +    /usr/share/icons/hicolor/scalable/apps/btop.svg \
> +"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189122): https://lists.openembedded.org/g/openembedde=
d-core/message/189122
> Mute This Topic: https://lists.openembedded.org/mt/101967134/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

