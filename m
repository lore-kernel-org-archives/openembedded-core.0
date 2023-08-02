Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D785FC001DF
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 17:14:36 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.2042.1690996468697026139
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 10:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=r/EPxsxI;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6bc8d1878a0so88203a34.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 10:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690996468; x=1691601268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=157akadV47Fs4VMaGvzjTnwD45rfNN6qMvjAl/of/cw=;
        b=r/EPxsxIt3huT6FZ6abFj9J6PzFrzTOy6M2AKQmruRDNHnJqNCCNyXlSv4hfHjZa52
         tyCnkIInQr3JFkgES4patteZUiMZh1mh7ly5OPerAb+T88HSCMLQaeFzwfzqvlM1QhC3
         TOjtdcgNgavYfUFoXGmq1Dd92vHMwunczipA44Ko5iTfY+yhjokLwSnWmNyXWvmexoP4
         EkYJ31PehrjOQwEUEm2i3hp+VoCRPXX/pzzVXAUgV1ncZlkLZQga1aGS+suZZDUXd8k5
         F1GkMcH6/mggoEguHTuvxOUqp/WkrvxF58BcSHyEiVAmiaR+ZShneuTqLZ8ivLks/ev4
         6tSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690996468; x=1691601268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=157akadV47Fs4VMaGvzjTnwD45rfNN6qMvjAl/of/cw=;
        b=RSeFasev0PAf76lNVZOx7ThbimTKpVH9frPMvHmAUeHes4ksDP9ihNUUxgNG/Dwr6m
         pq4Zl6tdEdgI8ZtAKnXechP8ZGogmVDcswJ5NkjQ/h18w69HWgDX5HhSZVSLHfKGEFV/
         RUi2FNQomdkmRByCSX7y5KliBCaZ4WQ7weu6grZrvbbrUV74r8miM6PalqOu77Zc4WaW
         FrKTP428/MfosA9qKzT7DQb51krtt2syoMCJaaL3r2uWlZhaK3bRfTJ73i9yaX/f7gzS
         GVulxdACxR6Zug+u3UFcVqR3KzAkOWO2key6VTCiQOi7eOGOotuxoCLLy8TZ0lxTZuL4
         NT7w==
X-Gm-Message-State: ABy/qLYYSORSlkk5/CcUwD8Acj1jBSGeWEOxJtBUKHVX1CWYiJpMY5RH
	th6kKANIWyKh4aH0CkSB0e7D/PfTjRMx2V0IwN0=
X-Google-Smtp-Source: APBJJlFjeb+QowEhOgBvAYaKDiPLXz2LevrIG/wwmXXldgtg0vA3l4m2sR6s8nAlsjLycUN53l7dpHok+vEFcYMkGlg=
X-Received: by 2002:a05:6871:28a:b0:1bf:2ad9:8dae with SMTP id
 i10-20020a056871028a00b001bf2ad98daemr4148166oae.45.1690996467724; Wed, 02
 Aug 2023 10:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230731112736.1238510-1-luca.boccassi@gmail.com> <20230731164010faa31974@mail.local>
 <CAMw=ZnR3L05DSaBGSijuA5-vNXPkriCjdbi02LJsUFmVo-FbHA@mail.gmail.com>
 <202307311713165bd45fd1@mail.local> <CAMw=ZnTCOt1aq-iQLRsgjv5sJL_GYXWW3dNup300B1dbNYnLZw@mail.gmail.com>
 <1777043202ABE7FB.4565@lists.openembedded.org> <CANNYZj_9PaJtAhi1XTMzO8oY9GgxUh6hO+00f0Ph2MUndzBVbA@mail.gmail.com>
 <CAMw=ZnR9S1oHjjPUyOHnDakPOM-6JkyHbnTTR2hDjqv65qfB1w@mail.gmail.com> <CAMw=ZnQymjXr1qazSz8ZHX=+fUzj_fJJpbku_+7vUv-8rCYN_g@mail.gmail.com>
In-Reply-To: <CAMw=ZnQymjXr1qazSz8ZHX=+fUzj_fJJpbku_+7vUv-8rCYN_g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Aug 2023 10:14:01 -0700
Message-ID: <CAMKF1sq83x6=sg1nFnPUm_WdLLULeTkorf3KnBvQeunfWN_oVA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] systemd: update to v254
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 17:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185417

Luca

On Wed, Aug 2, 2023 at 1:12=E2=80=AFAM Luca Bocassi <luca.boccassi@gmail.co=
m> wrote:
>
> On Mon, 31 Jul 2023 at 19:00, Luca Boccassi <luca.boccassi@gmail.com> wro=
te:
> >
> > On Mon, 31 Jul 2023 at 18:37, Alexander Kanavin <alex.kanavin@gmail.com=
> wrote:
> > >
> > > A better option: fix the libpam recipe to say:
> > >
> > > ANY_OF_DISTRO_FEATURES =3D "pam systemd"
> > > instead of  current
> > > REQUIRED_DISTRO_FEATURES =3D "pam"
> > >
> > >
> > > This should avoid having to fix the tests.
> >
> > Thanks for the suggestion, applied in v6.
>
> Hi, did v6 help with those test runs? Thanks


I am seeing a build failure with TCLIBC=3Dmusl

| ../git/src/basic/user-util.c:708:30: error: use of undeclared
identifier 'LOCK_EX'; did you mean 'LOCK_BSD'?
|   708 |         r =3D unposix_lock(fd, LOCK_EX);
|       |                              ^~~~~~~
|       |                              LOCK_BSD
| ../git/src/basic/lock-util.h:38:9: note: 'LOCK_BSD' declared here
|    38 |         LOCK_BSD,
|       |         ^
| 1 error generated.

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185381): https://lists.openembedded.org/g/openembedde=
d-core/message/185381
> Mute This Topic: https://lists.openembedded.org/mt/100459438/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

