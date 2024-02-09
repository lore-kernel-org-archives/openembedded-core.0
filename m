Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC888C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 13:12:56 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.10597.1707484368997469174
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 05:12:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kTAg57KD;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d0a0873404so9768331fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 05:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707484367; x=1708089167; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nB+d7D18N/siYRM2K9XwjHd93QGPp6dXT8sZeKsFqPo=;
        b=kTAg57KDO68grftI7ziucxgwLs1t+zM0FiVyqm2FxNI3c8ziKV6gt4JvpuAVVJKdZ8
         ROFHHGwuWpqc4k/uhKKJDsUr+jSqffA9kTsqRyUOgy6aWEU4Ri9gTmSzMLugyQCPqgo/
         ZAXX6R6VgMhOncLMShQUvP0bq9ZqSX0WyhtOD+pTzjmh6mQEi7YHRSsx4U9uYKo5fKE/
         YPZk1InYeFqS8JFAUHcx8QTHKzwbphglh2swZVgANqdMdFNRUg1EKQDu/eEtgBhQ/4GM
         ur9o/uqft5Vu/1KL5QMjjSzXxaKUbyKJjExjj3YOoRWvXYFneCQghHyV/nBCpCNktrzM
         JPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707484367; x=1708089167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nB+d7D18N/siYRM2K9XwjHd93QGPp6dXT8sZeKsFqPo=;
        b=qqb1v3mYl467cm8CRsyw3d0xzCio16E4UYu6j4mY1ZmGwJOD+vMvyMBRzK+CUbUFYK
         zxJUM3Z2D3bP9b75508csrr+TrIkyWgrCt4ZEJDwuMWAwXDXuntIvZ6BBuq2qghRhJRi
         WVEva7pSiler1c7arivvH4uGYs4reeseP3co12OZCoW0QAd5/6J7g4nli79CBfNksMG+
         QuWJhR+njeODgrkSiX7hf/f7Z4U7caZusH0O0fgqi6i8e8iRrtFL+0Sz/69nHah+/aPT
         YQFT11jd2bu6d0z4IBPeFW2zTYcvQkS8eryxwdfExkckpLGCbipJYOkgXAyKWAr8FmLM
         x7ww==
X-Gm-Message-State: AOJu0YwikUw0lxlzPgOiUvqFcw5+4y2zD6ldKBuy7eATgaNlCjE2ntxg
	C1RHZfb1bWtjHow8wakigvbPnrbN2ftHOxY1dIhkrdHyrpCSiwUkUMaj+Fff6wcr9yEF61dTci1
	h1jyGzGSPvXcX10SDC93QN8tTuPk=
X-Google-Smtp-Source: AGHT+IEVJ1Grrq5ZLqWDOOH/9GTE78coYS4PXHE7PH9ga8l1/XH228Q2+lkhXQSHboVfZ7QcGzczCyJcVjBVE28z1k8=
X-Received: by 2002:a2e:be09:0:b0:2d0:d79a:2d97 with SMTP id
 z9-20020a2ebe09000000b002d0d79a2d97mr1600474ljq.19.1707484367063; Fri, 09 Feb
 2024 05:12:47 -0800 (PST)
MIME-Version: 1.0
References: <20240208185641.2969396-1-alex@linutronix.de> <C6BC277B-9507-40DF-94BC-3B71E06CFEB6@arm.com>
In-Reply-To: <C6BC277B-9507-40DF-94BC-3B71E06CFEB6@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 9 Feb 2024 14:12:35 +0100
Message-ID: <CANNYZj9uH+0Uhj9GN6wxKHXuZzGvnkzjydUJ4eD1xu_mi4V_WA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] shadow: add a packageconfig for logind support
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 13:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195208

On Fri, 9 Feb 2024 at 13:33, Ross Burton <Ross.Burton@arm.com> wrote:
> > +PACKAGECONFIG[logind] =3D "--enable-logind,--disable-logind,systemd=E2=
=80=9D
>
> Would we want to enable this in target builds by default if systemd is in=
 DISTRO_FEATURES?

It's a new feature in 4.14. If someone wants it, they should find out
what it does and whether we want it enabled in systemd builds. I'm
only ensuring it's off by default and isn't floating like it was
before (especially in native builds where hosts can contaminate it).

Alex

