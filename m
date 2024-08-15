Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA50FC3DA7F
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 13:53:59 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.123671.1723730032344267069
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 06:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hXRxYBCF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42817f1eb1fso6393375e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 06:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723730030; x=1724334830; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckCcz4DrtcV/iYcGRayOsLdt8NZ4AbOVLJP45nfDbYk=;
        b=hXRxYBCFUiKm9QzS8s+8IQCy0wUJ4QUrVWhWt28hnYa3KpzKjLiqWvAGuWDgqDBQQR
         JAjU3uF8C7szNCUUH5tulaHT4IVLhIppz5Yihh024OE76p9F51an3ApmazjGSlZYYgp8
         o9O+3YI/mIVHHUHI8pQ8ei3ApZH9pDTU20e/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723730030; x=1724334830;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ckCcz4DrtcV/iYcGRayOsLdt8NZ4AbOVLJP45nfDbYk=;
        b=IIiZfyiJVEwDmAo/cQIVue+fRzprV7s+7U+60ZMtaBge+dqe36uUdaxIR/OwIMUF63
         cJE+rgFgCN27cJaLu34fVw2xUJK6l3bdCZxfKo0laxn4D+/huFh3uBWtTo7hTHMPIxtE
         9/qqvpZeFzZe8lrgcz+xa2FQJsjzc46EUyLkBT369z0AlHe0eot6BRfVLB1pkRMHPHYq
         3S1qL/GMf5t5CtcFQ1FBnyfo4HP0SjHzWTupaqll2KifBCYevhxCHEgaUvVAX9Mfz7ie
         c16d/Z+D29swi2bz/xBvVOgcvYwPTsr3pOkRxuz8ZdpTwr3IEL1IcoLP5NV1I/6QnBWA
         EWGg==
X-Forwarded-Encrypted: i=1; AJvYcCWH79rdPOn7tWmUzUbwQqpV2v6cRhhVFbS2lUG01mtMmVhVUWPo+NEE1WzzEM+rv0lDu+t2fBjrZdGrKP1d+rzkwANWzM7CYwDCMFk+W98jfBEJFwb7xf3r
X-Gm-Message-State: AOJu0YwH1oS09WdZqZdu3mV9RaPUmk0ZWE6HUCXsqrwZorp6fFQ305u+
	JWa/0Vdvmkk/TDebKzrv5IRrQxc8/PnTY5EGWJHmsVD6eIWGKC+xaBxPKGVpXaU=
X-Google-Smtp-Source: AGHT+IErSMkFWjldKlZex3SPid0UDR8UEpdK5wnkJSxt75lg98bStai2nYQG82IU+lTQigTOjV4NIQ==
X-Received: by 2002:a5d:5e12:0:b0:371:7dca:4daf with SMTP id ffacd0b85a97d-3717dca507fmr2423698f8f.39.1723730030252;
        Thu, 15 Aug 2024 06:53:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2bbd:6430:deb7:a333? ([2001:8b0:aba:5f3c:2bbd:6430:deb7:a333])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189839f51sm1611030f8f.8.2024.08.15.06.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 06:53:49 -0700 (PDT)
Message-ID: <25a6f53578b0c0000ef89a7bce383b71f1847e80.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] default-distrovars: Have KERNEL_CONSOLE
 reference SERIAL_CONSOLES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jdmason@kudzu.us, openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2024 14:53:49 +0100
In-Reply-To: <20240814195919.1079481-2-jdmason@kudzu.us>
References: <20240814195919.1079481-1-jdmason@kudzu.us>
	 <20240814195919.1079481-2-jdmason@kudzu.us>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 13:53:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203339

On Wed, 2024-08-14 at 15:59 -0400, Jon Mason via lists.openembedded.org wro=
te:
> Currently, KERNEL_CONSOLE has a default value of "ttyS0".=C2=A0 However, =
Arm
> machines and those using virtio serial prefer to use "ttyAMA0" or "hvc0"
> (or something else).=C2=A0 These are usually defined by the machine confi=
g
> file as SERIAL_CONSOLES, which has one or more entries.=C2=A0 Take the fi=
rst
> one of those instead of ttyS0, but default back to ttyS0 if nothing is
> set.
>=20
> Also, use this variable in the efi wic file instead of "ttyS0".
>=20
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
> =C2=A0meta/conf/distro/include/default-distrovars.inc | 3 ++-
> =C2=A0scripts/lib/wic/canned-wks/mkefidisk.wks=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 2 +-
> =C2=A02 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/=
distro/include/default-distrovars.inc
> index 7554081e8b1a..26fa26f80c31 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -1,7 +1,8 @@
> =C2=A0QA_LOGFILE =3D "${TMPDIR}/qa.log"
> =C2=A0
> =C2=A0OEINCLUDELOGS ?=3D "yes"
> -KERNEL_CONSOLE ?=3D "ttyS0"
> +# if SERIAL_CONSOLES is set, take the first device entry.=C2=A0 Otherwis=
e use ttyS0 as the default
> +KERNEL_CONSOLE ?=3D "${@d.getVar('SERIAL_CONSOLES').split(' ')[0].split(=
';')[1] or 'ttyS0'}"
> =C2=A0KEEPUIMAGE ??=3D "yes"
> =C2=A0
> =C2=A0DEFAULT_IMAGE_LINGUAS =3D "en-us en-gb"
> diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks b/scripts/lib/wic/c=
anned-wks/mkefidisk.wks
> index 9f534fe18471..1ab870805ed1 100644
> --- a/scripts/lib/wic/canned-wks/mkefidisk.wks
> +++ b/scripts/lib/wic/canned-wks/mkefidisk.wks
> @@ -8,4 +8,4 @@ part / --source rootfs --ondisk sda --fstype=3Dext4 --lab=
el platform --align 1024
> =C2=A0
> =C2=A0part swap --ondisk sda --size 44 --label swap1 --fstype=3Dswap
> =C2=A0
> -bootloader --ptable gpt --timeout=3D5 --append=3D"rootfstype=3Dext4 cons=
ole=3DttyS0,115200 console=3Dtty0"
> +bootloader --ptable gpt --timeout=3D5 --append=3D"rootfstype=3Dext4 cons=
ole=3D${KERNEL_CONSOLE}"

This doesn't look the same and at least needs some explanation.=20

a) Where did console=3Dtty0 go?

b) KERNEL_CONSOLE doesn't have the speed in it (115200). Is that needed?

These changes might be intended but if so, the commit message should mentio=
n this.

Cheers,

Richard


