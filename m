Return-Path: <toertel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD60C3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 13:29:51 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.63091.1672752584814084182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 05:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fpP9RdrA;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: toertel@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id qb7so6695106qvb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 05:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L/gQB9H6Sq2O0QtCLIbxXwbGWv9BBcWcSE5hFsdIEow=;
        b=fpP9RdrAw8OkL4z4ZQxz2OEX/K7/80WqjTDV6UHR+mjp1ZN46hTZqNJoZrDFJ6HTev
         j/TBKneWiPwPkzclvh/fNeotkEc3vb9OzX4xm/nRPS7Am/z6y9Fh1Aw6ZhOjpuv5BHC2
         GLBC52Vz0BDcC8UYLmkJ5nUE12SzggTwnteninPrdVRqJ1XYGPH39f4x5kdU7VYkTD0L
         hwDyzlvKPvef6mMdm4qp2DnMlii1iyznU6U6Arz6uZvfpAcQ4DbDYCWzp3MdsCROenTv
         eint0rXKzw654gt2K7AKuS/ejThCEpuHT5ehqDNpRPjLIlcY48SKFNTV2Z6On6O5ooDH
         HWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/gQB9H6Sq2O0QtCLIbxXwbGWv9BBcWcSE5hFsdIEow=;
        b=Dptkwmr2piWzKjMnv3N8OonV9LcJVkPR7xMMsiPYAdkGFJUCFhbNfaugX/LGT6Cogn
         DfrPiQZXYZLkjQPCkilPNkA1zo43QjCh1htpiVvDe2utG3hfG9dBA20hYyfYCvUF98wn
         gmG37b0HBKZLqU+eKJGqjRZhtSExMjHYK/+JLYJNF2f3D5sBSMatUhGIClp/Azp0anqb
         qC45xt9rMC+w9QthKTFhhzz43Scxhli9ossZoo0TLGNG4siwU22AxPpsCPUtXuA5GorL
         CsVMLlpLAeFFOMolAo0Dmu6WQ7gXTlWhq0mH+7g5IKcPZ8Jhi/w4IB0pbwFKcguXgT/l
         bjBQ==
X-Gm-Message-State: AFqh2krBVXhv8Xy3rNn53wRgOhMS+tb5/QZwA3Iu4llKyXw6ZCHJS8nn
	9wo4aqsrB1aj/rzoDv/0YZ0e1ziTPeWnhwiOtz9ia844NF0=
X-Google-Smtp-Source: AMrXdXsGFVg8of+PSqwoVe0X0eZAaDHLAFZREtfR/9adaenn1NmZAchRL60wlRHA2XGdoM60aVQkDEzRXhw6+iRZQUU=
X-Received: by 2002:a05:6214:4305:b0:526:307b:25be with SMTP id
 oe5-20020a056214430500b00526307b25bemr2548955qvb.73.1672752583675; Tue, 03
 Jan 2023 05:29:43 -0800 (PST)
MIME-Version: 1.0
References: <1736893AC5253C05.4716@lists.openembedded.org>
In-Reply-To: <1736893AC5253C05.4716@lists.openembedded.org>
From: Mark Jonas <toertel@gmail.com>
Date: Tue, 3 Jan 2023 14:29:32 +0100
Message-ID: <CAEE5dN1TENw=V_29LjifF6a3ns5cvXzPtqsKywveOSJc7dZe3Q@mail.gmail.com>
Subject: Re: [OE-core] Struggling to get QEMU sound working on core-image-base
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 13:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175345

Hi,

> I have difficulties getting core-image-base and QEMU x86-64 sound
> output working. I do not even get to the point of having a visible
> ALSA sound device.
>
> What part of the puzzle am I missing?
>
> Alternatively, can someone point me to a (simple) YP image where sound
> works with QEMU x86 or x86-64?
>
> I built a core-image-base image from latest YP Poky [dunfell,langdale]
> with the following additions in a default local.conf:
>
> MACHINE = "qemux86-64"
>
> # Load kernel modules matching QEMU audio support
> KERNEL_MODULE_AUTOLOAD += "snd-ens1370"
>
> # Check ALSA cards available
> IMAGE_INSTALL:append = " alsa-utils"
>
> EXTRA_IMAGE_FEATURES += "debug-tweaks"

I was able to solve part of the riddle. Now I am wondering whether I
hit a bug in the meta/conf/machine/qemux86*.conf files.

The conf/machine/qemux86*.conf recommends the installation of the
snd-ens1370 module.
(since https://git.openembedded.org/openembedded-core/commit/?id=112775995158cf6c504fd6beef345ee446f4f11d)

MACHINE_EXTRA_RRECOMMENDS = "kernel-module-snd-ens1370
kernel-module-snd-rawmidi"

Thus, I assumed that (as suggested by
https://docs.yoctoproject.org/dev-manual/qemu.html) QEMU would create
an ENS1370 device.

- ``audio``: Enables audio in QEMU. The MACHINE option must be either
"qemux86" or "qemux86-64" in order for audio to be enabled.
Additionally, the ``snd_intel8x0`` or ``snd_ens1370`` driver must be
installed in linux guest.

Actually, the sound device in the virtual machine is an Intel 8x0 type.

root@qemux86-64:~# lspci
[..]
00:04.0 Multimedia audio controller: Intel Corporation 82801AA AC'97
Audio Controller (rev 01)
[..]

After installing the snd-intel8x0 module into the image and adding it
to the auto-loaded modules, I can finally see an ALSA card.

IMAGE_INSTALL:append = " kernel-module-snd-intel8x0"
KERNEL_MODULE_AUTOLOAD += "snd-ens1370 snd-intel8x0"

(see https://gitlab.com/toertel/meta-qemusound)

root@qemux86-64:~# cat /proc/asound/cards
 0 [I82801AAICH    ]: ICH - Intel 82801AA-ICH
                      Intel 82801AA-ICH with STAC9700,83,84 at irq 20

Then, isn't it a bug in the meta/conf/machine/qemux86*.conf files that
(only?) the kernel-module-snd-ens1370 is recommended? Shouldn't the
kernel-module-snd-intel8x0 be recommended (additionally?)?

Staying in line with the Poky QEMU documentation I offer to send a
patch which adds kernel-module-snd-intel8x0 to
MACHINE_EXTRA_RRECOMMENDS of the meta/conf/machine/qemux86*.conf files.

Shouldn't then also linux-yocto.inc be amended such that the
KERNEL_MODULE_AUTOLOAD is set in case it is a qemux86* kernel and the
DISTRO_FEATURES contain alsa?

ALSA_MODULES = "${@bb.utils.contains("DISTRO_FEATURES", "alsa", "
snd-ens1370 snd-intel8x0", "", d)}"
KERNEL_MODULE_AUTOLOAD:qemux86 += "${ALSA_MODULES}"
KERNEL_MODULE_AUTOLOAD:qemux86-64 += "${ALSA_MODULES}"

Cheers,
Mark

