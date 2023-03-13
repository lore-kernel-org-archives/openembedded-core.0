Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9093C6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 10:06:43 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.16211.1678701994478738304
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 03:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FMG3FqNd;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id s22so14942018lfi.9
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 03:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678701993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PGmLAwn9o/gWm/n9NzYGBzUbt6VswTn9/KV54f4hns=;
        b=FMG3FqNdai55wBAggOFmFKcTPzNi1zmH31OyLRvUfG48lsdbs5buv7rVOZ/cARJShI
         togSVQobiBfFppsVHn6CjdpjT+NJRhzo9z2MF7BM+3jZ1+/cyMfmmn+LhUrRgx/hKXQn
         mscyFdfRD/VaYSX357+jglGzJsPD6sYci8L/KVxAvcUc8bNJApsuauQT63Qppn5VP4RH
         VUJPfjiZD0Vl5KQy+JOb247tjAkrntDKVCBTsmgReZ07N8nBsv2BNDQpe2wZwFM4SvUk
         Ah2TPNMESzk60KFGGhevfxLAI1kAGhqGj2u3CwRbGKhA9BdUMF96Cau0ycRobtZEm7A8
         Gjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678701993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PGmLAwn9o/gWm/n9NzYGBzUbt6VswTn9/KV54f4hns=;
        b=6LHKE9vmmhWu4GI/euIL5xzVYq9aRGOokHRtKiWm3m8/ZuoWgMsAuCuHS2rdp85zrv
         zIQhgz4WSthxXO7YfBtfb8tk8E+k0ptpRSPox+oU0kNatMQnqAPnW2Bqws3Zl+Wz8aVl
         QnFrlfnlxNNkYXaTbPRH+/GOkmkN86ZmvO4ZW3jzasS6K8g5/8YB5QCJO07IMw7Aoeg6
         tqTA+S45e1RWS1nV4mUt21yX0x4x1/oGTE+w6P+KvmqfP4YW/KRUrd9FaPeffVWvtt6c
         Z3OmV68DOBPw52R3KUmg/Hq2fJjD9TFp0T2sL4jTSMDcis1xKiwekUuSPj4pIPmqrC+o
         pZ/A==
X-Gm-Message-State: AO0yUKXld28hRHPXSiw3qu8OcJi9FE9laRWBWEOj4qmfIkBRkGdftbSR
	tH7JUkpxcd5m5dgQ+VWqJRera2fwbTJc0jIRLvs=
X-Google-Smtp-Source: AK7set85XCMqWnSwhzVTlb/b/n72ai4ES0URGkuf02jjeeF603mErRi86l6RWFLtIsacnkqynl3mkbBB3nOrfpyjBBw=
X-Received: by 2002:ac2:4117:0:b0:4d5:ca32:7bc5 with SMTP id
 b23-20020ac24117000000b004d5ca327bc5mr10494272lfi.12.1678701992643; Mon, 13
 Mar 2023 03:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230312065517.61051-1-frederic.martinsons@gmail.com>
 <CANNYZj9ah1rO9FH3a_m2ftgrDik_NtcLa_15r6+sqD5iwBXsiw@mail.gmail.com>
 <CA+cAkeqZjC=L=_v-3K4VDtdWKxc3crDaqfwp_30B9KFAVrfJuw@mail.gmail.com>
 <CANNYZj9vyfkez+iL-EeeV0Yb3o1Fz9FDrbz+ZRjg5EjUHiAisA@mail.gmail.com>
 <CA+cAkepYqf_hJWe5HBpKcJrF37P7V81AWCZJJ_tUYtBH=BqHqg@mail.gmail.com>
 <CANNYZj-srm78_c6abE2WX8L6gGqW=GM0uqUyHiMkVmO+t0ZWwA@mail.gmail.com>
 <CAO5Uq5SaqUHzS93eyki1-3OGK2w_tGizJZmHMrJKGx5LdRZryA@mail.gmail.com>
 <CA+cAkeqLOVAT7bz+HXKyC7=vwyrRAfE76buQ7C9cog6WQ6k1gw@mail.gmail.com> <CAO5Uq5QnyWqi5_CaX7sHTrewVRhvT_SKdXTY7PvKe4dPryCQ6w@mail.gmail.com>
In-Reply-To: <CAO5Uq5QnyWqi5_CaX7sHTrewVRhvT_SKdXTY7PvKe4dPryCQ6w@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 13 Mar 2023 11:06:21 +0100
Message-ID: <CA+cAkeowE7BUYie9rdFPpJ972DHK+d3WGXLKFPAKcYcVYy_AXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 10:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178426

hmm, how is the network disabled ?

Because with the patch I provided , the git clone in do_compile is successf=
ul.

One major thing I forget to mention is that I use dunfell branch where
I backport all the cargo/rust relatives from master.
The backport was functional and straightforward, I just have to keep
the custom crate fetcher in openembedded-core (meta/lib/crate.py)
because I'm stuck with bitbake 1.46.

   -

On Mon, 13 Mar 2023 at 10:46, Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Are you listing your ssh repos in your SRC_URI? We run with network
> disabled everywhere other than fetch and with that patch we don't see
> fetches from local ssh repos in compile.
>
> On Mon, Mar 13, 2023 at 9:32=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > Thanks for the patch alex, I did try it and the same happened (git
> > clone failure during do_compile), I'll
> > dig more on that and possibly submit patches if I found a way of
> > supporting git dependencies in Cargo.toml
> >
> > On Mon, 13 Mar 2023 at 10:23, Alex Kiernan <alex.kiernan@gmail.com> wro=
te:
> > >
> > > ISTR I tried this and ran into a different set of different problems.
> > >
> > > On Mon, Mar 13, 2023 at 9:20=E2=80=AFAM Alexander Kanavin
> > > <alex.kanavin@gmail.com> wrote:
> > > >
> > > > Note that we're all rust neophytes, and rust support in yocto is st=
ill
> > > > evolving towards maturity. If you can see better ways to do things,
> > > > patches would be most welcome - but 'no network access except in
> > > > bitbake fetchers' is a core rule.
> > > >
> > > > Alex
> > > >
> > > > On Mon, 13 Mar 2023 at 10:14, Fr=C3=A9d=C3=A9ric Martinsons
> > > > <frederic.martinsons@gmail.com> wrote:
> > > > >
> > > > > I understand there should not be a fetch during build step , I'll=
 try
> > > > > to find why .
> > > > > In the mean time, if this is a strong rule, shouldn't we invoke "=
cargo
> > > > > build" with  --offline option ?
> > > > >
> > > > > On Mon, 13 Mar 2023 at 09:38, Alexander Kanavin <alex.kanavin@gma=
il.com> wrote:
> > > > > >
> > > > > > On Mon, 13 Mar 2023 at 09:29, Fr=C3=A9d=C3=A9ric Martinsons
> > > > > > <frederic.martinsons@gmail.com> wrote:
> > > > > > > But the compile step tried to git clone anyway and so it fail=
ed like I
> > > > > > > showed in my first email.
> > > > > >
> > > > > > You need to figure out why this happens, because it should not.=
 We
> > > > > > have plenty of recipes that list crates in SRC_URI in oe-core, =
so you
> > > > > > could start by studying how they work.
> > > > > >
> > > > > > Accessing network anywhere except do_fetch is not allowed for
> > > > > > reproducibility and license compliance reasons (both break if t=
hat
> > > > > > happens).
> > > > > >
> > > > > > 'cargo bitbake' is a 3rd party project with questionable mainte=
nance
> > > > > > status that we do not support. The official way is to use
> > > > > > cargo-update-recipe-crates class.
> > > > > >
> > > > > > Alex
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#178420): https://lists.openembedded.org/g/opene=
mbedded-core/message/178420
> > > > Mute This Topic: https://lists.openembedded.org/mt/97555635/3618097
> > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub [alex.kiernan@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >
> > >
> > >
> > > --
> > > Alex Kiernan
>
>
>
> --
> Alex Kiernan

