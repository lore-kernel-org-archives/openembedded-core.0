Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F25EC001E0
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 17:42:57 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.2788.1690998171447870361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 10:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lob4Z40/;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1bb575a6ed3so5691181fac.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 10:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690998171; x=1691602971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/n948Bg40Us28vlwMomlWc+sXOe35ESLc3MzLehoSY=;
        b=lob4Z40/NRycNnWh3C7VDW/1CPMuN7FXZFaQsV6yNDyGhtVE/CXG9b3vGMk9psbVfR
         RGFHwO1TJJLGQRr2u9NFmJ5I3o3qs+GbRlv79LIfjxcQnzuY3MbhgglLoLPNqNFdBpjR
         ZTmnrZ6tFqMOkeDbR/g/2qV2RoYXZhvHHCROierUjvlnXOkCFcBbjStvtjsxDRJPgCJP
         mlE71vo2VxH0dGsPb4nXHshCU2uWdqH8QZp800fOmTWqCmwZkgFvTqMvqMEhETG4p+fb
         GmAjWCrJAC6R+qlCmzCzTqah5GvdQiTcM0mbHQwfqKPK052KmOEh9lbETqEWLyf94/sa
         GvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690998171; x=1691602971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/n948Bg40Us28vlwMomlWc+sXOe35ESLc3MzLehoSY=;
        b=gvfEy/Sif5OTQxJjV8vWhkyGKhRdnECfga9MJt8Y+MUl2qITz4+4Eco99iVOnS81MA
         Fu01N5lPlaXP06q5YdMbi+41RxG2ehsYSBbjtvifS3aqhazEHnBGxhKNKmJ8+ZlLADfB
         lG9Hmt5LNb+IA4BD2q5O+uaNYVg+dX6Frd6QwzLqbIAkTG6EqAIElG6VyQ75PG4leQ5f
         Y9rMMYTlYySJ4zaDGDWI6bskV2wlXSVllWOHkdGzaRPjKBhYW4mnkXZk6zOG9zmIvBzh
         YETQDvTLxIGN18qAdWuo426kmd9ZT3rCfEAwC4sreOIqXj/JfkS58vVpA6X5wqaHUIaY
         2Mkg==
X-Gm-Message-State: ABy/qLbXB/jGEsKRaAeJmgaahqGLRZ4eLojRAI0N5odaDolyok/1h8tG
	G3TDap5N5W9NMo/UnLec0Xj0/wMppdjisgpOf+M=
X-Google-Smtp-Source: AGHT+IFda0dxScLTP9alA0CsHXGBkvEyb7v+YR6oCzYP5Bbak3LmjtinWXqKdXLnT8r3pESVDW+e8YoKtsC4SMKTG+o=
X-Received: by 2002:a05:6870:ac21:b0:1bf:5d1a:f218 with SMTP id
 kw33-20020a056870ac2100b001bf5d1af218mr1246672oab.28.1690998170635; Wed, 02
 Aug 2023 10:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230731112736.1238510-1-luca.boccassi@gmail.com> <20230731164010faa31974@mail.local>
 <CAMw=ZnR3L05DSaBGSijuA5-vNXPkriCjdbi02LJsUFmVo-FbHA@mail.gmail.com>
 <202307311713165bd45fd1@mail.local> <CAMw=ZnTCOt1aq-iQLRsgjv5sJL_GYXWW3dNup300B1dbNYnLZw@mail.gmail.com>
 <1777043202ABE7FB.4565@lists.openembedded.org> <CANNYZj_9PaJtAhi1XTMzO8oY9GgxUh6hO+00f0Ph2MUndzBVbA@mail.gmail.com>
 <CAMw=ZnR9S1oHjjPUyOHnDakPOM-6JkyHbnTTR2hDjqv65qfB1w@mail.gmail.com>
 <CAMw=ZnQymjXr1qazSz8ZHX=+fUzj_fJJpbku_+7vUv-8rCYN_g@mail.gmail.com>
 <CAMKF1sq83x6=sg1nFnPUm_WdLLULeTkorf3KnBvQeunfWN_oVA@mail.gmail.com> <CAMw=ZnQ8ot0bAqFho-xyA3U7QKBh0-ynt5N+NnrT_Xq=Wf9qew@mail.gmail.com>
In-Reply-To: <CAMw=ZnQ8ot0bAqFho-xyA3U7QKBh0-ynt5N+NnrT_Xq=Wf9qew@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Aug 2023 10:42:24 -0700
Message-ID: <CAMKF1sr+Okxt-SXGjxA38hnscMGeOsTL5jza=ww+=FNPOzUhKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] systemd: update to v254
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 17:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185421

On Wed, Aug 2, 2023 at 10:21=E2=80=AFAM Luca Boccassi <luca.boccassi@gmail.=
com> wrote:
>
> On Wed, 2 Aug 2023 at 18:14, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Luca
> >
> > On Wed, Aug 2, 2023 at 1:12=E2=80=AFAM Luca Bocassi <luca.boccassi@gmai=
l.com> wrote:
> > >
> > > On Mon, 31 Jul 2023 at 19:00, Luca Boccassi <luca.boccassi@gmail.com>=
 wrote:
> > > >
> > > > On Mon, 31 Jul 2023 at 18:37, Alexander Kanavin <alex.kanavin@gmail=
.com> wrote:
> > > > >
> > > > > A better option: fix the libpam recipe to say:
> > > > >
> > > > > ANY_OF_DISTRO_FEATURES =3D "pam systemd"
> > > > > instead of  current
> > > > > REQUIRED_DISTRO_FEATURES =3D "pam"
> > > > >
> > > > >
> > > > > This should avoid having to fix the tests.
> > > >
> > > > Thanks for the suggestion, applied in v6.
> > >
> > > Hi, did v6 help with those test runs? Thanks
> >
> >
> > I am seeing a build failure with TCLIBC=3Dmusl
> >
> > | ../git/src/basic/user-util.c:708:30: error: use of undeclared
> > identifier 'LOCK_EX'; did you mean 'LOCK_BSD'?
> > |   708 |         r =3D unposix_lock(fd, LOCK_EX);
> > |       |                              ^~~~~~~
> > |       |                              LOCK_BSD
> > | ../git/src/basic/lock-util.h:38:9: note: 'LOCK_BSD' declared here
> > |    38 |         LOCK_BSD,
> > |       |         ^
> > | 1 error generated.
>
> Yes, as mentioned on the patch note itself, I only rebased the musl
> patches so that they apply (and dropped the merged ones), but I have
> not (and will not) test them in any other way, as I do not use musl.

OK np.
I have sent a pull upsrtream - https://github.com/systemd/systemd/pull/2864=
7

there is another issue where systemd has started using glibc-only
malloc_trim API [1]
so we need another patch to mark it accordingly. I will see what we can do =
there

[1] https://github.com/systemd/systemd/commit/158fe190afe37b222c9dc2c53bd7b=
e426b92ef89



>
> Kind regards,
> Luca Boccassi

