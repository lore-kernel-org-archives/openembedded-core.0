Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFADAC5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 09:37:59 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.58504.1710149875271743298
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 02:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l3b1HZl/;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d309a23d76so44399421fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 02:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710149873; x=1710754673; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbSZOnlwDFPolmB1jpaQg4xxVvt09Lv+cXde2SQqwH8=;
        b=l3b1HZl/7fbnQajmIoz7kKd6b5ivYRgucWpXH2eV1COT1lCSV2WsojL5+My6R+zUyt
         mkPcnQTz8ePXc2hbxeHn9bNAtrsgD8nGpfuRFvIIzW84sS2z1YgTRjPn7G8iHE6fDIXT
         RG2MafagxWhcglG8JRe9nWHYNGG1kd9OObUIFHSPL+rAS4xtzE9zM1cpFMtymqm1IxXg
         0YPWY6dcLXiw80QbG2LbPvc9ASbJMjgkCO4m9646WwKQq342qhD4wejG3Rv/vF0skHhF
         2NrmWkDvwekaMIvYAoRwCdOX2MLleWXgwtxx2Frp2wod2FVhjiu5dVPovwR2ZNpAOjAN
         4x6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710149873; x=1710754673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LbSZOnlwDFPolmB1jpaQg4xxVvt09Lv+cXde2SQqwH8=;
        b=Ac4NRiIE4DTgEUO1VWO7TXMY4poF3regUVtfJJd061bRA+32j+88chKAX02rjUrVFn
         BnyEIpYmNiQj/E5UbRr591O3bqwLh3oDnBJ8u+Ag5BLNxQsfSPBemtK6uyrm/Dsdw6vA
         XjkFiXJJ4rY83q1aSJ+M1+r9vhGxe9I7Efh2gvNNDJHctOrOZ/11O3tXmKby6dFQsDA1
         u6UoUrPryhnDYV8CFSCfj27XWkrqn4Z/RsRQNv2oJ+oXHMKuUz0LB5etMiRpZj568ulv
         yxxTRQr0htPd6i64+my1VVkBvjJRK69qDjFrnapnBGLYEzSVpYQrQdNNfFM/ibbXO4/0
         Mfig==
X-Gm-Message-State: AOJu0Yyc57r0LTJo7M/iCbGMyWKEVSzaky+nK0LI9bqY+jNImpJd26qf
	Z37ZwUG9vDY2a9r8NVyP/djlpQm6asGz58Ud8/ybZMOB+wxwNvPd0hfjydKLYqmHHJIn51dl0Ag
	ETqcplNP4uDt2kHAL04X86EDPzC8=
X-Google-Smtp-Source: AGHT+IHFNpjWRYJ+KcHNr29XRjlBzMhMYhViMbGgnJkEzlzMKLCSVi08lquiyfR4D8zCwx3MHynCsGv5HFyjZMv77ZY=
X-Received: by 2002:a2e:880c:0:b0:2d2:2c74:ff02 with SMTP id
 x12-20020a2e880c000000b002d22c74ff02mr1926265ljh.9.1710149873358; Mon, 11 Mar
 2024 02:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <0e38566f-a1f9-4ebb-8492-2c50945eeeb4@gmail.com>
 <CANNYZj96nE0kVyLW=DnrzwfN9UROZ1AzUG5kJ7Y6W2eF2tqAvQ@mail.gmail.com> <a70cbc1e-f234-45ba-a886-51461f2e8689@gmail.com>
In-Reply-To: <a70cbc1e-f234-45ba-a886-51461f2e8689@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 Mar 2024 10:37:42 +0100
Message-ID: <CANNYZj9Z4j=Xr6ogCvPe+rzjGeg3j6i9XvVo-+5UfCX+qE_=Mg@mail.gmail.com>
Subject: Re: [OE-core] Yocto rpm packages do not keep the modified CONFFILES
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 09:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196930

On Mon, 11 Mar 2024 at 10:30, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:

> >   If you manually edit the file on target, you might as well
> > manually resolve which version you want after the update as both are
> > available regardless of whether (noreplace) was used or not. Or
> > perhaps merge the manual edits into the new version.
>
> The interesting use case here is that the configuration file
> in question is generated on the machine using a GUI,
> while a minimal stock version of the file is shipped by the package.

This can be handled by shipping the stock config under a different
file name (e.g. conf.sample or conf.template)?

Alex

