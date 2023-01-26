Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 300E5C61DA3
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 18:30:35 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.81949.1674757834072036630
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 10:30:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FiGDaFyW;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-142b72a728fso3451658fac.9
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 10:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DExyoILb7UD776+DzJfLmogj5b6PrmmMrV/5HChPvgg=;
        b=FiGDaFyWX4zJT2QhNlRb1D+Hh/beEZlB/7ZCcS2RACYYRjhxnAUJpgcrS0XkC3KINS
         hTgeBgKMM42+Rv+S9CbOewIItvNUPH/WNjlJCFkPQipyhBjQKYAyuG/Q3Km8PmpWyHYG
         dZgHshtrTVUstRvPIEn5Hvc6ZCcXYECVGP3TRhBFo5vUtLJLlyF9B9C3nP0hNJMwH31Q
         Zefakr+rxUM26yK7ZR1E06aZo8OuSPtX/0nZerF5zaWpsD0q4BEmFSLIKTZTDJV9FT6R
         Aob5OOjVU4kA87Cp2fUV+KuB4rOZH1OnzSj7tnb03DuKnvZrxcml4+D8lcFkt1UOlXZt
         l8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DExyoILb7UD776+DzJfLmogj5b6PrmmMrV/5HChPvgg=;
        b=8FW0Mgu2kkzIxCF/GRA81lWT/dUHkYSTdMJVa0HyEm1+DD5XfPl4fVlF6czjhrKupc
         z0xKULFJAp4QumjwTaziVMW8F1bUs12rsU3RWWo2S0AufiAlyAQ9TGutYU23A56IpSUE
         /aOwR+sSBRLnDC/xJbkqh+zUalAtiRnob3w7+ynZDdOVhNksss0BfkA4HhqfSYvDMzrG
         xvqQmaUibMddz1+fQekj07ww9MFTSru9HiOk4546zhAVUsPUX8WZvh/S3JWECB0KcrQo
         vSXq3mSqhCMKtNVpUWxeuf8iPwQl+XWF4XJw3CcmMvnw+YrMK1fT6V6noc880cSAOzam
         FgaA==
X-Gm-Message-State: AO0yUKW/aWSOK/MirVtXhWW5cEsUZdIin3EPLyAHI479L91ddNEcXJvP
	mmoBHQb3PdGp9QecA7je2rFfqSlkV01Ep7NAtDs=
X-Google-Smtp-Source: AK7set9fk0/ELu2GVSLT8wG1ne/0+tsH3ZbLEU9xAlAuYGwoisASLeFebiEyKL/TgSqlEYkbIUPGgx95M6QbZkwUgEc=
X-Received: by 2002:a05:6870:6488:b0:163:573b:3eca with SMTP id
 cz8-20020a056870648800b00163573b3ecamr201535oab.55.1674757833279; Thu, 26 Jan
 2023 10:30:33 -0800 (PST)
MIME-Version: 1.0
References: <20230126171648.2527833-1-richard.purdie@linuxfoundation.org> <20230126171648.2527833-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230126171648.2527833-2-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Jan 2023 10:30:07 -0800
Message-ID: <CAMKF1sq-LMDrh+j+9MFQ7MajUdgnSyvU0RNJYTFUC5Ped-1cFg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] wic/efi-bootdisk.wks: Fix for 6.1 kernel versions
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 18:30:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176420

On Thu, Jan 26, 2023 at 9:16 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> oe-selftest efibootpartition.GenericEFITest.test_boot_efi was failing for 6.1 kernels with:
>
> | ERROR: _exec_cmd: export PATH=[...] mcopy -i [...]/rootfs_boot.1.vfat -s [...]/rootfs1/* ::/ returned '1' instead of 0
> | output: Disk full
>
> I believe we hit a file boundary size and having "0" overhead in the image meant
> the files couldn't be installed. Allow a small amount of overhead to avoid
> the error.

Just curious. how big is 6.1 size compared to 5.19 ?

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  scripts/lib/wic/canned-wks/efi-bootdisk.wks.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in b/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in
> index 7300e65e32d..2fd286ff982 100644
> --- a/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in
> +++ b/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in
> @@ -1,3 +1,3 @@
>  bootloader --ptable gpt
> -part /boot --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/boot --fstype=vfat --label boot --active --align 1024 --use-uuid --overhead-factor 1.0
> +part /boot --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/boot --fstype=vfat --label boot --active --align 1024 --use-uuid --overhead-factor 1.1
>  part / --source rootfs --fstype=ext4 --label root --align 1024 --exclude-path boot/
> --
> 2.37.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176412): https://lists.openembedded.org/g/openembedded-core/message/176412
> Mute This Topic: https://lists.openembedded.org/mt/96547775/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

