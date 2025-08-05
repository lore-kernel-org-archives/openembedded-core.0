Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F202C87FD1
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 19:21:27 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.7816.1754421685545811134
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 12:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q0NIizpE;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7086dcab64bso48213147b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 12:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754421685; x=1755026485; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oEb76fqbLH/8BbjXR9AM04K52BpHdFT14VFlHuzgQk=;
        b=Q0NIizpEEqJXQN69WaQiMyNHxV/shINhIc0b6SqT6joDURPOABLcEsUvln7EwL2LPe
         qh6OhjURtcotWFMH8Gtcsm/YXGWU60cStRQAtid30diA9C60DuIlwyP+yC8Nf7eECFor
         gZ3vSy3+qftPB2u+AOdHmGQOQhtIvSP8gHCLExTXff6Pv5ccWCoZ4LLJJ8VX7UbhKtib
         +/w4KEx6USlpX+x9/IJFaG7evQEF/7D8Pm8tJ2wyPFdyINM+jDgXY7vYCC8rxAmOyiyn
         rR+RTyjLeDTwj3LtbmMYid4I37CTvMGY7MJGt8SsuxnAcleHbmEqOkLwM2LJ5QXHnTib
         VzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754421685; x=1755026485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9oEb76fqbLH/8BbjXR9AM04K52BpHdFT14VFlHuzgQk=;
        b=qXrY6i029EnE1TkD2+iQAHen4bO/v2+3d5FDEvjqnEvLNKBgryOZdiFbQylQVBYW9U
         tOxmvNdU1xi+ZlsxudArwqhPCJ37jW8SwMYDHiQhJgZot7QR86Ax9qoUpmlJkNGsRDWh
         cP4UQnzdbmfVeHFawC7Pb94mfE3kbt/5/vwqXW0w2uxdexCClTHdsvL2jG4x6vSi2Mx8
         eb/N7cPHZSL/SPmkn2YzTmGc6Lp4WvY2iYK2sIwj2WwR7zJkhvNrXiUuGy92+/Wfn93E
         sSFKIzy9KUtaKQTeTzpMFwS8uZJtVM3o9xBbmG5VAxzA22efYrKcSvLWSa8pKu8GAjVm
         PaBw==
X-Gm-Message-State: AOJu0Yy2SAtrHFlHoZB7axpiS73OZpQWM3i7nylGaO2FMyB2bY8As2tl
	iJFjwl/T03Kxl+FbFAh57lFxka0PgOMATtxeg8HQ2w7/y5kurHPU8b/TYf9pmQwTppGNd9WlQSb
	rTYlvTKsFN8J1ssgYHNmqf0hAj+xzR/Hy32plFRk=
X-Gm-Gg: ASbGncu0tTci7alqGdzAd7oGulIEPyiAX45qfh2ihrQi7QWUNZ3EDeSkyEdwt6++Ym/
	rKtxlRBpsntPtcBTp+ywCzTf+wuQaii/88JO3CZAqnf1DPWV6nAtxSnw77pdHOXDeCfAqwOriWV
	RiS3u7fkAJnIXlThQkj1wV5aJGq/AKItd+c3+0i8vUX4EMRaph3/fcdsvu6x6bQKKQu7Oi+8uo4
	6W5RpZK75QQyjOc5n1oq7veBiPbwi+eX2o=
X-Google-Smtp-Source: AGHT+IH8UEzjV7t7zaQ83trG68lCV7pOZdqvxMCXVV7KFlnNAZwG761374EiY3+NDYAs4rU8sjB1dj33MyAYUtyVoTY=
X-Received: by 2002:a05:690c:6e0d:b0:70d:f3f9:1898 with SMTP id
 00721157ae682-71bc98603fdmr6084407b3.35.1754421684590; Tue, 05 Aug 2025
 12:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250805191115.608912-1-ross.burton@arm.com> <CAMKF1sok7LjqPQGu8ekCmaH+Yr7AbK2i2s2yn23n=urBUDDaBg@mail.gmail.com>
 <618AA413-A007-49BA-96EC-4D2041A53847@arm.com>
In-Reply-To: <618AA413-A007-49BA-96EC-4D2041A53847@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Aug 2025 12:20:58 -0700
X-Gm-Features: Ac12FXz4RjpjaxYzLL14xzT9z67JLYGVcDgmdwMS7GonZ7-1z5bqoJeXgnCrrpM
Message-ID: <CAMKF1srzgeXoTAQ4Q=LdSFiAYjD7yGiXQBJEfxFLXM5hhSJFcA@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] clang: split llvm out into a separate
 recipe again
To: ross.burton@arm.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 19:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221490

On Tue, Aug 5, 2025 at 12:17=E2=80=AFPM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> On 5 Aug 2025, at 20:15, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > We do assume clang-tidy and clangd as part of clang package which come =
from
> > clang-tools-extra, I think it should be kept building either part of
> > clang recipe or a
> > separate recipe I am fine either way.
>
> Do we actually though?  Is anyone _actually_ using these?
>

Yes, clang-tidy is used by our CI pipelines, clangd not yet but it's
used as well from outside OE.

> Ross
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221488): https://lists.openembedded.org/g/openembedde=
d-core/message/221488
> Mute This Topic: https://lists.openembedded.org/mt/114554152/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

