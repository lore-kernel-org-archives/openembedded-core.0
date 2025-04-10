Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B52C369A6
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 12:45:20 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.33597.1744289116742309743
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 05:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N8gi6FpV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso5151105e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 05:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744289115; x=1744893915; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dshNw+bpCuEmrFG7wCSsezmHlc1pIbZ6Gk7ayJ3Q60=;
        b=N8gi6FpVKdBBfqbqAebvLeXgbXzAvdYUIVaF55XKaY1FW+14z8fM0WPMd8yfzGWOoT
         YROuYSYDitVyxZRi4a5GYdadYQjmuvJYq/YVlKQK4sR2CXMa20k2leafuQvjXjgFG5VH
         SauQIYYjcQ+oAFrZcmR+9G5Z9pjEhQRN6fO7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744289115; x=1744893915;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1dshNw+bpCuEmrFG7wCSsezmHlc1pIbZ6Gk7ayJ3Q60=;
        b=wXxwffCiyFsAgq6054EaIb60yx0EoGlTvD/BodNl/cKB3vkBTj5Rb1PqgOSnQkMe8w
         XGQGgxaeBRXjTcD1xpHsBsx5C2e9cQbdbjx17vK81RhbTJjyrPypBmuzVCLPpuvPnCAe
         9Rzm9hta6zAZekmFF0tgim9p+VtLLyGkbWyBO6FTao7ql8MlrED4Y9CzU66y+buc1FZN
         9AFjaEv2BUdMqNeAq1c0ZB5iIOnT97plkyB/P/XUs87WExmEcqjgIc82KnrOPpEPPKwr
         YfqHIF2ap1j3YNxW8/RMVLtr5Nk9OM7TP1p4e4yv3Vs0KDSWWvRRomuO64SAKXtl2hII
         LHiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfKjQl4cHZZJsVaNIAIDWZTkEx+X8iVObBqYPD4M/kR7tAwn0a7RInk58xM8Fz51hwW/HwZDieH+LaBloAuwq+dQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxmkG6hgHI1NiiaNj2xKwtQSVvsZL6KRYSBkiN+u/0huVPRiMgF
	sT3bQdYlqy+0EuZzMbcjM6ydAPotJ6Q2eEO9Bc2OHiWQPvSkYpHxfKnmbxqSst7h1pJ9oaIr4X+
	9
X-Gm-Gg: ASbGncvjk5uTyKSquyD56NKfdjoYye8f6IuzPo34s0LVQ7N9gr4QviYTLQjwciOZi0L
	yAcNxbqyvSpoUPCedSLv3JRLj2sh+7eWIjoDTo7APyQ017JtBYXZ2I3TLpGdZFqn+pTgbhyuqUo
	5TD+aoBwxJqYWObz6a2j0e38lnm7+SeyoREHPNqNHLKHvQ9ios9gdPJfRYr1OeLlaRly82Uqo2q
	pspRJf6rk55NrQNuSYW+QAzpt0PHi+lwgweNxcncnqErcBJw4FcXun5wMJP47u99LtEsTjoxE0e
	HSkQeiyWEZZ7NjNsHa17NUfApcCBlfniW9JsspWnEQQRN4ogiszASr5FfZhToII5tsGKc6XBksW
	fRlSctM0oRad73DcxdaJm8ZK4UbXnhg==
X-Google-Smtp-Source: AGHT+IGYpD39YK9QC0Tz8/WJwLtlGjYM0di1piscmX6RMeRsBi9J5xzsV1/PULZhziNbcFzO3tR7lw==
X-Received: by 2002:a05:600c:4d98:b0:43d:5264:3cf0 with SMTP id 5b1f17b1804b1-43f3022375emr15389265e9.11.1744289114829;
        Thu, 10 Apr 2025 05:45:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ddb2:da8c:e063:58d6? ([2001:8b0:aba:5f3c:ddb2:da8c:e063:58d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893f0a75sm4783796f8f.62.2025.04.10.05.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 05:45:14 -0700 (PDT)
Message-ID: <382aea203534ca83fc8a493c8c0f8af924737d4c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 04/11] core-image-initramfs-boot: add
 option to build systemd based initrd
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Thu, 10 Apr 2025 13:45:13 +0100
In-Reply-To: <20250404162932.447699-5-mikko.rapeli@linaro.org>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
	 <20250404162932.447699-5-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 12:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214661

On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via lists.openembedded.org =
wrote:
> If "systemd-initramfs" is in DISTRO_FEATURES then convert
> core-image-initramfs-boot from shell scripts to systemd.
> The resulting initramfs is much bigger than shell script one but
> supports much more features like disk encryption and TPM devices.
> Also includes udev which can load any drivers needed to mount
> rootfs.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0.../images/core-image-initramfs-boot.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 20 ++++++++++++++++---
> =C2=A01 file changed, 17 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-core/images/core-image-initramfs-boot.bb b/meta=
/recipes-core/images/core-image-initramfs-boot.bb
> index 7258944751..c66c28db76 100644
> --- a/meta/recipes-core/images/core-image-initramfs-boot.bb
> +++ b/meta/recipes-core/images/core-image-initramfs-boot.bb
> @@ -4,7 +4,23 @@ LICENSE =3D "MIT"
> =C2=A0
> =C2=A0INITRAMFS_SCRIPTS ?=3D "initramfs-framework-base initramfs-module-u=
dev"
> =C2=A0
> -PACKAGE_INSTALL =3D "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} =
base-passwd"
> +inherit image
> +
> +PACKAGE_INSTALL =3D " \
> +=C2=A0=C2=A0=C2=A0 ${VIRTUAL-RUNTIME_base-utils} \
> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'systemd-init=
ramfs', ' \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 base-files \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 coreutils \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e2fsprogs-mke2fs \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os-release-initrd \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 util-linux-blkid \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 util-linux-mount \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 util-linux-umount \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${VIRTUAL-RUNTIME_init_manage=
r} \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${VIRTUAL-RUNTIME_dev_manager=
} \
> +=C2=A0=C2=A0=C2=A0 ', '${INITRAMFS_SCRIPTS}', d)} \
> +=C2=A0=C2=A0=C2=A0 base-passwd \
> +"
> =C2=A0
> =C2=A0# Ensure the initramfs only contains the bare minimum
> =C2=A0IMAGE_FEATURES =3D ""
> @@ -18,5 +34,3 @@ IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
> =C2=A0IMAGE_NAME_SUFFIX ?=3D ""
> =C2=A0IMAGE_ROOTFS_SIZE =3D "8192"
> =C2=A0IMAGE_ROOTFS_EXTRA_SPACE =3D "0"
> -
> -inherit image

Given this effectively completely changes the image, would we be better
just defining a different image recipe for the systemd based initramfs?

Cheers,

Richard


