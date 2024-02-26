Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8727C48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 18:55:45 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.1304.1708973739513024482
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 10:55:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rg2c3cSU;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-512d19e2cb8so5133538e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 10:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708973738; x=1709578538; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uLeSjy3iTJtXyB1Gr89JIik/UtkPfEs4ICbf8+uB/X4=;
        b=Rg2c3cSU8WTEq0CzZhJjrM/v9+LZUqNTQyLqW4Sl7qyEE3kqb6j1lakcaC9UFhpJxO
         W4cSRVh/F1dCd+qYTkbS81nLyD2iw0mhStwOsWveh7CpK/OnZACdNbSK11eN0nYhDSoz
         Vt/wzH3glCLqNOG5YaNgbtnsD1aB07uoQjsNq11rTPGBCL/y/jItWu4tkllEwrGFzgxm
         d/BGDqEcSxOgFqe7ZmZDZ5R0pEVbcYQIu0gPLpdpO+RycEVviJDjB/W6Hlqv7isXS6wX
         N/PxgwOqIWzi9Vknhgfbh8YYpACcMjJkn4ME6dbB3D6TTZdOsxHSisHUmzvImWVUGzfY
         Yk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708973738; x=1709578538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLeSjy3iTJtXyB1Gr89JIik/UtkPfEs4ICbf8+uB/X4=;
        b=X9ywlkGHoH0OYU2zsVymBbgsMRjI/ax6pZ269tfxv5b79HB9tmFXpELEfvEAoJ9MF/
         hf1xlrPb0ptCvioJIss+Ln5MWcgsHtT8k+5X9Nj3gK4QAlKJPlKWklVbf8BffbHCRzcS
         oDFCRj7+gTlCPwhekonHCqF7xSZSIuK6XBOwEs2oTgFTfofLnkLG6hIF5BdFY4t/MAaf
         vQPonfRnZGIrDI2KfdkHksZj26g0H3yOVHG+IBcM1SlQGcV/ei1WHhhoYdkeOKYqPf18
         GMpCAjNJpg0sD/Ey3YPlki9JNW2EBzJBnftpVQMkN4Y7k11cKbT3V4xDTi+fKoKPRUw7
         TkSg==
X-Forwarded-Encrypted: i=1; AJvYcCXmM8oifzjzRIxqDVkNJCrip+NdkgmeaqG+ZH3S+ll46CleCM3yZ2w+NdVMOjkEq5FfAY18V6/dDPFxV1FTtTndZiXI5TU4LcyhQ032g3rXH5ceLspUefin
X-Gm-Message-State: AOJu0YzKoMHffgmU13t6jm9IGoZTjaIKF4OOPEC7utC0H02imN/QEqwn
	i8Nhp6Qb0eDY6bmFHek3OgIhu1m8+/D0On8Bn6Dhs+PPHlm6noGWTjf7U+vfhZm7DV1VRnMDF15
	e30amfUsEMLzn5Bise4er+9bdEl4=
X-Google-Smtp-Source: AGHT+IF5B4jSp2psFwGuPcTFdGCvKku36bNAc1+Ag1Gzzlv2eHggqiAlAq5aDY1iMSqvQezkRGCiZZF8HyshWGz7k6k=
X-Received: by 2002:a05:6512:239b:b0:512:fe25:550b with SMTP id
 c27-20020a056512239b00b00512fe25550bmr2731247lfv.47.1708973737480; Mon, 26
 Feb 2024 10:55:37 -0800 (PST)
MIME-Version: 1.0
References: <0101018dadd3a49b-174678c4-e621-443b-a9ca-ad0a257a6260-000000@us-west-2.amazonses.com>
 <25f1235a-c76c-44a9-95d9-242a3e32b8b4@baylibre.com>
In-Reply-To: <25f1235a-c76c-44a9-95d9-242a3e32b8b4@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 26 Feb 2024 19:55:26 +0100
Message-ID: <CANNYZj91VaNNaOcne=RbPsD+AEUWUQuRnSy0k0LDdsp9-rw9hw@mail.gmail.com>
Subject: Re: [OE-core] [AUH] rpm: upgrading to 4.19.1.1 FAILED
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Auto Upgrade Helper <auh@yoctoproject.org>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 18:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196216

On Mon, 26 Feb 2024 at 19:27, Trevor Gamblin <tgamblin@baylibre.com> wrote:
> I've got an upgrade ready for this, but it seems to be introducing a
> buildpaths QA issue:
>
> WARNING: rpm-1_4.19.1.1-r0 do_package_qa: QA Issue: File
> /usr/lib/cmake/rpm/rpm-targets.cmake in package rpm-dev contains
> reference to TMPDIR [buildpaths]
>
> I've traced it to this part of
> tmp/work/core2-64-poky-linux/rpm/4.19.1.1/image/usr/lib/cmake/rpm/rpm-targets.cmake,
> but I'm not sure how to fix it (my CMake-fu is weak):
>
> set_target_properties(rpm::librpm PROPERTIES
>    INTERFACE_INCLUDE_DIRECTORIES
> "/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/rpm/4.19.1.1/recipe-sysroot/usr/include"
>
>    INTERFACE_LINK_LIBRARIES "rpm::librpmio"
> )
>
>
> Anyone know how to fix that?

This sort of thing is usually fixed with sed after the fact in
do_install:append. Examples everywhere in oe-core, even rpm recipe
itself.

Alex

