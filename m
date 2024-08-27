Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF818C54734
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 13:18:32 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.77502.1724764707826306946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 06:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CVt0qOsG;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f3e9fb6ee9so64208811fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 06:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724764706; x=1725369506; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RmG03rG+4TJWQBJACK+xVePObhzEggwDOB8g5CqYY7s=;
        b=CVt0qOsG4KsFEuJUSYrOaQ1tfj4kcBxEq/WzdZ5zZ2Ym1yFKw8A+1WTNbrld0dYrsY
         pQ5kmW6O3XwamdW8NCfLX2OsEK2LJhCOClNLMUAmjcbhT9z+8m5im/6coomfQ/95yUfZ
         bMxlKcV020PbCmcGfI1w/YXdXdqz0I6Cr+b8D7Ckl3aq/22CGZuzhEfYy3G6v2IwIjPO
         rEF8yP1Xyll/auWs9zk+hHV5N1ZFjTizNkzg74jh36JQO6/kxGM1y6/96cUiyLS3EcCX
         DZmMVH4fe41osNMivoxVs8lGlqIeLogeW3MsDqY25Hq05yiGIbJqbKAvQJivHrmgGnUz
         YRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724764706; x=1725369506;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RmG03rG+4TJWQBJACK+xVePObhzEggwDOB8g5CqYY7s=;
        b=KDZZ14f7cDd+cLxud4ZaMc0nLunHc7MO4sgq67BBGvEXSg1q0g9xWT8+so584D2Mw5
         E09hYAqV0v9ziVTfoGvhiZeFyDZV+TpHvDCmJro+blBa6EuKCuHmrQFIlA7m5uVukzTY
         xq9oZpNbN4yUwqRci08jtei9uPuW/rTSlqgUhNIQvZdKp24CPDpf+zWJrg7tJ7ZOlsvb
         jpUtb3r/7m60P7uYdgMh8V+b5eIlRH2FDhU6hy999gzdCWkC2em14SPFuynpvZTqWO4J
         R6Y+BI5SpPridAzgrv+qV5RHeIGbEfh5DAUk6qp2l+JjRgeY20+P5S+aEcmOv6Kcbiv2
         IgJQ==
X-Gm-Message-State: AOJu0Yxu0LfSTJceQudqTARU415NYlu1fVzmKglObqpwKE5HADhO+2dx
	zYJ3dxvSFPF1AxkEpqXYB0wvfo0Bw4dLwuJ+92hypDdYrF4wUh5XaelksRlUo2ZFkj3y6YlKs4J
	BzG37s0kfUvPAGsZtYyFLZRiZqdI=
X-Google-Smtp-Source: AGHT+IHRIpS6F7ICZDGPE805D+/ZTF9GtBz8eXLPKrwsiWIun7GIWSTg/aVYfOKM/IH/jKMbniQ5025TUFRZiaofJWc=
X-Received: by 2002:a2e:b8c2:0:b0:2ed:5c34:4082 with SMTP id
 38308e7fff4ca-2f4f48ec64emr92714521fa.8.1724764705264; Tue, 27 Aug 2024
 06:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240827100930.127469-1-dmitry.baryshkov@linaro.org>
 <e93464b1-51e2-4058-afa5-3811975de62e@cherry.de> <CALT56yP2tgC8RoW2UzzMhTW8m48-s-6icgGSRdgVJdwDrxPrvA@mail.gmail.com>
 <a1f39ba7-0aa3-4ba2-b847-a11d420b60be@cherry.de>
In-Reply-To: <a1f39ba7-0aa3-4ba2-b847-a11d420b60be@cherry.de>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Tue, 27 Aug 2024 16:18:13 +0300
Message-ID: <CALT56yMVDDEQ-A2Z6+_Jjbh0vyGU4fjq_0MPPZghfs9sSqd1ew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] linux-firmware: package qcom-vpu firmware
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 13:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203841

On Tue, 27 Aug 2024 at 14:50, Quentin Schulz <quentin.schulz@cherry.de> wrote:
>
> Hi Dmitry,
>
> On 8/27/24 1:35 PM, Dmitry Baryshkov wrote:
> > Hi Quentin,
> >
> > Excuse me, I missed your review before sending v2.
> >
> > On Tue, 27 Aug 2024 at 13:25, Quentin Schulz <quentin.schulz@cherry.de> wrote:
> >>
> >> Hi Dmitry,
> >>
> >> On 8/27/24 12:09 PM, Dmitry Baryshkov via lists.openembedded.org wrote:
> >>> Release 20240811 has restructured the locations of Qualcomm VPU
> >>> firmware. Follow those changes and implement a single
> >>> linux-firmware-qcom-vpu package holding all VPU firmware files. Use
> >>> RPROVIDES to provide previously defined names.
> >>>
> >>
> >> It'd be nice to hint at the commits in linux-firmware that do this reorg
> >> for reference?
> >
> > Ack
> >
> >>
> >> It's also not necessarily required to merge those together as we could
> >> probably still have two different packages to avoid bringing in files we
> >> don't need (I assume the same SoC doesn't have both a VPU 1.0 and a VPU
> >> 2.0 ?).
> >
> > First of all, the original naming seems to be incorrect as
> > demonstrated by the new file names:
> >
> >   qcom/{vpu-1.0/venus.mbn => vpu/vpu20_p4.mbn}    | Bin
> >   qcom/{vpu-2.0/venus.mbn => vpu/vpu20_p1.mbn}    | Bin
> > qcom/{vpu-3.0/vpu30_4v.mbn => vpu/vpu30_p4.mbn} | Bin
> >
> > It is possible to split one file per package and let users pick up
> > packages one by one, but granted that the whole size of the directory
> > (4 different firmware files) is 4.3 MiB, it doesn't seem to make sense
> > to me.
> >
>
> 4.3MiB is quite a lot if you want to be able to have a tiny filesystem :)

Well, these devices come with 64 GiB or 128 GiB UFS storage, so no
need to be that picky.

>
> Ok so, if this
> (https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=36db650dae038be945fb04def591fc726255b09f)
> is the commit doing the change, we have an issue. We also need to
> maintain backward compatibility, not between different versions of
> Yocto/OE but between different versions of the kernel (I assume to be
> the reason of the need for backward compatibility).
>
> See that they mention in the commit log that they provide
> backwards-compatible links, we need those as well. Otherwise we may
> broke older kernels we were compatible with in the past.
>
> I did something similar to that in a previous update, c.f.
> cdcfdc1dc545fe381764795ed502a3fa0a48b87a in poky.
>
> I would suggest the following:
> - keep the packages split
> - add the new file in qcom/vpu for each package
> - keep the venus.mbn path (which is now a symlink)

I did a simpler thing. I think it's easier and matches the intended usage.

$ dpkg-deb -c tmp-rpb-glibc/deploy/ipk/all/linux-firmware-qcom-vpu_*ipk
drwxr-xr-x root/root         0 2024-08-09 16:02 ./usr/
drwxr-xr-x root/root         0 2024-08-09 16:02 ./usr/lib/
drwxr-xr-x root/root         0 2024-08-09 16:02 ./usr/lib/firmware/
drwxr-xr-x root/root         0 2024-08-09 16:02 ./usr/lib/firmware/qcom/
drwxr-xr-x root/root         0 2024-08-09 16:02 ./usr/lib/firmware/qcom/vpu/
drwxr-xr-x root/root         0 2024-08-09 16:02 ./usr/lib/firmware/qcom/vpu-1.0/
lrwxrwxrwx root/root         0 2024-08-09 16:02
./usr/lib/firmware/qcom/vpu-1.0/venus.mbn -> ../vpu/vpu20_p4.mbn
drwxr-xr-x root/root         0 2024-08-09 16:02 ./usr/lib/firmware/qcom/vpu-2.0/
lrwxrwxrwx root/root         0 2024-08-09 16:02
./usr/lib/firmware/qcom/vpu-2.0/venus.mbn -> ../vpu/vpu20_p1.mbn
-rw-r--r-- root/root   2031620 2024-08-09 16:02
./usr/lib/firmware/qcom/vpu/vpu20_p1.mbn
-rw-r--r-- root/root   1974884 2024-08-09 16:02
./usr/lib/firmware/qcom/vpu/vpu20_p4.mbn
-rw-r--r-- root/root   2306664 2024-08-09 16:02
./usr/lib/firmware/qcom/vpu/vpu30_p4.mbn

> Basically matching what I did for qcom-{qcm2290,qrb4210}-wifi?
>
> Cheers,
> Quentin



-- 
With best wishes
Dmitry

