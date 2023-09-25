Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFEDAC2FC03
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 18:05:14 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.68393.1695665113877989204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 11:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HTzW9qzb;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50437c618b4so8992323e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 11:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695665112; x=1696269912; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=36tC+yA8lCwBC3gz9jofQ4uRquiXRHu5UCQyJKzev3w=;
        b=HTzW9qzbDA1FiWpI0luay8sPfOJK1DsJWXtUpSB2fA46+VyKBUsNkV9r7mph3k4YQE
         V1EthlksOUQp+0wvdWCjcX13IqkWyHT13zImR4yIgG8QeqjlrscpHCthoaBxCht44KbN
         ZhQBj0xFWTdiiXxGCbRXHvzrYRGtzIwX/ZY5uzv1sz+CSP08GKEmWDxnIJfPjBUcEHFL
         z2R+Pd0w4RbuETAeZWiPyeuA9CQYqW2+UE9wOHWaE/1g2hEF25yA8lgticlUnGhQ/+4c
         w0bSfXvLhDpg1u92USg4pc3TTnbmcqmPT7oT0aEvF/3x9Oa2kRNO1aDo3Ucyhvd9ovS2
         LQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695665112; x=1696269912;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=36tC+yA8lCwBC3gz9jofQ4uRquiXRHu5UCQyJKzev3w=;
        b=tIx+O11o+WG3aK6vRCVdlrjBtcx/bMptkEkK1piuRouNLm/cfovPu1i3aZMYWCuyLZ
         9KV9fSq12pZ5uzK/hUSWImR318xP1YBMfAFm8MjtqTgcnh+Rk4Fd/TnXRugsNejxXXo7
         8niI6wokJjTT3RWaGNb37UOK4881PPn7fvpI2cQ41iLhRyqMlDWFMoKTFGV+l10e65vk
         ZVXhG3tjpfqjy5IOWdPN9SDoijHHe+T7W4HfTdoU1kxZE1scW0Q8SVdBa3z0nUs2lLQ7
         tyFwfrxE2b8tFu+bA/FZZ/KurwoKK1GzmnqQPDrzmJOVqoLVwYpIuhpWh4wQgXjYR6pl
         687Q==
X-Gm-Message-State: AOJu0YzHFcHZz3gGdIlSqQM/vbylEkvDuQNqG9k7DW7e1eTcKy7j2P0T
	mUMKHA0bc5RaYgTsRq7k69mqcp6GRI2zkohvHnU=
X-Google-Smtp-Source: AGHT+IFJyOCWEvcEPO8bK7znEaJxZAYPg+g6XhZ9lxqRD3WUE0mWAU0IXqP5TrGJ34VhUuRMali2doQyV2yGwpWXzw8=
X-Received: by 2002:a19:8c10:0:b0:503:2623:7cfc with SMTP id
 o16-20020a198c10000000b0050326237cfcmr5383867lfd.34.1695665111728; Mon, 25
 Sep 2023 11:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230923204507.882395-1-raj.khem@gmail.com> <20230923204507.882395-2-raj.khem@gmail.com>
 <CANNYZj-9wiNejuCKxtcT5_Dp9uG8y54E+qV_RBD1SCCd-HcF9A@mail.gmail.com>
 <CAMKF1sqzGZTZj7CfrkZPf=C=H4wDYMV1fs3PLo4AKZ2DW2kV=Q@mail.gmail.com>
 <CANNYZj8fv9T5qRyuZ=OHSH-zdfJinKXF4XRW2H8DSpvGFMCo2Q@mail.gmail.com> <CAMKF1soNZGSAH7hYRbVwYgVP4uyo8Oe8MQoTcctt2ietFfQV6A@mail.gmail.com>
In-Reply-To: <CAMKF1soNZGSAH7hYRbVwYgVP4uyo8Oe8MQoTcctt2ietFfQV6A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 25 Sep 2023 20:05:00 +0200
Message-ID: <CANNYZj_Z-odE9KEW3HutZLCyNw82GeUv=E_rjk4yZwCLqpX+LA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] glib-2.0: Remove failing ptests on musl
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 18:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188206

On Mon, 25 Sept 2023 at 20:01, Khem Raj <raj.khem@gmail.com> wrote:
> > On Mon, 25 Sept 2023 at 19:21, Khem Raj <raj.khem@gmail.com> wrote:
> > > They are not triaged so no root cause reason is mentioned.
> > > The failures are listed in commit with some details that ptest shows.
> >
> > I still don't understand why the failing tests should be removed. Just
> > let them fail, or exclude glib ptest from musl CI altogether. No one
> > wants a fake green status.
>
> This helps in creating a baseline so it does not regress further,
> while the information
> is still maintained in the recipe if it needs to be triaged further.

This I can agree with. But can you write a better comment in the recipe itself?

Alex

