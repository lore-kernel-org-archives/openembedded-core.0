Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58651C4707B
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 10:43:20 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.8847.1704969792059738945
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 02:43:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T7KHANWt;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50e80d14404so5388307e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 02:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704969790; x=1705574590; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6nvg3sTKCEAuN1fy5w4hzeqesHD6RxNdd4i/oIw7FU=;
        b=T7KHANWtmgZdIb+iELscom5QqFE8xruqyS5y8bOczAqLZax6yxaSU42/EMz1G+3JJo
         Qh2BWVGlchEkWRpx5aZG0jrvQDzP1fBAXb1NuJRiQasr35EYKxAvm7+bcnrJM+XewpgI
         nzcLO2D9Pa2EeTbWyDLYDyFZur1xvxyQKmYmu0hEg+XR6jIpf0mmp6mkWS/bMztrtQc0
         sdeOa4mBEfPZlm2erwe5GRP5/DVrI2pEGBNcuvxzUcrmmAgwReh/3jhzMDkZaVoMUFqR
         ke7HSC0hAiQkI9x0247Ie+ep0aFwNtyftoSnOzz354/cuL4yNw8Q3VItl7+i7bJm5LMU
         hcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704969790; x=1705574590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6nvg3sTKCEAuN1fy5w4hzeqesHD6RxNdd4i/oIw7FU=;
        b=njMWM//7ftcUmZtLiOESDW8Q0aXnSP+AuM/ksWk6P2eIvivL2oqYHC6QyFu9v7HwuN
         Wr4cbbSgk+mINiKoAAyi1dSGfeUMCs3ArreXxtmzMhB2N80uuSaIXvEWvw+3T1QPQpUt
         8qkvdHWFFMoNTc7h4HnEScerLCwuxgmQDCQS/FtkBFwTAGaEn5S2sfbIdC/AjGB8OD8v
         O/7Get2A3t5diEFBLQIwdG95uLSxdpaYgjP+fgU8pSXC1M3t/nZmviSyBdjYCm30uehC
         GR4fL5bpEkOofwNMGw3n7VkoKzPFptWNE0rT+2VgVhVFTcU4HpaRAMPGpGI3sLoqttnH
         S/BQ==
X-Gm-Message-State: AOJu0YxhyAw+7uA043g3GI4qO5ylMAhxjZpEMPHJSV0fEPOxGz6UmuFv
	pyoJHUHZRTIi5KLZhTVUfX8xZyX6DF9vY2UtNF0=
X-Google-Smtp-Source: AGHT+IGH0sinAhuF2hclqrqbmcWo5T882NFYtAC1xxSnKiW9lvHTBSttOIv/SuaTrv9M3J7cm8yp1j5bjjXbVc0Tu8A=
X-Received: by 2002:a05:6512:31cb:b0:50b:f9b2:cfc with SMTP id
 j11-20020a05651231cb00b0050bf9b20cfcmr448475lfe.30.1704969790018; Thu, 11 Jan
 2024 02:43:10 -0800 (PST)
MIME-Version: 1.0
References: <06A8365A-FC0D-43FC-A3A3-D3BC54B1E72B@geanix.com>
In-Reply-To: <06A8365A-FC0D-43FC-A3A3-D3BC54B1E72B@geanix.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Jan 2024 11:42:58 +0100
Message-ID: <CANNYZj8DSe-qb+U2CniuBEM3hahJz3+7W3MBVro3fs=O0mNFoQ@mail.gmail.com>
Subject: Re: [OE-core] runqemu: ahci option
To: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, martin.jansa@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 10:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193538

Generally runqemu is inteded for  (and tested with) specifically
qemux86_64 MACHINE (or any other qemu* machine). So if testing your
particular target bootloader with qemu isn't actually important, you
can rebuild the image for qemux86_64, and in that configuration there
is no bootloader: qemu boots the kernel directly.

Alex

On Thu, 11 Jan 2024 at 08:59, Sean Nyekjaer <sean@geanix.com> wrote:
>
> Hi,
>
> We have an x86_64 machine that we create an wic image for.
> For bootloader we are using UEFI boot with u-boot as a EFI payload.
>
> U-boot doesn=E2=80=99t have support for virtio-scsi-pci, so it=E2=80=99s =
can=E2=80=99t detect a disk.
> U-boot however does some tests with the ahci driver:
> https://source.denx.de/u-boot/u-boot/-/blob/master/scripts/build-efi.sh#L=
116
> It also works for our case.
>
> But since the runqemu script checks for drivetype by =E2=80=9C/dev/sd=E2=
=80=9D I can=E2=80=99t easily add something like what u-boot uses.
>
> Any idea=E2=80=99s?
>
> For now I use in machine conf:
> QB_DEFAULT_FSTYPE =3D "wic"
> QB_ROOTFS =3D "none"
> QB_OPT_APPEND =3D "-drive id=3Ddisk,file=3D@DEPLOY_DIR_IMAGE@/image-qemux=
86-64.rootfs.wic,if=3Dnone,format=3Draw -device ahci,id=3Dahci -device ide-=
hd,drive=3Ddisk,bus=3Dahci.0=E2=80=9D
>
> But it would be nice to have the ROOTFS env var expanded instead of decla=
ring it explicitly here.
>
> Best regards
> Sean Nyekj=C3=A6r

