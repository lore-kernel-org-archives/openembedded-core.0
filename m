Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB34C25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 16:58:21 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.66296.1715619498208993235
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 May 2024 09:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UBGS66yq;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-23f59d71d10so3107113fac.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 09:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715619497; x=1716224297; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dLQd4QXxmXAxBKqr+SEA8rLG1MERkQfEaVTxym2QUo=;
        b=UBGS66yqamSQbgrHgMh9gsm+eiWvjKU077OB5pbus3kRMWbg8XPF47oUtA3WZkHyvk
         OH0aVt+RQq0+rVrt7wcM9RMvUBO8zISxdo3hp0o75Wr24+MddbEe6vzMuaFiA3NIr148
         P1/UjXc/aeOOBXkTeqPahw0SBCQldYw0x1lWT53eJ3C3PgiWHn4+3s7AjiUJBqbF7HzN
         YGrXCRRNt5c3c1FZdfIU+dvTPacAuwqaemxl8OmzhZ8I9i900a5ssGADyDcdkEslmvcg
         3xub8/i4v04xYmOOW0yfB4InVnhxUOZPjku1rX2+60ceb4hXkb1sgoxvOWrtLZ6vFtS3
         ltCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715619497; x=1716224297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1dLQd4QXxmXAxBKqr+SEA8rLG1MERkQfEaVTxym2QUo=;
        b=m5oXjkteOfy7dA4gESZ5uH5oFnCJJBPnrGJOq0643DSghXcVHX75rq18o79/iKMsRz
         8cNacS+sFyacjuqvd6MeYnNDd66HNKJLNKTilKySxSPhqFRU3hPYe1gFENeJWUDkUujg
         xsjw9P1z3vAf2x//ej9n2p3dOJFH4qLkoqxtv6wfg9xmQ8yY6AFiZeJVVkdTSdpWstd1
         NGJLrt6YUHRE/6w8uw/zCL+xcCMm1iMJkxmJHjWVLXRRR366G+NVNMwbwJns5itwhr8p
         Mgsb3EW6bHzx5UfAjg7oDPKhYxUGfPyU9R9+eJ1WVyZXoPnQtTAcpg4Ap3JIKAytcGR4
         vY8Q==
X-Gm-Message-State: AOJu0Yw8DKDd86VXQMzczS1n2+gqxRTNTJgILdSJZ1+0pFhKug3rdjv6
	SX+FhzgoVFpvYVLqTtYXoeJ0cJXXUivUVB/8qlgP3+uEwf1gygBUs1XvNhsk8pcVGGFqYaTmXam
	UQUIvWyC/U5K+RHSljUvYiX9rMI2fBQbg
X-Google-Smtp-Source: AGHT+IE32TApvbR2tbe5M8LZsOMBDXjIg078e1QmFWunmEJke8t87JGqNKX5zMKrXEqszVrgJKmkBtds3y7+Vm5Q8gs=
X-Received: by 2002:a05:6870:4414:b0:23d:417c:675 with SMTP id
 586e51a60fabf-24172f6cccbmr14745703fac.41.1715619497392; Mon, 13 May 2024
 09:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240511162231.4102212-1-raj.khem@gmail.com> <CANNYZj9yKE4RAUqqZic6v3jSt7Q1bmDeE2MGBmyHOxUN0-2nJw@mail.gmail.com>
 <CAMKF1soUrT2TNoSJG7hmzdAcKa-jmvrTyUh_YHdfEcEPKqg4Ww@mail.gmail.com> <CANNYZj-U=zQqHj6WHmghXRTF1Vz-s68LrErXtoK7g9k2KGA75A@mail.gmail.com>
In-Reply-To: <CANNYZj-U=zQqHj6WHmghXRTF1Vz-s68LrErXtoK7g9k2KGA75A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 May 2024 09:57:51 -0700
Message-ID: <CAMKF1sqaZFXDUroRuM1AnjDDMwvOGv85yjf_CQjUSxC2yk9NCw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] valgrind: Upgrade to 3.23.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 16:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199246

On Mon, May 13, 2024 at 12:06=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Sun, 12 May 2024 at 22:19, Khem Raj <raj.khem@gmail.com> wrote:
> >> Please no pending patches. Submit here:
> >> https://bugs.kde.org/enter_bug.cgi?product=3Dvalgrind
> >
> >
> > I am aware of it and it=E2=80=99s working in parallel, I guess it=E2=80=
=99s better to submit it to Debian or arch first and get it tested there th=
an openembedded perhaps.
>
> I don't understand. What is working in parallel? Have you submitted
> the patch or raised the issue with upstream somewhere? Where?

I mentioned getting it tested before sending it upstream. I am using
OE to do that work.

>
> Alex

