Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581B4C5472F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 14:31:43 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.79907.1724769098690200591
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 07:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PE9UyA/+;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5becc379f3fso6091369a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 07:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724769097; x=1725373897; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JoSFi6FfFIZHJ2xqUISXT65vNc/Jy9X5mhVpy8Ialao=;
        b=PE9UyA/+/eR2bvYkBE97j+80jFaMeSPCb4QCkioW25ACqQbrf2Tci8MZfDqKYu0sjS
         lf8xLRiUC93/oGN5OK5rJ3YdSOQuSIQaB1W6kR5tafO3sWZwt0WWGrYnnSWcZ1jxa54N
         rR85OCvS5KlXKiQJVGv/kbpYsoxWO/HuCbady2STCy3P3lq6v6bdUVGyAmGEdORcz6CO
         7rviQ/H/RVGljke9CEAL9pQPLoYS+92Erf4Frt+w7V6MQEul4DAGjodRJdqaOWSEf1M+
         tbbFdHWJtOuQuCnXa7cxkQy4bklZmDdbflcGzW95nlJWOBHfIlDWnOyHZvqXBhu4Ffv1
         zIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724769097; x=1725373897;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JoSFi6FfFIZHJ2xqUISXT65vNc/Jy9X5mhVpy8Ialao=;
        b=cFBeRVHc5Tc5O531a0qdqA5Jf5yTliNZQ1xLfFSJk3mj6er3xAZtY8LRjUaGsX3hIh
         80F9osX3vNqPVECDgX2osucaw+bWuaQl8A6lEv8HGtqsqPP2mK1xYui5UCwiiPkCsPXZ
         TwTaz59+EaloGumOSm4/THK5tdgoyrku1jh7mGKt0Rv5e70XhcdDuNyGNg5P5j4Y6zj7
         5c1Nj6oGkwAHkzGaxSKvKBk967D1D87Mtjjeh5t2mvoFRRcVzP/lMlQOrIVer2Q4F0p5
         ueaf3Ejhw8WxdZXOZ/QM6XD/iiDC328snqnWKsytBTrwW9Y60FncpqU4NSEZTJR1BOmf
         6Sgg==
X-Gm-Message-State: AOJu0YyZWBfw84Ej5iSs2iqosTnea+KSpOrq/eHF6Iq/t3Dbkj0/nyfz
	kAq2757ByrN7ZbAwL5taZUHm70HpeQDBvFV43IBOjxhD+YqCpKitWfEMiDJiCJsrPih8ZJhrC1L
	+zWib5Bw+E2vX4SbjBNTwtljVF84=
X-Google-Smtp-Source: AGHT+IHRE+8fVQw/7fCuc7GMEKhZJ2GOPK15vGBkp1cdcWYGkVYKHyiyln2F/z2AUtiP5ZRz5YKuKTXGeRGZlckwGX0=
X-Received: by 2002:a05:6402:3584:b0:5be:daba:8bc5 with SMTP id
 4fb4d7f45d1cf-5c0ba2ade76mr2159621a12.16.1724769096359; Tue, 27 Aug 2024
 07:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240827100930.127469-1-dmitry.baryshkov@linaro.org>
 <e93464b1-51e2-4058-afa5-3811975de62e@cherry.de> <CALT56yP2tgC8RoW2UzzMhTW8m48-s-6icgGSRdgVJdwDrxPrvA@mail.gmail.com>
 <a1f39ba7-0aa3-4ba2-b847-a11d420b60be@cherry.de> <CALT56yMVDDEQ-A2Z6+_Jjbh0vyGU4fjq_0MPPZghfs9sSqd1ew@mail.gmail.com>
 <5bb87f1d-f023-4bd8-ab7a-6c1ff636c3eb@cherry.de>
In-Reply-To: <5bb87f1d-f023-4bd8-ab7a-6c1ff636c3eb@cherry.de>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Tue, 27 Aug 2024 17:31:24 +0300
Message-ID: <CALT56yP-9zTzVdfmkAw5jPTJZky0LxVQdSmu4O6+N0O0oaGUXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] linux-firmware: package qcom-vpu firmware
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 14:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203848

On Tue, 27 Aug 2024 at 17:13, Quentin Schulz <quentin.schulz@cherry.de> wrote:
>
> Hi Dmitry,
>
> On 8/27/24 3:18 PM, Dmitry Baryshkov wrote:
> [...]
> >>>> It's also not necessarily required to merge those together as we could
> >>>> probably still have two different packages to avoid bringing in files we
> >>>> don't need (I assume the same SoC doesn't have both a VPU 1.0 and a VPU
> >>>> 2.0 ?).
> >>>
> >>> First of all, the original naming seems to be incorrect as
> >>> demonstrated by the new file names:
> >>>
> >>>    qcom/{vpu-1.0/venus.mbn => vpu/vpu20_p4.mbn}    | Bin
> >>>    qcom/{vpu-2.0/venus.mbn => vpu/vpu20_p1.mbn}    | Bin
> >>> qcom/{vpu-3.0/vpu30_4v.mbn => vpu/vpu30_p4.mbn} | Bin
> >>>
> >>> It is possible to split one file per package and let users pick up
> >>> packages one by one, but granted that the whole size of the directory
> >>> (4 different firmware files) is 4.3 MiB, it doesn't seem to make sense
> >>> to me.
> >>>
> >>
> >> 4.3MiB is quite a lot if you want to be able to have a tiny filesystem :)
> >
> > Well, these devices come with 64 GiB or 128 GiB UFS storage, so no
> > need to be that picky.
> >
>
> 4MiB here, 4MiB there and your image is unnecessarily tens of MiB bigger
> and your OTA update image is that much bigger, the initrafms/suqashfs
> take that much more space in RAM, to load, to verify, etc... It's also
> not because one of the devices based on this SoC has a lot of UFS
> storage that all of them would.

There is little point in adding VPU firmware to the initramfs. I see
your point, but still there is a boundary between splitting the
firmware too much. For example, we have bigger ath10k, ath11k and
ath12k packages instead of splitting them per the SoC / platform
(think of ath10k-qca4019, ath10k-qca6174, etc). Looking at other
examples it is pretty common to see that the whole subdir is packaged
as a single package.

>
> >>
> >> Ok so, if this
> >> (https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=36db650dae038be945fb04def591fc726255b09f)
> >> is the commit doing the change, we have an issue. We also need to
> >> maintain backward compatibility, not between different versions of
> >> Yocto/OE but between different versions of the kernel (I assume to be
> >> the reason of the need for backward compatibility).
> >>
> >> See that they mention in the commit log that they provide
> >> backwards-compatible links, we need those as well. Otherwise we may
> >> broke older kernels we were compatible with in the past.
> >>
> >> I did something similar to that in a previous update, c.f.
> >> cdcfdc1dc545fe381764795ed502a3fa0a48b87a in poky.
> >>
> >> I would suggest the following:
> >> - keep the packages split
> >> - add the new file in qcom/vpu for each package
> >> - keep the venus.mbn path (which is now a symlink)
> >
> > I did a simpler thing. I think it's easier and matches the intended usage.
> >
>
> If VPU 1.0 and VPU 2.0 FW packages are self-sufficient, I personally see
> this as a regression rather than making things easier. We have split
> packages, and I don't see a reason for merging them.

The problem is that the VPU 1.0 name is misleading. According to the
file name the hardware is actually 2.0. See the discussion at
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/249#note_2001158277

>
> I'm no maintainer, so this isn't a decision I should make. Though the
> symlinks absolutely need to be part of the package(s), aside from that
> it's just "policy" or preference :)

They already are. I'll wait for additional feedback and then post v3
dropping the RDEPENDS and rogue FILES:vpu-2.0 as you suggested.

-- 
With best wishes
Dmitry

