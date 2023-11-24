Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 028D0C61DF4
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 22:28:36 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.8439.1700864911782022562
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 14:28:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YXE1nUUx;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1f9e05f0918so896005fac.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 14:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700864911; x=1701469711; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INdgtEHJ0Wq9m2pBqkMRot2wpDVlVQzoVdANZ4AUBvg=;
        b=YXE1nUUxbmgD2o2MAWkrkIKUIIUt8HHSH0yteFn2WQ7BaKr/PhI2c0RoyS730gfVkF
         VXkVjvzBFTSb2RqJbFOr8gV3ppdNq9YnyldFeQz4NAxdDhM96gnCVOfEMMeYJd5v48D6
         AY23yJCgtwGnDeTQbX4q/EAAu2WG6UKmJRAOLlGi7qx7t44UPhwMitgdsJRRywm6rzJb
         cXiZyz1HZVP4Lb9Qy+MjjtwJGI4IQ1KQnXnxSdqv5xDfmclpkf+x5XDOty5+C2PzQt+f
         f9Gq7ZQNJMt+a+S7VBJy6HyP/ciQIQG5e/kHUnutXpj9Cq1zcNl9zr7qyRpO9EGTrL2G
         YnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700864911; x=1701469711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INdgtEHJ0Wq9m2pBqkMRot2wpDVlVQzoVdANZ4AUBvg=;
        b=ePfmS5pVbthOfq2wcAx46BKxGddGyGcSAg2lK5IwgVrUh18/eeeTPnMTusHZ4m18Gx
         UFOHjf2dM7pBYisRQ1sue6dNziPpLz5A7nNQKpEVio27Zgr7YirHq1h2CEFnyEcRMISu
         Dz/cb9Cy0aqwdsxMPBDt5n06HZ0Ke9XzlztAGjufeEzubGfsGv8acWYVpjZJe5pBxcbD
         RDt8ke0rZKWYKe7x8fUNSbiy9ePYiD6fJz3t8OR7sJdkibuInwttjyWvlPwjDLxsFtVs
         rfHeedH+nQA2QbjeXSwSRRMA4hQnSPXEf3pfQjkN3tWH8pEY3B4Cbhi/RvkSRpEAdAwz
         oFhw==
X-Gm-Message-State: AOJu0Yx/yBj54Pe3J9iGcfRg3pFv7jijWW9CzREPjwin2VqAf5muBxw8
	O0VxlCTn6azupbGiC8cq2hSepwHYKq4N+qTYQec=
X-Google-Smtp-Source: AGHT+IFU/N63UiC2aHhHSDjN5gGAV+Y85EgI0aHTNMHIrDdkDQpVP6nCNwW7Ol56qDZaXhiz4032QekF5yZVKp/7KGg=
X-Received: by 2002:a05:6870:6785:b0:1ea:eed:fd02 with SMTP id
 gc5-20020a056870678500b001ea0eedfd02mr6286678oab.45.1700864910858; Fri, 24
 Nov 2023 14:28:30 -0800 (PST)
MIME-Version: 1.0
References: <20231123004605.82598-1-marex@denx.de> <CANNYZj8s99epW6DxAmNzW=70P_0ksoAntN3bVbUu6ehR=tkcpg@mail.gmail.com>
 <f5a8fb84-42cc-432b-8704-9b058be25835@denx.de> <CANNYZj_XG4nxLOqOq=aeYOZBNuDMoOdYF8G2LWVUDbe+gYNEQQ@mail.gmail.com>
 <CA+chaQdz8Aby6uL+RxvZMOsRfQVSztL6eDNNRcWQR7mQgCZLXg@mail.gmail.com>
In-Reply-To: <CA+chaQdz8Aby6uL+RxvZMOsRfQVSztL6eDNNRcWQR7mQgCZLXg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Nov 2023 14:28:04 -0800
Message-ID: <CAMKF1sq+KCHsQ524XWynBiepeW403UgP3NsX5s99R54HrqVTSA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "lzop: remove recipe from oe-core"
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Marek Vasut <marex@denx.de>, 
	openembedded-core@lists.openembedded.org, Ross Burton <ross.burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 22:28:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191217

On Fri, Nov 24, 2023 at 12:18=E2=80=AFAM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
>
> On Fri, Nov 24, 2023 at 8:52=E2=80=AFAM Alexander Kanavin <alex.kanavin@g=
mail.com> wrote:
>>
>> On Thu, 23 Nov 2023 at 22:07, Marek Vasut <marex@denx.de> wrote:
>>
>> > The lzop is called in oe-core and I was under the impression that
>> > oe-core shouldn't depend on anything except bitbake . So either this
>> > stuff should be moved to meta-oe too (which would be unfortunate growt=
h
>> > of dependencies) or the lzop should be reinstated . I would obviously =
be
>> > in favor of the later.
>>
>> There are plenty of recipes in oe-core that have optional features
>> (enabled via PACKAGECONFIG) that depend on recipes that are not in
>> core. If you enable them, bitbake will say that the needed recipe is
>> missing and then you need to figure out which layer to add (typically
>> something in meta-openembedded tree). This is not that different:
>> optional feature, disabled by default, and the error will be the same:
>> missing lzop recipe.
>
>
> I think this case is slightly different as this optional dependency might=
 be "enabled" by MACHINE config in some BSP layer and BSP layer depending o=
n meta-oe just to build the kernel (with BSP preferred compression) isn't g=
reat - compared with some DISTRO config enabling some additional PACKAGECON=
FIG in some other recipe the DISTRO uses.
>

do we have some data on how many machines are needing this ? if not
then I think we can say that
its not actively needed and few machines if any needing this can house
the recipe in the BSP layer
core support is still in core so that's good.

> At least if Marek agrees to maintain it instead of restoring Denys as mai=
ntainer :).

That's good although it will be nicer to see a wider use case to keep
it in core.

>
> Cheers,
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191178): https://lists.openembedded.org/g/openembedde=
d-core/message/191178
> Mute This Topic: https://lists.openembedded.org/mt/102759947/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

