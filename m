Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35DEC61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 11:44:50 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.11120.1678362288447548539
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 03:44:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RQxGuylU;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id h3so1476308lja.12
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 03:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678362286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XEgcSqHcv/nDCurujSaVA5TC9neUhUmRdj6BLio6Njg=;
        b=RQxGuylU2x/aeqKwwXCBzYiq9lipouz6NSCIPgz56M3dqgH+27rAsJ1hhSzNrLyQ6/
         MCY9wFAaksyvcUxBtAQnX6qdW5Qc8yP1dv10mMbjIApj/QVPxlrQ7O1ofSAb9nRFCLRh
         I4JowLhy3kVnThAwrHOfVI8YgHche6xgFzE0/sO88hPaXcYeprAttPRUY9dtt1NxRpbB
         DmcA4pGSDnsz3Z8Dvh6zCdavV7QTFx4+GPMVsvOaXYmq6mtgKPAlIafhXFfw9u3GccBj
         b4Q23bHCHgiQhyWRSX05gL1t4skqWlGfupLtCFVq0zNtkCNFn3Y1RSaPfuTZ6rXI7MiH
         wxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678362286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XEgcSqHcv/nDCurujSaVA5TC9neUhUmRdj6BLio6Njg=;
        b=x1t4RG/2OrxnzdFsIxbwsbeo5PDasCqYipEqchNoKynvDEnI/pOibKwyXuLGbEzkhI
         CLGbui151NKQHhpfUMqcqDo79LsgsCn5Nj4ihxKUXuV8Wnn2TMuzIT3WVdpF36KY4Tr2
         S9+ncs1UVH9aCZIdKONGM8YjvGXN6UawjWZ5m68XimfZYJT9dzFFeS+JICaAifLoepC0
         JPn9UCF314YdZN41NRwHpnDkHDckXk8vuStiRKa4P2Xohrc8/eNdLxWDTzbE9FZLpsbL
         lDdRsLdWBMYaLRL0O/hD4mEmu4unwl7f5e7jfTUlpDBaVLmDkxr1V51sR6CfIJ/WucAV
         WYSw==
X-Gm-Message-State: AO0yUKV7+kdR4ulFHsOJIV/4wAp+aAmmsSzfDuNSZwVQLkKED6ID3Dwh
	5Fb+vucUVwKieIm7RgFpGvTe6AfchyTQpch7tc0=
X-Google-Smtp-Source: AK7set/dR7348fZRtf7oKT2MjavB11A13iO3IkwJQ8os2WwB2rpxbzJLTt3V9hMq8zIE2cFo4dkypjVK3zuPhLtMgt0=
X-Received: by 2002:a05:651c:483:b0:295:b1af:64ca with SMTP id
 s3-20020a05651c048300b00295b1af64camr6717107ljc.7.1678362286518; Thu, 09 Mar
 2023 03:44:46 -0800 (PST)
MIME-Version: 1.0
References: <20230309103225.3110783-1-alex@linutronix.de> <39fcdfbf705f2d2f58bbf317171f0872df2aa2e1.camel@linuxfoundation.org>
In-Reply-To: <39fcdfbf705f2d2f58bbf317171f0872df2aa2e1.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Mar 2023 12:44:35 +0100
Message-ID: <CANNYZj85v8Mt97qCNvTf8GdOUAXsfTFPGJfN-1_UxK1io1TrsQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] staging.bbclass: run prepare_recipe_sysroot
 after unpack, not fetch
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 11:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178220

On Thu, 9 Mar 2023 at 11:39, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> Before we start changing core dependencies, we need to better
> understand what happened there. Whilst this patch might fix this case,
> we'd likely just leave races elsewhere as other tasks call git too.
>
> Which recipe was this?
> Why is git calling into python?
> Why didn't the staging code to move libs into position before binaries
> prevent this?

The recipe was libslirp-native (I don't think it matters). Git itself
is not calling into python; it's poky/scripts/git, which is a python
wrapper script around git.

I don't have a definite answer to the last question - I believe the
staging code also removes 'outdated' sysroot items before installing
current ones, and that's where the window of having python binary, but
not its library may have occurred?

Still, there seems to be a general problem here:
prepare_recipe_sysroot runs at the same time as tasks (such as unpack)
that have PATH pointing to directories being modified by it. So
there's no determinism in which python (native one or one from the
host) is going to be used for example; it may randomly change midway
through the task.

Alex

