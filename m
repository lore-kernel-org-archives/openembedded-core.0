Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA755CA0FF2
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 13:26:22 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.12417.1756905981379104345
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 06:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IqqFFXS2;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-70ddadde494so54037606d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 06:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756905980; x=1757510780; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBBgwyWU90XS9iT+kB3zgw8tgH/eCg+15quVtBOl0Vo=;
        b=IqqFFXS2FwJMViTqiw65PKXjW/Oo5Aqyx09qgPVphS1otgZ7hppv0Cs8k6AOttk23V
         Dd80K/ZMOV+mOjF34bkh+5uP4aD1DGwJcAI2Z9x8yH8WK1leH20fSd1yKzwpBTGJnA5f
         7o6LnvhAsxRoJHTmYQq28NSPs4sj9jMeyUBrlN8ZzU1vs2Mh2LydDAnETQjJDRWwcrWc
         pxzR6VhQGvL4Nv7jKxxrDvS2QFLllFOPtBylEzlxoRd55KgnEIyrofdYSilpf50NlY2O
         eu2yvsEtRuuaCOR7Xq/0SxdWhEXZxoGLZkG/Uu6/hCpmrnzxQb/+TCnjeRyLE4bG74VP
         csPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756905980; x=1757510780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBBgwyWU90XS9iT+kB3zgw8tgH/eCg+15quVtBOl0Vo=;
        b=iXMbHO3TxkdviK4zrru/H6robrMmnfA1d//lyNKKPQLJpjxhebhNXhXggsnUWkLnrf
         NcMYHwwl8tHIawuY79PZQ646x79/NbuS60htxp+KKhjk9LGlNGByvjbPI/pAwXCepGSB
         vxclVj43ltQ2fBfPmWI6/6KDpRo9KTNoStO0mtXaQAO51VvGoNcrbEiS7mBrq1QWN9nL
         A6d3BwLBzytzHOmZYOsUF94eiVb8qz+p7akVgB+eBboCEiceDdXhcLICHUGsIviBUZgJ
         Iaytxd/OQzrhVK5tSw5TlFAn3cdHXkdN+Zu1FNdLH1uEdwGeehQkbl5aQaKX3GuC9pXQ
         xPGA==
X-Gm-Message-State: AOJu0YxKdJYimoH6trB8TEJmWPhnBKRl9Tvhz9Of3pEYAPvY0Elgh5Z5
	/ge2vElnAuibv3bFjjYBnJ79zo9wIZ1Rfg8Mr5myAO7tlgGdJlyn70Dxo18YM8pKH78MXAj3jrq
	I46RVlSjy3z+tn+WbBUdRAo/e5uAO914=
X-Gm-Gg: ASbGncviKWMgOvCA94EMP/GlmHbtk8DQ+GA4k6WRIXm6VNHLS1phBf/wq6S2rb3NDhb
	on4bxmypmMF0c9LhWFc+2dBD+qI/HUXy5pZAbg97so1apKS5TYkLY/fOyioGYuNWGBx+XzjvQ0c
	cJMrcOKQEtJPe9GkpJksXv7eTdIgicsPjw4tR51foZvrBEUZoQ/ngd5fdXDwhKAChWTLUJzAWl0
	NxQhdSeq+pbiF7DxJS6hcEgATzv6S0IqOdOoLYqLBXZcIqv0/XjhxC66HF125rno3ATWvd/z8fj
	x6mjlFXYO8UY0g/4e3jkyIWnblRcGCWDEbAgmjFr
X-Google-Smtp-Source: AGHT+IEIuyT/sQnjlbe6y0GfnTKIFSAxlytGLFmRPp5P8XmYO9vQn+GVbqG6fzfczhrrua8kFARZgccWtGKZKXzR70w=
X-Received: by 2002:a05:6214:27c1:b0:70d:fa79:badd with SMTP id
 6a1803df08f44-70fac700e4dmr168610576d6.1.1756905980250; Wed, 03 Sep 2025
 06:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAPyN=MLstOTnbM0OMYaw12uHbes0NUz5Z9uRM4KOQQndg2_W3A@mail.gmail.com>
 <CANNYZj8U_YcP+O1WuCYb=MNzxPbJZ3NAGky+yH8T0Lu-vQqxcg@mail.gmail.com> <CAPyN=MJw+NuuROpO-GUO80MY7xzfR9qjgYcrdLZ8XJ3Vgj84Og@mail.gmail.com>
In-Reply-To: <CAPyN=MJw+NuuROpO-GUO80MY7xzfR9qjgYcrdLZ8XJ3Vgj84Og@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Sep 2025 15:26:09 +0200
X-Gm-Features: Ac12FXzi8QT2qndUDQXTDdpn3oXTA8zLKKE0wi8AOvKXfOvpK5-frvcYpkfF9y4
Message-ID: <CANNYZj_=5nyjpqM1OPXTFwErWS1SNuVus2=BouuzvxbcEmpThg@mail.gmail.com>
Subject: Re: [OE-core] Walnascar backport: python3-evdev_1.9.2.bb
To: Rene Muniz <rmmuniz@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 13:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222862

Hello Rene,

You have demonstrated that 1.9.1 is broken and 1.9.2 works, and
identified the needed fix, but that is not what I asked you to do.

To clarify, your options are:
- demonstrate that 1.9.2 contains only bugfixes and no new features,
and then prepare a version update patch for walnascar and send it.
- cherry-pick and add the needed fix to 1.9.1 recipe, prepare a patch
for walnascar with that change, and send it.

In both cases it is useful to include the demonstation shown below
into the commit message, so maintainers can clearly see the need for
the patch.

Other people are not going to provide a fix for your problem.

Alex

On Wed, 3 Sept 2025 at 15:21, Rene Muniz <rmmuniz@gmail.com> wrote:
>
> Dear Alexander, here is the detailed information regarding this issue:
>
> - Built walnascar, commit 343adc0de05d4d1ef84bee6b76b5dedbcb587fb1
> - Add meta-openembedded for python support, branch walnascar, commit dca4=
97d728792e3cb655c78455c2d649af312ce8
> - In local.conf included in image: python3 python3-pip python3-evdev
>
> Boot image in qemu and import evdev in python:
>
> root@qemux86-64:~# pip3 show evdev
> Name: evdev
> Version: 1.9.1
> Summary: Bindings to the Linux input handling subsystem
> Home-page: https://github.com/gvalkov/python-evdev
> Author:
> Author-email: Georgi Valkov <georgi.t.valkov@gmail.com>
> License: Copyright (c) 2012-2025 Georgi Valkov. All rights reserved.
>
> root@qemux86-64:~# python3
> Python 3.13.4 (main, Jun  3 2025, 15:34:24) [GCC 14.3.0] on linux
> Type "help", "copyright", "credits" or "license" for more information.
> >>> import evdev
> Traceback (most recent call last):
>   File "<python-input-0>", line 1, in <module>
>     import evdev
>   File "/usr/lib/python3.13/site-packages/evdev/__init__.py", line 8, in =
<module>
>     from . import (
>     ...<2 lines>...
>     )
>   File "/usr/lib/python3.13/site-packages/evdev/ecodes.py", line 78, in <=
module>
>     for k, v in g[prefix].items():
>                 ~^^^^^^^^
> KeyError: 'UI_FF'
>
> - Now use recipe python3-evdev_1.9.2.bb (commit 46866b0022690f7408d0c5d7d=
3a22ba03e3af1a7)
>
> root@qemux86-64:~# pip3 show evdev
> Name: evdev
> Version: 1.9.2
> Summary: Bindings to the Linux input handling subsystem
> Home-page: https://github.com/gvalkov/python-evdev
> Author:
> Author-email: Georgi Valkov <georgi.t.valkov@gmail.com>
> License: Copyright (c) 2012-2025 Georgi Valkov. All rights reserved.
>
> root@qemux86-64:~# python3
> Python 3.13.4 (main, Jun  3 2025, 15:34:24) [GCC 14.3.0] on linux
> Type "help", "copyright", "credits" or "license" for more information.
> >>> import evdev
> >>>
>
> And this works as expected.
>
> Additional data: this commit seems to be the fix for the problem in versi=
on 1.9.2:
>
> commit 0d5ffeeb70639920ab20de1e6ef4c5ece72b97bd
> Author: Yoann Congal <yoann.congal@smile.fr>
> Date:   Sat May 3 00:49:44 2025 +0200
>
>     python3-evdev: add missing uinput header
>
>     Without uinput.h header, the evdev module can't be imported because i=
t
>     lacks the UI_FF* constants.
>
>     Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Thank you,
> Rene
>
>
>
> On Mon, Sep 1, 2025 at 5:56=E2=80=AFAM Alexander Kanavin <alex.kanavin@gm=
ail.com> wrote:
>>
>> Only if 1.9.3 only contains bugfixes compared to 1.9.2 (which you need
>> to demonstrate). Otherwise you need to cherry-pick the needed fix and
>> add it to 1.9.2 recipe.
>>
>> Alex
>>
>> On Fri, 29 Aug 2025 at 20:49, Rene Muniz via lists.openembedded.org
>> <rmmuniz=3Dgmail.com@lists.openembedded.org> wrote:
>> >
>> > Dear, is it possible to backport the recipe python3-evdev_1.9.2.bb to =
Walnascar? The reason is that python3-evdev_1.9.1.bb seems broken, by just =
importing the lib we got an error:
>> >
>> > Python 3.13.4 (main, Jun  3 2025, 15:34:24) [GCC 14.3.0] on linux
>> > Type "help", "copyright", "credits" or "license" for more information.
>> > >>> import evdev
>> > Traceback (most recent call last):
>> >   File "<python-input-0>", line 1, in <module>
>> >     import evdev
>> >   File "/usr/lib/python3.13/site-packages/evdev/__init__.py", line 8, =
in <module>
>> >     from . import (
>> >     ...<2 lines>...
>> >     )
>> >   File "/usr/lib/python3.13/site-packages/evdev/ecodes.py", line 78, i=
n <module>
>> >     for k, v in g[prefix].items():
>> >                 ~^^^^^^^^
>> > KeyError: 'UI_FF'
>> >
>> > Tested python3-evdev_1.9.2.bb present in master 46866b0022690f7408d0c5=
d7d3a22ba03e3af1a7 and it works great.
>> >
>> > Thanks in advance, best regards,
>> > Rene
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#222620): https://lists.openembedded.org/g/openembe=
dded-core/message/222620
>> > Mute This Topic: https://lists.openembedded.org/mt/114966240/1686489
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alex.kanavin@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

