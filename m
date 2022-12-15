Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9877C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 16:08:42 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web11.138065.1671120515759131295
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 08:08:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VUJnyQ5F;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id q190so5312629iod.10
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 08:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ULRIXVWBsP8JO7UIFd8L0wlCsaT0pFGxDoTrICb/lA=;
        b=VUJnyQ5F3Y6slPUhpWGESgk1l7a0252WmXlese7w8aKMVbol9jPcDWCVu2IZCPymEl
         adYR4q891npTziJ0laZ4rkcX34jzGl6HwtgjFtbKH19AN5kFq8dNxwcQS0bkOSqKv+ee
         fvboBgW9igJj+QWYrcNMEmN6QK4/c94Spd4N1yMmPfG1l+UGhT6lYEckNawOMDMNCdle
         dJrSvIJROQZkD+UcnPdgKSphKi1xmplwnH2R+lkxlM7iQQZJAG7mrhGmd8Tu4EN+Wylu
         EzTxbDyPG0ceV6H2rzanP601GoW8TrySpa9Q5UxnOwOtDnaaPdZGGW/3WHWeo/kLOq0w
         wyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ULRIXVWBsP8JO7UIFd8L0wlCsaT0pFGxDoTrICb/lA=;
        b=oslDBNMrT6hYj4+NZ/w7MI5ndzx1au5L3VzlpimlAdDkImgqmf8Hz+WQHMAwM7Pk88
         X0fi3mavR5IBa2Fs/60L6fPHAJbqZ6/k97tzwllA7WoO+nN5AyoF4JdTxd5jBgKDj3dW
         VoonT0jxoZqDnEE/w2eoVm5cpXOBl5Wrj+5kIPo2d0Igy23dtxYySGWuCCXCo7+UF0x4
         BwrgbpPzX5LR4PC+ZGSB5b02JjcfVD0hTmXYQ4zXyA1t4GuDPgSUgXvl1O+JtYviHq39
         g+C9F2VaaDzUGka+xrZLxWJheI4bQPVPUOrbN3+PgbcQ3ZEkLNBw/7v/ApDG2AMNHzsq
         zx1g==
X-Gm-Message-State: ANoB5pl1zdRKFe1VpHGcX6RQl6WYeK4ny9z+fhcoKReHLmo9aX3sIsxg
	3Nx6SvzlBEOMZBGUcv2qsGCmn+bPidG6zMCK14g=
X-Google-Smtp-Source: AA0mqf5b7X+aQ7Xfvwm1jdd8G3u48Uxa2Bhm5qjh3LAoopRsCKvdEcLoTZucnMyUWUrlpX13CEYog8SwvPU2FMFQRKE=
X-Received: by 2002:a02:a88e:0:b0:38a:1efa:7053 with SMTP id
 l14-20020a02a88e000000b0038a1efa7053mr14459289jam.173.1671120515127; Thu, 15
 Dec 2022 08:08:35 -0800 (PST)
MIME-Version: 1.0
References: <20221215073224.3061128-1-alejandro@enedino.org>
 <CANNYZj9qbT+fGQ=18hjLkzR4D=eyr1amX2qxpwM5u_XQTqLo3g@mail.gmail.com> <CAHMutrae2sCtGqa-aXVYz1_kDkCtnY2qjKLhGunA-U3-ZxthnA@mail.gmail.com>
In-Reply-To: <CAHMutrae2sCtGqa-aXVYz1_kDkCtnY2qjKLhGunA-U3-ZxthnA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 15 Dec 2022 16:08:23 +0000
Message-ID: <CAO5Uq5S2reaaVJe7hZwL2okWjKBbVhU_=g6bMjguQ7T9UNC-Vw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] rust: Enable building rust from stable,
 beta and nightly channels
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 16:08:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174583

On Thu, Dec 15, 2022 at 3:38 PM Alejandro Hernandez Samaniego
<alejandro@enedino.org> wrote:
>
>
>
> On Thu, Dec 15, 2022, 3:05 AM Alexander Kanavin <alex.kanavin@gmail.com> =
wrote:
>>
>> On Thu, 15 Dec 2022 at 08:32, Alejandro Hernandez Samaniego
>> <alejandro@enedino.org> wrote:
>> > +RUST_VERSION =3D "1.65.0"
>> > +SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}=
-src.tar.xz;name=3Drust"
>>
>> Adding a manually set variable adds friction to updates. Can
>> RUST_VERSION be set instead with a helper @function from PV?
>
>
> Hey Alex,
>
> I agree, and ideally yes, I tried to set it automatically to PV, but, sad=
ly it conflicts if we try to include rust-source.inc from a non-rust recipe=
 (This is necessary for some recipes that need to have rust source availabl=
e to them) since it uses the PV set from that recipe instead.
>

Is this different cargo/rust versions, or something else you have?

Basically I'm on the same page as Alex - updating this recipe is
already quite painful, making it any worse doesn't seem like a great
idea, but I guess you could argue that rust/cargo already conflate
their versions in the current usage.

--=20
Alex Kiernan

