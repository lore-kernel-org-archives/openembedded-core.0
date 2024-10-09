Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 084D8CEE345
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 19:54:44 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.26597.1728503677397664574
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 12:54:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=PddHVeLX;
 spf=pass (domain: foundries.io, ip: 209.85.208.178, mailfrom: ricardo@foundries.io)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2facf48166bso1647401fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 12:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1728503675; x=1729108475; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtdBH3f8q2fiYvUQy87ndin0AvrweNp2Z8iP3Fg1Ork=;
        b=PddHVeLX1G6IZqDi6zgYtK+P022F5O/og3IzP//panCmMgKMSgRKKm6aTWHeLxMttj
         yFzOTXWZS8tRmobJLlg+x27GbUMJzaxgc06n7qERp3qTv2zji4Wa0KK2dwCcx11rCWvl
         spjAbjdV+ctRFIrISVM3CVhpU7+Nb6JBsgtQcVdoAGseUdMP57N/4kEILeCX5aVNSr4o
         ctApPBuyKcXSg1n5ipduP8mNjK73t1a6FroOEUw4tOo8bfeh9fWKec4ZbI3HdZp3sJy8
         nBrFCjRJpSmFGljRLxOHqpW2ycQzjuIe97Xi6joT4TdymWBr3Q1BqXNUrFgmdIHeaQeQ
         UIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728503675; x=1729108475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtdBH3f8q2fiYvUQy87ndin0AvrweNp2Z8iP3Fg1Ork=;
        b=VVYJVtsPAvcJenb+KS4Vc+EvW5QITrGVBePK6itksEK2Lwwce86RVBnxo3/J/4p1cB
         8EuyXRa11z5O78q/fvGFm7rNXIczjMC7rcwUaro/EbaIeQA+Me/mrBDJlKY6tFn31qDG
         tTReZB7Zu1fLLpMcPzyw1lJbAhfXdNI0AjXV5+TuZ8ylE4UaIwIAaRj0yESV73SClmOe
         ecaKjdJBuexcSMFBCv/aTRPaydlEzeQ6ct6XDG+6hYHpYSFUSDkrDF4Jcjckro1zfhDX
         xWGrKkLwC+YTneTmJT/t8lTP1nP5qi33hemyF2YQwViRuBLOS6/mOq+NXXke7ElUj1ns
         zC8g==
X-Gm-Message-State: AOJu0Yy3soFA61pwvjU2RJE4vKLc3ZILe+FoySCWwBh/4f+/0HlGCHHh
	55qZAqHzerIL5doBTkpZLaBU4tgmoAa//3d91Nu81q8ZRXt7ddK6l8xzT/J/l2fcI78K1NRZSn3
	tzvkNpzOAviodOVRt7XtfUfiJZFgdKVQ1G5Zm
X-Google-Smtp-Source: AGHT+IH1YLnEdG2+hOGW78RDT+yRCc7BP3AgACupHIDL3uPgXllY9fHAU1nMBSmw+MJL6Wbx7JC6kT6w2Nw2VsWUsEI=
X-Received: by 2002:a05:651c:556:b0:2fa:d7bf:6f43 with SMTP id
 38308e7fff4ca-2fb18743a81mr23690021fa.27.1728503675283; Wed, 09 Oct 2024
 12:54:35 -0700 (PDT)
MIME-Version: 1.0
References: <20241009112634.402123-1-mikko.rapeli@linaro.org> <20241009112634.402123-2-mikko.rapeli@linaro.org>
In-Reply-To: <20241009112634.402123-2-mikko.rapeli@linaro.org>
From: Ricardo Salveti <ricardo@foundries.io>
Date: Wed, 9 Oct 2024 16:53:58 -0300
Message-ID: <CAAaKDhFczX1CosfjUj-vBOjcHyBt77XGZks+LAKJSr2SamXHNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6 1/8] uki.bbclass: add class for building
 Unified Kernel Images (UKI)
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org, 
	Michelle Lin <michelle.linto91@gmail.com>, Erik Schilling <erik.schilling@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 19:54:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205367

On Wed, Oct 9, 2024 at 8:27=E2=80=AFAM Mikko Rapeli via lists.openembedded.=
org
<mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
>
> From: Michelle Lin <michelle.linto91@gmail.com>
>
> This class calls systemd ukify tool, which will combine
> kernel/initrd/stub components to build the UKI. To sign the UKI
> (i.e. SecureBoot), the keys/cert files can be specified
> in a configuration file or UEFI binary signing can be done
> via separate steps, see qemuarm64-secureboot in meta-arm.
> UKIs are loaded by UEFI firmware on target which can improve
> security by loading only correctly signed kernel, initrd and kernel
> command line.
>
> Using systemd-measure to pre-calculate TPM PCR values and sign them is
> not supported since that requires a TPM device on the build host. Thus
> "ConditionSecurity=3Dmeasured-uki" default from systemd 256 does not work
> but "ConditionSecurity=3Dtpm2" in combination with secure boot will.
> These can be used to boot securely into systemd-boot, kernel, kernel
> command line and initrd which then securely mounts a read-only dm-verity
> /usr partition and creates a TPM encrypted read-write / rootfs.
>
> Tested via qemuarm64-secureboot in meta-arm with
> https://lists.yoctoproject.org/g/meta-arm/topic/patch_v3_02_13/108031399
> and a few more changes needed, will be posted separately.
>
> Signed-off-by: Michelle Lin <michelle.linto91@gmail.com>
> Acked-by: Erik Schilling <erik.schilling@linaro.org>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/classes-recipe/uki.bbclass | 197 ++++++++++++++++++++++++++++++++
>  1 file changed, 197 insertions(+)
>  create mode 100644 meta/classes-recipe/uki.bbclass
>
> diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bb=
class
> new file mode 100644
> index 0000000000..fac50ea8ca
> --- /dev/null
> +++ b/meta/classes-recipe/uki.bbclass
> @@ -0,0 +1,197 @@
> +# Unified kernel image (UKI) class
> +#
> +# This bbclass merges kernel, initrd etc as a UKI standard UEFI binary,
> +# to be loaded with UEFI firmware and systemd-boot on target HW.
> +# TPM PCR pre-calculation is not supported since systemd-measure tooling
> +# is meant to run on target, not in cross compile environment.
> +#
> +# See:
> +# https://www.freedesktop.org/software/systemd/man/latest/ukify.html
> +# https://uapi-group.org/specifications/specs/unified_kernel_image/
> +#
> +# The UKI contains:
> +#
> +#   - UEFI stub
> +#     The linux kernel can generate a UEFI stub, however the one from sy=
stemd-boot can fetch
> +#     the command line from a separate section of the EFI application, a=
voiding the need to
> +#     rebuild the kernel.
> +#   - kernel
> +#   - initramfs
> +#   - kernel command line
> +#   - uname -r kernel version
> +#   - /etc/os-release to create a boot menu with version details
> +#   - optionally secure boot signature(s)
> +#   - other metadata (e.g. TPM PCR measurements)
> +#
> +# Usage instructions:
> +#
> +#   - requires UEFI compatible firmware on target, e.g. qemuarm64-secure=
boot u-boot based
> +#     from meta-arm or qemux86 ovmf/edk2 based firmware for x86_64
> +#
> +#   - Distro/build config:
> +#
> +#     INIT_MANAGER =3D "systemd"
> +#     MACHINE_FEATURES:append =3D " efi"
> +#     DISTRO_FEATURES:append =3D " systemd"
> +#     DISTRO_FEATURES_NATIVE:append =3D " systemd"
> +#     EFI_PROVIDER =3D "systemd-boot"
> +#     INITRAMFS_IMAGE =3D "core-image-minimal-initramfs"
> +#
> +#   - image recipe:
> +#
> +#     inherit uki

Wouldn't it be better if this was a kernel class instead, similar to
how it is done with fitimage (via kernel-fitimage.bbclass)?

I see a lot of similarities here, and it is confusing that one is done
as a kernel class and the other is added by including in the image
recipe instead.

Thanks,
--
Ricardo Salveti

