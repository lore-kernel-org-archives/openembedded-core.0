Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24393CD13CF
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 08:21:18 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.18221.1725351675605729791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 01:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bnCSE9VW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42bb8cf8abeso39654835e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 01:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725351674; x=1725956474; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TIVy7rJOf8ckbxsOEwJilAqoXQq4V+pJbmIYMEMFVoM=;
        b=bnCSE9VWKMmc4+B2YAE+g4nx9YTq8Bf2C6ZmLui6j32y2aMMvfdQpdiWY+vTxqK7zq
         3fkJZW2zeAyVBhAe2okV1q/+L7zT6KG6GI3nxV8vcQznyHD7FAE4HEQm7NpRGAxmR1oo
         0PlY0p77gxMtzZRg7ZL3JEUrOR84HLZ/xt/5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725351674; x=1725956474;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TIVy7rJOf8ckbxsOEwJilAqoXQq4V+pJbmIYMEMFVoM=;
        b=G8ruvS5gU/z1c+NCpa7f9pjb4EaT0HQg0q3Vvk7VqnBmRJCOoinmjIho2zsbCsSR7d
         sCjLEduR930EQuGDTF3uObI+WndrlzFCmG4EIAGPdWyzKblyX/mjyqIy3DDD11qsrRho
         vEdUtJI+xeqSfnz+/xgZSqEUvpqWgFeo7qTYeDezhLonU1oqlUNkEvSGP3B7+8VU0UoU
         G7jfj0BTB7w2MVIj4aKjXh4nSIApLfoKV9bIpXv9ERVISil+Y0L0BkVgsjGSyFI2NOq1
         47BMGX8uXgDjJaPo68Krw3b6eXuOBT04dzkEKTNyj2/Do7AwtblGnC9Bd2pp7C0Eizfd
         Wlgw==
X-Forwarded-Encrypted: i=1; AJvYcCWPuXyBKJy6yXZ67YSOQsy6KuKb2Ge338NJ4U4ggookyA5qfvt4R0mQCfv8FXBE2wm38ShKd59ODekeVYfOrofqzQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzFkgXjQtJims9G68ueABiKyXZ7bnhVlQTm25joIwGAKA+EWnTF
	Cvf28c+oJtLb5P6k9nSEVJGGVV8oZwAtjcTSDwBZBCleTL0qUW0IZwkmy3/o528=
X-Google-Smtp-Source: AGHT+IHibmqrjGolGgWruaxupD/1tbj+OTb8J+CWxqRj9zDrcEEMFA06e6y9ngdoG8VqzmbWD4XbIA==
X-Received: by 2002:a05:600c:1ca8:b0:428:1a48:d5cf with SMTP id 5b1f17b1804b1-42bb01b9925mr125173115e9.9.1725351673576;
        Tue, 03 Sep 2024 01:21:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1580:b583:9f1b:260d? ([2001:8b0:aba:5f3c:1580:b583:9f1b:260d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb37f7849sm169000135e9.7.2024.09.03.01.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 01:21:13 -0700 (PDT)
Message-ID: <b984d6be055d4aa74818b56dfb546984e94610d0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] uboot-config: fix devtool modify with
 kernel-fitimage
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adrian.freihofer@gmail.com, openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Tue, 03 Sep 2024 09:21:12 +0100
In-Reply-To: <20240902203154.265515-1-adrian.freihofer@gmail.com>
References: <20240902203154.265515-1-adrian.freihofer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204127

On Mon, 2024-09-02 at 22:31 +0200, Adrian Freihofer via lists.openembedded.=
org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>=20
> How to reproduce:
> - UBOOT_CONFIG must be used. With UBOOT_MACHINE it works fine.
> =C2=A0 A simple example based on oe-core is to modify the
> =C2=A0 beaglebone-yocto.conf file like this:
> =C2=A0 -UBOOT_MACHINE =3D "am335x_evm_defconfig"
> =C2=A0 +UBOOT_CONFIG =3D "foo"
> =C2=A0 +UBOOT_CONFIG[foo] =3D "am335x_evm_defconfig"
> - A build configuration which inherits the kernel-fitimage.bbclass is
> =C2=A0 needed. For example:
> =C2=A0 MACHINE =3D "beaglebone-yocto"
> =C2=A0 KERNEL_IMAGETYPE =3D "Image"
> =C2=A0 KERNEL_IMAGETYPES +=3D " fitImage "
> =C2=A0 KERNEL_CLASSES =3D " kernel-fitimage "
>=20
> devtool modify linux-yocto
> devtool build linux-yocto
> ...
> > cp: cannot stat '.../linux-yocto-6.6.21+git/am335x_evm_defconfig/.confi=
g':
> =C2=A0 No such file or directory
> > WARNING: .../linux-yocto/6.6.21+git/temp/run.do_configure.2081673:172 e=
xit 1
> =C2=A0 from 'cp .../linux-yocto-6.6.21+git/am335x_evm_defconfig/.config
> =C2=A0 .../build/workspace/sources/linux-yocto/.config.baseline'
>=20
> The reason for this problem is that the uboot-config.bbclass sets the
> variable KCONFIG_CONFIG_ROOTDIR to a path that makes sense for u-boot,
> but not for other recipes. However, the kernel-fitimage.bbclasse, for
> example, inherits the uboot-config.bbclass, which brings the
> u-boot-specific path into the kernel build context.
>=20
> This change removes the uboot-specific KCONFIG_CONFIG_ROOTDIR path from
> recipes other than u-boot itself.
>=20
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
> =C2=A0meta/classes-recipe/uboot-config.bbclass | 15 +++++++++------
> =C2=A01 file changed, 9 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-reci=
pe/uboot-config.bbclass
> index e55fc38b7c7..09001997d3d 100644
> --- a/meta/classes-recipe/uboot-config.bbclass
> +++ b/meta/classes-recipe/uboot-config.bbclass
> @@ -101,9 +101,9 @@ python () {
> =C2=A0=C2=A0=C2=A0=C2=A0 # The "doc" varflag is special, we don't want to=
 see it here
> =C2=A0=C2=A0=C2=A0=C2=A0 ubootconfigflags.pop('doc', None)
> =C2=A0=C2=A0=C2=A0=C2=A0 ubootconfig =3D (d.getVar('UBOOT_CONFIG') or "")=
.split()
> +=C2=A0=C2=A0=C2=A0 PN =3D d.getVar("PN")

Convention says uppercase strings are constants in python. I'd prefer
this to be something like recipename, particularly as the access isn't
immediately around the variable definition. This is mainly to try and
retain code consistency.


Cheers,

Richard

