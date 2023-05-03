Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5248C77B7F
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 08:47:38 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.14216.1683103657372100372
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 01:47:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=pUeY1P77;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f00d41df22so2467192e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 01:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683103655; x=1685695655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1g8fG8DLUQqOsnRKrxLhOb0LzjU00Woo6+1ohiXPgyc=;
        b=pUeY1P77ZkBHDLz4U75F9v9P6pcWnABt07QAj3SFIwMsyzxPceVOudJ6eBLNVDOGUe
         YzkRYj8Sxub42JctYcrCMlV5hxoFaI0oPFqHk9IMfLFpF75oCdNYWD0qpaS4ao4QFGz0
         yO3UZNJATOXQ9glhrXydrEWqGKzwmWOsoEurZi3vXc0YJ1CX7GFCB92xG0873yMkxHMW
         Omf9RPIjSZWSJEuLK2tIguQjPfgpOW9hE1lM3Wl1IDkoBAk+Uz8SRMHNr1GE7T5GEBDt
         D8jh1QrKMWbXfanUITic8fiX8nIzLH+Or15oUMlA1vQ5mpqubJujq15atCv69nEDIhcZ
         4Vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683103655; x=1685695655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1g8fG8DLUQqOsnRKrxLhOb0LzjU00Woo6+1ohiXPgyc=;
        b=VFcyZ+CVOdTgHcaE5VIGAK/Hz8oZFtqI33vs4Oj8Upl4GJLNfZZakr3/htrW/LOKG/
         a1FvdhSqZAjhpYI7lKZEo4d5KfL3+tb4SK55P7fOWT3j78eOMT5L8ZkpzzwS5G6LF8BD
         BCM0H3iroM/sDneL1vbdnuKc2GrQ86qDhUUjeP+t4cDA/bIehv0gijjLCLrmftLM/5hn
         z/tS6WQ31M/d/jerfQQnYpIy/ZB5Tbdkun9tIKmzKjTFCn9yiKhB6Es2ayumvbKx2iEn
         +Sq7jZXfokysUyeI5fkd/9WGsJwSrQ6+yET2zh0wI6WvQbUpcaTyJp8viEeWFr2l5zeE
         a1Fg==
X-Gm-Message-State: AC+VfDxL43P72OAuq+Hx/v8MlaIrjwGSMGMuFzTIbajQNTx3k5zGkMKt
	rB2FsaqocJCNQx5zLnQgd58yij2/BMUYDk0OrXg=
X-Google-Smtp-Source: ACHHUZ6TkamOKE9MXkeS8ObhE93PKWJbN6LVKbVzHRON6az3jjGsLu9ejf+MN0WOZSF3mia1olxqzZfFyNQ55RtaVm8=
X-Received: by 2002:a19:ac42:0:b0:4ec:ae17:81d9 with SMTP id
 r2-20020a19ac42000000b004ecae1781d9mr345363lfc.32.1683103655162; Wed, 03 May
 2023 01:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230502195932.2196823-1-ross.burton@arm.com> <CANNYZj9hNOKAD2=ZbEc9ywHaU=vR2wVDg999=yGF=oJ46tU1nQ@mail.gmail.com>
 <7113C985-FF04-411B-A1C3-B30337067A6F@arm.com>
In-Reply-To: <7113C985-FF04-411B-A1C3-B30337067A6F@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 May 2023 10:47:23 +0200
Message-ID: <CANNYZj-eVO3_KuvE27t4Y_bsRUuyokMKkhbAKNa-0w+21oBP2A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] vulkan-headers: upgrade to 1.3.249
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 08:47:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180789

On Wed, 3 May 2023 at 10:39, Ross Burton <Ross.Burton@arm.com> wrote:
> > Please respect the upstream version check; vulkan should be updated to
> > sdk-x.y.z versions, which currently means 1.3.243.
>
> If that=E2=80=99s a policy and not just because of historical branch stru=
cture, please add a comment explaining this to the recipes.

Vulkan items need to be updated in lockstep with things like glslang,
and those only get tags for vulkan sdk releases:
https://github.com/KhronosGroup/glslang/tags

Also, there's less upgrade churn that way, as we can skip over many
intermediate development versions that happen weekly or more often.

I'll add a comment, but checking the version with devtool and then
performing the upgrade with it would've done the correct thing.

Alex

