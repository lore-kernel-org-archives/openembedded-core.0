Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CC6C10F1E
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 21:36:17 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.147157.1671140175226384623
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 13:36:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aDtx2E3n;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id e189so347532iof.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 13:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeohL1GJrhQJd1qTEN6Yi/Ec4qKftFcqoaBd1TS2w6E=;
        b=aDtx2E3nR1R9N3mBjbYJYyCPvXW8TbNDb+tXDn42MD99V/azrMD+ojyTLgtVAF30IO
         AhhCu90JYPPsNBvQk6OAwzhn9OywTtrrlZEMIfrKpQaCi+gWKZ79xjLYkWa9eh1OHm1R
         bSxvV19rlTcpBDoYzj4q8w7yIq7tP5kYYKeSjb3TRua62r0+K7jc4uXgRVrMJjdZUr2A
         IDEgjVaOoF2GzElhHHzZDWMRydzsGQL8xmvPQMm1DJ6blO45l67J6YM5UIyjpnq7qeya
         AOdwE7f7e4Sc7Q2meZMCi7SF8xCFQBcm+qRUsBom8u4FAEspTJoB1hkpgcsZ5GfQqCBZ
         C9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XeohL1GJrhQJd1qTEN6Yi/Ec4qKftFcqoaBd1TS2w6E=;
        b=r5kYZi/GhHRcmB+e7Rx+yNsn6mJHs4q3cKutz+RnE4jWRERm7ufxcizTWAvjb9CHX1
         sWLUfKq3ZiCVgtAV8hG5lgWKy9JppDadviwBkIffx4mxuvwu0FCjCxJ13PPkq/rXHLhM
         jw0poaNBFbzuWXp+S+Sq8idyrIfmxduuClg1no5wQ+SyQVTO7cEpVNRhF1qeV/A9/A48
         y2ayZqyXa/te9rBNqENfSfi/5a79COuR66L2mCv+5Te5uGgLHDPQ/IEBXbLvC5zp2Zyo
         95NH9qw7hU3uWjuw6M7Uq+2pzveKSXetEmgiq4kKe7XDoWXnvfP8EZJNt6Uz0LSfZj7R
         2U+A==
X-Gm-Message-State: ANoB5pn/ez/AC5Hd+AC30dL9L4qLHbN2jEtYnuTFIdHlLxQhhJUgdkuN
	qhcIjXcUvCZqG0BvFTcIVoVzWQXNfzWzCB/oauI=
X-Google-Smtp-Source: AA0mqf5bs7vkLVOjoilFluXcsl060KlQExl2/GYmds8xuk2an7voSyQzxa8hjQlRAJ3BGTY/7E0uMj/uuTMqO0ukCzQ=
X-Received: by 2002:a02:a0c9:0:b0:376:21a3:969c with SMTP id
 i9-20020a02a0c9000000b0037621a3969cmr45315162jah.318.1671140174357; Thu, 15
 Dec 2022 13:36:14 -0800 (PST)
MIME-Version: 1.0
References: <20221215073224.3061128-1-alejandro@enedino.org>
 <CANNYZj9qbT+fGQ=18hjLkzR4D=eyr1amX2qxpwM5u_XQTqLo3g@mail.gmail.com>
 <CAHMutrae2sCtGqa-aXVYz1_kDkCtnY2qjKLhGunA-U3-ZxthnA@mail.gmail.com>
 <CAO5Uq5S2reaaVJe7hZwL2okWjKBbVhU_=g6bMjguQ7T9UNC-Vw@mail.gmail.com>
 <CAHMutrZnL2e4_7AuPkacEb-Rgyw0cb7eaErjWRuXZYXu_fUZgw@mail.gmail.com>
 <1731096B411C6A99.9432@lists.openembedded.org> <CANNYZj9BmxffYxhd1gWy6dUBcsjHi6kXgswC=4LVXUnePSOo1w@mail.gmail.com>
 <CAHMutrZhNPdLoiFTfOVvHiqqeYwSOyPB3v2qmmy7BUoraj=GZg@mail.gmail.com> <CAHMutrbJo2ocWz88UbQsRjBDccXr0yVDC60SZ35bdMaXHw8LAw@mail.gmail.com>
In-Reply-To: <CAHMutrbJo2ocWz88UbQsRjBDccXr0yVDC60SZ35bdMaXHw8LAw@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 15 Dec 2022 21:36:02 +0000
Message-ID: <CAO5Uq5QT1zg1jC0wHFMxv0T+m7y_GSS2Wdg_vbuG3Yi5hOZpgQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] rust: Enable building rust from stable,
 beta and nightly channels
To: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 21:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174727

On Thu, Dec 15, 2022 at 6:24 PM Alejandro Enedino Hernandez Samaniego
<alejandro@enedino.org> wrote:
>
>
>
> On Thu, 15 Dec 2022 at 11:11, Alejandro Enedino Hernandez Samaniego <alej=
andro@enedino.org> wrote:
>>
>>
>> On Thu, 15 Dec 2022 at 11:03, Alexander Kanavin <alex.kanavin@gmail.com>=
 wrote:
>>>
>>> On Thu, 15 Dec 2022 at 19:01, Alexander Kanavin via
>>> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org=
>
>>> wrote:
>>> > Ok, I think what we should do first is to actually drop the version
>>> > from all of the .bb file names, and set it once, inside some .inc, an=
d
>>> > probably next to SRC_URI and tarball checksum. Then this should allow
>>> > a convenient scheme for including and overriding things.
>>> >
>>> > rust_1.65.0.bb - > rust.bb, and so on.
>>>
>>> Oh, and upstream version checks must be kept functional. It needs to
>>> both correctly report a newer version, and match the recipe version
>>> with upstream if it is already the latest.
>>>
>>> Alex
>>
>>
>> How should I test that upstream checks are still functional?
>>
>>
> Actually how would this make it any simpler?, if we remove PV from the fi=
lenames, the correct place to put the variable is in rust-source.inc since =
all others include it (rust-cross-canadian, rust, rust-llvm), if like I sai=
d, rust-source.inc gets included from somewhere else, wouldnt that override=
 PV for the other recipe as well? beating the whole purpose of the change, =
this, or creating a new .inc file just for this seems too convoluted IMO.
>
> If changing RUST_VERSION is too problematic on every upgrade I think appr=
oach #2 its a lot simpler just specifying RUST_VERSION on other recipes sin=
ce it would be very seldom used and it wont conflict with upgrades
>

Actually changing it is clearly straightforward, the problem is that
upgrading the rust version is already tricky because of the need to
regenerate the cargo checksums, so every extra step is something that
you have to remember to do.

Which leaves me wondering how introducing nightly/beta actually work
with those patches?



--
Alex Kiernan

