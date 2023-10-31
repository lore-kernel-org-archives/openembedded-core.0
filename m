Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C55C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 04:00:38 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web10.179345.1698724829205287808
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 21:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cNADCzha;
 spf=pass (domain: gmail.com, ip: 209.85.221.172, mailfrom: alistair23@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-49d0d90a7ddso2000176e0c.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 21:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698724828; x=1699329628; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pjqb5EQO7VzYbz7fzACn8ctn0ei6dwBd1Fcs8U+toI4=;
        b=cNADCzha/PwGadySnDyPaS9VyebRxuGJ3FouNI5b+poJ6WB2W51AY6sEOW35haDqt8
         D6ayNfPMnaqQREELXsB7ptAqoW2B9ksntRbhf4fHTCVUqDjn8H12B6OPYjAb5GCWjxW3
         Y0TIFVzCSFFDnqon0CZHAf+Q0aBY7zHtUDTEG9jAVNBhpe1KMd1KcdXTNibaQSUXm/CS
         9i6BrwHXkkctyympE0fKUQoHRlzI2jPlPocmVxPhsT83DEn6OuzOonnehUktgpQnF6ps
         +oTeOfKfsmXnaQUYdDxnCT3sYTOLB64gcVrawrtpgrSYAP6e7NfbypwJrMdYOx4kCwYx
         URgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698724828; x=1699329628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pjqb5EQO7VzYbz7fzACn8ctn0ei6dwBd1Fcs8U+toI4=;
        b=iVZx9il9Ws+KQPFro3f9mUJ4f8VxA+rvVLWuhA3UvjKNcDqN8bF7AVuU91Q+Wmq949
         KGsvjt+olrExtlwtR/FEK8YElkDNlkj/rzFAap5Ey+7h/6nxXbF1tFit5zvLjIp9X1rZ
         udnnRD6AkFxipHwYMf49333X5uiglCgs6oenta7vwLnaHidrqGVl0xENZAK2jkwHh9E9
         nWisNws1WosqnrQXVe4UuRNFgAQ76qP7drA64Oho1qtCZbytioldvpzogu6sPKRJZxqg
         pFhYXtrCvJB3yI834Bj51JOYJrja6Kppfyah6+Q0VsdRd65+JQBI8TRBVOSUiZKtF9Kq
         tQgA==
X-Gm-Message-State: AOJu0YxJ49wUP/CdZkTE5G6muRcIAb/E/HfCefQP75hrrh+VRNcHI4Pk
	Ks1cytkdNQeBBH7FRuFTcNsObihwnOi45Dy3sNA=
X-Google-Smtp-Source: AGHT+IEoVVBGvWNUsCq4UMUW7p0K8yUBYKvku/EfviI2qPM+XmWIUxyFCxYr8V7vIjJxeLF+CbBWrCAKCCJZlpGJTIE=
X-Received: by 2002:a1f:2d96:0:b0:4a8:f08c:ec2a with SMTP id
 t144-20020a1f2d96000000b004a8f08cec2amr10009148vkt.1.1698724828148; Mon, 30
 Oct 2023 21:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <20231030191653.65495-1-raj.khem@gmail.com>
In-Reply-To: <20231030191653.65495-1-raj.khem@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 31 Oct 2023 14:00:01 +1000
Message-ID: <CAKmqyKO-DChgiad5Wqm1owk06YgCSGd+mOKoaTzTYsuEsYgY+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemuriscv: Add to common MACHINE_FEATURES
 instead of overriding them
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 04:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189823

On Tue, Oct 31, 2023 at 5:16=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> machine features like vfat are needed for ptests to pass ( e..g. parted)
> This brings it closer to what x86 qemu config looks like as well.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  meta/conf/machine/include/riscv/qemuriscv.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/ma=
chine/include/riscv/qemuriscv.inc
> index 46ae66b9e50..7024bd0a4e6 100644
> --- a/meta/conf/machine/include/riscv/qemuriscv.inc
> +++ b/meta/conf/machine/include/riscv/qemuriscv.inc
> @@ -3,7 +3,7 @@ PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot"
>  require conf/machine/include/qemu.inc
>  require conf/machine/include/riscv/tune-riscv.inc
>
> -MACHINE_FEATURES =3D "screen keyboard ext2 ext3 serial"
> +MACHINE_FEATURES +=3D "keyboard ext2 ext3 serial"
>
>  KERNEL_IMAGETYPE =3D "Image"
>  KERNEL_IMAGETYPES +=3D "uImage"
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189809): https://lists.openembedded.org/g/openembedde=
d-core/message/189809
> Mute This Topic: https://lists.openembedded.org/mt/102282740/3619028
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
istair23@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

