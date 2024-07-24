Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4463BC3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 16:45:01 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.15736.1721839494384790411
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 09:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bkxR+1em;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52f01afa11cso5877911e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 09:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721839492; x=1722444292; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwaxSjEdd8ux90TptllXG2Y8Q1VxfLeaTLbDvCU8eDc=;
        b=bkxR+1em6Rg1fqC+aVaI4HjGQSuYPuwZfb8w7WgQrfkFegqq7354AGX3yCyt/jEfzr
         LHZm5wv4gsIeP+wI7JZ++RhWLRWQiDRkKLofa5wJKcTnJnrqmtD/K7j1MLLs2FmG0775
         itTfybpY5yxmN4omfjzAb0VswnNClYEzq9jzpEePnBo2zqPjfEkbXNP+/WAulopdtjHC
         8UYDLk41piLyRpwbqrWKFDcZcBJoP0SQNgZmarB9klce9gWqkIcRJFkCaD0ZmHlsZV/h
         OTwjQ/cJU16ADIHmugB64P9obAcRGa7gVKnn4JWlfD0cT2qnNiNlxxSr8Ki6TjQTBdvg
         yAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721839492; x=1722444292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cwaxSjEdd8ux90TptllXG2Y8Q1VxfLeaTLbDvCU8eDc=;
        b=keGEvRUxdaWpNDnj2cfHrygzWqLIM3T0WMoD8/ZtV0RSin6231Rf+zHkzVsC3tdZud
         jGVxKD+w8wAKp+PKX26eHF8SgBe6U8fV+LBrLvGqIoN0ly7d40OCBJtQ5H1EejI7m3U6
         Xoq0tlNiNyvoRk3FuzQufEiunqdU8lBjIniHx4E47WCqn2Wzuxn8xS6m6ktEsaG8k3cz
         7lc9pTWy+l/FIqEJ1mgifERZe8lNN4rqbjGN0kDR5DpV7UObDzHrdFGPlxxG7nx+ufzH
         oduyDMLRVDtep8JxpNRRqKnnVBEXTJpb5nkr+0QBWIx/ty41tnR8fYMFqrlxghayy6zV
         gpMA==
X-Forwarded-Encrypted: i=1; AJvYcCWJtmTCf5NSmQsoEadOU4Iq66Ry7MBCc/FEfvAtgF6Gm7+ccJUWzpx1EphX299gggmJFPNV+B/ym5f8e5GS5uaiow8qUDrl4hAQiZ8unBkTfEyxxEi7E1Nz
X-Gm-Message-State: AOJu0YwoNiimVLrixGeI3jBACZulAc+wsKr6M46XSukX7jrBLo/Eqe3T
	NZA0gXkcl+j1MHhVa96DEUuus9xJWGfTFZls1T2yytlbgKmY3SzaWFRnucUuo92Ng3QaaQnfUdl
	ytjM5r1O11TWst9EGFkid8psfXlA=
X-Google-Smtp-Source: AGHT+IHvg/0pXIGRhEub/LxvlFjab9EYj36I1dXvgY/tGPrmS/cjZS3w8V+6tz+G8JkXIWVpWaZ2rIZi2tQEKNEjCCw=
X-Received: by 2002:a05:6512:4026:b0:52e:9c69:b25b with SMTP id
 2adb3069b0e04-52fd3f2b3d0mr186208e87.28.1721839492156; Wed, 24 Jul 2024
 09:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240717023201.861394-1-jiaying.song.cn@windriver.com>
 <78ec945a12ed570b274041fe8b14568e270fab06.camel@linuxfoundation.org>
 <CANNYZj8JHCp1O9LoKxKMzfy2vACWn7GZLzBTrBHrmFk44bDM_w@mail.gmail.com> <CA+chaQeJKAckDR385NGM_5Pba=NYkYadPseB=iRZdXnNc+b-pQ@mail.gmail.com>
In-Reply-To: <CA+chaQeJKAckDR385NGM_5Pba=NYkYadPseB=iRZdXnNc+b-pQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Jul 2024 18:44:40 +0200
Message-ID: <CANNYZj_Lh=dMWraF46prc4pnMt22NYB+JAwpzm527HWmajp=+A@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][master][PATCH] python3: provide
 /usr/bin/python as a symlink to python3
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Jiaying.Song.CN@windriver.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 16:45:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202469

This pep is old, and was written back when python 2.x was actively
used and supported. It says: 'we messed this up, we won't make
specific decisions or recommendations, we leave it up to distros to
set the policy and sort the mess'.

I think it's time upstream makes a decision about providing python
symlink directly upstream and writes a new pep. But I won't try to
convince them.

Alex

On Wed, 24 Jul 2024 at 18:36, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Doesn't https://peps.python.org/pep-0394/ recommend the current status
> quo anyway?
>
> Distributors may choose to set the behavior of the python command as foll=
ows:
> python2,
> python3,
> not provide python command, allow python to be configurable by an end
> user or a system administrator.
>
> When packaging third party Python scripts, distributors are encouraged
> to change less specific shebangs to more specific ones. This ensures
> software is used with the latest version of Python available, and it
> can remove a dependency on Python 2. The details on what specifics to
> set are left to the distributors; though. Example specifics could
> include:
> Changing python shebangs to python3 when Python 3.x is supported.
> Changing python shebangs to python2 when Python 3.x is not yet supported.
> Changing python3 shebangs to python3.8 if the software is built with Pyth=
on 3.8.
>
> My preference would be to keep it as is and not merge this change as RP s=
aid.
>
> If we drop the patches then we go against the recommendation to use
> more specific shebangs and if we don't drop them then
> python-is-python3 recipes or package shouldn't be needed.
>
> Cheers,
>
> On Wed, Jul 24, 2024 at 6:18=E2=80=AFPM Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > On Wed, 24 Jul 2024 at 18:01, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >
> > > Having listened to the discussions and given this is pretty much a
> > > solved problem for the majority of our current metadata, I'm in favou=
r
> > > of maintaining the status quo and not taking this change, even if we
> > > have to carry a few patches. It does at least make the situation quit=
e
> > > clear and explicit.
> >
> > I'm fine with this. We have significantly bigger issues in oe-core
> > (e.g. the rust situation where the slide behind upstream is constantly
> > growing).
> >
> > I think the really correct solution is a coordinated effort by common
> > distributions to convince python upstream to add the symlink directly
> > in cpython installation. Or make an official statement that it is not
> > going to happen, which would explicitly mean that scripts *have* to be
> > written with python3 shebang.
> >
> > Alex
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#202465): https://lists.openembedded.org/g/openembed=
ded-core/message/202465
> > Mute This Topic: https://lists.openembedded.org/mt/107264938/3617156
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

