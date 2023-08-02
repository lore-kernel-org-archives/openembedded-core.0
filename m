Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E40C04FE1
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 18:55:17 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.4484.1691002512385390920
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 11:55:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CemYcwpu;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: luca.boccassi@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-58419517920so795887b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 11:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691002511; x=1691607311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdO3LV5lbNKMJ/a+8nGdo+Z2ZSdnsudLfDvVamQRRis=;
        b=CemYcwpuV3Q6bPIrGit7aIB3n3JUQDL5tOtEtXIUMrtYiBOe81c8SX6XZKqx/PynYg
         vN27hMK3/at31aOLaqr8IomJqi60psu1Pa8uAqBDmJXZ5+AjgHqN1dJ3etWKu990ViJB
         yMDv4BikZhqqvrvitfaEsuUAqvHBAN+HJErcS0d0m9yjZgTZsEexG53Jjuea5Oz6QUUi
         e0FdyO3Vc0LvYa+T3ZZMU4S+V7g6vdX32XStFJiaUnH7EIkmyekLo24UuQMr+Sea8xlr
         I3NPNA0KPJAAyOeLnEuM01qRECLPhQ5Dx5z8ZGtHvzXVmoQkihSdYryzZEf99HT1yx6Y
         GMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691002511; x=1691607311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdO3LV5lbNKMJ/a+8nGdo+Z2ZSdnsudLfDvVamQRRis=;
        b=NpuIWKOgeCucJIkYSS1BVHFE6VniuujPJqXew76mVhkspPG1ycRqaH0TMMbrhXfqwV
         oVtutDTtGs7h1Ywo9CJP4aq6MQJeUjTnpM9B2IT9VBcOdru1JuLk51bI0gA9OPZ1p/Gg
         tc4EcoKeDenrJJoj4c5tTfpORzNYfhdYPLsap0d3hBpa8v7eVoI1DE+uuzj7ld+UCv5t
         IWzg7K57ZKIsmWljo5ulgK6liZEREjpZYYQLXxqPSMcOpiuk/E+IJVobEYtxNkAhX2IE
         Y2K9XhxcDTAe6Z85v7xeaIHKz64QZ7IffcguXoR76zkhFt7yeZolBJmoOhr+zyYDJPAq
         NW6g==
X-Gm-Message-State: ABy/qLbrE3pykdc2YEh+wexfE9FyAU1Q9cEqk7D8Z4tqcpxFkDJVvVMR
	tZEN6VXPLr4GloGHAGr0shuCTo8pZO4X5TAS7D8=
X-Google-Smtp-Source: APBJJlFwzMs/H2nFBY80i3d2wD95eEoQ04hQbszRfU3v0FPHWdFap/hnSQeyYWWRiFfctlBZJqxAKhFTFtAHj4m9eb4=
X-Received: by 2002:a0d:d8cb:0:b0:569:feee:3950 with SMTP id
 a194-20020a0dd8cb000000b00569feee3950mr19187081ywe.2.1691002511560; Wed, 02
 Aug 2023 11:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230731112736.1238510-1-luca.boccassi@gmail.com> <20230731164010faa31974@mail.local>
 <CAMw=ZnR3L05DSaBGSijuA5-vNXPkriCjdbi02LJsUFmVo-FbHA@mail.gmail.com>
 <202307311713165bd45fd1@mail.local> <CAMw=ZnTCOt1aq-iQLRsgjv5sJL_GYXWW3dNup300B1dbNYnLZw@mail.gmail.com>
 <1777043202ABE7FB.4565@lists.openembedded.org> <CANNYZj_9PaJtAhi1XTMzO8oY9GgxUh6hO+00f0Ph2MUndzBVbA@mail.gmail.com>
 <CAMw=ZnR9S1oHjjPUyOHnDakPOM-6JkyHbnTTR2hDjqv65qfB1w@mail.gmail.com>
 <CAMw=ZnQymjXr1qazSz8ZHX=+fUzj_fJJpbku_+7vUv-8rCYN_g@mail.gmail.com>
 <CAMKF1sq83x6=sg1nFnPUm_WdLLULeTkorf3KnBvQeunfWN_oVA@mail.gmail.com>
 <CAMw=ZnQ8ot0bAqFho-xyA3U7QKBh0-ynt5N+NnrT_Xq=Wf9qew@mail.gmail.com> <CAMKF1sr+Okxt-SXGjxA38hnscMGeOsTL5jza=ww+=FNPOzUhKA@mail.gmail.com>
In-Reply-To: <CAMKF1sr+Okxt-SXGjxA38hnscMGeOsTL5jza=ww+=FNPOzUhKA@mail.gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Wed, 2 Aug 2023 19:55:00 +0100
Message-ID: <CAMw=ZnRgaW8zfd7nEzf+CnhXF9OBKfpm8hLKD4QHMf7whn_pxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] systemd: update to v254
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185429

On Wed, 2 Aug 2023 at 18:42, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Aug 2, 2023 at 10:21=E2=80=AFAM Luca Boccassi <luca.boccassi@gmai=
l.com> wrote:
> >
> > On Wed, 2 Aug 2023 at 18:14, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Luca
> > >
> > > On Wed, Aug 2, 2023 at 1:12=E2=80=AFAM Luca Bocassi <luca.boccassi@gm=
ail.com> wrote:
> > > >
> > > > On Mon, 31 Jul 2023 at 19:00, Luca Boccassi <luca.boccassi@gmail.co=
m> wrote:
> > > > >
> > > > > On Mon, 31 Jul 2023 at 18:37, Alexander Kanavin <alex.kanavin@gma=
il.com> wrote:
> > > > > >
> > > > > > A better option: fix the libpam recipe to say:
> > > > > >
> > > > > > ANY_OF_DISTRO_FEATURES =3D "pam systemd"
> > > > > > instead of  current
> > > > > > REQUIRED_DISTRO_FEATURES =3D "pam"
> > > > > >
> > > > > >
> > > > > > This should avoid having to fix the tests.
> > > > >
> > > > > Thanks for the suggestion, applied in v6.
> > > >
> > > > Hi, did v6 help with those test runs? Thanks
> > >
> > >
> > > I am seeing a build failure with TCLIBC=3Dmusl
> > >
> > > | ../git/src/basic/user-util.c:708:30: error: use of undeclared
> > > identifier 'LOCK_EX'; did you mean 'LOCK_BSD'?
> > > |   708 |         r =3D unposix_lock(fd, LOCK_EX);
> > > |       |                              ^~~~~~~
> > > |       |                              LOCK_BSD
> > > | ../git/src/basic/lock-util.h:38:9: note: 'LOCK_BSD' declared here
> > > |    38 |         LOCK_BSD,
> > > |       |         ^
> > > | 1 error generated.
> >
> > Yes, as mentioned on the patch note itself, I only rebased the musl
> > patches so that they apply (and dropped the merged ones), but I have
> > not (and will not) test them in any other way, as I do not use musl.
>
> OK np.
> I have sent a pull upsrtream - https://github.com/systemd/systemd/pull/28=
647

Looks good thanks, merged and backported in v7.

> there is another issue where systemd has started using glibc-only
> malloc_trim API [1]
> so we need another patch to mark it accordingly. I will see what we can d=
o there
>
> [1] https://github.com/systemd/systemd/commit/158fe190afe37b222c9dc2c53bd=
7be426b92ef89

