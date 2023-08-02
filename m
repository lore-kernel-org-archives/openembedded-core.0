Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C50C001DF
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 17:21:56 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.2237.1690996911868897395
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 10:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=LX/ebOjv;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: luca.boccassi@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-583b0637c04so1331397b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 10:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690996911; x=1691601711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXoqHobKgWnxC90+v+QxfcViLBlX3W4flC5a3lmojx0=;
        b=LX/ebOjvwpCFHhR1CKXzYfM/tr5byJ8wFo5e4fkwQw2ylragkPss5TNybyWch7z0Ff
         g6usnTFdAnqzxkQz93HGo5/fp+EhEt1gpZnt92j76mXddUJ6PI+diSu/kmK+mYZAoJAS
         cFijcnEv6g/rVKw2t3fIWUl9qaJkSyPmAqwXyoZwDB4Qca0E2pXDCkpfbiUNvgC1ac0f
         ABd1VZh5JRMADX0vhKuwSv2gna8NDwZPuX6dkBehrWv+UtTuJRkNxfkLabQ35V8jKQ4E
         yyPyCnSh3TPkJTabx3jVH0WVC+Hmqge7T9+1joI91ReW8QrFASfXHlwMNdouFG7eF5Ag
         Lq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690996911; x=1691601711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXoqHobKgWnxC90+v+QxfcViLBlX3W4flC5a3lmojx0=;
        b=LL6/LkAGWeJhcPwntJTQRYanlEU30zH45esf+Vn9bh2Hy5zjpcyJkNOX8DQlYOPeY0
         4SH6khCZ3AzZhd6J10/l97lgkUBylZ7w6MNH8Y7RLIjqG6O7MWImgCrtkxxWATS1HW3a
         jSWkTdy38QHVeTleXJ7rIwVQ3Q7Eltd6hE85hfJFtqMXV1FUqKZZo+mJfMu5pxNtyzGt
         Yp/AHuFTuowAY4w+zcrMNkQ1stpKrbMBf8nIrP6jkgb10dC8K471IaTgyg7g71nVNe6o
         zgQYtYIwPHir1dbblicz5tWmT8ZHEbVu3dol905oHQw8zBUv81zSBD4wV4Gcfw4kZBJp
         1CVA==
X-Gm-Message-State: ABy/qLbl2nxdEs12imPcVwKMhPXRbAhVPTj8hm5KH/7N5joA7EuXi1q8
	K2+MHRbjtQmO+No4bzm94cQ1nn8tCrR55PsKopEBWHhX
X-Google-Smtp-Source: APBJJlEG5u30IQmCCYZyR2UrpPP9nTJ7uzSHYwlJRZQqip5ucw4OBCeUPPVUClkG0MTdEydxr3WXoRZvvxF+EEk9QWQ=
X-Received: by 2002:a81:48c3:0:b0:57a:3942:bb74 with SMTP id
 v186-20020a8148c3000000b0057a3942bb74mr19152459ywa.17.1690996910981; Wed, 02
 Aug 2023 10:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230731112736.1238510-1-luca.boccassi@gmail.com> <20230731164010faa31974@mail.local>
 <CAMw=ZnR3L05DSaBGSijuA5-vNXPkriCjdbi02LJsUFmVo-FbHA@mail.gmail.com>
 <202307311713165bd45fd1@mail.local> <CAMw=ZnTCOt1aq-iQLRsgjv5sJL_GYXWW3dNup300B1dbNYnLZw@mail.gmail.com>
 <1777043202ABE7FB.4565@lists.openembedded.org> <CANNYZj_9PaJtAhi1XTMzO8oY9GgxUh6hO+00f0Ph2MUndzBVbA@mail.gmail.com>
 <CAMw=ZnR9S1oHjjPUyOHnDakPOM-6JkyHbnTTR2hDjqv65qfB1w@mail.gmail.com>
 <CAMw=ZnQymjXr1qazSz8ZHX=+fUzj_fJJpbku_+7vUv-8rCYN_g@mail.gmail.com> <CAMKF1sq83x6=sg1nFnPUm_WdLLULeTkorf3KnBvQeunfWN_oVA@mail.gmail.com>
In-Reply-To: <CAMKF1sq83x6=sg1nFnPUm_WdLLULeTkorf3KnBvQeunfWN_oVA@mail.gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Wed, 2 Aug 2023 18:21:39 +0100
Message-ID: <CAMw=ZnQ8ot0bAqFho-xyA3U7QKBh0-ynt5N+NnrT_Xq=Wf9qew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] systemd: update to v254
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 17:21:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185419

On Wed, 2 Aug 2023 at 18:14, Khem Raj <raj.khem@gmail.com> wrote:
>
> Luca
>
> On Wed, Aug 2, 2023 at 1:12=E2=80=AFAM Luca Bocassi <luca.boccassi@gmail.=
com> wrote:
> >
> > On Mon, 31 Jul 2023 at 19:00, Luca Boccassi <luca.boccassi@gmail.com> w=
rote:
> > >
> > > On Mon, 31 Jul 2023 at 18:37, Alexander Kanavin <alex.kanavin@gmail.c=
om> wrote:
> > > >
> > > > A better option: fix the libpam recipe to say:
> > > >
> > > > ANY_OF_DISTRO_FEATURES =3D "pam systemd"
> > > > instead of  current
> > > > REQUIRED_DISTRO_FEATURES =3D "pam"
> > > >
> > > >
> > > > This should avoid having to fix the tests.
> > >
> > > Thanks for the suggestion, applied in v6.
> >
> > Hi, did v6 help with those test runs? Thanks
>
>
> I am seeing a build failure with TCLIBC=3Dmusl
>
> | ../git/src/basic/user-util.c:708:30: error: use of undeclared
> identifier 'LOCK_EX'; did you mean 'LOCK_BSD'?
> |   708 |         r =3D unposix_lock(fd, LOCK_EX);
> |       |                              ^~~~~~~
> |       |                              LOCK_BSD
> | ../git/src/basic/lock-util.h:38:9: note: 'LOCK_BSD' declared here
> |    38 |         LOCK_BSD,
> |       |         ^
> | 1 error generated.

Yes, as mentioned on the patch note itself, I only rebased the musl
patches so that they apply (and dropped the merged ones), but I have
not (and will not) test them in any other way, as I do not use musl.

Kind regards,
Luca Boccassi

