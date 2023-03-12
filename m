Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F285C6FA99
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 21:10:50 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.5067.1678655447661558409
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Mar 2023 14:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SSp4HpE+;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id n2so13263571lfb.12
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 14:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678655446;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m/pbZM6cBjJ5rCagJyxELGoIlG1tyhmcb1zpE7FxyM8=;
        b=SSp4HpE+ab3ii6hjMcNvDZltf/GrqqNBYzvqXkqAPE7MuEBk18UmRunMl0PiRPayYN
         8fqpuyMSSmuNaHvgM5n7t+UL/JcKXE8LFyFcoBOKcsn7o+GobuN0d84y+YXZLYXbiYcA
         Cy6TWR1kEtoX0Ud9+vP8GYwl01t0dDqkB4ZaaP4SDnOcNy2Wmu5nke1LR516yJCAQBdX
         m4l0d8KhlDbJ6eLacpLLbbwu1YE4pfBBCPdL1Uwez+rFPOKQFbXaB+oqaxYhqrLukQxY
         PQhNnTxI2+HaKTyrSAzmG3xwYzqnq//BgpqD7M8k8ghRnfpeDuz2OL/myl0CtN+EBuJc
         0+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678655446;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/pbZM6cBjJ5rCagJyxELGoIlG1tyhmcb1zpE7FxyM8=;
        b=g3pjO0JeW+cpnZ6OdG1HQpnI3ucODruaGIR3rz6DdPAJv7kiApH9mOj+Ls9X83wFMH
         DjGEESRVcF3A1Usiuuf1NvOBmfjQyT3PV50KCVJGaYZ4hs6TrCU2wRaz2jwRLIBI+Z79
         509uAALgNF3dZ/8GMjKlKSaiAFxdteSyMuefMQUwZr8s/cdAetrsT9v8s4T5o/W4/A8p
         CnQlI+TLx6AvflfAX3h+foKDBvSQE/T5bwPIYJEtnTzSz1zybICPcxMFnl4SZLjr2nuu
         v0ZtdzMZUIZt84L78jknurm12doP0+N634e/nxQx3pITlDdCwKOgBwRhVI6nLCNfdmdS
         dTpw==
X-Gm-Message-State: AO0yUKWJzWxTgCILRd5zCXW6EBj9v/+CtMWihHdF6EJ1ni/IZJxnCwTT
	LjnYm7IQcy1RWLAgP0kfibu1lnlraRD7fmjhias=
X-Google-Smtp-Source: AK7set8rrgnBnqwqNMEnSwdn76FHETXnolaiSRwyFfIJ5xtnyi25yjdrGemURNIc253eVTYgrNb0djd6Jh6FQZpjU8Y=
X-Received: by 2002:ac2:50d7:0:b0:4e8:446f:f600 with SMTP id
 h23-20020ac250d7000000b004e8446ff600mr526370lfm.13.1678655445656; Sun, 12 Mar
 2023 14:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230312072422.2626859-1-raj.khem@gmail.com> <CANNYZj8fy7m1_fzZKyVCoKTd2-c8dnas-0NYkif89JXf7fPOnw@mail.gmail.com>
 <CAMKF1srA2ks+mvbBM3tWk=6zfcHFHYXnix2SNpCYnXp0rSDwVQ@mail.gmail.com>
 <CANNYZj-5h=u8yF0zzpSbwoJWSzVFEo5AHMeER1qeEin3kVtUUg@mail.gmail.com>
 <CAMKF1sqjE0xeYtzw9az+ysmrzEs6rsH0E_uLkZcrn65X195+Wg@mail.gmail.com> <174BC754CF63B9EF.25836@lists.openembedded.org>
In-Reply-To: <174BC754CF63B9EF.25836@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 12 Mar 2023 22:10:34 +0100
Message-ID: <CANNYZj8LGa_Bfy-0mpBK0Dzvw=DRenPH4yuJiTMGnLLBGm02mw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: Fix musl fix patch
To: alex.kanavin@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 21:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178404

On Sun, 12 Mar 2023 at 21:54, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:

> clang includes the incorrect one:
>
> #include <...> search starts here:
>  /srv/storage/alex/yocto/build-musl-arm-64/tmp/work/cortexa57-poky-linux-musl/systemd-boot/253.1-r0/git/src/fundamental
>  /srv/storage/alex/yocto/build-musl-arm-64/tmp/work/cortexa57-poky-linux-musl/systemd-boot/253.1-r0/git/src/boot/efi
>  /srv/storage/alex/yocto/build-musl-arm-64/tmp/work/cortexa57-poky-linux-musl/systemd-boot/253.1-r0/recipe-sysroot/usr/include/efi/aarch64
>  /srv/storage/alex/yocto/build-musl-arm-64/tmp/work/cortexa57-poky-linux-musl/systemd-boot/253.1-r0/recipe-sysroot/usr/include/efi
>  /srv/storage/alex/yocto/build-musl-arm-64/tmp/work/cortexa57-poky-linux-musl/systemd-boot/253.1-r0/recipe-sysroot/usr/include
>  /srv/storage/alex/yocto/build-musl-arm-64/tmp/work/cortexa57-poky-linux-musl/systemd-boot/253.1-r0/recipe-sysroot-native/usr/lib/clang/15.0.7/include
> End of search list.
>
> So I'd say the search order needs to be aligned with gcc, rather than
> having to patch around the issue.

For reference, clang on my host gets it right and matches gcc:

alex@alex-lx-laptop:~$ echo | clang-14 -E -Wp,-v -
clang -cc1 version 14.0.6 based upon LLVM 14.0.6 default target
x86_64-pc-linux-gnu
...
#include <...> search starts here:
 /usr/lib/llvm-14/lib/clang/14.0.6/include
 /usr/local/include
 /usr/include/x86_64-linux-gnu
 /usr/include
End of search list.


Alex

