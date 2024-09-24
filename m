Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEC0CF9C5B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 00:11:09 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web10.2377.1727136662171331532
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 17:11:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FWuAscM9;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5e20de1d302so2404099eaf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 17:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727136661; x=1727741461; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ambmpEpTp8uPk54QEU5ijFbq4d7mQ8X0S/vVa2Smts=;
        b=FWuAscM9UWqHs4UbbM/zgvT+xll2bhkzkP299alvFG+GMXrphjDXK60tiiPlZCohm6
         efNyAs6k3aZt/CwhVF2mEps2JpZsMUgzbsxCETOnmfMqRqu1543sT/v3kPco5AQQjWOv
         P33rDJo+RjjkjcNzh7X+O2uVKB0zNs4aGBBKdiAes4jtP9ZgvbB74IFK0vhN+b8lJoKO
         qnzOF/2YL8awqLnnop3cB/QJE9vJaf+wVhvO/GJZe0ZcQDg0vDy1AQQHTSqHyMS3Brxj
         PLmiZhqGtTbawm2kl/ZjIMJQPhPLyIwIDRvnW/8rXIp6dVY8422jBlG/pfzS3aWGvR/j
         zKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727136661; x=1727741461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ambmpEpTp8uPk54QEU5ijFbq4d7mQ8X0S/vVa2Smts=;
        b=lmGpmvjrA1MJkizR+jSpGJHW9dJJIRhwf1qyBpCbXZwRLoDNOFHo2w7zWWMLUKjHoJ
         smUnXR41ajiXcgtGO5rl046g04RzJ27fB/EaAaw8Uj8TSQA7OXSCrKOevGMY0xC8aQvc
         hhPs872AetIKu4Dl+lT9w47z0OgMVhQYvWOjSb6FjWm9DnxSIlDaQBZWL5otQVoB1fe7
         N6UDaItZdu+XQRqF7T1WqPsYm28FBu5bN6G0UXH25Qd+inRKES4z75fNTCC8aoRXx0v1
         NTH2cvxV0V/YNQrIUnVQPtY/QSSH6d4r/jBElWRUhFsMXIdRr6qfuXuA88Ic1t62ldIQ
         RmzQ==
X-Gm-Message-State: AOJu0YzTWawySHr59XKfCDjPAodZa0GO+MLQwvHAY5eDibN/S0aud68+
	BWGBp3PuTcDeB+ozLsyKCpd9FbDqCMLvn5koyXAKcAB4WSyoBzpXxfxFYh4jqcM9WULTVySVbSz
	Ix1s2N21PeuzGGZaDjrU3/I0RY24=
X-Google-Smtp-Source: AGHT+IHmMwQIuhKMqxUF+wCjD+Xg0Xrst578EcfG2LDdu11Ly9QsZPrIchRR8RKZa0l8du2JQc+1vqm7ovQH0YKxFpQ=
X-Received: by 2002:a05:6820:22aa:b0:5e1:dfc9:3ee6 with SMTP id
 006d021491bc7-5e58ba5f6eemr7254921eaf.4.1727136661341; Mon, 23 Sep 2024
 17:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240922084128.9648-1-mikko.rapeli@linaro.org> <20240922084128.9648-6-mikko.rapeli@linaro.org>
In-Reply-To: <20240922084128.9648-6-mikko.rapeli@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Sep 2024 17:10:35 -0700
Message-ID: <CAMKF1so1E3aknix5Vt-00DPQfyLHVQ5dUjnK4LO2tsqRxp19+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 05/12] image_types_wic.bbclass: set
 systemd-boot and os-release dependency for all archs
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 00:11:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204828

On Sun, Sep 22, 2024 at 1:42=E2=80=AFAM Mikko Rapeli via
lists.openembedded.org
<mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
>
> These work on all archs not just x86.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/classes-recipe/image_types_wic.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-r=
ecipe/image_types_wic.bbclass
> index 86f40633eb..e02eb0b367 100644
> --- a/meta/classes-recipe/image_types_wic.bbclass
> +++ b/meta/classes-recipe/image_types_wic.bbclass
> @@ -110,7 +110,7 @@ WKS_FILE_DEPENDS_DEFAULT =3D '${@bb.utils.contains_an=
y("BUILD_ARCH", [ 'x86_64', '
>  WKS_FILE_DEPENDS_DEFAULT +=3D "bmaptool-native cdrtools-native btrfs-too=
ls-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
>  # Unified kernel images need objcopy
>  WKS_FILE_DEPENDS_DEFAULT +=3D "virtual/${TARGET_PREFIX}binutils"
> -WKS_FILE_DEPENDS_BOOTLOADERS =3D ""
> +WKS_FILE_DEPENDS_BOOTLOADERS ?=3D "systemd-boot os-release"

systemd-boot is only built for arm/arm64/x86/x86_64 if I look into the
systemd-boot recipe, so this will break wic image
generation for other architectures.

>  WKS_FILE_DEPENDS_BOOTLOADERS:x86 =3D "syslinux grub-efi systemd-boot os-=
release"
>  WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 =3D "syslinux grub-efi systemd-boot =
os-release"
>  WKS_FILE_DEPENDS_BOOTLOADERS:x86-x32 =3D "syslinux grub-efi"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204777): https://lists.openembedded.org/g/openembedde=
d-core/message/204777
> Mute This Topic: https://lists.openembedded.org/mt/108587931/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

