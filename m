Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6629C47258
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 07:02:15 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.9036.1706684527660779257
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jan 2024 23:02:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H+jq7rzE;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3be3daeff38so1426258b6e.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 23:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706684527; x=1707289327; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPBAC2sONkdM5tDzRgzLGWUBaGbUAKX9ocpm0p0EKLU=;
        b=H+jq7rzELS7xYeyQiwQ0/aJ9WTracOqQtEkCj6y+QFrLmPtW1Bt3DEJYyxqytONN2x
         Ts4FAAdreZOmVKW1HSuItwzx+Dhw/QJvQgQdhkvbl02Vye1z3n0lKhalA+JY6ovWztnt
         9i0yi8XqlByT2QeHSSE0D9g2b6n6Fse+wtcOO3vqTWZUPzcrHq+uBJE0iQugbHyC91+O
         dqTO55a3+vTRWumtYn2lhBV4O3KNQqtf4JRMzq+Zbbfgak4hW5vvI7Moulu7nbZtY+22
         cVUUaNZKbhJd19MwdUJHNi9srBlYZFVvvR9wNOjz37gvgKsqAGA1hDXiO8+HjKX9TMAX
         Bgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706684527; x=1707289327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPBAC2sONkdM5tDzRgzLGWUBaGbUAKX9ocpm0p0EKLU=;
        b=QrEVdbUxwNHEmGT4Yqrxb/2co8mkC9VyTNjDnceaYRci7oR0HVbxkK3CyU3ibyoAze
         YRB9NZVQvXiTKtznLlAtyZQBf2xUkBQZHJy7v16U2Z65wLwal59hxBq2pral+ZRU0gfq
         8MKm4CrANLUpEbsiPN8sAwyQBVdVoxFIVGuIn6esLIQQud56YubH+iAgEawbxWXi7XH6
         NP2lfO6Wyvzs/GYuKLmQdmcW4dI0jHPjWbHpOFbeLtZaJhhOR8plggrut3MvXem4smUG
         9UU6SwST5TxfIuY9N6JwJG7u1/5is1uFH1l4br0OpegPJVODJx9wcdpMTVwbr4Kd2Yh6
         xSyA==
X-Gm-Message-State: AOJu0YwVb5CEkpZfObSkMtfeoiMBuWnqtwiuszm3caaGLCap2yA1wP1U
	9Umyfd1x/XLDwcdfIN4g913QWYrttRAgRJV8Il8zLDGIz2hpPBRu6yJSW1CMKe0aixnrpLA+vph
	x/jycDTEG68jn3pmF0fYp64bXHpc=
X-Google-Smtp-Source: AGHT+IH9LjIDXqTt1+CLKScANQqhoXjiacFEKpBBPzgbZsHbm//ZuWPlt6AUhz5vETCGETLn8KAeaITu2sUut2eXQG0=
X-Received: by 2002:a05:6870:d1d1:b0:218:5d2b:73b6 with SMTP id
 b17-20020a056870d1d100b002185d2b73b6mr803138oac.54.1706684526721; Tue, 30 Jan
 2024 23:02:06 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1srDci3KN9GdeeXVoBr2R=Bgbo07zPFGSsk5VLYAfzSYLA@mail.gmail.com>
 <10032.1706678833265291851@lists.openembedded.org>
In-Reply-To: <10032.1706678833265291851@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Jan 2024 23:01:40 -0800
Message-ID: <CAMKF1spL1-vYOK0HX3UK2e5==FEWemrOZ=RT5d9r9+m7q=e4UA@mail.gmail.com>
Subject: Re: [OE-core] How to enable libstdc++ Pretty Printers in GDB #poky
To: Rahul Chauhan <rahulchauhankitps@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 07:02:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194510

On Tue, Jan 30, 2024 at 9:27=E2=80=AFPM Rahul Chauhan
<rahulchauhankitps@gmail.com> wrote:
>
> Hi Khem Raj,
>
> Thankyou very much for quick solution.
>
> I backported patch and added below line in local.conf and its working fin=
e.
> IMAGE_INSTALL:append =3D " gcc-runtime-dbg"
>
> but but when i am checking info pretty-printer i am not seeing libstdc++-=
v6 in the list
> (gdb) info pretty-printer
> global pretty-printers:
> builtin
> mpx_bound128
>
> But I was expecting
> (gdb) info pretty-printer
> global pretty-printers:
> builtin
> mpx_bound128
> libstdc++-v6
>
> Can you please comment on this?

It is loaded on demand. So put a breakpoint on main and let it run
till main so that
it loads the libstdc++ library and then check again.

>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194509): https://lists.openembedded.org/g/openembedde=
d-core/message/194509
> Mute This Topic: https://lists.openembedded.org/mt/104030581/1997914
> Mute #poky:https://lists.openembedded.org/g/openembedded-core/mutehashtag=
/poky
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

