Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6C6C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 19:49:05 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.54435.1679514540936200620
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 12:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iPmGTVxi;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id s8so24604911lfr.8
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 12:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679514539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQsOEob8PvO0nXW3zVUC2VbER+8qDu7HwEjsTqMDeQI=;
        b=iPmGTVximRYAQ/kqvSCuZNiX10vASGylMIKBzPDfZOPZAH1rGgazmbk5yTDhobTJnb
         9veFpldRlBis6RKTJFqP74dFySwfdsFcraDfmYVBLHbfA3Abkg/dtxUCdxigmvZgMmBw
         Ude3+7OxBbT5LXBy+1zKVpmjsnd3kjowsE8A0JvhwlPZVBH16aciNsLFO8KMDOvQDm+T
         H7iJ0wGSwyw9Vh+BfcnIB20FGItMlqBBtIlaw76rPhWjgNTeXGc768iacH4lVOS1RZbS
         yaXzy0E91nDYE7DJZV7jWgjLynK9twUNBYPFI2dmdYGO35QPzvIcKHnGTz1OEnLOyaWX
         atOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679514539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQsOEob8PvO0nXW3zVUC2VbER+8qDu7HwEjsTqMDeQI=;
        b=hRpX2HQysrjY6TyY8bhcO3ujimXO9KsWv2u7dGetjqwRKYNdW1KIlDnv+bvKxV0EyA
         VsWmTXRXRcskZ5UpN/a2u8ketYxs96u6RRHor5g5t4nYzwtE7dwG/0LwvboWsh0e3Rqj
         ECxd66kzB0mQn7YrZJtQyX3tVzzmG5AkEDsBHEO0RoKXWoTxyydeNVXxPpNco51pNlVL
         lJPZNSxn5cn9Zq40E0he0L4V19DeD8sT18MJOY8A5I23rg0Q0qOoiZXT/9Br0ag09y2c
         CWgEVzYBcGUkEvfD2Z2WeyK+ZRM21O5rmss26LSq89jG5Ur9L3YPZLYSt0NRDRWlZcW5
         oN1Q==
X-Gm-Message-State: AO0yUKUH9U5k4SFzz4wHK10uPCQwRg8aep2AbJjeHFQ92rv2HBwoCKN3
	pVUX+M5AELTzFM9IUtWQ1St7VpSiyJ0j+a1HaRE=
X-Google-Smtp-Source: AKy350Zhj8FCRPjWn6EFxbaTASD23MRAcF2IXxRAUspk2zfViBSkFZcXuPLKys3c4Rfz+KQvF1LTp3iWaPp7Qz4pOkM=
X-Received: by 2002:a05:6512:1090:b0:4d8:86c2:75ea with SMTP id
 j16-20020a056512109000b004d886c275eamr1835669lfg.3.1679514538944; Wed, 22 Mar
 2023 12:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <1679451626-10625-1-git-send-email-wangmy@fujitsu.com>
 <CANNYZj-owD5bU9BSZmWPz2jDbddFBZXcuFvR5MzAR8MuzaP_QA@mail.gmail.com>
 <OSBPR01MB18453A677D39C2D3DC071B5ADC869@OSBPR01MB1845.jpnprd01.prod.outlook.com>
 <174EAEA041A061C5.19937@lists.openembedded.org>
In-Reply-To: <174EAEA041A061C5.19937@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Mar 2023 20:48:47 +0100
Message-ID: <CANNYZj_s6mubFLJGNhDxmCzcfHvw6GX6UhOq0Eh+WY9kDKAk1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V3] xcb-proto: Fix install conflict when enable multilib.
To: alex.kanavin@gmail.com
Cc: "wangmy@fujitsu.com" <wangmy@fujitsu.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 19:49:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178955

Ok, I checked what is going on. We patch automake to define pythondir
in terms of libdir (rather than hardcode 'lib' or query it from python
as automake upstream does):
https://git.yoctoproject.org/poky/tree/meta/recipes-devtools/automake/autom=
ake/0001-automake-Update-for-python.m4-to-respect-libdir.patch

This means that anywhere where pythondir is defined, libdir needs to
be defined as well, and the whole thing should not be installed into
libdir and not datadir.

And therefore any patches to make this happen are Upstream-Status:
Inappropriate, and you do not need to send them upstream :-)

So please resubmit here taking this explanation into the commit
message, and maybe notify upstream that they shouldn't worry about it.

Alex

On Wed, 22 Mar 2023 at 08:55, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> I would suggest you open a pull request anyway, it just needs a clear
> explanation why xcb-proto is in fact arch-specific (because it builds
> and installs python bindings).
>
> Alex
>
> On Wed, 22 Mar 2023 at 08:52, wangmy@fujitsu.com <wangmy@fujitsu.com> wro=
te:
> >
> > In xcb-proto's commit history, the previous commit changed libdir to da=
tarootdir.
> >
> > So maybe it's not appropriate for me to directly change it back.
> >
> > I'am discussing this issue with the community.
> > https://lists.freedesktop.org/archives/xcb/2023-March/011429.html
> >   --
> > Best Regards
> > ---------------------------------------------------
> > Wang Mingyu
> > Development Dept.I
> > Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road,=
 Nanjing, 210012, China
> > TEL: +86+25-86630566-8568
> > COINS: 79988548
> > FAX: +86+25-83317685
> > MAIL: wangmy@fujitsu.com
> > http://www.fujitsu.com/cn/fnst/
> >
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org
> > > <openembedded-core@lists.openembedded.org> On Behalf Of Alexander
> > > Kanavin
> > > Sent: Wednesday, March 22, 2023 2:18 PM
> > > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> > > Cc: openembedded-core@lists.openembedded.org
> > > Subject: Re: [OE-core] [PATCH V3] xcb-proto: Fix install conflict whe=
n enable
> > > multilib.
> > >
> > > On Wed, 22 Mar 2023 at 03:20, wangmy <wangmy@fujitsu.com> wrote:
> > > > +Subject: [PATCH] Fix install conflict when enable multilib.
> > > > +
> > > > +Upstream-Status: Pending
> > >
> > > Please send this upstream first:
> > > https://gitlab.freedesktop.org/xorg/proto/xcbproto/-/merge_requests
> > >
> > > There should also be a better commit message, something like "install=
 .pc file to
> > > $libdir, as it refers to it.
> > >
> > > This is needed in particular for systems with multiple sets of librar=
ies (i.e. 32/64
> > > bit).
> > > "
> > >
> > > Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178919): https://lists.openembedded.org/g/openembedde=
d-core/message/178919
> Mute This Topic: https://lists.openembedded.org/mt/97770319/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

