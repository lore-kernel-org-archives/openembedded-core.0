Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E8ECAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 18:50:25 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.23207.1758221424373838773
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 11:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FAxmYwj9;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4b7abed161bso15667411cf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 11:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758221423; x=1758826223; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZ/vvLwxefRYdhkhcnXUQjQ4u2JcZmR9shgWrIok5FQ=;
        b=FAxmYwj9Vnrp2fWs81v66Qakjb1uYlNKzQ402atK0SPvVCgn3HuhKjMsmtdPla4f7+
         4MOm1pAC4HUMV0ykkWMweq3MPSJXNQNoF2b43lNmxijC4XvomyCwEOQiwNqg/QZtyrQR
         x67Qtquy8F7LfE/OcEKW/j70Z8++y+MTgygy0oqa6tC8wv5IB8XtsTKPBSAnmbYLou43
         h4m5ROZP8hXjxtQmNKh4MKQDqEUCCCgN3BxhHj6LE3qHUUddP6Lmxl+RDHZE8sZhjT2c
         zHhRdFbnz0SnYkA4IhlTUTCabmg3QDExEoFE1UQjLog8NYe4cFWlw94U9YWinVYUrRIl
         buqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758221423; x=1758826223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZ/vvLwxefRYdhkhcnXUQjQ4u2JcZmR9shgWrIok5FQ=;
        b=eWbq0ydCMFu55wVACuHFALsLswP+0HsD0ZO3CHIrJkH06C6yyr3jtkjZu9PJjzxGEK
         d6y5sq6Pyq12KGIpOCR47wNOZf9dfBLW95Une+SCxVARod+RzTaX+wite5Ax3cQYA/0W
         aJaji5EsvGBeEYxLYJQRTUMG9T7DqSz9PhJIY8LnMZAo9FyLvI+jx8I8W4a0Fcwyn3ij
         Zf/+OaxnkoEc0kvBFBfPR5Ov9yNOOJxdpjUIXQBN+S2zXAje9sQphickyB1CNrq9z0iU
         VfGZcCyRz4ddSltcIzEbcK+widaBW86GTZSJ76qliBiWe+y9VrNu0/wc/srbbtHJfKi1
         Ue5Q==
X-Gm-Message-State: AOJu0Yzq3hFENmMgiNgIwTcmy8MUHo8x84J2gXLx2nV4QmI5CP9DeH+X
	H/MjK3F5tfAh9zurArW7BGe7v9LKUFkiMnN+3qRtWwaT0V92KdeL9x4od7dymE9mnlg+T0SEOSm
	qzvCYEV6udEFDPMgFIAFBn651UdfpD2I=
X-Gm-Gg: ASbGnctN4SEYWYQg+xz7AcmpS9i1DjtajMzi2LCh8QbnNaeVJIB0W+64ezQG+ZFw/ZG
	aoP1HBCL5vdAwECuS9DFfTWmyY6w3Xpl4kAFjPa5pqmi9R3u6h7rnbJqyvNCf5rt1sbVVL2UPHl
	raL4RgpKBRM57aH3jEAsxE+flcr5yFyJQgQ4b+ZGaLZEAswfPQxwrJMcBwl/cES2M2pTUDpvhiF
	AF+2a4J+ojU/CI1n+KnjRGnrl7PLsEGT0GbXtzAmTj/uL8/DiaqNWRS5xhxL+94iO+CBumbwINP
	B5N79Um8u6TunAafu87zhYw=
X-Google-Smtp-Source: AGHT+IHLuLWxEN+/LxkHbrD2IZ3D58U7pwtkDwLvcHCAcTlZC3VJnRRgxcT9on+8sw3opRHLDfcA/g/gn2h0dEFfEVs=
X-Received: by 2002:a05:6214:21e8:b0:78e:c5c7:1225 with SMTP id
 6a1803df08f44-7991030f6f6mr5997436d6.9.1758221423326; Thu, 18 Sep 2025
 11:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250911085123.1551425-1-alex.kanavin@gmail.com>
 <20250911085123.1551425-10-alex.kanavin@gmail.com> <37DE8CEE-A206-4A35-A6B4-DAA9E1378839@arm.com>
In-Reply-To: <37DE8CEE-A206-4A35-A6B4-DAA9E1378839@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 18 Sep 2025 20:50:11 +0200
X-Gm-Features: AS18NWAxnbELyfRobYDEa4H1L6fcfuAv6NJu-b4cUuGUjzkuTd-mLs3utttW09Y
Message-ID: <CANNYZj9iy7vVvg=xgK23n0EHvwrWeP91ZkuzukaoDk_3W3xq7w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/16] which: update 2.21 -> 2.23
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 18:50:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223656

On Mon, 15 Sept 2025 at 21:25, Ross Burton <Ross.Burton@arm.com> wrote:

> > All this 'special handling' for what, exactly? One single-function
> > executable, one manpage and one info page, which should all be in coreu=
tils
> > to begin with. GNU's attachment to autotools defies reason.
>
> The attachment to not even standard autotools, even.
>
> Between various factors including how late in the cycle we are, how ugly =
this upgrade is, and how minor GNU which is, and the number of post-release=
 =E2=80=9Cfix out of bounds=E2=80=9D patches in master, I propose holding o=
ff this for now.
>
> We can file bugs and talk with upstream about some of the pain points (no=
 tags, no rebuilds from tarballs, etc sounds like he=E2=80=99s trying to ac=
tively encourage a supply chain attack) and hopefully have a saner release =
in the future?

I sat down, wrote and tested a meson.build file for this (in less than
an hour). V2 patches coming soon, but I'm really not sure whether the
maintainer will be open to the idea of throwing away all his precious
m4 macros and replacing them with a 50x shorter meson file. GNU is
known to dismiss anything that is not autotools as 'passing fads'
(I've had this response from gettext maintainer).

Alex

