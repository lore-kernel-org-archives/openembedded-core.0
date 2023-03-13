Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCA4C61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 09:46:13 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web11.15972.1678700765484977841
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 02:46:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=apEa/jBF;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id 76so4750952iou.9
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 02:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678700764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQQ0vXUZfRu2FtKMqpMc/uoRq+wKvjgPPdbi1SIXGAA=;
        b=apEa/jBF04CRWCLczh8wJtGWA5HPzBRGVuOLgU7L65DKg5Uux2lLpkJNnbEkt2SKLL
         MhxJaomzPSkbtE6BR0GeAhyMoQ5GBuEJK+hH/GJnrLaMmrW5bN2HWNTHE+ovbT6ongkV
         7z/42lj9C+0QObfnVRsinj3YmaX/SQge4uTG61CbW1+oPhMpyqRkZHQ4Ju7gQGuak64l
         rMV15rd4+GeWyflHjLA814IvmaD1nIBK/Lf1cDI9G58tdHAs0a1rdlbByLfDkizgFRAd
         1bgVP0t8AVAXyHOlE5impSrfdx70ppKkoXo3q0Es1gRFlrGgNhDAWKvUtrrZAmetdBGt
         msVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678700764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQQ0vXUZfRu2FtKMqpMc/uoRq+wKvjgPPdbi1SIXGAA=;
        b=2pDAQMNn6y9U/wSOhCRt9RaocIiQiCuXP29AZ30XCADYVxk1ccwKsVJPj4YFbelLEv
         7EVBKgU/Ju/q8wr9dFwR1POCcl57nCWmt2STWDLkhz0se6sucddqzNyjOT+1eonLlc5o
         eYj89E8ZOHf3MRZNklx3BbabXh70C9s826Og5rQANw6THqxpKTJv68ZrO7Ot97i9orh9
         lVxjuPZeoTrZINKcFjPOr2JmxVxK/My+ufvtL8j1WhzQRVfA0FWDnXBQTcHdN1Yf1jZc
         h8Sq3tn8M6XXCw70mqUf1tWQpMveNrNF+DIdLPrE1mpCHMxQbIwzbedZ634ORsJYH5F/
         c0aQ==
X-Gm-Message-State: AO0yUKXFy/Kefl5zpyS3gqroi9cxnseVmLi7WsuDSlB815rJnFc/5Erc
	rgvcWY9iaJu+CU5Oiv8jfkq+fLiONUgqdvlENEk=
X-Google-Smtp-Source: AK7set8X8pm+Qi6vVz1TMXexnJQHlcaK3FrzXKG00rAxkVVD5GMXAqhE5vag95PfIpjBMdc4YzHqWrFZvq3X1Ist5kY=
X-Received: by 2002:a05:6602:22d1:b0:74a:f3d:3cc5 with SMTP id
 e17-20020a05660222d100b0074a0f3d3cc5mr16165899ioe.4.1678700764670; Mon, 13
 Mar 2023 02:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230312065517.61051-1-frederic.martinsons@gmail.com>
 <CANNYZj9ah1rO9FH3a_m2ftgrDik_NtcLa_15r6+sqD5iwBXsiw@mail.gmail.com>
 <CA+cAkeqZjC=L=_v-3K4VDtdWKxc3crDaqfwp_30B9KFAVrfJuw@mail.gmail.com>
 <CANNYZj9vyfkez+iL-EeeV0Yb3o1Fz9FDrbz+ZRjg5EjUHiAisA@mail.gmail.com>
 <CA+cAkepYqf_hJWe5HBpKcJrF37P7V81AWCZJJ_tUYtBH=BqHqg@mail.gmail.com>
 <CANNYZj-srm78_c6abE2WX8L6gGqW=GM0uqUyHiMkVmO+t0ZWwA@mail.gmail.com>
 <CAO5Uq5SaqUHzS93eyki1-3OGK2w_tGizJZmHMrJKGx5LdRZryA@mail.gmail.com> <CA+cAkeqLOVAT7bz+HXKyC7=vwyrRAfE76buQ7C9cog6WQ6k1gw@mail.gmail.com>
In-Reply-To: <CA+cAkeqLOVAT7bz+HXKyC7=vwyrRAfE76buQ7C9cog6WQ6k1gw@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 13 Mar 2023 09:45:52 +0000
Message-ID: <CAO5Uq5QnyWqi5_CaX7sHTrewVRhvT_SKdXTY7PvKe4dPryCQ6w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 09:46:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178424

Are you listing your ssh repos in your SRC_URI? We run with network
disabled everywhere other than fetch and with that patch we don't see
fetches from local ssh repos in compile.

On Mon, Mar 13, 2023 at 9:32=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> Thanks for the patch alex, I did try it and the same happened (git
> clone failure during do_compile), I'll
> dig more on that and possibly submit patches if I found a way of
> supporting git dependencies in Cargo.toml
>
> On Mon, 13 Mar 2023 at 10:23, Alex Kiernan <alex.kiernan@gmail.com> wrote=
:
> >
> > ISTR I tried this and ran into a different set of different problems.
> >
> > On Mon, Mar 13, 2023 at 9:20=E2=80=AFAM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > Note that we're all rust neophytes, and rust support in yocto is stil=
l
> > > evolving towards maturity. If you can see better ways to do things,
> > > patches would be most welcome - but 'no network access except in
> > > bitbake fetchers' is a core rule.
> > >
> > > Alex
> > >
> > > On Mon, 13 Mar 2023 at 10:14, Fr=C3=A9d=C3=A9ric Martinsons
> > > <frederic.martinsons@gmail.com> wrote:
> > > >
> > > > I understand there should not be a fetch during build step , I'll t=
ry
> > > > to find why .
> > > > In the mean time, if this is a strong rule, shouldn't we invoke "ca=
rgo
> > > > build" with  --offline option ?
> > > >
> > > > On Mon, 13 Mar 2023 at 09:38, Alexander Kanavin <alex.kanavin@gmail=
.com> wrote:
> > > > >
> > > > > On Mon, 13 Mar 2023 at 09:29, Fr=C3=A9d=C3=A9ric Martinsons
> > > > > <frederic.martinsons@gmail.com> wrote:
> > > > > > But the compile step tried to git clone anyway and so it failed=
 like I
> > > > > > showed in my first email.
> > > > >
> > > > > You need to figure out why this happens, because it should not. W=
e
> > > > > have plenty of recipes that list crates in SRC_URI in oe-core, so=
 you
> > > > > could start by studying how they work.
> > > > >
> > > > > Accessing network anywhere except do_fetch is not allowed for
> > > > > reproducibility and license compliance reasons (both break if tha=
t
> > > > > happens).
> > > > >
> > > > > 'cargo bitbake' is a 3rd party project with questionable maintena=
nce
> > > > > status that we do not support. The official way is to use
> > > > > cargo-update-recipe-crates class.
> > > > >
> > > > > Alex
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#178420): https://lists.openembedded.org/g/openemb=
edded-core/message/178420
> > > Mute This Topic: https://lists.openembedded.org/mt/97555635/3618097
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [alex.kiernan@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> >
> >
> > --
> > Alex Kiernan



--=20
Alex Kiernan

