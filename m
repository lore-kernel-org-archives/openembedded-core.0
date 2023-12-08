Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FEFC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 14:07:34 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.36399.1702044445108735698
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 06:07:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k11eIGji;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2cb21afa6c1so9192271fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 06:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702044443; x=1702649243; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B83pOSoD5Pz3svUm/NsYP2s9yYVA1IvUIIXINdErqQk=;
        b=k11eIGji/ySl2Y9isuU1k8H9wNJngpRU2emd30LA+ScaUPS1w6+nG/NPrf2PYfT2mV
         32YIdzihFdipVTU2DjBBN2YJkC0K7+89v/NEezZElElZWNULw4owCVZsPqOosfrwwAwW
         VxS+DCpdUdoYA5pf5boogNHWMa/mnKOUIszkc9ZcW4TP0i3dlMBO+vsmrjNp3k5jMT31
         qG5rnTLqbj+iLsmOYW/4N7/BIeEpeGrAE/lhTEb7lSipQGwpHClmwLLguMN8YSFWLCqO
         Wu8typXQKc9hOUXObkydFZyhP3EYhJ9c5qchdZq1nDjfbM1osBgUe5dqciYdUSWzotRG
         DZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702044443; x=1702649243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B83pOSoD5Pz3svUm/NsYP2s9yYVA1IvUIIXINdErqQk=;
        b=l6VUE3gsFBez0JxcBSCoWR1uIz9lU4S40kbhVJUIgEHYyDtCiVxv9NqCaenAjef8GK
         Rb5rL4qcBOy/lT1oxYoZrd86ywMpfpVHwpt72ce2qxH2hHBHnjT25ABg8Dg9kN3rssxv
         f/3OZRAcB/kpX/ptWGk1or6l0ezaJp77IMH3/l8d2ngZpFdQsYWZ1utUAurpV6acn2m1
         DwkIe2UJ5xlJQUe7exiou5Albj9S4hDXfGED0zK6DmAfIvRd5KM/duFgPQM2NmXPrOL2
         VP/6hIHz6bXFk/GSr0vgOyztVF24P3fzztDvwIl6Gc7dx/VJJc/JqQbZU3gSzcBYfvZi
         pQVw==
X-Gm-Message-State: AOJu0YxIYWDobpiGxgpm7LsyTNfkBnaFUxKGLLPMWK0AHp77OfYzud1i
	Gxlteg6Vu/wXlhsm4vACN026F4pG32EwhXipIhUAtbRq
X-Google-Smtp-Source: AGHT+IGtE9+L1WwP3Lm40plLlz/9Bgg85HvE7XR2MOpmYT5NLrqPS/xOAoRHpAausYQDnIXHHaW7HdPs4M4jwn9opf4=
X-Received: by 2002:a2e:968e:0:b0:2ca:961:7cf8 with SMTP id
 q14-20020a2e968e000000b002ca09617cf8mr2679715lji.70.1702044443061; Fri, 08
 Dec 2023 06:07:23 -0800 (PST)
MIME-Version: 1.0
References: <20231208095455.1252421-1-Yash.Shinde@windriver.com>
 <CAO5Uq5R1hYwo+oa4QR9bFQif57OrXbWEY0QSZfJZZHmipfajqg@mail.gmail.com> <82c9303fff1e1f728b3aa08c47d75efbf239da88.camel@linuxfoundation.org>
In-Reply-To: <82c9303fff1e1f728b3aa08c47d75efbf239da88.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 8 Dec 2023 14:07:10 +0000
Message-ID: <CAO5Uq5RLXtwaVULLQWh_atppYvO_r-qibP7AMyE7KiLyj4SAvA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] rust: Upgrade 1.70.0 -> 1.73.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org, 
	Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com, 
	Shivaprasad.Moodalappa@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 14:07:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192071

On Fri, Dec 8, 2023 at 1:55=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2023-12-08 at 13:47 +0000, Alex Kiernan wrote:
> > On Fri, Dec 8, 2023 at 9:56=E2=80=AFAM Shinde, Yash via lists.openembed=
ded.org
> > <Yash.Shinde=3Dwindriver.com@lists.openembedded.org> wrote:
> > >
> > > From: Yash Shinde <Yash.Shinde@windriver.com>
> > >
> > > In rust 1.72.0 the 'mips*-unknown-linux-gnu*' support demoted from ti=
er2 to tier3.
> > > The mips bootstrap compiler is removed from src/stage0.json file and
> > > so the same are removed from rust-snapshot.inc. [https://github.com/r=
ust-lang/rust/releases/tag/1.72.0]
> > >
> > > Drop bootstrap_fail.patch, getrandom-open64.patch
> > > as they are merged in upstream rust.
> > ]>
> > > Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> > > ---
> >
> > If we're going to go down the road of disabling the rust oe-selftest
> > (and I don't see a better option right now as we're well behind), I
> > have a series which steps us through each of the releases up to
> > 1.74.0.
> >
> > It also avoids the need for the library/test hack (upstream has a new
> > target we can use for libstd).
>
> This sounds useful, particularly this last piece. Can you send it? We
> could probably combine it with 2/2 in this series if Yash/Randy agree.
>

I've pulled that in as the first patch in the series so if you were
bisecting you wouldn't see the oe-selftest fail on upgrade to 1.71.
It's on top of the cargo cleanups I posted yesterday, so I suspect
those are prerequisites (or I could combine the two into one series?)

I've not tested every step extensively, but they all build and I've
tested cargo in most of them manually inside qemu.

--=20
Alex Kiernan

