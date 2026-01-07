Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D8FBD0D152
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 17:59:18 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12381.1767808750434535616
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 09:59:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vp/ThKUx;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-450b2715b6cso1423387b6e.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 09:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767808750; x=1768413550; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJI6x62xOdYm2EfUHG33bv8ff9Y4De2OTwWG4Qic0Fc=;
        b=Vp/ThKUxyvcitw0ThP3jJiH+NZKyiyah/nCwPgBOfWN2uN5UEiRzLiBJefaFRAhj7C
         27m4br2WnR/CJpOzE7uLLy0/aJzwhB9Rej0NvzFFL4L/Qu+Quo+2Kl3a6eXhH+ePT1pf
         1upt/D4mDYftmIIRmtXmUq9UdpBx8exX6sGbicGv+eDOmkiX42AIF40wSz1FZJs+/+9h
         G1VZ3CxVMkRj1CGZLvKmhFQOkdv0J+3NKfHXYmMOSfu1+pWJWlyyF6AijRU5Ts6IhE7y
         U2AOSTlgtwtu3Q3P1b3FVrIdOY/goCZCY6kmgrfsKf4c1e707OdiK4e9SjGzpgcwPHZ6
         Vi+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767808750; x=1768413550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XJI6x62xOdYm2EfUHG33bv8ff9Y4De2OTwWG4Qic0Fc=;
        b=FOnca1zkjBzhkAHAdhPxaTvw2v8EgJoMIOqNIMr6dSIvXqpZfMOq9APWP/9X/LOeA7
         XyERa0KQ/ly80JS+LI2AThOj6Ih5AA9TfYlHJPTtNm0tWHqHKhM8VWy4DsJfRp+araD7
         4E9dXBWwSczhVF2oOy4GkzSvvmVwdqiFNqu1DT0VEd5ACOI4aiLkCk0Iv+Stp9KLitRN
         wOv0KBgG79Inhh8VfzZBleG63JW8A1FJFka6KFlxceQ8OqD/gTE4Wwo8keRpfyXiDnSl
         F7heLv2pOhLdC1EQY0wVderHkUCoTdhKGmBCxufzffPBfOfnJ8VCfMNjfAmdlHinAn3Z
         J32A==
X-Gm-Message-State: AOJu0YwMPn1qG9kE60ECCL6P8bQrKGbyFCPnCUNnIlvzxy3/s/olCDv4
	8fwCThStN9fqhmaw9eLOJ9PPWQmfKZrludEMxf55E3ekvDS7DUIl/WiQbahl1HbcNnI/QfGwkjV
	iTvUTFmGK2s7xoCPEl/Lx77ixREIjy5k=
X-Gm-Gg: AY/fxX4eEYbrwwmUXbSonXIPAHv43QTpolf35XsbvYXDi02j5HUzI5KrciJYXHbwHg5
	AOxHszB0IuRWiacUAi/Cuq+hW0s8JMoDuVmPwrqoPbVsrfjydovM39HCNvespfPKzwipUmwgdek
	n+OKnlUkPfBDMGRK5DgGC/y4d3h0GOlwXMbBR4IqkYSEPVilOBexS+h9MX8UMwiekzRJHuvkW5D
	jeXLwQ4K8NmKyiqepuqr2ViIGqjxLj+4YojWUMxXBZviwUIHnkiJXO+aVRxayNPCTvq6+SN
X-Google-Smtp-Source: AGHT+IHY6qmGKOG09lgzUgbP7BoDwrCzm6opJMFj1x0xFEMHJw4puQ56NjcaS97UhlTS27YJ3SwcsrXeFfMBIsgLZGo=
X-Received: by 2002:a05:6808:bd1:b0:450:d120:fe4e with SMTP id
 5614622812f47-45a6bdbf7b9mr1451109b6e.27.1767808749529; Wed, 07 Jan 2026
 09:59:09 -0800 (PST)
MIME-Version: 1.0
References: <20260107093231.59163-1-thomas.perrot@bootlin.com>
In-Reply-To: <20260107093231.59163-1-thomas.perrot@bootlin.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 8 Jan 2026 06:58:57 +1300
X-Gm-Features: AQt7F2rKAw-tvvoTBtEpHO0cV3NBV5-7uCA-cSMy1nG8RkMLVFd_XBti-H_phOs
Message-ID: <CADySD0GbySpgJVdCL8WSkbzid05_pFTCPWf0bzj3-bxgn5REbA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] opensbi: bump to 1.8
To: thomas.perrot@bootlin.com
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 17:59:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229018

On Wed, Jan 7, 2026 at 10:33=E2=80=AFPM Thomas Perrot via
lists.openembedded.org
<thomas.perrot=3Dbootlin.com@lists.openembedded.org> wrote:
>
> From: Thomas Perrot <thomas.perrot@bootlin.com>
>
> This release has:
> - Safe and reverse list iteration
> - Stack protector support
> - Allocate heap housekeeping nodes dynamically
> - IPI device ratings
> - Andes QiLai SoC support
> - SpacemiT K1 SoC support
> - ESWIN Computing EIC7700 SoC support
> - Moved Ariane and Openpiton to generic platform
> - SiFive CLINT v2 support
> - Simple FDT based cache library
> - SiFive PL2 cache controller driver
> - SiFive Extensible Cache (EC) driver
> - SiFive TMC0 based HSM driver
> - SiFive SMC0 based system suspend driver
> - MPXY RPMI mailbox driver for voltage service group
> - MPXY RPMI mailbox driver for device power service group
> - MPXY RPMI mailbox driver for performance service group
> - HART protection abstraction
>
> Overall, this release has various domain related improvements and
> also adds multiple platform support.
>
> Also switch Qemu -cpu parameter to rv64 because rva23s64 and rva22s64
> profiles lack PMP entries, causing hart isolation configuration to fail [=
1].
>
> [1] https://lists.nongnu.org/archive/html/qemu-riscv/2026-01/msg00048.htm=
l
>
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
>
> ---
>     Changes in v2:
>     - Enable PMP support on Qemu with rva23
>     - Include tag=3Dv${PV} in the SRC_URI
>     - Link to v1: https://lists.openembedded.org/g/openembedded-core/mess=
age/228935
> ---
>  meta/conf/machine/include/riscv/qemuriscv.inc               | 2 +-
>  meta/recipes-bsp/opensbi/{opensbi_1.7.bb =3D> opensbi_1.8.bb} | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-bsp/opensbi/{opensbi_1.7.bb =3D> opensbi_1.8.bb} (97=
%)
>
> diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/ma=
chine/include/riscv/qemuriscv.inc
> index b755d32c9d1a..45fcf36e62d9 100644
> --- a/meta/conf/machine/include/riscv/qemuriscv.inc
> +++ b/meta/conf/machine/include/riscv/qemuriscv.inc
> @@ -27,7 +27,7 @@ UBOOT_ENTRYPOINT:riscv64 =3D "0x80200000"
>  # qemuboot options
>  QB_SMP ?=3D "-smp 4"
>  QB_KERNEL_CMDLINE_APPEND =3D "earlycon=3Dsbi"
> -QB_CPU:riscv64 ?=3D "-cpu rva23s64"
> +QB_CPU:riscv64 ?=3D "-cpu rv64"
>  QB_MACHINE =3D "-machine virt"
>  QB_DEFAULT_BIOS =3D "fw_jump.elf"
>  QB_TAP_OPT =3D "-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,downscr=
ipt=3Dno"
> diff --git a/meta/recipes-bsp/opensbi/opensbi_1.7.bb b/meta/recipes-bsp/o=
pensbi/opensbi_1.8.bb
> similarity index 97%
> rename from meta/recipes-bsp/opensbi/opensbi_1.7.bb
> rename to meta/recipes-bsp/opensbi/opensbi_1.8.bb
> index a460062e9398..f2d3e9f20082 100644
> --- a/meta/recipes-bsp/opensbi/opensbi_1.7.bb
> +++ b/meta/recipes-bsp/opensbi/opensbi_1.8.bb
> @@ -8,7 +8,7 @@ require opensbi-payloads.inc
>
>  inherit deploy
>
> -SRCREV =3D "a32a91069119e7a5aa31e6bc51d5e00860be3d80"
> +SRCREV =3D "e7fa66c2160ec139de1853a00f669c09320a9256"
>  SRC_URI =3D "git://github.com/riscv/opensbi.git;branch=3Dmaster;protocol=
=3Dhttps"

SRC_URI change is missing in v2

>  TARGET_DBGSRC_DIR =3D "/share/opensbi/*/generic/firmware/"
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228967): https://lists.openembedded.org/g/openembedde=
d-core/message/228967
> Mute This Topic: https://lists.openembedded.org/mt/117131548/3619737
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [an=
kur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

