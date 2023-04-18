Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A849C77B75
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 16:19:54 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.14177.1681834786728662757
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 09:19:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hk0LqBkd;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-760f29073b4so52138839f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 09:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681834786; x=1684426786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1pHWsfyA4RB9WXDKBUyym7lIKX0jiS12mQudvRik/uk=;
        b=hk0LqBkd/8UC5/r9ot2OmRV56HbG9FNb87XfMyHLDA3JZCAkTN+denB/M+zmQfgNfR
         KZ/BHmtXgPmEG39pYalaBF/KxtYHhzzYxeNu+xAApOlx1Oc+EpL38hBZit2lqmwPDO2I
         ySPv9gyCAA0r6dtNmE0KFdLdOPlZ5DWpuP2IBWMfvV/qThLYFyDOIiS+bxp9GnAQG7QG
         TQWHB1I6UzQmiM73+jEL+H0vtUuGBsu6xS7rurmiJAb6botXvKRmxkd1aXI4Fyc7dHsW
         N17BzKha6sqfvrpS77PHMn1vAj2HINN70hS6yNHF9OwIea+wpviDOjT3ANYI72R7ZxqP
         PApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681834786; x=1684426786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pHWsfyA4RB9WXDKBUyym7lIKX0jiS12mQudvRik/uk=;
        b=TYG30aEr1ysKn66nQ3S35xmEiucM4GLtdLoZF/MraPtGks7uklL3GXTK3lqpetL7kG
         CF6AS5EORGjOuc+Mn3sLEOCrfB1HNVxN+rV3/KTBwLjwNO83nJHxsVdT2DFa/UP9ncJW
         uMfkYo/5WeHqGsUaUmdAw5avTR4EABmfa9ljynZq2LY0aEJiACpkzGQRWZ3kKge3Wt3B
         NS7Zi2r5Bd2PFpdZzQVSoQNzRPMiTshGNhTxrGpO82RlLselPISzu8jj5Yw9IKxtsyHO
         JGDWmmUmiDwdbzoupvlJTXT7eXTuMWv/PB6O3Xf/47lMpOBWiiUAVDfWsIMZsc/G9ado
         STuw==
X-Gm-Message-State: AAQBX9fd2QsZ8Kbnp/5HmBbWZGpq9o5WtTzs9OWTbN/QiwtKAAc6oP7Q
	U/Jl++F7vevjb4rMz9F27E8IQehSytZ4mOr5C7ENN7HH2zs=
X-Google-Smtp-Source: AKy350Yb38R80WvMmz7XCT8oErPCi8o1NzvKQALV9EDgYlMb/u7yKjtU2qbqW+IrK91z5oSnZclS/02bhD6RNPs8WEk=
X-Received: by 2002:a5d:8a1a:0:b0:763:5821:cd60 with SMTP id
 w26-20020a5d8a1a000000b007635821cd60mr2378353iod.6.1681834785715; Tue, 18 Apr
 2023 09:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230418155911.4034663-1-ross.burton@arm.com>
In-Reply-To: <20230418155911.4034663-1-ross.burton@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 18 Apr 2023 12:19:37 -0400
Message-ID: <CADkTA4P=hbQbYsuQ8U9Gb5uGHCLSvhWi0+XqCj-NA8BzFE1f+g@mail.gmail.com>
Subject: Re: [PATCH] machine/qemuarm*: don't explicitly set vmalloc
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 16:19:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180197

On Tue, Apr 18, 2023 at 11:59=E2=80=AFAM Ross Burton <ross.burton@arm.com> =
wrote:
>
> In 5c6064 the qemuarm* machines gained vmalloc=3D256, because in testing
> Bruce was seeing vmap allocation failures.
>
> However, this parameter is in bytes, so the kernel was setting a minimal
> vmalloc area of 16MiB:
>
> [    0.000000] vmalloc area is too small, limiting to 16MiB
>
> The default value is 240MiB[1] which is close to the value that Bruce
> was presumably aiming for, so I don't believe we should be setting this
> value explicitly.

I was shooting for the minimum at the time, since in coordination with
the mem=3D and -m options to qemu, we were getting too large a vmalloc
size.

Setting that value (incorrectly) silenced the warnings .. I can't
recall if we added that "to small" warning to an allow list ?
Otherwise, the AB should have been having issues with that as well.

Either way, the kernel versions have changed enough, as have our boot
parameters. It is worth just letting it be the default again, and
seeing if anything breaks.

Bruce

>
> [1] early_vmalloc(), https://elixir.bootlin.com/linux/latest/source/arch/=
arm/mm/mmu.c#L1170
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/conf/machine/qemuarm.conf   | 2 --
>  meta/conf/machine/qemuarmv5.conf | 1 -
>  2 files changed, 3 deletions(-)
>
> diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.c=
onf
> index c5234231e2e..aa9ce882035 100644
> --- a/meta/conf/machine/qemuarm.conf
> +++ b/meta/conf/machine/qemuarm.conf
> @@ -17,8 +17,6 @@ QB_SYSTEM_NAME =3D "qemu-system-arm"
>  QB_MACHINE =3D "-machine virt,highmem=3Doff"
>  QB_CPU =3D "-cpu cortex-a15"
>  QB_SMP ?=3D "-smp 4"
> -# Standard Serial console
> -QB_KERNEL_CMDLINE_APPEND =3D "vmalloc=3D256"
>  # For graphics to work we need to define the VGA device as well as the n=
ecessary USB devices
>  QB_GRAPHICS =3D "-device virtio-gpu-pci"
>  QB_OPT_APPEND =3D "-device qemu-xhci -device usb-tablet -device usb-kbd"
> diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarm=
v5.conf
> index 6e59e42c3ab..ef1b4ece230 100644
> --- a/meta/conf/machine/qemuarmv5.conf
> +++ b/meta/conf/machine/qemuarmv5.conf
> @@ -12,7 +12,6 @@ SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;ttyAMA1"
>  # For runqemu
>  QB_SYSTEM_NAME =3D "qemu-system-arm"
>  QB_MACHINE =3D "-machine versatilepb"
> -QB_KERNEL_CMDLINE_APPEND =3D "vmalloc=3D256"
>  QB_GRAPHICS =3D "-device virtio-gpu-pci"
>  QB_OPT_APPEND =3D "-device qemu-xhci -device usb-tablet -device usb-kbd"
>  QB_DTB =3D "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-y=
octo', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
> --
> 2.34.1
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

