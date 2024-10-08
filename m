Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8874ACEF142
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 09:38:10 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.5060.1728380283364785487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 02:38:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UcFgWVTC;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5398f3be400so6078131e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 02:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728380281; x=1728985081; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9D0umBZlZcquqhLIchUb5hFDGNOFjheN115J5LDmGw=;
        b=UcFgWVTCzMugmsoLrZN30IoO5FZQ1wyi2lGpU69U9aNIRZeGjbMJhTOZyV3tXP5w0c
         /NfGzNmrzR4tntbWm/HFdwBRDAfN8sgWaO01UwV9x/jazuLkikMAl1Aqv2IvNnODKpA1
         X0c24T/D34EeuMzR29V9tGZ1Lc2INTQ8d8LUH5RIdHL8P+Uhevv7WQFkpLWtVWqiXGhS
         eg6lYMPTDtV1MVUO4kDXgdOv1e49ftq94nh3M8e6bgyOfLwKzErWKU4Q06m7jsdy6yoS
         AtHKucJRbVPxGynK3E1AmOfX6bh8Ly7njNOa4/XIiovP/alPdWn5p9xMVhEfbxWR7h87
         08zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728380281; x=1728985081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9D0umBZlZcquqhLIchUb5hFDGNOFjheN115J5LDmGw=;
        b=RhEJRSrJabKDWEhWMjngoBZXg0a31Lrqrd95Bii58J3erORjGqMq1UIww9E6M75C6J
         CClS6ylIFUeoUAvFnYmu1kxMj/zO8dQ1Afy9nPzAFfopw4qMsJu8iTeLeWHqKM0OPxEX
         e1mzOioT+UcyDDa/u7eMHB2keLgzmojKwUcb6ynRem7LVt4dsR+VV1KiWIIaWUvKw4W9
         AGu1rTAc/EqeufY0VXOmphZMmG4M/Fg0QRRhJjugzlAUJvpp64XaZ6PwnSRRef5zaxdd
         AZ7tbWqxBIjphyCR0E/WCPa+TUJGpsXKc5mWgzHZSZMsEC8MMnqmSSGkeV+JszikH1a/
         TEbA==
X-Gm-Message-State: AOJu0Yx+yawpvEoDzClGmb2riA45J6qSrfihLnuR9Yh6zu8reHIPL8sx
	T5DI8yJeLWJgLNpwF36tfml4tfJvANFl8aAVKezzEWNhdYV7sKZg7yyJkGFyn44L8p5Xc0iMbQ8
	jzLAz4oogz1Th+a06+ndfv9GAb+A=
X-Google-Smtp-Source: AGHT+IHtfdpN8ncuI+E41/wQmFQH6K71xtRPXHhuV1XQejf/5DCaW/ob7ELOBqykZGH5tZonkkv/y0IRorWhTS1tZe4=
X-Received: by 2002:a05:6512:12ca:b0:538:9b5d:9885 with SMTP id
 2adb3069b0e04-539ab6d851emr7404472e87.0.1728380280890; Tue, 08 Oct 2024
 02:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20241005004451.79575-1-yumx@amazon.com> <CANNYZj_Z87h02RJuzXVTgpb0eLsJRapWQo4sXySp45uL0B+dkw@mail.gmail.com>
 <D3848342-F053-41A2-8334-0B22901E9E23@amazon.com>
In-Reply-To: <D3848342-F053-41A2-8334-0B22901E9E23@amazon.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Oct 2024 11:37:49 +0200
Message-ID: <CANNYZj_Q7TBW-t9npWGdEPD45jAe3W2w9iaA9wy=8h7X55yd3Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstate: remove corrupted artifacts from local mirror
To: "Yu, Max" <yumx@amazon.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Sobon, Przemyslaw" <psobon@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 09:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205285

On Mon, 7 Oct 2024 at 22:09, Yu, Max <yumx@amazon.com> wrote:
> Corruptions are unavoidable part of our life, disks and network can injec=
t failures due to unpredictable and unknown reasons like https://www.scienc=
edirect.com/science/article/abs/pii/S0026271421003723. Even multi-layer pro=
tection is not perfect as it depends on where the error is injected.

I'm sorry but I am not convinced. You are the only one reporting the
issue, so I don't think it's unavoidable.

> We proposed this patch as it is aligned with how we currently handle inco=
rrect checksums: https://github.com/yoctoproject/poky/commit/672c07de4a96eb=
67eaafba0873eced44ec9ae1a6.

What the patch is doing is essentially -c cleansstate on a cache used
by several consumers. This makes it a non-starter: you can't remove
items from live sstate like that. Once an object is in the cache, it
needs to be removed offline, or replaced atomically if it's corrupted.

Before we decide how to handle corrupted items, it's perhaps better to
consider first how they should be reported. Then users can decide what
they want to do with that information without yocto forcing something
on them. So please: how can I observe the issue?

Alex

