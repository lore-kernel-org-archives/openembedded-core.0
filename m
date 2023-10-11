Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E71CD98FC
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 07:59:59 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.11679.1697011191124186463
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 00:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Emn57c8q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-406618d0992so62990955e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 00:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697011189; x=1697615989; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+R5P1v0Rw7+nn/ub8Y69iZ3sWTCOH28aBMP0dCcBrmk=;
        b=Emn57c8qd/koR4ro6JjPwaDF2DIthD73L+xCzGd6+eU52aITgiV7JtjczGaZJhjzb1
         5VJ5roSyj/Zrj4hmWEhGQ7OwGqF+4DyTAuh/kEO0NgBGZkpKl4anBe4BzRgUSPs3goJP
         VzaujNRlXZQIQmfeGvy5TXe17PfW67vJC8vuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697011189; x=1697615989;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+R5P1v0Rw7+nn/ub8Y69iZ3sWTCOH28aBMP0dCcBrmk=;
        b=vDF5Tl/0iXmRsi4XMBQaH69FWNqUna9lcopBEEDwmtKEkgqJAh52Du6Gp/pzKPn/nI
         aRSffHjBJTHrvX4QcXlGCLJhpWQJ1ed0Mb53GTN1nk9CINnfH7F2NZAwNaLWWZxHT2sR
         4l6TWCle9s7P2wnZ2FDpLxlCFHbLctEUhrZO4SIRxIY96cT7kenzoCCwM6yQoQU27bm+
         B+pA+7YlRzRCZ+0Peg6BOWURt5TLKsjXuBEo7qy2+Y0NTjN7/SFvHFyJHyAY6ozrO31X
         J+YVylhH9bcfkg28ZSjwPzn1FBwmGfHtC5nhOzbkkkVGzwM//UqAIiMbw8VGZ5gYJoyq
         rlyw==
X-Gm-Message-State: AOJu0YzvxTqhuAz6wTbWHtktYDKDpVTzZYDvt39d+AIqkvgNOc3OQHFh
	0l69Dzp5kRElck1CDFFhdOY2Uw==
X-Google-Smtp-Source: AGHT+IHRJbRv7ufvwW1/1IYhSu61KwETWTeZwXJ4FggmhvmRJQT9Du1guegUGx54JzXOtTO/OB1edg==
X-Received: by 2002:adf:f30d:0:b0:32d:8942:9ffa with SMTP id i13-20020adff30d000000b0032d89429ffamr240756wro.23.1697011189242;
        Wed, 11 Oct 2023 00:59:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:af0b:dd0f:66a6:9b90? ([2001:8b0:aba:5f3c:af0b:dd0f:66a6:9b90])
        by smtp.gmail.com with ESMTPSA id s11-20020a5d424b000000b003248a490e3asm14728152wrr.39.2023.10.11.00.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 00:59:48 -0700 (PDT)
Message-ID: <66dfcec888daf354f55ae0a85c6a68a2bd2994e6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] wayland: consider pkgconfig sysroot for
 pkgdatadir
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Andreas Cord-Landwehr
	 <cordlandwehr@kde.org>
Cc: openembedded-core@lists.openembedded.org, Ross Burton
 <ross.burton@arm.com>
Date: Wed, 11 Oct 2023 08:59:48 +0100
In-Reply-To: <CANNYZj9TFgmGHBk7uBZLMg30ff2s7Z5g8qrfjPQv6de_yJeqLQ@mail.gmail.com>
References: <20231001102818.797907-1-cordlandwehr@kde.org>
	 <CANNYZj_mUOxDWyT68ygkD4q5dEwP08FdAsb7JG1UUxesDorzfQ@mail.gmail.com>
	 <3acd980a-f3d2-cd5b-faef-8dbcca331dee@kde.org>
	 <CANNYZj9TFgmGHBk7uBZLMg30ff2s7Z5g8qrfjPQv6de_yJeqLQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 07:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188944

On Wed, 2023-10-11 at 09:48 +0200, Alexander Kanavin wrote:
> Hello Andreas,
>=20
> thanks for the explanation, this s fine, but can you add it to the
> commit message so it's preserved in history?
>=20
> I'd say we do need to switch to a maintained implementation of
> pkgconfig, and align with regular distros on that, Ross, do you know
> if something's holding that back (other than the usual lack of
> time/people/patience with chasing corner cases etc).

The two options have incompatible behaviour and it wasn't clear that
either have a good maintenance path last time we looked. Most software
is aligned with the version we have which is the standard.

pkg-config is relatively stable, it doesn't change much and that is a
good thing due to the way it is used. The question is whether the "lack
of maintenance" is causing us a problem, I'm not sure it is. I suspect
we're better focusing on other areas.

Cheers,

Richard

