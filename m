Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70EDCFD34D
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 11:08:59 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.9008.1728644934297165029
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 04:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XnCLV68S;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37cea34cb57so1170563f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 04:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728644933; x=1729249733; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mSOX2sfEJ3EUFUUuzkG29EV/btC4628YDWqgIXdDcvc=;
        b=XnCLV68Sbx3J2d12K76W1o9h7SgtQvqbn+gJ+W2i/LcVg/wBYW6ldltAVN2yHn6fcc
         Pqnc3zi3+xToaJGw4seyssDJ7xaiFiBLYY95qJGJ/aDKtEifgbye6n9sw1AEAhoD4QOL
         cxiXL/4wu2TgWcDzwC2AghpbFs7uzw3RoF7EQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728644933; x=1729249733;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mSOX2sfEJ3EUFUUuzkG29EV/btC4628YDWqgIXdDcvc=;
        b=sevXBg5NJDhXRPoGm+7Q5idajUPRPvdwXsxIS6F1TpdSOC0TkRUz6vQF6gL2bAkb1Y
         ULPt2luiDKa+FI+JVVwnG5G7jM0AtcNsGbGxnn2Cw2Io3lOUeW0NKVS0mIcl+uCXda6e
         0PumIzeuITqu87RQDOgpBzvi8rp1jbGIdUPo9YKBIWiy3h9lYWU5orGFPUwJZVuVwPs5
         1RhsbtRGugM659Qc3FocikJIqN2VCgghyRP5zMEaOoJRvmJXhH1uTlDoHi0h22ZP7t+w
         91rI3xR8eZtatj9umu+aFnxF10AU2L5DDSYRysTpG0+fqYigSOBjCf7DQHOECbmeWacE
         isEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiBgrjceEKiaP10HpbUWO3uuf4/ra8h43zIzScwfBkgcpLqZv3MWxLluH8ay3z3JaLdMGHPTGzNOPN/Oj5oXPKCg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx5VuqXiKEp4xhLzM80rxpD2KuT2s0SyBpASZcqEc2MqNSEX5Ep
	vAJVovXgeJHrXh8QLR9KqnVd/T7+tgy3CURB1owwa7cqb1UXZANxyysa+2pD8l0=
X-Google-Smtp-Source: AGHT+IFtxwJykTXvyfmBUVWrZZW8FYS1SN4F9CPPVmGID+ztVwpuRlToEGh80y8v/4AUADhs2g/xhw==
X-Received: by 2002:adf:e681:0:b0:37d:4aa5:eae5 with SMTP id ffacd0b85a97d-37d5531bc58mr1485050f8f.55.1728644932597;
        Fri, 11 Oct 2024 04:08:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8145:ba6d:a6de:28af? ([2001:8b0:aba:5f3c:8145:ba6d:a6de:28af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8928sm3693147f8f.7.2024.10.11.04.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 04:08:52 -0700 (PDT)
Message-ID: <e5673b2af275dd6bddde40223581c3cdbb310968.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v6 3/7] barebox: set default BAREBOX_CONFIG
 for qemu machines
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ejo@pengutronix.de, openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 11 Oct 2024 12:08:51 +0100
In-Reply-To: <20240912091857.2631678-4-ejo@pengutronix.de>
References: <20240912091857.2631678-1-ejo@pengutronix.de>
	 <20240912091857.2631678-4-ejo@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 11:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205671

On Thu, 2024-09-12 at 11:18 +0200, Enrico J=C3=B6rns via lists.openembedded=
.org wrote:
> From: Enrico Jorns <ejo@pengutronix.de>
>=20
> These are set in the barebox recipe rather in the corresponding machines
> (where they would belong otherwise) to keep the impact of barebox to
> oe-core minimal for now.
>=20
> "multi_v7_defconfig" is used for qemuarm since this is the default
> barebox armv7 config that just enables all supported platforms.
>=20
> "multi_v8_defconfig" is used for qemuarm64 sine this is the default
> barebox armv8 config that just enables all supported platforms.
>=20
> "efi_defconfig" is used for qemux86-64 which is the primary platform
> where barebox will not be the first stage bootloader but an EFI payload.
>=20
> Since these changes make barebox a provider for virtual/bootloader,
> explicitly default to u-boot in the corresponding MACHINE configs to not
> unnecessarily surprise users.
>=20
> Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
> ---
> =C2=A0meta/conf/machine/qemuarm.conf=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0meta/conf/machine/qemuarm64.conf=C2=A0 | 1 +
> =C2=A0meta/conf/machine/qemux86-64.conf | 1 +
> =C2=A03 files changed, 3 insertions(+)

This patch needs the commit message updating as it no longer matches
the changes below!

Things did pass in automated testing so I think we're close with this.

Cheers,

Richard

> diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.c=
onf
> index 943ce7c16a..af76a53b8e 100644
> --- a/meta/conf/machine/qemuarm.conf
> +++ b/meta/conf/machine/qemuarm.conf
> @@ -7,6 +7,7 @@ require conf/machine/include/qemu.inc
> =C2=A0
> =C2=A0KERNEL_IMAGETYPE =3D "zImage"
> =C2=A0
> +PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot"
> =C2=A0UBOOT_MACHINE ?=3D "qemu_arm_defconfig"
> =C2=A0
> =C2=A0SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
> diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm=
64.conf
> index a096d964db..d310445a34 100644
> --- a/meta/conf/machine/qemuarm64.conf
> +++ b/meta/conf/machine/qemuarm64.conf
> @@ -7,6 +7,7 @@ require conf/machine/include/qemu.inc
> =C2=A0
> =C2=A0KERNEL_IMAGETYPE =3D "Image"
> =C2=A0
> +PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot"
> =C2=A0UBOOT_MACHINE ?=3D "qemu_arm64_defconfig"
> =C2=A0
> =C2=A0SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
> diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux8=
6-64.conf
> index 14873a3b4f..4a9c6d364b 100644
> --- a/meta/conf/machine/qemux86-64.conf
> +++ b/meta/conf/machine/qemux86-64.conf
> @@ -13,6 +13,7 @@ DEFAULTTUNE ?=3D "core2-64"
> =C2=A0require conf/machine/include/x86/tune-x86-64-v3.inc
> =C2=A0require conf/machine/include/x86/qemuboot-x86.inc
> =C2=A0
> +PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot"
> =C2=A0UBOOT_MACHINE ?=3D "qemu-x86_64_defconfig"
> =C2=A0
> =C2=A0KERNEL_IMAGETYPE =3D "bzImage"
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204432): https://lists.openembedded.org/g/openembedde=
d-core/message/204432
> Mute This Topic: https://lists.openembedded.org/mt/108410146/1686473
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=C2=
=A0[richard.purdie@linuxfoundation.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


