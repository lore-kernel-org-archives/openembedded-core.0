Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD9CC27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 16:14:47 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.60707.1718640884280807915
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 09:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aHrGiD0g;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5ba18126a3bso1978019eaf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 09:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718640883; x=1719245683; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsMg2Es/eh5pGvki80PkUbSxSqsnT1HbTHOj+Lc8bnY=;
        b=aHrGiD0gCdKdrnSYZfWDeYvkUd0qWNgNsHuusK7Ve6AktXwPf/FPFkWPAhajto5c+J
         /RYupuOQMDvEX9xt7m6R+P/yFN0rcvGlRXgbFLzCHB8Uk5l1Dd2jGeYi8mMT4EvHh0py
         8kChyyTaaNdh96Iue1sFBHk1T4gcZlzueXQxm/vvNiWzXrLcJ34j9TmiMtH/w0E/Uq2H
         0fb89GX6eopyTHzctPRw3eWzmtuGiGoJhoIMHvNYP1oDG2J5SYzSwFDq0Yyqy9LrTvCB
         o3qHtdOOAfd02ZioQWWgW5ZdhZemr/zao2IUpU1DoaDsMFU48ZGNzROgENOoRQhSAJii
         aSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718640883; x=1719245683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZsMg2Es/eh5pGvki80PkUbSxSqsnT1HbTHOj+Lc8bnY=;
        b=OumZ0I85oyYG7LvgXLOIRks8JfO+RiKS9lPDqcHobuURiBDxesWprG7viVqpH/L62E
         C65JDmVgb7QaummyTZMJSkdFagoBkMX0EsBw916yhqWUb5O+VPe05ywSe4zXFHyI0nvb
         npA3uOjx/DyLMNnkeBdtJl1GLuX4G2mG6GDlD3CRJoOSn+jPNs31wmw/iSeOqtCvBqaw
         k3Ov3USIwdBPe9wIcp91LEcnBdx5+nmnUczInEyjsnNpk69yqcjivNQiNLs+iwCY/ihE
         kQPt14zQT0XfoR08LqXejv4qpP9PHcE5WCo0fTq8Qcuou8OyNdwMyTq2ktd7bGnUqlLK
         1sqA==
X-Forwarded-Encrypted: i=1; AJvYcCUvXwfvCFBs8ZbGrIIAMYI3LKHIiEMUj41ZdTFOioIxHXpmf672B5gZ6+ktnjEDqTpq3VuurngPdIPBzwJSRXtj7mv2Tf2Im8ZtGprB0Zsdw8ncEUlCKN0T
X-Gm-Message-State: AOJu0YxdLH7AhpEqe5cGXOFQgRhIGCPaqoGcCKIo8bAff+PoYYLUh56p
	K6MChdw3b8ay6n4VcZSevTYgBfXkHolXLv3n2Nb1Ygo5CVea7jKfZ+2aGvpEsafTwLyBpPwSJ3i
	LIeKkOOUbeDJRl1cgaepxZB8ljqI=
X-Google-Smtp-Source: AGHT+IGJNPeuacc3t5xqnyPIYwnZfbpqhZ06EAQNuS0V9D9dfUaBfvwchRDfwu+NSsQE2Qv+pkFZdBtOvnVKWAX5gcs=
X-Received: by 2002:a05:6871:68a:b0:258:37d6:52d6 with SMTP id
 586e51a60fabf-25972ef464bmr52572fac.23.1718640883378; Mon, 17 Jun 2024
 09:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <CALT56yPWE=nTn7jAPps+A7YCZ17Aw-U_OpfonSTYD90j5rwOAg@mail.gmail.com>
 <CANNYZj_okQmP9Lrruik2ekQ9k6B6_fyYmRToSuODC3BRP1apUA@mail.gmail.com>
 <CALT56yPY8+y39saaGXi36i5ZOQo7fkGn66WmWuDBpDZFkxw7-w@mail.gmail.com> <CANNYZj-q7hWSC9QxjOe1kbN0pF_O+WZ-KZ6VE_vqH4H0QRs8-g@mail.gmail.com>
In-Reply-To: <CANNYZj-q7hWSC9QxjOe1kbN0pF_O+WZ-KZ6VE_vqH4H0QRs8-g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Jun 2024 09:14:16 -0700
Message-ID: <CAMKF1soBPoUunS3uVGM0-E8CLgn1VZSrp9XSKuODPLnb-Gjm=A@mail.gmail.com>
Subject: Re: [OE-core] QemuPPC64 machine status
To: alex.kanavin@gmail.com
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 16:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200849

On Mon, Jun 17, 2024 at 4:51=E2=80=AFAM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> RESOLVED WONTFIX I=E2=80=99m afraid. The set of tested targets is defined=
 by YP members. If other targets regress, it=E2=80=99s on those who need th=
em to provide fixes.
>

I would make a distinction here to note that this email is not sent to
yocto mailing list but to openembedded-core mailing list.
Yocto project regularly tests a subset of what OE can be used to do and in =
OE
its all community driven, reporting bugs on the mailing list should be
fine as the project does not use any other tool for issue tracking.
you may not receive much help on less used combinations and thats just
like any other project.

> Alex
>
> On Mon 17. Jun 2024 at 13.47, Dmitry Baryshkov <dbaryshkov@gmail.com> wro=
te:
>>
>> On Mon, 17 Jun 2024 at 12:53, Alexander Kanavin <alex.kanavin@gmail.com>=
 wrote:
>> >
>> > No. It's not tested on the autobuilder.
>>
>> I see. Then consider it to be a bug report :-D
>>
>> >
>> > Alex
>> >
>> > On Mon, 17 Jun 2024 at 11:51, Dmitry Baryshkov via
>> > lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org>
>> > wrote:
>> > >
>> > > Hello,
>> > >
>> > > Is qemuppc64 considered to be supported? We have been running CI ove=
r
>> > > a set of machines, it seems that PPC64 kernel build is broken for
>> > > quite some time:
>> > >
>> > > https://storage.tuxsuite.com/public/linaro/dmitry.baryshkov/oebuilds=
/2hzrcO3QvnkeNPVouoptwe4sFZf/build.log
>> > >
>> > > | /tmp/ccJSLBgE.s: Assembler messages:
>> > > | /tmp/ccJSLBgE.s:765: Error: operand out of domain (18 is not a mul=
tiple of 4)
>> > > | /tmp/ccJSLBgE.s:790: Error: operand out of domain (18 is not a mul=
tiple of 4)
>> > > | /tmp/ccJSLBgE.s:815: Error: operand out of domain (18 is not a mul=
tiple of 4)
>> > > | /tmp/ccJSLBgE.s:2435: Error: operand out of domain (19 is not a mu=
ltiple of 4)
>> > > | /tmp/ccJSLBgE.s:2461: Error: operand out of domain (19 is not a mu=
ltiple of 4)
>> > > | /tmp/ccJSLBgE.s:2486: Error: operand out of domain (19 is not a mu=
ltiple of 4)
>> > > | /tmp/ccJSLBgE.s:3590: Error: operand out of domain (18 is not a mu=
ltiple of 4)
>> > > | /tmp/ccJSLBgE.s:3616: Error: operand out of domain (18 is not a mu=
ltiple of 4)
>> > > | /tmp/ccJSLBgE.s:3641: Error: operand out of domain (18 is not a mu=
ltiple of 4)
>> > > | make[3]: *** [/oe/build/tmp/work-shared/qemuppc64/kernel-source/sc=
ripts/Makefile.build:243:
>> > > fs/readdir.o] Error 1
>> > > | make[2]: *** [/oe/build/tmp/work-shared/qemuppc64/kernel-source/sc=
ripts/Makefile.build:480:
>> > > fs] Error 2
>> > > | make[2]: *** Waiting for unfinished jobs....
>> > >
>> > >
>> > > --
>> > > With best wishes
>> > > Dmitry
>> > >
>> > >
>> > >
>>
>>
>>
>> --
>> With best wishes
>> Dmitry
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200809): https://lists.openembedded.org/g/openembedde=
d-core/message/200809
> Mute This Topic: https://lists.openembedded.org/mt/106717814/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

