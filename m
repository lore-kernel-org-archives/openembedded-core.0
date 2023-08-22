Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37567EE4993
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 15:59:09 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.11822.1692719939843387630
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 08:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=PRf47VTL;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3a7d7df4e67so3219685b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 08:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692719939; x=1693324739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFIesQy1knJ9uLeNbRIoPalX8oVxG5cVxrQSF82kmpg=;
        b=PRf47VTLLXhDYOsoHmSHkMzc3Lpq5I62isdL47YUOAbPAf2zTtDZAE2NfSseq7f9oZ
         TsHrzM6WKP0/Za3eyfv7pvvSHcpddPCUE1hMDZaxSameSSQIzsD1prAl3LkR2ksbkdVV
         J9ECzKmXz4m8vr9exkfXb6+23aIXY+l1mG1L/omeZoFkOKJQd82k6SGZlnHMkz+LWm8T
         EDydUL2I51A6rj73Tsk2nbtQS7EV0zYuovXC6dR2bn6WRVZB3/tgAAaxW+WwDaatpOA5
         Dp4II8jCuUePBH4D0GxJLMQc1K/yte1+hv1ASoeAG/hd0haws/PQ4T7ryoweSNWq9Rps
         NItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692719939; x=1693324739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFIesQy1knJ9uLeNbRIoPalX8oVxG5cVxrQSF82kmpg=;
        b=Vrd/c1muJzBhuF5wFIB7Pg7uVh5mbVsBlXzkR7PbPkXKOD5STXfDzgZ78T46hCAlVh
         stnKdm7j6Yli/uarmofN2TCVPoMjcDSDXu2R62Q5LD+JHdnH2/LFPS1SAzB7ZIuO2Z2X
         8YcEc+cI8dTPKADu2PGkR4qy7BDp+6KS25ATux56992Kbh4rSrksBV8Lej15EHmjwt0M
         gyxrhG+i7+s4n7XN2pecjFJotkpkibyTtN8s4wsN/qXo8vAf8AfPEL5wRPY78ggBcxfh
         QLw9eKIwqrMG8g+iA/DulLL+7hzKp8Qy68Qa0zj2AFUsFTwAywXfDMAR8I8ILUnbuGHT
         mWRw==
X-Gm-Message-State: AOJu0YytHe3PwAXasfnOHpKdZA7/I8ai8n/bG2t60FMxnSDYnHpOJb+2
	ETzdMMtX60/zeYCgMiUmZ6GztIwnWSplQLns04HJYx7jgO9JJw==
X-Google-Smtp-Source: AGHT+IFntVuJuoNmWqoW41sQ5UihgcCt3BS4qbSkCAfgCAAgSnTpD6+a049Z/XaTi/Mh32nZJM6cL69bIhqc56PHX+8=
X-Received: by 2002:a05:6808:23ce:b0:3a8:6b4d:6b78 with SMTP id
 bq14-20020a05680823ce00b003a86b4d6b78mr1828161oib.35.1692719938890; Tue, 22
 Aug 2023 08:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230817124612.1043464-1-p.lobacz@welotec.com> <20230817124612.1043464-2-p.lobacz@welotec.com>
In-Reply-To: <20230817124612.1043464-2-p.lobacz@welotec.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Aug 2023 08:58:32 -0700
Message-ID: <CAMKF1so7HY+kgEgg6oEU9j0thdPuv-7qtjk3RvOkDEHT07nHwA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v13 2/8] package_ipk.bbclass: add support for
 ACLs and xattr
To: =?UTF-8?Q?Piotr_=C5=81obacz?= <p.lobacz@welotec.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 15:59:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186511

On Thu, Aug 17, 2023 at 5:47=E2=80=AFAM Piotr =C5=81obacz <p.lobacz@welotec=
.com> wrote:
>
> Extend OPKGBUILDCMD variable, with additional parameters, depending
> on target distro features, in order to support ACLs and xattr.
>
> With fix pushed to the opkg-devel:
> https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8
> opkg-build is able to create tar archives with ACLs and xattr.
>
> Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
> ---
>  meta/classes-global/package_ipk.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-globa=
l/package_ipk.bbclass
> index b4b7bc9ac2..a0f106e4ad 100644
> --- a/meta/classes-global/package_ipk.bbclass
> +++ b/meta/classes-global/package_ipk.bbclass
> @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.con=
f"
>  PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
>
>  # Program to be used to build opkg packages
> -OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
> +OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils.con=
tains('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DISTRO_=
FEATURES', 'xattr', '-X', '', d)}'

I wonder if it should be an append instead, because these are
dependent on DISTRO_FEATURES anyway and it does not work if distro
features are
enabled and these options are removed from opkg-build cmdline. So
these are required if distro features are enabled. It will also help
the distros overriding OPKGBUILDCMD

>
>  OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
>  OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMEN=
DATIONS") =3D=3D "1"]}"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186307): https://lists.openembedded.org/g/openembedde=
d-core/message/186307
> Mute This Topic: https://lists.openembedded.org/mt/100799493/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

